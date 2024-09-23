@implementation SXAdditionClassRegister

+ (void)registerClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v2, CFSTR("addition"), objc_opt_class());
  v3 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v3, CFSTR("calendar_event"), objc_opt_class());
  v4 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v4, CFSTR("email"), objc_opt_class());
  v5 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v5, CFSTR("link"), objc_opt_class());
  v6 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v6, CFSTR("phone_number"), objc_opt_class());
  v7 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v7, CFSTR("product"), objc_opt_class());
}

@end
