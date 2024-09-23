@implementation PRSceneViewController

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4
{
  return (PRSceneViewController *)-[PRSceneViewController _initWithProvider:contents:configurableOptions:configuredProperties:previewing:](self, "_initWithProvider:contents:configurableOptions:configuredProperties:previewing:", a3, a4, 0, 0, 0);
}

- (id)_initWithProvider:(id)a3 contents:(id)a4 previewing:(BOOL)a5
{
  return -[PRSceneViewController _initWithProvider:contents:configurableOptions:configuredProperties:previewing:](self, "_initWithProvider:contents:configurableOptions:configuredProperties:previewing:", a3, a4, 0, 0, a5);
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5
{
  return (PRSceneViewController *)-[PRSceneViewController _initWithProvider:contents:configurableOptions:configuredProperties:previewing:](self, "_initWithProvider:contents:configurableOptions:configuredProperties:previewing:", a3, a4, a5, 0, 0);
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configuredProperties:(id)a5
{
  return (PRSceneViewController *)-[PRSceneViewController _initWithProvider:contents:configurableOptions:configuredProperties:previewing:](self, "_initWithProvider:contents:configurableOptions:configuredProperties:previewing:", a3, a4, 0, a5, 0);
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6
{
  return (PRSceneViewController *)-[PRSceneViewController _initWithProvider:contents:configurableOptions:configuredProperties:previewing:](self, "_initWithProvider:contents:configurableOptions:configuredProperties:previewing:", a3, a4, a5, a6, 0);
}

- (id)_initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 previewing:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  PRSceneViewController *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v7 = a7;
  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v7)
  {
    v19 = CFSTR("PRSceneViewControllerAdditionalInfoKeyPreviewing");
    v20[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:](self, "initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:", v12, v13, v14, v15, v16);

  return v17;
}

- (PRSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PRSceneViewController *v52;
  PRSceneViewController *v53;
  void *v54;
  uint64_t v55;
  PFServerPosterIdentity *contentsIdentity;
  uint64_t v57;
  PRPosterConfiguredProperties *configuredProperties;
  uint64_t v59;
  FBScene *scene;
  FBScene *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  id obj;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  PRSceneViewController *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  objc_super v91;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v80 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("provider"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.1();
LABEL_57:
    objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68DC04);
  }
  v17 = v16;
  v18 = v13;
  NSClassFromString(CFSTR("PFPosterPath"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68DC68);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.2();
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68DCCCLL);
  }

  v19 = objc_opt_class();
  v20 = v18;
  obj = a3;
  if (v19)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;
  v79 = v20;

  if (v22)
  {
    objc_msgSend(v80, "extension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "posterExtensionBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "provider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = BSEqualStrings();

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("provider and path mismatch! provider=%@ path=%@"), v80, v22);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.6();
      objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B68DD90);
    }
  }
  v28 = v14;
  if (v28)
  {
    NSClassFromString(CFSTR("PRPosterConfigurableOptions"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurableOptionsClass]"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.5();
      objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18B68DDF4);
    }
  }

  v29 = v15;
  if (v29)
  {
    NSClassFromString(CFSTR("PRPosterConfiguredProperties"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.4();
      goto LABEL_57;
    }
  }

  objc_msgSend((id)objc_opt_class(), "role");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("role != nil"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:].cold.3();
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B68DD30);
  }
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v29)
  {
    objc_msgSend(v30, "configuredProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:](PRPosterPathUtilities, "loadConfiguredPropertiesForPath:error:", v22, 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v34;

  }
  v35 = (void *)objc_msgSend(v29, "mutableCopy");
  objc_msgSend(v29, "complicationLayout");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(v31, "complicationLayout");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      +[PRPosterPathUtilities loadComplicationLayoutForPath:error:](PRPosterPathUtilities, "loadComplicationLayoutForPath:error:", v22, 0);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = (uint64_t)v39;

    objc_msgSend(v35, "setComplicationLayout:", v36);
  }
  v74 = (void *)v36;
  objc_msgSend(v29, "renderingConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
    objc_msgSend(v31, "renderingConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      +[PRPosterPathUtilities loadRenderingConfigurationForPath:error:](PRPosterPathUtilities, "loadRenderingConfigurationForPath:error:", v22, 0);
      v43 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v43;

    objc_msgSend(v35, "setRenderingConfiguration:", v40);
  }
  v76 = v31;
  v77 = v22;
  v75 = v35;
  v44 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyPreviewing"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v45, "BOOLValue");

  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeySignificantEventsCounter"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v46, "unsignedIntegerValue");

  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyShowHeaderElements"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyShowComplications"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyRenderingMode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyCreateSceneInCurrentProcess"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("PRSceneViewControllerAdditionalInfoKeyBoundingShape"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "integerValue");
  v70 = PUIPosterBoundingShapeFromInt();

  v91.receiver = self;
  v91.super_class = (Class)PRSceneViewController;
  v52 = -[PRSceneViewController initWithNibName:bundle:](&v91, sel_initWithNibName_bundle_, 0, 0);
  v53 = v52;
  if (v52)
  {
    v69 = v49;
    v54 = v48;
    objc_storeStrong((id *)&v52->_extensionInstance, obj);
    objc_msgSend(v77, "identity");
    v55 = objc_claimAutoreleasedReturnValue();
    contentsIdentity = v53->_contentsIdentity;
    v53->_contentsIdentity = (PFServerPosterIdentity *)v55;

    v57 = objc_msgSend(v44, "copy");
    configuredProperties = v53->_configuredProperties;
    v53->_configuredProperties = (PRPosterConfiguredProperties *)v57;

    v53->_sceneUserInteractionEnabled = 1;
    -[PRSceneViewController _configureUsingPath:](v53, "_configureUsingPath:", v79);
    if (objc_msgSend(v50, "BOOLValue"))
      objc_msgSend(MEMORY[0x1E0D22960], "pr_createPosterSceneWithinCurrentProcessForRole:path:", v78, v79);
    else
      objc_msgSend(MEMORY[0x1E0D22960], "pr_createPosterSceneWithRole:path:instance:", v78, v79, v80);
    v59 = objc_claimAutoreleasedReturnValue();
    scene = v53->_scene;
    v53->_scene = (FBScene *)v59;

    -[FBScene setDelegate:](v53->_scene, "setDelegate:", v53);
    v61 = v53->_scene;
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke;
    v82[3] = &unk_1E2184F20;
    v83 = v69;
    v90 = v71;
    v84 = v47;
    v85 = v54;
    v88 = v70;
    v86 = v28;
    v87 = v53;
    v89 = v72;
    -[FBScene configureParameters:](v61, "configureParameters:", v82);

    v48 = v54;
    v49 = v69;
  }

  return v53;
}

