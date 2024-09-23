@implementation CLKUIResourceProviderKey

- (CLKUIResourceProviderKey)init
{
  CLKUIResourceProviderKey *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  NSNumber *key;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKUIResourceProviderKey;
  v2 = -[CLKUIResourceProviderKey init](&v8, sel_init);
  if (v2)
  {
    do
      v3 = __ldaxr((unsigned int *)&_CLKUIGenerateUniqueInteger_value);
    while (__stlxr(v3 + 1, (unsigned int *)&_CLKUIGenerateUniqueInteger_value));
    v4 = atomic_load((unsigned int *)&_CLKUIGenerateUniqueInteger_value);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    key = v2->_key;
    v2->_key = (NSNumber *)v5;

  }
  return v2;
}

- (NSNumber)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
