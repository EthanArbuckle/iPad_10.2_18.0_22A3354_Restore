@implementation APAdLibDefaults

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", v4));

  return v6;
}

- (APAdLibDefaults)init
{
  APAdLibDefaults *v2;
  NSUserDefaults *v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APAdLibDefaults;
  v2 = -[APAdLibDefaults init](&v6, "init");
  if (v2)
  {
    v3 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.AdLib"));
    defaults = v2->_defaults;
    v2->_defaults = v3;

  }
  return v2;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (BOOL)defaultIsSetForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v4));

  return v6 != 0;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
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
  v7 = (id)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v5, "doubleForKey:", v4);
  v7 = v6;

  return v7;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v7, "setDouble:forKey:", v6, a3);

}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  v6 = objc_msgSend(v5, "integerForKey:", v4);

  return (int64_t)v6;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v7, "setInteger:forKey:", a3, v6);

}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayForKey:", v4));

  return v6;
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[APAdLibDefaults defaults](self, "defaults"));
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

@end
