@implementation UILinkConnectionActionResponse

- (UILinkConnectionActionResponse)initWithActionResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UILinkConnectionActionResponse *v7;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v7 = -[BSActionResponse initWithInfo:error:](self, "initWithInfo:error:", v6, 0);
  return v7;
}

- (LNConnectionActionResponse)actionResponse
{
  void *v2;
  void *v3;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LNConnectionActionResponse *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("action response");
  else
    return 0;
}

@end
