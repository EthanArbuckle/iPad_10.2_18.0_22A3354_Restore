@implementation PRPosterSceneSettingsBuilder

- (PRPosterSceneSettingsBuilder)init
{
  PRPosterSceneSettingsBuilder *v2;
  PRPosterSceneSettingsBuilder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRPosterSceneSettingsBuilder;
  v2 = -[PRPosterSceneSettingsBuilder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PRPosterSceneSettingsBuilder reset](v2, "reset");
  return v3;
}

- (void)setDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v4;
  id v5;
  FBSDisplayConfiguration *displayConfiguration;

  v4 = (FBSDisplayConfiguration *)a3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D23100]);
    objc_msgSend(v5, "mainConfiguration");
    v4 = (FBSDisplayConfiguration *)objc_claimAutoreleasedReturnValue();

  }
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = v4;

}

- (void)applySceneSettings:(id)a3
{
  void *v4;
  void (**v5)(id, _PRPosterStagedSceneSettings *);

  v5 = (void (**)(id, _PRPosterStagedSceneSettings *))a3;
  if (v5)
  {
    v4 = (void *)MEMORY[0x18D77C448]();
    v5[2](v5, self->_sceneSettings);
    objc_autoreleasePoolPop(v4);
  }

}

- (void)applySnapshotDefinition:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__PRPosterSceneSettingsBuilder_applySnapshotDefinition___block_invoke;
    v6[3] = &unk_1E21862E0;
    v7 = v4;
    -[PRPosterSceneSettingsBuilder applySceneSettings:](self, "applySceneSettings:", v6);

  }
}

uint64_t __56__PRPosterSceneSettingsBuilder_applySnapshotDefinition___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySceneSettings:", a2);
}

