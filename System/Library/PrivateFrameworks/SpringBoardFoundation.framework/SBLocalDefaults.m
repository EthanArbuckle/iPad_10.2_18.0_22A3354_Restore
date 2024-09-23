@implementation SBLocalDefaults

- (SBMiscellaneousDefaults)miscellaneousDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_miscellaneousDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (miscellaneousDefaults___once != -1)
    dispatch_once(&miscellaneousDefaults___once, block);
  return self->_lazy_miscellaneousDefaults;
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBLocalDefaults_homeScreenDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (homeScreenDefaults___once != -1)
    dispatch_once(&homeScreenDefaults___once, block);
  return self->_lazy_homeScreenDefaults;
}

- (SBPIPDefaults)pipDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SBLocalDefaults_pipDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (pipDefaults___once != -1)
    dispatch_once(&pipDefaults___once, block);
  return self->_lazy_pipDefaults;
}

- (SBAppSwitcherDefaults)appSwitcherDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBLocalDefaults_appSwitcherDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (appSwitcherDefaults___once != -1)
    dispatch_once(&appSwitcherDefaults___once, block);
  return self->_lazy_appSwitcherDefaults;
}

- (SBApplicationDefaults)applicationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBLocalDefaults_applicationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (applicationDefaults___once != -1)
    dispatch_once(&applicationDefaults___once, block);
  return self->_lazy_applicationDefaults;
}

- (SBWorkspaceDefaults)workspaceDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_workspaceDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (workspaceDefaults___once != -1)
    dispatch_once(&workspaceDefaults___once, block);
  return self->_lazy_workspaceDefaults;
}

- (SBPowerDefaults)powerDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_powerDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (powerDefaults___once != -1)
    dispatch_once(&powerDefaults___once, block);
  return self->_lazy_powerDefaults;
}

- (SBRotationDefaults)rotationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_rotationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (rotationDefaults___once != -1)
    dispatch_once(&rotationDefaults___once, block);
  return self->_lazy_rotationDefaults;
}

- (SBAccessibilityDefaults)accessibilityDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_accessibilityDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (accessibilityDefaults___once != -1)
    dispatch_once(&accessibilityDefaults___once, block);
  return self->_lazy_accessibilityDefaults;
}

void __40__SBLocalDefaults_accessibilityDefaults__block_invoke(uint64_t a1)
{
  SBAccessibilityDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBAccessibilityDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (SBAlwaysOnDefaults)alwaysOnDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_alwaysOnDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (alwaysOnDefaults___once != -1)
    dispatch_once(&alwaysOnDefaults___once, block);
  return self->_lazy_alwaysOnDefaults;
}

void __35__SBLocalDefaults_alwaysOnDefaults__block_invoke(uint64_t a1)
{
  SBAlwaysOnDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBAlwaysOnDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (SBAmbientDefaults)ambientDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_ambientDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (ambientDefaults___once != -1)
    dispatch_once(&ambientDefaults___once, block);
  return self->_lazy_ambientDefaults;
}

void __34__SBLocalDefaults_ambientDefaults__block_invoke(uint64_t a1)
{
  SBAmbientDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBAmbientDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (SBAnalyticsDefaults)analyticsDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_analyticsDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (analyticsDefaults___once != -1)
    dispatch_once(&analyticsDefaults___once, block);
  return self->_lazy_analyticsDefaults;
}

