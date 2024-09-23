@implementation PRUISAmbientPosterViewController

- (BOOL)_shouldSnapshot
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v8;
  char v9;

  if (!self->__snapshotController)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PRUISAmbientEnableSnapshots"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v8 = v6;

  v9 = objc_msgSend(v8, "BOOLValue");
  if (v8)
    return v9;
  else
    return 1;
}

- (PRUISAmbientPosterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PRUISAmbientPosterViewController initWithBoundingShape:](self, "initWithBoundingShape:", -1, a4);
}

- (PRUISAmbientPosterViewController)initWithBoundingShape:(int64_t)a3
{
  uint64_t v5;
  PRUISAmbientPosterViewController *v6;
  PRUISDefaultSessionReconnectPolicy *v7;
  PRUISSessionReconnectPolicy *reconnectPolicy;
  UIImageView *v9;
  UIImageView *snapshotBackgroundLayerView;
  UIImageView *v11;
  UIImageView *snapshotForegroundLayerView;
  UIImageView *v13;
  UIImageView *snapshotFloatingLayerView;
  uint64_t v15;
  FBSDisplayConfiguration *displayConfiguration;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = PUIPosterBoundingShapeFromInt();
  if ((PUIPosterBoundingShapeIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PUIPosterBoundingShapeIsValid(puiBoundingShape)"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PRUISAmbientPosterViewController initWithBoundingShape:].cold.1(a2, (uint64_t)self, (uint64_t)v22);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2445F87B8);
  }
  v23.receiver = self;
  v23.super_class = (Class)PRUISAmbientPosterViewController;
  v6 = -[PRUISAmbientPosterViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  if (v6)
  {
    v7 = objc_alloc_init(PRUISDefaultSessionReconnectPolicy);
    reconnectPolicy = v6->_reconnectPolicy;
    v6->_reconnectPolicy = (PRUISSessionReconnectPolicy *)v7;

    v6->_visibleSnapshotLayers = -1;
    v6->_boundingShape = v5;
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    snapshotBackgroundLayerView = v6->_snapshotBackgroundLayerView;
    v6->_snapshotBackgroundLayerView = v9;

    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    snapshotForegroundLayerView = v6->_snapshotForegroundLayerView;
    v6->_snapshotForegroundLayerView = v11;

    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    snapshotFloatingLayerView = v6->_snapshotFloatingLayerView;
    v6->_snapshotFloatingLayerView = v13;

    v6->_backgroundOpacity = 1.0;
    v6->_foregroundOpacity = 1.0;
    v6->_floatingOpacity = 1.0;
    objc_msgSend(MEMORY[0x24BE38058], "mainConfiguration");
    v15 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v6->_displayConfiguration;
    v6->_displayConfiguration = (FBSDisplayConfiguration *)v15;

    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[PRUISAmbientPosterViewController registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v18, sel__backlightLuminanceTraitDidChange_previousTraitCollection_);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__windowDidAttachContext_, *MEMORY[0x24BDF81D0], 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v6, sel__windowDidDetachContext_, *MEMORY[0x24BDF81D8], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_ambientPresentationTraitChangeRegistration)
    -[PRUISAmbientPosterViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF81D0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF81D8], 0);
  -[PRUISAmbientPosterViewController invalidate](self, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)updateConfiguration:(id)a3
{
  id v5;
  PRSPosterConfiguration *configuration;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  FBScene *scene;
  BOOL v24;
  void *v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  configuration = self->_configuration;
  if (!configuration)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    -[PRUISAmbientPosterViewController _setupScene](self, "_setupScene");
    -[PRUISAmbientPosterViewController _registerForAmbientPresentationTraitChanges](self, "_registerForAmbientPresentationTraitChanges");
    goto LABEL_15;
  }
  -[PRSPosterConfiguration _path](configuration, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  objc_msgSend(v7, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    v14 = objc_msgSend(v10, "version");
    v15 = objc_msgSend(v9, "version");
    PRUISLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14 == v15)
    {
      if (v17)
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v18;
        v19 = "Refreshing ambient poster %{public}@.";
        v20 = v16;
        v21 = 12;
LABEL_12:
        _os_log_impl(&dword_2445ED000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);

      }
    }
    else if (v17)
    {
      -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v18;
      v31 = 2048;
      v32 = objc_msgSend(v9, "version");
      v33 = 2048;
      v34 = objc_msgSend(v10, "version");
      v19 = "Updating ambient poster %{public}@ from version %llu to %llu.";
      v20 = v16;
      v21 = 32;
      goto LABEL_12;
    }

    scene = self->_scene;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __56__PRUISAmbientPosterViewController_updateConfiguration___block_invoke;
    v27[3] = &unk_251535008;
    v27[4] = self;
    v28 = v8;
    -[FBScene pruis_updateWithoutActivating:](scene, "pruis_updateWithoutActivating:", v27);

    goto LABEL_14;
  }
  PRUISLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2445ED000, v22, OS_LOG_TYPE_DEFAULT, "Cannot update to proposed poster configuration.", buf, 2u);
  }

LABEL_14:
  -[PRUISAmbientPosterViewController _registerForAmbientPresentationTraitChanges](self, "_registerForAmbientPresentationTraitChanges");
  if (!v13)
  {
    v24 = 0;
    goto LABEL_17;
  }
LABEL_15:
  -[PRUISAmbientPosterViewController _updateSnapshots](self, "_updateSnapshots");
  -[PRUISAmbientPosterViewController _updateForCurrentPresentationMode](self, "_updateForCurrentPresentationMode");
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
  v24 = 1;
LABEL_17:

  return v24;
}

uint64_t __56__PRUISAmbientPosterViewController_updateConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "pr_updateWithPath:inSettings:", *(_QWORD *)(a1 + 40), a2);
}

- (void)setExtensionUserInteractionEnabled:(BOOL)a3
{
  FBScene *scene;
  _QWORD v4[4];
  BOOL v5;

  if (self->_extensionUserInteractionEnabled != a3)
  {
    self->_extensionUserInteractionEnabled = a3;
    scene = self->_scene;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__PRUISAmbientPosterViewController_setExtensionUserInteractionEnabled___block_invoke;
    v4[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    v5 = a3;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v4);
  }
}

uint64_t __71__PRUISAmbientPosterViewController_setExtensionUserInteractionEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setExtensionUserInteractionEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setIsPreview:(BOOL)a3
{
  if (self->_isPreview != a3)
  {
    self->_isPreview = a3;
    -[PRUISAmbientPosterViewController _updateForCurrentIsSnapshot](self, "_updateForCurrentIsSnapshot");
  }
}

- (void)setVisibility:(unint64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    -[PRUISAmbientPosterViewController _updateForCurrentVisibility](self, "_updateForCurrentVisibility");
  }
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    -[PRUISAmbientPosterViewController _updateForCurrentPresentationMode](self, "_updateForCurrentPresentationMode");
  }
}

- (void)setVisibleSnapshotLayers:(unint64_t)a3
{
  if (self->_visibleSnapshotLayers != a3)
  {
    self->_visibleSnapshotLayers = a3;
    -[PRUISAmbientPosterViewController _updateSnapshotLayerVisibility](self, "_updateSnapshotLayerVisibility");
  }
}

+ (id)defaultSnapshotCacheURL
{
  return (id)objc_msgSend(a1, "defaultSnapshotCacheURLInCurrentContainer:", 1);
}

