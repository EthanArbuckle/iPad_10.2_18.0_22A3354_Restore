@implementation SBSceneHostingDisplayPreferences

- (SBSceneHostingDisplayPreferences)initWithDisplayConfigurationRequest:(id)a3 logicalScale:(CGSize)a4 contentsScale:(double)a5 keepOtherModes:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  SBSceneHostingDisplayPreferences *v12;
  uint64_t v13;
  FBSDisplayConfigurationRequest *displayConfigurationRequest;
  CADisplayModeCriteria *v15;
  CADisplayModeCriteria *CADisplayModeCriteria;
  CADisplayModeCriteria *v17;
  CADisplayModeCriteria *v18;
  CADisplayModeCriteria *v19;
  void *v20;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBSceneHostingDisplayPreferences;
  v12 = -[SBSceneHostingDisplayPreferences init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    displayConfigurationRequest = v12->_displayConfigurationRequest;
    v12->_displayConfigurationRequest = (FBSDisplayConfigurationRequest *)v13;

    v12->_logicalScale.width = width;
    v12->_logicalScale.height = height;
    v12->_contentsScale = a5;
    v12->_keepOtherModes = a6;
    v15 = (CADisplayModeCriteria *)objc_alloc_init(MEMORY[0x1E0CD2738]);
    CADisplayModeCriteria = v12->_CADisplayModeCriteria;
    v12->_CADisplayModeCriteria = v15;

    v17 = v12->_CADisplayModeCriteria;
    -[FBSDisplayConfigurationRequest nativePixelSize](v12->_displayConfigurationRequest, "nativePixelSize");
    -[CADisplayModeCriteria setResolution:](v17, "setResolution:");
    v18 = v12->_CADisplayModeCriteria;
    -[FBSDisplayConfigurationRequest refreshRate](v12->_displayConfigurationRequest, "refreshRate");
    -[CADisplayModeCriteria setRefreshRate:](v18, "setRefreshRate:");
    v19 = v12->_CADisplayModeCriteria;
    -[FBSDisplayConfigurationRequest hdrMode](v12->_displayConfigurationRequest, "hdrMode");
    FBSDisplayHDRModeToCADisplayHDRMode();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayModeCriteria setHdrMode:](v19, "setHdrMode:", v20);

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBSceneHostingDisplayPreferences *v3;

  v3 = self;
  return -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:](v3, "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", v3->_displayConfigurationRequest, v3->_keepOtherModes, v3->_logicalScale.width, v3->_logicalScale.height, v3->_contentsScale);
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return self->_displayConfigurationRequest;
}

- (CGSize)logicalScale
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalScale.width;
  height = self->_logicalScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (BOOL)keepOtherModes
{
  return self->_keepOtherModes;
}

- (CADisplayModeCriteria)CADisplayModeCriteria
{
  return self->_CADisplayModeCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CADisplayModeCriteria, 0);
  objc_storeStrong((id *)&self->_displayConfigurationRequest, 0);
}

@end
