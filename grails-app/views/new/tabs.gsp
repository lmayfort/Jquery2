<%@ page import="Jquery.New" %>
<%@ page import="Jquery.Tab" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
 <meta name="layout" content="main" />  
<META http-equiv="content-type" content="text/html; charset=utf-8">

<TITLE>LSC Tabs Development</TITLE>


<link type="text/css" href="${resource(dir: 'css', file: 'jquery-latest.js')}" />
<link type="text/css" href="${resource(dir: 'css', file: 'layout-default-latest.css')}" />
<link type="text/css" href="${resource(dir: 'css', file: 'ui.theme.css')}" />
<link type="text/css" href="${resource(dir: 'css', file: 'ui.tabs.css')}" />
<link type="text/css" href="${resource(dir: 'css', file: 'jquery-ui.css')}" />
<STYLE type="text/css" media="screen">
/* Using an 'optional-container' instead of 'body', so need body to have a 'height' */
html, body {
width: 100%;
height: 100%;
padding: 0;
margin: 0;
overflow: hidden !important;
}
#optional-container {
width: 96%;
height: 94%;
margin-top: 2%;
margin-left: 2%;
}
.ui-layout-center { overflow: hidden; }
</STYLE>

<g:javascript src="jquery-1.7.2.min.js"/>
<g:javascript src="jquery-ui-1.8.21.custom.js"/>
<g:javascript src="jquery.layout-latest.js"/>
<g:javascript src="jquery.ui.accordion.js"/>
<!--JSON grid -->
  <g:javascript library="grid.locale-en"/>
  <g:javascript library="jquery.jqGrid.min"/>

<!-- theme switcher -->
<g:javascript src="debug.js"/>
<g:javascript src="themeswitchertool.js"/>
<script type="text/javascript">
var myLayout;
$(document).ready(function(){
$("#tabs_div").tabs();
$("#datepicker" ).datepicker();
$(".header-footer").hover(
function(){ $(this).addClass('ui-state-hover'); }
, function(){ $(this).removeClass('ui-state-hover'); }
);
myLayout = $('#optional-container').layout();
addThemeSwitcher('.ui-layout-north',{ top: '13px', right: '20px' });
});
</script>
<g:set var="entityName" value="${message(code: 'new.label', default: 'New')}" />

  <g:set var="entityName" value="${message(code: 'new.label', default: 'People')}" />
  <g:set var="entityName2" value="${message(code: 'new.label', default: 'City')}" />
 <title><g:message code="default.show.label" args="[entityName]" /></title>
