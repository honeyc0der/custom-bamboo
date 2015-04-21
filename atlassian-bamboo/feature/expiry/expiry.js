AJS.$.namespace('Bamboo.Feature.Expiry.CheckboxTree');
Bamboo.Feature.Expiry.CheckboxTree = Brace.View.extend({
    $block: null,
    $triggers: [],
    initialize: function (options) {
        this.params = options.params || {};

        if (this.params.blockSelector) {
            this.$block = AJS.$(this.params.blockSelector);
        }

        var $parent = AJS.$(this.params.parentSelector),
                $children = AJS.$(this.params.childrenSelector);

        this.$triggers = $children.add($parent);

        if ($parent.is(":checked")) {
            checkboxTree.cascadeToChildren($parent, $children, checkboxTree.DISABLE_CHILDREN_ON_PARENT_CHECKED);
        }

        $parent.on('change', _.bind(function () {
            checkboxTree.cascadeToChildren($parent, $children, checkboxTree.DISABLE_CHILDREN_ON_PARENT_CHECKED);
            this.changeBlockVisibility();
        }, this));

        $children.on("change", _.bind(this.changeBlockVisibility, this));

        this.changeBlockVisibility();
    },

    changeBlockVisibility: function () {
        if (!this.$block) {
            return;
        }

        var isBlockVisible = this.$triggers.is(':checked');
        this.$block.toggle(isBlockVisible);
    }
});