void __36__SBLocalDefaults_analyticsDefaults__block_invoke(uint64_t a1)
{
  SBAnalyticsDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBAnalyticsDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __38__SBLocalDefaults_appSwitcherDefaults__block_invoke(uint64_t a1)
{
  SBAppSwitcherDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBAppSwitcherDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __38__SBLocalDefaults_applicationDefaults__block_invoke(uint64_t a1)
{
  SBApplicationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBApplicationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (SBBiometricAuthenticationDefaults)biometricAuthenticationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SBLocalDefaults_biometricAuthenticationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (biometricAuthenticationDefaults___once != -1)
    dispatch_once(&biometricAuthenticationDefaults___once, block);
  return self->_lazy_biometricAuthenticationDefaults;
}

void __50__SBLocalDefaults_biometricAuthenticationDefaults__block_invoke(uint64_t a1)
{
  SBBiometricAuthenticationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBBiometricAuthenticationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (SBBootDefaults)bootDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_bootDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (bootDefaults___once != -1)
    dispatch_once(&bootDefaults___once, block);
  return self->_lazy_bootDefaults;
}

void __31__SBLocalDefaults_bootDefaults__block_invoke(uint64_t a1)
{
  SBBootDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBBootDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (SBCameraHardwareButtonDefaults)cameraHardwareButtonDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SBLocalDefaults_cameraHardwareButtonDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (cameraHardwareButtonDefaults___once != -1)
    dispatch_once(&cameraHardwareButtonDefaults___once, block);
  return self->_lazy_cameraHardwareButtonDefaults;
}

void __47__SBLocalDefaults_cameraHardwareButtonDefaults__block_invoke(uint64_t a1)
{
  SBCameraHardwareButtonDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBCameraHardwareButtonDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (SBCaptureButtonDefaults)captureButtonDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_captureButtonDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (captureButtonDefaults___once != -1)
    dispatch_once(&captureButtonDefaults___once, block);
  return self->_lazy_captureButtonDefaults;
}

void __40__SBLocalDefaults_captureButtonDefaults__block_invoke(uint64_t a1)
{
  SBCaptureButtonDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBCaptureButtonDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (SBCornerGestureDefaults)cornerGestureDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SBLocalDefaults_cornerGestureDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (cornerGestureDefaults___once != -1)
    dispatch_once(&cornerGestureDefaults___once, block);
  return self->_lazy_cornerGestureDefaults;
}

void __40__SBLocalDefaults_cornerGestureDefaults__block_invoke(uint64_t a1)
{
  SBCornerGestureDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBCornerGestureDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

}

- (SBDemoDefaults)demoDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_demoDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (demoDefaults___once != -1)
    dispatch_once(&demoDefaults___once, block);
  return self->_lazy_demoDefaults;
}

void __31__SBLocalDefaults_demoDefaults__block_invoke(uint64_t a1)
{
  SBDemoDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBDemoDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

- (SBExternalDisplayDefaults)externalDisplayDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SBLocalDefaults_externalDisplayDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (externalDisplayDefaults___once != -1)
    dispatch_once(&externalDisplayDefaults___once, block);
  return self->_lazy_externalDisplayDefaults;
}

void __42__SBLocalDefaults_externalDisplayDefaults__block_invoke(uint64_t a1)
{
  SBExternalDisplayDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBExternalDisplayDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

}

- (SBFloatingDockDefaults)floatingDockDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_floatingDockDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (floatingDockDefaults___once != -1)
    dispatch_once(&floatingDockDefaults___once, block);
  return self->_lazy_floatingDockDefaults;
}

void __39__SBLocalDefaults_floatingDockDefaults__block_invoke(uint64_t a1)
{
  SBFloatingDockDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBFloatingDockDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

}

- (SBGestureDefaults)gestureDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_gestureDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (gestureDefaults___once != -1)
    dispatch_once(&gestureDefaults___once, block);
  return self->_lazy_gestureDefaults;
}

void __34__SBLocalDefaults_gestureDefaults__block_invoke(uint64_t a1)
{
  SBGestureDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBGestureDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

}

- (SBHardwareDefaults)hardwareDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_hardwareDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (hardwareDefaults___once != -1)
    dispatch_once(&hardwareDefaults___once, block);
  return self->_lazy_hardwareDefaults;
}

void __35__SBLocalDefaults_hardwareDefaults__block_invoke(uint64_t a1)
{
  SBHardwareDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBHardwareDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

}

void __37__SBLocalDefaults_homeScreenDefaults__block_invoke(uint64_t a1)
{
  SBHomeScreenDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBHomeScreenDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (SBIconDefaults)iconDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBLocalDefaults_iconDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (iconDefaults___once != -1)
    dispatch_once(&iconDefaults___once, block);
  return self->_lazy_iconDefaults;
}

void __31__SBLocalDefaults_iconDefaults__block_invoke(uint64_t a1)
{
  SBIconDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBIconDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_idleTimerDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (idleTimerDefaults___once != -1)
    dispatch_once(&idleTimerDefaults___once, block);
  return self->_lazy_idleTimerDefaults;
}

