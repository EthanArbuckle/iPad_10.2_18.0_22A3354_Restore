@implementation SXButtonComponent

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("action"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", objc_opt_class(), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXButtonComponent;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v9;
}

@end
