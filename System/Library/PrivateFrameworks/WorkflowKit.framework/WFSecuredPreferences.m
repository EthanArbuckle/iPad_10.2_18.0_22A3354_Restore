@implementation WFSecuredPreferences

- (WFSecuredPreferences)init
{
  WFSecuredPreferences *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  void *v5;
  uint64_t v6;
  void *v7;
  WFSecuredPreferences *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFSecuredPreferences;
  v2 = -[WFSecuredPreferences init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CB3420];
    -[WFSecuredPreferences userDefaults](v2, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_userDefaultsDidChange_, v6, v7);

    v8 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (void)registerDefaults:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSecuredPreferences userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDefaults:", v4);

}

- (void)userDefaultsDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WFSecuredPreferencesDidChangeNotification"), self);

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

+ (WFSecuredPreferences)standardPreferences
{
  if (standardPreferences_onceToken[0] != -1)
    dispatch_once(standardPreferences_onceToken, &__block_literal_global_2954);
  return (WFSecuredPreferences *)(id)standardPreferences_standardPreferences;
}

void __43__WFSecuredPreferences_standardPreferences__block_invoke()
{
  WFSecuredPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(WFSecuredPreferences);
  v1 = (void *)standardPreferences_standardPreferences;
  standardPreferences_standardPreferences = (uint64_t)v0;

}

@end
