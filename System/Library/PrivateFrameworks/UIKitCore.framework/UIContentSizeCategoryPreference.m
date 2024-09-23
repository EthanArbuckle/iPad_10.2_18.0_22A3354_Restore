@implementation UIContentSizeCategoryPreference

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

+ (id)system
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)__preferences;
  if (!__preferences)
  {
    v3 = -[_UIContentSizeCategoryPreferenceSystem initAsSystem]([_UIContentSizeCategoryPreferenceSystem alloc], "initAsSystem");
    v4 = (void *)__preferences;
    __preferences = (uint64_t)v3;

    objc_msgSend((id)__preferences, "_readAndObservePreferences");
    v2 = (void *)__preferences;
  }
  return v2;
}

- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3
{
  id v4;
  UIContentSizeCategoryPreference *v5;
  uint64_t v6;
  NSString *preferredContentSizeCategory;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIContentSizeCategoryPreference;
  v5 = -[UIContentSizeCategoryPreference init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    preferredContentSizeCategory = v5->_preferredContentSizeCategory;
    v5->_preferredContentSizeCategory = (NSString *)v6;

    objc_storeStrong((id *)&v5->_preferredContentSizeCategoryCarPlay, CFSTR("_UICTContentSizeCategoryUnspecified"));
  }

  return v5;
}

- (void)setPreferredContentSizeCategoryCarPlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)preferredContentSizeCategoryCarPlay
{
  return self->_preferredContentSizeCategoryCarPlay;
}

+ (void)_populateUserDefaultsContentSizeCategory:(id *)a3 carPlay:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  id v13;

  _UIKitUserDefaults();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronize");
  if (a3)
  {
    v6 = (id)_AXSCopyPreferredContentSizeCategoryName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *a3;
    *a3 = v7;

  }
  v9 = v13;
  if (a4)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("UICarPlayPreferredContentSizeCategoryName"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = CFSTR("UICTContentSizeCategoryL");
    objc_storeStrong(a4, v12);

    v9 = v13;
  }

}

+ (void)overrideSystemWithPreference:(id)a3 forBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (id)objc_msgSend(a1, "system");
  if (v9)
  {
    objc_msgSend((id)__preferences, "overridePreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__preferences, "setOverridePreferences:", v9);
    if (v6)
      v6[2](v6);
    objc_msgSend((id)__preferences, "setOverridePreferences:", v8);

  }
}

+ (void)overrideSystemWithPreference:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(a1, "system");
  v5 = v6;
  if (v6)
  {
    objc_msgSend((id)__preferences, "setOverridePreferences:", v6);
    v5 = v6;
  }

}

+ (void)resetSystemPreferenceOverride
{
  id v2;

  v2 = (id)objc_msgSend(a1, "system");
  objc_msgSend((id)__preferences, "setOverridePreferences:", 0);
}

+ (void)asyncOverrideSystemWithPreference:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__UIContentSizeCategoryPreference_asyncOverrideSystemWithPreference___block_invoke;
  v6[3] = &unk_1E16B1888;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __69__UIContentSizeCategoryPreference_asyncOverrideSystemWithPreference___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "overrideSystemWithPreference:", *(_QWORD *)(a1 + 32));
}

+ (void)asyncResetSystemPreferenceOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__UIContentSizeCategoryPreference_asyncResetSystemPreferenceOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__UIContentSizeCategoryPreference_asyncResetSystemPreferenceOverride__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetSystemPreferenceOverride");
}

+ (void)_resetSystemPreferenceOverride
{
  void *v2;

  v2 = (void *)__preferences;
  __preferences = 0;

}

+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3
{
  id v4;
  UIContentSizeCategoryPreference *v5;

  v4 = a3;
  v5 = -[UIContentSizeCategoryPreference initWithContentSizeCategory:]([UIContentSizeCategoryPreference alloc], "initWithContentSizeCategory:", v4);

  objc_msgSend(a1, "overrideSystemWithPreference:", v5);
}

+ (void)_overrideSystemPreferenceToContentSizeCategory:(id)a3 forBlock:(id)a4
{
  id v6;
  id v7;
  UIContentSizeCategoryPreference *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UIContentSizeCategoryPreference initWithContentSizeCategory:carPlay:]([UIContentSizeCategoryPreference alloc], "initWithContentSizeCategory:carPlay:", v7, CFSTR("_UICTContentSizeCategoryUnspecified"));

  objc_msgSend(a1, "overrideSystemWithPreference:forBlock:", v8, v6);
}

- (UIContentSizeCategoryPreference)initWithContentSizeCategory:(id)a3 carPlay:(id)a4
{
  id v6;
  id v7;
  UIContentSizeCategoryPreference *v8;
  uint64_t v9;
  NSString *preferredContentSizeCategory;
  uint64_t v11;
  NSString *preferredContentSizeCategoryCarPlay;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIContentSizeCategoryPreference;
  v8 = -[UIContentSizeCategoryPreference init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    preferredContentSizeCategory = v8->_preferredContentSizeCategory;
    v8->_preferredContentSizeCategory = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    preferredContentSizeCategoryCarPlay = v8->_preferredContentSizeCategoryCarPlay;
    v8->_preferredContentSizeCategoryCarPlay = (NSString *)v11;

  }
  return v8;
}

- (UIContentSizeCategoryPreference)initWithRawUserDefaults
{
  UIContentSizeCategoryPreference *v2;
  id v4;
  id v5;

  v2 = self;
  if (self)
  {
    v4 = 0;
    v5 = 0;
    objc_msgSend((id)objc_opt_class(), "_populateUserDefaultsContentSizeCategory:carPlay:", &v5, &v4);
    v2 = -[UIContentSizeCategoryPreference initWithContentSizeCategory:carPlay:](v2, "initWithContentSizeCategory:carPlay:", v5, v4);

  }
  return v2;
}

- (UIContentSizeCategoryPreference)init
{

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10
      || (-[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "preferredContentSizeCategory"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToString:", v4)))
    {
      -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategoryCarPlay");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v8 = 1;
      }
      else
      {
        -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preferredContentSizeCategoryCarPlay");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "isEqualToString:", v14);

      }
      if (v9 == v10)
        goto LABEL_11;
    }
    else
    {
      v8 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UIContentSizeCategoryPreference preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentSizeCategoryPreference preferredContentSizeCategoryCarPlay](self, "preferredContentSizeCategoryCarPlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ carplay=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategoryCarPlay, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end
