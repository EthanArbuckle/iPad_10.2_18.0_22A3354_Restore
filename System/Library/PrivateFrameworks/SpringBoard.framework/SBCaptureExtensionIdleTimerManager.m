@implementation SBCaptureExtensionIdleTimerManager

- (SBCaptureExtensionIdleTimerManager)init
{
  SBCaptureExtensionIdleTimerManager *v2;
  void *v3;
  uint64_t v4;
  SBCameraViewfinderMonitoring *cameraViewfinderMonitorToken;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCaptureExtensionIdleTimerManager;
  v2 = -[SBCaptureExtensionIdleTimerManager init](&v7, sel_init);
  if (v2)
  {
    +[SBCameraViewfinderMonitor sharedInstance](SBCameraViewfinderMonitor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
    cameraViewfinderMonitorToken = v2->_cameraViewfinderMonitorToken;
    v2->_cameraViewfinderMonitorToken = (SBCameraViewfinderMonitoring *)v4;

  }
  return v2;
}

- (void)invalidate
{
  SBCameraViewfinderMonitoring *cameraViewfinderMonitorToken;

  -[SBCameraViewfinderMonitoring cancel](self->_cameraViewfinderMonitorToken, "cancel");
  cameraViewfinderMonitorToken = self->_cameraViewfinderMonitorToken;
  self->_cameraViewfinderMonitorToken = 0;

}

- (void)cameraViewfinderMonitorSessionDidBeginMovieRecording:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idleTimerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIdleTimerDisabledAssertionReason:", CFSTR("Capture Extension Movie Recording"));

}

- (void)cameraViewfinderMonitorSessionDidEndMovieRecording:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idleTimerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeIdleTimerDisabledAssertionReason:", CFSTR("Capture Extension Movie Recording"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraViewfinderMonitorToken, 0);
}

@end
