[#-- @ftlvariable name="action" type="com.atlassian.bamboo.configuration.AdministerAction" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.configuration.AdministerAction" --]
[#-- @ftlvariable name="errors" type="com.atlassian.bamboo.logger.SystemErrorList" --]
<html>
<head>
    <title>[@ww.text name='system.errors.title' /]</title>
    <meta name="decorator" content="adminpage">
</head>
<body>

[#assign errors = webwork.bean("com.atlassian.bamboo.logger.SystemErrorList")]
[#assign numErrors = errors.systemErrors.size()]


<h1>[@ww.text name='system.errors.heading' /]</h1>

[#if numErrors gt 0]
    <span class="floating-toolbar">
        <a class="aui-button" id="clearAllErrors" href="[@ww.url action='removeErrorFromLog!removeAll' returnUrl='${currentUrl}'/]">[@ww.text name='system.errors.clear'/]</a>
    </span>
[/#if]

<p>
    [@ww.text name='system.errors.description']
        [@ww.param value=numErrors /]
    [/@ww.text]
</p>

[#if numErrors gt 0]
    [#list errors.systemErrors?sort_by("lastOccurred")?reverse as error]
        [@cp.showSystemError error=error returnUrl=currentUrl webPanelLocation='system.errors'/]
    [/#list]
[/#if]

</body>

</html>