void __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_2;
  v12[3] = &unk_1E2184EF8;
  v13 = *(id *)(a1 + 32);
  v20 = *(_BYTE *)(a1 + 88);
  v14 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v15 = v5;
  v18 = v6;
  v16 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 80);
  v17 = v7;
  v19 = v8;
  v9 = a2;
  objc_msgSend(v9, "updateSettingsWithBlock:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_3;
  v10[3] = &unk_1E21845D0;
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v9, "updateClientSettingsWithBlock:", v10);

}

void __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");
    v3 = v11;
    v6 = v5;
  }
  else
  {
    v6 = *(unsigned __int8 *)(a1 + 88);
  }
  objc_msgSend(v3, "pui_setContent:", v6);
  v7 = *(void **)(a1 + 40);
  if (v7)
    objc_msgSend(v11, "pui_setShowsHeaderElements:", objc_msgSend(v7, "BOOLValue"));
  v8 = *(void **)(a1 + 48);
  if (v8)
    objc_msgSend(v11, "pui_setShowsHeaderElements:", objc_msgSend(v8, "BOOLValue"));
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v11, "pui_setPosterBoundingShape:");
  objc_msgSend(v11, "pr_setPosterConfigurableOptions:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 1048), "titleStyleConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pr_setPosterTitleStyleConfiguration:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 1048), "ambientConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pr_setPosterAmbientConfiguration:", v10);

  if (*(_QWORD *)(a1 + 80))
    objc_msgSend(v11, "pui_setSignificantEventsCounter:");
  objc_msgSend(*(id *)(a1 + 64), "_configureInitialSceneSettings:", v11);

}

uint64_t __107__PRSceneViewController_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureInitialSceneClientSettings:", a2);
}

- (void)dealloc
{
  PFPosterExtensionInstance *extensionInstance;
  objc_super v4;

  extensionInstance = self->_extensionInstance;
  self->_extensionInstance = 0;

  -[PRSceneViewController invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController dealloc](&v4, sel_dealloc);
}

- (FBScene)scene
{
  return self->_scene;
}

- (PRPosterConfigurableOptions)configurableOptions
{
  void *v2;
  void *v3;

  -[FBScene parameters](self->_scene, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pr_posterConfigurableOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterConfigurableOptions *)v3;
}