</HEAD>
<BODY>
<DIV id="optional-container">
<DIV class="ui-layout-north" style="text-align: center;">
<BUTTON onClick="removeUITheme()">Remove Theme</BUTTON> &nbsp; &nbsp;
<BUTTON onClick="myLayout.resizeAll(); myLayout.sizeContent('center');">Resize Content</BUTTON>
</DIV>
<DIV id="tabs_div" class="ui-layout-center">
<DIV class="header-footer ui-state-default ui-corner-all" style="padding: 3px 5px 5px; text-align: center; margin-bottom: 1ex;">
Large School Consortium Institution Profile
</DIV>
<UL style="-moz-border-radius-bottomleft: 0; -moz-border-radius-bottomright: 0;">
<LI><A href="#tab_1"><SPAN>Create New People</SPAN></A></LI>
<LI><A href="#tab_2"><SPAN>List All the People</SPAN></A></LI>
<LI><A href="#tab_3"><SPAN>Create New Cities</SPAN></A></LI>
<LI><A href="#tab_4"><SPAN>List All the Cities</SPAN></A></LI>
</UL>
<DIV class="ui-layout-content ui-widget-content ui-corner-bottom" style="border-top: 0; padding-bottom: 1em;">
<DIV id="tab_1">
 
  <h1>Please enter people.</h1>
   <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="new.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${newInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="new.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${newInstance?.lastName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="someDate"><g:message code="new.someDate.label" default="Some Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: newInstance, field: 'someDate', 'errors')}">
                                    <g:textField name="someDate" id="datepicker" value="${newInstance?.someDate}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
               

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="create" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
         </g:form>
          
</DIV>
<DIV id="tab_2">

  <h1>People List</h1>
 <div class="list">
    <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'new.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'new.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'new.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="someDate" title="${message(code: 'new.someDate.label', default: 'Some Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                     <g:each in="${newInstanceList}" status="i" var ="newInstance">
                       <tr>
                            <td><g:link action="list" id="${newInstance.id}">${fieldValue(bean: newInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: newInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: newInstance, field: "lastName")}</td>
                            
                            <td>${fieldValue(bean: newInstance, field: "someDate")}</td>
                     </tr> 
                       
                    </g:each>
                    </tbody>
                </table>
            </div>
</DIV>
<DIV id="tab_3">
<h1>Enter Cities</h1>
     <g:form controller ="tab" action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="tab.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${tabInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="tab.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tabInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${tabInstance?.city}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
               

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="create" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
         </g:form>
</DIV>
  <DIV id="tab_4">
    
 
      <div class="body">
            <h1>City List</h1>

            <div id='message' class="message" style="display:none;"></div>
            
            <!-- table tag will hold our grid -->
            <table id="tab_list" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
            <!-- pager will hold our paginator -->
            <div id="tab_list_pager" class="scroll" style="text-align:center;"></div>

            <div style="margin-top:5px">
              <input class="ui-corner-all" id="btnAdd" type="button" value="Add Record"/>
              <input class="ui-corner-all" id="btnEdit" type="button" value="Edit Selected Record"/>
              <input class="ui-corner-all" id="btnDelete" type="button" value="Delete Selected Record"/>
            </div>


            <script type="text/javascript">
            var lastSelectedId;
            
            /* when the page has finished loading.. execute the following */
            $(document).ready(function () {

                // set on click events for non toolbar buttons
                $("#btnAdd").click(function(){
                  $("#tab_list").jqGrid("editGridRow","new",
                     {addCaption:'Create New City',
                     afterSubmit:afterSubmitEvent,
                     savekey:[true,13]});
                });

                $("#btnEdit").click(function(){
                   var gr = $("#tab_list").jqGrid('getGridParam','selrow');
                   if( gr != null )
                     $("#tab_list").jqGrid('editGridRow',gr,
                     {closeAfterEdit:true,
                      afterSubmit:afterSubmitEvent
                     });
                   else
                     alert("Please Select Row");
                });

                $("#btnDelete").click(function(){
                  var gr = $("#tab_list").jqGrid('getGridParam','selrow');
                  if( gr != null )
                    $("#tab_list").jqGrid('delGridRow',gr,
                     {afterSubmit:afterSubmitEvent});
                  else
                    alert("Please Select Row to delete!");
                });
                

                $("#tab_list").jqGrid({
                  url:'jq_tab_list',
                  editurl:'jq_edit_tab',
                  datatype: "json",
                  colNames:['Name','City','id'],
                  colModel:[
                    {name:'name',
                     editable:true,
                     editrules:{required:true}
                    },
                    {name:'city',
                     editable:true,
                     editrules:{required:true}
                    },
                    {name:'id',hidden:true}
                  ],
                  rowNum:2,
                  rowList:[1,2,3,4],
                  pager:'#tab_list_pager',
                  viewrecords: true,
                  gridview: true

                }).navGrid('#tab_list_pager',
                    {add:true,edit:true,del:true,search:false,refresh:true},      // which buttons to show?
                    {closeAfterEdit:true,
                     afterSubmit:afterSubmitEvent
                    },                                   // edit options
                    {addCaption:'Create New City',
                     afterSubmit:afterSubmitEvent,
                     savekey:[true,13]},            // add options
                    {afterSubmit:afterSubmitEvent}  // delete options
                );


                $("#tab_list").jqGrid('filterToolbar',{autosearch:true});
            });

            function afterSubmitEvent(response, postdata) {
                var success = true;
                console.log ('here')
                var json = eval('(' + response.responseText + ')');
                var message = json.message;

                if(json.state == 'FAIL') {
                    success = false;
                } else {
                  $('#message').html(message);
                  $('#message').show().fadeOut(10000);  // 10 second fade
                }

                var new_id = json.id
                return [success,message,new_id];
            }

            </script>
      </div>
 
</DIV>
</DIV>
<DIV class="header-footer ui-state-default ui-corner-all" style="padding: 3px 5px 5px; text-align: center; margin-top: 1ex;">
Footer DIV under ui-layout-content DIV
</DIV>
</DIV>
<DIV class="ui-layout-west">  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  </DIV>
<DIV class="ui-layout-south"> Hello Linda </DIV>
 
</DIV>
</BODY>
</HTML>