- (id)buildWithPath:(id)a3 snapshotDefinition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "serverIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterPathModelObjectCache modelObjectCacheForPath:](PRPosterPathModelObjectCache, "modelObjectCacheForPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuredProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PRPosterSceneSettingsBuilder buildWithPath:provider:configuredProperties:snapshotDefinition:](self, "buildWithPath:provider:configuredProperties:snapshotDefinition:", v6, v9, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PRPosterPathUtilities loadConfiguredPropertiesForPath:error:](PRPosterPathUtilities, "loadConfiguredPropertiesForPath:error:", v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterSceneSettingsBuilder buildWithPath:provider:configuredProperties:snapshotDefinition:](self, "buildWithPath:provider:configuredProperties:snapshotDefinition:", v6, v9, v13, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)buildWithPath:(id)a3 provider:(id)a4 configuredProperties:(id)a5 snapshotDefinition:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  unint64_t v18;
  _PRPosterStagedSceneSettings *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id result;
  void *v40;
  unsigned int v41;
  unsigned int IsFloatingLayerOnly;
  id v43;
  id v44;
  id v45;
  void *v46;
  int v47;
  id v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v48 = 0;
  objc_msgSend(v11, "extendContentsReadAccessToAuditToken:error:", 0, &v48);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v48;
  if (v15)
  {
    objc_msgSend(v13, "complicationLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v15;
    if (objc_msgSend(v17, "hasComplications"))
      v47 = objc_msgSend(v14, "includesComplications");
    else
      v47 = 0;

    v18 = -[PRPosterSceneSettingsBuilder snapshotOptions](self, "snapshotOptions");
    v19 = self->_sceneSettings;
    -[_PRPosterStagedSceneSettings pui_setProvider:](v19, "pui_setProvider:", v12);
    -[_PRPosterStagedSceneSettings pui_setRole:](v19, "pui_setRole:", *MEMORY[0x1E0D7FD98]);
    if (v14)
      -[PRPosterSceneSettingsBuilder applySnapshotDefinition:](self, "applySnapshotDefinition:", v14);
    if (v18)
    {
      v44 = v12;
      v45 = v11;
      IsFloatingLayerOnly = PRSPosterSnapshotOptionsIsFloatingLayerOnly();
      if ((v18 & 0x40) != 0)
        v20 = 1.0;
      else
        v20 = 0.0;
      objc_msgSend(v13, "complicationLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "inlineComplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (v18 >> 2) & 1;
      if (v22)
        v41 = objc_msgSend(v14, "includesComplications") & v23;
      else
        v41 = 0;

      objc_msgSend(v21, "complications");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v16;
      if (objc_msgSend(v24, "count"))
        v25 = objc_msgSend(v14, "includesComplications") & v23;
      else
        v25 = 0;

      objc_msgSend(v13, "titleStyleConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "prefersVerticalTitleLayout");

      objc_msgSend(v21, "sidebarComplications");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
        v29 = objc_msgSend(v14, "includesComplications") & v23;
      else
        v29 = 0;

      v30 = PRIsDepthEffectDisallowed((unint64_t)(-[PRPosterSceneSettingsBuilder interfaceOrientation](self, "interfaceOrientation") - 1) < 2, v25, v27);
      -[_PRPosterStagedSceneSettings pui_setInlineComplicationConfigured:](v19, "pui_setInlineComplicationConfigured:", v41);
      -[_PRPosterStagedSceneSettings pui_setComplicationRowConfigured:](v19, "pui_setComplicationRowConfigured:", v25);
      -[_PRPosterStagedSceneSettings pui_setComplicationSidebarConfigured:](v19, "pui_setComplicationSidebarConfigured:", v29);
      -[_PRPosterStagedSceneSettings pr_setDepthEffectDisallowed:](v19, "pr_setDepthEffectDisallowed:", v30);
      -[_PRPosterStagedSceneSettings pr_setUnlockProgress:](v19, "pr_setUnlockProgress:", v20);
      if ((v18 & 2) != 0)
        v31 = objc_msgSend(v14, "includesHeaderElements");
      else
        v31 = 0;
      v12 = v44;
      -[_PRPosterStagedSceneSettings pui_setShowsHeaderElements:](v19, "pui_setShowsHeaderElements:", v31);
      -[_PRPosterStagedSceneSettings pui_setFloatingLayerSnapshot:](v19, "pui_setFloatingLayerSnapshot:", IsFloatingLayerOnly);
      -[_PRPosterStagedSceneSettings pui_setContent:](v19, "pui_setContent:", (v18 >> 7) & 1);
      -[_PRPosterStagedSceneSettings pui_setShowsComplications:](v19, "pui_setShowsComplications:", v47 & (v18 >> 2));

      v11 = v45;
      v16 = v43;
    }
    -[_PRPosterStagedSceneSettings pui_setSnapshot:](v19, "pui_setSnapshot:", 1);
    if (!-[PRPosterSceneSettingsBuilder interfaceOrientation](self, "interfaceOrientation"))
    {
      objc_msgSend(v46, "role");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("PRPosterRoleAmbient"));

      if (v33)
      {
        -[PRPosterSceneSettingsBuilder setInterfaceOrientation:](self, "setInterfaceOrientation:", 4);
        -[PRPosterSceneSettingsBuilder setDeviceOrientation:](self, "setDeviceOrientation:", 1);
      }
    }
    if (((!-[_PRPosterStagedSceneSettings pui_showsComplications](v19, "pui_showsComplications") | v47) & 1) == 0)
      -[_PRPosterStagedSceneSettings pui_setShowsComplications:](v19, "pui_setShowsComplications:", 0);
    v34 = (void *)objc_opt_new();
    -[PRPosterSceneSettingsBuilder displayConfiguration](self, "displayConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDisplayConfiguration:", v35);

    objc_msgSend(v34, "setDeviceOrientation:", -[PRPosterSceneSettingsBuilder deviceOrientation](self, "deviceOrientation"));
    objc_msgSend(v34, "setInterfaceOrientation:", -[PRPosterSceneSettingsBuilder interfaceOrientation](self, "interfaceOrientation"));
    -[PRPosterSceneSettingsBuilder traitCollection](self, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTraitCollection:", v36);

    objc_msgSend(v34, "setProvider:", v12);
    objc_msgSend(v34, "setSceneSettings:", v19);
    objc_msgSend(v34, "setSnapshotOptions:", self->_snapshotOptions);
    objc_msgSend(v13, "titleStyleConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTitleStyleConfiguration:", v37);

    objc_msgSend(v13, "ambientConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAmbientConfiguration:", v38);

    objc_msgSend(v34, "setPath:", v46);
    return v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create path for scene settings of %@ : %@"), self, v16);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterSceneSettingsBuilder buildWithPath:provider:configuredProperties:snapshotDefinition:].cold.1(a2, (uint64_t)self, (uint64_t)v40);
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)reset
{
  _PRPosterStagedSceneSettings *v3;
  _PRPosterStagedSceneSettings *sceneSettings;
  void *v5;
  id v6;

  v3 = (_PRPosterStagedSceneSettings *)objc_opt_new();
  sceneSettings = self->_sceneSettings;
  self->_sceneSettings = v3;

  self->_interfaceOrientation = 0;
  self->_deviceOrientation = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0D23100]);
  objc_msgSend(v6, "mainConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSceneSettingsBuilder setDisplayConfiguration:](self, "setDisplayConfiguration:", v5);
  -[PRPosterSceneSettingsBuilder setInterfaceOrientation:](self, "setInterfaceOrientation:", 1);

}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (int64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (void)setSnapshotOptions:(int64_t)a3
{
  self->_snapshotOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
}

- (void)buildWithPath:(uint64_t)a3 provider:configuredProperties:snapshotDefinition:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
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

  v20 = *MEMORY[0x1E0C80C00];
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
  v15 = CFSTR("PRPosterSceneSettings.m");
  v16 = 1024;
  v17 = 197;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
