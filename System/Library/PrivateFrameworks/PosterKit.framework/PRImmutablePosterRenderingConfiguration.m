@implementation PRImmutablePosterRenderingConfiguration

- (PRImmutablePosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  PRImmutablePosterRenderingConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRImmutablePosterRenderingConfiguration;
  result = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](&v7, sel_initWithDepthEffectDisabled_parallaxEnabled_);
  if (result)
  {
    result->_depthEffectDisabled = a3;
    result->_parallaxEnabled = a4;
  }
  return result;
}

- (BOOL)isDepthEffectDisabled
{
  return self->_depthEffectDisabled;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

@end
