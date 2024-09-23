@implementation _UINavigationBarTitleFontProvider

+ (id)providerForIdiom:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = (void *)_register;
  if (!_register)
  {
    v5 = objc_opt_new();
    v6 = (void *)_register;
    _register = v5;

    v4 = (void *)_register;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", v7);

  v9 = (void *)objc_opt_new();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  return v12;
}

- (id)defaultLargeTitleFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedTitle0"));
}

- (id)defaultInlineTitleFont
{
  if ((_UIBarsUseDynamicType() & 1) != 0)
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleShortEmphasizedBody"));
  else
    objc_msgSend(off_1E167A828, "defaultFontForTextStyle:", CFSTR("UICTFontTextStyleShortEmphasizedBody"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultTitleFont
{
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
}

+ (void)registerProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = (void *)_register;
  if (!_register)
  {
    v7 = objc_opt_new();
    v8 = (void *)_register;
    _register = v7;

    v6 = (void *)_register;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, v9);

}

@end
