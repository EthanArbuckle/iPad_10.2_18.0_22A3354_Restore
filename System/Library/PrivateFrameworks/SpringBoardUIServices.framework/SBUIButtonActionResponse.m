@implementation SBUIButtonActionResponse

- (SBUIButtonActionResponse)initWithUnHandledButtonEvents:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  SBUIButtonActionResponse *v8;
  objc_super v10;
  objc_super v11;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v11.receiver = self;
  v11.super_class = (Class)SBUIButtonActionResponse;
  -[BSActionResponse error](&v11, sel_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBUIButtonActionResponse;
  v8 = -[BSActionResponse initWithInfo:error:](&v10, sel_initWithInfo_error_, v5, v7);

  return v8;
}

- (unint64_t)unHandledButtonEvents
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  -[BSActionResponse error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[BSActionResponse error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "code");

    if (v6 == 2)
      return 0;
  }
  -[BSActionResponse info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForSetting:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v13)
    v7 = objc_msgSend(v13, "integerValue");
  else
    v7 = 0;

  return v7;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  if (a4 == 1)
    return CFSTR("events");
  else
    return 0;
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  uint64_t v6;

  if (a6 != 1)
    return 0;
  v6 = __eventsFromObject(a5);
  SBUIServiceButtonEventDescription(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
