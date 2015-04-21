AJS.$.namespace('Bamboo.Widget.Repository');

Bamboo.Widget.RepositorySelector = Brace.View.extend({

    mixins: [
        BAMBOO.EventBusMixin
    ],

    initialize: function() {
        this.$selectedRepository = AJS.$('#selectedRepository');
        this.$selectedRepository.on('change', _.bind(function() {
            this.triggerEvent('repository:selector:change',
                this.$el.find('input:radio[name="repositoryTypeOption"]:checked').val(),
                this.$selectedRepository.val()
            );

            if (this.$selectedRepository.val().length) {
                this.$el.find('.radio > .error').remove();
            }
        }, this));

        var callback = _.bind(function(input) {
            if (input.length) {
                this.triggerEvent('repository:selector:form', input.val());
            }
        }, this);

        AJS.$(document).on('change',
            'form input:radio[name="repositoryTypeOption"]', function (event) {
                callback(AJS.$(event.target));
            }
        );

        var $typeOption = this.$el.find(
            'input:radio[name="repositoryTypeOption"]:checked'
        );

        if ($typeOption.length) {
            callback($typeOption);
        }
    }

});
