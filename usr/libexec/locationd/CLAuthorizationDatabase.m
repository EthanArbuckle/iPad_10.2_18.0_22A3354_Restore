@implementation CLAuthorizationDatabase

- (id)stringForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  v8 = objc_opt_class(NSString, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    return +[NSString stringWithString:](NSString, "stringWithString:", v6);
  if ((objc_opt_respondsToSelector(v6, "stringValue") & 1) != 0)
    return objc_msgSend(v6, "stringValue");
  return a5;
}

- (double)doubleForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(double)a5
{
  id v6;
  double result;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "doubleValue") & 1) == 0)
    return a5;
  objc_msgSend(v6, "doubleValue");
  return result;
}

- (void)removeValueForKey:(id)a3 atKeyPath:(id)a4
{
  id v6;

  v6 = -[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a3, a4);
  if (v6)
  {
    objc_msgSend(v6, "removeObjectForKey:", a3);
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }
}

- (void)_setValue:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  id v8;
  void *v9;

  if (a3)
  {
    v8 = -[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a4, a5);
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(a3, "isEqual:", objc_msgSend(v8, "objectForKeyedSubscript:", a4)) & 1) == 0)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", a3, a4);
        -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
      }
    }
  }
}

- (BOOL)hasValueForKey:(id)a3 atKeyPath:(id)a4
{
  return objc_msgSend(-[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a3, a4), "objectForKeyedSubscript:", a3) != 0;
}

- (id)_dictionaryForKey:(id)a3 atKeyPath:(id)a4
{
  id v5;

  v5 = -[CLAuthorizationDatabase _ckpToAccessGivenKey:andInputKeyPath:](self, "_ckpToAccessGivenKey:andInputKeyPath:", a3, a4);
  if (objc_msgSend(v5, "isValidCKP"))
    return -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v5, "clientKey"));
  else
    return 0;
}

- (id)readonlyStoreAtKeyPath:(id)a3
{
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id result;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  if (a3 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && !objc_msgSend(a3, "userName"))
    sub_101939C04(a3);
  v5 = (NSMutableDictionary *)-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a3, "clientKey"));
  if (!objc_msgSend(a3, "isAuthLimited")
    || !-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", a3))
  {
    if (!v5)
      return +[CLKeyValueStore storeWithDictionary:](CLKeyValueStore, "storeWithDictionary:", qword_10230B918);
    if (objc_msgSend(a3, "isAuthSharingSubIdentity"))
    {
      v20 = -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("AnchorKeyPath"));
      v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v21 = (void *)qword_10230B910;
      v22 = objc_msgSend((id)qword_10230B910, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v24)
              objc_enumerationMutation(v21);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i)), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        }
        while (v23);
      }
    }
    return +[CLKeyValueStore storeWithDictionary:](CLKeyValueStore, "storeWithDictionary:", v5);
  }
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", objc_msgSend(a3, "nestedBundlePath"));
  v7 = objc_msgSend(a3, "limitingCKP");
  result = 0;
  if (v6 && v7)
  {
    v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v6, "clientKey")));
    if (objc_msgSend(v6, "isAuthSharingSubIdentity"))
    {
      v9 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v6, "clientKey")), "objectForKeyedSubscript:", CFSTR("AnchorKeyPath"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v10 = (void *)qword_10230B910;
      v11 = objc_msgSend((id)qword_10230B910, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v10);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j)), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j));
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v12);
      }
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = (void *)qword_10230B908;
    v16 = objc_msgSend((id)qword_10230B908, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v17; k = (char *)k + 1)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v7, "clientKey")), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)k)), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)k));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v17);
    }
    return +[CLKeyValueStore storeWithDictionary:](CLKeyValueStore, "storeWithDictionary:", v5);
  }
  return result;
}

- (void)iterateAllAnchorKeyPathsWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];

  v4 = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_autoreleasePoolPush();
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9);
        v13 = objc_opt_class(NSDictionary, v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0
          && !objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnchorKeyPath"))
          && !objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PrimaryKeyPath"))
          && !objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AuthLimitingKeyPath")))
        {
          (*((void (**)(id, CLClientKeyPath *, char *))a3 + 2))(a3, +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v9), &v19);
          if (v19)
          {
            objc_autoreleasePoolPop(v10);
            return;
          }
        }
        objc_autoreleasePoolPop(v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
}

- (id)arrayForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  v8 = objc_opt_class(NSArray, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    return v6;
  else
    return a5;
}

- (BOOL)dictionaryExistsAtKeyPath:(id)a3
{
  void *v6;
  SEL v7;
  id v8;
  id v9;

  if (!a3 || !_os_feature_enabled_impl("CoreLocation", "cl_pula") || objc_msgSend(a3, "userName"))
    return -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a3, "clientKey")) != 0;
  v6 = (void *)sub_1019397A8(a3);
  return +[CLAuthorizationDatabase keyPath:sharesAuthWithKeyPath:](v6, v7, v8, v9);
}

+ (BOOL)keyPath:(id)a3 sharesAuthWithKeyPath:(id)a4
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(a3, "isEqual:", a4) & 1) != 0)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  v7 = objc_msgSend(v5, "isAuthSharingSubIdentity");
  v6 = objc_msgSend(v4, "isAuthSharingSubIdentity");
  if (v7 && v6)
  {
    v5 = objc_msgSend(v5, "anchorKeyPath");
LABEL_10:
    v4 = objc_msgSend(v4, "anchorKeyPath");
    goto LABEL_11;
  }
  if (!v7)
  {
    if (!v6)
      return v6;
    goto LABEL_10;
  }
  v5 = objc_msgSend(v5, "anchorKeyPath");
LABEL_11:
  LOBYTE(v6) = objc_msgSend(v5, "isEqual:", v4);
  return v6;
}

- (id)_valueForKey:(id)a3 atKeyPath:(id)a4
{
  id v6;
  id v7;

  v6 = -[CLAuthorizationDatabase _ckpToAccessGivenKey:andInputKeyPath:](self, "_ckpToAccessGivenKey:andInputKeyPath:", a3, a4);
  if ((objc_msgSend(v6, "isValidCKP") & 1) != 0)
    v7 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v6, "clientKey"));
  else
    v7 = (id)qword_10230B918;
  return objc_msgSend(v7, "objectForKeyedSubscript:", a3);
}

- (id)_ckpToAccessGivenKey:(id)a3 andInputKeyPath:(id)a4
{
  id v4;
  id v7;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v4 = a4;
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a4, "clientKey"));
  if ((objc_msgSend(v4, "isValidCKP") & 1) == 0)
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  if (objc_msgSend(v4, "isAuthLimited"))
  {
    if (-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", v4))
    {
      if (objc_msgSend((id)qword_10230B908, "containsObject:", a3))
        return objc_msgSend(v4, "limitingCKP");
      else
        return -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", objc_msgSend(v4, "nestedBundlePath"));
    }
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  }
  if (v7)
  {
    if (objc_msgSend(v4, "isAuthSharingSubIdentity")
      && objc_msgSend((id)qword_10230B910, "containsObject:", a3))
    {
      return +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(v4, "clientKey")), "objectForKeyedSubscript:", CFSTR("AnchorKeyPath")));
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289538;
      v10[1] = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2114;
      v14 = a3;
      v15 = 2114;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning accessing unknown or null client in CLAuthorizationDatabase. No-op'ing\", \"key\":%{public, location:escape_only}@, \"keyPath\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x26u);
    }
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  }
  return v4;
}

- (BOOL)BOOLForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(BOOL)a5
{
  id v9;
  id v10;

  v9 = objc_alloc_init((Class)NSAutoreleasePool);
  v10 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0)
    a5 = objc_msgSend(v10, "BOOLValue");

  return a5;
}

- (int)intForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int)a5
{
  id v6;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "intValue") & 1) != 0)
    return objc_msgSend(v6, "intValue");
  else
    return a5;
}

- (void)setDouble:(double)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), a4, a5);
}

- (void)setArray:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", a3), a4, a5);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3), a4, a5);
}

- (void)iterateIdentitiesRelatedToKeyPath:(id)a3 withBlock:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t buf;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;

  if (objc_msgSend(a3, "isAuthLimited"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289282;
      v22 = 2082;
      v23 = "";
      v24 = 2114;
      v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning iterateIdentitiesRelatedToKeyPath passed auth limited keyPath\", \"keyPath\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    v8 = objc_msgSend(a3, "anchorKeyPath");
    if (-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v8))
    {
      (*((void (**)(id, id))a4 + 2))(a4, v8);
      v9 = -[CLAuthorizationDatabase arrayForKey:atKeyPath:defaultValue:](self, "arrayForKey:atKeyPath:defaultValue:", CFSTR("SubIdentities"), v8, 0);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            v15 = objc_autoreleasePoolPush();
            (*((void (**)(id, CLClientKeyPath *))a4 + 2))(a4, +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v14));
            objc_autoreleasePoolPop(v15);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }
    }
  }
}

- (id)dataForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  v8 = objc_opt_class(NSData, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    return v6;
  else
    return a5;
}

- (void)setInt:(int)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3), a4, a5);
}

- (id)dictionaryForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  v8 = objc_opt_class(NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    return v6;
  else
    return a5;
}

