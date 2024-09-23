@implementation StateAccess

- (StateAccess)init
{
  StateAccess *v2;
  uint64_t v3;
  NSUserDefaults *aspCarryDefaults;
  StateAccess *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StateAccess;
  v2 = -[StateAccess init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    aspCarryDefaults = v2->_aspCarryDefaults;
    v2->_aspCarryDefaults = (NSUserDefaults *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)deleteKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)setValue:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentDomainForName:", v9));

  if (v12)
    v13 = objc_msgSend(v12, "mutableCopy");
  else
    v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = v13;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  objc_msgSend(v15, "setPersistentDomain:forName:", v14, v9);

  objc_autoreleasePoolPop(v10);
}

- (id)getValueForKey:(id)a3 expectedType:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v6 = a3;
  v10[0] = objc_opt_class(NSString);
  v10[1] = objc_opt_class(NSNumber);
  v10[2] = objc_opt_class(NSDictionary);
  v10[3] = objc_opt_class(NSArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (a4 <= 3 && (objc_opt_isKindOfClass(v8, v10[a4]) & 1) == 0)
  {

    v8 = 0;
  }
  return v8;
}

- (id)getValueForKey:(id)a3 inDomain:(id)a4 expectedType:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v8 = a4;
  v9 = a3;
  v14[0] = objc_opt_class(NSString);
  v14[1] = objc_opt_class(NSNumber);
  v14[2] = objc_opt_class(NSDictionary);
  v14[3] = objc_opt_class(NSArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentDomainForName:", v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));
  if (a5 <= 3 && (objc_opt_isKindOfClass(v12, v14[a5]) & 1) == 0)
  {

    v12 = 0;
  }
  return v12;
}

- (id)getAllKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  return v4;
}

- (NSUserDefaults)aspCarryDefaults
{
  return self->_aspCarryDefaults;
}

- (void)setAspCarryDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_aspCarryDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspCarryDefaults, 0);
}

@end
