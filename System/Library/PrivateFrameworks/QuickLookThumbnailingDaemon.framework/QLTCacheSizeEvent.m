@implementation QLTCacheSizeEvent

- (QLTCacheSizeEvent)initWithCacheSize:(unint64_t)a3
{
  QLTCacheSizeEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLTCacheSizeEvent;
  result = -[QLTCacheSizeEvent init](&v5, sel_init);
  if (result)
    result->_cacheSize = a3;
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("com.apple.quicklook.cache.size");
}

- (id)propertiesBuilder
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__QLTCacheSizeEvent_propertiesBuilder__block_invoke;
  aBlock[3] = &unk_1E99D3B20;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __38__QLTCacheSizeEvent_propertiesBuilder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "build");
}

- (id)build
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("com.apple.message.value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cacheSize);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

@end
