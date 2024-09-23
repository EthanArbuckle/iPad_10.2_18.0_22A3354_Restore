@implementation PRPosterEnvironmentImpl

- (PRPosterEnvironmentImpl)initWithSceneSettings:(id)a3 traitCollection:(id)a4 targetConfig:(id)a5 extensionBundleURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PRPosterEnvironmentImpl *v14;
  uint64_t v15;
  FBSSceneSettings *settings;
  uint64_t v17;
  UITraitCollection *traitCollection;
  uint64_t v19;
  NSURL *bundleURL;
  uint64_t v21;
  double v22;
  double v23;
  PREditorElementLayoutController *v24;
  PREditorElementLayoutController *layoutController;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PRPosterEnvironmentImpl;
  v14 = -[PRPosterEnvironmentImpl init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    settings = v14->_settings;
    v14->_settings = (FBSSceneSettings *)v15;

    v17 = objc_msgSend(v11, "copy");
    traitCollection = v14->_traitCollection;
    v14->_traitCollection = (UITraitCollection *)v17;

    v19 = objc_msgSend(v13, "copy");
    bundleURL = v14->_bundleURL;
    v14->_bundleURL = (NSURL *)v19;

    objc_storeStrong((id *)&v14->_targetConfig, a5);
    v14->_lock._os_unfair_lock_opaque = 0;
    v21 = -[PRPosterEnvironmentImpl luminance](v14, "luminance");
    v22 = 0.0;
    if (v21 == 2)
      v22 = 1.0;
    v14->_backlightProgress = v22;
    v14->_linearBacklightProgress = v22;
    objc_msgSend(v10, "pr_unlockProgress");
    v14->_unlockProgress = v23;
    v14->_wakeSourceIsSwipeToUnlock = objc_msgSend(v10, "pr_wakeSourceIsSwipeToUnlock");
    v24 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", v14);
    layoutController = v14->_layoutController;
    v14->_layoutController = v24;

    v14->_boundingShape = PRPosterBoundingShapeFromPUIPosterBoundingShape(objc_msgSend(v10, "pui_posterBoundingShape"));
  }

  return v14;
}

- (CGRect)screenBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  int IsActive;
  FBSSceneSettings *settings;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[FBSSceneSettings bounds](self->_settings, "bounds");
  v4 = v3;
  v6 = v5;
  IsActive = PUIDynamicRotationIsActive();
  settings = self->_settings;
  if (IsActive)
  {
    if ((unint64_t)(-[FBSSceneSettings pui_deviceOrientation](settings, "pui_deviceOrientation") - 3) >= 2)
    {
LABEL_3:
      if (v6 >= v4)
        v9 = v4;
      else
        v9 = v6;
      if (v6 >= v4)
        v10 = v6;
      else
        v10 = v4;
      goto LABEL_16;
    }
  }
  else
  {
    -[FBSSceneSettings interfaceOrientation](settings, "interfaceOrientation");
    if (!BSInterfaceOrientationIsLandscape())
      goto LABEL_3;
  }
  if (v6 >= v4)
    v9 = v6;
  else
    v9 = v4;
  if (v6 >= v4)
    v10 = v4;
  else
    v10 = v6;
