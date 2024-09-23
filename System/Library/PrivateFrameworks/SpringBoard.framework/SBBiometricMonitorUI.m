@implementation SBBiometricMonitorUI

- (SBBiometricMonitorUI)init
{
  SBBiometricMonitorUI *v2;
  SBBiometricMonitorUI *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBiometricMonitorUI;
  v2 = -[SBBiometricMonitorUI init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBBiometricMonitorUI setDataSource:](v2, "setDataSource:", 0);
  return v3;
}

- (void)setDataSource:(id)a3
{
  SBBiometricMonitorDataSource *v5;
  SBBiometricMonitorDataSource **p_dataSource;
  SBBiometricMonitorDataSource *dataSource;
  SBBiometricMonitorDataSource *v8;

  v5 = (SBBiometricMonitorDataSource *)a3;
  dataSource = self->_dataSource;
  p_dataSource = &self->_dataSource;
  if (dataSource != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_dataSource, a3);
    v5 = v8;
  }

}

- (void)enable
{
  SBBiometricMonitorViewController *v3;
  SBBiometricMonitorViewController *debugViewController;
  SBSecureWindow *v5;
  void *v6;
  UIWindow *v7;
  UIWindow *debugWindow;
  void *v9;
  UIWindow *v10;
  void *v11;

  if (!self->_enabled)
  {
    -[SBBiometricMonitorDataSource addObserver:](self->_dataSource, "addObserver:", self);
    v3 = objc_alloc_init(SBBiometricMonitorViewController);
    debugViewController = self->_debugViewController;
    self->_debugViewController = v3;

    -[SBBiometricMonitorUI _updateMatchState](self, "_updateMatchState");
    -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
    v5 = [SBSecureWindow alloc];
    -[SBBiometricMonitorUI windowScene](self, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBWindow initWithWindowScene:role:debugName:](v5, "initWithWindowScene:role:debugName:", v6, CFSTR("SBTraitsParticipantRoleBiometricMonitorUI"), CFSTR("SBBiometricMonitorUI"));
    debugWindow = self->_debugWindow;
    self->_debugWindow = v7;

    -[UIWindow setLevel:](self->_debugWindow, "setLevel:", *MEMORY[0x1E0CEBBD0] + 250.0 + -5.0);
    -[UIWindow setAlpha:](self->_debugWindow, "setAlpha:", 0.8);
    -[UIWindow setRootViewController:](self->_debugWindow, "setRootViewController:", self->_debugViewController);
    -[UIWindow setHidden:](self->_debugWindow, "setHidden:", 0);
    -[UIWindow layer](self->_debugWindow, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsHitTesting:", 0);

    -[UIWindow setUserInteractionEnabled:](self->_debugWindow, "setUserInteractionEnabled:", 0);
    v10 = self->_debugWindow;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow setBackgroundColor:](v10, "setBackgroundColor:", v11);

    self->_enabled = 1;
  }
}

- (void)disable
{
  SBBiometricMonitorViewController *debugViewController;
  UIWindow *debugWindow;

  if (self->_enabled)
  {
    -[SBBiometricMonitorDataSource removeObserver:](self->_dataSource, "removeObserver:", self);
    debugViewController = self->_debugViewController;
    self->_debugViewController = 0;

    -[UIWindow setRootViewController:](self->_debugWindow, "setRootViewController:", 0);
    debugWindow = self->_debugWindow;
    self->_debugWindow = 0;

    self->_enabled = 0;
  }
}

- (void)_updateMatchState
{
  id v3;

  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMatchState:", -[SBBiometricMonitorDataSource matchRunning](self->_dataSource, "matchRunning"));

}

- (void)_doDeferredMatchStateUpdate
{
  -[SBBiometricMonitorUI _updateMatchState](self, "_updateMatchState");
  self->_deferredMatchUpdatePending = 0;
}

- (void)_updatePresenceDetectState
{
  id v3;

  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresenceDetectState:", -[SBBiometricMonitorDataSource presenceDetectRunning](self->_dataSource, "presenceDetectRunning"));

}

- (void)_doDeferredPresenceDetectUpdate
{
  -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
  self->_deferredPresenceDetectUpdatePending = 0;
}

- (void)_deferredUpdateMatchState
{
  -[SBBiometricMonitorUI _cancelDeferredUpdateMatchState](self, "_cancelDeferredUpdateMatchState");
  self->_deferredMatchUpdatePending = 1;
  -[SBBiometricMonitorUI performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__doDeferredMatchStateUpdate, 0, 1.0);
}

- (BOOL)_isDeferredMatchStateUpdatePending
{
  return self->_deferredMatchUpdatePending;
}

