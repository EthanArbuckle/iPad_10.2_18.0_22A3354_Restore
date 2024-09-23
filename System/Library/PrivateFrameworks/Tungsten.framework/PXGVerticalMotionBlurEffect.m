@implementation PXGVerticalMotionBlurEffect

- (id)kernel
{
  PXGMotionBlurKernel *v3;
  PXGMotionBlurKernel *motionBlur;

  if (!self->_motionBlur)
  {
    v3 = objc_alloc_init(PXGMotionBlurKernel);
    motionBlur = self->_motionBlur;
    self->_motionBlur = v3;

    -[PXGMotionBlurKernel setDirection:](self->_motionBlur, "setDirection:", 1);
  }
  -[PXGMotionBlurEffect intensity](self, "intensity");
  -[PXGMotionBlurKernel setSize:](self->_motionBlur, "setSize:");
  return self->_motionBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionBlur, 0);
}

@end