- (void)setConfiguredProperties:(id)a3
{
  FBScene *scene;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if (!-[PRPosterConfiguredProperties isEqualToConfiguredProperties:](self->_configuredProperties, "isEqualToConfiguredProperties:"))
  {
    objc_storeStrong((id *)&self->_configuredProperties, a3);
    scene = self->_scene;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__PRSceneViewController_setConfiguredProperties___block_invoke;
    v7[3] = &unk_1E2184F48;
    v8 = v6;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v7);

  }
}

void __49__PRSceneViewController_setConfiguredProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "titleStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_setPosterTitleStyleConfiguration:", v5);

  objc_msgSend(*(id *)(a1 + 32), "ambientConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pr_setPosterAmbientConfiguration:", v6);

}

- (void)setSceneUserInteractionEnabled:(BOOL)a3
{
  UIView *touchBlockingView;
  id v5;
  UIView *v6;
  void *v7;
  UIView *v8;
  id v9;

  if (self->_sceneUserInteractionEnabled != a3)
  {
    self->_sceneUserInteractionEnabled = a3;
    if (a3)
    {
      -[UIView removeFromSuperview](self->_touchBlockingView, "removeFromSuperview");
      touchBlockingView = self->_touchBlockingView;
      self->_touchBlockingView = 0;

    }
    else
    {
      -[PRSceneViewController view](self, "view");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v9, "bounds");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
      -[UIView layer](v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHitTestsAsOpaque:", 1);

      objc_msgSend(v9, "addSubview:", v6);
      v8 = self->_touchBlockingView;
      self->_touchBlockingView = v6;

    }
  }
}

- (void)setForcesSceneForeground:(BOOL)a3
{
  if (self->_forcesSceneForeground != a3)
  {
    self->_forcesSceneForeground = a3;
    -[PRSceneViewController _update](self, "_update");
  }
}

- (BOOL)isSceneAvailable
{
  return self->_scene != 0;
}

- (BOOL)isSceneContentReady
{
  void *v3;
  int v4;

  -[FBScene clientSettings](self->_scene, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pui_didFinishInitialization");

  return v4 && -[FBScene contentState](self->_scene, "contentState") == 2;
}

- (unint64_t)significantEventsCounter
{
  void *v2;
  unint64_t v3;

  -[FBScene settings](self->_scene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pui_significantEventsCounter");

  return v3;
}

- (id)_defaultDisplayConfigurationForScreen:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "displayConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D23100]);
    objc_msgSend(v4, "mainConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    -[PRSceneViewController _update](self, "_update");
  }

}

- (FBSDisplayConfiguration)displayConfiguration
{
  FBSDisplayConfiguration *displayConfiguration;
  FBSDisplayConfiguration *v3;
  void *v5;

  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
  {
    v3 = displayConfiguration;
  }
  else
  {
    -[PRSceneViewController _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSceneViewController _defaultDisplayConfigurationForScreen:](self, "_defaultDisplayConfigurationForScreen:", v5);
    v3 = (FBSDisplayConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)invalidate
{
  _BOOL4 invalidated;
  int v4;
  PRSceneViewController *v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      invalidated = self->_invalidated;
      v4 = 134218240;
      v5 = self;
      v6 = 1024;
      v7 = invalidated;
      _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: invalidated is now %{BOOL}i", (uint8_t *)&v4, 0x12u);
    }
    -[PRSceneViewController _teardown](self, "_teardown");
  }
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PRSceneViewController _update](self, "_update");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRSceneViewController _update](self, "_update");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PRSceneViewController _update](self, "_update");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PRSceneViewController _update](self, "_update");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[PRSceneViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "interfaceOrientation");

  if (v7)
  {
    v15 = objc_msgSend(v10, "_toWindowOrientation");
    -[UIScene _synchronizedDrawingFence](self->_uiParentScene, "_synchronizedDrawingFence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D016B0];
    objc_msgSend(v7, "transitionDuration");
    objc_msgSend(v17, "settingsWithDuration:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v15, v18, v16, width, height);

  }
  else
  {
    -[PRSceneViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v14, 0, 0, v19, v20);
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PRSceneViewController _update](self, "_update");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRSceneViewController;
  -[PRSceneViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[PRSceneViewController _update](self, "_update");
}

- (void)_teardown
{
  UIScenePresenter *scenePresenter;
  UIScenePresenter *v4;
  void *v5;
  void *v6;
  FBScene *scene;
  BSInvalidatable *keyboardFocusDeferringRule;
  int v9;
  PRSceneViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    -[UIScenePresenter invalidate](scenePresenter, "invalidate");
    v4 = self->_scenePresenter;
    self->_scenePresenter = 0;

  }
  if (self->_scene)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene identityToken](self->_scene, "identityToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: invalidating scene %@", (uint8_t *)&v9, 0x16u);

    }
    -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
    -[FBScene pui_invalidateWithCompletion:](self->_scene, "pui_invalidateWithCompletion:", 0);
    scene = self->_scene;
    self->_scene = 0;

  }
  -[BSInvalidatable invalidate](self->_keyboardFocusDeferringRule, "invalidate");
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;

}

