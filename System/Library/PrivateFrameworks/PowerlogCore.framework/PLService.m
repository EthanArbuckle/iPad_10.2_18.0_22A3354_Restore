@implementation PLService

+ (void)load
{
  uint64_t v3;
  objc_super v4;

  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PLService;
    objc_msgSendSuper2(&v4, sel_load);
  }
}

+ (id)initServices
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
}

@end
