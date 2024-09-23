@implementation PLCGPathCache

- (PLCGPathCache)init
{
  PLCGPathCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCGPathCache;
  v2 = -[PLCGPathCache init](&v4, sel_init);
  if (v2)
    v2->_pathCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_pathCache);
  self->_pathCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLCGPathCache;
  -[PLCGPathCache dealloc](&v3, sel_dealloc);
}

- (void)setPath:(CGPath *)a3 forKey:(CGRect)a4
{
  CFDictionarySetValue(self->_pathCache, (const void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), a3);
}

- (CGPath)pathForKey:(CGRect)a3
{
  return (CGPath *)CFDictionaryGetValue(self->_pathCache, (const void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
}

+ (id)sharedPathCache
{
  id result;

  result = (id)sharedPathCache_sharedPathCache;
  if (!sharedPathCache_sharedPathCache)
  {
    result = objc_alloc_init(PLCGPathCache);
    sharedPathCache_sharedPathCache = (uint64_t)result;
  }
  return result;
}

@end
