<#include "./../header.ftl">

<div id="service">
	
	<span style="color:green; font-weight:bold">
    <#if SuccessMessage??>
	${SuccessMessage}
	</#if>
    </span>
    <H1> Name: ${serviceName} (<a href="/modify/services/${serviceName}">Edit</a> | <a href="/reInit/services/${serviceName}">ReInit</a>) </H1>
    <br />

    <h2> Service Configuration File:</h2>

    <br />
<#if XMLFileName??>
${XMLFileName}
</#if>
    <textarea id="XMLFileContents">
    ${XMLFileContents}
    </textarea>
    <script>
        var editor = CodeMirror.fromTextArea(document.getElementById("XMLFileContents"), {
            mode: "application/xml",
            lineNumbers: true,
            lineWrapping: true,
            readOnly: true
        });
        var hlLine = editor.addLineClass(0, "background", "activeline");
        editor.on("cursorActivity", function() {
            var cur = editor.getLineHandle(editor.getCursor().line);
            if (cur != hlLine) {
                editor.removeLineClass(hlLine, "background", "activeline");
                hlLine = editor.addLineClass(cur, "background", "activeline");
            }
        });
    </script>

    <br />
    <br />

</div><!-- services -->

<#include "./../footer.ftl"> 
