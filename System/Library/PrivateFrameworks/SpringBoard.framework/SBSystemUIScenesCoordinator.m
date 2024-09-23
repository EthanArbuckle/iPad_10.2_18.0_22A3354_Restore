@implementation SBSystemUIScenesCoordinator

- (SBOverlayUISceneController)overlayUISceneController
{
  return self->_overlayUISceneController;
}

- (SBMomentsUISceneController)momentsUISceneController
{
  return self->_momentsUISceneController;
}

+ (id)_systemUISceneBoundProcessIdentities
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SBSystemUIScenesCoordinator__systemUISceneBoundProcessIdentities__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_systemUISceneBoundProcessIdentities_onceToken != -1)
    dispatch_once(&_systemUISceneBoundProcessIdentities_onceToken, block);
  return (id)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities;
}

- (id)sceneFromIdentityTokenStringRepresentation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "sceneFromIdentityTokenStringRepresentation:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_systemUISceneSessionRoles
{
  if (_systemUISceneSessionRoles_onceToken != -1)
    dispatch_once(&_systemUISceneSessionRoles_onceToken, &__block_literal_global_256);
  return (id)_systemUISceneSessionRoles_systemUISceneSessionRoles;
}

void __57__SBSystemUIScenesCoordinator__systemUISceneSessionRoles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "uiSceneSessionRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "uiSceneSessionRole");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "uiSceneSessionRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "uiSceneSessionRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "uiSceneSessionRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_systemUISceneSessionRoles_systemUISceneSessionRoles;
  _systemUISceneSessionRoles_systemUISceneSessionRoles = v10;

}

+ (id)_configurationForSystemUISceneSessionRoles
{
  if (_configurationForSystemUISceneSessionRoles_onceToken != -1)
    dispatch_once(&_configurationForSystemUISceneSessionRoles_onceToken, &__block_literal_global_21_3);
  return (id)_configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles;
}

