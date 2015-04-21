BAMBOO.DependentPlanSelect = Brace.View.extend({
    mixins: [BAMBOO.EventBusMixin],
    initialize: function (options) {
        this.planSelect = new BAMBOO.PlanSingleSelect({
            el: this.$el,
            bootstrap: options.bootstrap || [],
            maxResults: 10
        });

        this.selectedPlans = new BAMBOO.SelectedList({
            el: options.selectedPlansEl,
            bootstrap: options.bootstrap || [],
            itemTemplate: bamboo.widget.autocomplete.planDependency.item
        });

        this.onEvent('plan:selected', this.handleSelection);
    },
    // using global event-bus event handling (first argument is an instance)
    handleSelection: function (instance, model) {
        if (model instanceof Backbone.Model) {
            this.selectedPlans.addItem(model);
            this.planSelect.singleSelect.setValue('');
        }
    }
});