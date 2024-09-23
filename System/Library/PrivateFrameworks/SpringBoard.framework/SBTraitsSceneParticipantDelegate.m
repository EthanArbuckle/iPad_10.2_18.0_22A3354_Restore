@implementation SBTraitsSceneParticipantDelegate

void __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v9 = v3;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    objc_msgSend(v9, "setPreferredZOrderLevel:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLevel");
    if (v7 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "level");
      objc_msgSend(v9, "setPreferredZOrderLevel:");

    }
    else
    {
      objc_msgSend(v9, "setPreferredZOrderLevel:");
    }

  }
}

- (double)_angleFromScreenReferenceSpaceForSettings:(id)a3 displayIdentity:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v6 = (void *)SBApp;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowSceneForDisplayIdentity:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "switcherController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isChamoisWindowingUIEnabled");

  -[SBTraitsSceneParticipantDelegate _application](self, "_application");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "classicAppPhoneAppRunningOnPad");

  objc_msgSend(v8, "orientation");
  objc_msgSend(v8, "validatedOrientationInputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "nonFlatDeviceOrientation");
  SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
  BSRadiansToDegrees();
  v15 = v14;

  return v15;
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void (**actuateOrientationAlongsideBlock)(id, void *, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);

  if (WeakRetained == v7)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 581, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

    if (v8)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 580, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant == _participant"));

  if (!v7)
    goto LABEL_12;
LABEL_3:
  if (v8)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 582, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

LABEL_4:
  -[SBTraitsSceneParticipantDelegate actuateZOrderLevelSettings](self, "actuateZOrderLevelSettings");
  objc_msgSend(v8, "userInterfaceStyleActuationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTraitsSceneParticipantDelegate actuateUserInterfaceStyleSettingsWithContext:](self, "actuateUserInterfaceStyleSettingsWithContext:", v10);

  if (self->_orientationActuationEnabled)
  {
    objc_msgSend(v8, "orientationActuationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSceneParticipantDelegate actuateOrientationSettingsWithContext:](self, "actuateOrientationSettingsWithContext:", v11);
LABEL_9:

    goto LABEL_10;
  }
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v12 = objc_loadWeakRetained((id *)&self->_scene);
  SBTraitsSceneParticipantDelegateOrientationChangeInspector(v12, v7, &v18, &v17, &v19);

  -[SBTraitsSceneOrientationRequestAssistant checkValidityAgainstUpdateReasons:](self->_orientationRequestActionAssistant, "checkValidityAgainstUpdateReasons:", v19);
  actuateOrientationAlongsideBlock = (void (**)(id, void *, uint64_t))self->_actuateOrientationAlongsideBlock;
  if (actuateOrientationAlongsideBlock && v19)
  {
    objc_msgSend(v8, "orientationActuationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    actuateOrientationAlongsideBlock[2](actuateOrientationAlongsideBlock, v11, v19);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)actuateUserInterfaceStyleSettingsWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  v6 = objc_loadWeakRetained((id *)&self->_scene);
  if (v6)
  {
    objc_msgSend(WeakRetained, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(WeakRetained, "currentUserInterfaceStyle");
      objc_msgSend(v6, "uiSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceStyle");

      if (v8 != v10)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __81__SBTraitsSceneParticipantDelegate_actuateUserInterfaceStyleSettingsWithContext___block_invoke;
        v11[3] = &unk_1E8EB5678;
        v13 = v8;
        v12 = v4;
        +[SBSceneSettingsUpdater safeUpdateScene:withBlock:](SBSceneSettingsUpdater, "safeUpdateScene:withBlock:", v6, v11);

      }
    }
  }

}

- (void)actuateZOrderLevelSettings
{
  id WeakRetained;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  char v9;
  void (**actuateZOrderAlongsideBlock)(double);
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  objc_msgSend(WeakRetained, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zOrderLevelSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)&self->_scene);
  if (v5)
  {
    if (v11)
    {
      objc_msgSend(v11, "zOrderLevel");
      v7 = v6;
      objc_msgSend(v5, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "level");
      v9 = BSFloatEqualToFloat();

      if ((v9 & 1) == 0)
      {
        +[SBSceneSettingsUpdater safeUpdateScene:withSceneLevel:](SBSceneSettingsUpdater, "safeUpdateScene:withSceneLevel:", v5, v7);
        actuateZOrderAlongsideBlock = (void (**)(double))self->_actuateZOrderAlongsideBlock;
        if (actuateZOrderAlongsideBlock)
          actuateZOrderAlongsideBlock[2](v7);
      }
    }
  }

}

- (BOOL)needsActuationForUpdateReasons:(int64_t)a3
{
  id WeakRetained;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  uint8x8_t v16;
  int v17;
  unint64_t v18;
  void *v20;
  _QWORD v21[2];
  void (*v22)(_QWORD *);
  void *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  char v31;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v7 = WeakRetained;
  v8 = 0;
  if (a3 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUISubclass");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 439, CFSTR("Settings must be an UI subclass"));

    }
    v11 = objc_loadWeakRetained((id *)&self->_participant);
    objc_msgSend(v7, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v22 = (void (*)(_QWORD *))__67__SBTraitsSceneParticipantDelegate_needsActuationForUpdateReasons___block_invoke;
    v23 = &unk_1E8EB56C8;
    v26 = &v27;
    v13 = v12;
    v24 = v13;
    v14 = v11;
    v25 = v14;
    v15 = v21;
    v31 = 0;
    v16 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v16.i16[0] = vaddlv_u8(v16);
    v17 = v16.i32[0];
    if (v16.i32[0])
    {
      v18 = 0;
      do
      {
        if (((1 << v18) & a3) != 0)
        {
          v22(v15);
          if (v31)
            break;
          --v17;
        }
        if (v18 > 0x3E)
          break;
        ++v18;
      }
      while (v17 > 0);
    }

    v8 = *((_BYTE *)v28 + 24) != 0;
    _Block_object_dispose(&v27, 8);

  }
  return v8;
}

void __67__SBTraitsSceneParticipantDelegate_needsActuationForUpdateReasons___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  switch(a2)
  {
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "interfaceOrientationMapResolver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "orientationSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "orientationMapResolver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "isEqual:", v11) ^ 1;

      break;
    case 4:
      v6 = objc_msgSend(*(id *)(a1 + 32), "deviceOrientation");
      v7 = objc_msgSend(*(id *)(a1 + 40), "currentDeviceOrientation");
      goto LABEL_7;
    case 2:
      v6 = objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation");
      v7 = objc_msgSend(*(id *)(a1 + 40), "currentOrientation");
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 != v7;
      break;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v4 = a2;
  objc_msgSend(v4, "setCanDetermineActiveOrientation:", v3);
  objc_msgSend(v4, "setSupportedOrientations:", objc_msgSend(*(id *)(a1 + 32), "_supportedOrientations"));
  objc_msgSend(v4, "setPreferredOrientation:", objc_msgSend(*(id *)(a1 + 32), "_preferredOrientation"));

}

- (unint64_t)_supportedOrientations
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (objc_msgSend(WeakRetained, "isActive"))
  {
    objc_msgSend(WeakRetained, "clientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");
    if (!v5)
      v5 = -[SBTraitsSceneParticipantDelegate _allLegalOrientations](self, "_allLegalOrientations");
    -[SBTraitsSceneParticipantDelegate _application](self, "_application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBTraitsSceneParticipantDelegate _sanitizedMask:forApplication:](self, "_sanitizedMask:forApplication:", v5, v6);

  }
  else
  {
    v7 = -[SBTraitsSceneParticipantDelegate _bestGuessSupportedInterfaceOrientations](self, "_bestGuessSupportedInterfaceOrientations");
  }

  return v7;
}

- (int64_t)_preferredOrientation
{
  id WeakRetained;
  void *v3;
  int64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (objc_msgSend(WeakRetained, "isActive"))
  {
    objc_msgSend(WeakRetained, "clientSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "preferredInterfaceOrientation");
    if (!v4)
    {
      objc_msgSend(WeakRetained, "settings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "interfaceOrientation");

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_application
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  SBSafeCast(v3, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)&self->_scene);
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "clientHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationWithBundleIdentifier:", v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (unint64_t)_bestGuessSupportedInterfaceOrientations
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v5 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 206, CFSTR("_bestGuessSupportedInterfaceOrientations should only be used if we still either lack a scene or the scene is not active yet."));

  }
  -[SBTraitsSceneParticipantDelegate _application](self, "_application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  if ((objc_msgSend(v6, "isMedusaCapable") & 1) != 0)
  {
    v8 = 30;
  }
  else
  {
    objc_msgSend(v7, "info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "supportedInterfaceOrientations");

  }
  v10 = -[SBTraitsSceneParticipantDelegate _sanitizedMask:forApplication:](self, "_sanitizedMask:forApplication:", v8, v7);
  if (!v10)
  {
LABEL_9:
    v10 = -[SBTraitsSceneParticipantDelegate initialSupportedOrientationsOverride](self, "initialSupportedOrientationsOverride");
    if (!v10)
      v10 = -[SBTraitsSceneParticipantDelegate _allLegalOrientations](self, "_allLegalOrientations");
  }

  return v10;
}

- (unint64_t)_sanitizedMask:(unint64_t)a3 forApplication:(id)a4
{
  id v6;
  unint64_t v7;

  v6 = a4;
  if (a3 == 4
    && !-[SBTraitsSceneParticipantDelegate _isAllowedToHavePortraitUpsideDown](self, "_isAllowedToHavePortraitUpsideDown"))
  {
    v7 = 2;
  }
  else
  {
    v7 = -[SBTraitsSceneParticipantDelegate _allLegalOrientations](self, "_allLegalOrientations") & a3;
  }

  return v7;
}

- (unint64_t)_allLegalOrientations
{
  if (-[SBTraitsSceneParticipantDelegate _isAllowedToHavePortraitUpsideDown](self, "_isAllowedToHavePortraitUpsideDown"))
  {
    return 30;
  }
  else
  {
    return 26;
  }
}

- (BOOL)_isAllowedToHavePortraitUpsideDown
{
  BOOL v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (__sb__runningInSpringBoard())
  {
    v2 = SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom"))
      v2 = 1;
    else
      v2 = SBFEffectiveHomeButtonType() != 2;

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v2;
}

- (unint64_t)initialSupportedOrientationsOverride
{
  return self->_initialSupportedOrientationsOverride;
}

- (TRAParticipant)participant
{
  return (TRAParticipant *)objc_loadWeakRetained((id *)&self->_participant);
}

- (SBSceneHandle)sceneHandle
{
  return (SBSceneHandle *)objc_loadWeakRetained((id *)&self->_sceneHandle);
}

- (void)setParticipant:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  TRAParticipant **p_participant;
  id WeakRetained;
  id obj;

  obj = a3;
  if (obj)
  {
    objc_msgSend(obj, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "role");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 167, CFSTR("%@ requires its participant{%@} to be active"), v9, v10);

    }
  }
  p_participant = &self->_participant;
  WeakRetained = objc_loadWeakRetained((id *)p_participant);

  if (WeakRetained != obj)
    objc_storeWeak((id *)p_participant, obj);

}

- (void)setOrientationActuationEnabled:(BOOL)a3
{
  self->_orientationActuationEnabled = a3;
}

- (void)setArbiter:(id)a3
{
  objc_storeWeak((id *)&self->_arbiter, a3);
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  id v16;
  UIApplicationSceneClientSettingsDiffInspector *sceneClientSettingsDiffInspector;
  void *v18;
  UIApplicationSceneClientSettingsDiffInspector *v19;
  UIApplicationSceneClientSettingsDiffInspector *v20;
  void *v21;
  SBTraitsSceneOrientationRequestAssistant *orientationRequestActionAssistant;
  SBTraitsSceneOrientationRequestAssistant *v23;
  SBTraitsSceneOrientationRequestAssistant *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == _scene"));

  }
  v16 = objc_loadWeakRetained((id *)&self->_participant);

  if (v16)
  {
    if (!v12)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 498, CFSTR("%@ participant is nil. Cannot propagate client settings changes"), v28);

    if (!v12)
      goto LABEL_8;
  }
  sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
  if (!sceneClientSettingsDiffInspector)
  {
    objc_initWeak(&location, self);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __110__SBTraitsSceneParticipantDelegate_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v29[3] = &unk_1E8EA2658;
    objc_copyWeak(&v30, &location);
    v18 = (void *)MEMORY[0x1D17E5550](v29);
    v19 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v20 = self->_sceneClientSettingsDiffInspector;
    self->_sceneClientSettingsDiffInspector = v19;

    -[UIApplicationSceneClientSettingsDiffInspector observeSupportedInterfaceOrientationsWithBlock:](self->_sceneClientSettingsDiffInspector, "observeSupportedInterfaceOrientationsWithBlock:", v18);
    -[UIApplicationSceneClientSettingsDiffInspector observePreferredInterfaceOrientationWithBlock:](self->_sceneClientSettingsDiffInspector, "observePreferredInterfaceOrientationWithBlock:", v18);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    sceneClientSettingsDiffInspector = self->_sceneClientSettingsDiffInspector;
  }
  objc_msgSend(v12, "evaluateWithInspector:context:", sceneClientSettingsDiffInspector, v14);
LABEL_8:
  objc_msgSend(v14, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
    if (!orientationRequestActionAssistant)
    {
      v23 = -[SBTraitsSceneOrientationRequestAssistant initWithTraitsSceneDelegate:errorDomain:]([SBTraitsSceneOrientationRequestAssistant alloc], "initWithTraitsSceneDelegate:errorDomain:", self, CFSTR("SBTraitsSceneParticipantDelegateErrorDomain"));
      v24 = self->_orientationRequestActionAssistant;
      self->_orientationRequestActionAssistant = v23;

      orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
    }
    -[SBTraitsSceneOrientationRequestAssistant setUpForTransitionContextIfNeeded:](orientationRequestActionAssistant, "setUpForTransitionContextIfNeeded:", v14);
  }

}

void __74__SBTraitsSceneParticipantDelegate__evaluateOrientationTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setReason:", v3);
  objc_msgSend(v4, "setOrientationActuationContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestingParticipantsUniqueIdentifiers:", v6);

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  SBTraitsSceneParticipantDelegate *v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == _scene"));

  }
  v7 = objc_loadWeakRetained((id *)&self->_participant);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 478, CFSTR("%@ participant is nil. Cannot propagate client settings changes"), v11);

  }
  if (objc_msgSend(v5, "contentState") == 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SBTraitsSceneParticipantDelegate_sceneContentStateDidChange___block_invoke;
    block[3] = &unk_1E8E9E820;
    v13 = v7;
    v14 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  void *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_sceneHandle);
    objc_msgSend(v5, "sceneIfExists");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    if (!WeakRetained)
      return 0;
  }
  objc_msgSend(WeakRetained, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);

  if (WeakRetained == v7)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 572, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant == _participant"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 573, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != nil"));

