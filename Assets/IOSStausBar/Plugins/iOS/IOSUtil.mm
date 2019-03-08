#import <Foundation/Foundation.h>
#include "Unity/ObjCRuntime.h"
#include "UnityAppController.h"

#define UIViewController_preferStatusBarHidden_Enc "B16@0:8"

extern "C"
{
    // ref. FullScreenVideoPlayer.mm
    static bool _isStatusBarHidden = false;
    static bool preferStatusBarHidden_Impl(id self_, SEL _cmd){
        return _isStatusBarHidden;
    }
    
    static bool _isStatusBarInited = false;
    void _setStatusBarEnabled(bool isEnabled)
    {
        NSLog(@"_setStatusBarEnabled %d", isEnabled);
        UIViewController *vc = GetAppController().rootViewController;
        if (!_isStatusBarInited) {
            _isStatusBarHidden = vc.prefersStatusBarHidden;
            class_replaceMethod([vc class], @selector(prefersStatusBarHidden), (IMP)&preferStatusBarHidden_Impl,
                                UIViewController_preferStatusBarHidden_Enc);
            _isStatusBarInited = true;
        }
        _isStatusBarHidden = !isEnabled;
        [vc setNeedsStatusBarAppearanceUpdate];
    }
}
