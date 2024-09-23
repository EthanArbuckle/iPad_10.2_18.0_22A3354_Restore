@implementation VFXSimplePathResolver

- (VFXSimplePathResolver)initWithURL:(id)a3
{
  VFXSimplePathResolver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXSimplePathResolver;
  v4 = -[VFXSimplePathResolver init](&v6, sel_init);
  if (v4)
    v4->_url = (NSURL *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXSimplePathResolver;
  -[VFXSimplePathResolver dealloc](&v3, sel_dealloc);
}

+ (id)resolverWithFolderURL:(id)a3
{
  VFXSimplePathResolver *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXSimplePathResolver alloc];
  return (id)objc_msgSend_initWithURL_(v4, v5, (uint64_t)a3, v6);
}

- (id)absoluteURLForAssetPath:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_URLByAppendingPathComponent_(self->_url, a2, (uint64_t)a3, v3);
}

@end
