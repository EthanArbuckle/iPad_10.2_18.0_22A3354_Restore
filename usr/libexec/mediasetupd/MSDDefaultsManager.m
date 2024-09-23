@implementation MSDDefaultsManager

- (void)setDeveloperProfilesCount:(unint64_t)a3
{
  -[NSUserDefaults setInteger:forKey:](self->_MSDDeveloperDefaults, "setInteger:forKey:", a3, CFSTR("developerProfileCount"));
}

- (unint64_t)developerProfilesCount
{
  return -[NSUserDefaults integerForKey:](self->_MSDDeveloperDefaults, "integerForKey:", CFSTR("developerProfileCount"));
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002838;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052718 != -1)
    dispatch_once(&qword_100052718, block);
  return (id)qword_100052720;
}

- (MSDDefaultsManager)init
{
  MSDDefaultsManager *v2;
  id v3;
  NSUserDefaults *v4;
  NSUserDefaults *MSDDeveloperDefaults;
  id v6;
  NSUserDefaults *v7;
  NSUserDefaults *MSDDefaults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDDefaultsManager;
  v2 = -[MSDDefaultsManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (NSUserDefaults *)objc_msgSend(v3, "initWithSuiteName:", kMediaSetupDeveloperUserDefaultsDomain);
    MSDDeveloperDefaults = v2->_MSDDeveloperDefaults;
    v2->_MSDDeveloperDefaults = v4;

    v6 = objc_alloc((Class)NSUserDefaults);
    v7 = (NSUserDefaults *)objc_msgSend(v6, "initWithSuiteName:", kMediaSetupUserDefaultsDomain);
    MSDDefaults = v2->_MSDDefaults;
    v2->_MSDDefaults = v7;

  }
  return v2;
}

- (BOOL)setObjectWithCustomClass:(id)a3 forDefault:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v13;

  v6 = a4;
  if (a3)
  {
    v13 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13));
    v8 = v13;
    if (v8)
    {
      v9 = sub_10002E034();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000326C((uint64_t)v8, v10);

      v11 = 0;
    }
    else
    {
      v11 = -[MSDDefaultsManager setObject:forDefault:](self, "setObject:forDefault:", v7, v6);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setObject:(id)a3 forDefault:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
    v9 = 8;
    if (v8)
      v9 = 16;
    objc_msgSend(*(id *)((char *)&self->super.isa + v9), "setObject:forKey:", v6, v7);
  }
  else
  {
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000032E0();

  }
  return v7 != 0;
}

- (BOOL)clearObjectForDefault:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    -[NSUserDefaults removeObjectForKey:](self->_MSDDeveloperDefaults, "removeObjectForKey:", v4);
    -[NSUserDefaults removeObjectForKey:](self->_MSDDefaults, "removeObjectForKey:", v4);
  }
  else
  {
    v5 = sub_10002E034();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000330C();

  }
  return v4 != 0;
}

- (BOOL)removeObjectForDefault:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    v5 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
    v6 = 8;
    if (v5)
      v6 = 16;
    objc_msgSend(*(id *)((char *)&self->super.isa + v6), "removeObjectForKey:", v4);
  }
  else
  {
    v7 = sub_10002E034();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000330C();

  }
  return v4 != 0;
}

- (id)objectForDefault:(id)a3
{
  id v4;
  NSUserDefaults *MSDDeveloperDefaults;
  id v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    if (-[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded"))
      MSDDeveloperDefaults = self->_MSDDeveloperDefaults;
    else
      MSDDeveloperDefaults = self->_MSDDefaults;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](MSDDeveloperDefaults, "objectForKey:", v4));
  }
  else
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100003338();

    v8 = 0;
  }

  return v8;
}

- (id)objectForKeyInDeveloperDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_MSDDeveloperDefaults, "objectForKey:", v4));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  else
    v6 = 0;

  return v6;
}

- (id)objectForKeyInDefaultDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_MSDDefaults, "objectForKey:", v4));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  else
    v6 = 0;

  return v6;
}

- (id)objectForDefaultWithCustomClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager objectForDefault:](self, "objectForDefault:", v4));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  else
    v6 = 0;

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  unsigned int v3;
  uint64_t v4;

  v3 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
  v4 = 8;
  if (v3)
    v4 = 16;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v4), "dictionaryRepresentation"));
}

- (BOOL)profilesEverInstalled
{
  return -[NSUserDefaults BOOLForKey:](self->_MSDDeveloperDefaults, "BOOLForKey:", CFSTR("developerProfileLoaded"));
}

- (BOOL)isDeveloperProfileLoaded
{
  unint64_t v3;

  v3 = -[MSDDefaultsManager developerProfilesCount](self, "developerProfilesCount");
  if ((v3 != 0) != -[NSUserDefaults BOOLForKey:](self->_MSDDeveloperDefaults, "BOOLForKey:", CFSTR("developerProfileLoaded")))-[NSUserDefaults setBool:forKey:](self->_MSDDeveloperDefaults, "setBool:forKey:", v3 != 0, CFSTR("developerProfileLoaded"));
  return v3 != 0;
}

- (void)clearDeveloperDefaults
{
  -[MSDDefaultsManager setDeveloperProfilesCount:](self, "setDeveloperProfilesCount:", 0);
  -[NSUserDefaults removePersistentDomainForName:](self->_MSDDeveloperDefaults, "removePersistentDomainForName:", kMediaSetupDeveloperUserDefaultsDomain);
}

- (void)clearPrivateAndSharedLocalData
{
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("kUserIDToRecordZoneIDMap"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("privateDatabaseData"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("privateDatabaseChangesKey"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("privateDatabaseKeyRefreshTokens"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("sharedDatabaseData"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("sharedDatabaseChangesKey"));
  -[MSDDefaultsManager clearObjectForDefault:](self, "clearObjectForDefault:", CFSTR("sharedDatabaseKeyRefreshTokens"));
}

- (id)_decodeObject:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v27 = (uint64_t)v5;
    v7 = a3;
    v26 = objc_opt_class(MediaService);
    v25 = objc_opt_class(NSArray);
    v8 = objc_opt_class(NSDictionary);
    v9 = objc_opt_class(MSDDefaultsInfo);
    v10 = objc_opt_class(CKServerChangeToken);
    v11 = objc_opt_class(MSPublicDBInfo);
    v12 = objc_opt_class(NSString);
    v13 = objc_opt_class(NSData);
    v14 = objc_opt_class(NSMutableData);
    v15 = objc_opt_class(CKRecordZoneID);
    v16 = objc_opt_class(NSNull);
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v25, v8, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(NSNumber), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v28 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v7, &v28));

    v20 = v28;
    if (v20)
    {
      v21 = sub_10002E034();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v6 = (void *)v27;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100003364(v27, (uint64_t)v20, v22);

      v23 = 0;
    }
    else
    {
      v23 = v19;
      v6 = (void *)v27;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSUserDefaults)MSDDefaults
{
  return self->_MSDDefaults;
}

- (void)setMSDDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_MSDDefaults, a3);
}

- (NSUserDefaults)MSDDeveloperDefaults
{
  return self->_MSDDeveloperDefaults;
}

- (void)setMSDDeveloperDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_MSDDeveloperDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MSDDeveloperDefaults, 0);
  objc_storeStrong((id *)&self->_MSDDefaults, 0);
}

@end
