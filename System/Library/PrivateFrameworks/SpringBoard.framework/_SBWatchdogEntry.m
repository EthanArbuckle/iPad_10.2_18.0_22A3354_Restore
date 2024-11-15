@implementation _SBWatchdogEntry

- (SBWorkspaceEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (SBFCaptureApplicationLaunchMonitoring)captureAppLaunchMonitor
{
  return self->_captureAppLaunchMonitor;
}

- (void)setCaptureAppLaunchMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_captureAppLaunchMonitor, a3);
}

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)setSceneHandle:(id)a3
{
  objc_storeStrong((id *)&self->_sceneHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_captureAppLaunchMonitor, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