LABEL_3:
  v9 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updater != nil"));

    v9 = 0;
  }
  -[SBTraitsSceneParticipantDelegate updatePreferencesWithUpdater:](self, "updatePreferencesWithUpdater:", v9);

}

- (void)updatePreferencesWithUpdater:(id)a3
{
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updater != nil"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke;
  v11[3] = &unk_1E8EB5650;
  v11[4] = self;
  v12 = WeakRetained;
  v7 = WeakRetained;
  objc_msgSend(v9, "updateZOrderLevelPreferencesWithBlock:", v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __65__SBTraitsSceneParticipantDelegate_updatePreferencesWithUpdater___block_invoke_2;
  v10[3] = &unk_1E8EA7770;
  v10[4] = self;
  objc_msgSend(v9, "updateOrientationPreferencesWithBlock:", v10);

}

void __81__SBTraitsSceneParticipantDelegate_actuateUserInterfaceStyleSettingsWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "setUserInterfaceStyle:", v5);
  objc_msgSend(*(id *)(a1 + 32), "drawingFence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationFence:", v7);

  objc_msgSend(*(id *)(a1 + 32), "animationSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationSettings:", v8);

}

void __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "updateOrientationSceneSettingsForParticipant:", v8);
  objc_msgSend(v6, "setAnimationFence:", a1[5]);
  objc_msgSend(v6, "setAnimationSettings:", a1[6]);

  v7 = *(_QWORD *)(a1[4] + 136);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (int64_t)sceneCurrentOrientation
{
  id WeakRetained;
  void *v3;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return v5;
}

