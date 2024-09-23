@implementation TransparencyGPBRootObject

+ (void)initialize
{
  id v3;
  uint64_t v4;
  CFDictionaryKeyCallBacks v5;

  if (!qword_100131318)
  {
    v5 = off_10010BFA8;
    qword_100131318 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v5, &kCFTypeDictionaryValueCallBacks);
    qword_100131320 = objc_alloc_init(TransparencyGPBExtensionRegistry);
  }
  v3 = objc_msgSend(a1, "superclass");
  if (v3 == (id)objc_opt_class(TransparencyGPBRootObject, v4))
    objc_msgSend(a1, "extensionRegistry");
}

+ (id)extensionRegistry
{
  return (id)qword_100131320;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "singletonNameC");
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100131328);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100131318, v4, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100131328);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((sub_1000C6234((objc_class *)a1, a3) & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBRootObject;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

@end
