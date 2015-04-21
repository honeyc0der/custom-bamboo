AJS.$.namespace('Bamboo.Util.Mixins.JSON');

Bamboo.Util.Mixins.JSON = {

    parseJSON: function (json, defaults) {
        var data = defaults || {};

        try {
            data = AJS.$.parseJSON(json);
        } catch (e) {}

        return data;
    }

};