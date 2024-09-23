@implementation SCWSharedPreferences

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", a3);
}

+ (id)sharedPreferences
{
  void *v2;
  SCWSharedPreferences *v3;
  void *v4;

  v2 = (void *)__sharedPreferences;
  if (!__sharedPreferences)
  {
    v3 = objc_alloc_init(SCWSharedPreferences);
    v4 = (void *)__sharedPreferences;
    __sharedPreferences = (uint64_t)v3;

    v2 = (void *)__sharedPreferences;
  }
  return v2;
}

- (SCWSharedPreferences)init
{
  SCWSharedPreferences *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSUserDefaults *sharedDefaults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCWSharedPreferences;
  v2 = -[SCWSharedPreferences init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.stocks"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "_initWithSuiteName:container:", CFSTR("group.com.apple.stocks"), v4);
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v5;

  }
  return v2;
}

+ (void)clearSharedPreferences
{
  void *v2;

  v2 = (void *)__sharedPreferences;
  __sharedPreferences = 0;

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_sharedDefaults, "setObject:forKey:", a3, a4);
}

- (void)synchronize
{
  -[NSUserDefaults synchronize](self->_sharedDefaults, "synchronize");
}

- (void)removeObjectForKey:(id)a3
{
  -[NSUserDefaults removeObjectForKey:](self->_sharedDefaults, "removeObjectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end