- (void)_update
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  UIScenePresenter *v15;
  UIScenePresenter *scenePresenter;
  void *v17;
  UIScenePresenter *v18;
  id v19;
  void *v20;
  UIScenePresenter *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    -[PRSceneViewController _adjustParentScene](self, "_adjustParentScene");
    if (-[PRSceneViewController scenePresenterIsValid](self, "scenePresenterIsValid"))
    {
      -[PRSceneViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "windowScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "interfaceOrientation");

      -[PRSceneViewController traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      -[PRSceneViewController contentsIdentity](self, "contentsIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "role");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", CFSTR("PRPosterRoleLockScreen"));
      if (v7 == 1)
        v11 = v5;
      else
        v11 = 1;
      if (v10)
        v5 = v11;
      -[PRSceneViewController sceneSize](self, "sceneSize");
      -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", v5, 0, 0);
      if (!self->_scenePresenter)
      {
        -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "createPresenterWithIdentifier:", v14);
        v15 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
        scenePresenter = self->_scenePresenter;
        self->_scenePresenter = v15;

        -[PRSceneViewController _presentationBackgroundColor](self, "_presentationBackgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self->_scenePresenter;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __32__PRSceneViewController__update__block_invoke;
        v23[3] = &unk_1E2184F70;
        v24 = v17;
        v19 = v17;
        -[UIScenePresenter modifyPresentationContext:](v18, "modifyPresentationContext:", v23);
        -[UIScenePresenter activate](self->_scenePresenter, "activate");
        -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRSceneViewController _addScenePresentationView:](self, "_addScenePresentationView:", v20);

      }
    }
    else
    {
      -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
      v21 = self->_scenePresenter;
      self->_scenePresenter = 0;

    }
  }
}

void __32__PRSceneViewController__update__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAppearanceStyle:", 2);
  objc_msgSend(v3, "setClippingDisabled:", PUIDynamicRotationIsActive());
  objc_msgSend(v3, "setBackgroundColorWhileHosting:", *(_QWORD *)(a1 + 32));

}

