using System.Runtime.InteropServices;

namespace NativeUtil
{
    public static class IOSUtil
    {
#if UNITY_IOS && !UNITY_EDITOR
        [DllImport ("__Internal")]
	    static extern void _setStatusBarEnabled (bool isEnabled);
#endif

        public static void SetStatusBarEnabled(bool isEnabled)
        {
#if UNITY_IOS && !UNITY_EDITOR
            _setStatusBarEnabled(isEnabled);
#endif
        }
    }
}