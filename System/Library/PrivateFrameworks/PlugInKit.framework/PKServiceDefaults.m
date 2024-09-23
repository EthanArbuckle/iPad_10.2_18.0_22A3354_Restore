@implementation PKServiceDefaults

- (PKServiceDefaults)initWithPersonality:(id)a3
{
  id v4;
  PKServiceDefaults *v5;
  PKServiceDefaults *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKServiceDefaults;
  v5 = -[PKServiceDefaults init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKServiceDefaults setPersonality:](v5, "setPersonality:", v4);

  return v6;
}

- (id)objectForKey:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v4 = (__CFString *)a3;
  -[PKServiceDefaults personality](self, "personality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)CFPreferencesCopyAppValue(v4, v6);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  id value;

  v6 = (__CFString *)a4;
  value = a3;
  -[PKServiceDefaults personality](self, "personality");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(v6, value, v8);
}

- (BOOL)synchronize
{
  void *v2;
  __CFString *v3;

  -[PKServiceDefaults personality](self, "personality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return CFPreferencesAppSynchronize(v3) != 0;
}

- (PKServicePersonality)personality
{
  return (PKServicePersonality *)objc_loadWeakRetained((id *)&self->_personality);
}

- (void)setPersonality:(id)a3
{
  objc_storeWeak((id *)&self->_personality, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personality);
}

@end
