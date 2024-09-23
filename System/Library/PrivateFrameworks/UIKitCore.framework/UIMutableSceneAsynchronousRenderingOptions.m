@implementation UIMutableSceneAsynchronousRenderingOptions

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISceneAsynchronousRenderingOptions initWithOptions:]([UISceneAsynchronousRenderingOptions alloc], "initWithOptions:", self);
}

- (void)setRenderTimes:(id)a3
{
  NSArray *v4;
  NSArray *renderTimes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  renderTimes = self->super._renderTimes;
  self->super._renderTimes = v4;

}

- (void)setRenderPeriod:(double)a3
{
  self->super._renderPeriod = a3;
}

- (void)setRenderMaxAPL:(float)a3
{
  self->super._renderMaxAPL = a3;
}

- (void)setOpaque:(BOOL)a3
{
  self->super._opaque = a3;
}

@end