LABEL_16:
  v11 = 0.0;
  v12 = 0.0;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIColor)caseColor
{
  void *v2;
  void *v3;

  -[FBSSceneSettings pr_caseColor](self->_settings, "pr_caseColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UIColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (int64_t)userInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[PRPosterEnvironmentImpl traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  return v3;
}

- (int64_t)deviceOrientation
{
  return -[FBSSceneSettings pui_deviceOrientation](self->_settings, "pui_deviceOrientation");
}

- (CGRect)contentCutoutBounds
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxY;
  double Width;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  if (-[FBSSceneSettings pui_isComplicationRowConfigured](self->_settings, "pui_isComplicationRowConfigured"))v3 = 11;
  else
    v3 = 3;
  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self->_layoutController, "frameForElements:variant:withBoundingRect:", v3, 1);
  MaxY = CGRectGetMaxY(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  Width = CGRectGetWidth(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:", 0.0, MaxY, Width, CGRectGetHeight(v20) - MaxY);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)floatingObscurableBounds
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  v21 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self->_layoutController, "frameForElements:variant:withBoundingRect:", 1, 1);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MinY = CGRectGetMinY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = MinY + CGRectGetHeight(v23) * 0.75;
  v24.origin.x = v21;
  v24.origin.y = v5;
  v24.size.width = v7;
  v24.size.height = v9;
  v16 = CGRectGetWidth(v24);
  v25.origin.x = v21;
  v25.origin.y = v5;
  v25.size.width = v7;
  v25.size.height = v9;
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:", 0.0, v15, v16, CGRectGetHeight(v25) - v15);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)titleBoundsForLayout:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self->_layoutController, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rect");
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3
{
  double width;
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double height;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  v6 = v17.origin.x;
  v7 = v17.origin.y;
  v8 = v17.size.width;
  v9 = v17.size.height;
  v10 = CGRectGetWidth(v17);
  v18.origin.x = v6;
  v18.origin.y = v7;
  v18.size.width = v8;
  v18.size.height = v9;
  v11 = CGRectGetHeight(v18);
  v12 = y / v11;
  v13 = width / v10;
  v14 = height / v11;
  v15 = x / v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (BOOL)isDepthEffectDisallowed
{
  return -[FBSSceneSettings pr_isDepthEffectDisallowed](self->_settings, "pr_isDepthEffectDisallowed");
}

- (BOOL)isDepthEffectDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PRPosterEnvironmentImpl targetConfiguredProperties](self, "targetConfiguredProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "renderingConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDepthEffectDisabled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)role
{
  void *v2;
  void *v3;

  -[PRPosterEnvironmentImpl contents](self, "contents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PRPosterEnvironmentContext)context
{
  return (PRPosterEnvironmentContext *)+[PRPosterEnvironmentContext environmentContextForSettings:](PRPosterEnvironmentContext, "environmentContextForSettings:", self->_settings);
}

- (PRTimeFontConfiguration)sourceTimeFontConfiguration
{
  os_unfair_lock_s *p_lock;
  id v4;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = 0;
  -[PRPosterEnvironmentImpl _lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:](self, "_lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:", 0, 0, &v6, 0);
  v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRTimeFontConfiguration *)v4;
}

- (BOOL)isPreview
{
  -[FBSSceneSettings pui_content](self->_settings, "pui_content");
  return PUIRenderingContentIsPreview();
}

- (BOOL)isSnapshot
{
  return -[FBSSceneSettings pui_isSnapshot](self->_settings, "pui_isSnapshot");
}

- (BOOL)isLowLuminance
{
  return -[PRPosterEnvironmentImpl luminance](self, "luminance") == 1;
}

- (int64_t)luminance
{
  return -[FBSSceneSettings pr_adjustedLuminance](self->_settings, "pr_adjustedLuminance");
}

- (unint64_t)significantEventsCounter
{
  return -[FBSSceneSettings pui_significantEventsCounter](self->_settings, "pui_significantEventsCounter");
}

- (PRPosterContents)contents
{
  os_unfair_lock_s *p_lock;
  id v4;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = 0;
  -[PRPosterEnvironmentImpl _lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:](self, "_lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:", &v6, 0, 0, 0);
  v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRPosterContents *)v4;
}

- (BOOL)isParallaxEnabled
{
  return -[FBSSceneSettings pr_isParallaxEffectivelyEnabled](self->_settings, "pr_isParallaxEffectivelyEnabled");
}

- (CGSize)desiredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  if (v3 >= v4)
    v5 = v3;
  else
    v5 = v4;
  if (-[FBSSceneSettings pr_isParallaxEffectivelyEnabled](self->_settings, "pr_isParallaxEffectivelyEnabled"))
  {
    -[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom");
    PUIPosterParallaxDesiredOverhangForDeviceClass();
    v7 = v5 + v6 + v6;
    v5 = v5 + v8 + v8;
  }
  else
  {
    v7 = v5;
  }
  v9 = v5;
  result.height = v9;
  result.width = v7;
  return result;
}