+ (id)defaultSnapshotCacheURLInCurrentContainer:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    BSCurrentUserDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v10[1] = CFSTR("Library");
    v10[2] = CFSTR("Caches");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPathComponents:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Ambient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("PosterSnapshots"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PRUISPosterSnapshotController)snapshotController
{
  return self->__snapshotController;
}

- (void)setSnapshotController:(id)a3
{
  PRUISPosterSnapshotController *v5;
  PRUISPosterSnapshotController *v6;

  v5 = (PRUISPosterSnapshotController *)a3;
  if (self->__snapshotController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__snapshotController, a3);
    v5 = v6;
  }

}

- (void)invalidate
{
  -[PRUISAmbientPosterViewController _teardownScene](self, "_teardownScene");
  -[PRUISAmbientPosterViewController setSnapshotController:](self, "setSnapshotController:", 0);
}

- (void)userTapEventOccurredWithLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  id v8;
  id v9;

  y = a3.y;
  x = a3.x;
  -[FBScene clientSettings](self->_scene, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pui_userTapEventsRequested");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BE74E38]);
    v9 = (id)objc_msgSend(v8, "initWithType:location:", *MEMORY[0x24BE74EA0], x, y);
    -[PRUISAmbientPosterViewController eventOccurred:](self, "eventOccurred:", v9);

  }
}

- (void)eventOccurred:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "newAction");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene sendActions:](self->_scene, "sendActions:", v4);

}

- (void)setOpacity:(double)a3 forLayers:(unint64_t)a4
{
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_foregroundOpacity = a3;
    if ((a4 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_backgroundOpacity = a3;
  if ((a4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a4 & 4) != 0)
LABEL_4:
    self->_floatingOpacity = a3;
LABEL_5:
  -[PRUISAmbientPosterViewController _updateSeparatedLayerHosting](self, "_updateSeparatedLayerHosting", a3);
  -[PRUISAmbientPosterViewController _updateSnapshotOpacities](self, "_updateSnapshotOpacities");
}

+ (NSArray)suggestedInstanceIdentifiers
{
  if (suggestedInstanceIdentifiers_onceToken != -1)
    dispatch_once(&suggestedInstanceIdentifiers_onceToken, &__block_literal_global_6);
  return (NSArray *)(id)suggestedInstanceIdentifiers_identifiers;
}

void __64__PRUISAmbientPosterViewController_suggestedInstanceIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[9];

  v10[8] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("0FCA6C3D-1F82-411A-A9B1-1C06D12DCC42"));
  v10[0] = v0;
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("5A844F1E-4289-4717-B96D-D6A03A258B53"));
  v10[1] = v1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("DA40E1E8-43D0-4F86-8B7B-72A3CCDED2A6"));
  v10[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AF57A69A-C2B0-4A23-9B45-CDFC4F672571"));
  v10[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("0A2C2CA5-4530-4DC9-87FB-327184120271"));
  v10[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("534788DA-63B5-4AED-84B2-8752F9B01893"));
  v10[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("A5E96117-83BF-4B55-BC3A-C39FC602F12C"));
  v10[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("271390E6-6D65-4209-9273-B6A920C290A0"));
  v10[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)suggestedInstanceIdentifiers_identifiers;
  suggestedInstanceIdentifiers_identifiers = v8;

}

- (id)_defaultDisplayConfiguration
{
  return (id)objc_msgSend(MEMORY[0x24BE38058], "mainConfiguration");
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    -[PRUISAmbientPosterViewController _updateSceneSettingsForUpdatedDisplayConfiguration](self, "_updateSceneSettingsForUpdatedDisplayConfiguration");
  }

}

- (FBSDisplayConfiguration)displayConfiguration
{
  FBSDisplayConfiguration *displayConfiguration;

  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
    return displayConfiguration;
  -[PRUISAmbientPosterViewController _defaultDisplayConfiguration](self, "_defaultDisplayConfiguration");
  return (FBSDisplayConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateSceneSettingsForUpdatedDisplayConfiguration
{
  void *v3;
  FBScene *scene;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PRUISAmbientPosterViewController displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__PRUISAmbientPosterViewController__updateSceneSettingsForUpdatedDisplayConfiguration__block_invoke;
  v6[3] = &unk_251534D10;
  v7 = v3;
  v5 = v3;
  -[FBScene pruis_updateWithoutActivating:](scene, "pruis_updateWithoutActivating:", v6);

}

void __86__PRUISAmbientPosterViewController__updateSceneSettingsForUpdatedDisplayConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));

}

- (void)fetchAppIntentsListenerEndpointWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__PRUISAmbientPosterViewController_fetchAppIntentsListenerEndpointWithHandler___block_invoke;
  v6[3] = &unk_251535070;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __79__PRUISAmbientPosterViewController_fetchAppIntentsListenerEndpointWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  _OWORD v10[2];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 976);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF20]);
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE74DA8]), "initWithHandler:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_msgSend(v3, "initWithObjects:", v9, 0);
    objc_msgSend(v2, "sendActions:", v4);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      *(_QWORD *)&v6 = -1;
      *((_QWORD *)&v6 + 1) = -1;
      v10[0] = v6;
      v10[1] = v6;
      objc_msgSend(MEMORY[0x24BE0BDB8], "tokenFromAuditToken:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "pr_errorWithCode:", 9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, void *))(v5 + 16))(v5, 0, v7, v8);

    }
  }
}

- (BOOL)isEditingSupported
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  PRUISAmbientPosterSceneLayerHostView *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  PRUISAmbientPosterSceneLayerHostView *v12;
  PRUISAmbientPosterSceneLayerHostView *backgroundSceneLayerView;
  PRUISAmbientPosterSceneLayerHostView *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  PRUISAmbientPosterSceneLayerHostView *v19;
  PRUISAmbientPosterSceneLayerHostView *foregroundSceneLayerView;
  PRUISAmbientPosterSceneLayerHostView *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  PRUISAmbientPosterSceneLayerHostView *v26;
  PRUISAmbientPosterSceneLayerHostView *floatingSceneLayerView;
  PRUISAmbientPosterSceneLayerHostView *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  objc_super v42;
  _QWORD v43[3];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewDidLoad](&v42, sel_viewDidLoad);
  -[PRUISAmbientPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __47__PRUISAmbientPosterViewController_viewDidLoad__block_invoke;
  v40[3] = &unk_251535098;
  v6 = v5;
  v41 = v6;
  -[PRUISAmbientPosterViewController _enumerateSnapshotLayerViews:](self, "_enumerateSnapshotLayerViews:", v40);
  objc_msgSend(v6, "insertSubview:atIndex:", self->_snapshotBackgroundLayerView, 0);
  objc_msgSend(v6, "insertSubview:atIndex:", self->_snapshotForegroundLayerView, 1);
  objc_msgSend(v6, "insertSubview:atIndex:", self->_snapshotFloatingLayerView, 2);
  objc_msgSend(v3, "insertSubview:atIndex:", v6, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, v5);
  v7 = [PRUISAmbientPosterSceneLayerHostView alloc];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-background"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PRUISAmbientPosterSceneLayerHostView initWithIdentifier:](v7, "initWithIdentifier:", v11);
  backgroundSceneLayerView = self->_backgroundSceneLayerView;
  self->_backgroundSceneLayerView = v12;

  v14 = [PRUISAmbientPosterSceneLayerHostView alloc];
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-foreground"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PRUISAmbientPosterSceneLayerHostView initWithIdentifier:](v14, "initWithIdentifier:", v18);
  foregroundSceneLayerView = self->_foregroundSceneLayerView;
  self->_foregroundSceneLayerView = v19;

  v21 = [PRUISAmbientPosterSceneLayerHostView alloc];
  v22 = (void *)MEMORY[0x24BDD17C8];
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-floating"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PRUISAmbientPosterSceneLayerHostView initWithIdentifier:](v21, "initWithIdentifier:", v25);
  floatingSceneLayerView = self->_floatingSceneLayerView;
  self->_floatingSceneLayerView = v26;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = self->_foregroundSceneLayerView;
  v43[0] = self->_backgroundSceneLayerView;
  v43[1] = v28;
  v43[2] = self->_floatingSceneLayerView;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v37;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v33);
        objc_msgSend(v3, "bounds");
        objc_msgSend(v34, "setFrame:");
        objc_msgSend(v34, "setAutoresizingMask:", 18);
        objc_msgSend(v34, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setAllowsGroupOpacity:", 1);

        objc_msgSend(v3, "addSubview:", v34);
        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v31);
  }

  -[PRUISAmbientPosterViewController _updateForCurrentPresentationMode](self, "_updateForCurrentPresentationMode");
}

