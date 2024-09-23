@implementation VUIJSUserDefaults

- (void)removeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDataForKey:", v4);

}

- (void)setData:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[VUIJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isNull"))
  {
    objc_msgSend(v8, "removeDataForKey:", v6);
  }
  else
  {
    if (objc_msgSend(v7, "isString"))
    {
      objc_msgSend(v7, "toString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v7, "isBoolean") && !v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "toBool"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v7, "isNumber") && !v9)
    {
      objc_msgSend(v7, "toNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v7, "isArray") && !v9)
    {
      objc_msgSend(v7, "toArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v9)
    {
      objc_msgSend(v8, "setData:forKey:", v9, v6);
    }
    else
    {
      VUIDefaultLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[VUIJSUserDefaults setData::].cold.1((uint64_t)v6, v10);

    }
  }

}

- (id)getData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  -[VUIJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v5, "jsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithNullInContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSUserDefaults userDefaultsStorage](self, "userDefaultsStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(v5, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueWithObject:inContext:", v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }

  return v8;
}

- (VUIAppUserDefaultsStoring)userDefaultsStorage
{
  return (VUIAppUserDefaultsStoring *)objc_loadWeakRetained((id *)&self->_userDefaultsStorage);
}

- (VUIJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4
{
  id v6;
  VUIJSUserDefaults *v7;
  VUIJSUserDefaults *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VUIJSUserDefaults;
  v7 = -[VUIJSObject initWithAppContext:](&v10, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_userDefaultsStorage, v6);

  return v8;
}

- (void)setUserDefaultsStorage:(id)a3
{
  objc_storeWeak((id *)&self->_userDefaultsStorage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userDefaultsStorage);
}

- (void)setData:(uint64_t)a1 :(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIJSUserDefaults - Failed to set unrecognized value for key '%@'", (uint8_t *)&v2, 0xCu);
}

@end
