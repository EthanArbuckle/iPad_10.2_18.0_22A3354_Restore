@implementation SBUISystemApertureElementConfiguration

- (NSString)elementIdentifier
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_stringforSetting:", 3213043);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)contentRole
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_contentRoleforSetting:", 3213018);

  return v3;
}

- (int64_t)preferredLayoutMode
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213019);

  return v3;
}

- (int64_t)minimumLayoutMode
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213020);

  return v3;
}

- (int64_t)maximumLayoutMode
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213021);

  return v3;
}

- (int64_t)appliedLayoutMode
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_layoutModeforSetting:", 3213022);

  return v3;
}

- (NSDirectionalEdgeInsets)preferredOutsetsFromUnsafeArea
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSDirectionalEdgeInsets result;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_directionalEdgeInsetsforSetting:", 3213033);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.trailing = v14;
  result.bottom = v13;
  result.leading = v12;
  result.top = v11;
  return result;
}

- (NSValue)preferredPaddingForCompactLayout
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3213040);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSValue *)v3;
}

- (BOOL)SBUISA_attachedMinimalViewRequiresZeroPadding
{
  void *v2;
  void *v3;
  char v4;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3213041);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)preferredHeightForBottomSafeArea
{
  double v2;

  -[SBUISystemApertureElementConfiguration preferredOutsetsFromUnsafeArea](self, "preferredOutsetsFromUnsafeArea");
  return -v2;
}

- (NSString)associatedScenePersistenceIdentifier
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_stringforSetting:", 3213023);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_stringforSetting:", 3213037);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)launchURL
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_URLforSetting:", 3213051);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BSAction)launchAction
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_BSActionforSetting:", 3213052);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAction *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_backgroundActivityIdentifiersForSetting:", 3213034);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (CGSize)preferredCustomAspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_CGSizeforSetting:", 3213035);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)preferredCustomLayout
{
  void *v2;
  int64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_customLayoutModeforSetting:", 3213036);

  return v3;
}

- (BOOL)hasMenuPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3213038);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setElementIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration elementIdentifier](self, "elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213043);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (BOOL)preventsInteractiveDismissal
{
  void *v2;
  void *v3;
  char v4;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3213048);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)preventsAutomaticDismissal
{
  void *v2;
  void *v3;
  char v4;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3213049);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (UIColor)keyColor
{
  void *v2;
  void *v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBUISA_UIColorForSetting:", 3213050);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (unint64_t)presentationBehaviors
{
  void *v2;
  unint64_t v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  return v3;
}

- (BOOL)attachedMinimalViewRequiresZeroPadding
{
  void *v2;
  char v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3213041);

  return v3;
}

- (BOOL)prefersFixedPortraitOrientation
{
  void *v2;
  char v3;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3213042);

  return v3;
}

- (void)setContentRole:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration contentRole](self, "contentRole") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setContentRole:forSetting:", a3, 3213018);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration preferredLayoutMode](self, "preferredLayoutMode") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213019);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setMinimumLayoutMode:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213020);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration maximumLayoutMode](self, "maximumLayoutMode") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213021);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setAppliedLayoutMode:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration appliedLayoutMode](self, "appliedLayoutMode") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setLayoutMode:forSetting:", a3, 3213022);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  double v5;

  -[SBUISystemApertureElementConfiguration preferredHeightForBottomSafeArea](self, "preferredHeightForBottomSafeArea");
  if (v5 != a3)
    -[SBUISystemApertureElementConfiguration setPreferredOutsetsfromUnsafeArea:](self, "setPreferredOutsetsfromUnsafeArea:", 0.0, -1000.0, -a3, -1000.0);
}

