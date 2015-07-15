package org.apache.cordova.plugins;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class Echo extends CordovaPlugin {

    /**
     * Executes the request and returns PluginResult.
     *
     * @param action        The action to execute.
     * @param args          JSONArry of arguments for the plugin.
     * @param callbackId    The callback id used when calling back into JavaScript.
     * @return              A PluginResult object with a status and message.
     */
    /*public PluginResult execute(String action, JSONArray args, String callbackId) {
        try {
            if (action.equals("echo")) {
                String echo = args.getString(0); 
                if (echo != null && echo.length() > 0) { 
                    return new PluginResult(PluginResult.Status.OK, echo);
                } else {
                    return new PluginResult(PluginResult.Status.ERROR);
                }
            } else {
                return new PluginResult(PluginResult.Status.INVALID_ACTION);
            }
        } catch (JSONException e) {
            return new PluginResult(PluginResult.Status.JSON_EXCEPTION);
        }
    }*/
    
     @Override
        public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
            if (action.equals("echo")) {
                String message = args.getString(0);
                this.echo(message, callbackContext);
                return true;
            }
            if (action.equals("array_object_count")) {
                int l = args.length();
                JSONObject co = new JSONObject();
                co.put("count", l);
                JSONArray r = new JSONArray();
                r.put(co);
                callbackContext.success(r);
                return true;
            }
            if (action.equals("repeat_it")) {
                Object o = args.get(0);
                JSONObject c1 = args.getJSONObject(1);
                int count = c1.getInt("count");
                this.repeat_it(o, count, callbackContext);
                return true;
            }
            if (action.equals("build_test")) {
                JSONObject c1 = args.getJSONObject(0);
                int count = c1.getInt("count");
                this.build_test(count, callbackContext);
                return true;
            }
            return false;
        }

        private void echo(String message, CallbackContext callbackContext) {
            if (message != null && message.length() > 0) {
                callbackContext.success(message);
            } else {
                callbackContext.error("Expected one non-empty string argument.");
            }
        }

        private void repeat_it(Object o, int count, CallbackContext callbackContext) {
            if (o != null && count > 0) {
                JSONArray r = new JSONArray();
                for (int i=0; i<count; ++i) r.put(o);
                callbackContext.success(r);
            } else {
                callbackContext.error("Expected ...");
            }
        }

        private void build_test(int count, CallbackContext callbackContext) {
            JSONArray r = new JSONArray();
            for (int i=0; i<count; ++i) {
                try {
                    JSONObject o1 = new JSONObject();
                    o1.put("p1", "v1");
                    o1.put("p2", 2);
                    o1.put("p3", i);
                    r.put(o1);
                } catch(Exception e) { }
            }
            callbackContext.success(r);
        }

}
