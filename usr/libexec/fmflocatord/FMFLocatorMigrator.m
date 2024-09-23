@implementation FMFLocatorMigrator

- (BOOL)performMigration
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFLocatorMigrator is migrating", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorMigrator _oldVersionIdentifiersDict](self, "_oldVersionIdentifiersDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFLocatorMigrator _currentVersionIdentifiersDict](self, "_currentVersionIdentifiersDict"));
  -[FMFLocatorMigrator _saveVersionIdentifiersDict:](self, "_saveVersionIdentifiersDict:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buildVersion")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buildVersion")));
  -[FMFLocatorMigrator migrateFromVersion:toVersion:](self, "migrateFromVersion:toVersion:", v7, v8);

  return 1;
}

- (void)migrateFromVersion:(id)a3 toVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "compare:", v6);
  if (v7 == (id)1)
  {
    v11 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v10 = "Back-migration from %@ to %@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (v7 == (id)-1)
  {
    v8 = sub_10001C4E8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v10 = "Migrating from %@ to %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_oldVersionIdentifiersDict
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &stru_100057AE0, CFSTR("buildVersion"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &stru_100057AE0, CFSTR("productVersion"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &stru_100057AE0, CFSTR("fmflocatorVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("LastLaunchVersion"), CFSTR("com.apple.icloud.fmflocatord")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(",")));
  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("buildVersion"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("productVersion"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 2));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("fmflocatorVersion"));

  }
  return v2;
}

- (id)_currentVersionIdentifiersDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  const __CFString *v19;
  int v21;
  uint8_t buf[4];
  int v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v21 = 0;
  v4 = MGCopyAnswerWithError(CFSTR("BuildVersion"), 0, &v21);
  v5 = (void *)v4;
  if (v21)
  {
    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error fetching the current build version : %d", buf, 8u);
    }

    v8 = &stru_100057AE0;
  }
  else if (v4)
  {
    v8 = (const __CFString *)v4;
  }
  else
  {
    v8 = &stru_100057AE0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("buildVersion"));
  v21 = 0;
  v9 = MGCopyAnswerWithError(CFSTR("ProductVersion"), 0, &v21);
  v10 = (void *)v9;
  if (v21)
  {
    v11 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error fetching the current product version : %d", buf, 8u);
    }

    v13 = &stru_100057AE0;
  }
  else if (v9)
  {
    v13 = (const __CFString *)v9;
  }
  else
  {
    v13 = &stru_100057AE0;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("productVersion"));
  v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "infoDictionary"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kCFBundleVersionKey));

  if (v18)
    v19 = v18;
  else
    v19 = &stru_100057AE0;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("fmflocatorVersion"));

  return v3;
}

- (void)_saveVersionIdentifiersDict:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  id v12;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buildVersion")));
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_100057AE0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("productVersion")));
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_100057AE0;
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fmflocatorVersion")));

  if (v10)
    v11 = v10;
  else
    v11 = &stru_100057AE0;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,%@,%@"), v6, v9, v11));

  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", v12, CFSTR("LastLaunchVersion"), CFSTR("com.apple.icloud.fmflocatord"));
}

@end