void __47__PRUISAmbientPosterViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setContentMode:", 2);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BSInvalidatable *v10;
  BSInvalidatable *snapshotControllerKeepaliveAssertion;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  if (!self->_scene)
    -[PRUISAmbientPosterViewController _setupScene](self, "_setupScene");
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
  if (!self->_snapshotControllerKeepaliveAssertion)
  {
    -[PRUISAmbientPosterViewController snapshotController](self, "snapshotController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[PRSPosterConfiguration _path](self->_configuration, "_path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "posterUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("PRUISAmbientPosterViewController %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acquireKeepActiveAssertionForReason:", v9);
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    snapshotControllerKeepaliveAssertion = self->_snapshotControllerKeepaliveAssertion;
    self->_snapshotControllerKeepaliveAssertion = v10;

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[PRUISAmbientPosterViewController _updateSnapshotsAnimated:](self, "_updateSnapshotsAnimated:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BSInvalidatable *snapshotControllerKeepaliveAssertion;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
  -[PRUISAmbientPosterViewController _takeNewSnapshots](self, "_takeNewSnapshots");
  -[BSInvalidatable invalidate](self->_snapshotControllerKeepaliveAssertion, "invalidate");
  snapshotControllerKeepaliveAssertion = self->_snapshotControllerKeepaliveAssertion;
  self->_snapshotControllerKeepaliveAssertion = 0;

  -[PRUISAmbientPosterViewController _teardownScene](self, "_teardownScene");
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISAmbientPosterViewController;
  v4 = a3;
  -[PRUISAmbientPosterViewController viewWillMoveToWindow:](&v5, sel_viewWillMoveToWindow_, v4);
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:](self, "_updateSceneWithCompletion:window:", 0, v4, v5.receiver, v5.super_class);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v9, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:](self, "_updateSceneWithCompletion:window:", 0, v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDF8030];
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BDF8030], 0);
  if (v6)
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__noteWindowWillRotate_, v8, v6);
    -[PRUISAmbientPosterViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat Width;
  CGFloat Height;
  FBScene *scene;
  UIView *snapshotContainerView;
  void *v16;
  _QWORD v17[8];
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)PRUISAmbientPosterViewController;
  -[PRUISAmbientPosterViewController viewWillLayoutSubviews](&v18, sel_viewWillLayoutSubviews);
  if (_os_feature_enabled_impl())
  {
    -[PRUISAmbientPosterViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    Width = CGRectGetWidth(v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    Height = CGRectGetHeight(v20);
    scene = self->_scene;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __58__PRUISAmbientPosterViewController_viewWillLayoutSubviews__block_invoke;
    v17[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
    v17[4] = 0;
    v17[5] = 0;
    *(CGFloat *)&v17[6] = Width;
    *(CGFloat *)&v17[7] = Height;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v17);
  }
  snapshotContainerView = self->_snapshotContainerView;
  -[PRUISAmbientPosterViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  -[UIView setFrame:](snapshotContainerView, "setFrame:");

}

uint64_t __58__PRUISAmbientPosterViewController_viewWillLayoutSubviews__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PRUISLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "pui_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pb_shortDesc");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ now connected to %{public}@", buf, 0x16u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__PRUISAmbientPosterViewController_scene_clientDidConnect___block_invoke;
  v12[3] = &unk_2515350E0;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[PRUISAmbientPosterViewController _enumerateSceneObserversRespondingToSelector:usingBlock:](self, "_enumerateSceneObserversRespondingToSelector:usingBlock:", sel_ambientPosterViewController_didConnectToScene_, v12);

}

uint64_t __59__PRUISAmbientPosterViewController_scene_clientDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ambientPosterViewController:didConnectToScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  PRUISLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Poster sent actions: %@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PRUISLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "contentState");
    NSStringFromFBSceneContentState();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Poster content state did change to %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PRUISAmbientPosterViewController_sceneContentStateDidChange___block_invoke;
  block[3] = &unk_251534F38;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__PRUISAmbientPosterViewController_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentPresentationMode");
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t presentationMode;
  int v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  uint8_t buf[4];
  double v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PRUISLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "pui_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptionWithMultilinePrefix:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = *(double *)&v9;
    v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "Poster %{public}@ deactivated with error: %{public}@", buf, 0x16u);

  }
  -[PRUISSessionReconnectPolicy sessionDidDisconnect](self->_reconnectPolicy, "sessionDidDisconnect");
  presentationMode = self->_presentationMode;
  v12 = -[PRUISAmbientPosterViewController _appearState](self, "_appearState");
  v13 = MEMORY[0x24BDAC760];
  if (v12 && presentationMode == 2)
  {
    -[PRUISSessionReconnectPolicy sessionReconnectDelay](self->_reconnectPolicy, "sessionReconnectDelay");
    v15 = v14;
    PRUISLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v15;
      _os_log_impl(&dword_2445ED000, v16, OS_LOG_TYPE_DEFAULT, "Will attempt reactivation of ambient scene in %0.3f seconds.", buf, 0xCu);
    }

    v17 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke;
    block[3] = &unk_251534F38;
    block[4] = self;
    dispatch_after(v17, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    PRUISLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2445ED000, v18, OS_LOG_TYPE_DEFAULT, "Not attempting reactivation of ambient scene at this time.", buf, 2u);
    }

    -[PRUISAmbientPosterViewController _teardownScene](self, "_teardownScene");
  }
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke_97;
  v20[3] = &unk_2515350E0;
  v20[4] = self;
  v21 = v6;
  v19 = v6;
  -[PRUISAmbientPosterViewController _enumerateSceneObserversRespondingToSelector:usingBlock:](self, "_enumerateSceneObserversRespondingToSelector:usingBlock:", sel_ambientPosterViewController_didDeactivateScene_, v20);

}

uint64_t __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneWithCompletion:", 0);
}

