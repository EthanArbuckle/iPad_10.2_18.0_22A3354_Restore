@implementation _PRPosterStagedSceneSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v4 = a3;
  -[_PRPosterStagedSceneSettings pui_role](self, "pui_role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pui_role"));

  -[_PRPosterStagedSceneSettings pui_provider](self, "pui_provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pui_provider"));

  -[_PRPosterStagedSceneSettings pui_previewIdentifier](self, "pui_previewIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pui_previewIdentifier"));

  -[_PRPosterStagedSceneSettings pr_caseColor](self, "pr_caseColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pr_caseColor"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_userInterfaceStyle](self, "pui_userInterfaceStyle"), CFSTR("pui_userInterfaceStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_deviceOrientation](self, "pui_deviceOrientation"), CFSTR("pui_deviceOrientation"));
  -[_PRPosterStagedSceneSettings pui_posterContents](self, "pui_posterContents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pui_posterContents"));

  -[_PRPosterStagedSceneSettings pr_posterConfigurableOptions](self, "pr_posterConfigurableOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("pr_posterConfigurableOptions"));

  -[_PRPosterStagedSceneSettings pr_posterConfiguredProperties](self, "pr_posterConfiguredProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("pr_posterConfiguredProperties"));

  -[_PRPosterStagedSceneSettings pr_posterTitleStyleConfiguration](self, "pr_posterTitleStyleConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("pr_posterTitleStyleConfiguration"));

  -[_PRPosterStagedSceneSettings pr_posterAmbientConfiguration](self, "pr_posterAmbientConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("pr_posterAmbientConfiguration"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isDepthEffectDisallowed](self, "pr_isDepthEffectDisallowed"), CFSTR("pr_depthEffectDisallowed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isParallaxEnabled](self, "pr_isParallaxEnabled"), CFSTR("pr_parallaxEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isParallaxDisallowed](self, "pr_isParallaxDisallowed"), CFSTR("pr_parallaxDisallowed"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isInlineComplicationConfigured](self, "pui_isInlineComplicationConfigured"), CFSTR("pui_inlineComplicationConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isComplicationRowConfigured](self, "pui_isComplicationRowConfigured"), CFSTR("pui_complicationRowConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isComplicationSidebarConfigured](self, "pui_isComplicationSidebarConfigured"), CFSTR("pui_complicationSidebarConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isAlternateDateEnabled](self, "pr_isAlternateDateEnabled"), CFSTR("pr_alternateDateEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isExtensionUserInteractionEnabled](self, "pui_isExtensionUserInteractionEnabled"), CFSTR("pui_extensionUserInteractionEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_showsHeaderElements](self, "pui_showsHeaderElements"), CFSTR("pui_showsHeaderElements"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_showsComplications](self, "pui_showsComplications"), CFSTR("pui_showsComplications"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isWallpaperObscured](self, "pui_isWallpaperObscured"), CFSTR("pui_wallpaperObscured"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_posterBoundingShape](self, "pui_posterBoundingShape"), CFSTR("pui_posterBoundingShape"));
  -[_PRPosterStagedSceneSettings pr_horizontalTitleBoundingRect](self, "pr_horizontalTitleBoundingRect");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("pr_horizontalTitleBoundingRect"));
  -[_PRPosterStagedSceneSettings pr_verticalTitleBoundingRect](self, "pr_verticalTitleBoundingRect");
  objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("pr_verticalTitleBoundingRect"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_mode](self, "pui_mode"), CFSTR("pui_mode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_content](self, "pui_content"), CFSTR("pui_content"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isSnapshot](self, "pui_isSnapshot"), CFSTR("pui_snapshot"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isFloatingLayerSnapshot](self, "pui_isFloatingLayerSnapshot"), CFSTR("pui_floatingLayerSnapshot"));
  -[_PRPosterStagedSceneSettings pr_unlockProgress](self, "pr_unlockProgress");
  *(float *)&v14 = v14;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("pr_unlockProgress"), v14);
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_wakeSourceIsSwipeToUnlock](self, "pr_wakeSourceIsSwipeToUnlock"), CFSTR("pr_wakeSourceIsSwipeToUnlock"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_significantEventsCounter](self, "pui_significantEventsCounter"), CFSTR("pui_significantEventsCounter"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pr_titleAlignment](self, "pr_titleAlignment"), CFSTR("pr_titleAlignment"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pr_adjustedLuminance](self, "pr_adjustedLuminance"), CFSTR("pr_adjustedLuminance"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings isAmbientPresented](self, "isAmbientPresented"), CFSTR("ambientPresented"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings ambientDisplayStyle](self, "ambientDisplayStyle"), CFSTR("ambientDisplayStyle"));
  -[_PRPosterStagedSceneSettings pui_sceneAttachments](self, "pui_sceneAttachments");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("pui_sceneAttachments"));

}

