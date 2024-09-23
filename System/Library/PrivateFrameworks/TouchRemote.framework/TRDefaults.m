@implementation TRDefaults

- (TRDefaults)init
{
  TRDefaults *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRDefaults;
  v2 = -[TRDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.TouchRemote"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_instance;
}

void __28__TRDefaults_sharedInstance__block_invoke()
{
  TRDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(TRDefaults);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

+ (id)sharedDefaults
{
  void *v2;
  void *v3;

  +[TRDefaults sharedInstance](TRDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)forceProxyAuth
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("forceProxyAuth"), 0) != 0;
}

+ (int64_t)anisetteFetchTimeout
{
  return objc_msgSend(a1, "getIntegerForKey:defaultValue:", CFSTR("anisetteFetchTimeout"), 0);
}

+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a4 = objc_msgSend(v7, "integerForKey:", v6);

  return a4;
}

+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "doubleForKey:", v6);
    a4 = v9;
  }

  return a4;
}

+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v4 = objc_msgSend(v7, "BOOLForKey:", v6);

  return v4;
}

+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