- (NSArray)_getDefaultDeniedSystemServices
{
  const __CFString *v1;

  v1 = CFSTR("/System/Library/LocationBundles/AppGenius.bundle");
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v1, 1);
}

+ (id)authorizationDatabaseWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithFilename:withDataProtectionClass:", a3, *(_QWORD *)&a4);
}

- (CLAuthorizationDatabase)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  uint64_t v4;
  CLAuthorizationDatabase *v7;
  float v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  if (qword_10230B900 != -1)
    dispatch_once(&qword_10230B900, &stru_102198258);
  v10.receiver = self;
  v10.super_class = (Class)CLAuthorizationDatabase;
  v7 = -[CLPersistentDictionary initWithFilename:withDataProtectionClass:](&v10, "initWithFilename:withDataProtectionClass:", a3, v4);
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](v7, "underlyingDictionary"), "objectForKeyedSubscript:", CFSTR("MigrationVersionNumber")))
  {
    -[CLAuthorizationDatabase _internalMigrationClearUnknownKeys](v7, "_internalMigrationClearUnknownKeys");
  }
  else
  {
    -[CLAuthorizationDatabase _internalMigrationLegacyKeys](v7, "_internalMigrationLegacyKeys");
    -[CLAuthorizationDatabase setInternalKeyMigrationComplete](v7, "setInternalKeyMigrationComplete");
    -[CLPersistentDictionary persist](v7, "persist");
  }
  -[CLAuthorizationDatabase migrationVersionNumber](v7, "migrationVersionNumber");
  if (v8 < 12.0)
    -[CLAuthorizationDatabase _internalMigrationRegisterAllClients](v7, "_internalMigrationRegisterAllClients");
  -[CLAuthorizationDatabase _cacheSystemServicesMap](v7, "_cacheSystemServicesMap");
  -[CLAuthorizationDatabase _cacheAlternativeIdentities](v7, "_cacheAlternativeIdentities");
  return v7;
}

- (float)migrationVersionNumber
{
  float result;

  objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", CFSTR("MigrationVersionNumber")), "floatValue");
  return result;
}

- (void)setInternalKeyMigrationComplete
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "setObject:forKeyedSubscript:", &off_10221C560, CFSTR("MigrationVersionNumber"));
}

- (void)setMigrationVersionNumber
{
  double v2;

  LODWORD(v2) = 1094713344;
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2), CFSTR("MigrationVersionNumber"));
}

- (void)completeMigration
{
  -[CLAuthorizationDatabase setMigrationVersionNumber](self, "setMigrationVersionNumber");
  -[CLPersistentDictionary persist](self, "persist");
}

- (void)clear
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  objc_super v6;
  _WORD v7[8];
  uint8_t buf[1640];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102198278);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#AuthorizationDatabaseDroppingData Clearing entire database", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#AuthorizationDatabaseDroppingData Clearing entire database", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLAuthorizationDatabase clear]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)CLAuthorizationDatabase;
  -[CLPersistentDictionary clear](&v6, "clear");
  -[CLAuthorizationDatabase setAlternateIdentitiesMap:](self, "setAlternateIdentitiesMap:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLAuthorizationDatabase setSystemServicesMap:](self, "setSystemServicesMap:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[CLAuthorizationDatabase setMigrationVersionNumber](self, "setMigrationVersionNumber");
  -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  -[CLPersistentDictionary persist](self, "persist");
}

- (BOOL)_isValidAuthLimitedKeyPath:(id)a3
{
  id v5;

  v5 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", objc_msgSend(a3, "nestedBundlePath"));
  if (v5)
    LOBYTE(v5) = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", objc_msgSend(a3, "limitingCKP"));
  return (char)v5;
}

- (id)primaryKeyPathForAuthLimitedKeyPath:(id)a3
{
  id result;

  if (!-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:"))
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  result = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", objc_msgSend(a3, "nestedBundlePath"));
  if (!result)
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  return result;
}

- (BOOL)setupDictionary:(id)a3 atKeyPath:(id)a4
{
  unsigned int v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  CLAuthorizationDatabase *v11;
  SEL v12;
  id v13;

  if (a4 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && !objc_msgSend(a4, "userName"))
  {
    v11 = (CLAuthorizationDatabase *)sub_10193991C(a4);
    LOBYTE(v7) = -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](v11, v12, v13);
  }
  else
  {
    v7 = objc_msgSend(a4, "isValidCKP");
    if (v7)
    {
      if ((objc_msgSend(a4, "isAuthLimited") & 1) != 0
        || -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a4, "clientKey")))
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3);
        if (objc_msgSend(a4, "subIdentityId"))
        {
          v9 = objc_msgSend(objc_msgSend(a4, "anchorKeyPath"), "clientKey");
          if (!-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9))-[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), v9);
          v10 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9), "objectForKeyedSubscript:", CFSTR("SubIdentities"));
          if (!v10)
          {
            objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9), "setObject:forKeyedSubscript:", +[NSMutableArray array](NSMutableArray, "array"), CFSTR("SubIdentities"));
            v10 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v9), "objectForKeyedSubscript:", CFSTR("SubIdentities"));
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(a4, "clientKey"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, CFSTR("AnchorKeyPath"));
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "setObject:forKeyedSubscript:", v8, objc_msgSend(a4, "clientKey"));
        -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
        LOBYTE(v7) = 1;
      }
    }
  }
  return v7;
}

- (BOOL)removeDictionaryAtKeyPath:(id)a3
{
  return -[CLAuthorizationDatabase _removeDictionaryAtKeyPath:shouldLog:](self, "_removeDictionaryAtKeyPath:shouldLog:", a3, 1);
}

- (BOOL)_removeDictionaryAtKeyPath:(id)a3 shouldLog:(BOOL)a4
{
  uint64_t *v4;
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  NSObject *v27;
  id v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];

  v5 = a4;
  if (a3 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && !objc_msgSend(a3, "userName"))
  {
    sub_101939A90(a3);
LABEL_44:
    dispatch_once(&qword_1022A01D0, &stru_102198278);
LABEL_7:
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      v44 = 2114;
      v45 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Attempting to remove System Service from #AuthDatabase! Refusing removal.\", \"System Service\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (v4[58] != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
    }
    v11 = qword_1022A01D8;
    LODWORD(v9) = os_signpost_enabled((os_log_t)qword_1022A01D8);
    if ((_DWORD)v9)
    {
      *(_DWORD *)buf = 68289282;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      v44 = 2114;
      v45 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Attempting to remove System Service from #AuthDatabase! Refusing removal.", "{\"msg%{public}.0s\":\"Attempting to remove System Service from #AuthDatabase! Refusing removal.\", \"System Service\":%{public, location:escape_only}@}", buf, 0x1Cu);
      LOBYTE(v9) = 0;
    }
    return (char)v9;
  }
  v8 = objc_msgSend(a3, "clientKey");
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8);
  if (!v9)
    return (char)v9;
  if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:](self, "BOOLForKey:atKeyPath:defaultValue:", CFSTR("isSystemService"), a3, 0))
  {
    v4 = &qword_1022A0000;
    if (qword_1022A01D0 == -1)
      goto LABEL_7;
    goto LABEL_44;
  }
  v12 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("SubIdentities"));
  v30 = v8;
  v13 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("AnchorKeyPath"));
  if (v12)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v17);
          if (v5)
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v19 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v20 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v18);
              *(_DWORD *)buf = 68289538;
              v41 = 0;
              v42 = 2082;
              v43 = "";
              v44 = 2114;
              v45 = v18;
              v46 = 2114;
              v47 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", v18);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v15);
    }
  }
  else
  {
    v21 = v13;
    if (v13
      && objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("SubIdentities")))
    {
      objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", CFSTR("SubIdentities")), "removeObject:", v8);
    }
  }
  v22 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v30), "objectForKeyedSubscript:", CFSTR("PluginBundleIds"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        -[NSMutableDictionary removeObjectForKey:](-[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }
  if (v5)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v27 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v28 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v30);
      *(_DWORD *)buf = 68289538;
      v41 = 0;
      v42 = 2082;
      v43 = "";
      v44 = 2114;
      v45 = v30;
      v46 = 2114;
      v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
    }
  }
  -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", v30);
  -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  LOBYTE(v9) = 1;
  return (char)v9;
}

- (unint64_t)clientCount
{
  return (unint64_t)-[NSMutableDictionary count](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "count")- 1;
}

- (BOOL)expensivelyGetIdentifyingInformation:(client_identifying_information *)a3 forClient:(id)a4
{
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id var0;
  id var1;
  id var2;
  id var3;
  id var4;
  _BOOL4 var5;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  void *v45;
  id v46[2];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  _BOOL4 v64;
  _BYTE v65[128];

  sub_100131938(v46, (uint64_t)"GetIdentifyingInformation", 0);
  if (objc_msgSend(a4, "executablePath"))
  {
    v6 = 0;
    goto LABEL_51;
  }
  v44 = 0;
  v45 = 0;
  if (objc_msgSend(a4, "bundleId"))
  {
    v7 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", objc_msgSend(a4, "bundleId"), &v45);
  }
  else
  {
    if (!objc_msgSend(a4, "bundlePath"))
    {
      v8 = 0;
      goto LABEL_16;
    }
    v7 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithURL:error:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(a4, "bundlePath"), 1), &v45);
  }
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(objc_msgSend(v7, "containingBundleRecord"), "bundleIdentifier");
    if (v9)
      a3->var0 = v9;
    v10 = objc_autoreleasePoolPush();
    v11 = objc_msgSend(v8, "containingBundleRecord");
    v13 = objc_opt_class(LSApplicationRecord, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      v14 = v11;
    else
      v14 = 0;
    objc_autoreleasePoolPop(v10);
    v15 = 1;
    if (v14)
      goto LABEL_19;
    goto LABEL_17;
  }
