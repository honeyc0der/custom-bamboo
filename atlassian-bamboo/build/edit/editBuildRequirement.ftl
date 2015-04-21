[#-- @ftlvariable name="action" type="com.atlassian.bamboo.ww2.actions.build.admin.config.ConfigureBuildRequirement" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.ww2.actions.build.admin.config.ConfigureBuildRequirement" --]
[#import "/lib/build.ftl" as bd]

[#import "editBuildConfigurationCommon.ftl" as ebcc/]
[@ebcc.editConfigurationPage plan=immutablePlan  selectedTab='requirements' titleKey='requirement.title']
    [@bd.configureBuildRequirement requirementSetDecorator=requirementSetDecorator plan=immutablePlan elasticBambooEnabled=elasticBambooEnabled/]
[/@ebcc.editConfigurationPage]