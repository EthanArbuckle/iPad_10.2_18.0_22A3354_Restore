@implementation VMPreferences

- (BOOL)transcriptionEnabled
{
  void *v3;

  NSStringFromSelector(sel_transcriptionEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[VMPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", v3, 1);

  return (char)self;
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  -[VMPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)numberForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[VMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

  }
  return v8;
}

- (id)preferencesValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VMPreferences domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMPreferences preferencesValueForKey:domain:](self, "preferencesValueForKey:domain:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)preferencesValueForKey:(id)a3 domain:(id)a4
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
}

- (NSString)domain
{
  return self->_domain;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_sPreferences;
}

- (void)setTranscriptionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  NSStringFromSelector(sel_transcriptionEnabled);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VMPreferences setBool:forKey:](self, "setBool:forKey:", v3, v5);

}

void __31__VMPreferences_sharedInstance__block_invoke()
{
  VMPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(VMPreferences);
  v1 = (void *)sharedInstance_sPreferences;
  sharedInstance_sPreferences = (uint64_t)v0;

}

- (VMPreferences)init
{
  VMPreferences *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *domain;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VMPreferences;
  v2 = -[VMPreferences init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.preferences"), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v2->_domain;
    v2->_domain = (NSString *)v6;

  }
  return v2;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VMPreferences domain](self, "domain");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VMPreferences setPreferencesValue:forKey:domain:](self, "setPreferencesValue:forKey:domain:", v7, v6, v8);

}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 domain:(id)a5
{
  const __CFString *v7;
  const __CFString *v8;
  __CFString *applicationID;

  v7 = (const __CFString *)*MEMORY[0x24BDBD588];
  v8 = (const __CFString *)*MEMORY[0x24BDBD590];
  applicationID = (__CFString *)a5;
  CFPreferencesSetValue((CFStringRef)a4, a3, applicationID, v8, v7);
  CFPreferencesSynchronize(applicationID, v8, v7);

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VMPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (int64_t)integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[VMPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
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

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VMPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (unint64_t)unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[VMPreferences numberForKey:defaultValue:](self, "numberForKey:defaultValue:", a3, 0);
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

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VMPreferences setNumber:forKey:](self, "setNumber:forKey:", v8, v7);

}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[VMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
