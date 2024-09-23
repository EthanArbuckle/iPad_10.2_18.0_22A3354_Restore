@implementation SBElasticVolumeViewController

- (SBElasticVolumeViewController)initWithDataSource:(id)a3
{
  SBElasticVolumeViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImageSymbolConfiguration *routeImageSymbolConfiguration;
  MRUVolumeHUDRouteDescriptionProvider *v8;
  MRUVolumeHUDRouteDescriptionProvider *routeDescriptionProvider;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBElasticVolumeViewController;
  v3 = -[SBElasticValueViewController initWithDataSource:](&v11, sel_initWithDataSource_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 6, 2, 26.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "_configurationWithHierarchicalColors:", MEMORY[0x1E0C9AA60]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    routeImageSymbolConfiguration = v3->_routeImageSymbolConfiguration;
    v3->_routeImageSymbolConfiguration = (UIImageSymbolConfiguration *)v6;

    v8 = (MRUVolumeHUDRouteDescriptionProvider *)objc_alloc_init(MEMORY[0x1E0D47BE0]);
    routeDescriptionProvider = v3->_routeDescriptionProvider;
    v3->_routeDescriptionProvider = v8;

    -[MRUVolumeHUDRouteDescriptionProvider setDelegate:](v3->_routeDescriptionProvider, "setDelegate:", v3);
    v3->_mediaProvidedRouteDisplayInfoNeedsUpdate = 1;

  }
  return v3;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  NSArray *v21;
  NSArray *physicalButtonSceneTargets;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBElasticVolumeViewController;
  -[SBElasticValueViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v23, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_FBSScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DA9EB8];
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetWithPhysicalButton:generation:auditToken:identifier:", 1, 1, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DA9EB8];
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "auditToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetWithPhysicalButton:generation:auditToken:identifier:", 2, 1, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA9EA8], "targetWithSceneIdentity:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButtonTarget:", v13);
    objc_msgSend(v18, "addButtonTarget:", v17);
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "arrayWithObject:", v20);
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = v21;

  }
  else
  {
    v9 = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = 0;
  }

}

- (id)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (int64_t)triggerButton
{
  return 10;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 8;
}

- (id)dataSource
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBElasticVolumeViewController;
  -[SBElasticValueViewController dataSource](&v3, sel_dataSource);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)updateActiveRouteDisplay:(id *)a3
{
  MRUVolumeHUDRouteDescriptionProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImageSymbolConfiguration *v10;
  UIImageSymbolConfiguration *routeImageSymbolConfiguration;
  UIImageSymbolConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 mediaProvidedRouteDisplayInfoNeedsUpdate;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[4];
  MRUVolumeHUDRouteDescriptionProvider *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = self->_routeDescriptionProvider;
  -[MRUVolumeHUDRouteDescriptionProvider outputDeviceAsset](v5, "outputDeviceAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "kind"))
  {
    objc_msgSend(v6, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", self->_routeImageSymbolConfiguration);
    v10 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    routeImageSymbolConfiguration = v10;
    if (!v10)
      routeImageSymbolConfiguration = self->_routeImageSymbolConfiguration;
    v12 = routeImageSymbolConfiguration;

    objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBElasticRouteDisplayContext routeContextWithName:glyphImage:](SBElasticRouteDisplayContext, "routeContextWithName:glyphImage:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "packageDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__SBElasticVolumeViewController_updateActiveRouteDisplay___block_invoke;
    v21[3] = &unk_1E8EAD998;
    v22 = v5;
    v15 = (void *)MEMORY[0x1D17E5550](v21);
    +[SBElasticRouteDisplayContext routeContextWithName:valueTransformer:glyphPackage:](SBElasticRouteDisplayContext, "routeContextWithName:valueTransformer:glyphPackage:", v7, v15, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_retainAutorelease(v14);
  *a3 = v16;
  mediaProvidedRouteDisplayInfoNeedsUpdate = self->_mediaProvidedRouteDisplayInfoNeedsUpdate;
  self->_mediaProvidedRouteDisplayInfoNeedsUpdate = 0;
  -[SBElasticVolumeViewController log](self, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v6, "type");
    *(_DWORD *)buf = 134218498;
    v24 = v19;
    v25 = 2112;
    v26 = v7;
    v27 = 1024;
    v28 = mediaProvidedRouteDisplayInfoNeedsUpdate;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Set route display info for audio route: (%li) named '%@'; updated: %{BOOL}u",
      buf,
      0x1Cu);
  }

  return mediaProvidedRouteDisplayInfoNeedsUpdate;
}

uint64_t __58__SBElasticVolumeViewController_updateActiveRouteDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "packageStateForVolumeValue:");
}

- (unint64_t)layoutAxisForInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && (unint64_t)(a3 - 3) >= 2)
    return 2;
  else
    return 1;
}

- (double)interactiveValueUpdateDiscontinuityInterval
{
  return 0.1;
}

- (id)createSliderView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBElasticVolumeViewController;
  -[SBElasticValueViewController createSliderView](&v4, sel_createSliderView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBehaviorIdentifier:", 1);
  objc_msgSend(v2, "setShouldIncludeVolumeButtonsInput:", 1);
  return v2;
}

- (id)sliderAccessibilityIdentifier
{
  return CFSTR("sb-volume-hud");
}

- (void)_debugHandleNextRoute
{
  -[MRUVolumeHUDRouteDescriptionProvider cycleOverridePackageDescriptions](self->_routeDescriptionProvider, "cycleOverridePackageDescriptions");
}

- (void)_debugHandleResetRoute
{
  -[MRUVolumeHUDRouteDescriptionProvider resetOverridePackageDescription](self->_routeDescriptionProvider, "resetOverridePackageDescription");
}

- (void)volumeHUDRouteDescriptionProvider:(id)a3 didChangeOutputDeviceAsset:(id)a4
{
  self->_mediaProvidedRouteDisplayInfoNeedsUpdate = 1;
  -[SBElasticValueViewController reloadData](self, "reloadData", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_routeDescriptionProvider, 0);
  objc_storeStrong((id *)&self->_routeImageSymbolConfiguration, 0);
}

@end