- (BOOL)scenePresenterIsValid
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PRSceneViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (CGSize)sceneSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PRSceneViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_presentationBackgroundColor
{
  int has_internal_content;
  void *v3;
  void *v4;

  if (!-[PRSceneViewController isSceneContentReady](self, "isSceneContentReady"))
  {
    v3 = (void *)MEMORY[0x1E0DC3658];
    goto LABEL_5;
  }
  has_internal_content = os_variant_has_internal_content();
  v3 = (void *)MEMORY[0x1E0DC3658];
  if (!has_internal_content)
  {
LABEL_5:
    objc_msgSend(v3, "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)_addScenePresentationView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRSceneViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[PRSceneViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendSubviewToBack:", v4);

}

- (void)_adjustParentScene
{
  void *v3;
  void *v4;
  UIScene *v5;
  UIScene *obj;

  -[PRSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  obj = (UIScene *)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (self->_uiParentScene != obj)
  {
    objc_storeStrong((id *)&self->_uiParentScene, obj);
    v5 = obj;
  }

}

- (void)_updateSceneToSize:(CGSize)a3 orientation:(int64_t)a4 withAnimationSettings:(id)a5 fence:(id)a6
{
  id v9;
  id v10;
  void *v11;
  FBScene *scene;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v9 = a5;
  v10 = a6;
  -[PRSceneViewController displayConfiguration](self, "displayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PRSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke;
  v16[3] = &unk_1E2184F98;
  v16[4] = self;
  v17 = v11;
  v19 = v9;
  v20 = a4;
  v18 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  -[FBScene performUpdate:](scene, "performUpdate:", v16);

}

void __84__PRSceneViewController__updateSceneToSize_orientation_withAnimationSettings_fence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setForeground:", objc_msgSend(v5, "_shouldSceneBeForeground"));
  objc_msgSend(v7, "setDisplayConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setInterfaceOrientation:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v6, "setAnimationFence:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setAnimationSettings:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "pr_setDepthEffectDisallowed:", objc_msgSend(*(id *)(a1 + 32), "_depthEffectDisallowed"));
  objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", v7, v6);

}

- (BOOL)_depthEffectDisallowed
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  char v15;

  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "renderingConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_forcesSceneForeground || v4 == 0)
  {
    -[PRSceneViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interfaceOrientation");

    LODWORD(v8) = (unint64_t)(v9 - 1) < 2;
    -[PRSceneViewController configuredProperties](self, "configuredProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "complicationLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "complications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count") != 0;

    objc_msgSend(v10, "titleStyleConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v14, "prefersVerticalTitleLayout");

    v15 = PRIsDepthEffectDisallowed((int)v8, v13, v12);
  }
  else
  {
    v15 = objc_msgSend(v4, "isDepthEffectDisabled");
  }

  return v15;
}

- (BOOL)_shouldSceneBeForeground
{
  return -[PRSceneViewController forcesSceneForeground](self, "forcesSceneForeground")
      || -[PRSceneViewController _appearState](self, "_appearState") != 0;
}

- (void)_configureInitialSceneSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v4 = a3;
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "complications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v10, "sidebarComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") != 0;

  objc_msgSend(v4, "pui_setComplicationRowConfigured:", v7);
  objc_msgSend(v4, "pui_setComplicationSidebarConfigured:", v9);
  objc_msgSend(v4, "pr_setParallaxDisallowed:", 1);

}

- (void)_configureInitialSceneClientSettings:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderingConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pr_setDepthEffectDisabled:", objc_msgSend(v6, "isDepthEffectDisabled"));
  objc_msgSend(v4, "pr_setParallaxEnabled:", objc_msgSend(v6, "isParallaxEnabled"));

}

- (void)_updatePresentationBackgroundColor
{
  void *v3;
  UIScenePresenter *scenePresenter;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PRSceneViewController _presentationBackgroundColor](self, "_presentationBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  scenePresenter = self->_scenePresenter;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PRSceneViewController__updatePresentationBackgroundColor__block_invoke;
  v6[3] = &unk_1E2184F70;
  v7 = v3;
  v5 = v3;
  -[UIScenePresenter modifyPresentationContext:](scenePresenter, "modifyPresentationContext:", v6);

}

uint64_t __59__PRSceneViewController__updatePresentationBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBackgroundColorWhileHosting:", *(_QWORD *)(a1 + 32));
}

- (void)_acquireKeyboardFocusDeferringRuleIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BSInvalidatable *keyboardFocusDeferringRule;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  BSInvalidatable *v30;
  BSInvalidatable *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  PRSceneViewController *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[FBScene clientHandle](self->_scene, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScene _FBSScene](self->_uiParentScene, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PRSceneViewController contentsIdentity](self, "contentsIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", CFSTR("PRPosterRoleLockScreen")) & 1) == 0)
    {
LABEL_11:

      goto LABEL_12;
    }
    keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;

    if (!keyboardFocusDeferringRule && v6 && v3 != 0)
    {
      objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnvironment:", v13);

      objc_msgSend(v10, "setToken:", v9);
      v14 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
      objc_msgSend(v3, "processHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPid:", objc_msgSend(v15, "pid"));

      v16 = (void *)MEMORY[0x1E0D00CB8];
      -[FBScene identityToken](self->_scene, "identityToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tokenForString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setToken:", v19);

      PRLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBScene identityToken](self->_scene, "identityToken");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringRepresentation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v33 = v22;
        v34 = 2048;
        v35 = self;
        v36 = 2112;
        v37 = v24;
        v38 = 2112;
        v39 = v3;
        _os_log_impl(&dword_18B634000, v20, OS_LOG_TYPE_DEFAULT, "%@-%p: scene %@ deferring keyboard events to client %@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@-%p deferring to hosted scene"), v28, self);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deferEventsMatchingPredicate:toTarget:withReason:", v10, v14, v29);
      v30 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v31 = self->_keyboardFocusDeferringRule;
      self->_keyboardFocusDeferringRule = v30;

      goto LABEL_11;
    }
  }
LABEL_12:

}

