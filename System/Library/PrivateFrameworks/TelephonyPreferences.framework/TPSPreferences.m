@implementation TPSPreferences

+ (TPSPreferences)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (TPSPreferences *)(id)sharedInstance_sPreferences;
}

void __32__TPSPreferences_sharedInstance__block_invoke()
{
  TPSPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(TPSPreferences);
  v1 = (void *)sharedInstance_sPreferences;
  sharedInstance_sPreferences = (uint64_t)v0;

}

- (TPSPreferences)init
{
  TPSPreferences *v2;
  void *v3;
  uint64_t v4;
  NSString *domain;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSPreferences;
  v2 = -[TPSPreferences init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    domain = v2->_domain;
    v2->_domain = (NSString *)v4;

  }
  return v2;
}

- (BOOL)showSubscriptionList
{
  void *v3;

  NSStringFromSelector(sel_showSubscriptionList);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TPSPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", v3, 0);

  return (char)self;
}

- (id)preferencesValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TPSPreferences domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSPreferences preferencesValueForKey:domain:](self, "preferencesValueForKey:domain:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preferencesValueForKey:(id)a3 domain:(id)a4
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TPSPreferences domain](self, "domain");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPreferences setPreferencesValue:forKey:domain:](self, "setPreferencesValue:forKey:domain:", v7, v6, v8);

}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  const __CFString *v7;
  const __CFString *v8;
  __CFString *applicationID;

  v7 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
  applicationID = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a4, a3, applicationID, v8, v7);
  CFPreferencesSynchronize(applicationID, v8, v7);

}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  -[TPSPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (id)numberForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[TPSPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

  }
  return v8;
}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[TPSPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[TPSPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (void)setUnsignedInteger:(unint64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TPSPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[TPSPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

  }
  return v8;
}

- (NSString)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