- (SBTraitsSceneParticipantDelegate)initWithSceneHandle:(id)a3
{
  id v4;
  void *v5;
  SBTraitsSceneParticipantDelegate *v6;

  v4 = a3;
  objc_msgSend(v4, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBTraitsSceneParticipantDelegate initWithScene:](self, "initWithScene:", v5);

  if (v6)
  {
    objc_storeWeak((id *)&v6->_sceneHandle, v4);
    objc_msgSend(v4, "addObserver:", v6);
  }

  return v6;
}

- (SBTraitsSceneParticipantDelegate)initWithScene:(id)a3
{
  id v4;
  SBTraitsSceneParticipantDelegate *v5;
  SBTraitsSceneParticipantDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsSceneParticipantDelegate;
  v5 = -[SBTraitsSceneParticipantDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_msgSend(v4, "addObserver:", v6);
    *(_WORD *)&v6->_orientationActuationEnabled = 257;
  }

  return v6;
}

- (void)updateOrientationSceneSettingsForParticipant:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend(v15, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 342, CFSTR("Settings must be an UI subclass"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  objc_msgSend(WeakRetained, "currentSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orientationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "displayIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validatedOrientationInputs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "currentDeviceOrientation");

    -[SBTraitsSceneParticipantDelegate _angleFromScreenReferenceSpaceForSettings:displayIdentity:](self, "_angleFromScreenReferenceSpaceForSettings:displayIdentity:", v7, v8);
    v12 = v11;
    objc_msgSend(v15, "setHostReferenceAngleMode:", -[SBTraitsSceneParticipantDelegate _hostReferenceAngleModeForDisplayIdentity:](self, "_hostReferenceAngleModeForDisplayIdentity:", v8));
    objc_msgSend(v15, "setAngleFromHostReferenceUprightDirection:", v12);
    objc_msgSend(v7, "orientationMapResolver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterfaceOrientationMapResolver:", v13);

    objc_msgSend(v15, "setInterfaceOrientationMode:", -[SBTraitsSceneParticipantDelegate _orientationMode](self, "_orientationMode"));
    objc_msgSend(v15, "setInterfaceOrientation:", objc_msgSend(v7, "orientation"));
    objc_msgSend(v15, "setDeviceOrientation:", v10);

  }
}

