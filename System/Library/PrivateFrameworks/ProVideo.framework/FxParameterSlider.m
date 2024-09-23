@implementation FxParameterSlider

- (FxParameterSlider)init
{
  FxParameterSlider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FxParameterSlider;
  v2 = -[FxPinParameter init](&v4, sel_init);
  if (v2)
  {
    v2->_sliderPriv = (FxParameterSliderPriv *)malloc_type_calloc(1uLL, 0x30uLL, 0x1000040C179455EuLL);
    -[FxPin setValueClass:](v2, "setValueClass:", objc_opt_class());
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_sliderPriv != 0, CFSTR("_sliderPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_sliderPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterSlider;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

- (double)minValue
{
  return self->_sliderPriv->var0;
}

- (void)setMinValue:(double)a3
{
  self->_sliderPriv->var0 = a3;
}

- (double)maxValue
{
  return self->_sliderPriv->var1;
}

- (void)setMaxValue:(double)a3
{
  self->_sliderPriv->var1 = a3;
}

- (double)stepValue
{
  return self->_sliderPriv->var2;
}

- (void)setStepValue:(double)a3
{
  self->_sliderPriv->var2 = a3;
}

- (double)minSliderValue
{
  return self->_sliderPriv->var3;
}

- (void)setMinSliderValue:(double)a3
{
  self->_sliderPriv->var3 = a3;
}

- (double)maxSliderValue
{
  return self->_sliderPriv->var4;
}

- (void)setMaxSliderValue:(double)a3
{
  self->_sliderPriv->var4 = a3;
}

- (BOOL)isLogarithmic
{
  return self->_sliderPriv->var5;
}

- (void)setIsLogarithmic:(BOOL)a3
{
  self->_sliderPriv->var5 = a3;
}

@end