- (CGSize)minimumContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PRPosterEnvironmentImpl screenBounds](self, "screenBounds");
  v4 = v3;
  v6 = v5;
  if (-[FBSSceneSettings pr_isParallaxEffectivelyEnabled](self->_settings, "pr_isParallaxEffectivelyEnabled"))
  {
    -[UITraitCollection userInterfaceIdiom](self->_traitCollection, "userInterfaceIdiom");
    PUIPosterParallaxRequiredOverhangForDeviceClass();
    v4 = v4 + v7 + v7;
    v6 = v6 + v8 + v8;
  }
  v9 = v4;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (unint64_t)titleAlignment
{
  return -[FBSSceneSettings pr_titleAlignment](self->_settings, "pr_titleAlignment");
}

- (PRPosterAmbientEnvironment)ambientEnvironment
{
  PRPosterAmbientEnvironmentImpl *v3;
  void *v4;
  PRPosterAmbientEnvironmentImpl *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = [PRPosterAmbientEnvironmentImpl alloc];
    -[PRPosterEnvironmentImpl traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PRPosterAmbientEnvironmentImpl initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  }
  else
  {
    v5 = 0;
  }
  return (PRPosterAmbientEnvironment *)v5;
}

- (BOOL)isFloatingViewSnapshot
{
  return -[FBSSceneSettings pui_isFloatingLayerSnapshot](self->_settings, "pui_isFloatingLayerSnapshot");
}

- (PRPosterConfigurableOptions)sourceConfigurableOptions
{
  os_unfair_lock_s *p_lock;
  id v4;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = 0;
  -[PRPosterEnvironmentImpl _lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:](self, "_lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:", 0, &v6, 0, 0);
  v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRPosterConfigurableOptions *)v4;
}