- (int64_t)_orientationMode
{
  int64_t result;
  unint64_t orientationMode;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *bundleOrientationProperties;
  NSDictionary *v16;
  NSDictionary *v17;
  char v18;
  void *v19;
  uint64_t v20;

  result = self->_orientationModeOverride;
  if (!result)
  {
    orientationMode = self->_orientationMode;
    if (!orientationMode)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        -[SBTraitsSceneParticipantDelegate _application](self, "_application");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = objc_msgSend(v7, "isMedusaCapable");
          v10 = 1;
          if (v9)
            v10 = 2;
          self->_orientationMode = v10;
        }
        else
        {
          self->_orientationMode = 1;
          WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
          objc_msgSend(WeakRetained, "clientHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "processHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "bundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            bundleOrientationProperties = self->_bundleOrientationProperties;
            if (!bundleOrientationProperties)
            {
              objc_msgSend(v14, "bundleInfoValuesForKeys:", &unk_1E91CEBA8);
              v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              v17 = self->_bundleOrientationProperties;
              self->_bundleOrientationProperties = v16;

              bundleOrientationProperties = self->_bundleOrientationProperties;
            }
            v18 = -[NSDictionary bs_BOOLForKey:](bundleOrientationProperties, "bs_BOOLForKey:", CFSTR("UIRequiresFullScreen"));
            -[NSDictionary bs_safeArrayForKey:](self->_bundleOrientationProperties, "bs_safeArrayForKey:", CFSTR("UISupportedInterfaceOrientations~ipad"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count");

            if ((v18 & 1) == 0 && v20 == 4)
              self->_orientationMode = 2;
          }

        }
        orientationMode = self->_orientationMode;
      }
      else
      {
        orientationMode = 1;
        self->_orientationMode = 1;
      }
    }
    if (orientationMode <= 1)
      return 1;
    else
      return orientationMode;
  }
  return result;
}