void __36__SBLocalDefaults_idleTimerDefaults__block_invoke(uint64_t a1)
{
  SBIdleTimerDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBIdleTimerDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 152);
  *(_QWORD *)(v3 + 152) = v2;

}

- (SBInCallPresentationDefaults)inCallPresentationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_inCallPresentationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (inCallPresentationDefaults___once != -1)
    dispatch_once(&inCallPresentationDefaults___once, block);
  return self->_lazy_inCallPresentationDefaults;
}

void __45__SBLocalDefaults_inCallPresentationDefaults__block_invoke(uint64_t a1)
{
  SBInCallPresentationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBInCallPresentationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 160);
  *(_QWORD *)(v3 + 160) = v2;

}

- (SBLockScreenDefaults)lockScreenDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBLocalDefaults_lockScreenDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (lockScreenDefaults___once != -1)
    dispatch_once(&lockScreenDefaults___once, block);
  return self->_lazy_lockScreenDefaults;
}

void __37__SBLocalDefaults_lockScreenDefaults__block_invoke(uint64_t a1)
{
  SBLockScreenDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBLockScreenDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

}

void __40__SBLocalDefaults_miscellaneousDefaults__block_invoke(uint64_t a1)
{
  SBMiscellaneousDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBMiscellaneousDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = v2;

}

- (SBMultiUserDefaults)multiUserDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_multiUserDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (multiUserDefaults___once != -1)
    dispatch_once(&multiUserDefaults___once, block);
  return self->_lazy_multiUserDefaults;
}

void __36__SBLocalDefaults_multiUserDefaults__block_invoke(uint64_t a1)
{
  SBMultiUserDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBMultiUserDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

}

- (SBNotificationCenterDefaults)notificationCenterDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_notificationCenterDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (notificationCenterDefaults___once != -1)
    dispatch_once(&notificationCenterDefaults___once, block);
  return self->_lazy_notificationCenterDefaults;
}

void __45__SBLocalDefaults_notificationCenterDefaults__block_invoke(uint64_t a1)
{
  SBNotificationCenterDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBNotificationCenterDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 192);
  *(_QWORD *)(v3 + 192) = v2;

}

- (SBNotificationDefaults)notificationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_notificationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (notificationDefaults___once != -1)
    dispatch_once(&notificationDefaults___once, block);
  return self->_lazy_notificationDefaults;
}

void __39__SBLocalDefaults_notificationDefaults__block_invoke(uint64_t a1)
{
  SBNotificationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBNotificationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 200);
  *(_QWORD *)(v3 + 200) = v2;

}

- (SBPencilDefaults)pencilDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SBLocalDefaults_pencilDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (pencilDefaults___once != -1)
    dispatch_once(&pencilDefaults___once, block);
  return self->_lazy_pencilDefaults;
}

void __33__SBLocalDefaults_pencilDefaults__block_invoke(uint64_t a1)
{
  SBPencilDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBPencilDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 208);
  *(_QWORD *)(v3 + 208) = v2;

}

void __30__SBLocalDefaults_pipDefaults__block_invoke(uint64_t a1)
{
  SBPIPDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBPIPDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 216);
  *(_QWORD *)(v3 + 216) = v2;

}

void __32__SBLocalDefaults_powerDefaults__block_invoke(uint64_t a1)
{
  SBPowerDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBPowerDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 224);
  *(_QWORD *)(v3 + 224) = v2;

}

- (SBRecentDisplayItemsDefaults)recentDisplayItemsDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_recentDisplayItemsDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (recentDisplayItemsDefaults___once != -1)
    dispatch_once(&recentDisplayItemsDefaults___once, block);
  return self->_lazy_recentDisplayItemsDefaults;
}

void __45__SBLocalDefaults_recentDisplayItemsDefaults__block_invoke(uint64_t a1)
{
  SBRecentDisplayItemsDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBRecentDisplayItemsDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 232);
  *(_QWORD *)(v3 + 232) = v2;

}

void __35__SBLocalDefaults_rotationDefaults__block_invoke(uint64_t a1)
{
  SBRotationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBRotationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 240);
  *(_QWORD *)(v3 + 240) = v2;

}

- (SBScreenLongevityDefaults)screenLongevityDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SBLocalDefaults_screenLongevityDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (screenLongevityDefaults___once != -1)
    dispatch_once(&screenLongevityDefaults___once, block);
  return self->_lazy_screenLongevityDefaults;
}