- (void)setPreferredOutsetsfromUnsafeArea:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  -[SBUISystemApertureElementConfiguration preferredOutsetsFromUnsafeArea](self, "preferredOutsetsFromUnsafeArea");
  if (leading != v11 || top != v8 || trailing != v10 || bottom != v9)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "SBUISA_setDirectionalEdgeInsets:forSetting:", 3213033, top, leading, bottom, trailing);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreferredPaddingForCompactLayout:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration preferredPaddingForCompactLayout](self, "preferredPaddingForCompactLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "directionalEdgeInsetsValue");
  objc_msgSend(v4, "directionalEdgeInsetsValue");
  if (!BSFloatApproximatelyEqualToFloat()
    || (v5 = BSFloatApproximatelyEqualToFloat(), (v7 == 0) ^ (v4 == 0))
    || !v5)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forSetting:", v7, 3213040);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setAttachedMinimalViewRequiresZeroPadding:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBUISystemApertureElementConfiguration attachedMinimalViewRequiresZeroPadding](self, "attachedMinimalViewRequiresZeroPadding") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 3213041);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPrefersFixedPortraitOrientation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBUISystemApertureElementConfiguration prefersFixedPortraitOrientation](self, "prefersFixedPortraitOrientation") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 3213042);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration associatedScenePersistenceIdentifier](self, "associatedScenePersistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213023);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setString:forSetting:", v7, 3213037);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setLaunchURL:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration launchURL](self, "launchURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setURL:forSetting:", v7, 3213051);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setLaunchAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration launchAction](self, "launchAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setBSAction:forSetting:", v7, 3213052);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualSets();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setBackgroundActivityIdentifiers:forSetting:", v7, 3213034);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)setPreferredCustomAspectRatio:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v9;

  height = a3.height;
  width = a3.width;
  -[SBUISystemApertureElementConfiguration preferredCustomAspectRatio](self, "preferredCustomAspectRatio");
  if (width != v7 || height != v6)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "SBUISA_setCGSize:forSetting:", 3213035, width, height);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreferredCustomLayout:(int64_t)a3
{
  void *v5;

  if (-[SBUISystemApertureElementConfiguration preferredCustomLayout](self, "preferredCustomLayout") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "SBUISA_setCustomLayout:forSetting:", a3, 3213036);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setHasMenuPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBUISystemApertureElementConfiguration hasMenuPresentation](self, "hasMenuPresentation") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 3213038);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  if (v6 != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", v8, 3213039);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBUISystemApertureElementConfiguration preventsInteractiveDismissal](self, "preventsInteractiveDismissal") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 3213048);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (-[SBUISystemApertureElementConfiguration preventsAutomaticDismissal](self, "preventsAutomaticDismissal") != a3)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forSetting:", v6, 3213049);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
}

- (void)setKeyColor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBUISystemApertureElementConfiguration keyColor](self, "keyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SBUISA_setUIColor:forSetting:", v7, 3213050);

    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (BSMutableSettings)_storage
{
  BSMutableSettings *storage;
  BSMutableSettings *v4;
  BSMutableSettings *v5;

  storage = self->__storage;
  if (!storage)
  {
    v4 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    v5 = self->__storage;
    self->__storage = v4;

    storage = self->__storage;
  }
  return storage;
}

- (BSSettings)otherSceneClientSettingsRepresentation
{
  BSSettings *otherSceneClientSettingsRepresentation;
  void *v4;
  BSSettings *v5;
  BSSettings *v6;

  -[SBUISystemApertureElementConfiguration _updateStorageForViewPropertiesIfNeeded](self, "_updateStorageForViewPropertiesIfNeeded");
  otherSceneClientSettingsRepresentation = self->_otherSceneClientSettingsRepresentation;
  if (!otherSceneClientSettingsRepresentation)
  {
    -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (BSSettings *)objc_msgSend(v4, "copy");
    v6 = self->_otherSceneClientSettingsRepresentation;
    self->_otherSceneClientSettingsRepresentation = v5;

    otherSceneClientSettingsRepresentation = self->_otherSceneClientSettingsRepresentation;
  }
  return otherSceneClientSettingsRepresentation;
}

