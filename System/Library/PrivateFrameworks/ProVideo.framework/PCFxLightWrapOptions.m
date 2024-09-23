@implementation PCFxLightWrapOptions

- (PCFxLightWrapOptions)initWithLRBlendOptions:(id)a3
{
  PCFxLightWrapOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCFxLightWrapOptions;
  v4 = -[PCFxBlendOptions initWithBlendOptions:](&v6, sel_initWithBlendOptions_);
  if (v4)
  {
    objc_msgSend(a3, "getAmount");
    -[PCFxLightWrapOptions setAmount:](v4, "setAmount:");
    objc_msgSend(a3, "getIntensity");
    -[PCFxLightWrapOptions setIntensity:](v4, "setIntensity:");
    objc_msgSend(a3, "getIntensityScale");
    -[PCFxLightWrapOptions setIntensityScale:](v4, "setIntensityScale:");
    objc_msgSend(a3, "getOpacity");
    -[PCFxLightWrapOptions setOpacity:](v4, "setOpacity:");
    -[PCFxLightWrapOptions setLRBlendMode:](v4, "setLRBlendMode:", objc_msgSend(a3, "getLRBlendMode"));
  }
  return v4;
}

- (float)getAmount
{
  return *((float *)&self->super._mode + 1);
}

- (void)setAmount:(float)a3
{
  *((float *)&self->super._mode + 1) = a3;
}

- (float)getIntensity
{
  return self->_amount;
}

- (void)setIntensity:(float)a3
{
  self->_amount = a3;
}

- (float)getIntensityScale
{
  return self->_intensity;
}

- (void)setIntensityScale:(float)a3
{
  self->_intensity = a3;
}

- (float)getOpacity
{
  return self->_intensityScale;
}

- (void)setOpacity:(float)a3
{
  self->_intensityScale = a3;
}

- (int)getLRBlendMode
{
  return LODWORD(self->_lrOpacity);
}

- (void)setLRBlendMode:(int)a3
{
  LODWORD(self->_lrOpacity) = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PCFxLightWrapOptions initWithLRBlendOptions:](+[PCFxLightWrapOptions allocWithZone:](PCFxLightWrapOptions, "allocWithZone:", a3), "initWithLRBlendOptions:", self);
}

@end
