@implementation SHBagContract

- (SHBagContract)initWithBaseDictionaryKey:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  SHBagContract *v8;
  uint64_t v9;
  NSString *baseDictionaryKey;
  NSMutableDictionary *v11;
  NSMutableDictionary *mutableDefaultValues;
  NSNumberFormatter *v13;
  NSNumberFormatter *numberFormatter;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SHBagContract;
  v8 = -[SHBagContract init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    baseDictionaryKey = v8->_baseDictionaryKey;
    v8->_baseDictionaryKey = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableDefaultValues = v8->_mutableDefaultValues;
    v8->_mutableDefaultValues = v11;

    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v8->_numberFormatter;
    v8->_numberFormatter = v13;

    -[NSNumberFormatter setNumberStyle:](v8->_numberFormatter, "setNumberStyle:", 1);
    objc_storeStrong((id *)&v8->_bag, a4);
  }

  return v8;
}

- (SHBagContract)initWithBaseDictionaryKey:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  SHBagContract *v13;

  v8 = (void *)MEMORY[0x24BE08190];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "setSuppressEngagement:", 1);
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SHBagContract initWithBaseDictionaryKey:bag:](self, "initWithBaseDictionaryKey:bag:", v11, v12);
  return v13;
}

- (void)loadBaseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SHBagContract bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract baseDictionaryKey](self, "baseDictionaryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__SHBagContract_loadBaseDictionary___block_invoke;
  v9[3] = &unk_24DDB1F10;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "valueWithCompletion:", v9);

}

uint64_t __36__SHBagContract_loadBaseDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fullyQualifiedKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[SHBagContract baseDictionaryKey](self, "baseDictionaryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)defaultValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SHBagContract mutableDefaultValues](self, "mutableDefaultValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x24BDD17C8];
        -[SHBagContract baseDictionaryKey](self, "baseDictionaryKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v11, &stru_24DDB28B8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[SHBagContract mutableDefaultValues](self, "mutableDefaultValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (void)addBagKey:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SHBagContract mutableDefaultValues](self, "mutableDefaultValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, v9);

  -[SHBagContract bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultValue:forKey:", v6, v9);

}

- (id)defaultValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SHBagContract mutableDefaultValues](self, "mutableDefaultValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)integerBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  -[SHBagContract bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke;
  v17[3] = &unk_24DDB1F38;
  v17[4] = self;
  v18 = v6;
  v12 = v6;
  objc_msgSend(v10, "transformWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke_2;
  v15[3] = &unk_24DDB1F60;
  v16 = v7;
  v14 = v7;
  -[SHBagContract valueForKey:bagValue:completionHandler:](self, "valueForKey:bagValue:completionHandler:", v12, v13, v15);

}

id __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(*(id *)(a1 + 32), "numberFromString:forKey:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __63__SHBagContract_integerBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "integerValue"), v5);

}

- (void)doubleBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a3;
  v7 = a4;
  -[SHBagContract bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke;
  v17[3] = &unk_24DDB1F38;
  v17[4] = self;
  v18 = v6;
  v12 = v6;
  objc_msgSend(v10, "transformWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke_2;
  v15[3] = &unk_24DDB1F60;
  v16 = v7;
  v14 = v7;
  -[SHBagContract valueForKey:bagValue:completionHandler:](self, "valueForKey:bagValue:completionHandler:", v12, v13, v15);

}

id __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(*(id *)(a1 + 32), "numberFromString:forKey:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __62__SHBagContract_doubleBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)BOOLeanBackedByStringForKey:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = a3;
  -[SHBagContract bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transformWithBlock:", &__block_literal_global);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke_2;
  v13[3] = &unk_24DDB1F60;
  v14 = v6;
  v12 = v6;
  -[SHBagContract valueForKey:bagValue:completionHandler:](self, "valueForKey:bagValue:completionHandler:", v7, v11, v13);

}

id __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE08340];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "BOOLValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __63__SHBagContract_BOOLeanBackedByStringForKey_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (void)stringForKey:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[SHBagContract bag](self, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SHBagContract valueForKey:bagValue:completionHandler:](self, "valueForKey:bagValue:completionHandler:", v7, v10, v6);
}

- (void)valueForKey:(id)a3 bagValue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isLoaded") & 1) != 0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__SHBagContract_valueForKey_bagValue_completionHandler___block_invoke;
    v16[3] = &unk_24DDB1FA8;
    v16[4] = self;
    v17 = v8;
    v18 = v10;
    objc_msgSend(v9, "valueWithCompletion:", v16);

  }
  else
  {
    shcore_log_object();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_21AB5E000, v11, OS_LOG_TYPE_ERROR, "%@ was not loaded when we tried to access it, attempting to return default...", buf, 0xCu);

    }
    -[SHBagContract defaultValueForKey:](self, "defaultValueForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      shcore_log_object();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[SHBagContract fullyQualifiedKey:](self, "fullyQualifiedKey:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_21AB5E000, v14, OS_LOG_TYPE_ERROR, "NO DEFAULT SUPPLIED for %@", buf, 0xCu);

      }
    }
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v13, 0);

  }
}

void __56__SHBagContract_valueForKey_bagValue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v7 && objc_msgSend(*(id *)(a1 + 32), "throwOnError"))
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to fetch key %@ with error %@"), *(_QWORD *)(a1 + 40), v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v17);
    }
    objc_msgSend(*(id *)(a1 + 32), "defaultValueForKey:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    shcore_log_object();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "fullyQualifiedKey:", *(_QWORD *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_21AB5E000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch key %@ from bag with error %@, using default", buf, 0x16u);

      }
      v6;
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "fullyQualifiedKey:", *(_QWORD *)(a1 + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_21AB5E000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch key %@ from bag with error %@, NO DEFAULT SUPPLIED", buf, 0x16u);

      }
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v12();

  }
}

- (id)numberFromString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SHBagContract numberFormatter](self, "numberFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberFromString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SHBagContract defaultValueForKey:](self, "defaultValueForKey:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    shcore_log_object();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        v15 = 138412290;
        v16 = v6;
        v13 = "Failed to convert string %@, to number using default";
LABEL_8:
        _os_log_impl(&dword_21AB5E000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      v15 = 138412290;
      v16 = v6;
      v13 = "Failed to convert string %@, to number using default, NO DEFAULT SUPPLIED";
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v10 = v9;
LABEL_10:

  return v10;
}

- (BOOL)throwOnError
{
  return self->_throwOnError;
}

- (void)setThrowOnError:(BOOL)a3
{
  self->_throwOnError = a3;
}

- (NSString)baseDictionaryKey
{
  return self->_baseDictionaryKey;
}

- (NSMutableDictionary)mutableDefaultValues
{
  return self->_mutableDefaultValues;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_mutableDefaultValues, 0);
  objc_storeStrong((id *)&self->_baseDictionaryKey, 0);
}

@end
