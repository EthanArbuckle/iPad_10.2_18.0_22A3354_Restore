@implementation StocksPreferences

+ (id)sharedPreferences
{
  void *v2;
  StocksPreferences *v3;
  void *v4;

  v2 = (void *)__sharedPreferences;
  if (!__sharedPreferences)
  {
    v3 = objc_alloc_init(StocksPreferences);
    v4 = (void *)__sharedPreferences;
    __sharedPreferences = (uint64_t)v3;

    v2 = (void *)__sharedPreferences;
  }
  return v2;
}

+ (void)clearSharedPreferences
{
  void *v2;

  v2 = (void *)__sharedPreferences;
  __sharedPreferences = 0;

}

- (StocksPreferences)init
{
  StocksPreferences *v2;
  StocksPreferences *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUserDefaults *sharedDefaults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)StocksPreferences;
  v2 = -[StocksPreferences init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[StocksPreferences resetLocale](v2, "resetLocale");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_resetLocale, *MEMORY[0x24BDBCA70], 0);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.stocks"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "_initWithSuiteName:container:", CFSTR("group.com.apple.stocks"), v6);
    sharedDefaults = v3->_sharedDefaults;
    v3->_sharedDefaults = (NSUserDefaults *)v7;

  }
  return v3;
}

- (void)resetLocale
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_changeColorSwapped = ShouldSwapColorsForLocale(v3);

  v4 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCB20];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_textDirection = objc_msgSend(v4, "characterDirectionForLanguage:", v7);

  v8 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDBCB18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsFromLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_textAttachmentDirectionIsRightToLeft = objc_msgSend(v12, "isEqualToString:", CFSTR("ar"));

}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NSUserDefaults BOOLForKey:](self->_sharedDefaults, "BOOLForKey:", a3);
}

- (int64_t)integerForKey:(id)a3
{
  return -[NSUserDefaults integerForKey:](self->_sharedDefaults, "integerForKey:", a3);
}

- (id)stringForKey:(id)a3
{
  return -[NSUserDefaults stringForKey:](self->_sharedDefaults, "stringForKey:", a3);
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  -[NSUserDefaults setInteger:forKey:](self->_sharedDefaults, "setInteger:forKey:", a3, a4);
}

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", a3);
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

- (BOOL)isChangeColorSwapped
{
  return self->_changeColorSwapped;
}

- (unint64_t)textDirection
{
  return self->_textDirection;
}

- (BOOL)textAttachmentDirectionIsRightToLeft
{
  return self->_textAttachmentDirectionIsRightToLeft;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end
