@implementation UISceneProposalActionResponse

+ (id)responseWithPersistentIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v5, "_responseWithPersistentIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)responseWithSceneID:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v5, "_responseWithPersistentIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_responseWithPersistentIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UISceneProposalActionResponse *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 10);

  v9.receiver = self;
  v9.super_class = (Class)UISceneProposalActionResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v6, 0);

  return v7;
}

- (UISceneProposalActionResponse)initWithInfo:(id)a3 error:(id)a4
{
  UISceneProposalActionResponse *v5;

  -[UISceneProposalActionResponse _responseWithPersistentIdentifier:](self, "_responseWithPersistentIdentifier:", 0, a4);
  v5 = (UISceneProposalActionResponse *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)persistentIdentifier
{
  void *v2;
  id v3;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 10);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 10)
    return CFSTR("sceneID");
  else
    return 0;
}

@end
