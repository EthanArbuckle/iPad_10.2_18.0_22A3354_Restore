@implementation VFXMTLComputePipeline

- (VFXMTLComputePipeline)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLComputePipeline;
  return -[VFXMTLComputePipeline init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLComputePipeline;
  -[VFXMTLComputePipeline dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p>"), v7, v5, self);
}

@end
