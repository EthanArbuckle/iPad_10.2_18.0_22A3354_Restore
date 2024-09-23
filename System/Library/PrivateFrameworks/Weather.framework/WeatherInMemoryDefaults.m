@implementation WeatherInMemoryDefaults

- (WeatherInMemoryDefaults)init
{
  WeatherInMemoryDefaults *v2;
  void *v3;
  void *v4;
  void *v5;
  WeatherInMemoryDefaults *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WeatherInMemoryDefaults;
  v2 = -[WeatherInMemoryDefaults init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherInMemoryDefaults setInMemoryStore:](v2, "setInMemoryStore:", v3);

    -[WeatherInMemoryDefaults inMemoryStore](v2, "inMemoryStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1A8], CFSTR("cities"));

    -[WeatherInMemoryDefaults inMemoryStore](v2, "inMemoryStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", CFSTR("2.0"), CFSTR("PrefsVersion"));

    v6 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherInMemoryDefaults inMemoryStore](self, "inMemoryStore");
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
  -[WeatherInMemoryDefaults inMemoryStore](self, "inMemoryStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WeatherInMemoryDefaults inMemoryStore](self, "inMemoryStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[WeatherInMemoryDefaults objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[WeatherInMemoryDefaults inMemoryStore](self, "inMemoryStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (BOOL)synchronize
{
  self->_synchronizeWasCalled = 1;
  return 1;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[WeatherInMemoryDefaults synchronize](self, "synchronize");
  v4[2](v4, 0);

}

- (NSMutableDictionary)inMemoryStore
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInMemoryStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)synchronizeWasCalled
{
  return self->_synchronizeWasCalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryStore, 0);
}

@end