- (void)_cancelDeferredUpdateMatchState
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__doDeferredMatchStateUpdate, 0);
  self->_deferredMatchUpdatePending = 0;
}

- (void)_deferredUpdatePresenceDetectState
{
  -[SBBiometricMonitorUI _cancelDeferredUpdateMatchState](self, "_cancelDeferredUpdateMatchState");
  self->_deferredPresenceDetectUpdatePending = 1;
  -[SBBiometricMonitorUI performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__doDeferredPresenceDetectUpdate, 0, 1.0);
}

- (BOOL)_isDeferredPresenceDetectStateUpdatePending
{
  return self->_deferredPresenceDetectUpdatePending;
}

- (void)_cancelDeferredUpdatePresenceDetectState
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__doDeferredPresenceDetectUpdate, 0);
  self->_deferredPresenceDetectUpdatePending = 0;
}

- (void)biometricMonitorDataSourceMatchingStarted:(id)a3
{
  void *v4;

  -[SBBiometricMonitorUI _cancelDeferredUpdateMatchState](self, "_cancelDeferredUpdateMatchState", a3);
  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchState:", 1);

  -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
}

- (void)biometricMonitorDataSourceMatchingFailed:(id)a3
{
  void *v4;

  -[SBBiometricMonitorUI _cancelDeferredUpdateMatchState](self, "_cancelDeferredUpdateMatchState", a3);
  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchState:", 3);

  -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
  -[SBBiometricMonitorUI _deferredUpdateMatchState](self, "_deferredUpdateMatchState");
}

- (void)biometricMonitorDataSourceMatchingSucceeded:(id)a3
{
  void *v4;

  -[SBBiometricMonitorUI _cancelDeferredUpdateMatchState](self, "_cancelDeferredUpdateMatchState", a3);
  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchState:", 2);

  -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
  -[SBBiometricMonitorUI _deferredUpdateMatchState](self, "_deferredUpdateMatchState");
}

- (void)biometricMonitorDataSourceMatchingEnded:(id)a3
{
  if (!-[SBBiometricMonitorUI _isDeferredMatchStateUpdatePending](self, "_isDeferredMatchStateUpdatePending", a3))
    -[SBBiometricMonitorUI _updateMatchState](self, "_updateMatchState");
  if (!-[SBBiometricMonitorUI _isDeferredPresenceDetectStateUpdatePending](self, "_isDeferredPresenceDetectStateUpdatePending"))-[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
}

- (void)biometricMonitorDataSourcePresenceDetectionStarted:(id)a3
{
  -[SBBiometricMonitorUI _cancelDeferredUpdatePresenceDetectState](self, "_cancelDeferredUpdatePresenceDetectState", a3);
  -[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
}

- (void)biometricMonitorDataSourcePresenceDetectionFailed:(id)a3
{
  void *v4;

  -[SBBiometricMonitorUI _cancelDeferredUpdatePresenceDetectState](self, "_cancelDeferredUpdatePresenceDetectState", a3);
  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresenceDetectState:", 3);

  -[SBBiometricMonitorUI _deferredUpdatePresenceDetectState](self, "_deferredUpdatePresenceDetectState");
}

- (void)biometricMonitorDataSourcePresenceDetectionSucceeded:(id)a3
{
  void *v4;

  -[SBBiometricMonitorUI _cancelDeferredUpdatePresenceDetectState](self, "_cancelDeferredUpdatePresenceDetectState", a3);
  -[SBBiometricMonitorViewController monitorView](self->_debugViewController, "monitorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresenceDetectState:", 2);

  -[SBBiometricMonitorUI _deferredUpdatePresenceDetectState](self, "_deferredUpdatePresenceDetectState");
}

- (void)biometricMonitorDataSourcePresenceDetectionEnded:(id)a3
{
  if (!-[SBBiometricMonitorUI _isDeferredPresenceDetectStateUpdatePending](self, "_isDeferredPresenceDetectStateUpdatePending", a3))-[SBBiometricMonitorUI _updatePresenceDetectState](self, "_updatePresenceDetectState");
}

- (void)biometricMonitorDataSourcePoseUpdated:(id)a3
{
  SBBiometricMonitorViewController *debugViewController;
  id v4;
  id v5;

  debugViewController = self->_debugViewController;
  v4 = a3;
  -[SBBiometricMonitorViewController monitorView](debugViewController, "monitorView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(debugViewController) = objc_msgSend(v4, "poseIsMarginal");

  objc_msgSend(v5, "setPoseState:", debugViewController);
}

- (SBBiometricMonitorDataSource)dataSource
{
  return self->_dataSource;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_storeStrong((id *)&self->_debugWindow, 0);
}

@end
