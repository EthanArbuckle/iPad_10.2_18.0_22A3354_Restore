@implementation SXPlatformConditionValidator

- (SXPlatformConditionValidator)initWithPlatform:(id)a3
{
  id v4;
  SXPlatformConditionValidator *v5;
  uint64_t v6;
  NSString *platform;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXPlatformConditionValidator;
  v5 = -[SXPlatformConditionValidator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    platform = v5->_platform;
    v5->_platform = (NSString *)v6;

  }
  return v5;
}

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SXPlatformConditionValidator platform](self, "platform");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "caseInsensitiveCompare:", v5))
      v7 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("any")) == 0;
    else
      v7 = 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSString)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
}

@end