uint64_t __65__PRUISAmbientPosterViewController_sceneDidDeactivate_withError___block_invoke_97(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ambientPosterViewController:didDeactivateScene:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  _QWORD block[5];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v11, "pr_updateSnapshot");
  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    block[3] = &unk_251534F38;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  if (objc_msgSend(v10, "pr_hideChromeDidChange"))
  {
    objc_msgSend(v9, "clientSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pr_hideChrome");

    -[PRUISAmbientPosterViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "animationSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "animationFence");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ambientPosterViewController:setChromeVisibility:withAnimationSettings:animationFence:", self, v15, v17, v18);

    }
  }
  if (objc_msgSend(v10, "pui_significantEventsDidChange"))
  {
    objc_msgSend(v9, "clientSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pui_significantEventOptions");

    -[PRUISAmbientPosterViewController _setClientWantsScreenWakeEvents:](self, "_setClientWantsScreenWakeEvents:", PUIPosterSignificantEventOptionsContainsEvent());
  }
  v20 = objc_alloc_init(MEMORY[0x24BE380D8]);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2;
  v21[3] = &unk_251535108;
  v21[4] = self;
  objc_msgSend(v20, "observeLayersWithBlock:", v21);
  objc_msgSend(v20, "inspectDiff:withContext:", v10, objc_msgSend(v9, "clientSettings"));
  objc_msgSend(v20, "removeAllObservers");

}

uint64_t __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_takeNewSnapshots");
}

uint64_t __110__PRUISAmbientPosterViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneLayerPresenters");
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  if (self->_shouldShareTouchesWithHost != a3)
  {
    self->_shouldShareTouchesWithHost = a3;
    if (a3)
      -[PRUISAmbientPosterViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
    else
      -[PRUISAmbientPosterViewController _clearTouchDeliveryPolicies](self, "_clearTouchDeliveryPolicies");
  }
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id *v27;
  void *v28;
  PRUISAmbientPosterViewController *v29;
  NSObject *obj;
  void *v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  id location;
  uint8_t buf[4];
  PRUISAmbientPosterViewController *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  v29 = self;
  objc_initWeak(&location, self);
  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke;
  v41 = &unk_251535130;
  v27 = &v42;
  objc_copyWeak(&v42, &location);
  BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISAmbientPosterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 && v28)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_initialTouchTimestampForWindow:", v28, &v42);
    v5 = v4;
    -[FBScene layerManager](v29->_scene, "layerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v7;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(obj);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "contextID");
          v13 = objc_alloc_init(MEMORY[0x24BE0B6F0]);
          objc_msgSend(MEMORY[0x24BE0B6E8], "policyCancelingTouchesDeliveredToContextId:withInitialTouchTimestamp:", v12, v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "endpoint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAssertionEndpoint:", v15);

          objc_msgSend(v31, "ipc_addPolicy:", v14);
          PRUISLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            v45 = v29;
            v46 = 2114;
            v47 = v13;
            v48 = 2050;
            v49 = v12;
            v50 = 2114;
            v51 = v14;
            _os_log_impl(&dword_2445ED000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Acquired cancel touches assertion: %{public}@ (context id: 0x%{public}llx, policy: %{public}@)", buf, 0x2Au);
          }

          objc_msgSend(v8, "addObject:", v13);
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v52, 16);
      }
      while (v9);
    }

    v17 = objc_alloc(MEMORY[0x24BE0BE98]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC9B8];
    v21 = MEMORY[0x24BDAC9B8];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke_109;
    v32[3] = &unk_251535158;
    v22 = v8;
    v33 = v22;
    v23 = (void *)objc_msgSend(v17, "initWithIdentifier:forReason:queue:invalidationBlock:", v19, CFSTR("cancel touches in poster"), v20, v32);

    PRUISLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v45 = v29;
      v46 = 2114;
      v47 = v23;
      _os_log_impl(&dword_2445ED000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Made cancel touches group assertion: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    PRUISLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    obj = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v45 = v29;
      v46 = 2114;
      v47 = v31;
      v48 = 2114;
      v49 = (unint64_t)v28;
      _os_log_impl(&dword_2445ED000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did not make cancel touches group assertion because of server: %{public}@, or window: %{public}@", buf, 0x20u);
    }
    v23 = 0;
  }

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  return v23;
}

void __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PRUISLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543618;
      v7 = WeakRetained;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending cancellation touch delivery policy failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __79__PRUISAmbientPosterViewController_cancelTouchesForCurrentEventInHostedContent__block_invoke_109(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_updateSceneWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRUISAmbientPosterViewController viewIfLoaded](self, "viewIfLoaded");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:](self, "_updateSceneWithCompletion:window:", v4, v5);

}

- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:orientation:](self, "_updateSceneWithCompletion:window:orientation:", v7, v6, objc_msgSend(v6, "_windowInterfaceOrientation"));

}

- (void)_updateSceneWithCompletion:(id)a3 window:(id)a4 orientation:(int64_t)a5
{
  void (**v8)(_QWORD);
  id v9;
  int v10;
  unint64_t presentationMode;
  int64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  void *v16;
  FBScene *scene;
  id *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[5];
  id v24;
  int64_t v25;
  int64_t v26;
  char v27;

  v8 = (void (**)(_QWORD))a3;
  v9 = a4;
  v10 = -[PRUISAmbientPosterViewController _appearState](self, "_appearState");
  presentationMode = self->_presentationMode;
  v12 = -[PRUISAmbientPosterViewController _renderingModeForVisibility:](self, "_renderingModeForVisibility:", self->_visibility);
  if (self->_scene)
  {
    if (v10)
      v13 = presentationMode == 2;
    else
      v13 = 0;
    v14 = v13;
    v15 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke;
    v23[3] = &unk_251535180;
    v27 = v14;
    v25 = v12;
    v26 = a5;
    v23[4] = self;
    v24 = v9;
    v16 = (void *)MEMORY[0x249513F24](v23);
    scene = self->_scene;
    if (v14 == 1)
    {
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_2;
      v21[3] = &unk_2515351A8;
      v18 = (id *)&v22;
      v22 = v8;
      -[FBScene performUpdate:withCompletion:](scene, "performUpdate:withCompletion:", v16, v21);
    }
    else
    {
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_3;
      v19[3] = &unk_2515351A8;
      v18 = (id *)&v20;
      v20 = v8;
      -[FBScene pruis_updateWithoutActivating:withCompletion:](scene, "pruis_updateWithoutActivating:withCompletion:", v16, v19);
      if (-[FBScene isActive](self->_scene, "isActive"))
        -[FBScene deactivate:](self->_scene, "deactivate:", &__block_literal_global_114);
    }

  }
  else if (v8)
  {
    v8[2](v8);
  }

}