- (id)_acquireLocalKeyboardFocusAssertion
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  BSInvalidatable *keyboardFocusDeferringRule;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  PRSceneViewController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PRLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "%@-%p: acquiring local keyboard focus assertion and invalidating remote deferring rule", buf, 0x16u);

  }
  -[BSInvalidatable invalidate](self->_keyboardFocusDeferringRule, "invalidate");
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;

  objc_initWeak((id *)buf, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PRSceneViewController__acquireLocalKeyboardFocusAssertion__block_invoke;
  v12[3] = &unk_1E2184FC0;
  objc_copyWeak(&v13, (id *)buf);
  v10 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:invalidationBlock:", v9, CFSTR("localKeyboardFocus"), v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return v10;
}

void __60__PRSceneViewController__acquireLocalKeyboardFocusAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  id v10;
  id to;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    PRLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(&to);
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained(&to);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2048;
      v15 = v9;
      _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "%@-%p: invalidating local keyboard focus assertion", buf, 0x16u);

    }
    v10 = objc_loadWeakRetained(&to);
    objc_msgSend(v10, "_acquireKeyboardFocusDeferringRuleIfNecessary");

  }
  objc_destroyWeak(&to);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  int v11;
  PRSceneViewController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = a4;
    objc_msgSend(a3, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ handle actions %@", (uint8_t *)&v11, 0x20u);

  }
  return 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  PRSceneViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a3;
    objc_msgSend(v5, "identityToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentState");

    NSStringFromFBSceneContentState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did change content state to %@", (uint8_t *)&v9, 0x20u);

  }
  -[PRSceneViewController _sceneContentReadinessDidChange](self, "_sceneContentReadinessDidChange");
}

- (void)sceneDidActivate:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  PRSceneViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "identityToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did activate", (uint8_t *)&v7, 0x16u);

  }
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v5;
  PRPosterRenderingConfiguration *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PRPosterRenderingConfiguration *v11;

  v5 = a3;
  v6 = [PRPosterRenderingConfiguration alloc];
  objc_msgSend(v5, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pr_isDepthEffectDisabled");
  objc_msgSend(v5, "clientSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](v6, "initWithDepthEffectDisabled:parallaxEnabled:", v8, objc_msgSend(v9, "pr_isParallaxEnabled"));
  v10 = (void *)-[PRPosterConfiguredProperties mutableCopy](self->_configuredProperties, "mutableCopy");
  objc_msgSend(v10, "setRenderingConfiguration:", v11);
  -[PRSceneViewController setConfiguredProperties:](self, "setConfiguredProperties:", v10);
  -[PRSceneViewController _acquireKeyboardFocusDeferringRuleIfNecessary](self, "_acquireKeyboardFocusDeferringRuleIfNecessary");

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BSInvalidatable *keyboardFocusDeferringRule;
  int v17;
  PRSceneViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218498;
    v18 = self;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with error %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D22848]))
  {
    v11 = objc_msgSend(v7, "code");

    if (v11 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "identityToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 134218498;
        v18 = self;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with fatal error %@", (uint8_t *)&v17, 0x20u);

      }
      -[PRSceneViewController _failWithFatalError:](self, "_failWithFatalError:", v7);
      goto LABEL_12;
    }
  }
  else
  {

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identityToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 134218498;
    v18 = self;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did deactivate with transient error %@", (uint8_t *)&v17, 0x20u);

  }
  -[PRSceneViewController _update](self, "_update");
LABEL_12:
  -[BSInvalidatable invalidate](self->_keyboardFocusDeferringRule, "invalidate");
  keyboardFocusDeferringRule = self->_keyboardFocusDeferringRule;
  self->_keyboardFocusDeferringRule = 0;

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  PRSceneViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "identityToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218754;
    v19 = self;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SceneViewController-%p: scene %@ did update client settings with diff %@, transition %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_msgSend(v10, "clientSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "pui_didFinishInitialization");
  if (v17 != objc_msgSend(v12, "pui_didFinishInitialization"))
    -[PRSceneViewController _sceneContentReadinessDidChange](self, "_sceneContentReadinessDidChange");

}

- (PFServerPosterIdentity)contentsIdentity
{
  return self->_contentsIdentity;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (BOOL)isSceneUserInteractionEnabled
{
  return self->_sceneUserInteractionEnabled;
}

- (void)setSceneAvailable:(BOOL)a3
{
  self->_sceneAvailable = a3;
}

- (BOOL)forcesSceneForeground
{
  return self->_forcesSceneForeground;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_contentsIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_keyboardFocusDeferringRule, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_uiParentScene, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
}

+ (NSString)role
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:.cold.6()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