void __73__SBSystemUIScenesCoordinator__configurationForSystemUISceneSessionRoles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E08];
  +[SBProximityReaderUISceneController _setupInfo](SBProximityReaderUISceneController, "_setupInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setProximityReaderUISceneController_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("setter"));

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "uiSceneSessionRole");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  +[SBLiquidDetectionUISceneController _setupInfo](SBLiquidDetectionUISceneController, "_setupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "uiSceneSessionRole");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v18[1] = v2;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "uiSceneSessionRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  +[SBScreenSharingOverlayUISceneController _setupInfo](SBScreenSharingOverlayUISceneController, "_setupInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "uiSceneSessionRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  +[SBMagnifierUISceneController _setupInfo](SBMagnifierUISceneController, "_setupInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles;
  _configurationForSystemUISceneSessionRoles_configurationForSystemUISceneSessionRoles = v13;

}

+ (id)_sceneControllersConfigurations
{
  if (_sceneControllersConfigurations_onceToken != -1)
    dispatch_once(&_sceneControllersConfigurations_onceToken, &__block_literal_global_31_2);
  return (id)_sceneControllersConfigurations__sceneControllersConfigurations;
}

void __62__SBSystemUIScenesCoordinator__sceneControllersConfigurations__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id obj;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _QWORD v85[15];

  v85[13] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E08];
  +[SBDruidUISceneController _setupInfo](SBDruidUISceneController, "_setupInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithDictionary:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setDruidUISceneController_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v2;
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("setter"));

  v4 = (void *)MEMORY[0x1E0C99E08];
  +[SBOverlayUISceneController _setupInfo](SBOverlayUISceneController, "_setupInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setOverlayUISceneController_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v6;
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("setter"));

  v8 = (void *)MEMORY[0x1E0C99E08];
  +[SBInputUISceneController _setupInfo](SBInputUISceneController, "_setupInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setInputUISceneController_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v10;
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("setter"));

  v12 = (void *)MEMORY[0x1E0C99E08];
  +[SBEnsembleUISceneController _setupInfo](SBEnsembleUISceneController, "_setupInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setEnsembleUISceneController_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v14;
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("setter"));

  v16 = (void *)MEMORY[0x1E0C99E08];
  +[SBEyedropperUISceneController _setupInfo](SBEyedropperUISceneController, "_setupInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setEyedropperUISceneController_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v18;
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("setter"));

  v20 = (void *)MEMORY[0x1E0C99E08];
  +[SBPerfPowerHUDSceneController _setupInfo](SBPerfPowerHUDSceneController, "_setupInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setPerfPowerHUDUISceneController_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v22;
  objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("setter"));

  v24 = (void *)MEMORY[0x1E0C99E08];
  +[SBInternalPerfPowerHUDSceneController _setupInfo](SBInternalPerfPowerHUDSceneController, "_setupInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryWithDictionary:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setInternalPerfPowerHUDUISceneController_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v26;
  objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("setter"));

  v28 = (void *)MEMORY[0x1E0C99E08];
  +[SBMomentsUISceneController _setupInfo](SBMomentsUISceneController, "_setupInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryWithDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setMomentsUISceneController_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("setter"));

  if (((+[SBCaptureHardwareButton deviceSupportsCaptureButton]() & 1) != 0
     || +[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]())
    && +[SBCaptureHardwareButton isCaptureFeatureEnabled]())
  {
    v32 = (void *)MEMORY[0x1E0C99E08];
    +[SBCameraOverlayUISceneController _setupInfo](SBCameraOverlayUISceneController, "_setupInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryWithDictionary:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setCameraOverlayUISceneController_);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("setter"));

  }
  else
  {
    v34 = 0;
  }
  v36 = (void *)MEMORY[0x1E0C99E08];
  +[SBAccessibilityUIServerUISceneController _setupInfo](SBAccessibilityUIServerUISceneController, "_setupInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dictionaryWithDictionary:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setAccessibilityUIServerUISceneController_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("setter"));

  v40 = (void *)MEMORY[0x1E0C99E08];
  +[SBAssistiveTouchUISceneController _setupInfo](SBAssistiveTouchUISceneController, "_setupInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dictionaryWithDictionary:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setAssistiveTouchUISceneController_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKey:", v43, CFSTR("setter"));

  v44 = (void *)MEMORY[0x1E0C99E08];
  +[SBLiveTranscriptionUISceneController _setupInfo](SBLiveTranscriptionUISceneController, "_setupInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "dictionaryWithDictionary:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setLiveTranscriptionUISceneController_);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKey:", v47, CFSTR("setter"));

  v48 = (void *)MEMORY[0x1E0C99E08];
  +[SBFullKeyboardAccessUISceneController _setupInfo](SBFullKeyboardAccessUISceneController, "_setupInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "dictionaryWithDictionary:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setFullKeyboardAccessUISceneController_);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKey:", v51, CFSTR("setter"));

  v52 = (void *)MEMORY[0x1E0C99E08];
  +[SBVoiceControlUISceneController _setupInfo](SBVoiceControlUISceneController, "_setupInfo");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "dictionaryWithDictionary:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel_setVoiceControlUISceneController_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKey:", v55, CFSTR("setter"));

  v85[0] = v78;
  v85[1] = v77;
  v85[2] = v76;
  v85[3] = v46;
  v69 = v50;
  v85[4] = v50;
  v85[5] = v54;
  v68 = v54;
  v70 = v42;
  v85[6] = v42;
  v85[7] = v38;
  v85[8] = v75;
  v85[9] = v74;
  v85[10] = v30;
  v85[11] = v73;
  v85[12] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 13);
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)_sceneControllersConfigurations__sceneControllersConfigurations;
  _sceneControllersConfigurations__sceneControllersConfigurations = v56;

  if (v34)
  {
    objc_msgSend((id)_sceneControllersConfigurations__sceneControllersConfigurations, "arrayByAddingObject:", v34);
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)_sceneControllersConfigurations__sceneControllersConfigurations;
    _sceneControllersConfigurations__sceneControllersConfigurations = v58;

  }
  v71 = v34;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)_sceneControllersConfigurations__sceneControllersConfigurations;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v81 != v62)
          objc_enumerationMutation(obj);
        v64 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v64, "objectForKey:", CFSTR("jobLabel"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKey:", CFSTR("isDaemon"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v66, "BOOLValue") & 1) != 0)
          objc_msgSend(MEMORY[0x1E0D87D80], "identityForDaemonJobLabel:", v65);
        else
          objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "setObject:forKey:", v67, CFSTR("processIdentity"));
      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    }
    while (v61);
  }

}

