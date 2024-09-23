@implementation SXJSONSubscribeAction

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("inAppPurchaseIdKey")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (void *)v8;
      goto LABEL_9;
    }
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("postPurchaseAction"))
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___SXJSONSubscribeAction;
    objc_msgSendSuper2(&v12, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", objc_opt_class(), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return (Class)v10;
}

@end
