@implementation SBDisplayProfileRegistry

- (_QWORD)initWithStartupOrientation:(void *)a1
{
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)SBDisplayProfileRegistry;
  v3 = objc_msgSendSuper2(&v13, sel_init);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D97618]);
    +[SBDisplayTransformerRegistry sharedInstance](SBDisplayTransformerRegistry, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithDisplayTransformerRegistry:", v5);
    v7 = (void *)v3[1];
    v3[1] = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 1282, 4);
    v9 = (void *)v3[6];
    v3[6] = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 1282, 4);
    v11 = (void *)v3[7];
    v3[7] = v10;

    v3[5] = a2;
    objc_msgSend(v3, "_registerEmbeddedDisplayProfile");
    objc_msgSend(v3, "_registerMirroringProfile");
    objc_msgSend(v3, "_registerExtendedProfile");
  }
  return v3;
}

- (uint64_t)activate
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "activate");
  return result;
}

- (void)windowingModeForDisplay:(void *)a1
{
  id v3;
  void *v4;
  void *value;

  v3 = a2;
  if (a1)
  {
    value = 0;
    if (!NSMapMember(*((NSMapTable **)a1 + 7), v3, 0, &value))
    {
      objc_msgSend(*((id *)a1 + 1), "displayProfileForIdentity:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        value = NSMapGet(*((NSMapTable **)a1 + 6), v4);
        NSMapInsert(*((NSMapTable **)a1 + 7), v3, value);
      }

    }
    a1 = value;
  }

  return a1;
}

- (void)embeddedFactory:(id)a3 modifyInitialSceneParameters:(id)a4
{
  int64_t startupEmbeddedOrientation;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a4;
  startupEmbeddedOrientation = self->_startupEmbeddedOrientation;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appSwitcherDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBDisplayProfileRegistry _modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:](self, "_modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:", v9, startupEmbeddedOrientation, 100, objc_msgSend(v7, "chamoisWindowingEnabled"));

}

- (void)extendedFactory:(id)a3 modifyInitialSceneParameters:(id)a4
{
  id v4;

  v4 = -[SBDisplayProfileRegistry _modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:](self, "_modifyParameters:orientation:interfaceOrientationMode:chamoisEnabled:", a4, 1, 2, 1);
}

- (void)_registerEmbeddedDisplayProfile
{
  SBEmbeddedDisplayProfileFactory *v3;
  SBEmbeddedDisplayProfileFactory *embeddedDisplayProfileFactory;
  id v5;

  v3 = (SBEmbeddedDisplayProfileFactory *)-[SBEmbeddedDisplayProfileFactory initWithDelegate:]((id *)[SBEmbeddedDisplayProfileFactory alloc], self);
  embeddedDisplayProfileFactory = self->_embeddedDisplayProfileFactory;
  self->_embeddedDisplayProfileFactory = v3;

  -[SBEmbeddedDisplayProfileFactory createProfile](self->_embeddedDisplayProfileFactory);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSMapInsert(self->_profileToWindowingMode, v5, (const void *)1);
  -[SSKDisplayProfileRegistry registerDisplayProfile:](self->_displayProfileRegistry, "registerDisplayProfile:", v5);

}

- (void)_registerExtendedProfile
{
  SBExtendedDisplayProfileFactory *v3;
  void *v4;
  void *v5;
  SBExtendedDisplayProfileFactory *v6;
  SBExtendedDisplayProfileFactory *extendedDisplayProfileFactory;
  id v8;

  v3 = [SBExtendedDisplayProfileFactory alloc];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalDisplayDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SBExtendedDisplayProfileFactory *)-[SBExtendedDisplayProfileFactory initWithDefaults:delegate:]((id *)&v3->super.isa, v5, self);
  extendedDisplayProfileFactory = self->_extendedDisplayProfileFactory;
  self->_extendedDisplayProfileFactory = v6;

  -[SBExtendedDisplayProfileFactory createProfile](self->_extendedDisplayProfileFactory);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSMapInsert(self->_profileToWindowingMode, v8, (const void *)1);
  -[SSKDisplayProfileRegistry registerDisplayProfile:](self->_displayProfileRegistry, "registerDisplayProfile:", v8);

}

- (void)_registerMirroringProfile
{
  SBMirroringDisplayProfileFactory *v3;
  SBMirroringDisplayProfileFactory *mirroringDisplayProfileFactory;
  id v5;

  v3 = objc_alloc_init(SBMirroringDisplayProfileFactory);
  mirroringDisplayProfileFactory = self->_mirroringDisplayProfileFactory;
  self->_mirroringDisplayProfileFactory = v3;

  -[SBMirroringDisplayProfileFactory createProfile](self->_mirroringDisplayProfileFactory, "createProfile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSMapInsert(self->_profileToWindowingMode, v5, 0);
  -[SSKDisplayProfileRegistry registerDisplayProfile:](self->_displayProfileRegistry, "registerDisplayProfile:", v5);

}

- (id)_modifyParameters:(id)a3 orientation:(int64_t)a4 interfaceOrientationMode:(int64_t)a5 chamoisEnabled:(BOOL)a6
{
  id v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];
  BOOL v14;

  v9 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke;
  v13[3] = &__block_descriptor_41_e33_v16__0__FBSMutableSceneSettings_8l;
  v13[4] = a5;
  v14 = a6;
  objc_msgSend(v9, "updateSettingsWithBlock:", v13);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke_2;
  v12[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v12[4] = a4;
  objc_msgSend(v9, "updateClientSettingsWithBlock:", v12);
  return v9;
}

void __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setInterfaceOrientation:", 1);
  if (objc_msgSend(v7, "isUISubclass"))
  {
    v3 = v7;
    objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", 0);
    objc_msgSend(v3, "setInterfaceOrientationMode:", *(_QWORD *)(a1 + 32));
    objc_msgSend((id)SBApp, "userInterfaceStyleProviderForDisplay:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "currentStyle"));

    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
    objc_msgSend(v3, "setEnhancedWindowingEnabled:", *(unsigned __int8 *)(a1 + 40));

  }
  objc_msgSend(v7, "ignoreOcclusionReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", CFSTR("SystemApp"));

}

void __98__SBDisplayProfileRegistry__modifyParameters_orientation_interfaceOrientationMode_chamoisEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isUISubclass"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v5;
    objc_msgSend(v4, "setInterfaceOrientation:", v3);
    objc_msgSend(v4, "setStatusBarStyle:", 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayToWindowingMode, 0);
  objc_storeStrong((id *)&self->_profileToWindowingMode, 0);
  objc_storeStrong((id *)&self->_mirroringDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_extendedDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayProfileFactory, 0);
  objc_storeStrong((id *)&self->_displayProfileRegistry, 0);
}

@end