- (id)_targetConfiguredProperties
{
  os_unfair_lock_s *p_lock;
  PRPosterMutableConfiguredProperties *lock_targetConfiguredProperties;
  PRPosterMutableConfiguredProperties *v5;
  id obj;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  if (!lock_targetConfiguredProperties)
  {
    obj = 0;
    -[PRPosterEnvironmentImpl _lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:](self, "_lock_hydratePosterContents:sourceConfigurableOptions:sourceTitleFontConfiguration:targetConfigurableProperties:", 0, 0, 0, &obj);
    objc_storeStrong((id *)&self->_lock_targetConfiguredProperties, obj);
    lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  }
  v5 = lock_targetConfiguredProperties;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_lock_hydratePosterContents:(id *)a3 sourceConfigurableOptions:(id *)a4 sourceTitleFontConfiguration:(id *)a5 targetConfigurableProperties:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  PRPosterConfiguredProperties *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  id *p_lock_sourceConfigurableOptions;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  char v26;
  PRPosterContentsInternal *v27;
  PRPosterContentsInternal *lock_sourceContents;
  PRPosterConfiguredProperties *v29;
  void *v30;
  PRPosterContentsInternal *v31;
  void *v32;
  void *v33;
  void *v34;
  PRPosterContentsInternal *v35;
  PRPosterContentsInternal *v36;
  id v37;
  PRPosterConfigurableOptions *v38;
  uint64_t v39;
  id v40;
  id *p_lock_targetConfiguredProperties;
  uint64_t v42;
  void *v43;
  void *v44;
  PRTimeFontConfiguration *v45;
  PRTimeFontConfiguration *v46;
  PRTimeFontConfiguration *v47;
  void *v48;
  void *v49;
  void *v50;
  PRTimeFontConfiguration *v51;
  PRTimeFontConfiguration *lock_sourceTitleFontConfiguration;
  id v53;
  PRPosterContentsInternal *v54;
  void *v55;
  uint64_t v57;
  id v58;

  -[FBSSceneSettings pui_posterContents](self->_settings, "pui_posterContents");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSettings pr_posterConfigurableOptions](self->_settings, "pr_posterConfigurableOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "role");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D7F950]) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D7F940]))
  {
    v13 = a4;
    v14 = [PRPosterConfiguredProperties alloc];
    -[FBSSceneSettings pr_posterTitleStyleConfiguration](self->_settings, "pr_posterTitleStyleConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:](v14, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v15, 0, 0, 0, 0, 0, 0, 0, 0);
LABEL_4:
    v57 = v16;

    goto LABEL_5;
  }
  v13 = a4;
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D7F928]))
  {
    v29 = [PRPosterConfiguredProperties alloc];
    -[FBSSceneSettings pr_posterAmbientConfiguration](self->_settings, "pr_posterAmbientConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PRPosterConfiguredProperties initWithAmbientConfiguration:widgetLayout:otherMetadata:](v29, "initWithAmbientConfiguration:widgetLayout:otherMetadata:", v15, 0, 0);
    goto LABEL_4;
  }
  +[PRPosterConfiguredProperties defaultConfiguredPropertiesForRole:](PRPosterConfiguredProperties, "defaultConfiguredPropertiesForRole:", v12);
  v57 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v17 = objc_msgSend(v10, "type");
  v18 = v17;
  v55 = v12;
  if (self->_lock_sourceContents)
    goto LABEL_6;
  v23 = v17 - 1;
  objc_msgSend(0, "_path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 <= 2)
  {
    v26 = objc_msgSend(v24, "isEqual:", v58);

    if ((v26 & 1) != 0)
      goto LABEL_6;
    if (v18 == 3)
    {
      v19 = a6;
      v27 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", v58);
      lock_sourceContents = self->_lock_sourceContents;
      self->_lock_sourceContents = v27;

      p_lock_sourceConfigurableOptions = (id *)&self->_lock_sourceConfigurableOptions;
LABEL_14:
      v21 = (void *)v57;
      goto LABEL_24;
    }
    v54 = -[PRPosterDescriptor _initWithPath:]([PRPosterDescriptor alloc], "_initWithPath:", v58);
    v34 = self->_lock_sourceContents;
    self->_lock_sourceContents = v54;
LABEL_45:

    goto LABEL_6;
  }
  objc_msgSend(v24, "serverIdentity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = self->_lock_sourceContents;
    self->_lock_sourceContents = 0;

  }
  if (!self->_lock_sourceContents)
  {
    v32 = (void *)MEMORY[0x1E0D7F8D0];
    objc_msgSend(v10, "role");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "temporaryPathForRole:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = -[PRPosterConfiguration _initWithPath:]([PRPosterConfiguration alloc], "_initWithPath:", v34);
    v36 = self->_lock_sourceContents;
    self->_lock_sourceContents = v35;

    objc_msgSend(v34, "invalidate");
    goto LABEL_45;
  }
LABEL_6:
  v19 = a6;
  p_lock_sourceConfigurableOptions = (id *)&self->_lock_sourceConfigurableOptions;
  if (self->_lock_sourceConfigurableOptions || v18 == 3)
    goto LABEL_14;
  v21 = (void *)v57;
  if (v11)
  {
    v22 = v11;
  }
  else
  {
    -[PRPosterContentsInternal loadConfigurableOptionsWithError:](self->_lock_sourceContents, "loadConfigurableOptionsWithError:", 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = *p_lock_sourceConfigurableOptions;
  *p_lock_sourceConfigurableOptions = v22;

  if (!*p_lock_sourceConfigurableOptions)
  {
    v38 = [PRPosterConfigurableOptions alloc];
    v39 = -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:](v38, "initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", 0, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0.5);
    v40 = *p_lock_sourceConfigurableOptions;
    *p_lock_sourceConfigurableOptions = (id)v39;

  }
LABEL_24:
  if (!self->_lock_sourceTitleFontConfiguration && self->_bundleURL)
  {
    if (!v21)
    {
      v47 = [PRTimeFontConfiguration alloc];
      v48 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v10, "role");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "pr_defaultTimeFontIdentifierForRole:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:](v47, "initWithTimeFontIdentifier:", v50);
      lock_sourceTitleFontConfiguration = self->_lock_sourceTitleFontConfiguration;
      self->_lock_sourceTitleFontConfiguration = v51;

      v21 = (void *)v57;
      p_lock_targetConfiguredProperties = (id *)&self->_lock_targetConfiguredProperties;
      if (self->_lock_targetConfiguredProperties)
        goto LABEL_35;
      goto LABEL_33;
    }
    objc_msgSend(v21, "titleStyleConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "timeFontConfiguration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "timeFontConfigurationWithExtensionBundleURL:", self->_bundleURL);
    v45 = (PRTimeFontConfiguration *)objc_claimAutoreleasedReturnValue();
    v46 = self->_lock_sourceTitleFontConfiguration;
    self->_lock_sourceTitleFontConfiguration = v45;

  }
  p_lock_targetConfiguredProperties = (id *)&self->_lock_targetConfiguredProperties;
  if (self->_lock_targetConfiguredProperties)
    goto LABEL_35;
  if (!v21)
  {
LABEL_33:
    v42 = objc_opt_new();
    goto LABEL_34;
  }
  v42 = objc_msgSend(v21, "mutableCopy");
LABEL_34:
  v53 = *p_lock_targetConfiguredProperties;
  *p_lock_targetConfiguredProperties = (id)v42;

LABEL_35:
  if (a3)
    *a3 = objc_retainAutorelease(self->_lock_sourceContents);
  if (v13)
    *v13 = objc_retainAutorelease(*p_lock_sourceConfigurableOptions);
  if (a5)
    *a5 = objc_retainAutorelease(self->_lock_sourceTitleFontConfiguration);
  if (v19)
    *v19 = objc_retainAutorelease(*p_lock_targetConfiguredProperties);

}

- (PRMutablePosterConfiguration)targetConfiguration
{
  return self->_targetConfig;
}

- (void)_applyToSceneSettings:(id)a3
{
  FBSSceneSettings *settings;
  void *v5;
  id v6;

  settings = self->_settings;
  v6 = a3;
  -[FBSSceneSettings pr_caseColor](settings, "pr_caseColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pr_setCaseColor:", v5);

  objc_msgSend(v6, "pui_setUserInterfaceStyle:", -[FBSSceneSettings pui_userInterfaceStyle](self->_settings, "pui_userInterfaceStyle"));
  objc_msgSend(v6, "pui_setMode:", -[FBSSceneSettings pui_mode](self->_settings, "pui_mode"));
  -[FBSSceneSettings pr_unlockProgress](self->_settings, "pr_unlockProgress");
  objc_msgSend(v6, "pr_setUnlockProgress:");

}

- (void)_appendDescriptionToStream:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = a3;
  -[PRPosterEnvironmentImpl caseColor](self, "caseColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v18, "appendObject:withName:skipIfNil:", v4, CFSTR("caseColor"), 1);

  -[PRPosterEnvironmentImpl traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInterfaceStyle");
  UIApplicationSceneStringForUserInterfaceStyle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v18, "appendObject:withName:", v7, CFSTR("uiStyle"));

  NSStringFromPRRenderingMode(-[PRPosterEnvironmentImpl mode](self, "mode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v18, "appendObject:withName:", v9, CFSTR("mode"));

  -[PRPosterEnvironmentImpl luminance](self, "luminance");
  NSStringFromBLSAdjustedLuminance();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v18, "appendObject:withName:", v11, CFSTR("luminance"));

  v13 = (id)objc_msgSend(v18, "appendBool:withName:ifEqualTo:", -[PRPosterEnvironmentImpl isDepthEffectDisallowed](self, "isDepthEffectDisallowed"), CFSTR("depthEffectDisallowed"), 1);
  -[PRPosterEnvironmentImpl unlockProgress](self, "unlockProgress");
  v14 = (id)objc_msgSend(v18, "appendFloat:withName:decimalPrecision:", CFSTR("unlockProgress"), 3);
  -[PRPosterEnvironmentImpl backlightProgress](self, "backlightProgress");
  v15 = (id)objc_msgSend(v18, "appendFloat:withName:decimalPrecision:", CFSTR("backlightProgress"), 3);
  v16 = (id)objc_msgSend(v18, "appendBool:withName:", -[PRPosterEnvironmentImpl wakeSourceIsSwipeToUnlock](self, "wakeSourceIsSwipeToUnlock"), CFSTR("wakeSourceIsSwipeToUnlock"));
  v17 = (id)objc_msgSend(v18, "appendUnsignedInteger:withName:", -[PRPosterEnvironmentImpl significantEventsCounter](self, "significantEventsCounter"), CFSTR("significantEventsCounter"));

}

- (int64_t)mode
{
  return -[FBSSceneSettings pui_mode](self->_settings, "pui_mode");
}

- (void)invalidate
{
  FBSSceneSettings *settings;
  UITraitCollection *traitCollection;
  NSURL *bundleURL;
  PRMutablePosterConfiguration *targetConfig;
  PRPosterContentsInternal *lock_sourceContents;
  PRPosterConfigurableOptions *lock_sourceConfigurableOptions;
  PRTimeFontConfiguration *lock_sourceTitleFontConfiguration;
  PRPosterMutableConfiguredProperties *lock_targetConfiguredProperties;
  PREditorElementLayoutController *layoutController;

  settings = self->_settings;
  self->_settings = 0;

  traitCollection = self->_traitCollection;
  self->_traitCollection = 0;

  bundleURL = self->_bundleURL;
  self->_bundleURL = 0;

  targetConfig = self->_targetConfig;
  self->_targetConfig = 0;

  os_unfair_lock_lock(&self->_lock);
  lock_sourceContents = self->_lock_sourceContents;
  self->_lock_sourceContents = 0;

  lock_sourceConfigurableOptions = self->_lock_sourceConfigurableOptions;
  self->_lock_sourceConfigurableOptions = 0;

  lock_sourceTitleFontConfiguration = self->_lock_sourceTitleFontConfiguration;
  self->_lock_sourceTitleFontConfiguration = 0;

  lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  self->_lock_targetConfiguredProperties = 0;

  os_unfair_lock_unlock(&self->_lock);
  layoutController = self->_layoutController;
  self->_layoutController = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterEnvironmentImpl *v4;

  v4 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:]([PRPosterEnvironmentImpl alloc], "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", self->_settings, self->_traitCollection, self->_targetConfig, self->_bundleURL);
  -[PRPosterEnvironmentImpl setBacklightProgress:](v4, "setBacklightProgress:", self->_backlightProgress);
  -[PRPosterEnvironmentImpl setLinearBacklightProgress:](v4, "setLinearBacklightProgress:", self->_linearBacklightProgress);
  -[PRPosterEnvironmentImpl setUnlockProgress:](v4, "setUnlockProgress:", self->_unlockProgress);
  -[PRPosterEnvironmentImpl setWakeSourceIsSwipeToUnlock:](v4, "setWakeSourceIsSwipeToUnlock:", self->_wakeSourceIsSwipeToUnlock);
  return v4;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(int8x16_t *);
  void *v10;
  id v11;
  PRPosterEnvironmentImpl *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __38__PRPosterEnvironmentImpl_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __38__PRPosterEnvironmentImpl_description__block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__PRPosterEnvironmentImpl_description__block_invoke_2;
  v2[3] = &unk_1E2183900;
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  objc_msgSend((id)v1.i64[0], "appendBodySectionWithName:block:", 0, v2);

}

uint64_t __38__PRPosterEnvironmentImpl_description__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appendDescriptionToStream:", *(_QWORD *)(a1 + 40));
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)backlightProgress
{
  return self->_backlightProgress;
}

- (void)setBacklightProgress:(double)a3
{
  self->_backlightProgress = a3;
}

- (double)linearBacklightProgress
{
  return self->_linearBacklightProgress;
}

- (void)setLinearBacklightProgress:(double)a3
{
  self->_linearBacklightProgress = a3;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (void)setUnlockProgress:(double)a3
{
  self->_unlockProgress = a3;
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_wakeSourceIsSwipeToUnlock = a3;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_lock_targetConfiguredProperties, 0);
  objc_storeStrong((id *)&self->_lock_sourceTitleFontConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_sourceConfigurableOptions, 0);
  objc_storeStrong((id *)&self->_lock_sourceContents, 0);
  objc_storeStrong((id *)&self->_targetConfig, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
