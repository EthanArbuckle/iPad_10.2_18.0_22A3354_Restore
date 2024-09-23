@implementation GPBRootObject

+ (void)initialize
{
  id v3;
  CFDictionaryKeyCallBacks v4;

  if (!qword_100389408)
  {
    qword_100389410 = (uint64_t)dispatch_semaphore_create(1);
    v4 = off_1003653E0;
    qword_100389408 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &v4, &kCFTypeDictionaryValueCallBacks);
    qword_100389418 = objc_alloc_init(GPBExtensionRegistry);
  }
  v3 = objc_msgSend(a1, "superclass");
  if (v3 == (id)objc_opt_class(GPBRootObject))
    objc_msgSend(a1, "extensionRegistry");
}

+ (id)extensionRegistry
{
  return (id)qword_100389418;
}

+ (void)globallyRegisterExtension:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "singletonNameC");
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100389410, 0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100389408, v4, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100389410);
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((GPBResolveExtensionClassMethod((objc_class *)a1, a3) & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GPBRootObject;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

@end
