@implementation SXJSONActionClassRegister

+ (void)registerClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v2, CFSTR("close"), objc_opt_class());
  v3 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v3, CFSTR("link"), objc_opt_class());
  v4 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v4, CFSTR("subscribe"), objc_opt_class());
}

@end
