#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>
#import "VoiceConverter.h"

@interface CDwavToAmr : CDVPlugin

// @property(nonatomic, copy) NSString *callback;
// @property (nonatomic , copy)     NSString                *originWav;         //原wav文件名
// @property (nonatomic , copy)     NSString                *convertAmr;        //转换后的amr文件名
// @property (nonatomic , copy)     NSString                *convertWav;        //amr转wav的文件名

- (void)amrWavAudioConvent:(CDVInvokedUrlCommand *)command;


@end
