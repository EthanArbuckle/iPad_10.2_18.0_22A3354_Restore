@implementation SXComponentBehaviorClassRegister

+ (void)registerClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v2, &stru_24D68E0F8, objc_opt_class());
  v3 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v3, CFSTR("background_parallax"), objc_opt_class());
  v4 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v4, CFSTR("motion"), objc_opt_class());
  v5 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v5, CFSTR("parallax"), objc_opt_class());
  v6 = objc_opt_class();
  +[SXClassFactory registerClass:type:baseClass:](SXClassFactory, "registerClass:type:baseClass:", v6, CFSTR("springy"), objc_opt_class());
}

@end