void __67__SBSystemUIScenesCoordinator__systemUISceneBoundProcessIdentities__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "_sceneControllersConfigurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities;
  _systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sceneControllersConfigurations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("enabled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v13)
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("processIdentity"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_systemUISceneBoundProcessIdentities__systemUISceneBoundProcessIdentities, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

+ (BOOL)shouldHandleSceneRequestsForProcess:(id)a3 withOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSystemUIScenesCoordinator.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processHandle"));

  }
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "_isSystemUISceneBoundClient:", v10) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(a1, "_isSystemUISceneDynamicClient:withSceneRequestOptions:", v7, v8);

  return v11;
}

+ (BOOL)_isSystemUISceneBoundClient:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSystemUIScenesCoordinator.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientIdentity"));

  }
  objc_msgSend(a1, "_systemUISceneBoundProcessIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

+ (BOOL)_isSystemUISceneDynamicClient:(id)a3 withSceneRequestOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSystemUIScenesCoordinator.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processHandle"));

  }
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processForPID:", objc_msgSend(v7, "pid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiSceneSessionRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.springboard.SystemUIScene"));
  v14 = v13;
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "_systemUISceneSessionRoles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v12);

    if (v14)
      goto LABEL_5;
LABEL_8:
    LOBYTE(v18) = 0;
    goto LABEL_10;
  }
  v16 = 0;
  if (!v13)
    goto LABEL_8;
LABEL_5:
  if (v8)
  {
    +[SBSystemUISceneDomain rootSettings](SBSystemUISceneDomain, "rootSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "allowAnySceneSessionRole") | v16;

  }
  else
  {
    LOBYTE(v18) = 1;
  }
LABEL_10:

  return v18;
}

- (void)_createSceneWorkspaceControllerForProcessIdentity:(id)a3 jobLabel:(id)a4 options:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBSystemUISceneController *v17;
  SBSystemUISceneController *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  objc_msgSend(a5, "specification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uiSceneSessionRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_configurationForSystemUISceneSessionRoles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("jobLabel"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v21)
  {
    if (v9)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

    if (v9)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 273, CFSTR("jobLabel unexpectedly nil"));

LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.@"), CFSTR("com.apple.SpringBoard.SceneWorkspace"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("processIdentity"));
    objc_msgSend(v14, "setObject:forKey:", v9, CFSTR("jobLabel"));
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("workspaceID"));
    objc_msgSend((id)SBApp, "windowSceneManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeDisplayWindowScene");
    v17 = (SBSystemUISceneController *)objc_claimAutoreleasedReturnValue();

    -[SBSystemUIScenesCoordinator _createSystemUISceneControllerForConfiguration:withActiveDisplayWindowScene:](self, "_createSystemUISceneControllerForConfiguration:withActiveDisplayWindowScene:", v14, v17);
  }
  else
  {
    v18 = [SBSystemUISceneController alloc];
    v17 = -[SBSystemUISceneController initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:](v18, "initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:", v15, v21, 2, CFSTR("SBTraitsParticipantRoleSystemUIScene"), v9, *MEMORY[0x1E0CEBBD0] + 255.0);
    -[SBSystemUISceneController setDefaultPresenter:](v17, "setDefaultPresenter:", self->_springboardMainBinderPresenter);
    -[NSMutableArray addObject:](self->_sceneControllers, "addObject:", v17);
    -[NSMutableArray addObject:](self->_allKnownProcessIdentities, "addObject:", v21);
  }

}