- (_PRPosterStagedSceneSettings)initWithCoder:(id)a3
{
  id v4;
  _PRPosterStagedSceneSettings *v5;
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
  float v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_PRPosterStagedSceneSettings;
  v5 = -[_PRPosterStagedSceneSettings init](&v31, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("pui_role"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pui_setRole:](v5, "pui_setRole:", v7);

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("pui_provider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pui_setProvider:](v5, "pui_setProvider:", v9);

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("pui_previewIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pui_setPreviewIdentifier:](v5, "pui_setPreviewIdentifier:", v11);

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("pr_caseColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pr_setCaseColor:](v5, "pr_setCaseColor:", v13);

    -[_PRPosterStagedSceneSettings pui_setUserInterfaceStyle:](v5, "pui_setUserInterfaceStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_userInterfaceStyle")));
    -[_PRPosterStagedSceneSettings pui_setDeviceOrientation:](v5, "pui_setDeviceOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_deviceOrientation")));
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("pui_posterContents"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pui_setPosterContents:](v5, "pui_setPosterContents:", v15);

    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("pr_posterConfigurableOptions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pr_setPosterConfigurableOptions:](v5, "pr_setPosterConfigurableOptions:", v17);

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("pr_posterConfiguredProperties"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pr_setPosterConfiguredProperties:](v5, "pr_setPosterConfiguredProperties:", v19);

    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, CFSTR("pr_posterTitleStyleConfiguration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pr_setPosterTitleStyleConfiguration:](v5, "pr_setPosterTitleStyleConfiguration:", v21);

    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("pr_posterAmbientConfiguration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pr_setPosterAmbientConfiguration:](v5, "pr_setPosterAmbientConfiguration:", v23);

    -[_PRPosterStagedSceneSettings pr_setDepthEffectDisallowed:](v5, "pr_setDepthEffectDisallowed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr_depthEffectDisallowed")));
    -[_PRPosterStagedSceneSettings pr_setParallaxEnabled:](v5, "pr_setParallaxEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr_parallaxEnabled")));
    -[_PRPosterStagedSceneSettings pr_setParallaxDisallowed:](v5, "pr_setParallaxDisallowed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr_parallaxDisallowed")));
    -[_PRPosterStagedSceneSettings pui_setInlineComplicationConfigured:](v5, "pui_setInlineComplicationConfigured:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_inlineComplicationConfigured")));
    -[_PRPosterStagedSceneSettings pui_setComplicationRowConfigured:](v5, "pui_setComplicationRowConfigured:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_complicationRowConfigured")));
    -[_PRPosterStagedSceneSettings pui_setComplicationSidebarConfigured:](v5, "pui_setComplicationSidebarConfigured:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_complicationSidebarConfigured")));
    -[_PRPosterStagedSceneSettings pr_setAlternateDateEnabled:](v5, "pr_setAlternateDateEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr_alternateDateEnabled")));
    -[_PRPosterStagedSceneSettings pui_setExtensionUserInteractionEnabled:](v5, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_extensionUserInteractionEnabled")));
    -[_PRPosterStagedSceneSettings pui_setShowsHeaderElements:](v5, "pui_setShowsHeaderElements:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_showsHeaderElements")));
    -[_PRPosterStagedSceneSettings pui_setShowsComplications:](v5, "pui_setShowsComplications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_showsComplications")));
    -[_PRPosterStagedSceneSettings pui_setWallpaperObscured:](v5, "pui_setWallpaperObscured:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_wallpaperObscured")));
    -[_PRPosterStagedSceneSettings pui_setPosterBoundingShape:](v5, "pui_setPosterBoundingShape:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_posterBoundingShape")));
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("pr_horizontalTitleBoundingRect"));
    -[_PRPosterStagedSceneSettings pr_setHorizontalTitleBoundingRect:](v5, "pr_setHorizontalTitleBoundingRect:");
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("pr_verticalTitleBoundingRect"));
    -[_PRPosterStagedSceneSettings pr_setVerticalTitleBoundingRect:](v5, "pr_setVerticalTitleBoundingRect:");
    -[_PRPosterStagedSceneSettings pui_setMode:](v5, "pui_setMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_mode")));
    -[_PRPosterStagedSceneSettings pui_setContent:](v5, "pui_setContent:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_content")));
    -[_PRPosterStagedSceneSettings pui_setSnapshot:](v5, "pui_setSnapshot:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_snapshot")));
    -[_PRPosterStagedSceneSettings pui_setFloatingLayerSnapshot:](v5, "pui_setFloatingLayerSnapshot:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pui_floatingLayerSnapshot")));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pr_unlockProgress"));
    -[_PRPosterStagedSceneSettings pr_setUnlockProgress:](v5, "pr_setUnlockProgress:", v24);
    -[_PRPosterStagedSceneSettings pui_setSignificantEventsCounter:](v5, "pui_setSignificantEventsCounter:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pui_significantEventsCounter")));
    v25 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithObjects:", v26, v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("pui_sceneAttachments"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PRPosterStagedSceneSettings pui_setSceneAttachments:](v5, "pui_setSceneAttachments:", v29);

    -[_PRPosterStagedSceneSettings pr_setWakeSourceIsSwipeToUnlock:](v5, "pr_setWakeSourceIsSwipeToUnlock:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr_wakeSourceIsSwipeToUnlock")));
    -[_PRPosterStagedSceneSettings pr_setTitleAlignment:](v5, "pr_setTitleAlignment:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pr_titleAlignment")));
    -[_PRPosterStagedSceneSettings pr_setAdjustedLuminance:](v5, "pr_setAdjustedLuminance:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pr_adjustedLuminance")));
    -[_PRPosterStagedSceneSettings setAmbientPresented:](v5, "setAmbientPresented:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ambientPresented")));
    -[_PRPosterStagedSceneSettings setAmbientDisplayStyle:](v5, "setAmbientDisplayStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ambientDisplayStyle")));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PRPosterStagedSceneSettings *v4;
  uint64_t v5;
  NSString *role;
  uint64_t v7;
  NSString *provider;
  uint64_t v9;
  NSString *previewIdentifier;
  uint64_t v11;
  BSColor *caseColor;
  CGSize size;
  CGSize v14;
  uint64_t v15;
  NSArray *sceneAttachments;

  v4 = -[_PRPosterStagedSceneSettings init](+[_PRPosterStagedSceneSettings allocWithZone:](_PRPosterStagedSceneSettings, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_role, "copy");
  role = v4->_role;
  v4->_role = (NSString *)v5;

  v7 = -[NSString copy](self->_provider, "copy");
  provider = v4->_provider;
  v4->_provider = (NSString *)v7;

  v9 = -[NSString copy](self->_previewIdentifier, "copy");
  previewIdentifier = v4->_previewIdentifier;
  v4->_previewIdentifier = (NSString *)v9;

  v11 = -[BSColor copy](self->_caseColor, "copy");
  caseColor = v4->_caseColor;
  v4->_caseColor = (BSColor *)v11;

  v4->_userInterfaceStyle = self->_userInterfaceStyle;
  v4->_deviceOrientation = self->_deviceOrientation;
  objc_storeStrong((id *)&v4->_posterContents, self->_posterContents);
  objc_storeStrong((id *)&v4->_posterConfigurableOptions, self->_posterConfigurableOptions);
  objc_storeStrong((id *)&v4->_posterConfiguredProperties, self->_posterConfiguredProperties);
  objc_storeStrong((id *)&v4->_posterTitleStyleConfiguration, self->_posterTitleStyleConfiguration);
  objc_storeStrong((id *)&v4->_posterAmbientConfiguration, self->_posterAmbientConfiguration);
  v4->_depthEffectDisallowed = self->_depthEffectDisallowed;
  v4->_parallaxEnabled = self->_parallaxEnabled;
  v4->_parallaxDisallowed = self->_parallaxDisallowed;
  v4->_inlineComplicationConfigured = self->_inlineComplicationConfigured;
  v4->_complicationRowConfigured = self->_complicationRowConfigured;
  v4->_complicationSidebarConfigured = self->_complicationSidebarConfigured;
  v4->_alternateDateEnabled = self->_alternateDateEnabled;
  v4->_extensionUserInteractionEnabled = self->_extensionUserInteractionEnabled;
  v4->_showsHeaderElements = self->_showsHeaderElements;
  v4->_showsComplications = self->_showsComplications;
  v4->_wallpaperObscured = self->_wallpaperObscured;
  v4->_posterBoundingShape = self->_posterBoundingShape;
  size = self->_horizontalTitleBoundingRect.size;
  v4->_horizontalTitleBoundingRect.origin = self->_horizontalTitleBoundingRect.origin;
  v4->_horizontalTitleBoundingRect.size = size;
  v14 = self->_verticalTitleBoundingRect.size;
  v4->_verticalTitleBoundingRect.origin = self->_verticalTitleBoundingRect.origin;
  v4->_verticalTitleBoundingRect.size = v14;
  v4->_mode = self->_mode;
  v4->_content = self->_content;
  v4->_snapshot = self->_snapshot;
  v4->_floatingLayerSnapshot = self->_floatingLayerSnapshot;
  v4->_unlockProgress = self->_unlockProgress;
  v4->_wakeSourceIsSwipeToUnlock = self->_wakeSourceIsSwipeToUnlock;
  v4->_significantEventsCounter = self->_significantEventsCounter;
  v4->_titleAlignment = self->_titleAlignment;
  v4->_adjustedLuminance = self->_adjustedLuminance;
  v4->_ambientPresented = self->_ambientPresented;
  v4->_ambientDisplayStyle = self->_ambientDisplayStyle;
  v15 = -[NSArray copy](self->_sceneAttachments, "copy");
  sceneAttachments = v4->_sceneAttachments;
  v4->_sceneAttachments = (NSArray *)v15;

  return v4;
}