LABEL_16:
  v15 = 0;
LABEL_17:
  if (!objc_msgSend(a4, "bundleId"))
  {
    v21 = 0;
    v14 = 0;
    goto LABEL_35;
  }
  v14 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", objc_msgSend(a4, "bundleId"), 0, &v44);
  if (!v14)
  {
    v21 = 0;
    goto LABEL_35;
  }
LABEL_19:
  a3->var0 = objc_msgSend(v14, "bundleIdentifier");
  if (objc_msgSend(v14, "URL"))
    a3->var1 = objc_msgSend(objc_msgSend(v14, "URL"), "path");
  if (objc_msgSend(v14, "executableURL"))
    a3->var2 = objc_msgSend(objc_msgSend(v14, "executableURL"), "path");
  a3->var5 = objc_msgSend(v14, "appClipMetadata") != 0;
  v16 = objc_msgSend(v14, "applicationExtensionRecords");
  if (v16)
  {
    v17 = +[NSMutableArray array](NSMutableArray, "array");
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v65, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "effectiveBundleIdentifier"));
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v65, 16);
      }
      while (v18);
    }
    a3->var4 = v17;
  }
  v21 = 1;
LABEL_35:
  if (objc_msgSend(a4, "bundleId") && !a3->var0)
  {
    a3->var0 = objc_msgSend(a4, "bundleId");
  }
  else if (objc_msgSend(a4, "bundlePath") && !a3->var1)
  {
    a3->var1 = objc_msgSend(a4, "bundlePath");
  }
  v6 = v21 | v15;
  if ((v6 & 1) != 0)
  {
    v22 = a3->var0;
    v23 = a3->var1;
    v24 = a3->var2;
    v25 = a3->var4;
    v26 = a3->var3;

    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v27 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      var3 = a3->var3;
      var4 = a3->var4;
      var5 = a3->var5;
      *(_DWORD *)buf = 68290818;
      v49 = 2082;
      v48 = 0;
      v50 = "";
      v51 = 2114;
      v52 = a4;
      v53 = 2114;
      v54 = var0;
      v55 = 2114;
      v56 = var1;
      v57 = 2114;
      v58 = var2;
      v59 = 2114;
      v60 = var3;
      v61 = 2114;
      v62 = var4;
      v63 = 1026;
      v64 = var5;
      v34 = "{\"msg%{public}.0s\":\"#GetIdentifyingInfo found identifying information for client\", \"ClientKeyPath\":%{p"
            "ublic, location:escape_only}@, \"bundleId\":%{public, location:escape_only}@, \"bundlePath\":%{public, locat"
            "ion:escape_only}@, \"executablePath\":%{public, location:escape_only}@, \"platformSpecificBundleId\":%{publi"
            "c, location:escape_only}@, \"pluginBundleIds\":%{public, location:escape_only}@, \"isAppClip\":%{public}hhd}";
      v35 = v27;
      v36 = OS_LOG_TYPE_DEBUG;
      v37 = 84;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, v37);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v38 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68290050;
      v48 = 0;
      v49 = 2082;
      v50 = "";
      v51 = 2114;
      v52 = a4;
      v53 = 2114;
      v54 = v45;
      v55 = 2114;
      v56 = v44;
      v57 = 2114;
      v58 = 0;
      v34 = "{\"msg%{public}.0s\":\"#GetIdentifyingInfo LaunchServices does not have an application record for client\", "
            "\"ClientKeyPath\":%{public, location:escape_only}@, \"extensionRecordError\":%{public, location:escape_only}"
            "@, \"applicationRecordError\":%{public, location:escape_only}@, \"companionAppRecordError\":%{public, locati"
            "on:escape_only}@}";
      v35 = v38;
      v36 = OS_LOG_TYPE_INFO;
      v37 = 58;
      goto LABEL_50;
    }
  }
LABEL_51:
  sub_100131740(v46);
  return v6;
}