- (SBSystemUIScenesCoordinator)init
{
  SBSystemUIScenesCoordinator *v2;
  SBSystemUISceneDefaultPresenter *v3;
  SBSystemUISceneDefaultPresenter *customBinderPresenter;
  SBSystemUISceneDefaultPresenter *v5;
  SBSystemUISceneDefaultPresenter *springboardMainBinderPresenter;
  void *v7;
  uint64_t v8;
  NSMutableArray *sceneControllers;
  uint64_t v10;
  NSMutableArray *allKnownProcessIdentities;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBSystemUIScenesCoordinator;
  v2 = -[SBSystemUIScenesCoordinator init](&v26, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBSystemUISceneDefaultPresenter);
    customBinderPresenter = v2->_customBinderPresenter;
    v2->_customBinderPresenter = v3;

    v5 = -[SBSystemUISceneDefaultPresenter initWithPresentationBinderProvider:]([SBSystemUISceneDefaultPresenter alloc], "initWithPresentationBinderProvider:", v2);
    springboardMainBinderPresenter = v2->_springboardMainBinderPresenter;
    v2->_springboardMainBinderPresenter = v5;

    objc_msgSend((id)objc_opt_class(), "_sceneControllersConfigurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    sceneControllers = v2->_sceneControllers;
    v2->_sceneControllers = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v10 = objc_claimAutoreleasedReturnValue();
    allKnownProcessIdentities = v2->_allKnownProcessIdentities;
    v2->_allKnownProcessIdentities = (NSMutableArray *)v10;

    objc_msgSend((id)SBApp, "windowSceneManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeDisplayWindowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__completeWindowSceneClientsConfiguration, CFSTR("SBBootCompleteNotification"), 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__willEnableSecureRendering_, *MEMORY[0x1E0DA9FE8], 0);
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__didDisableSecureRendering_, *MEMORY[0x1E0DA9FE0], 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend((id)objc_opt_class(), "_sceneControllersConfigurations", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          -[SBSystemUIScenesCoordinator _createSystemUISceneControllerForConfiguration:withActiveDisplayWindowScene:](v2, "_createSystemUISceneControllerForConfiguration:withActiveDisplayWindowScene:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++), v13);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v18);
    }

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBSystemUIScenesCoordinator;
  -[SBSystemUIScenesCoordinator dealloc](&v4, sel_dealloc);
}

- (void)_createSystemUISceneControllerForConfiguration:(id)a3 withActiveDisplayWindowScene:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SBSystemUISceneDefaultPresenter *v21;
  SBSystemUISceneDefaultPresenter *v22;
  SBSystemUISceneDefaultPresenter *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v28, "objectForKey:", CFSTR("processIdentity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
    goto LABEL_18;
  v10 = (objc_class *)(id)objc_msgSend(v28, "objectForKey:", CFSTR("class"));
  objc_msgSend(v28, "objectForKey:", CFSTR("jobLabel"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("traitsRole"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("workspaceID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("setter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pointerValue");

  objc_msgSend(v28, "objectForKey:", CFSTR("presentationStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("vendingStrategy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUIScenesCoordinator _levelForClientConfiguration:](self, "_levelForClientConfiguration:", v28);
  v17 = v16;
  v25 = v13;
  v18 = (void *)v11;
  if (v14)
  {
    v19 = objc_msgSend(v14, "integerValue");
    if (v15)
    {
LABEL_4:
      v20 = objc_msgSend(v15, "integerValue", v25);
      goto LABEL_7;
    }
  }
  else
  {
    v19 = 0;
    if (v15)
      goto LABEL_4;
  }
  v20 = 2;
LABEL_7:
  v21 = self->_springboardMainBinderPresenter;
  if (v19 == 2)
  {
    if (!v6)
    {
      v23 = 0;
      goto LABEL_14;
    }
    v22 = -[SBSystemUIScenesCoordinator _newDefaultPresenterForWindowScene:configuration:](self, "_newDefaultPresenterForWindowScene:configuration:", v6, v28);
LABEL_12:
    v23 = v22;
LABEL_14:

    v21 = v23;
    goto LABEL_15;
  }
  if (v19 == 1)
  {
    v22 = self->_customBinderPresenter;
    goto LABEL_12;
  }
LABEL_15:
  v24 = (void *)objc_msgSend([v10 alloc], "initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:", v26, v7, v20, v27, v18, v17);
  objc_msgSend(v24, "setDefaultPresenter:", v21);
  if (v25)
    -[SBSystemUIScenesCoordinator performSelector:withObject:](self, "performSelector:withObject:", v25, v24);
  -[NSMutableArray addObject:](self->_sceneControllers, "addObject:", v24, v25);
  -[NSMutableArray addObject:](self->_allKnownProcessIdentities, "addObject:", v7);

LABEL_18:
}

- (void)_completeWindowSceneClientsConfiguration
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 375, CFSTR("Must have a concept of active display SB window scene at this point."));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)objc_opt_class(), "_sceneControllersConfigurations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", CFSTR("presentationStyle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if (v13 == 2)
        {
          objc_msgSend(v11, "objectForKey:", CFSTR("processIdentity"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSystemUIScenesCoordinator sceneWorkspaceControllerForProcessIdentity:](self, "sceneWorkspaceControllerForProcessIdentity:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[SBSystemUIScenesCoordinator _newDefaultPresenterForWindowScene:configuration:](self, "_newDefaultPresenterForWindowScene:configuration:", v5, v11);
          objc_msgSend(v15, "setDefaultPresenter:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (id)_newDefaultPresenterForWindowScene:(id)a3 configuration:(id)a4
{
  id v6;
  double v7;
  double v8;
  SBSystemUISceneDefaultPresenter *v9;
  void *v10;

  v6 = a3;
  -[SBSystemUIScenesCoordinator _levelForClientConfiguration:](self, "_levelForClientConfiguration:", a4);
  v8 = v7;
  v9 = -[SBSystemUISceneDefaultPresenter initWithWindowHostingPresentationOnWindowScene:]([SBSystemUISceneDefaultPresenter alloc], "initWithWindowHostingPresentationOnWindowScene:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneDefaultPresenter setPreferredWindowLevel:](v9, "setPreferredWindowLevel:", v10);

  return v9;
}

- (double)_levelForClientConfiguration:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("hostLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = *MEMORY[0x1E0CEBBD0] + 255.0;
  }

  return v6;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "windowSceneDidConnect:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "windowSceneDidDisconnect:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_willEnableSecureRendering:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_sceneControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "willEnableSecureRendering:", 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_didDisableSecureRendering:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_sceneControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "didDisableSecureRendering:", 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)activateSceneForProcessIdentity:(id)a3 withHandle:(id)a4 options:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  BSDispatchQueueAssertMain();
  if (v23)
  {
    if (v12)
      goto LABEL_3;
LABEL_11:
    v20 = 3;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

  if (!v12)
    goto LABEL_11;
LABEL_3:
  v14 = objc_msgSend((id)objc_opt_class(), "_isSystemUISceneBoundClient:", v23);
  if (v11)
  {
    if ((v14 & 1) == 0)
    {
      if (objc_msgSend((id)objc_opt_class(), "_isSystemUISceneDynamicClient:withSceneRequestOptions:", v11, v12))
      {
        -[SBSystemUIScenesCoordinator sceneWorkspaceControllerForProcessIdentity:](self, "sceneWorkspaceControllerForProcessIdentity:", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v11, "consistentJobLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSystemUIScenesCoordinator _createSceneWorkspaceControllerForProcessIdentity:jobLabel:options:](self, "_createSceneWorkspaceControllerForProcessIdentity:jobLabel:options:", v23, v16, v12);

        }
      }
    }
  }
  v17 = objc_opt_class();
  -[SBSystemUIScenesCoordinator sceneWorkspaceControllerForProcessIdentity:](self, "sceneWorkspaceControllerForProcessIdentity:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    goto LABEL_15;
  v20 = 2;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SBSystemUIScenesCoordinatorErrorDomain, v20, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_15:
    objc_msgSend(v19, "clientProcessIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateSceneForProcessIdentity:withHandle:options:completion:", v22, v11, v12, v13);

    v19 = 0;
    goto LABEL_16;
  }
  if (v13)
    v13[2](v13, 0, v19);
LABEL_16:

}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 processIdentity:(id)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = a4;
  BSDispatchQueueAssertMain();
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentIdentifiers"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

LABEL_3:
  v12 = objc_opt_class();
  -[SBSystemUIScenesCoordinator sceneWorkspaceControllerForProcessIdentity:](self, "sceneWorkspaceControllerForProcessIdentity:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "clientProcessIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destroyScenesWithPersistentIdentifiers:processIdentity:completion:", v9, v15, v10);

  }
  else if (v10)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = SBSystemUIScenesCoordinatorErrorDomain;
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Unknown process identity");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 2, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v19);

  }
}

- (id)sceneWorkspaceControllerForProcessIdentity:(id)a3
{
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemUIScenesCoordinator.m"), 477, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processIdentity"));

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_sceneControllers;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "sceneWorkspaceControllerForProcessIdentity:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v11)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)sceneFromIdentityToken:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "sceneFromIdentityToken:", v4, (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)enumerateScenesWithBlock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sceneControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "enumerateScenesWithBlock:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addSystemUISceneToPresentationBinder:(id)a3 forDisplayIdentity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneManagerForDisplayIdentity:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addSystemUISceneToPresentationBinder:", v6);
}

- (void)removeSystemUISceneFromPresentationBinder:(id)a3 forDisplayIdentity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneManagerForDisplayIdentity:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeSystemUISceneFromPresentationBinder:", v6);
}

- (SBAccessibilityUIServerUISceneController)accessibilityUIServerUISceneController
{
  return self->_accessibilityUIServerUISceneController;
}

- (void)setAccessibilityUIServerUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityUIServerUISceneController, a3);
}

- (SBAssistiveTouchUISceneController)assistiveTouchUISceneController
{
  return self->_assistiveTouchUISceneController;
}

- (void)setAssistiveTouchUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_assistiveTouchUISceneController, a3);
}

- (SBCameraOverlayUISceneController)cameraOverlayUISceneController
{
  return self->_cameraOverlayUISceneController;
}

- (void)setCameraOverlayUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraOverlayUISceneController, a3);
}

