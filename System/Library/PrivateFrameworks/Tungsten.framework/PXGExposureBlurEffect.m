@implementation PXGExposureBlurEffect

- (PXGExposureBlurEffect)initWithEntityManager:(id)a3
{
  PXGExposureBlurEffect *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGExposureBlurEffect;
  result = -[PXGEffect initWithEntityManager:](&v4, sel_initWithEntityManager_, a3);
  if (result)
  {
    result->_radius = 20.0;
    result->_exposure = 1.0;
    result->_multiplier = 1.0;
  }
  return result;
}

- (id)kernel
{
  PXGExposureBlurKernel *v3;
  PXGExposureBlurKernel *kernel;
  double v5;
  double v6;
  double v7;

  if (!self->_kernel)
  {
    v3 = objc_alloc_init(PXGExposureBlurKernel);
    kernel = self->_kernel;
    self->_kernel = v3;

  }
  -[PXGExposureBlurEffect radius](self, "radius");
  v6 = v5;
  -[PXGEffect scale](self, "scale");
  -[PXGExposureBlurKernel setRadius:](self->_kernel, "setRadius:", v6 * v7);
  -[PXGExposureBlurEffect exposure](self, "exposure");
  -[PXGExposureBlurKernel setExposure:](self->_kernel, "setExposure:");
  -[PXGExposureBlurEffect multiplier](self, "multiplier");
  -[PXGExposureBlurKernel setMultiplier:](self->_kernel, "setMultiplier:");
  return self->_kernel;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)exposure
{
  return self->_exposure;
}

- (void)setExposure:(double)a3
{
  self->_exposure = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernel, 0);
}

@end
