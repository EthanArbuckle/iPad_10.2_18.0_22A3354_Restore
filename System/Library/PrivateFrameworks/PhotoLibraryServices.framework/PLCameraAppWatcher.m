@implementation PLCameraAppWatcher

- (PLCameraAppWatcher)init
{
  PLCameraAppWatcher *v2;
  PLCameraAppWatcher *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id foregroundMonitorIdentifier;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLCameraAppWatcher;
  v2 = -[PLCameraAppWatcher init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isCameraRunningLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLCameraBundleIdentifiers();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__PLCameraAppWatcher_init__block_invoke;
    v9[3] = &unk_1E366D648;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "startMonitoringBundleIdentifiers:block:", v5, v9);
    v6 = objc_claimAutoreleasedReturnValue();
    foregroundMonitorIdentifier = v3->_foregroundMonitorIdentifier;
    v3->_foregroundMonitorIdentifier = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMonitoring:", self->_foregroundMonitorIdentifier);

  v4.receiver = self;
  v4.super_class = (Class)PLCameraAppWatcher;
  -[PLCameraAppWatcher dealloc](&v4, sel_dealloc);
}

- (void)_cameraForegroundStateDidChangeTo:(BOOL)a3
{
  os_unfair_lock_s *p_isCameraRunningLock;

  p_isCameraRunningLock = &self->_isCameraRunningLock;
  os_unfair_lock_lock(&self->_isCameraRunningLock);
  self->_isCameraRunning = a3;
  os_unfair_lock_unlock(p_isCameraRunningLock);
}

- (BOOL)isCameraRunning
{
  PLCameraAppWatcher *v2;
  os_unfair_lock_s *p_isCameraRunningLock;

  v2 = self;
  p_isCameraRunningLock = &self->_isCameraRunningLock;
  os_unfair_lock_lock(&self->_isCameraRunningLock);
  LOBYTE(v2) = v2->_isCameraRunning;
  os_unfair_lock_unlock(p_isCameraRunningLock);
  return (char)v2;
}

- (id)foregroundMonitorIdentifier
{
  return self->_foregroundMonitorIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_foregroundMonitorIdentifier, 0);
}

void __26__PLCameraAppWatcher_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cameraForegroundStateDidChangeTo:", a3);

}

@end