- (BOOL)_elementRequiresConstraintBasedLayout
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[SBUISystemApertureElementConfiguration _strongElementViewController](self, "_strongElementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isViewLoaded"))
  {
    -[SBUISystemApertureElementConfiguration _strongElementViewController](self, "_strongElementViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "translatesAutoresizingMaskIntoConstraints") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_elementSupportsDynamicResizing
{
  void *v2;
  char v3;

  -[SBUISystemApertureElementConfiguration _strongElementViewController](self, "_strongElementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setShouldDeferViewSizingPreferenceUpdates:(BOOL)a3
{
  if (self->_shouldDeferViewSizingPreferenceUpdates != a3)
    self->_shouldDeferViewSizingPreferenceUpdates = a3;
}

- (CGSize)maximumAccessoryViewSizeForLayoutMode:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SBUISystemApertureElementConfiguration containerViewController](self, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maximumLeadingTrailingViewSize");
    v7 = v11;
    v9 = v12;

  }
  v13 = v7;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_updateStorageForViewPropertiesIfNeeded
{
  if (!-[SBUISystemApertureElementConfiguration shouldDeferViewSizingPreferenceUpdates](self, "shouldDeferViewSizingPreferenceUpdates"))-[SBUISystemApertureElementConfiguration _updateStorageForViewProperties](self, "_updateStorageForViewProperties");
}

- (void)_updateStorageForViewProperties
{
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  _QWORD *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  CGFloat v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  void *v83;
  double v84;
  double v85;
  CGFloat v86;
  double Width;
  CGFloat v88;
  double v89;
  CGFloat v90;
  void *v91;
  uint64_t v92;
  void *v93;
  double MaxX;
  double MinX;
  void *v96;
  double v97;
  double v98;
  CGFloat v99;
  void *v100;
  void *v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat recta;
  CGFloat rect;
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[5];
  id v110;
  SEL v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  -[SBUISystemApertureElementConfiguration _storage](self, "_storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __73__SBUISystemApertureElementConfiguration__updateStorageForViewProperties__block_invoke;
  v109[3] = &unk_1E4C3FEB0;
  v109[4] = self;
  v5 = v4;
  v110 = v5;
  v111 = a2;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85A1798](v109);
  -[SBUISystemApertureElementConfiguration minimalView](self, "minimalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v7, 2, 3213031, 3213026, 3213046);

  -[SBUISystemApertureElementConfiguration detachedMinimalView](self, "detachedMinimalView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v8, 2, 3213032, 3213027, 3213047);

  -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v9, 3, 3213030, 3213025, 3213045);

  -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, uint64_t))v6)[2](v6, v10, 3, 3213029, 3213024, 3213044);

  -[SBUISystemApertureElementConfiguration _strongElementViewController](self, "_strongElementViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "contextId");
  if (objc_msgSend(v5, "SBUISA_contextIdforSetting:", 3213028) != (_DWORD)v15)
  {
    objc_msgSend(v5, "SBUISA_setContextId:forSetting:", v15, 3213028);
    -[SBUISystemApertureElementConfiguration _invalidateOtherSceneClientSettingsRepresentation](self, "_invalidateOtherSceneClientSettingsRepresentation");
  }
  if (!-[SBUISystemApertureElementConfiguration _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing"))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementConfiguration.m"), 482, CFSTR("Elements that don't support dynamic layout must implement -[SBUISystemApertureElement preferredHeightForBottomSafeArea]"));

    }
    objc_msgSend(v11, "preferredHeightForBottomSafeArea");
    -[SBUISystemApertureElementConfiguration setPreferredHeightForBottomSafeArea:](self, "setPreferredHeightForBottomSafeArea:");
    v18 = (void *)MEMORY[0x1E0CB3B18];
    v107[0] = *MEMORY[0x1E0CEBDE0];
    v107[1] = v107[0];
    v107[2] = v107[0];
    v107[3] = v107[0];
    v19 = v107;
    goto LABEL_33;
  }
  if (objc_msgSend(v11, "activeLayoutMode") == 4)
  {
    objc_msgSend(v11, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "translatesAutoresizingMaskIntoConstraints");

    if ((v17 & 1) != 0)
    {
      -[SBUISystemApertureElementConfiguration preferredContentSizeClampedToMaximumExpandedSize](self, "preferredContentSizeClampedToMaximumExpandedSize");
      goto LABEL_19;
    }
    objc_msgSend(v11, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
LABEL_18:

    goto LABEL_19;
  }
  -[SBUISystemApertureElementConfiguration preferredOutsetsFromUnsafeArea](self, "preferredOutsetsFromUnsafeArea");
  if (*(double *)(MEMORY[0x1E0CEA080] + 8) != v23
    || *MEMORY[0x1E0CEA080] != v20
    || *(double *)(MEMORY[0x1E0CEA080] + 24) != v22
    || *(double *)(MEMORY[0x1E0CEA080] + 16) != v21)
  {
    goto LABEL_22;
  }
  -[SBUISystemApertureElementConfiguration preferredContentSizeClampedToMaximumExpandedSize](self, "preferredContentSizeClampedToMaximumExpandedSize");
  if (v25 == *MEMORY[0x1E0C9D820] && v24 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "minimumExpandedSize");
    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend(v11, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layoutFrame");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v11, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutFrame");
  UIRoundToScale();

  v112.origin.x = v30;
  v112.origin.y = v32;
  v112.size.width = v34;
  v112.size.height = v36;
  CGRectGetHeight(v112);
  UIRoundToScale();
  if (-[SBUISystemApertureElementConfiguration preferredCustomLayout](self, "preferredCustomLayout") == 4)
    UIRoundToScale();
  UIRoundToScale();
  v40 = v39;
  UIRoundToScale();
  v42 = v41;
  UIRoundToScale();
  v44 = v43;
  UIRoundToScale();
  -[SBUISystemApertureElementConfiguration setPreferredOutsetsfromUnsafeArea:](self, "setPreferredOutsetsfromUnsafeArea:", v40, v42, v44, v45);
LABEL_22:
  if (objc_msgSend(v11, "activeLayoutMode") == 3)
  {
    -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    objc_msgSend(v11, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "convertRect:toView:", v56, v49, v51, v53, v55);
    v58 = v57;
    v60 = v59;
    recta = v61;
    v63 = v62;

    -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bounds");
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    objc_msgSend(v11, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "convertRect:toView:", v74, v67, v69, v71, v73);
    v76 = v75;
    v78 = v77;
    v80 = v79;
    v82 = v81;

    +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "maximumLeadingTrailingViewSize");
    v85 = v84;

    v103 = v60;
    v104 = v58;
    v113.origin.x = v58;
    v113.origin.y = v60;
    v86 = v78;
    v113.size.width = recta;
    rect = v63;
    v113.size.height = v63;
    Width = CGRectGetWidth(v113);
    if (Width <= v85)
      v88 = Width;
    else
      v88 = v85;
    v114.origin.x = v76;
    v114.origin.y = v78;
    v114.size.width = v80;
    v114.size.height = v82;
    v89 = CGRectGetWidth(v114);
    if (v89 <= v85)
      v90 = v89;
    else
      v90 = v85;
    objc_msgSend(v11, "view");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "effectiveUserInterfaceLayoutDirection");

    if (v92)
    {
      objc_msgSend(v11, "view");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "bounds");
      MaxX = CGRectGetMaxX(v115);
      v116.origin.y = v103;
      v116.origin.x = v104;
      v116.size.width = v88;
      v116.size.height = rect;
      v102 = MaxX - CGRectGetMaxX(v116);

      v117.origin.x = v76;
      v117.origin.y = v78;
      v117.size.width = v90;
      v117.size.height = v82;
      MinX = CGRectGetMinX(v117);
    }
    else
    {
      v118.origin.y = v103;
      v118.origin.x = v104;
      v118.size.width = v88;
      v118.size.height = rect;
      v102 = CGRectGetMinX(v118);
      objc_msgSend(v11, "view");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "bounds");
      v97 = CGRectGetMaxX(v119);
      v120.origin.x = v76;
      v120.origin.y = v86;
      v120.size.width = v90;
      v120.size.height = v82;
      MinX = v97 - CGRectGetMaxX(v120);

    }
    v121.origin.y = v103;
    v121.origin.x = v104;
    v121.size.width = v88;
    v121.size.height = rect;
    v98 = fmax(v85 - CGRectGetWidth(v121), 0.0);
    v122.origin.x = v76;
    v122.origin.y = v86;
    v122.size.width = v90;
    v122.size.height = v82;
    v99 = CGRectGetWidth(v122);
    v18 = (void *)MEMORY[0x1E0CB3B18];
    v108[0] = 0;
    v108[1] = fmax(fmin(v102, v98), 0.0);
    v108[2] = 0;
    v108[3] = fmax(fmin(MinX, fmax(v85 - v99, 0.0)), 0.0);
    v19 = v108;