- (void)cacheInfoPlistKeysForClient:(id)a3
{
  __CFBundle *v5;
  __CFBundle *v6;
  id v7;
  _QWORD v8[3];

  v5 = (__CFBundle *)sub_101147FF4(-[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:](self, "stringForKey:atKeyPath:defaultValue:", CFSTR("PlatformSpecificBundleId"), a3, 0), -[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:](self, "stringForKey:atKeyPath:defaultValue:", CFSTR("BundleId"), a3, 0), (const __CFString *)-[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:](self, "stringForKey:atKeyPath:defaultValue:", CFSTR("BundlePath"), a3, 0), 0);
  if (v5)
  {
    v6 = v5;
    v8[0] = CFSTR("NSLocationDefaultAccuracyReduced");
    v8[1] = CFSTR("NSLocationRequireExplicitServiceSession");
    v8[2] = CFSTR("CLDisableAuthorizationRequests");
    v7 = sub_101147D00(v5, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
    if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSLocationDefaultAccuracyReduced")), "BOOLValue"))-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("DefaultAccuracyReduced"), a3);
    if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSLocationRequireExplicitServiceSession")), "BOOLValue"))-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("ExplicitServiceSession"), a3);
    if (objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CLDisableAuthorizationRequests")), "BOOLValue"))-[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("AuthRequestsDisabled"), a3);
    CFRelease(v6);
  }
}

- (id)registerClient:(id)a3 fromAuthSync:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v7;
  id v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  uint8_t *p_buf;
  NSObject *v17;
  uint32_t v18;
  id v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  uint64_t v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  CLClientKeyPath *v28;
  id v29;
  CLClientKeyPath *v30;
  unsigned __int8 v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  const char *v42;
  uint64_t *v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t v50[4];
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  CLClientKeyPath *v57;
  uint64_t buf;
  _BYTE buf_8[36];
  __int16 v60;
  unsigned int v61;

  v4 = a4;
  v5 = a3;
  if (!objc_msgSend(a3, "isValidCKP") || objc_msgSend(v5, "subIdentityId"))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v7 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning #RegisterClientKeyPath passed in un-registerable client. Returning #nullCKP.", (uint8_t *)&buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      *(_WORD *)v50 = 0;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#Warning #RegisterClientKeyPath passed in un-registerable client. Returning #nullCKP.", v50, 2);
      v43 = (uint64_t *)v42;
      sub_100512490("Generic", 1, 0, 2, "-[CLAuthorizationDatabase registerClient:fromAuthSync:]", "%s\n", v42);
      if (v43 != &buf)
        free(v43);
    }
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  }
  if (-[CLAuthorizationDatabase isKeyPathRegisteredSystemService:](self, "isKeyPathRegisteredSystemService:", v5))
    return v5;
  if (!objc_msgSend(v5, "isAuthLimited"))
  {
    v19 = objc_msgSend(v5, "bundlePath");
    v20 = objc_msgSend(v5, "executablePath");
    v21 = v20;
    buf = 0;
    memset(&buf_8[16], 0, 17);
    *(_QWORD *)buf_8 = v19;
    *(_QWORD *)&buf_8[8] = v20;
    if (v19)
    {
      v22 = -[CLAuthorizationDatabase _CLCommonIsBundleSystemService:](self, "_CLCommonIsBundleSystemService:", v19);
      if (!v21)
      {
        if ((v22 & 1) != 0)
        {
          v44 = 1;
          goto LABEL_42;
        }
        -[CLAuthorizationDatabase expensivelyGetIdentifyingInformation:forClient:](self, "expensivelyGetIdentifyingInformation:forClient:", &buf, v5);
        if (-[CLAuthorizationDatabase _isBundlePathReachable:](self, "_isBundlePathReachable:", v19))
        {
LABEL_41:
          v44 = 0;
LABEL_42:
          if (objc_msgSend(v5, "bundleId")
            && (v27 = objc_msgSend(v5, "bundleId"), (objc_msgSend(v27, "isEqual:", buf) & 1) == 0))
          {
            v29 = objc_msgSend(v5, "userName");
            v28 = +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", v29, buf, 105);
          }
          else
          {
            v28 = (CLClientKeyPath *)objc_msgSend(v5, "anchorKeyPath");
          }
          v30 = v28;
          v31 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v28);
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", &__NSDictionary0__struct, v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", buf, CFSTR("BundleId"), v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", *(_QWORD *)buf_8, CFSTR("BundlePath"), v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", *(_QWORD *)&buf_8[8], CFSTR("Executable"), v30);
          if (buf_8[32])
            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("IsAppClip"), v30);
          if (*(_QWORD *)&buf_8[24])
          {
            -[CLAuthorizationDatabase setArray:forKey:atKeyPath:](self, "setArray:forKey:atKeyPath:", *(_QWORD *)&buf_8[24], CFSTR("PluginBundleIds"), v30);
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v32 = *(void **)&buf_8[24];
            v33 = objc_msgSend(*(id *)&buf_8[24], "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v34; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v46 != v35)
                    objc_enumerationMutation(v32);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"), "setObject:forKeyedSubscript:", v30, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i));
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
              }
              while (v34);
            }
          }
          if ((v31 & 1) == 0)
            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("SuppressShowingInSettings"), v30);
          if (v44)
          {
            if (qword_1022A01C0 != -1)
              dispatch_once(&qword_1022A01C0, &stru_102198298);
            v37 = qword_1022A01C8;
            if (os_log_type_enabled((os_log_t)qword_1022A01C8, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v50 = 68289538;
              v51 = 0;
              v52 = 2082;
              v53 = "";
              v54 = 2114;
              v55 = v5;
              v56 = 2114;
              v57 = v30;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"System Service connected and registering; We failed to find it while enumerating "
                "bundles.\", \"inputCKP\":%{public, location:escape_only}@, \"registeredCKP\":%{public, location:escape_only}@}",
                v50,
                0x26u);
              if (qword_1022A01C0 != -1)
                dispatch_once(&qword_1022A01C0, &stru_102198298);
            }
            v38 = qword_1022A01C8;
            if (os_signpost_enabled((os_log_t)qword_1022A01C8))
            {
              *(_DWORD *)v50 = 68289538;
              v51 = 0;
              v52 = 2082;
              v53 = "";
              v54 = 2114;
              v55 = v5;
              v56 = 2114;
              v57 = v30;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "System Service connected and registering; We failed to find it while enumerating bundles.",
                "{\"msg%{public}.0s\":\"System Service connected and registering; We failed to find it while enumerating "
                "bundles.\", \"inputCKP\":%{public, location:escape_only}@, \"registeredCKP\":%{public, location:escape_only}@}",
                v50,
                0x26u);
            }
            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("isSystemService"), v30);
            -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "setObject:forKeyedSubscript:", v30, objc_msgSend(v5, "bundlePath"));
          }
          else
          {
            -[CLAuthorizationDatabase cacheInfoPlistKeysForClient:](self, "cacheInfoPlistKeysForClient:", v30);
          }
          -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("TimeMissing"), v30);
          if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:](self, "BOOLForKey:atKeyPath:defaultValue:", CFSTR("SyncedAuthForUninstalledApp"), v5, 0))
          {
            -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("SyncedAuthForUninstalledApp"), v30);
          }
          return v30;
        }
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102198278);
        v39 = qword_1022A01D8;
        if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
        *(_DWORD *)v50 = 68289282;
        v51 = 0;
        v52 = 2082;
        v53 = "";
        v54 = 2114;
        v55 = v19;
        v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Registering a bundle path which is not known by lau"
              "nch services and is not reachable!\", \"BundlePath\":%{public, location:escape_only}@}";
        p_buf = v50;
        v17 = v39;
        goto LABEL_75;
      }
    }
    else if (!v20)
    {
      if (-[CLAuthorizationDatabase expensivelyGetIdentifyingInformation:forClient:](self, "expensivelyGetIdentifyingInformation:forClient:", &buf, v5))
      {
        goto LABEL_41;
      }
      if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:](self, "BOOLForKey:atKeyPath:defaultValue:", CFSTR("SyncedAuthForUninstalledApp"), v5, 0))
      {
        return v5;
      }
      v24 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v5);
      if (v4)
      {
        if (v24)
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v25 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v50 = 68289282;
            v51 = 0;
            v52 = 2082;
            v53 = "";
            v54 = 2114;
            v55 = v5;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists\", \"ClientKeyPath\":%{public, location:escape_only}@}", v50, 0x1Cu);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
          }
          v26 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            *(_DWORD *)v50 = 68289282;
            v51 = 0;
            v52 = 2082;
            v53 = "";
            v54 = 2114;
            v55 = v5;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists", "{\"msg%{public}.0s\":\"#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists\", \"ClientKeyPath\":%{public, location:escape_only}@}", v50, 0x1Cu);
          }
          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("SyncedAuthForUninstalledApp"), v5);
        }
        else
        {
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", &__NSDictionary0__struct, v5);
          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("SyncedAuthForUninstalledApp"), v5);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", objc_msgSend(v5, "bundleId"), CFSTR("BundleId"), v5);
        }
        return v5;
      }
      if (v24)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102198278);
        v40 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v50 = 68289538;
          v51 = 0;
          v52 = 2082;
          v53 = "";
          v54 = 2114;
          v55 = v5;
          v56 = 2114;
          v57 = -[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v5);
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath The client already exists but is not known by the system; Setting as missing client\", \"ClientKeyPath\":%{public, location:escape_only}@, \"ExistingClientDict\"
            ":%{public, location:escape_only}@}",
            v50,
            0x26u);
        }
        -[CLAuthorizationDatabase setDouble:forKey:atKeyPath:](self, "setDouble:forKey:atKeyPath:", CFSTR("TimeMissing"), v5, CFAbsoluteTimeGetCurrent());
        return v5;
      }
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v41 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
      *(_DWORD *)v50 = 68289282;
      v51 = 0;
      v52 = 2082;
      v53 = "";
      v54 = 2114;
      v55 = v5;
      v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Attempting to register a client not known by the syst"
            "em. Deferring authorization & registration until they connect with an identity known by the system. Resolvin"
            "g to #nullCKP.\", \"ClientKeyPath\":%{public, location:escape_only}@}";
      p_buf = v50;
      v17 = v41;
LABEL_75:
      v18 = 28;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v15, p_buf, v18);
      return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v23 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    *(_DWORD *)v50 = 68289538;
    v51 = 0;
    v52 = 2082;
    v53 = "";
    v54 = 2114;
    v55 = v5;
    v56 = 2114;
    v57 = -[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v5);
    v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath Client is known by executable; they must be a daemon or"
          " system client that should be masquerading. Deferring authorization & registration until they connect with a v"
          "alid identity. Removing any existing client entry and returning #nullCKP.\", \"ClientKeyPath\":%{public, locat"
          "ion:escape_only}@, \"ExistingClientDict\":%{public, location:escape_only}@}";
    p_buf = v50;
    v17 = v23;
    v18 = 38;
    goto LABEL_27;
  }
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", objc_msgSend(v5, "nestedBundlePath"));
  v10 = objc_msgSend(v5, "limitingCKP");
  v11 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v9);
  v12 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v10);
  v13 = v12;
  if (!v11 || (v12 & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v14 = qword_1022A01D8;
    if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
    buf = 68290050;
    *(_WORD *)buf_8 = 2082;
    *(_QWORD *)&buf_8[2] = "";
    *(_WORD *)&buf_8[10] = 2114;
    *(_QWORD *)&buf_8[12] = v9;
    *(_WORD *)&buf_8[20] = 1026;
    *(_DWORD *)&buf_8[22] = v11;
    *(_WORD *)&buf_8[26] = 2114;
    *(_QWORD *)&buf_8[28] = v10;
    v60 = 1026;
    v61 = v13;
    v15 = "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath passed auth-limited keyPath with unregistered primary o"
          "r limiting keyPaths Returning #nullCKP.\", \"Primary\":%{public, location:escape_only}@, \"PrimaryRegistered\"
          ":%{public}hhd, \"Limiting\":%{public, location:escape_only}@, \"LimitingRegistered\":%{public}hhd}";
    p_buf = (uint8_t *)&buf;
    v17 = v14;
    v18 = 50;
    goto LABEL_27;
  }
  return v5;
}

- (id)registerSubIdentity:(id)a3 withType:(char)a4 forAnchorKeyPath:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;

  v6 = a4;
  if (objc_msgSend(a5, "subIdentityId")
    || !-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", a5))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 68289282;
      v12[1] = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2114;
      v16 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #RegisterSubIdentity The passed anchor has a subIdentity or the anchor is not registered\", \"Anchor\":%{public, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
    }
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  }
  else
  {
    v9 = objc_msgSend(a5, "clientKeyPathWithReplacementSubIdentityId:subIdentityType:", a3, v6);
    -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", &__NSDictionary0__struct, v9);
  }
  return v9;
}

- (id)registeredKeyPathForClientIdentifier:(id)a3
{
  id v3;
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  id v10;
  NSMutableDictionary *v11;
  id v12;
  uint64_t v13;
  _BYTE v14[24];

  v3 = a3;
  if ((objc_msgSend(a3, "isValidCKP") & 1) == 0)
    return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath");
  v5 = objc_msgSend(v3, "clientAnchor");
  v6 = objc_msgSend(v3, "subIdentityId");
  if (-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v3))
    return v3;
  if (objc_msgSend(v3, "isAuthLimited"))
  {
    if (!-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", v3))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v7 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath", v13, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
      v13 = 68289282;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(_QWORD *)&v14[12] = v3;
      v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed value is an invalid auth-limited identity. Resol"
           "ving to #nullCKP\", \"InputCKP\":%{public, location:escape_only}@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x1Cu);
      return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath", v13, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
    }
    return v3;
  }
  if (!-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v6)&& !-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v5))
  {
    if (v6)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v7 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath", v13, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
      v13 = 68289282;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(_QWORD *)&v14[12] = v3;
      v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed keyPath is an unregistered subIdentity. Resolvin"
           "g to #nullCKP\", \"InputCKP\":%{public, location:escape_only}@}";
      goto LABEL_9;
    }
    if (!-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"), "objectForKeyedSubscript:", v5))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v7 = qword_1022A01D8;
      if (!os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        return +[CLClientKeyPath nullClientKeyPath](CLClientKeyPath, "nullClientKeyPath", v13, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
      v13 = 68289282;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(_QWORD *)&v14[12] = v3;
      v8 = "{\"msg%{public}.0s\":\"#Warning #ClientResolution the passed keyPath is not registered. Resolving to #nullCKP"
           "\", \"InputCKP\":%{public, location:escape_only}@}";
      goto LABEL_9;
    }
    v11 = -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap");
    goto LABEL_24;
  }
  v10 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v6);
  v11 = -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap");
  if (!v10)
  {
LABEL_24:
    v12 = v5;
    return -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  }
  v12 = v6;
  return -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
}

