@implementation SBSTestAutomationService

- (void)setTestRunnerRecoveryApplicationBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestRunnerRecoveryApplicationBundleIdentifier:", v4);

}

- (void)suspendAllDisplays
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendAllDisplays");

}

- (void)clearAllUserNotifications
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllUserNotifications");

}

- (void)setUserPresenceDetectedSinceWake
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserPresenceDetectedSinceWake");

}

- (void)setAlertsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlertsEnabled:", v3);

}

- (void)setHiddenFeaturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHiddenFeaturesEnabled:", v3);

}

- (void)setIdleTimerEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdleTimerEnabled:", v3);

}

- (void)setOrientationLockEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrientationLockEnabled:", v3);

}

- (void)setMallocStackLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMallocStackLoggingEnabled:", v3);

}

- (void)setReachabilityActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReachabilityActive:", v3);

}

- (void)setAmbientPresentationState:(int64_t)a3
{
  id v4;

  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAmbientPresentationState:", a3);

}

- (id)acquireAssertionForReachabilityEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acquireAssertionForReachabilityEnabled:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)resetToHomeScreenAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToHomeScreenAnimated:", v3);

}

- (void)setAccessoryType:(int64_t)a3 attached:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessoryType:attached:", a3, v4);

}

- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireHUDHiddenAssertionForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setApplicationBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setApplicationBundleIdentifier:blockedForScreenTime:", v6, v4);

}

- (void)countScenesForBundleIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "countScenesForBundleIdentifier:withCompletion:", v7, v6);

}

- (void)stashSwitcherModelToPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stashSwitcherModelToPath:", v4);

}

- (void)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadStashedSwitcherModelFromPath:", v4);

}

- (void)addWidgetsToEachPage
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addWidgetsToEachPage");

}

- (void)addWidgetWithIdentifier:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addWidgetWithIdentifier:toPage:withSizing:", v8, v6, v5);

}

- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addWidgetStackWithIdentifiers:toPage:withSizing:", v8, v6, v5);

}

- (void)enterLostMode
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enterLostMode");

}

- (void)exitLostMode
{
  id v2;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitLostMode");

}

- (BOOL)isChamoisWindowingUIEnabled
{
  void *v2;
  char v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChamoisWindowingUIEnabled");

  return v3;
}

- (void)setChamoisWindowingUIEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChamoisWindowingUIEnabled:", v3);

}

- (BOOL)chamoisPrefersDockHidden
{
  void *v2;
  char v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "chamoisPrefersDockHidden");

  return v3;
}

- (void)setChamoisPrefersDockHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChamoisPrefersDockHidden:", v3);

}

- (BOOL)chamoisPrefersStripHidden
{
  void *v2;
  char v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "chamoisPrefersStripHidden");

  return v3;
}

- (void)setChamoisPrefersStripHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChamoisPrefersStripHidden:", v3);

}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSystemApertureUnderAutomationTesting:", v3);

}

- (BOOL)deviceSupportsSystemAperture
{
  void *v2;
  char v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceSupportsSystemAperture");

  return v3;
}

- (NSMutableArray)systemApertureModelStateDump
{
  void *v2;
  void *v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureModelStateDump");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (NSArray)systemApertureStateDump
{
  void *v2;
  void *v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApertureStateDump");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)widgetControllerStateDump
{
  void *v2;
  void *v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetControllerStateDump");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes:(unint64_t)a3
{
  id v4;

  -[SBSAbstractSystemService client](self, "client");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes:", a3);

}

- (NSMutableDictionary)animationFrameRecording
{
  void *v2;
  void *v3;

  -[SBSAbstractSystemService client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationFrameRecordings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableDictionary *)v3;
}

- (BOOL)systemApertureUnderAutomationTesting
{
  return self->_systemApertureUnderAutomationTesting;
}

@end
