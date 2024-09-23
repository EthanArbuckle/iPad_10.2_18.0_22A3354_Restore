@implementation PXGColorLookupCube

- (id)createTextureWithContext:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorLookupCube.m"), 28, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGColorLookupCube createTextureWithContext:]", v8);

  abort();
}

- (NSData)textureData
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorLookupCube.m"), 32, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGColorLookupCube textureData]", v6);

  abort();
}

- (void)center
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGColorLookupCube.m"), 36, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGColorLookupCube center]", v6);

  abort();
}

- (int64_t)edgeSize
{
  return self->_edgeSize;
}

- (void)setEdgeSize:(int64_t)a3
{
  self->_edgeSize = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

@end
