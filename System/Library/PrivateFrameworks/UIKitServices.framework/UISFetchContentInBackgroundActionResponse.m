@implementation UISFetchContentInBackgroundActionResponse

+ (id)responseWithResult:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBackgroundFetchResult:", a3);
}

- (UISFetchContentInBackgroundActionResponse)initWithBackgroundFetchResult:(unint64_t)a3
{
  id v5;
  void *v6;
  UISFetchContentInBackgroundActionResponse *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)UISFetchContentInBackgroundActionResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v5, 0);

  return v7;
}

- (UISFetchContentInBackgroundActionResponse)initWithInfo:(id)a3 error:(id)a4
{
  return -[UISFetchContentInBackgroundActionResponse initWithBackgroundFetchResult:](self, "initWithBackgroundFetchResult:", 2, a4);
}

- (unint64_t)result
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("backgroundFetchResult");
  else
    return 0;
}

@end
