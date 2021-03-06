package Jquery
import grails.converters.JSON
import Jquery.Tab
class NewController {
      static navigation = [
        [group: 'tabs', action: 'tabs', title: 'On going development on Tabs', order: 0],
        [action:'list', title: 'List Customers', order: 1],
        [action: 'create', title: 'Create new Customers', order: 2],
       
      ]
    
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
       // redirect(action: "list", params: params)
         redirect(controller: "new", action: "tabs")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newInstanceList: New.list(params), newInstanceTotal: New.count()]
    }
    def form = {
        [new:New.list(params)]
    }
    def create = {
        def newInstance = new New()
        newInstance.properties = params
        return [newInstance: newInstance]
       
    }

    def save = {
        def newInstance = new New(params)
        if (newInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
            redirect(action: "tabs", id: newInstance.id)
        }
        else {
            render(view: "create", model: [newInstance: newInstance])
        }
    }
 def tab_save = {
        def newInstance = new New(params)
        if (newInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
           redirect(action: "tabs", id: newInstance.id)
        }
        else {
            render(view: "create", model: [newInstance: newInstance])
        }
    }
    def show = {
        def newInstance = New.get(params.id)
        if (!newInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
        else {
            [newInstance: newInstance]
        }
    }

    def edit = {
        def newInstance = New.get(params.id)
        if (!newInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [newInstance: newInstance]
        }
    }

    def update = {
        def newInstance = New.get(params.id)
        if (newInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (newInstance.version > version) {
                    
                    newInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'new.label', default: 'New')] as Object[], "Another user has updated this New while you were editing")
                    render(view: "edit", model: [newInstance: newInstance])
                    return
                }
            }
            newInstance.properties = params
            if (!newInstance.hasErrors() && newInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
                redirect(action: "show", id: newInstance.id)
            }
            else {
                render(view: "edit", model: [newInstance: newInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def newInstance = New.get(params.id)
        if (newInstance) {
            try {
                newInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
    }
    def test = {
        
    }
       def tabs = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newInstanceList: New.list(params), newInstanceTotal: New.count()]
    }
     def jq_tab_list = {
      def sortIndex = params.sidx ?: 'name'
      def sortOrder  = params.sord ?: 'asc'

      def maxRows = Integer.valueOf(params.rows)      
      def currentPage = Integer.valueOf(params.page) ?: 1
      def rowOffset = currentPage == 1 ? 0 : (currentPage - 1) * maxRows

      def tabs = Tab.createCriteria().list(max:maxRows, offset:rowOffset) {

            // first name case insensitive where the field begins with the search term
            if (params.name)
                ilike('name',params.name + '%')

            // last name case insensitive where the field begins with the search term
            if (params.city)
                ilike('city',params.lastName + '%')

           
        
            // set the order and direction
            order(sortIndex, sortOrder).ignoreCase()
      }

      def totalRows = tabs.totalCount
      def numberOfPages = Math.ceil(totalRows / maxRows)

      def jsonCells = tabs.collect {
            [cell: [it.name,
                    it.city        
                ], id: it.id]
        }
        def jsonData= [rows: jsonCells,page:currentPage,records:totalRows,total:numberOfPages]
        render  jsonData as JSON
       
    }


    def jq_edit_tab = {
      def tab = null
      def message = ""
      def state = "FAIL"
      def id

      // determine our action
      switch (params.oper) {
        case 'add':
          // add instruction sent
          tab = new Tab(params)
          if (! tab.hasErrors() && tab.save()) {
            message = "City  ${tab.name} ${tab.city} Added"
            id = tab.id
            state = "OK"
          } else {
            message = "Could Not Save City"
          }

          break;
        case 'del':
          // check customer exists
         tab = Tab.get(params.id)
          if (tab) {
            // delete customer
            tab.delete()
            message = "Tab  ${tab.name} ${tab.city} Deleted"
            state = "OK"
          }
          break;
        default:
          // default edit action
          // first retrieve the customer by its ID
          tab = Tab.get(params.id)
          if (tab) {
            // set the properties according to passed in parameters
            tab.properties = params
            if (! tab.hasErrors() && tab.save()) {
              message = "City  ${tab.name} ${tab.city} Updated"
              id = tab.id
              state = "OK"
            } else {
              message = "Could Not Update Customer"
            }
          }
          break;
      }

      def response = [message:message,state:state,id:id]

      render response as JSON
    }
}
