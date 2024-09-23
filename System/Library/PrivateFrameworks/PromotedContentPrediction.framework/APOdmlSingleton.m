@implementation APOdmlSingleton

+ (id)sharedInstance
{
  void *v2;
  objc_class *v3;
  void *v4;
  const char *v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v2, v5, (uint64_t)CFSTR("Call to unimplemented sharedInstance"), CFSTR("%@ does not implement sharedInstance. Add the CREATE_SHARED_INSTANCE macro to the @implementation"), v4);

  return 0;
}

@end