void __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 64))
    v6 = 0;
  else
    v6 = 4294967293;
  objc_msgSend(v14, "setActivityMode:", v6);
  objc_msgSend(v14, "pui_setMode:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v14, "pui_setContent:", objc_msgSend(*(id *)(a1 + 32), "isPreview"));
  objc_msgSend(v14, "pui_setPosterBoundingShape:", objc_msgSend(*(id *)(a1 + 32), "boundingShape"));
  v7 = *(_QWORD *)(a1 + 56);
  v8 = objc_msgSend(v14, "interfaceOrientation");
  if (v7)
  {
    if (v8 != v7)
    {
      objc_msgSend(v14, "setInterfaceOrientation:", v7);
      objc_msgSend(v14, "pr_setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "_titleAlignmentForInterfaceOrientation:", v7));
      if (v5)
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isActive"))
        {
          v9 = *(void **)(a1 + 40);
          if (v9)
          {
            objc_msgSend(v9, "windowScene");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "_synchronizeDrawing");
            objc_msgSend(v10, "_synchronizedDrawingFence");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setAnimationFence:", v11);

            v12 = (void *)MEMORY[0x24BE0BD98];
            objc_msgSend(MEMORY[0x24BDF6F90], "inheritedAnimationDuration");
            objc_msgSend(v12, "settingsWithDuration:");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setAnimationSettings:", v13);

          }
        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateAmbientPresentationSettingsForSceneSettings:", v14);

}

uint64_t __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__PRUISAmbientPosterViewController__updateSceneWithCompletion_window_orientation___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)_titleAlignmentForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  unint64_t v6;

  -[PRUISAmbientPosterViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "ambientPosterViewController:titleAlignmentForInterfaceOrientation:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (unint64_t)_effectivePresentationMode
{
  unint64_t result;
  FBScene *scene;

  result = self->_presentationMode;
  if (result >= 2)
  {
    if (result == 2)
    {
      scene = self->_scene;
      if (!scene)
        return 1;
      result = -[FBScene contentState](scene, "contentState");
      if (result != 2)
        return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)_renderingModeForVisibility:(unint64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 1)
    v3 = 3;
  if (a3 == 2)
    return 1;
  else
    return v3;
}

- (void)_updateForCurrentIsSnapshot
{
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
}

- (void)_updateForCurrentVisibility
{
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", 0);
}

- (void)_updateForCurrentPresentationMode
{
  unint64_t v3;
  void *v4;
  UIView *snapshotContainerView;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = -[PRUISAmbientPosterViewController _effectivePresentationMode](self, "_effectivePresentationMode");
  if (!v3)
  {
    -[UIView setHidden:](self->_sceneView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_backgroundSceneLayerView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_foregroundSceneLayerView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_floatingSceneLayerView, "setHidden:", 1);
    snapshotContainerView = self->_snapshotContainerView;
    v6 = 1;
LABEL_7:
    -[UIView setHidden:](snapshotContainerView, "setHidden:", v6);
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    -[UIView setHidden:](self->_sceneView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_backgroundSceneLayerView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_foregroundSceneLayerView, "setHidden:", 1);
    -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_floatingSceneLayerView, "setHidden:", 1);
    snapshotContainerView = self->_snapshotContainerView;
    v6 = 0;
    goto LABEL_7;
  }
  if (v3 != 2)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  -[UIView setHidden:](self->_sceneView, "setHidden:", 0);
  -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_backgroundSceneLayerView, "setHidden:", 0);
  -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_foregroundSceneLayerView, "setHidden:", 0);
  -[PRUISAmbientPosterSceneLayerHostView setHidden:](self->_floatingSceneLayerView, "setHidden:", 0);
  -[UIView setHidden:](self->_snapshotContainerView, "setHidden:", 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __69__PRUISAmbientPosterViewController__updateForCurrentPresentationMode__block_invoke;
  v10 = &unk_251534E38;
  objc_copyWeak(&v11, &location);
  v4 = (void *)MEMORY[0x249513F24](&v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
LABEL_9:
  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:](self, "_updateSceneWithCompletion:", v4, v7, v8, v9, v10);

}

void __69__PRUISAmbientPosterViewController__updateForCurrentPresentationMode__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTouchDeliveryPolicies");

}

- (void)_enumerateSnapshotLayerViews:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, UIImageView *, uint64_t))a3 + 2))(v6, self->_snapshotForegroundLayerView, 2);
  (*((void (**)(id, UIImageView *, uint64_t))a3 + 2))(v6, self->_snapshotFloatingLayerView, 4);

}

- (id)_snapshotBundle:(id)a3 imageForLayer:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(a4)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      objc_msgSend(v5, "compositeSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(v5, "backgroundSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v5, "foregroundSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4uLL:
      objc_msgSend(v5, "floatingSnapshot");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v8;
      break;
    default:
      break;
  }

  return v7;
}

- (void)_updateForSnapshotBundle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  self->_loadedPosterSnapshotLayers = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__PRUISAmbientPosterViewController__updateForSnapshotBundle___block_invoke;
  v6[3] = &unk_251535210;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PRUISAmbientPosterViewController _enumerateSnapshotLayerViews:](self, "_enumerateSnapshotLayerViews:", v6);

}

void __61__PRUISAmbientPosterViewController__updateForSnapshotBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(_QWORD **)(a1 + 32);
  if ((v3[148] & a3) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = a2;
    objc_msgSend(v3, "_snapshotBundle:imageForLayer:", v6, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032) |= a3;
  }
  else
  {
    v8 = a2;
    objc_msgSend(v8, "setImage:", 0);
  }

}

- (void)_updateSnapshotLayerVisibility
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __66__PRUISAmbientPosterViewController__updateSnapshotLayerVisibility__block_invoke;
  v2[3] = &unk_251535098;
  v2[4] = self;
  -[PRUISAmbientPosterViewController _enumerateSnapshotLayerViews:](self, "_enumerateSnapshotLayerViews:", v2);
}

uint64_t __66__PRUISAmbientPosterViewController__updateSnapshotLayerVisibility__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setHidden:", (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184) & a3) == 0);
}

- (id)_currentSnapshotDefinition
{
  FBScene *scene;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  scene = self->_scene;
  if (scene
    && (-[FBScene settings](scene, "settings"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_25739C880),
        v4,
        v5))
  {
    -[FBScene settings](self->_scene, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PRUISAmbientPosterViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "ambientDisplayStyle");

  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x24BE74E28], "redmodeAmbientPosterSnapshotDefinition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE74E28], "defaultAmbientPosterSnapshotDefinition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (int64_t)_currentOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PRUISAmbientPosterViewController viewIfLoaded](self, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "_windowInterfaceOrientation");
  else
    v4 = 4;

  return v4;
}

- (void)_updateSnapshots
{
  -[PRUISAmbientPosterViewController _updateSnapshotsAnimated:](self, "_updateSnapshotsAnimated:", 1);
}