- (BOOL)migrateDictionaryAtKeyPath:(id)a3 toKeyPath:(id)a4 forceMigrationOnAuthCollision:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  _BOOL4 v21;
  int v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;

  v5 = a5;
  v9 = objc_msgSend(a3, "isValidCKP");
  if (!v9)
    return v9;
  v9 = objc_msgSend(a4, "isValidCKP");
  if (!v9)
    return v9;
  if (objc_msgSend(a3, "subIdentityId") || objc_msgSend(a4, "subIdentityId"))
    goto LABEL_5;
  v10 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a3, "clientKey"));
  if (v10)
  {
    v11 = v10;
    v12 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(a4, "clientKey"));
    if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Authorization")))
    {
LABEL_15:
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("BundleId"));
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("BundlePath"));
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("Executable"));
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("PlatformSpecificBundleId"));
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("PluginBundleIds"));
      sub_100FDE80C(v11, v12, (uint64_t)CFSTR("IsAppClip"));
      -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", a4);
      -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", v11, a4);
LABEL_17:
      -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", a3);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v14 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 68289538;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        v27 = 2114;
        v28 = a3;
        v29 = 2114;
        v30 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Client migration successful\", \"fromClient\":%{public, location:escape_only}@, \"toClient\":%{public, location:escape_only}@}", (uint8_t *)&v23, 0x26u);
      }
      LOBYTE(v9) = 1;
      return v9;
    }
    if (v5)
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_102198278);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 68290050;
        v25 = 2082;
        v24 = 0;
        v26 = "";
        v27 = 2114;
        v28 = a4;
        v29 = 2114;
        v30 = a3;
        v31 = 1026;
        v32 = objc_msgSend(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Authorization")), "intValue");
        v33 = 1026;
        v34 = objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Authorization")), "intValue");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Migrating to client that already has auth. Mitigation requested - will keep the authorization of the 'to' client\", \"toClient\":%{public, location:escape_only}@, \"fromClient\":%{public, location:escape_only}@, \"RemovedAuth\":%{public}d, \"KeptAuth\":%{public}d}", (uint8_t *)&v23, 0x32u);
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Authorization")), CFSTR("Authorization"));
      goto LABEL_15;
    }
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v15 = qword_1022A01D8;
    v16 = os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v9) = 0;
    if (v16)
    {
      v23 = 68289794;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2114;
      v28 = a3;
      v29 = 2114;
      v30 = a4;
      v31 = 1026;
      v32 = objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Authorization")), "intValue");
      v17 = "{\"msg%{public}.0s\":\"#warning Migrating to client that already has auth. Not migrating.\", \"fromClient\":"
            "%{public, location:escape_only}@, \"toClient\":%{public, location:escape_only}@, \"Auth\":%{public}d}";
      v18 = v15;
      v19 = 44;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
LABEL_5:
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    if (v5)
      goto LABEL_17;
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v20 = qword_1022A01D8;
    v21 = os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v9) = 0;
    if (v21)
    {
      v23 = 68289538;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2114;
      v28 = a3;
      v29 = 2114;
      v30 = a4;
      v17 = "{\"msg%{public}.0s\":\"fromClient not found, skipping migration\", \"fromClient\":%{public, location:escape_"
            "only}@, \"toClient\":%{public, location:escape_only}@}";
      v18 = v20;
      v19 = 38;
      goto LABEL_30;
    }
  }
  return v9;
}

- (signed)shortForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(signed __int16)a5
{
  id v6;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "shortValue") & 1) != 0)
    return (unsigned __int16)objc_msgSend(v6, "shortValue");
  else
    return a5;
}

- (int64_t)longForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int64_t)a5
{
  id v6;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "longValue") & 1) != 0)
    return (int64_t)objc_msgSend(v6, "longValue");
  else
    return a5;
}

- (float)floatForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(float)a5
{
  id v6;
  float result;

  v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "floatValue") & 1) == 0)
    return a5;
  objc_msgSend(v6, "floatValue");
  return result;
}

- (void)setShort:(signed __int16)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", a3), a4, a5);
}

- (void)setLong:(int64_t)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a3), a4, a5);
}

- (void)setFloat:(float)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), a4, a5);
}

- (void)setString:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", a3, a4, a5);
}

- (void)setDictionary:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", a3), a4, a5);
}

- (void)setData:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  -[CLAuthorizationDatabase _setValue:forKey:atKeyPath:](self, "_setValue:forKey:atKeyPath:", +[NSData dataWithData:](NSData, "dataWithData:", a3), a4, a5);
}

- (id)getUsersODUUIDs
{
  return 0;
}

- (id)allUsers
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  CLClientKeyPath *v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  _BYTE v27[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 68289026;
    v18 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9);
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v18), "objectForKeyedSubscript:", v10);
        v13 = objc_opt_class(NSDictionary, v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        {
          v14 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v10);
          if (-[CLClientKeyPath userName](v14, "userName"))
          {
            if ((objc_msgSend(v3, "containsObject:", -[CLClientKeyPath userName](v14, "userName")) & 1) == 0)
              objc_msgSend(v3, "addObject:", -[CLClientKeyPath userName](v14, "userName"));
          }
          else
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v15 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              v24 = 0;
              v25 = 2082;
              v26 = "";
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#AuthorizationDatabase got a nil username while iterating through authorization database, skipping\"}", buf, 0x12u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v16 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              *(_DWORD *)buf = v18;
              v24 = 0;
              v25 = 2082;
              v26 = "";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase got a nil username while iterating through authorization database, skipping", "{\"msg%{public}.0s\":\"#AuthorizationDatabase got a nil username while iterating through authorization database, skipping\"}", buf, 0x12u);
            }
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }
  return v3;
}

- (void)removeUser:(id)a3
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];

  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    v5 = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v19;
      *(_QWORD *)&v7 = 68289538;
      v17 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
          v12 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v17), "objectForKeyedSubscript:", v11);
          v14 = objc_opt_class(NSDictionary, v13);
          if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0
            && -[NSString isEqualToString:](-[CLClientKeyPath userName](+[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v11), "userName"), "isEqualToString:", a3))
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v15 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v16 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v11);
              *(_DWORD *)buf = v17;
              v23 = 0;
              v24 = 2082;
              v25 = "";
              v26 = 2114;
              v27 = v11;
              v28 = 2114;
              v29 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", v11);
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v8);
    }
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }
}

- (BOOL)isBundlePathRegisteredSystemService:(id)a3
{
  return a3
      && -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", a3) != 0;
}

- (BOOL)isKeyPathRegisteredSystemService:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  BOOL v12;

  v5 = objc_alloc_init((Class)NSAutoreleasePool);
  if ((objc_msgSend(a3, "isValidCKP") & 1) != 0 && (v6 = objc_msgSend(a3, "bundlePath")) != 0)
  {
    v7 = objc_msgSend(a3, "subIdentityId");
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v6);
    v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v7);
    if (v7)
      v10 = v9 == 0;
    else
      v10 = 0;
    v12 = !v10 && v8 != 0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)performFullSystemServiceSetup
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102198278);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#SetupSystemService #AuthorizationDatabase performing full setup of system services", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#SetupSystemService #AuthorizationDatabase performing full setup of system services", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLAuthorizationDatabase performFullSystemServiceSetup]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLAuthorizationDatabase _deriveAndCacheSystemServicesMap](self, "_deriveAndCacheSystemServicesMap");
  -[CLAuthorizationDatabase _setupSystemServiceDictionaries](self, "_setupSystemServiceDictionaries");
  -[CLAuthorizationDatabase _setUpDefaultDeniedSystemServices](self, "_setUpDefaultDeniedSystemServices");
}

- (void)_deriveAndCacheSystemServicesMap
{
  -[CLAuthorizationDatabase setSystemServicesMap:](self, "setSystemServicesMap:", sub_100B0CD90());
}