- (void)applyToMutableSceneSettings:(id)a3 role:(id)a4
{
  id v6;
  int v7;
  id v8;

  v8 = a3;
  v6 = a4;
  FBSceneSettingsApplyPRSceneSettings(self, v8);
  FBSceneSettingsApplyPRRenderingSceneSettings(self, v8);
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PRPosterRoleAmbient"));

  if (v7)
    FBSceneSettingsApplyAMUIAmbientPresentationSettings(self, v8);

}

- (int64_t)pr_adjustedLuminance
{
  return 2;
}

- (NSString)pui_role
{
  return self->_role;
}

- (void)pui_setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)pui_provider
{
  return self->_provider;
}

- (void)pui_setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)pui_previewIdentifier
{
  return self->_previewIdentifier;
}

- (void)pui_setPreviewIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BSColor)pr_caseColor
{
  return self->_caseColor;
}

- (void)pr_setCaseColor:(id)a3
{
  objc_storeStrong((id *)&self->_caseColor, a3);
}

- (int64_t)pui_userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)pui_setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)pui_deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)pui_setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (PFServerPosterPath)pui_posterContents
{
  return self->_posterContents;
}

- (void)pui_setPosterContents:(id)a3
{
  objc_storeStrong((id *)&self->_posterContents, a3);
}