- (void)_updateSnapshotsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  PRSPosterConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[PRUISAmbientPosterViewController _shouldSnapshot](self, "_shouldSnapshot"))
  {
    v5 = self->_configuration;
    -[PRUISAmbientPosterViewController _currentSnapshotDefinition](self, "_currentSnapshotDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](PRUISPosterSnapshotRequest, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", v5, v6, -[PRUISAmbientPosterViewController _currentOrientation](self, "_currentOrientation"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[PRUISAmbientPosterViewController snapshotController](self, "snapshotController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentSnapshotBundleForRequest:error:", v9, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PRUISAmbientPosterViewController _updateForSnapshotBundle:](self, "_updateForSnapshotBundle:", v8);
    else
      -[PRUISAmbientPosterViewController _fetchSnapshotsWithRequest:animated:](self, "_fetchSnapshotsWithRequest:animated:", v9, v3);

  }
}

- (void)_takeNewSnapshots
{
  PRSPosterConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  PRSPosterConfiguration *v7;
  _QWORD v8[4];
  PRSPosterConfiguration *v9;

  if (-[PRUISAmbientPosterViewController _shouldSnapshot](self, "_shouldSnapshot"))
  {
    v3 = self->_configuration;
    -[PRUISAmbientPosterViewController _currentSnapshotDefinition](self, "_currentSnapshotDefinition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRUISPosterSnapshotRequest snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:](PRUISPosterSnapshotRequest, "snapshotRequestForPRSPosterConfiguration:definition:interfaceOrientation:", v3, v4, -[PRUISAmbientPosterViewController _currentOrientation](self, "_currentOrientation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRUISAmbientPosterViewController snapshotController](self, "snapshotController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke;
    v8[3] = &unk_251535238;
    v9 = v3;
    v7 = v3;
    objc_msgSend(v6, "executeSnapshotRequest:completion:", v5, v8);

  }
}

void __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  PRUISLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a3 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2445ED000, v8, OS_LOG_TYPE_DEFAULT, "Regenerate snapshot for configuration %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)_fetchSnapshotsWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6;
  PRSPosterConfiguration *configuration;
  PRSPosterConfiguration *v8;
  void *v9;
  PRSPosterConfiguration *v10;
  _QWORD v11[4];
  PRSPosterConfiguration *v12;
  id v13;
  BOOL v14;
  id location;

  v6 = a3;
  configuration = self->_configuration;
  if (configuration)
  {
    v8 = configuration;
    objc_initWeak(&location, self);
    -[PRUISAmbientPosterViewController snapshotController](self, "snapshotController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke;
    v11[3] = &unk_2515352C8;
    objc_copyWeak(&v13, &location);
    v10 = v8;
    v12 = v10;
    v14 = a4;
    objc_msgSend(v9, "executeSnapshotRequest:completion:", v6, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (!v6 || v7)
  {
    PRUISLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_cold_1();

  }
  else if (WeakRetained)
  {
    v11 = v6;
    BSDispatchMain();

  }
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_173(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_2;
  v10 = &unk_251534BE0;
  v2 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v2;
  v3 = MEMORY[0x249513F24](&v7);
  v4 = (void *)v3;
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(*(id *)(a1 + 32), "view", v7, v8, v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v4, &__block_literal_global_175, 0.25);

  }
  else
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  objc_msgSend(*(id *)(a1 + 40), "backgroundLayerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1056);
  objc_msgSend(*(id *)(a1 + 40), "foregroundLayerImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  objc_msgSend(v6, "floatingLayerImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

}

- (void)_noteWindowWillRotate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF8018]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[PRUISAmbientPosterViewController viewIfLoaded](self, "viewIfLoaded");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "integerValue");

  -[PRUISAmbientPosterViewController _updateSceneWithCompletion:window:orientation:](self, "_updateSceneWithCompletion:window:orientation:", 0, v10, v11);
}

- (void)_registerForAmbientPresentationTraitChanges
{
  void *v3;
  void *v4;
  void *v5;
  UITraitChangeRegistration *v6;
  UITraitChangeRegistration *ambientPresentationTraitChangeRegistration;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISAmbientPosterViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, &__block_literal_global_179);
  v6 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
  ambientPresentationTraitChangeRegistration = self->_ambientPresentationTraitChangeRegistration;
  self->_ambientPresentationTraitChangeRegistration = v6;

}

void __79__PRUISAmbientPosterViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PRUISLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2[122], "pui_shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isAmbientPresented");
    objc_msgSend(v3, "ambientDisplayStyle");
    AMUIAmbientDisplayStyleString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 1024;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "Updated ambient presentation traits for scene %{public}@ [ isAmbientPresented=%{BOOL}d ; ambientDisplayStyle=%{public}@ ]",
      (uint8_t *)&v8,
      0x1Cu);

  }
  objc_msgSend(v2, "_updateSceneWithCompletion:", 0);

}

- (void)_updateAmbientPresentationSettingsForSceneSettings:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PRUISAmbientPosterViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAmbientPresented:", objc_msgSend(v4, "isAmbientPresented"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAmbientDisplayStyle:", objc_msgSend(v4, "ambientDisplayStyle"));

}

- (id)_posterProviderForPosterPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PRUISAmbientPosterViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "ambientPosterViewControllerRequestExtensionInstanceIdentifier:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BE74D10], "extensionInstanceForPath:instanceIdentifier:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setupScene
{
  void (**v3)(void);
  FBScene *scene;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  UIScenePresenter *v9;
  UIScenePresenter *scenePresenter;
  UIView *v11;
  void *v12;
  UIView *sceneView;
  uint8_t v14[16];
  _QWORD v15[6];
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__PRUISAmbientPosterViewController__setupScene__block_invoke;
  v15[3] = &unk_251535358;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  v15[5] = &v18;
  v3 = (void (**)(void))MEMORY[0x249513F24](v15);
  v3[2]();
  scene = self->_scene;
  if (!scene)
  {
    PRUISLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create new ambient poster scene. Trying again.", v14, 2u);
    }

    *((_BYTE *)v19 + 24) = 1;
    ((void (*)(void (**)(void)))v3[2])(v3);
    scene = self->_scene;
  }
  -[FBScene uiPresentationManager](scene, "uiPresentationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createPresenterWithIdentifier:", v8);
  v9 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v9;

  -[UIScenePresenter modifyPresentationContext:](self->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_189);
  -[UIScenePresenter activate](self->_scenePresenter, "activate");
  -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[PRUISAmbientPosterViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[UIView setFrame:](v11, "setFrame:");
  -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  objc_msgSend(v12, "insertSubview:belowSubview:", v11, self->_backgroundSceneLayerView);
  -[PRUISAmbientPosterViewController _updateSceneLayerPresenters](self, "_updateSceneLayerPresenters");
  -[PRUISAmbientPosterViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
  sceneView = self->_sceneView;
  self->_sceneView = v11;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);
}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[7];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[121], "_path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_posterProviderForPosterPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "_currentOrientation");
    v7 = (void *)MEMORY[0x24BE380F0];
    v8 = *MEMORY[0x24BE74F30];
    objc_msgSend(v3[121], "_path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pr_createPosterSceneWithRole:path:instance:", v8, v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addExtension:", objc_opt_class());
    objc_msgSend(v10, "setDelegate:", v3);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __47__PRUISAmbientPosterViewController__setupScene__block_invoke_2;
    v16[3] = &unk_251535330;
    v11 = *(_QWORD *)(a1 + 32);
    v16[5] = v3;
    v16[6] = v6;
    v16[4] = v11;
    objc_msgSend(v10, "pruis_updateWithoutActivating:", v16);
    objc_storeStrong(v3 + 122, v10);
    objc_msgSend(v5, "instanceIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v3[125];
    v3[125] = (id)v12;

    if (v10)
    {
      PRUISLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "pui_shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_2445ED000, v14, OS_LOG_TYPE_DEFAULT, "Created new ambient poster scene: %@", buf, 0xCu);

      }
    }
    else
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
LABEL_9:

        goto LABEL_10;
      }
      PRUISLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2445ED000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create new ambient poster scene again.", buf, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "displayConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForeground:", 1);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setInterfaceOrientation:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "pr_setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "_titleAlignmentForInterfaceOrientation:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v4, "setDisplayConfiguration:", v6);
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  objc_msgSend(v4, "setActivityMode:", 4294967293);
  objc_msgSend(v4, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isExtensionUserInteractionEnabled"));
  objc_msgSend(*(id *)(a1 + 40), "_updateAmbientPresentationSettingsForSceneSettings:", v4);

}

void __47__PRUISAmbientPosterViewController__setupScene__block_invoke_187(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", v3);

}

- (void)_teardownScene
{
  FBScene *scene;
  NSUUID *sceneExtensionInstanceIdentifier;
  UIView *sceneView;
  UIScenePresenter *scenePresenter;
  id WeakRetained;

  -[FBScene pui_invalidateWithCompletion:](self->_scene, "pui_invalidateWithCompletion:", 0);
  scene = self->_scene;
  self->_scene = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_sceneExtensionInstanceIdentifier && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "ambientPosterViewController:relinquishExtensionInstanceIdentifier:", self, self->_sceneExtensionInstanceIdentifier);
    sceneExtensionInstanceIdentifier = self->_sceneExtensionInstanceIdentifier;
    self->_sceneExtensionInstanceIdentifier = 0;

  }
  -[UIView removeFromSuperview](self->_sceneView, "removeFromSuperview");
  sceneView = self->_sceneView;
  self->_sceneView = 0;

  -[UIScenePresenter deactivate](self->_scenePresenter, "deactivate");
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  -[PRUISAmbientPosterViewController _resetScreenWakeStateForTeardown:](self, "_resetScreenWakeStateForTeardown:", 1);
  -[PRUISAmbientPosterSceneLayerHostView invalidate](self->_backgroundSceneLayerView, "invalidate");
  -[PRUISAmbientPosterSceneLayerHostView invalidate](self->_foregroundSceneLayerView, "invalidate");
  -[PRUISAmbientPosterSceneLayerHostView invalidate](self->_floatingSceneLayerView, "invalidate");

}