void __42__SBLocalDefaults_screenLongevityDefaults__block_invoke(uint64_t a1)
{
  SBScreenLongevityDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBScreenLongevityDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 248);
  *(_QWORD *)(v3 + 248) = v2;

}

- (SBSOSDefaults)sosDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SBLocalDefaults_sosDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (sosDefaults___once != -1)
    dispatch_once(&sosDefaults___once, block);
  return self->_lazy_sosDefaults;
}

void __30__SBLocalDefaults_sosDefaults__block_invoke(uint64_t a1)
{
  SBSOSDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSOSDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 256);
  *(_QWORD *)(v3 + 256) = v2;

}

- (SBSecurityDefaults)securityDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SBLocalDefaults_securityDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (securityDefaults___once != -1)
    dispatch_once(&securityDefaults___once, block);
  return self->_lazy_securityDefaults;
}

void __35__SBLocalDefaults_securityDefaults__block_invoke(uint64_t a1)
{
  SBSecurityDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSecurityDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 264);
  *(_QWORD *)(v3 + 264) = v2;

}

- (SBSetupDefaults)setupDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_setupDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (setupDefaults___once != -1)
    dispatch_once(&setupDefaults___once, block);
  return self->_lazy_setupDefaults;
}

void __32__SBLocalDefaults_setupDefaults__block_invoke(uint64_t a1)
{
  SBSetupDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSetupDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 272);
  *(_QWORD *)(v3 + 272) = v2;

}

- (SBSoftwareUpdateDefaults)softwareUpdateDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SBLocalDefaults_softwareUpdateDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (softwareUpdateDefaults___once != -1)
    dispatch_once(&softwareUpdateDefaults___once, block);
  return self->_lazy_softwareUpdateDefaults;
}

void __41__SBLocalDefaults_softwareUpdateDefaults__block_invoke(uint64_t a1)
{
  SBSoftwareUpdateDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSoftwareUpdateDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 280);
  *(_QWORD *)(v3 + 280) = v2;

}

- (SBSoundDefaults)soundDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_soundDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (soundDefaults___once != -1)
    dispatch_once(&soundDefaults___once, block);
  return self->_lazy_soundDefaults;
}

void __32__SBLocalDefaults_soundDefaults__block_invoke(uint64_t a1)
{
  SBSoundDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSoundDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 288);
  *(_QWORD *)(v3 + 288) = v2;

}

- (SBStateDumpDefaults)stateDumpDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_stateDumpDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (stateDumpDefaults___once != -1)
    dispatch_once(&stateDumpDefaults___once, block);
  return self->_lazy_stateDumpDefaults;
}

void __36__SBLocalDefaults_stateDumpDefaults__block_invoke(uint64_t a1)
{
  SBStateDumpDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBStateDumpDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 296);
  *(_QWORD *)(v3 + 296) = v2;

}

- (SBStatusBarDefaults)statusBarDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBLocalDefaults_statusBarDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (statusBarDefaults___once != -1)
    dispatch_once(&statusBarDefaults___once, block);
  return self->_lazy_statusBarDefaults;
}

void __36__SBLocalDefaults_statusBarDefaults__block_invoke(uint64_t a1)
{
  SBStatusBarDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBStatusBarDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 304);
  *(_QWORD *)(v3 + 304) = v2;

}

- (SBSystemActionDefaults)systemActionDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_systemActionDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (systemActionDefaults___once != -1)
    dispatch_once(&systemActionDefaults___once, block);
  return self->_lazy_systemActionDefaults;
}

void __39__SBLocalDefaults_systemActionDefaults__block_invoke(uint64_t a1)
{
  SBSystemActionDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSystemActionDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 312);
  *(_QWORD *)(v3 + 312) = v2;

}

- (SBSystemApertureDefaults)systemApertureDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SBLocalDefaults_systemApertureDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (systemApertureDefaults___once != -1)
    dispatch_once(&systemApertureDefaults___once, block);
  return self->_lazy_systemApertureDefaults;
}

void __41__SBLocalDefaults_systemApertureDefaults__block_invoke(uint64_t a1)
{
  SBSystemApertureDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBSystemApertureDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 320);
  *(_QWORD *)(v3 + 320) = v2;

}