- (SBDruidUISceneController)druidUISceneController
{
  return self->_druidUISceneController;
}

- (void)setDruidUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_druidUISceneController, a3);
}

- (SBEnsembleUISceneController)ensembleUISceneController
{
  return self->_ensembleUISceneController;
}

- (void)setEnsembleUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_ensembleUISceneController, a3);
}

- (SBEyedropperUISceneController)eyedropperUISceneController
{
  return self->_eyedropperUISceneController;
}

- (void)setEyedropperUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_eyedropperUISceneController, a3);
}

- (SBFullKeyboardAccessUISceneController)fullKeyboardAccessUISceneController
{
  return self->_fullKeyboardAccessUISceneController;
}

- (void)setFullKeyboardAccessUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_fullKeyboardAccessUISceneController, a3);
}

- (SBInputUISceneController)inputUISceneController
{
  return self->_inputUISceneController;
}

- (void)setInputUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_inputUISceneController, a3);
}

- (SBInternalPerfPowerHUDSceneController)internalPerfPowerHUDUISceneController
{
  return self->_internalPerfPowerHUDUISceneController;
}

- (void)setInternalPerfPowerHUDUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_internalPerfPowerHUDUISceneController, a3);
}

- (SBLiveTranscriptionUISceneController)liveTranscriptionUISceneController
{
  return self->_liveTranscriptionUISceneController;
}