- (void)_setUpDefaultDeniedSystemServices
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[CLAuthorizationDatabase _getDefaultDeniedSystemServices](self, "_getDefaultDeniedSystemServices");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v5 = 68289282;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap", v14), "objectForKeyedSubscript:", v9);
        if (v10)
        {
          v11 = v10;
          if (!-[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", CFSTR("Authorization"), v10))-[CLAuthorizationDatabase setInt:forKey:atKeyPath:](self, "setInt:forKey:atKeyPath:", 1, CFSTR("Authorization"), v11);
        }
        else
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v12 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = 0;
            v21 = 2082;
            v22 = "";
            v23 = 2114;
            v24 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
          }
          v13 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            *(_DWORD *)buf = v14;
            v20 = 0;
            v21 = 2082;
            v22 = "";
            v23 = 2114;
            v24 = v9;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap", "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v6);
  }
}

- (void)_setupSystemServiceDictionaries
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  CLClientKeyPath *v6;
  NSString *v7;
  NSString *v8;
  float v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  CLClientKeyPath *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  id v29;
  CLClientKeyPath *v30;
  void *j;
  uint64_t v32;
  id v33;
  CLClientKeyPath *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  CLClientKeyPath *v41;
  id v42;
  void *k;
  uint64_t v44;
  id v45;
  CLClientKeyPath *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  CLClientKeyPath *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *m;
  uint64_t v58;
  id v59;
  CLClientKeyPath *v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  BOOL v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  unsigned int v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  CLClientKeyPath *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  CLClientKeyPath *v80;
  __int128 v81;
  id v82;
  NSMutableDictionary *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  NSMutableDictionary *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id obj;
  id obja;
  id objb;
  BOOL objc;
  id v96;
  CLClientKeyPath *v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint8_t v130[128];
  uint8_t buf[4];
  int v132;
  __int16 v133;
  const char *v134;
  __int16 v135;
  CLClientKeyPath *v136;
  __int16 v137;
  id v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];

  obj = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v96 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
  if (v2)
  {
    v89 = *(_QWORD *)v124;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v124 != v89)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v3);
        v5 = objc_alloc_init((Class)NSAutoreleasePool);
        v6 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v4);
        v7 = -[CLClientKeyPath bundlePath](v6, "bundlePath");
        if (v7)
        {
          v8 = -[CLClientKeyPath nestedBundlePath](v6, "nestedBundlePath");
          if (!v8)
          {
            -[CLAuthorizationDatabase migrationVersionNumber](self, "migrationVersionNumber");
            if (v9 >= (float)10)
            {
              v8 = v7;
            }
            else
            {
              v8 = v7;
              if (objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v6, "clientKey")), "objectForKeyedSubscript:", CFSTR("SubIdentities")))
              {
                goto LABEL_27;
              }
            }
          }
          if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v8))
          {
            goto LABEL_22;
          }
          if (-[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", CFSTR("isSystemService"), v6))
          {
            if (-[CLAuthorizationDatabase _CLCommonIsBundleSystemService:](self, "_CLCommonIsBundleSystemService:", v8))
            {
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
              v16 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 68289282;
                v132 = 0;
                v133 = 2082;
                v134 = "";
                v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap\", \"SystemService\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102198278);
              }
              v17 = qword_1022A01D8;
              if (os_signpost_enabled((os_log_t)qword_1022A01D8))
              {
                *(_DWORD *)buf = 68289282;
                v132 = 0;
                v133 = 2082;
                v134 = "";
                v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap", "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap\", \"SystemService\":%{public, location:escape_only}@}", buf, 0x1Cu);
              }
LABEL_22:
              v12 = -[CLClientKeyPath subIdentityId](v6, "subIdentityId");
              v13 = v6;
              if (v12)
                v13 = -[CLClientKeyPath anchorKeyPath](v6, "anchorKeyPath");
              v14 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", CFSTR("Authorization"), v13);
              v15 = objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v6, "clientKey")), "mutableCopy");
              objc_msgSend(v15, "removeObjectForKey:", CFSTR("SubIdentities"));
              objc_msgSend(v15, "removeObjectForKey:", CFSTR("AnchorKeyPath"));
              if (v14)
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("Authorization"));
              objc_msgSend(v96, "setObject:forKeyedSubscript:", v15, v8);
              goto LABEL_27;
            }
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v21 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #SystemServiceSetup #AuthorizationDatabase has record of bundlePath which was previously known as a system service but currently is not considered a system service. Removing System Service privileges.\", \"BundlePath\":%{public, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("isSystemService"), v6);
            -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("AnchorKeyPath"), v6);
            -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("SubIdentities"), v6);
            v22 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v6, "clientKey"));
            -[CLAuthorizationDatabase _removeDictionaryAtKeyPath:shouldLog:](self, "_removeDictionaryAtKeyPath:shouldLog:", v6, 0);
            if (-[CLAuthorizationDatabase _isBundlePathReachable:](self, "_isBundlePathReachable:", v8))
            {
              -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", v22, +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", -[CLClientKeyPath userName](v6, "userName"), v8, 112));
              goto LABEL_27;
            }
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v23 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              v19 = v23;
              v20 = "{\"msg%{public}.0s\":\"#Warning #SystemServiceSetup #AuthorizationDatabaseDroppingData bundlePath pr"
                    "eviously known as system service is not reachable on disk. Removing record.\", \"BundlePath\":%{publ"
                    "ic, location:escape_only}@}";
              goto LABEL_52;
            }
          }
          else
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v18 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289282;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = (CLClientKeyPath *)v8;
              v19 = v18;
              v20 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase bundlePath client was not and curr"
                    "ently is not a system service. Skipping.\", \"BundlePath\":%{public, location:escape_only}@}";
LABEL_52:
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x1Cu);
            }
          }
        }
        else if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:](self, "BOOLForKey:atKeyPath:defaultValue:", CFSTR("isSystemService"), v6, 0))
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v10 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289282;
            v132 = 0;
            v133 = 2082;
            v134 = "";
            v135 = 2114;
            v136 = v6;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
          }
          v11 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            *(_DWORD *)buf = 68289282;
            v132 = 0;
            v133 = 2082;
            v134 = "";
            v135 = 2114;
            v136 = v6;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag", "{\"msg%{public}.0s\":\"#AuthorizationDatabase #SystemServiceSetup Clients known by anything other than bundle path CANNOT be System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("isSystemService"), v6);
        }