- (unint64_t)_hostReferenceAngleModeForDisplayIdentity:(id)a3
{
  if (objc_msgSend(a3, "isExternal"))
    return 1;
  else
    return 2;
}

uint64_t __63__SBTraitsSceneParticipantDelegate_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  _BYTE *v2;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdatePreferencesWithReason:animate:", CFSTR("scene became ready (foreground)"), 0);
  v2 = *(_BYTE **)(a1 + 40);
  if (v2[57])
  {
    objc_msgSend(v2, "actuateOrientationSettingsWithContext:", 0);
    v2 = *(_BYTE **)(a1 + 40);
  }
  return objc_msgSend(v2, "actuateUserInterfaceStyleSettingsWithContext:", 0);
}

void __110__SBTraitsSceneParticipantDelegate_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateOrientationTransitionContext:", a2);

}

- (void)_evaluateOrientationTransitionContext:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  SBTraitsSceneParticipantDelegate *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[SBTraitsSceneParticipantDelegate scene](self, "scene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_arbiter);
    v7 = objc_loadWeakRetained((id *)&self->_participant);
    objc_msgSend(v5, "animationFence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v29 = objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    SBSafeCast(v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "disableTouchCancellationOnRotation");
    else
      v12 = 0;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ scene settings update"), v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)v29;
    if (v29 || v8 || (_DWORD)v12)
    {
      v17 = WeakRetained;
      if (!WeakRetained)
      {
        SBLogTraitsArbiter();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "role");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = self;
          v36 = 2114;
          v37 = v28;
          v38 = 2114;
          v39 = v26;
          _os_log_error_impl(&dword_1D0540000, v18, OS_LOG_TYPE_ERROR, "%{public}@ arbiter is nil for scene %{public}@. Cannot propagate animated client settings changes for delegate of participant with role %{public}@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 541, CFSTR("%@ arbiter is nil. Cannot propagate animated client settings changes"), v21);

        v17 = 0;
        v15 = (void *)v29;
      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E8]), "initWithAnimationSettings:drawingFence:preventTouchCancellation:", v15, v8, v12);
      objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", v8);
      v23 = objc_alloc(MEMORY[0x1E0DC0898]);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __74__SBTraitsSceneParticipantDelegate__evaluateOrientationTransitionContext___block_invoke;
      v30[3] = &unk_1E8EB56F0;
      v16 = v27;
      v31 = v27;
      v32 = v22;
      v33 = v7;
      v24 = v22;
      v25 = (void *)objc_msgSend(v23, "initWithBuilder:", v30);
      objc_msgSend(v17, "setNeedsUpdateArbitrationWithContext:", v25);

      v15 = (void *)v29;
    }
    else
    {
      v16 = v27;
      objc_msgSend(v7, "setNeedsUpdatePreferencesWithReason:", v27);
      v17 = WeakRetained;
    }

  }
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);

  if (WeakRetained != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle == _sceneHandle"));

  }
  -[SBTraitsSceneParticipantDelegate setScene:](self, "setScene:", v7);
  if (v7)
    objc_msgSend(v10, "removeObserver:", self);

}

