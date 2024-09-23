@implementation PXGRadialMotionBlurEffect

- (id)kernel
{
  PXGPolarBlurKernel *v3;
  PXGPolarBlurKernel *polarBlur;
  long double v5;

  if (!self->_polarBlur)
  {
    v3 = objc_alloc_init(PXGPolarBlurKernel);
    polarBlur = self->_polarBlur;
    self->_polarBlur = v3;

  }
  -[PXGMotionBlurEffect intensity](self, "intensity");
  -[PXGPolarBlurKernel setScaleFactor:](self->_polarBlur, "setScaleFactor:", (double)exp2(v5));
  return self->_polarBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polarBlur, 0);
}

@end