LABEL_27:

        v3 = (char *)v3 + 1;
      }
      while (v2 != v3);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
      v2 = v24;
    }
    while (v24);
  }
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v120 != v26)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
        v29 = objc_alloc_init((Class)NSAutoreleasePool);
        v30 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v28);
        if (objc_msgSend(v96, "objectForKeyedSubscript:", -[CLClientKeyPath bundlePath](v30, "bundlePath")))
        {
          -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("isSystemService"), v30);
          -[CLAuthorizationDatabase _removeDictionaryAtKeyPath:shouldLog:](self, "_removeDictionaryAtKeyPath:shouldLog:", v30, 0);
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
    }
    while (v25);
  }
  v82 = +[NSMutableSet set](NSMutableSet, "set");
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v87 = -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap");
  obja = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
  if (obja)
  {
    v90 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != obja; j = (char *)j + 1)
      {
        if (*(_QWORD *)v116 != v90)
          objc_enumerationMutation(v87);
        v32 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)j);
        v33 = objc_alloc_init((Class)NSAutoreleasePool);
        v34 = (CLClientKeyPath *)-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v32);
        if (!-[CLClientKeyPath subIdentityId](v34, "subIdentityId"))
        {
          v35 = objc_msgSend(v96, "objectForKeyedSubscript:", v32);
          if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v34, "clientKey")))
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v36 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
            {
              v37 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v34, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v34;
              v137 = 2114;
              v138 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \"
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v38 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              v39 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v34, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v34;
              v137 = 2114;
              v138 = v39;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase setting up system services; the destination key path exists, "
                "but didn't we just remove it??",
                "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \"
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v40 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v41 = -[CLClientKeyPath clientKey](v34, "clientKey");
              v42 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v34, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v41;
              v137 = 2114;
              v138 = v42;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", -[CLClientKeyPath clientKey](v34, "clientKey"));
          }
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", v35, v34);
          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("isSystemService"), v34);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", v32, CFSTR("BundlePath"), v34);
          objc_msgSend(v96, "removeObjectForKey:", v32);
          objc_msgSend(v82, "addObject:", v34);
        }

      }
      obja = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
    }
    while (obja);
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v83 = -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap");
  objb = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
  if (objb)
  {
    v91 = *(_QWORD *)v112;
    do
    {
      for (k = 0; k != objb; k = (char *)k + 1)
      {
        if (*(_QWORD *)v112 != v91)
          objc_enumerationMutation(v83);
        v44 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)k);
        v45 = objc_alloc_init((Class)NSAutoreleasePool);
        v46 = (CLClientKeyPath *)-[NSMutableDictionary objectForKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "objectForKeyedSubscript:", v44);
        v47 = objc_msgSend(v96, "objectForKeyedSubscript:", v44);
        if (-[CLClientKeyPath subIdentityId](v46, "subIdentityId"))
        {
          if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v46, "clientKey")))
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v48 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
            {
              v49 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v46, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v46;
              v137 = 2114;
              v138 = v49;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \"
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v50 = qword_1022A01D8;
            if (os_signpost_enabled((os_log_t)qword_1022A01D8))
            {
              v51 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v46, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v46;
              v137 = 2114;
              v138 = v51;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SystemServiceSetup #AuthorizationDatabase setting up system services; the destination key path exists, "
                "but didn't we just remove it??",
                "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase setting up system services; the destin"
                "ation key path exists, but didn't we just remove it??\", \"Client\":%{public, location:escape_only}@, \"
                "Dictionary\":%{public, location:escape_only}@}",
                buf,
                0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v52 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v53 = -[CLClientKeyPath clientKey](v46, "clientKey");
              v54 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v46, "clientKey"));
              *(_DWORD *)buf = 68289538;
              v132 = 0;
              v133 = 2082;
              v134 = "";
              v135 = 2114;
              v136 = v53;
              v137 = 2114;
              v138 = v54;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", -[CLClientKeyPath clientKey](v46, "clientKey"));
          }
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", v47, v46);
          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("isSystemService"), v46);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", v44, CFSTR("BundlePath"), v46);
          objc_msgSend(v96, "removeObjectForKey:", v44);
        }

      }
      objb = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
    }
    while (objb);
  }
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v55 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v55; m = (char *)m + 1)
      {
        if (*(_QWORD *)v108 != v56)
          objc_enumerationMutation(v96);
        v58 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)m);
        v59 = objc_alloc_init((Class)NSAutoreleasePool);
        v60 = +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithUserName:clientAnchor:anchorType:", 0, v58, 112);
        -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", objc_msgSend(v96, "objectForKeyedSubscript:", v58), v60);
        -[CLAuthorizationDatabase setBool:forKey:atKeyPath:](self, "setBool:forKey:atKeyPath:", 1, CFSTR("isSystemService"), v60);
        -[CLAuthorizationDatabase setString:forKey:atKeyPath:](self, "setString:forKey:atKeyPath:", v58, CFSTR("BundlePath"), v60);

      }
      v55 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
    }
    while (v55);
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v85 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
  if (v85)
  {
    v84 = *(_QWORD *)v104;
    *(_QWORD *)&v61 = 68289282;
    v81 = v61;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v104 != v84)
        {
          v63 = v62;
          objc_enumerationMutation(v82);
          v62 = v63;
        }
        v86 = v62;
        v97 = *(CLClientKeyPath **)(*((_QWORD *)&v103 + 1) + 8 * v62);
        v88 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v81), "objectForKeyedSubscript:", -[CLClientKeyPath clientKey](v97, "clientKey"));
        v64 = objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("Authorization"));
        if (v64)
          LODWORD(v64) = objc_msgSend(objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("Authorization")), "intValue");
        v65 = (_DWORD)v64 == 1;
        objc = (_DWORD)v64 == 4;
        v66 = objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("SubIdentities"));
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
        if (v67)
        {
          v68 = *(_QWORD *)v100;
          do
          {
            v69 = 0;
            do
            {
              if (*(_QWORD *)v100 != v68)
                objc_enumerationMutation(v66);
              v70 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v69);
              v71 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v70);
              if (objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Authorization")))
              {
                v72 = objc_msgSend(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("Authorization")), "intValue");
                if (v72 == 4)
                {
                  if (qword_1022A01D0 != -1)
                    dispatch_once(&qword_1022A01D0, &stru_102198278);
                  v74 = qword_1022A01D8;
                  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 68289538;
                    v132 = 0;
                    v133 = 2082;
                    v134 = "";
                    v135 = 2114;
                    v136 = v97;
                    v137 = 2114;
                    v138 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase System service group contains Allowed entity\", \"Group\":%{public, location:escape_only}@, \"AllowedMember\":%{public, location:escape_only}@}", buf, 0x26u);
                  }
                  objc = 1;
                }
                else if (v72 == 1)
                {
                  if (qword_1022A01D0 != -1)
                    dispatch_once(&qword_1022A01D0, &stru_102198278);
                  v73 = qword_1022A01D8;
                  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 68289538;
                    v132 = 0;
                    v133 = 2082;
                    v134 = "";
                    v135 = 2114;
                    v136 = v97;
                    v137 = 2114;
                    v138 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase System service group contains Denied entity\", \"Group\":%{public, location:escape_only}@, \"DeniedMember\":%{public, location:escape_only}@}", buf, 0x26u);
                  }
                  v65 = 1;
                }
              }
              objc_msgSend(v71, "removeObjectForKey:", CFSTR("SupportedAuthorizationMask"));
              objc_msgSend(v71, "removeObjectForKey:", CFSTR("Authorization"));
              v69 = (char *)v69 + 1;
            }
            while (v67 != v69);
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
          }
          while (v67);
        }
        if (v65)
        {
          objc_msgSend(v88, "setObject:forKeyedSubscript:", &off_10221C518, CFSTR("Authorization"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v75 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v76 = -[CLClientKeyPath bundlePath](v97, "bundlePath");
            *(_DWORD *)buf = v81;
            v132 = 0;
            v133 = 2082;
            v134 = "";
            v135 = 2114;
            v136 = v76;
            v77 = v75;
            v78 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase Setting system service group to Deni"
                  "ed because at least one entity was denied\", \"Group\":%{public, location:escape_only}@}";
LABEL_149:
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, v78, buf, 0x1Cu);
          }
        }
        else if (objc)
        {
          objc_msgSend(v88, "setObject:forKeyedSubscript:", &off_10221C578, CFSTR("Authorization"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v79 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            v80 = -[CLClientKeyPath bundlePath](v97, "bundlePath");
            *(_DWORD *)buf = v81;
            v132 = 0;
            v133 = 2082;
            v134 = "";
            v135 = 2114;
            v136 = v80;
            v77 = v79;
            v78 = "{\"msg%{public}.0s\":\"#SystemServiceSetup #AuthorizationDatabase Setting system service group to Allo"
                  "wed because at least one entity was allowed, and none were denied\", \"Group\":%{public, location:escape_only}@}";
            goto LABEL_149;
          }
        }
        objc_msgSend(v88, "removeObjectForKey:", CFSTR("SupportedAuthorizationMask"));
        v62 = v86 + 1;
      }
      while ((id)(v86 + 1) != v85);
      v85 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
    }
    while (v85);
  }
}

- (BOOL)_CLCommonIsBundleSystemService:(id)a3
{
  return sub_100197BA8((__CFString *)a3);
}

- (BOOL)_isBundlePathReachable:(id)a3
{
  return -[NSURL checkResourceIsReachableAndReturnError:](+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", a3, 1), "checkResourceIsReachableAndReturnError:", 0);
}

- (void)_cacheSystemServicesMap
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  CLClientKeyPath *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CLClientKeyPath *v27;
  _BYTE v28[128];

  -[CLAuthorizationDatabase setSystemServicesMap:](self, "setSystemServicesMap:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 68289282;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v17), "objectForKeyedSubscript:", v9);
        v12 = objc_opt_class(NSDictionary, v11);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
        {
          v13 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v9);
          if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:](self, "BOOLForKey:atKeyPath:defaultValue:", CFSTR("isSystemService"), v13, 0))
          {
            v14 = -[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:](self, "stringForKey:atKeyPath:defaultValue:", CFSTR("BundlePath"), v13, 0);
            if (v14)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"), "setObject:forKeyedSubscript:", v13, v14);
            }
            else
            {
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
              v15 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v17;
                v23 = 0;
                v24 = 2082;
                v25 = "";
                v26 = 2114;
                v27 = v13;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (qword_1022A01D0 != -1)
                  dispatch_once(&qword_1022A01D0, &stru_102198278);
              }
              v16 = qword_1022A01D8;
              if (os_signpost_enabled((os_log_t)qword_1022A01D8))
              {
                *(_DWORD *)buf = v17;
                v23 = 0;
                v24 = 2082;
                v25 = "";
                v26 = 2114;
                v27 = v13;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag", "{\"msg%{public}.0s\":\"#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag\", \"Client\":%{public, location:escape_only}@}", buf, 0x1Cu);
              }
              -[CLAuthorizationDatabase removeValueForKey:atKeyPath:](self, "removeValueForKey:atKeyPath:", CFSTR("isSystemService"), v13);
            }
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }
}

- (void)_cacheAlternativeIdentities
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CLClientKeyPath *v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  -[CLAuthorizationDatabase setAlternateIdentitiesMap:](self, "setAlternateIdentitiesMap:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v18 = CFSTR("PluginBundleIds");
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v6);
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v18), "objectForKeyedSubscript:", v7);
        v10 = objc_opt_class(NSDictionary, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {
          v11 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v7);
          v12 = -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap");
          v13 = -[CLAuthorizationDatabase arrayForKey:atKeyPath:defaultValue:](self, "arrayForKey:atKeyPath:defaultValue:", v18, v11, &__NSArray0__struct);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v21;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v13);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17));
                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v15);
          }
        }
        v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v4);
  }
}