- (void)setScene:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[SBTraitsSceneParticipantDelegate _resetToInitialState](self, "_resetToInitialState");
    objc_storeWeak((id *)&self->_scene, obj);
    objc_msgSend(obj, "addObserver:", self);
  }

}

- (void)setActuateOrientationAlongsideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setPreferredSceneLevel:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSceneLevel, a3);
}

- (void)actuateOrientationSettingsWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  char v8;
  BKSAnimationFenceHandle *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  BKSAnimationFenceHandle *v14;
  BKSAnimationFenceHandle *fallbackFence_90210730;
  uint64_t v16;
  BKSAnimationFenceHandle *v17;
  id v18;
  BKSAnimationFenceHandle *v19;
  _QWORD v20[6];
  _QWORD v21[5];
  BKSAnimationFenceHandle *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  v6 = objc_loadWeakRetained((id *)&self->_scene);
  if (v6)
  {
    objc_msgSend(WeakRetained, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v26 = 0;
      v24 = 0;
      v25 = 0;
      SBTraitsSceneParticipantDelegateOrientationChangeInspector(v6, WeakRetained, &v26, &v25, &v24);
      -[SBTraitsSceneOrientationRequestAssistant checkValidityAgainstUpdateReasons:](self->_orientationRequestActionAssistant, "checkValidityAgainstUpdateReasons:", v24);
      v8 = v24;
      if ((v24 & 0xE) != 0)
      {
        objc_msgSend(v4, "drawingFence");
        v9 = (BKSAnimationFenceHandle *)objc_claimAutoreleasedReturnValue();
        if ((v8 & 1) == 0 && self->_orientationActuationAnimatable && objc_msgSend(v6, "contentState") == 2)
        {
          +[SBAnimationUtilities animationSettingsForRotationFromOrientation:toOrientation:withContext:](SBAnimationUtilities, "animationSettingsForRotationFromOrientation:toOrientation:withContext:", v25, v26, v4);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;
        v12 = objc_msgSend(v6, "isActive");
        if ((v8 & 2) != 0)
        {
          if (v12)
          {
            objc_msgSend(v4, "animationSettings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              if (!v9)
              {
                -[BKSAnimationFenceHandle invalidate](self->_fallbackFence_90210730, "invalidate");
                objc_msgSend((id)*MEMORY[0x1E0CEB258], "_systemAnimationFenceCreatingIfNecessary:", 1);
                v14 = (BKSAnimationFenceHandle *)objc_claimAutoreleasedReturnValue();
                fallbackFence_90210730 = self->_fallbackFence_90210730;
                self->_fallbackFence_90210730 = v14;

                v9 = self->_fallbackFence_90210730;
              }
            }
          }
        }
        v16 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke;
        v21[3] = &unk_1E8EB56A0;
        v21[4] = self;
        v17 = v9;
        v22 = v17;
        v18 = v11;
        v23 = v18;
        +[SBSceneSettingsUpdater safeUpdateScene:withBlock:](SBSceneSettingsUpdater, "safeUpdateScene:withBlock:", v6, v21);
        if ((v8 & 2) != 0 && self->_actuateOrientationAlongsideBlock)
        {
          objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
          v20[0] = v16;
          v20[1] = 3221225472;
          v20[2] = __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke_2;
          v20[3] = &unk_1E8E9DE88;
          v20[4] = self;
          v20[5] = v24;
          objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:completion:", v18, v20, 0);
        }
        -[BKSAnimationFenceHandle invalidate](self->_fallbackFence_90210730, "invalidate");
        v19 = self->_fallbackFence_90210730;
        self->_fallbackFence_90210730 = 0;

      }
    }
  }

}

