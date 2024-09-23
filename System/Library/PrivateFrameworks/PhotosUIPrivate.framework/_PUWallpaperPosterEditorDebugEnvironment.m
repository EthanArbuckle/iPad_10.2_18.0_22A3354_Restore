@implementation _PUWallpaperPosterEditorDebugEnvironment

- (_PUWallpaperPosterEditorDebugEnvironment)init
{
  _PUWallpaperPosterEditorDebugEnvironment *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSURL *targetAssetDirectory;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PUWallpaperPosterEditorDebugEnvironment;
  v2 = -[_PUWallpaperPosterEditorDebugEnvironment init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PhotosPoster"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    targetAssetDirectory = v2->_targetAssetDirectory;
    v2->_targetAssetDirectory = (NSURL *)v6;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2->_targetAssetDirectory, 0, 0, 0);

  }
  return v2;
}

- (_PUWallpaperPosterEditorDebugEnvironment)initWithPosterDescriptor:(id)a3
{
  id v5;
  _PUWallpaperPosterEditorDebugEnvironment *v6;
  _PUWallpaperPosterEditorDebugEnvironment *v7;

  v5 = a3;
  v6 = -[_PUWallpaperPosterEditorDebugEnvironment init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_posterDescriptor, a3);

  return v7;
}

- (_PUWallpaperPosterEditorDebugEnvironment)initWithSourcePosterConfiguration:(id)a3
{
  id v5;
  _PUWallpaperPosterEditorDebugEnvironment *v6;
  _PUWallpaperPosterEditorDebugEnvironment *v7;

  v5 = a3;
  v6 = -[_PUWallpaperPosterEditorDebugEnvironment init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourcePosterConfiguration, a3);

  return v7;
}

- (int64_t)pu_posterType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[_PUWallpaperPosterEditorDebugEnvironment posterDescriptor](self, "posterDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_PUWallpaperPosterEditorDebugEnvironment posterDescriptor](self, "posterDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "posterType");

    return v7;
  }
  -[_PUWallpaperPosterEditorDebugEnvironment sourcePosterConfiguration](self, "sourcePosterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PUWallpaperPosterEditorDebugEnvironment sourcePosterConfiguration](self, "sourcePosterConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (PUMutablePosterConfiguration)pu_targetConfiguration
{
  return (PUMutablePosterConfiguration *)objc_alloc_init(_PUMutablePosterConfigurationDebug);
}

- (unint64_t)px_significantEventsCounter
{
  return 0;
}

- (BOOL)px_isCallServices
{
  return 0;
}

- (int64_t)px_boundingShape
{
  return -1;
}

- (CGRect)px_floatingObscurableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)pu_deviceOrientation
{
  return 0;
}

- (CGRect)px_titleBoundsForLayout:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIColor)pu_caseColor
{
  return self->_pu_caseColor;
}

- (void)setPu_caseColor:(id)a3
{
  objc_storeStrong((id *)&self->_pu_caseColor, a3);
}

- (int64_t)pu_userInterfaceStyle
{
  return self->_pu_userInterfaceStyle;
}

- (void)setPu_userInterfaceStyle:(int64_t)a3
{
  self->_pu_userInterfaceStyle = a3;
}

- (NSString)pu_selectedToolbarItemIdentifier
{
  return self->_pu_selectedToolbarItemIdentifier;
}

- (void)setPu_selectedToolbarItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pu_selectedToolbarItemIdentifier, a3);
}

- (PFPosterDescriptor)posterDescriptor
{
  return self->_posterDescriptor;
}

- (void)setPosterDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_posterDescriptor, a3);
}

- (PFPosterConfiguration)sourcePosterConfiguration
{
  return self->_sourcePosterConfiguration;
}

- (void)setSourcePosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePosterConfiguration, a3);
}

- (NSURL)sourceAssetDirectory
{
  return self->_sourceAssetDirectory;
}

- (void)setSourceAssetDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAssetDirectory, a3);
}

- (NSURL)targetAssetDirectory
{
  return self->_targetAssetDirectory;
}

- (void)setTargetAssetDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_targetAssetDirectory, a3);
}

- (unint64_t)legacyConfigurationType
{
  return self->_legacyConfigurationType;
}

- (void)setLegacyConfigurationType:(unint64_t)a3
{
  self->_legacyConfigurationType = a3;
}

- (PUPosterOverrideConfiguration)overrideConfiguration
{
  return self->_overrideConfiguration;
}

- (void)setOverrideConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overrideConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideConfiguration, 0);
  objc_storeStrong((id *)&self->_targetAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourceAssetDirectory, 0);
  objc_storeStrong((id *)&self->_sourcePosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterDescriptor, 0);
  objc_storeStrong((id *)&self->_pu_selectedToolbarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_pu_caseColor, 0);
}

@end
