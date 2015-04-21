[#-- @ftlvariable name="action" type="com.atlassian.bamboo.ww2.actions.admin.QuarantineSettings" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.ww2.actions.admin.QuarantineSettings" --]

<html>
<head>
    <title>[@ww.text name='admin.quarantineSettings.title' /]</title>
    <meta name="decorator" content="adminpage">
</head>
<body>
<h1>[@ww.text name='admin.quarantineSettings.title' /]</h1>

<p>
    [@ww.text name='admin.quarantineSettings.description'/]
</p>

<p>
    [#if enableTestQuarantine]
        [@ww.text name='admin.quarantineSettings.quarantine.enabled'/]
    [#else]
        [@ww.text name='admin.quarantineSettings.quarantine.disabled'/]
    [/#if]
</p>

[#assign submitLabelKey='global.buttons.enable'/]
[#if enableTestQuarantine]
    [#assign submitLabelKey='global.buttons.disable'/]
[/#if]

[@ww.form action="saveQuarantineSettings" submitLabelKey=submitLabelKey]
    [@ww.hidden labelKey='admin.quarantine.enable' name='enableTestQuarantine' value=!enableTestQuarantine /]
[/@ww.form]
</body>
</html>