@implementation SXComponentStyleClassRegister

+ (void)registerClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v2, CFSTR("mask"), objc_opt_class());
  v3 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v3, CFSTR("corners"), objc_opt_class());
  v4 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v4, CFSTR("fill"), objc_opt_class());
  v5 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v5, CFSTR("gradient"), objc_opt_class());
  v6 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v6, CFSTR("image"), objc_opt_class());
  v7 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v7, CFSTR("linear_gradient"), objc_opt_class());
  v8 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v8, CFSTR("repeatable_image"), objc_opt_class());
  v9 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v9, CFSTR("video"), objc_opt_class());
}

@end