- (SBTestingDefaults)testingDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_testingDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (testingDefaults___once != -1)
    dispatch_once(&testingDefaults___once, block);
  return self->_lazy_testingDefaults;
}

void __34__SBLocalDefaults_testingDefaults__block_invoke(uint64_t a1)
{
  SBTestingDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBTestingDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 328);
  *(_QWORD *)(v3 + 328) = v2;

}

- (SBThermalDefaults)thermalDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBLocalDefaults_thermalDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (thermalDefaults___once != -1)
    dispatch_once(&thermalDefaults___once, block);
  return self->_lazy_thermalDefaults;
}

void __34__SBLocalDefaults_thermalDefaults__block_invoke(uint64_t a1)
{
  SBThermalDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBThermalDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 336);
  *(_QWORD *)(v3 + 336) = v2;

}

- (SBVoiceControlDefaults)voiceControlDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SBLocalDefaults_voiceControlDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (voiceControlDefaults___once != -1)
    dispatch_once(&voiceControlDefaults___once, block);
  return self->_lazy_voiceControlDefaults;
}

void __39__SBLocalDefaults_voiceControlDefaults__block_invoke(uint64_t a1)
{
  SBVoiceControlDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBVoiceControlDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 352);
  *(_QWORD *)(v3 + 352) = v2;

}

- (SBUsageDefaults)usageDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SBLocalDefaults_usageDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (usageDefaults___once != -1)
    dispatch_once(&usageDefaults___once, block);
  return self->_lazy_usageDefaults;
}

void __32__SBLocalDefaults_usageDefaults__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = -[BSAbstractDefaultDomain _initWithDomain:]([SBUsageDefaults alloc], "_initWithDomain:", CFSTR("com.apple.springboard.usage"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 344);
  *(_QWORD *)(v3 + 344) = v2;

}

void __36__SBLocalDefaults_workspaceDefaults__block_invoke(uint64_t a1)
{
  SBWorkspaceDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBWorkspaceDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 360);
  *(_QWORD *)(v3 + 360) = v2;

}

- (SBCaptureApplicationDefaults)captureApplicationDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBLocalDefaults_captureApplicationDefaults__block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  if (captureApplicationDefaults___once != -1)
    dispatch_once(&captureApplicationDefaults___once, block);
  return self->_lazy_captureApplicationDefaults;
}

void __45__SBLocalDefaults_captureApplicationDefaults__block_invoke(uint64_t a1)
{
  SBCaptureApplicationDefaults *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(SBCaptureApplicationDefaults);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 368);
  *(_QWORD *)(v3 + 368) = v2;

}

- (void)migrateAndRemoveOldDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBShowVictoria"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBHasAttemptedToSynchronizeCloudCriticalData"));
  objc_msgSend(v2, "removePersistentDomainForName:", CFSTR("com.apple.springboard.bkgndids"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBCarrierDebuggingAlertVersion"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBStackshotUIFeedback"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBMostRecentFloatingApplicationState"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBShouldShowAppLibraryOnBoardingAlert"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBShouldShowAvocadoWidgetsOnBoardingAlert"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBShouldShowPageHidingOnBoardingAlert"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBHomeScreenPageHidingUIHasEverBeenShown"));
  objc_msgSend(v2, "objectForKey:", CFSTR("SBShowInternalWidgets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.chronod"));
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("showInternalWidgets"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("SBShowInternalWidgets"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "dictionaryRepresentation", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsString:", CFSTR("SBOrientationActuation")))
          objc_msgSend(v2, "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_captureApplicationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_workspaceDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_voiceControlDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_usageDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_thermalDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_testingDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_systemActionDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_statusBarDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_stateDumpDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_soundDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_softwareUpdateDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_setupDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_securityDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_sosDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_screenLongevityDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_rotationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_recentDisplayItemsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_powerDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_pipDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_pencilDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notificationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_notificationCenterDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_multiUserDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_miscellaneousDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_lockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_inCallPresentationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_iconDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_hardwareDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_gestureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_floatingDockDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_demoDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_cornerGestureDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_captureButtonDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_cameraHardwareButtonDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_bootDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_biometricAuthenticationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_applicationDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_analyticsDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_lazy_accessibilityDefaults, 0);
}

@end
