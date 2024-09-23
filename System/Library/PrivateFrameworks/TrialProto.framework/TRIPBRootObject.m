@implementation TRIPBRootObject

+ (void)initialize
{
  uint64_t v3;
  CFDictionaryKeyCallBacks v4;

  if (!_MergedGlobals_16)
  {
    qword_1ECF0E6D0 = (uint64_t)dispatch_semaphore_create(1);
    v4 = *(CFDictionaryKeyCallBacks *)byte_1E2E9BAF8;
    _MergedGlobals_16 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v4, MEMORY[0x1E0C9B3A0]);
    qword_1ECF0E6D8 = objc_alloc_init(TRIPBExtensionRegistry);
  }
  v3 = objc_msgSend(a1, "superclass");
  if (v3 == objc_opt_class())
    objc_msgSend(a1, "extensionRegistry");
}

+ (id)extensionRegistry
{
  return (id)qword_1ECF0E6D8;
}

+ (void)globallyRegisterExtension:(id)a3
{
  const void *v4;

  v4 = (const void *)objc_msgSend(a3, "singletonNameC");
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1ECF0E6D0, 0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)_MergedGlobals_16, v4, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1ECF0E6D0);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((TRIPBResolveExtensionClassMethod((objc_class *)a1, a3) & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TRIPBRootObject;
  return objc_msgSendSuper2(&v6, sel_resolveClassMethod_, a3);
}

@end
