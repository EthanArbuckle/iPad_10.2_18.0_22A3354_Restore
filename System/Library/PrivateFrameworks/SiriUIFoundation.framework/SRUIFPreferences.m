@implementation SRUIFPreferences

- (SRUIFPreferences)initWithSuiteName:(id)a3
{
  id v4;
  SRUIFPreferences *v5;
  uint64_t v6;
  NSUserDefaults *userDefaults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFPreferences;
  v5 = -[SRUIFPreferences init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v6;

  }
  return v5;
}

- (SRUIFPreferences)initWithDefaultsAtURL:(id)a3
{
  id v4;
  SRUIFPreferences *v5;
  NSUserDefaults *v6;
  NSUserDefaults *userDefaults;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  SRUIFPreferences *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SRUIFPreferences;
  v5 = -[SRUIFPreferences init](&v17, sel_init);
  if (v5)
  {
    v6 = (NSUserDefaults *)objc_alloc_init(MEMORY[0x24BDBCF50]);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v6;

    if (v4)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 0, &v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16;
      if (v8)
      {
        v15 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v15;

        if (v10)
        {
          -[NSUserDefaults registerDefaults:](v5->_userDefaults, "registerDefaults:", v10);

        }
        else
        {
          v13 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v19 = "-[SRUIFPreferences initWithDefaultsAtURL:]";
            v20 = 2114;
            v21 = v5;
            v22 = 2114;
            v23 = v4;
            v24 = 2114;
            v25 = v11;
            _os_log_error_impl(&dword_219F26000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to parse defaults property list at %{public}@: %{public}@", buf, 0x2Au);
          }
        }
        v9 = v11;
      }
      else
      {
        v12 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v19 = "-[SRUIFPreferences initWithDefaultsAtURL:]";
          v20 = 2114;
          v21 = v5;
          v22 = 2114;
          v23 = v4;
          v24 = 2114;
          v25 = v9;
          _os_log_error_impl(&dword_219F26000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@ unable to read defaults from %{public}@: %{public}@", buf, 0x2Au);
        }
      }

    }
  }

  return v5;
}

- (SRUIFPreferences)initWithDefaultsResource:(id)a3 withExtension:(id)a4 inBundle:(id)a5
{
  void *v6;
  SRUIFPreferences *v7;

  objc_msgSend(a5, "URLForResource:withExtension:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SRUIFPreferences initWithDefaultsAtURL:](self, "initWithDefaultsAtURL:", v6);

  return v7;
}

- (SRUIFPreferences)init
{
  return -[SRUIFPreferences initWithDefaultsAtURL:](self, "initWithDefaultsAtURL:", 0);
}

- (int64_t)integerForKey:(id)a3
{
  return -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", a3);
}

- (double)doubleForKey:(id)a3
{
  double result;

  -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", a3);
  return result;
}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", a3);
}

- (id)stringForKey:(id)a3
{
  return -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", a3);
}

- (void)_mutateValueForKey:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    -[SRUIFPreferences delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SRUIFPreferences delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferences:didChangeValueForKey:", self, v11);

    }
  }

}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__SRUIFPreferences_setInteger_forKey___block_invoke;
  v8[3] = &unk_24DC1A770;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v7 = v6;
  v9 = v7;
  -[SRUIFPreferences _mutateValueForKey:block:](self, "_mutateValueForKey:block:", v7, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __38__SRUIFPreferences_setInteger_forKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[1], "setInteger:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SRUIFPreferences_setDouble_forKey___block_invoke;
  v8[3] = &unk_24DC1A770;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  v7 = v6;
  v9 = v7;
  -[SRUIFPreferences _mutateValueForKey:block:](self, "_mutateValueForKey:block:", v7, v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

}

void __37__SRUIFPreferences_setDouble_forKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[1], "setDouble:forKey:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SRUIFPreferences_setBool_forKey___block_invoke;
  v8[3] = &unk_24DC1A798;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  v7 = v6;
  v9 = v7;
  -[SRUIFPreferences _mutateValueForKey:block:](self, "_mutateValueForKey:block:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __35__SRUIFPreferences_setBool_forKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[1], "setBool:forKey:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__SRUIFPreferences_setObject_forKey___block_invoke;
  v10[3] = &unk_24DC1A7C0;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[SRUIFPreferences _mutateValueForKey:block:](self, "_mutateValueForKey:block:", v9, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __37__SRUIFPreferences_setObject_forKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[1], "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)synchronize
{
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

- (SRUIFPreferencesDelegate)delegate
{
  return (SRUIFPreferencesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
