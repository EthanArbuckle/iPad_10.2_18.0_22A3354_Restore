@implementation PXGRotationalMotionBlurEffect

- (id)kernel
{
  PXGPolarBlurKernel *v3;
  PXGPolarBlurKernel *polarBlur;
  double v5;

  if (!self->_polarBlur)
  {
    v3 = objc_alloc_init(PXGPolarBlurKernel);
    polarBlur = self->_polarBlur;
    self->_polarBlur = v3;

  }
  -[PXGMotionBlurEffect intensity](self, "intensity");
  -[PXGPolarBlurKernel setRotationAngle:](self->_polarBlur, "setRotationAngle:", v5 * 1.57079633);
  return self->_polarBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polarBlur, 0);
}

@end
