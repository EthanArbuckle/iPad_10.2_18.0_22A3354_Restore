@implementation VKFrameProviderConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  VKFrameProviderConfiguration *v4;

  v4 = objc_alloc_init(VKFrameProviderConfiguration);
  -[VKFrameProviderConfiguration setResolutionPreset:](v4, "setResolutionPreset:", -[VKFrameProviderConfiguration resolutionPreset](self, "resolutionPreset"));
  -[VKFrameProviderConfiguration setCameraPreset:](v4, "setCameraPreset:", -[VKFrameProviderConfiguration cameraPreset](self, "cameraPreset"));
  -[VKFrameProviderConfiguration setFrameRatePreset:](v4, "setFrameRatePreset:", -[VKFrameProviderConfiguration frameRatePreset](self, "frameRatePreset"));
  -[VKFrameProviderConfiguration setPreferBinning:](v4, "setPreferBinning:", -[VKFrameProviderConfiguration preferBinning](self, "preferBinning"));
  -[VKFrameProviderConfiguration setAllowHeadlessProcessing:](v4, "setAllowHeadlessProcessing:", -[VKFrameProviderConfiguration allowHeadlessProcessing](self, "allowHeadlessProcessing"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VKFrameProviderConfiguration *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = (VKFrameProviderConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_opt_class();
      VKDynamicCast(v5, (uint64_t)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VKFrameProviderConfiguration isEqualToFrameProviderConfiguration:](self, "isEqualToFrameProviderConfiguration:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToFrameProviderConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "resolutionPreset");
  if (v5 == -[VKFrameProviderConfiguration resolutionPreset](self, "resolutionPreset"))
  {
    v6 = objc_msgSend(v4, "cameraPreset");
    v7 = v6 == -[VKFrameProviderConfiguration cameraPreset](self, "cameraPreset");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)cameraPreset
{
  return self->_cameraPreset;
}

- (void)setCameraPreset:(unint64_t)a3
{
  self->_cameraPreset = a3;
}

- (unint64_t)resolutionPreset
{
  return self->_resolutionPreset;
}

- (void)setResolutionPreset:(unint64_t)a3
{
  self->_resolutionPreset = a3;
}

- (unint64_t)frameRatePreset
{
  return self->_frameRatePreset;
}

- (void)setFrameRatePreset:(unint64_t)a3
{
  self->_frameRatePreset = a3;
}

- (BOOL)preferBinning
{
  return self->_preferBinning;
}

- (void)setPreferBinning:(BOOL)a3
{
  self->_preferBinning = a3;
}

- (BOOL)allowHeadlessProcessing
{
  return self->_allowHeadlessProcessing;
}

- (void)setAllowHeadlessProcessing:(BOOL)a3
{
  self->_allowHeadlessProcessing = a3;
}

@end