LABEL_33:
    objc_msgSend(v18, "valueWithBytes:objCType:", v19, "{NSDirectionalEdgeInsets=dddd}");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementConfiguration setPreferredPaddingForCompactLayout:](self, "setPreferredPaddingForCompactLayout:", v100);

  }
}

void __73__SBUISystemApertureElementConfiguration__updateStorageForViewProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  int v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  uint64_t RenderId;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _BOOL4 v49;
  _BOOL4 v50;
  void *v51;
  id v52;

  v52 = a2;
  v11 = objc_msgSend(*(id *)(a1 + 32), "_elementSupportsDynamicResizing");
  objc_msgSend(*(id *)(a1 + 32), "_strongElementViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "activeLayoutMode");

  objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
  v16 = *MEMORY[0x1E0C9D820];
  v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v18 = v15 == v17 && *MEMORY[0x1E0C9D820] == v14;
  v19 = v13 == a3 || v18;
  if (!v11)
    v19 = v52 != 0;
  if (v52)
    v20 = v19;
  else
    v20 = 0;
  objc_msgSend(v52, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  RenderId = CALayerGetRenderId();

  if (RenderId != objc_msgSend(*(id *)(a1 + 40), "SBUISA_renderingIdforSetting:", a4))
  {
    objc_msgSend(*(id *)(a1 + 40), "SBUISA_setRenderingid:forSetting:", RenderId, a4);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateOtherSceneClientSettingsRepresentation");
  }
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
    v24 = v23;
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "maximumAccessoryViewSizeForLayoutMode:", a3);
    v28 = v27;
    v30 = v29;
    if (objc_msgSend(*(id *)(a1 + 32), "_elementSupportsDynamicResizing"))
    {
      if (!objc_msgSend(v52, "translatesAutoresizingMaskIntoConstraints"))
      {
        objc_msgSend(*(id *)(a1 + 32), "_strongElementViewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "activeLayoutMode");

        if (v44 == a3)
        {
          objc_msgSend(v52, "frame");
          v24 = v45;
          v26 = v46;
        }
        else if (v18)
        {
          objc_msgSend(v52, "intrinsicContentSize");
          v49 = v16 == v47;
          v50 = v15 == v48;
          if (v49 && v50)
            v26 = 1.0;
          else
            v26 = v48;
          if (v49 && v50)
            v24 = 1.0;
          else
            v24 = v47;
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(v52, "sizeThatFits:", v28, v30);
LABEL_23:
        v24 = v31;
        v26 = v32;
LABEL_24:
        if (a5 >> 1 == 1606512)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_elementSupportsDynamicResizing"))
            v33 = 0.0;
          else
            v33 = 8.0;
          objc_msgSend(v52, "SBUISA_maximumAccessoryViewWidth");
          v35 = v34 - v33;
          if (v35 >= v24)
            v35 = v24;
          v24 = fmax(v35, 0.0);
        }
        objc_msgSend(*(id *)(a1 + 40), "SBUISA_CGSizeforSetting:", a5);
        if (v24 != v37 || v26 != v36)
        {
          objc_msgSend(*(id *)(a1 + 40), "SBUISA_setCGSize:forSetting:", a5, v24, v26);
          objc_msgSend(*(id *)(a1 + 32), "_invalidateOtherSceneClientSettingsRepresentation");
        }
        goto LABEL_34;
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "minimumLayoutMode") != 4 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SBUISystemApertureElementConfiguration.m"), 391, CFSTR("Elements that don't support dynamic layout must supply accessory views that implement -[SBUISystemApertureAccessoryView sizeThatFits:forLayoutMode:]"));

    }
    objc_msgSend(v52, "sizeThatFits:forLayoutMode:", a3, v28, v30);
    goto LABEL_23;
  }
LABEL_34:
  objc_msgSend(v52, "accessibilityLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "SBUISA_stringforSetting:", a6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = BSEqualStrings();

  if ((v40 & 1) == 0)
  {
    v41 = *(void **)(a1 + 40);
    objc_msgSend(v52, "accessibilityLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "SBUISA_setString:forSetting:", v42, a6);

    objc_msgSend(*(id *)(a1 + 32), "_invalidateOtherSceneClientSettingsRepresentation");
  }

}

- (void)_invalidateOtherSceneClientSettingsRepresentation
{
  BSSettings *otherSceneClientSettingsRepresentation;

  otherSceneClientSettingsRepresentation = self->_otherSceneClientSettingsRepresentation;
  self->_otherSceneClientSettingsRepresentation = 0;

}

- (CGSize)preferredContentSizeClampedToMaximumExpandedSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SBUISystemApertureElementConfiguration elementViewController](self, "elementViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay](SBUISystemApertureLayoutMetrics, "sharedInstanceForEmbeddedDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumExpandedSize");
  v5 = v4;
  v7 = v6;

  objc_msgSend(v2, "preferredContentSize");
  if (v8 <= v5)
    v5 = v8;
  if (v9 <= v7)
    v7 = v9;

  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)validateConfiguration
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _BOOL4 v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__SBUISystemApertureElementConfiguration_validateConfiguration__block_invoke;
  v29[3] = &unk_1E4C3FED8;
  v29[4] = &v30;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A1798](v29);
  -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBUISystemApertureElementConfiguration minimalView](self, "minimalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v5 != 0;
  else
    v8 = 0;
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  if (v5 || v6 || v7)
  {
    if (v9)
    {
      -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
        goto LABEL_25;
      v12 = CFSTR("Leading and trailing views must not be identical.");
      goto LABEL_24;
    }
    if (v5 && !v6)
    {
      v12 = CFSTR("If you specify a leading view you must provide a trailing view.");
LABEL_24:
      ((void (**)(_QWORD, const __CFString *))v4)[2](v4, v12);
      goto LABEL_25;
    }
    if (v6)
      v13 = v5 != 0;
    else
      v13 = 1;
    if (!v13)
    {
      v12 = CFSTR("If you specify a trailing view you must provide a leading view.");
      goto LABEL_24;
    }
    if (!v7 && -[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode") == 2)
    {
      v12 = CFSTR("If you support minimal layout you must provide a minimal view.");
      goto LABEL_24;
    }
  }
LABEL_25:
  if (!-[SBUISystemApertureElementConfiguration contentRole](self, "contentRole"))
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("invalid content role"));
  v14 = -[SBUISystemApertureElementConfiguration preferredLayoutMode](self, "preferredLayoutMode");
  if (v14 < -[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode")
    && -[SBUISystemApertureElementConfiguration preferredLayoutMode](self, "preferredLayoutMode") != -1)
  {
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("preferred layout mode must be greater than or equal to the minimum layout mode"));
  }
  v15 = -[SBUISystemApertureElementConfiguration maximumLayoutMode](self, "maximumLayoutMode");
  if (v15 < -[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode"))
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("maximum layout mode must be greater than or equal to the minimum layout mode"));
  v16 = -[SBUISystemApertureElementConfiguration preferredLayoutMode](self, "preferredLayoutMode");
  if (v16 > -[SBUISystemApertureElementConfiguration maximumLayoutMode](self, "maximumLayoutMode"))
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("preferred layout mode must be less than or equal to the maximum layout mode"));
  v17 = -[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode") != 2 || v9;
  if ((v17 & 1) == 0)
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("if your minimum layout mode is .minimal, you must specify all accessory views"));
  if (-[SBUISystemApertureElementConfiguration minimumLayoutMode](self, "minimumLayoutMode") == 3)
  {
    -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18
      || (-[SBUISystemApertureElementConfiguration trailingView](self, "trailingView"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v18,
          !v19))
    {
      ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("if your minimum layout mode is .compact, you must specify leading and trailing views"));
    }
  }
  if (-[SBUISystemApertureElementConfiguration _elementSupportsDynamicResizing](self, "_elementSupportsDynamicResizing"))
  {
    -[SBUISystemApertureElementConfiguration minimalView](self, "minimalView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureElementConfiguration leadingView](self, "leadingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqual:", v21))
    {

    }
    else
    {
      -[SBUISystemApertureElementConfiguration minimalView](self, "minimalView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISystemApertureElementConfiguration trailingView](self, "trailingView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_48;
    }
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("If you support dynamic resizing, you  must also provide a unique minimal view"));
  }
LABEL_48:
  if (objc_msgSend((id)v31[5], "count"))
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)v31[5], "componentsJoinedByString:", CFSTR(" | "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Invalid config: %@ %@"), self, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureElementConfiguration.m"), 570, v27);

  }
  _Block_object_dispose(&v30, 8);

}

void __63__SBUISystemApertureElementConfiguration_validateConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "addObject:", v7);
  }

}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
}

- (BOOL)shouldDeferViewSizingPreferenceUpdates
{
  return self->_shouldDeferViewSizingPreferenceUpdates;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (SBUISystemApertureElement)elementViewController
{
  return (SBUISystemApertureElement *)objc_loadWeakRetained((id *)&self->_elementViewController);
}

- (void)setElementViewController:(id)a3
{
  objc_storeWeak((id *)&self->_elementViewController, a3);
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingView, a3);
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingView, a3);
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return self->_minimalView;
}

- (void)setMinimalView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalView, a3);
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  return self->_detachedMinimalView;
}

- (void)setDetachedMinimalView:(id)a3
{
  objc_storeStrong((id *)&self->_detachedMinimalView, a3);
}

- (void)setPreferredOutsetsFromUnsafeArea:(NSDirectionalEdgeInsets)a3
{
  self->_preferredOutsetsFromUnsafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detachedMinimalView, 0);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_elementViewController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_otherSceneClientSettingsRepresentation, 0);
  objc_storeStrong((id *)&self->__storage, 0);
}

@end
