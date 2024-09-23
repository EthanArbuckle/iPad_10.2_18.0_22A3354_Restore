@implementation VFXMTLOpenSubdivComputeEvaluator

- (void)dealloc
{
  MTLComputeEvaluator *computeEvaluator;
  uint64_t v4;
  objc_super v5;

  computeEvaluator = self->_computeEvaluator;
  if (computeEvaluator)
  {
    v4 = sub_1B220924C(computeEvaluator);
    MEMORY[0x1B5E22E18](v4, 0x1080C40AA79BA9DLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)VFXMTLOpenSubdivComputeEvaluator;
  -[VFXMTLOpenSubdivComputeEvaluator dealloc](&v5, sel_dealloc);
}

@end
