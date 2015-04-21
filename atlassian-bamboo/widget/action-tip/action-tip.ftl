[#macro addActionTip triggerSelector actionKey content="" contentKey="" actionCallback="" width="" onTop=false]
    [#if user?has_content]
        [#assign shouldShowActionTip = ctx.shouldShowActionTip(actionKey, req)/]
        [#if shouldShowActionTip]
            <script type="text/javascript">
                (function (AJS, $) {
                    new Bamboo.Views.ActionTip({
                        el: $('${triggerSelector?js_string}')
                        ,params: {
                            onTop: ${onTop?string("true", "false")}
                            [#if width?length > 0],width: ${width?js_string}[/#if]
                        }
                        ,actionKey: '${actionKey?js_string}'
                        ,content: '[#if content?length > 0]${content?js_string}[#else][@ww.text name=contentKey /][/#if]'
                        [#if actionCallback?length > 0],callback: function() { ${actionCallback?js_string}(); }[/#if]
                    });
                }(AJS, AJS.$));
            </script>
        [/#if]
    [/#if]
[/#macro]