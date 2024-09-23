@implementation PXAssetsSectionBlurViewConfiguration

- (PXAssetsSectionBlurViewConfiguration)init
{
  return -[PXAssetsSectionBlurViewConfiguration initWithIntensity:maximumBlurRadius:maximumDimmingFraction:](self, "initWithIntensity:maximumBlurRadius:maximumDimmingFraction:", 0.0, 0.0, 0.0);
}

- (PXAssetsSectionBlurViewConfiguration)initWithIntensity:(double)a3 maximumBlurRadius:(double)a4 maximumDimmingFraction:(double)a5
{
  PXAssetsSectionBlurViewConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXAssetsSectionBlurViewConfiguration;
  result = -[PXAssetsSectionBlurViewConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_intensity = a3;
    result->_maximumBlurRadius = a4;
    result->_maximumDimmingFraction = a5;
  }
  return result;
}

- (double)intensity
{
  return self->_intensity;
}

- (double)maximumBlurRadius
{
  return self->_maximumBlurRadius;
}

- (double)maximumDimmingFraction
{
  return self->_maximumDimmingFraction;
}

@end
