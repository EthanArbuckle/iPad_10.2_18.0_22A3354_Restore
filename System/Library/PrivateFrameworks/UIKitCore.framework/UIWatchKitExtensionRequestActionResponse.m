@implementation UIWatchKitExtensionRequestActionResponse

+ (id)responseWithWatchKitExtensionResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWatchKitExtensionResult:", v4);

  return v5;
}

- (UIWatchKitExtensionRequestActionResponse)initWithWatchKitExtensionResult:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UIWatchKitExtensionRequestActionResponse *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v9.receiver = self;
  v9.super_class = (Class)UIWatchKitExtensionRequestActionResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v6, 0);

  return v7;
}

- (NSDictionary)result
{
  void *v2;
  void *v3;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("watchkitRequestResult");
  else
    return 0;
}

@end