- (void)_updateSnapshotOpacities
{
  -[UIImageView setAlpha:](self->_snapshotBackgroundLayerView, "setAlpha:", self->_backgroundOpacity);
  -[UIImageView setAlpha:](self->_snapshotForegroundLayerView, "setAlpha:", self->_foregroundOpacity);
  -[UIImageView setAlpha:](self->_snapshotFloatingLayerView, "setAlpha:", self->_floatingOpacity);
}

- (void)_updateSeparatedLayerHosting
{
  uint64_t v3;

  if (BSFloatIsOne() && BSFloatIsOne() && BSFloatIsOne())
  {
    v3 = 0;
  }
  else
  {
    -[PRUISAmbientPosterSceneLayerHostView setAlpha:](self->_backgroundSceneLayerView, "setAlpha:", self->_backgroundOpacity);
    -[PRUISAmbientPosterSceneLayerHostView setAlpha:](self->_foregroundSceneLayerView, "setAlpha:", self->_foregroundOpacity);
    -[PRUISAmbientPosterSceneLayerHostView setAlpha:](self->_floatingSceneLayerView, "setAlpha:", self->_floatingOpacity);
    v3 = 1;
  }
  -[PRUISAmbientPosterSceneLayerHostView setActive:](self->_backgroundSceneLayerView, "setActive:", v3);
  -[PRUISAmbientPosterSceneLayerHostView setActive:](self->_foregroundSceneLayerView, "setActive:", v3);
  -[PRUISAmbientPosterSceneLayerHostView setActive:](self->_floatingSceneLayerView, "setActive:", v3);
}

- (void)_updateSceneLayerPresenters
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[FBScene layerManager](self->_scene, "layerManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    v11 = (double)(uint64_t)*MEMORY[0x24BE74E58];
    v12 = (double)(uint64_t)*MEMORY[0x24BE74E78];
    v13 = (double)(uint64_t)*MEMORY[0x24BE74E68];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v4);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "level");
        v17 = v16;
        if (objc_msgSend(v15, "type") == 1)
        {
          if (v17 == v11)
          {
            v9 = objc_msgSend(v15, "contextID");
          }
          else if (v17 == v12)
          {
            v7 = objc_msgSend(v15, "contextID");
          }
          else if (v17 == v13)
          {
            v8 = objc_msgSend(v15, "contextID");
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }

  if (-[PRUISAmbientPosterSceneLayerHostView setContextID:scene:](self->_backgroundSceneLayerView, "setContextID:scene:", v9, self->_scene)|| -[PRUISAmbientPosterSceneLayerHostView setContextID:scene:](self->_foregroundSceneLayerView, "setContextID:scene:", v7, self->_scene)|| -[PRUISAmbientPosterSceneLayerHostView setContextID:scene:](self->_floatingSceneLayerView, "setContextID:scene:", v8, self->_scene))
  {
    -[PRUISAmbientPosterViewController _updateSeparatedLayerHosting](self, "_updateSeparatedLayerHosting");
  }
}

- (void)_updateTouchDeliveryPolicies
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *touchDeliveryPolicyAssertions;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  __CFString *v35;
  NSObject *v36;
  unsigned int v37;
  const __CFString *v38;
  unint64_t presentationMode;
  FBScene *scene;
  void *v41;
  void *v42;
  __int128 v43;
  unsigned int v44;
  NSObject *obj;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  id v57;
  id location;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  PRUISAmbientPosterViewController *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  FBScene *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssertMain();
  if (self->_shouldShareTouchesWithHost
    && self->_presentationMode == 2
    && self->_scene
    && (-[PRUISAmbientPosterViewController view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_window"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    -[FBScene layerManager](self->_scene, "layerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layers");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[NSMutableDictionary allKeys](self->_touchDeliveryPolicyAssertions, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    -[PRUISAmbientPosterViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v10, "_contextId");

    PRUISLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v64 = self;
      v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_2445ED000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Updating touch delivery policies for layers: %{public}@", buf, 0x16u);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v6;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
    if (v12)
    {
      v46 = *(_QWORD *)v60;
      *(_QWORD *)&v13 = 138412802;
      v43 = v13;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(obj);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "contextID", v43);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "removeObject:", v16);

          touchDeliveryPolicyAssertions = self->_touchDeliveryPolicyAssertions;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](touchDeliveryPolicyAssertions, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(touchDeliveryPolicyAssertions) = v19 == 0;

          if ((_DWORD)touchDeliveryPolicyAssertions)
          {
            v20 = (__CFString *)objc_alloc_init(MEMORY[0x24BE0B6F0]);
            objc_msgSend(MEMORY[0x24BE0B6E8], "policyRequiringSharingOfTouchesDeliveredToChildContextId:withHostContextId:", v15, v44);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString endpoint](v20, "endpoint");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setAssertionEndpoint:", v22);

            objc_initWeak(&location, self);
            v52 = MEMORY[0x24BDAC760];
            v53 = 3221225472;
            v54 = __64__PRUISAmbientPosterViewController__updateTouchDeliveryPolicies__block_invoke;
            v55 = &unk_2515353A0;
            objc_copyWeak(&v57, &location);
            v23 = v21;
            v56 = v23;
            BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              PRUISLogCommon();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v43;
                v64 = self;
                v65 = 2114;
                v66 = v20;
                v67 = 2050;
                v68 = v15;
                _os_log_impl(&dword_2445ED000, v25, OS_LOG_TYPE_DEFAULT, "[%@] Saving touch policy assertion %{public}@ for context id 0x%{public}llx", buf, 0x20u);
              }

              v26 = self->_touchDeliveryPolicyAssertions;
              if (!v26)
              {
                v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
                v28 = self->_touchDeliveryPolicyAssertions;
                self->_touchDeliveryPolicyAssertions = v27;

                v26 = self->_touchDeliveryPolicyAssertions;
              }
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v20, v29);

              objc_msgSend(v24, "ipc_addPolicy:", v23);
            }

            objc_destroyWeak(&v57);
            objc_destroyWeak(&location);

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v74, 16);
      }
      while (v12);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v30 = v47;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v73, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v49 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_touchDeliveryPolicyAssertions, "objectForKey:", v34);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString invalidate](v35, "invalidate");
          -[NSMutableDictionary removeObjectForKey:](self->_touchDeliveryPolicyAssertions, "removeObjectForKey:", v34);
          PRUISLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = objc_msgSend(v34, "unsignedIntValue");
            *(_DWORD *)buf = 138412802;
            v64 = self;
            v65 = 2114;
            v66 = v35;
            v67 = 2050;
            v68 = v37;
            _os_log_impl(&dword_2445ED000, v36, OS_LOG_TYPE_DEFAULT, "[%@] Invalidating assertion %{public}@ for context id 0x%{public}llx", buf, 0x20u);
          }

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v73, 16);
      }
      while (v31);
    }

  }
  else
  {
    PRUISLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldShareTouchesWithHost)
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      presentationMode = self->_presentationMode;
      scene = self->_scene;
      -[PRUISAmbientPosterViewController view](self, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "_window");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v64 = self;
      v65 = 2114;
      v66 = v38;
      v67 = 2050;
      v68 = presentationMode;
      v69 = 2114;
      v70 = scene;
      v71 = 2114;
      v72 = v42;
      _os_log_impl(&dword_2445ED000, obj, OS_LOG_TYPE_DEFAULT, "[%@] Couldn't update touch delivery policies: _shouldShareTouchesWithHost=%{public}@; _presentationMode=%{public"
        "}ld; _scene=%{public}@; window=%{public}@",
        buf,
        0x34u);

    }
  }

}