- (PRPosterConfigurableOptions)pr_posterConfigurableOptions
{
  return self->_posterConfigurableOptions;
}

- (void)pr_setPosterConfigurableOptions:(id)a3
{
  objc_storeStrong((id *)&self->_posterConfigurableOptions, a3);
}

- (PRPosterConfiguredProperties)pr_posterConfiguredProperties
{
  return self->_posterConfiguredProperties;
}

- (void)pr_setPosterConfiguredProperties:(id)a3
{
  objc_storeStrong((id *)&self->_posterConfiguredProperties, a3);
}

- (PRPosterTitleStyleConfiguration)pr_posterTitleStyleConfiguration
{
  return self->_posterTitleStyleConfiguration;
}

- (void)pr_setPosterTitleStyleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_posterTitleStyleConfiguration, a3);
}

- (PRPosterAmbientConfiguration)pr_posterAmbientConfiguration
{
  return self->_posterAmbientConfiguration;
}

- (void)pr_setPosterAmbientConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_posterAmbientConfiguration, a3);
}

- (BOOL)pr_isDepthEffectDisallowed
{
  return self->_depthEffectDisallowed;
}

- (void)pr_setDepthEffectDisallowed:(BOOL)a3
{
  self->_depthEffectDisallowed = a3;
}

- (BOOL)pr_isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)pr_setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (BOOL)pr_isParallaxDisallowed
{
  return self->_parallaxDisallowed;
}

- (void)pr_setParallaxDisallowed:(BOOL)a3
{
  self->_parallaxDisallowed = a3;
}

- (BOOL)pui_isInlineComplicationConfigured
{
  return self->_inlineComplicationConfigured;
}

- (void)pui_setInlineComplicationConfigured:(BOOL)a3
{
  self->_inlineComplicationConfigured = a3;
}

- (BOOL)pui_isComplicationRowConfigured
{
  return self->_complicationRowConfigured;
}

- (void)pui_setComplicationRowConfigured:(BOOL)a3
{
  self->_complicationRowConfigured = a3;
}

- (BOOL)pui_isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (void)pui_setComplicationSidebarConfigured:(BOOL)a3
{
  self->_complicationSidebarConfigured = a3;
}

- (BOOL)pr_isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (void)pr_setAlternateDateEnabled:(BOOL)a3
{
  self->_alternateDateEnabled = a3;
}

