@implementation PXGOffscreenEffect

- (id)shader
{
  return 0;
}

- (id)kernel
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOffscreenEffect.m"), 19, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGOffscreenEffect kernel]", v6);

  abort();
}

@end
