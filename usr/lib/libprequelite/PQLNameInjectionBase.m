@implementation PQLNameInjectionBase

- (void)dealloc
{
  objc_super v3;

  free(self->_bytes);
  v3.receiver = self;
  v3.super_class = (Class)PQLNameInjectionBase;
  -[PQLNameInjectionBase dealloc](&v3, sel_dealloc);
}

- (PQLNameInjectionBase)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  PQLNameInjectionBase *v6;
  PQLNameInjectionBase *v7;
  char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PQLNameInjectionBase;
  v6 = -[PQLNameInjectionBase init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_length = a4;
    v8 = (char *)malloc_type_malloc(a4 + 1, 0x84D87354uLL);
    v7->_bytes = v8;
    if (!v8)
      abort();
    memcpy(v8, a3, a4);
    v7->_bytes[a4] = 0;
  }
  return v7;
}

- (PQLNameInjectionBase)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return -[PQLNameInjectionBase initWithBytes:length:](self, "initWithBytes:length:", v5, v6);
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

@end