- (BOOL)pui_isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void)pui_setExtensionUserInteractionEnabled:(BOOL)a3
{
  self->_extensionUserInteractionEnabled = a3;
}

- (BOOL)pui_showsHeaderElements
{
  return self->_showsHeaderElements;
}

- (void)pui_setShowsHeaderElements:(BOOL)a3
{
  self->_showsHeaderElements = a3;
}

- (BOOL)pui_showsComplications
{
  return self->_showsComplications;
}

- (void)pui_setShowsComplications:(BOOL)a3
{
  self->_showsComplications = a3;
}

- (BOOL)pui_isWallpaperObscured
{
  return self->_wallpaperObscured;
}

- (void)pui_setWallpaperObscured:(BOOL)a3
{
  self->_wallpaperObscured = a3;
}

- (int64_t)pui_posterBoundingShape
{
  return self->_posterBoundingShape;
}

- (void)pui_setPosterBoundingShape:(int64_t)a3
{
  self->_posterBoundingShape = a3;
}

- (CGRect)pr_horizontalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_horizontalTitleBoundingRect.origin.x;
  y = self->_horizontalTitleBoundingRect.origin.y;
  width = self->_horizontalTitleBoundingRect.size.width;
  height = self->_horizontalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)pr_setHorizontalTitleBoundingRect:(CGRect)a3
{
  self->_horizontalTitleBoundingRect = a3;
}

- (CGRect)pr_verticalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_verticalTitleBoundingRect.origin.x;
  y = self->_verticalTitleBoundingRect.origin.y;
  width = self->_verticalTitleBoundingRect.size.width;
  height = self->_verticalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)pr_setVerticalTitleBoundingRect:(CGRect)a3
{
  self->_verticalTitleBoundingRect = a3;
}

- (int64_t)pui_mode
{
  return self->_mode;
}

- (void)pui_setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)pui_content
{
  return self->_content;
}

- (void)pui_setContent:(int64_t)a3
{
  self->_content = a3;
}

- (unint64_t)pui_previewContent
{
  return self->_previewContent;
}

- (void)pui_setPreviewContent:(unint64_t)a3
{
  self->_previewContent = a3;
}

- (BOOL)pui_isSnapshot
{
  return self->_snapshot;
}

- (void)pui_setSnapshot:(BOOL)a3
{
  self->_snapshot = a3;
}

- (BOOL)pui_isFloatingLayerSnapshot
{
  return self->_floatingLayerSnapshot;
}

- (void)pui_setFloatingLayerSnapshot:(BOOL)a3
{
  self->_floatingLayerSnapshot = a3;
}

- (double)pr_unlockProgress
{
  return self->_unlockProgress;
}

- (void)pr_setUnlockProgress:(double)a3
{
  self->_unlockProgress = a3;
}

- (BOOL)pr_wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)pr_setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_wakeSourceIsSwipeToUnlock = a3;
}

- (unint64_t)pui_significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (void)pui_setSignificantEventsCounter:(unint64_t)a3
{
  self->_significantEventsCounter = a3;
}

- (unint64_t)pr_titleAlignment
{
  return self->_titleAlignment;
}

- (void)pr_setTitleAlignment:(unint64_t)a3
{
  self->_titleAlignment = a3;
}

- (void)pr_setAdjustedLuminance:(int64_t)a3
{
  self->_adjustedLuminance = a3;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

- (NSArray)pui_sceneAttachments
{
  return self->_sceneAttachments;
}

- (void)pui_setSceneAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_sceneAttachments, a3);
}

- (BOOL)pui_isInvalidated
{
  return self->pui_isInvalidated;
}

- (BOOL)pr_isParallaxEffectivelyEnabled
{
  return self->pr_parallaxEffectivelyEnabled;
}

- (unint64_t)pui_userTapEventsCounter
{
  return self->pui_userTapEventsCounter;
}

- (void)pui_setUserTapEventsCounter:(unint64_t)a3
{
  self->pui_userTapEventsCounter = a3;
}

- (CGPoint)pui_userTapLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->pui_userTapLocation.x;
  y = self->pui_userTapLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)pui_setUserTapEventWithLocation:(CGPoint)a3
{
  self->pui_userTapLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneAttachments, 0);
  objc_storeStrong((id *)&self->_posterAmbientConfiguration, 0);
  objc_storeStrong((id *)&self->_posterTitleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfiguredProperties, 0);
  objc_storeStrong((id *)&self->_posterConfigurableOptions, 0);
  objc_storeStrong((id *)&self->_posterContents, 0);
  objc_storeStrong((id *)&self->_caseColor, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
