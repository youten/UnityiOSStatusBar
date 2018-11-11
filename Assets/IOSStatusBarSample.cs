using NativeUtil;
using UnityEngine;

public class IOSStatusBarSample : MonoBehaviour
{
    private bool _isStatusBarEnabled;

    public void OnClickToggleStatusBar()
    {
        Debug.Log("OnClickToggleStatusBar now:" + _isStatusBarEnabled);
        _isStatusBarEnabled = !_isStatusBarEnabled;
        IOSUtil.SetStatusBarEnabled(_isStatusBarEnabled);
    }
}