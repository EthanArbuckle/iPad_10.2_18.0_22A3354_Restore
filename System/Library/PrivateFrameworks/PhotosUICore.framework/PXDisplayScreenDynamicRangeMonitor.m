@implementation PXDisplayScreenDynamicRangeMonitor

- (PXDisplayScreenDynamicRangeMonitor)init
{
  void *v3;
  int v4;
  PXDisplayScreenDynamicRangeMonitor *v5;

  +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableHeadroomMonitoring");

  if (v4)
  {
    self = -[PXDisplayScreenDynamicRangeMonitor initWithAutomaticApplicationStateTracking:](self, "initWithAutomaticApplicationStateTracking:", 0);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PXDisplayScreenDynamicRangeMonitor)initWithAutomaticApplicationStateTracking:(BOOL)a3
{
  _BOOL4 v3;
  PXDisplayScreenDynamicRangeMonitor *v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDisplayScreenDynamicRangeMonitor;
  v4 = -[PXDisplayScreenDynamicRangeMonitor init](&v8, sel_init);
  if (v4)
    v5 = !v3;
  else
    v5 = 1;
  if (!v5)
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerChangeObserver:context:", v4, ApplicationStateContext_138706);

  }
  return v4;
}

- (void)startMonitoringWithScreenProvider:(id)a3
{
  void *v4;
  id screenProvider;
  id v6;

  v6 = a3;
  if (!-[PXDisplayScreenDynamicRangeMonitor isMonitoring](self, "isMonitoring"))
  {
    self->_isMonitoring = 1;
    v4 = (void *)objc_msgSend(v6, "copy");
    screenProvider = self->_screenProvider;
    self->_screenProvider = v4;

    -[PXDisplayScreenDynamicRangeMonitor _updateScreenSupportHDR](self, "_updateScreenSupportHDR");
    -[PXDisplayScreenDynamicRangeMonitor _resumeTimer](self, "_resumeTimer");
  }

}

- (void)stopMonitoring
{
  id screenProvider;

  -[PXDisplayScreenDynamicRangeMonitor _teardownTimer](self, "_teardownTimer");
  screenProvider = self->_screenProvider;
  self->_screenProvider = 0;

  self->_isMonitoring = 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  uint64_t v7;

  if ((void *)ApplicationStateContext_138706 == a5)
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState", a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "visibilityState");

    if (v7 == 3)
    {
      if (-[PXDisplayScreenDynamicRangeMonitor isMonitoring](self, "isMonitoring"))
        -[PXDisplayScreenDynamicRangeMonitor _teardownTimer](self, "_teardownTimer");
    }
    else if (v7 == 1)
    {
      if (-[PXDisplayScreenDynamicRangeMonitor isMonitoring](self, "isMonitoring"))
        -[PXDisplayScreenDynamicRangeMonitor _resumeTimer](self, "_resumeTimer");
    }
  }
}

- (void)setScreenSupportsHDR:(BOOL)a3
{
  if (self->_screenSupportsHDR != a3)
  {
    self->_screenSupportsHDR = a3;
    -[PXDisplayScreenDynamicRangeMonitor signalChange:](self, "signalChange:", 1);
  }
}

- (void)_resumeTimer
{
  NSTimer *v3;
  NSTimer *displayEDRMonitorTimer;
  id v5;

  if (!self->_displayEDRMonitorTimer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__monitorDisplayEDRHeadroom_, 0, 1, 0.1);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
    self->_displayEDRMonitorTimer = v3;

    -[NSTimer setTolerance:](self->_displayEDRMonitorTimer, "setTolerance:", 0.1);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTimer:forMode:", self->_displayEDRMonitorTimer, *MEMORY[0x1E0C99860]);

  }
}

- (void)_teardownTimer
{
  NSTimer *displayEDRMonitorTimer;

  -[NSTimer invalidate](self->_displayEDRMonitorTimer, "invalidate");
  displayEDRMonitorTimer = self->_displayEDRMonitorTimer;
  self->_displayEDRMonitorTimer = 0;

}

- (BOOL)_isHDRPotentiallySupportedForScreen:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "potentialEDRHeadroom");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D52108], "overrideDisplayHeadroom");
  if (v5 >= 1.0)
    v4 = v5;
  objc_msgSend(MEMORY[0x1E0D52108], "thresholdDisplayHeadroom");
  if (v4 <= v6)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLowPowerModeEnabled") ^ 1;

  }
  return v8;
}

- (BOOL)_isHDRCurrentlySupportedForScreen:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "currentEDRHeadroom");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D52108], "overrideDisplayHeadroom");
  if (v5 >= 1.0)
    v4 = v5;
  objc_msgSend(MEMORY[0x1E0D52108], "thresholdDisplayHeadroom");
  return v4 > v6;
}

- (void)_updateScreenSupportHDR
{
  void (**v3)(void);
  void *v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  -[PXDisplayScreenDynamicRangeMonitor screenProvider](self, "screenProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PXDisplayScreenDynamicRangeMonitor _currentlySupportsHDRForScreen:](self, "_currentlySupportsHDRForScreen:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PXDisplayScreenDynamicRangeMonitor__updateScreenSupportHDR__block_invoke;
  v6[3] = &unk_1E5142B28;
  v6[4] = self;
  v7 = v5;
  -[PXDisplayScreenDynamicRangeMonitor performChanges:](self, "performChanges:", v6);

}

- (BOOL)_currentlySupportsHDRForScreen:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[PXDisplayScreenDynamicRangeMonitor _isHDRPotentiallySupportedForScreen:](self, "_isHDRPotentiallySupportedForScreen:", v4)|| -[PXDisplayScreenDynamicRangeMonitor _isHDRCurrentlySupportedForScreen:](self, "_isHDRCurrentlySupportedForScreen:", v4);

  return v5;
}

- (BOOL)screenSupportsHDR
{
  return self->_screenSupportsHDR;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (id)screenProvider
{
  return self->_screenProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_screenProvider, 0);
  objc_storeStrong((id *)&self->_displayEDRMonitorTimer, 0);
}

uint64_t __61__PXDisplayScreenDynamicRangeMonitor__updateScreenSupportHDR__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setScreenSupportsHDR:", *(unsigned __int8 *)(a1 + 40));
}

@end
