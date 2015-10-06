
#import "CDwavToAmr.h"


@implementation CDwavToAmr
// @synthesize originWav,convertAmr,convertWav;
/**
*
*
*
*/
- (void)amrWavAudioConvent:(CDVInvokedUrlCommand *)command{
	NSDictionary *args = [command.arguments objectAtIndex:0];
	CDVPluginResult *pluginResult;
    if ( args ){
    	@try {
    		NSString *path = [args objectForKey:@"path"];
    		NSString *fileName = [args objectForKey:@"fileName"];
    		NSInteger typeFlag = [args objectForKey:@"typeFlag"];
    		NSString *pathAndName = [path stringByAppendingString:[[fileName componentsSeparatedByString:@"."] objectAtIndex:0]];
    		NSMutableDictionary *Dic = [NSMutableDictionary dictionaryWithCapacity:2];
        	switch( typeFlag ){
	    		case 1:
	    			[VoiceConverter amrToWav:[pathAndName stringByAppendingString:@".amr"] wavSavePath:[pathAndName stringByAppendingString:@".wav"]];
	    			[Dic setObject:[pathAndName stringByAppendingString:@".wav"] forKey:@"wavName"];
	    			break;
	    		default:
	    			[VoiceConverter wavToAmr:[pathAndName stringByAppendingString:@".wav"] amrSavePath:[pathAndName stringByAppendingString:@".amr"]];
	    			[Dic setObject:[pathAndName stringByAppendingString:@".amr"] forKey:@"amrName"];
	    	}
    	
	        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:Dic];
	        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		} @catch (NSException *exception) {
		    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Program exception. Unable to convert, enter the exception phase"];
		}@finally {
		    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Program exception. Unable to convert, enter finally"];
		}
    	
    }else{
    	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Parameter is null or parameter error！"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}


@end