void __64__PRUISAmbientPosterViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PRUISLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = WeakRetained;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_clearTouchDeliveryPolicies
{
  NSObject *v3;
  int v4;
  PRUISAmbientPosterViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  PRUISLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_2445ED000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Clearing any touch delivery policies", (uint8_t *)&v4, 0xCu);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_touchDeliveryPolicyAssertions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_200);
  -[NSMutableDictionary removeAllObjects](self->_touchDeliveryPolicyAssertions, "removeAllObjects");
}

uint64_t __63__PRUISAmbientPosterViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_enumerateSceneObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_sceneObservers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_sceneObservers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_backlightLuminanceTraitDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, int);
  void *v14;
  PRUISAmbientPosterViewController *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, int);
  void *v19;
  PRUISAmbientPosterViewController *v20;

  v6 = a4;
  objc_msgSend(a3, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_backlightLuminance");

  if (!v8)
  {
    -[PRUISAmbientPosterViewController _screenWillTurnOff](self, "_screenWillTurnOff");
    v9 = (void *)MEMORY[0x24BE0BF08];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke;
    v19 = &unk_251534F60;
    v20 = self;
    v10 = &v16;
    goto LABEL_5;
  }
  if (!objc_msgSend(v6, "_backlightLuminance"))
  {
    -[PRUISAmbientPosterViewController _screenWillTurnOn](self, "_screenWillTurnOn");
    v9 = (void *)MEMORY[0x24BE0BF08];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke_2;
    v14 = &unk_251534F60;
    v15 = self;
    v10 = &v11;
LABEL_5:
    objc_msgSend(v9, "addAlongsideAnimations:completion:", 0, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_screenDidTurnOff");
  return result;
}

uint64_t __94__PRUISAmbientPosterViewController__backlightLuminanceTraitDidChange_previousTraitCollection___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_screenDidTurnOn");
  return result;
}

- (void)_screenDidTurnOn
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[PRUISAmbientPosterViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  PRUISLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring screen turn on because we're not active", (uint8_t *)&v12, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ observed screen turn on", (uint8_t *)&v12, 0xCu);

  }
  if (!self->_clientWantsScreenWakeEvents)
  {
    if (self->_clientEverWantedScreenWakeEvents)
    {
      PRUISLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v9;
        _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring screen wake event because scene %{public}@ wanted them and later disabled them", (uint8_t *)&v12, 0xCu);

      }
    }
    else
    {
      ++self->_pendingScreenWakeCount;
      PRUISLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pendingScreenWakeCount);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "Deferring screen wake event for scene %{public}@. total deferred: %@", (uint8_t *)&v12, 0x16u);

      }
    }
LABEL_10:

    return;
  }
  PRUISLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_2445ED000, v7, OS_LOG_TYPE_DEFAULT, "Sending prompt screen wake event to scene %{public}@", (uint8_t *)&v12, 0xCu);

  }
  -[FBScene pui_postSignificantEvent:](self->_scene, "pui_postSignificantEvent:", 3);
}

- (void)_resetScreenWakeStateForTeardown:(BOOL)a3
{
  self->_pendingScreenWakeCount = 0;
  self->_clientWantsScreenWakeEvents = 0;
  self->_clientEverWantedScreenWakeEvents = 0;
}

- (void)_setClientWantsScreenWakeEvents:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _BOOL4 clientWantsScreenWakeEvents;
  _BOOL4 clientEverWantedScreenWakeEvents;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_clientWantsScreenWakeEvents != a3)
  {
    v3 = a3;
    self->_clientWantsScreenWakeEvents = a3;
    PRUISLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      clientWantsScreenWakeEvents = self->_clientWantsScreenWakeEvents;
      clientEverWantedScreenWakeEvents = self->_clientEverWantedScreenWakeEvents;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pendingScreenWakeCount);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v6;
      v14 = 1024;
      v15 = clientWantsScreenWakeEvents;
      v16 = 1024;
      v17 = clientEverWantedScreenWakeEvents;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ wants screen wake events: %{BOOL}u  ever wanted screen wake events: %{BOOL}u  pending wake events: %@", (uint8_t *)&v12, 0x22u);

    }
    if (self->_clientWantsScreenWakeEvents && !self->_clientEverWantedScreenWakeEvents && self->_pendingScreenWakeCount)
    {
      PRUISLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_2445ED000, v10, OS_LOG_TYPE_DEFAULT, "Sending deferred screen wake event to scene %{public}@", (uint8_t *)&v12, 0xCu);

      }
      -[FBScene pui_postSignificantEvent:](self->_scene, "pui_postSignificantEvent:", 3);
      self->_pendingScreenWakeCount = 0;
    }
    if (v3)
      self->_clientEverWantedScreenWakeEvents = 1;
  }
}

- (BOOL)isPreview
{
  return self->_isPreview;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)visibleSnapshotLayers
{
  return self->_visibleSnapshotLayers;
}

- (BOOL)shouldShareTouchesWithHost
{
  return self->_shouldShareTouchesWithHost;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (PRUISAmbientPosterViewControllerDelegate)delegate
{
  return (PRUISAmbientPosterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__snapshotController, 0);
  objc_storeStrong((id *)&self->_sceneObservers, 0);
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_floatingSceneLayerView, 0);
  objc_storeStrong((id *)&self->_foregroundSceneLayerView, 0);
  objc_storeStrong((id *)&self->_backgroundSceneLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotFloatingLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotForegroundLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotBackgroundLayerView, 0);
  objc_storeStrong((id *)&self->_snapshotContainerView, 0);
  objc_storeStrong((id *)&self->_snapshotControllerKeepaliveAssertion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_reconnectPolicy, 0);
  objc_storeStrong((id *)&self->_sceneExtensionInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)addSceneObserver:(id)a3
{
  PRUISAmbientPosterViewController *v4;
  NSHashTable *sceneObservers;
  uint64_t v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  sceneObservers = v4->_sceneObservers;
  if (!sceneObservers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v4->_sceneObservers;
    v4->_sceneObservers = (NSHashTable *)v6;

    sceneObservers = v4->_sceneObservers;
  }
  -[NSHashTable addObject:](sceneObservers, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)removeSceneObserver:(id)a3
{
  PRUISAmbientPosterViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_sceneObservers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)initWithBoundingShape:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PRUISAmbientPosterViewController.m");
  v16 = 1024;
  v17 = 120;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

void __53__PRUISAmbientPosterViewController__takeNewSnapshots__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2445ED000, v0, v1, "Failed to regenerate snapshot for configuration %{public}@: error %@");
}

void __72__PRUISAmbientPosterViewController__fetchSnapshotsWithRequest_animated___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2445ED000, v0, v1, "Failed to fetch snapshot for configuration %{public}@: error %@");
}

@end
