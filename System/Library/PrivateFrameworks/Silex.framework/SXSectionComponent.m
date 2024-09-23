@implementation SXSectionComponent

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("animation")) & 1) != 0)
  {
    v5 = CFSTR("scene");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXSectionComponent;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)typeString
{
  return CFSTR("section");
}

@end
