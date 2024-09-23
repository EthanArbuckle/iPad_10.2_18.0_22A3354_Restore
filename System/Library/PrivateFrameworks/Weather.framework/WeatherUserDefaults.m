@implementation WeatherUserDefaults

- (WeatherUserDefaults)initWithUserDefaults:(id)a3
{
  id v4;
  WeatherUserDefaults *v5;
  WeatherUserDefaults *v6;
  WeatherUserDefaults *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WeatherUserDefaults;
  v5 = -[WeatherUserDefaults init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WeatherUserDefaults setUserDefaults:](v5, "setUserDefaults:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
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
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
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
  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (BOOL)synchronize
{
  void *v2;
  char v3;

  -[WeatherUserDefaults userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "synchronize");

  return v3;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[WeatherUserDefaults synchronize](self, "synchronize");
  v4[2](v4, 0);

}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