- (void)_internalMigrationLegacyKeys
{
  NSObject *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t *v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  CLClientKeyPath *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  NSObject *v22;
  CLClientKeyPath *v23;
  NSObject *v24;
  CLClientKeyPath *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  CLClientKeyPath *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  uint8_t *v36;
  id obj;
  __int16 v38[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[8];
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  CLClientKeyPath *v49;
  _BYTE v50[128];

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102198278);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v44 = 2082;
    v45 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Starting #AuthDatabaseMigration_0\"}", buf, 0x12u);
  }
  v4 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
  obj = -[NSMutableDictionary allKeys](v4, "allKeys");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(NSString, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v15 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289282;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Top-level clients.plist key is not NSString. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
          }
          v16 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            *(_DWORD *)buf = 68289282;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Top-level clients.plist key is not NSString. Removing key", "{\"msg%{public}.0s\":\"Top-level clients.plist key is not NSString. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          goto LABEL_30;
        }
        if (sub_10051700C(v9) || (objc_msgSend(v9, "isEqualToString:", CFSTR("root")) & 1) != 0)
        {
LABEL_18:
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v14 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68289282;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Top-level clients.plist key is userified. Removing key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
LABEL_30:
          -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v9);
          goto LABEL_31;
        }
        sub_1001A83C0(buf);
        if (SBYTE3(v47) >= 0)
          v11 = buf;
        else
          v11 = *(uint8_t **)buf;
        v12 = objc_msgSend(v9, "containsString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
        v13 = v12;
        if (SBYTE3(v47) < 0)
        {
          operator delete(*(void **)buf);
          if (v13)
            goto LABEL_18;
        }
        else if (v12)
        {
          goto LABEL_18;
        }
        v17 = (CLClientKeyPath *)-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9);
        v19 = objc_opt_class(NSDictionary, v18);
        if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
        {
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v22 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
          {
            v23 = (CLClientKeyPath *)-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9);
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            v48 = 2114;
            v49 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
          }
          v24 = qword_1022A01D8;
          if (os_signpost_enabled((os_log_t)qword_1022A01D8))
          {
            v25 = (CLClientKeyPath *)-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v9);
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            v48 = 2114;
            v49 = v25;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.", "{\"msg%{public}.0s\":\"#AuthDatabaseMigration Top-level clients.plist value is not NSDictionary. Removing entry.\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          goto LABEL_30;
        }
        v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-");
        v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.executable-");
        if ((objc_msgSend(v9, "isEqualToString:", v20) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", v21))
        {
          goto LABEL_30;
        }
        if (objc_msgSend(v9, "hasPrefix:", v20))
        {
          v26 = objc_msgSend(v9, "substringFromIndex:", -[NSString length](v20, "length"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v27 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            v48 = 2114;
            v49 = v17;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration found bundle path key. Removing prefix\", \"oldKey\":%{public, location:escape_only}@, \"anchorDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          v28 = 112;
        }
        else if (objc_msgSend(v9, "hasPrefix:", v21))
        {
          v26 = objc_msgSend(v9, "substringFromIndex:", -[NSString length](v21, "length"));
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_102198278);
          v29 = qword_1022A01D8;
          if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289538;
            *(_DWORD *)&buf[4] = 0;
            v44 = 2082;
            v45 = "";
            v46 = 2114;
            v47 = v9;
            v48 = 2114;
            v49 = v17;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration found executable key. Removing prefix\", \"oldKey\":%{public, location:escape_only}@, \"anchorDictionary\":%{public, location:escape_only}@}", buf, 0x26u);
          }
          v28 = 101;
        }
        else
        {
          if ((objc_msgSend(v9, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("BundlePath"))) & 1) != 0)
          {
            v28 = 112;
          }
          else if ((objc_msgSend(v9, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("Executable"))) & 1) != 0)
          {
            v28 = 101;
          }
          else
          {
            if ((objc_msgSend(v9, "isEqualToString:", -[CLClientKeyPath objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("BundleId"))) & 1) == 0)
            {
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
              v30 = qword_1022A01D8;
              if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 68289538;
                *(_DWORD *)&buf[4] = 0;
                v44 = 2082;
                v45 = "";
                v46 = 2114;
                v47 = v9;
                v48 = 2114;
                v49 = v17;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration anchor type not defined in the anchor's dictionary; defaulting to bundleId\", \"anchor\":%{public, location:escape_only}@, \"value\":%{public, locat"
                  "ion:escape_only}@}",
                  buf,
                  0x26u);
              }
            }
            v28 = 105;
          }
          v26 = v9;
        }
        -[CLClientKeyPath removeObjectForKey:](v17, "removeObjectForKey:", CFSTR("SubIdentities"));
        v31 = +[CLClientKeyPath clientKeyPathWithClientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithClientAnchor:anchorType:", v26, v28);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, -[CLClientKeyPath clientKey](v31, "clientKey"));
        -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v9);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_102198278);
        v32 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289538;
          *(_DWORD *)&buf[4] = 0;
          v44 = 2082;
          v45 = "";
          v46 = 2114;
          v47 = v9;
          v48 = 2114;
          v49 = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration migration from legacy clients.plist representation - successfully migrated client representation\", \"oldKey\":%{public, location:escape_only}@, \"newKey\":%{public, location:escape_only}@}", buf, 0x26u);
        }
LABEL_31:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      v6 = v33;
    }
    while (v33);
  }
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_102198278);
  v34 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#AuthDatabaseMigration_0 successfully migrated from legacy clients.plist", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_102198278);
    v38[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 0, "#AuthDatabaseMigration_0 successfully migrated from legacy clients.plist", v38, 2);
    v36 = (uint8_t *)v35;
    sub_100512490("Generic", 1, 0, 2, "-[CLAuthorizationDatabase _internalMigrationLegacyKeys]", "%s\n", v35);
    if (v36 != buf)
      free(v36);
  }
}

- (void)_internalMigrationClearUnknownKeys
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  CLClientKeyPath *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  const __CFString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];

  v3 = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v19 = CFSTR("SubIdentities");
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v7);
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v19), "objectForKeyedSubscript:", v8);
        v11 = objc_opt_class(NSDictionary, v10);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          v12 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v8);
          if (-[CLClientKeyPath isValidCKP](v12, "isValidCKP"))
          {
            if (!-[CLClientKeyPath isAuthLimited](v12, "isAuthLimited"))
              goto LABEL_25;
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v13 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v14 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8);
              *(_DWORD *)buf = 68289538;
              v25 = 0;
              v26 = 2082;
              v27 = "";
              v28 = 2114;
              v29 = v8;
              v30 = 2114;
              v31 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration found auth limited key. Removing from database\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
              if (qword_1022A01D0 != -1)
                dispatch_once(&qword_1022A01D0, &stru_102198278);
            }
            v15 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
LABEL_23:
              v18 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8);
              *(_DWORD *)buf = 68289538;
              v25 = 0;
              v26 = 2082;
              v27 = "";
              v28 = 2114;
              v29 = v8;
              v30 = 2114;
              v31 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthorizationDatabaseDroppingData Removing dictionary for key\", \"Key\":%{public, location:escape_only}@, \"Dictionary\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          else
          {
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v16 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
            {
              v17 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8);
              *(_DWORD *)buf = 68289538;
              v25 = 0;
              v26 = 2082;
              v27 = "";
              v28 = 2114;
              v29 = v8;
              v30 = 2114;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#AuthDatabaseMigration found key without anchor. Removing from database\", \"key\":%{public, location:escape_only}@, \"value\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("AnchorKeyPath"))), "objectForKeyedSubscript:", v19), "removeObject:", v8);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_102198278);
            v15 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
              goto LABEL_23;
          }
          -[NSMutableDictionary removeObjectForKey:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "removeObjectForKey:", v8);
          -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
        }
LABEL_25:
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v5);
  }
}

- (void)_internalMigrationRegisterAllClients
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  CLClientKeyPath *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8);
        v11 = objc_opt_class(NSDictionary, v10);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
          && !objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", CFSTR("isSystemService")))
        {
          v12 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v8);
          if (!-[CLClientKeyPath subIdentityId](v12, "subIdentityId")
            && (objc_msgSend(-[CLAuthorizationDatabase registerClient:fromAuthSync:](self, "registerClient:fromAuthSync:", v12, 0), "isValidCKP") & 1) == 0)
          {
            -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", v12);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
}

- (id)getStateSummary
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CLClientKeyPath *v11;
  id v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = -[NSMutableDictionary allKeys](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "allKeys");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"), "objectForKeyedSubscript:", v7);
        v10 = objc_opt_class(NSDictionary, v9);
        if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        {
          v11 = +[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", v7);
          v12 = objc_msgSend(objc_msgSend(-[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v11), "dictionary"), "mutableCopy");
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IsAppClip")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("IsAppClip"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("isSystemService")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isSystemService"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("isHarvestableSystemService")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isHarvestableSystemService"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SuppressShowingInSettings")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("SuppressShowingInSettings"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Authorization")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221C590, CFSTR("Authorization"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CorrectiveCompensationEnabled")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221C530, CFSTR("CorrectiveCompensationEnabled"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("IncidentalUseMode")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221C5A8, CFSTR("IncidentalUseMode"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LocationButtonUseMode")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221C530, CFSTR("LocationButtonUseMode"));
          if (!objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InUseLevel")))
            objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10221C530, CFSTR("InUseLevel"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, -[CLClientKeyPath clientKey](v11, "clientKey"));
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  return v14;
}

- (NSMutableDictionary)systemServicesMap
{
  return self->_systemServicesMap;
}

- (void)setSystemServicesMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableDictionary)alternateIdentitiesMap
{
  return self->_alternateIdentitiesMap;
}

- (void)setAlternateIdentitiesMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