uint64_t __74__SBTraitsSceneParticipantDelegate_actuateOrientationSettingsWithContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 16))();
}

- (void)setOrientationActuationAnimatable:(BOOL)a3
{
  self->_orientationActuationAnimatable = a3;
}

- (void)setInitialSupportedOrientationsOverride:(unint64_t)a3
{
  self->_initialSupportedOrientationsOverride = a3;
}

- (void)setActuateZOrderAlongsideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)invalidate
{
  FBScene **p_scene;
  id WeakRetained;
  id v5;

  self->_invalidated = 1;
  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  objc_storeWeak((id *)p_scene, 0);
  v5 = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(v5, "removeObserver:", self);

  objc_storeWeak((id *)&self->_sceneHandle, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[SBTraitsSceneParticipantDelegate invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBTraitsSceneParticipantDelegate;
  -[SBTraitsSceneParticipantDelegate dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actuateOrientationSettingsAlongsideBlock, 0);
  objc_storeStrong(&self->_actuateOrientationAlongsideBlock, 0);
  objc_storeStrong(&self->_actuateZOrderAlongsideBlock, 0);
  objc_storeStrong((id *)&self->_preferredSceneLevel, 0);
  objc_destroyWeak((id *)&self->_participant);
  objc_destroyWeak((id *)&self->_arbiter);
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_fallbackFence_90210730, 0);
  objc_storeStrong((id *)&self->_bundleOrientationProperties, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_orientationRequestActionAssistant, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsSceneParticipantDelegate;
  -[SBTraitsSceneParticipantDelegate description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  -[SBTraitsSceneParticipantDelegate participantAssociatedSceneIdentityTokens:](self, "participantAssociatedSceneIdentityTokens:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v7);

  return (NSString *)v5;
}

- (void)setSceneHandle:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  if ((SBEqualObjects(WeakRetained, obj) & 1) == 0)
  {
    if (WeakRetained)
      -[SBTraitsSceneParticipantDelegate _resetToInitialState](self, "_resetToInitialState");
    objc_msgSend(obj, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSceneParticipantDelegate setScene:](self, "setScene:", v5);

    objc_storeWeak((id *)&self->_sceneHandle, obj);
    v6 = objc_loadWeakRetained((id *)&self->_scene);

    if (!v6)
      objc_msgSend(obj, "addObserver:", self);
  }

}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  SBSceneHandle **p_sceneHandle;
  id v7;
  id WeakRetained;
  void *v9;

  p_sceneHandle = &self->_sceneHandle;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sceneHandle);

  if (WeakRetained != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle == _sceneHandle"));

  }
  -[SBTraitsSceneParticipantDelegate setScene:](self, "setScene:", 0);
}

- (void)_resetToInitialState
{
  SBTraitsSceneOrientationRequestAssistant *orientationRequestActionAssistant;
  id WeakRetained;
  id v5;

  self->_orientationMode = 0;
  -[SBTraitsSceneOrientationRequestAssistant invalidate](self->_orientationRequestActionAssistant, "invalidate");
  orientationRequestActionAssistant = self->_orientationRequestActionAssistant;
  self->_orientationRequestActionAssistant = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v5 = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v5, "removeObserver:", self);

  objc_storeWeak((id *)&self->_sceneHandle, 0);
  objc_storeWeak((id *)&self->_scene, 0);
}

