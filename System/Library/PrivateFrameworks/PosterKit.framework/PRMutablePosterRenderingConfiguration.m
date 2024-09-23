@implementation PRMutablePosterRenderingConfiguration

- (PRMutablePosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  PRMutablePosterRenderingConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRMutablePosterRenderingConfiguration;
  result = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](&v7, sel_initWithDepthEffectDisabled_parallaxEnabled_);
  if (result)
  {
    result->_depthEffectDisabled = a3;
    result->_parallaxEnabled = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRPosterRenderingConfiguration initWithRenderingConfiguration:](+[PRPosterRenderingConfiguration allocWithZone:](PRImmutablePosterRenderingConfiguration, "allocWithZone:", a3), "initWithRenderingConfiguration:", self);
}

- (BOOL)isDepthEffectDisabled
{
  return self->_depthEffectDisabled;
}

- (void)setDepthEffectDisabled:(BOOL)a3
{
  self->_depthEffectDisabled = a3;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

@end
