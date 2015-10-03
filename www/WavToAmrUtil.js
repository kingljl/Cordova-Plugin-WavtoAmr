
var exec    = require('cordova/exec'),
cordova = require('cordova');

function checkVal( val ){
    if ( !val ) {
        return null;
    }else{
        return val;
    }
}
module.exports = {
    /**
    *   path 提供存放录音的地址，如果 Path/
    *   typeFlag  0 wavtoamr  1 amrtowav
    *   fileName file.wav
    *   sourceDate = {
    *       path : "/Users/liujinlong/Library/Developer/CoreSimulator/Devices/8D0EF6F1-17BD-4A25-BBCD-B47450FFD442/data/Containers/Data/Application/D8493BC3-7141-4F85-BCEC-DDB21563849D/Documents/",
    *       fileName : "20151001153129.wav",
    *       typeFlag : 1 
    *    }
    */
    amrWavAudioConvent : function (  sourceDate , successCallback, errorCallback ) {
        if ( "path" in sourceDate && "fileName" in sourceDate && "typeFlag" in sourceDate  ) {
            successCallback = checkVal( successCallback );
            errorCallback = checkVal( errorCallback );
            exec(successCallback, errorCallback, "WavToAmrUtil", "amrWavAudioConvent", [sourceDate]);
        }else{
            errorCallback && errorCallback("Missing parameters!");
        }
    }
};