- (void)participantWillInvalidate:(id)a3
{
  TRAParticipant **p_participant;
  id v6;
  id WeakRetained;
  void *v8;

  p_participant = &self->_participant;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_participant);

  if (WeakRetained != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsSceneParticipantDelegate.m"), 605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant == _participant"));

  }
  -[SBTraitsSceneParticipantDelegate invalidate](self, "invalidate");
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a4;
  v8 = a5;
  -[SBTraitsSceneParticipantDelegate participantAssociatedSceneIdentityTokens:](self, "participantAssociatedSceneIdentityTokens:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "bs_map:", &__block_literal_global_237);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2;
    v14[3] = &unk_1E8E9E820;
    v15 = v13;
    v16 = v11;
    v12 = v11;
    objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Associated Scenes"), v8, v14);

  }
}

uint64_t __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringRepresentation");
}

uint64_t __96__SBTraitsSceneParticipantDelegate_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(a1 + 40), CFSTR("Associated Scene Tokens"), 0);
}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (TRAArbiter)arbiter
{
  return (TRAArbiter *)objc_loadWeakRetained((id *)&self->_arbiter);
}

- (BOOL)canDetermineActiveOrientation
{
  return self->_canDetermineActiveOrientation;
}

- (void)setCanDetermineActiveOrientation:(BOOL)a3
{
  self->_canDetermineActiveOrientation = a3;
}

- (NSNumber)preferredSceneLevel
{
  return self->_preferredSceneLevel;
}

- (BOOL)isOrientationActuationAnimatable
{
  return self->_orientationActuationAnimatable;
}

- (int64_t)orientationModeOverride
{
  return self->_orientationModeOverride;
}

- (void)setOrientationModeOverride:(int64_t)a3
{
  self->_orientationModeOverride = a3;
}

- (id)actuateZOrderAlongsideBlock
{
  return self->_actuateZOrderAlongsideBlock;
}

- (id)actuateOrientationAlongsideBlock
{
  return self->_actuateOrientationAlongsideBlock;
}

- (id)actuateOrientationSettingsAlongsideBlock
{
  return self->_actuateOrientationSettingsAlongsideBlock;
}

- (void)setActuateOrientationSettingsAlongsideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

@end
