@implementation RPFeatureFlagUtility

+ (id)sharedInstance
{
  if (qword_100095D38 != -1)
    dispatch_once(&qword_100095D38, &stru_1000821B8);
  return (id)qword_100095D30;
}

- (RPFeatureFlagUtility)init
{
  RPFeatureFlagUtility *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPFeatureFlagUtility;
  v2 = -[RPFeatureFlagUtility init](&v5, "init");
  if (v2)
  {
    v2->_stereoAudioControlCenter = _os_feature_enabled_impl("ReplayKit", "stereo_audio_control_center");
    v2->_systemBannerEnabled = SBSIsSystemApertureAvailable();
    v3 = _os_feature_enabled_impl("Andromeda", "M31");
    if (v3)
      LOBYTE(v3) = MGGetBoolAnswer(CFSTR("j8/Omm6s1lsmTDFsXjsBfA"));
    v2->_alwaysOnDisplayEnabled = v3;
    v2->_screenRecordingCameraPip = _os_feature_enabled_impl("ReplayKit", "screen_recording_camera_pip");
    v2->_screenCaptureAlertEnabled = 1;
    v2->_independentWindowAlwaysHDEnabled = _os_feature_enabled_impl("Bilby", "AlwaysHDCapture");
    v2->_coreGraphicsCaptureAPINotificiationEnabled = _os_feature_enabled_impl("Bilby", "coreGraphicsCaptureAPINotificiationEnabled");
    v2->_coreGraphicsProxyingEnabled = 1;
    v2->_largePresenterOverlayFullHDPlus = _os_feature_enabled_impl("ScreenCaptureKit", "LargePresenterOverlayFullHDPlus");
    v2->_replayKitScreenRecordingHEVC = _os_feature_enabled_impl("ReplayKit", "recordingHEVC");
    v2->_audioDSPAutomaticMicModeEnabled = _os_feature_enabled_impl("AudioDSP", "AutomaticMicMode");
    v2->_screenCaptureKitRecordingHDR = _os_feature_enabled_impl("ScreenCaptureKit", "recordingHDR");
  }
  return v2;
}

- (BOOL)screenRecordingCameraPip
{
  return self->_screenRecordingCameraPip;
}

- (BOOL)stereoAudioControlCenter
{
  return self->_stereoAudioControlCenter;
}

- (BOOL)systemBannerEnabled
{
  return self->_systemBannerEnabled;
}

- (BOOL)screenCaptureAlertEnabled
{
  return 1;
}

- (BOOL)coreGraphicsCaptureAPINotificiationEnabled
{
  return self->_coreGraphicsCaptureAPINotificiationEnabled;
}

- (BOOL)largePresenterOverlayFullHDPlus
{
  return self->_largePresenterOverlayFullHDPlus;
}

- (BOOL)replayKitScreenRecordingHEVC
{
  return self->_replayKitScreenRecordingHEVC;
}

- (BOOL)screenCaptureKitRecordingHDR
{
  return self->_screenCaptureKitRecordingHDR;
}

- (BOOL)alwaysOnDisplayEnabled
{
  return self->_alwaysOnDisplayEnabled;
}

- (BOOL)independentWindowAlwaysHDEnabled
{
  return self->_independentWindowAlwaysHDEnabled;
}

- (BOOL)coreGraphicsProxyingEnabled
{
  return self->_coreGraphicsProxyingEnabled;
}

- (BOOL)audioDSPAutomaticMicModeEnabled
{
  return self->_audioDSPAutomaticMicModeEnabled;
}

@end