- (void)setLiveTranscriptionUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_liveTranscriptionUISceneController, a3);
}

- (void)setMomentsUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_momentsUISceneController, a3);
}

- (void)setOverlayUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayUISceneController, a3);
}

- (SBPerfPowerHUDSceneController)perfPowerHUDUISceneController
{
  return self->_perfPowerHUDUISceneController;
}

- (void)setPerfPowerHUDUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_perfPowerHUDUISceneController, a3);
}

- (SBVoiceControlUISceneController)voiceControlUISceneController
{
  return self->_voiceControlUISceneController;
}

- (void)setVoiceControlUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_voiceControlUISceneController, a3);
}

- (SBProximityReaderUISceneController)proximityReaderUISceneController
{
  return self->_proximityReaderUISceneController;
}

- (void)setProximityReaderUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_proximityReaderUISceneController, a3);
}

- (SBMagnifierUISceneController)magnifierUISceneController
{
  return self->_magnifierUISceneController;
}

- (void)setMagnifierUISceneController:(id)a3
{
  objc_storeStrong((id *)&self->_magnifierUISceneController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifierUISceneController, 0);
  objc_storeStrong((id *)&self->_proximityReaderUISceneController, 0);
  objc_storeStrong((id *)&self->_voiceControlUISceneController, 0);
  objc_storeStrong((id *)&self->_perfPowerHUDUISceneController, 0);
  objc_storeStrong((id *)&self->_overlayUISceneController, 0);
  objc_storeStrong((id *)&self->_momentsUISceneController, 0);
  objc_storeStrong((id *)&self->_liveTranscriptionUISceneController, 0);
  objc_storeStrong((id *)&self->_internalPerfPowerHUDUISceneController, 0);
  objc_storeStrong((id *)&self->_inputUISceneController, 0);
  objc_storeStrong((id *)&self->_fullKeyboardAccessUISceneController, 0);
  objc_storeStrong((id *)&self->_eyedropperUISceneController, 0);
  objc_storeStrong((id *)&self->_ensembleUISceneController, 0);
  objc_storeStrong((id *)&self->_druidUISceneController, 0);
  objc_storeStrong((id *)&self->_cameraOverlayUISceneController, 0);
  objc_storeStrong((id *)&self->_assistiveTouchUISceneController, 0);
  objc_storeStrong((id *)&self->_accessibilityUIServerUISceneController, 0);
  objc_storeStrong((id *)&self->_allKnownProcessIdentities, 0);
  objc_storeStrong((id *)&self->_sceneControllers, 0);
  objc_storeStrong((id *)&self->_springboardMainBinderPresenter, 0);
  objc_storeStrong((id *)&self->_customBinderPresenter, 0);
}

@end
