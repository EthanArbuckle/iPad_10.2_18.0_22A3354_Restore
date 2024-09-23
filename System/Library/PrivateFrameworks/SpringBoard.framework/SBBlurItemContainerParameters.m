@implementation SBBlurItemContainerParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurAnimationSettings, 0);
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (int64_t)inputQuality
{
  return self->_inputQuality;
}

- (int64_t)inputIntermediateBitDepth
{
  return self->_inputIntermediateBitDepth;
}

- (SBFFluidBehaviorSettings)blurAnimationSettings
{
  return self->_blurAnimationSettings;
}

+ (id)defaultCrossblurBlurParameters
{
  void *v2;
  void *v3;
  SBBlurItemContainerParameters *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  SBBlurItemContainerParameters *v10;

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [SBBlurItemContainerParameters alloc];
  objc_msgSend(v3, "crossblurDosidoBlurRadius");
  v6 = v5;
  objc_msgSend(v3, "crossblurRasterizationScale");
  v8 = v7;
  objc_msgSend(v3, "crossblurDosidoSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v4, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", 0, 1, 1, v9, v6, v8);

  return v10;
}

- (SBBlurItemContainerParameters)initWithBlurRadius:(double)a3 shouldRasterize:(BOOL)a4 rasterizationScale:(double)a5 inputQuality:(int64_t)a6 inputIntermediateBitDepth:(int64_t)a7 blurAnimationSettings:(id)a8
{
  id v15;
  SBBlurItemContainerParameters *v16;
  SBBlurItemContainerParameters *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)SBBlurItemContainerParameters;
  v16 = -[SBBlurItemContainerParameters init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_shouldRasterize = a4;
    v16->_blurRadius = a3;
    v16->_rasterizationScale = a5;
    v16->_inputQuality = a6;
    v16->_inputIntermediateBitDepth = a7;
    objc_storeStrong((id *)&v16->_blurAnimationSettings, a8);
  }

  return v17;
}

- (double)rasterizationScale
{
  return self->_rasterizationScale;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

@end
