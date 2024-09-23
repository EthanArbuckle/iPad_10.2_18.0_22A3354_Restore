@implementation MBiTunesStoreKVS

+ (id)iTunesStoreKVS
{
  return objc_alloc_init(MBiTunesStoreKVS);
}

- (MBiTunesStoreKVS)init
{
  MBiTunesStoreKVS *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBiTunesStoreKVS;
  v2 = -[MBiTunesStoreKVS init](&v4, "init");
  if (v2)
    v2->_KVS = (SSKeyValueStore *)objc_alloc_init((Class)SSKeyValueStore);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBiTunesStoreKVS;
  -[MBiTunesStoreKVS dealloc](&v3, "dealloc");
}

- (id)valueForDomain:(id)a3 key:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  SSKeyValueStore *KVS;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = sub_10007F6FC;
  v28 = sub_10007F70C;
  v29 = 0;
  v7 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_opt_class(self->_KVS);
    *(_DWORD *)buf = 138412802;
    v31 = a3;
    v32 = 2112;
    v33 = a4;
    v34 = 2112;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Getting value %@/%@ from %@", buf, 0x20u);
    v9 = objc_opt_class(self->_KVS);
    _MBLog(CFSTR("INFO"), "Getting value %@/%@ from %@", a3, a4, v9);
  }
  v10 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10007F718;
  v23[3] = &unk_1000DA198;
  v23[4] = v10;
  v23[5] = &v24;
  -[SSKeyValueStore getValueForDomain:key:usingBlock:](KVS, "getValueForDomain:key:usingBlock:", a3, a4, v23);
  v12 = MBSemaphoreWaitForever(v10);
  if (v25[5])
  {
    v14 = MBGetDefaultLog(v12, v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_opt_class(self->_KVS);
      v16 = v25[5];
      *(_DWORD *)buf = 138413058;
      v31 = a3;
      v32 = 2112;
      v33 = a4;
      v34 = 2112;
      v35 = v15;
      v36 = 2112;
      v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found value %@/%@ from %@: %@", buf, 0x2Au);
      v17 = objc_opt_class(self->_KVS);
      _MBLog(CFSTR("INFO"), "Found value %@/%@ from %@: %@", a3, a4, v17, v25[5]);
    }
  }
  else
  {
    v18 = MBGetDefaultLog(v12, v13);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_opt_class(self->_KVS);
      *(_DWORD *)buf = 138412802;
      v31 = a3;
      v32 = 2112;
      v33 = a4;
      v34 = 2112;
      v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Didn't find value %@/%@ in %@", buf, 0x20u);
      v20 = objc_opt_class(self->_KVS);
      _MBLog(CFSTR("INFO"), "Didn't find value %@/%@ in %@", a3, a4, v20);
    }
  }
  v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);
  return v21;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  SSKeyValueStore *KVS;
  id v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_opt_class(self->_KVS);
    *(_DWORD *)buf = 138413058;
    v21 = a4;
    v22 = 2112;
    v23 = a5;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Setting value %@/%@ in %@: %@", buf, 0x2Au);
    v11 = objc_opt_class(self->_KVS);
    _MBLog(CFSTR("INFO"), "Setting value %@/%@ in %@: %@", a4, a5, v11, a3);
  }
  v12 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007F938;
  v15[3] = &unk_1000DA1C0;
  v15[4] = v12;
  v15[5] = &v16;
  -[SSKeyValueStore setValue:forDomain:key:completionBlock:](KVS, "setValue:forDomain:key:completionBlock:", a3, a4, a5, v15);
  MBSemaphoreWaitForever(v12);
  if (!*((_BYTE *)v17 + 24))
  {
    v14 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("Failed to set value %@/%@ in %@"), a4, a5, objc_opt_class(self->_KVS));
    objc_exception_throw(v14);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)setValuesWithDictionary:(id)a3 forDomain:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  SSKeyValueStore *KVS;
  id v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_opt_class(self->_KVS);
    *(_DWORD *)buf = 138412802;
    v19 = a4;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting values with dictionary %@ in %@: %@", buf, 0x20u);
    v9 = objc_opt_class(self->_KVS);
    _MBLog(CFSTR("INFO"), "Setting values with dictionary %@ in %@: %@", a4, v9, a3);
  }
  v10 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007FB24;
  v13[3] = &unk_1000DA1C0;
  v13[4] = v10;
  v13[5] = &v14;
  -[SSKeyValueStore setValuesWithDictionary:forDomain:completionBlock:](KVS, "setValuesWithDictionary:forDomain:completionBlock:", a3, a4, v13);
  MBSemaphoreWaitForever(v10);
  if (!*((_BYTE *)v15 + 24))
  {
    v12 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("Failed to set values with dictionary %@/%@ in %@"), a4, objc_opt_class(self->_KVS), a3);
    objc_exception_throw(v12);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)removeAllValues
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  dispatch_semaphore_t v6;
  SSKeyValueStore *KVS;
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_opt_class(self->_KVS);
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing all values from %@", buf, 0xCu);
    v5 = objc_opt_class(self->_KVS);
    _MBLog(CFSTR("INFO"), "Removing all values from %@", v5);
  }
  v6 = dispatch_semaphore_create(0);
  KVS = self->_KVS;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10007FCDC;
  v9[3] = &unk_1000DA1C0;
  v9[4] = v6;
  v9[5] = &v10;
  -[SSKeyValueStore removeAllValuesWithCompletionBlock:](KVS, "removeAllValuesWithCompletionBlock:", v9);
  MBSemaphoreWaitForever(v6);
  if (!*((_BYTE *)v11 + 24))
  {
    v8 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("Failed to remove all values from %@"), objc_opt_class(self->_KVS));
    objc_exception_throw(v8);
  }
  _Block_object_dispose(&v10, 8);
}

+ (id)mergeKnownAccountsByDSID:(id)a3 into:(id)a4
{
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a4);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(a4, "objectForKeyedSubscript:", v11))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v11), v11);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)knownAccounts
{
  id v3;
  uint64_t v4;
  uint64_t isKindOfClass;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  SSKeyValueStore **p_KVS;
  SSKeyValueStore *KVS;
  const char *v18;
  NSObject *v19;
  SSKeyValueStore *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];

  v3 = -[MBiTunesStoreKVS valueForDomain:key:](self, "valueForDomain:key:", CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"));
  if (v3)
  {
    v4 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);
    if ((isKindOfClass & 1) == 0)
    {
      v15 = MBGetDefaultLog(isKindOfClass, v6);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        return 0;
      KVS = self->_KVS;
      p_KVS = &self->_KVS;
      *(_DWORD *)buf = 138412802;
      v29 = CFSTR("com.apple.mobile.iTunes.store");
      v30 = 2112;
      v31 = CFSTR("KnownAccounts");
      v32 = 2112;
      v33 = objc_opt_class(KVS);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@/%@ not an array in %@", buf, 0x20u);
      v18 = "%@/%@ not an array in %@";
LABEL_16:
      v22 = objc_opt_class(*p_KVS);
      _MBLog(CFSTR("DEFAULT"), v18, CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"), v22);
      return 0;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v12 = objc_opt_class(NSDictionary);
        v13 = objc_opt_isKindOfClass(v11, v12);
        if ((v13 & 1) == 0)
          break;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          if (v8)
            goto LABEL_5;
          return v3;
        }
      }
      v19 = MBGetDefaultLog(v13, v14);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        return 0;
      v20 = self->_KVS;
      p_KVS = &self->_KVS;
      v21 = objc_opt_class(v20);
      *(_DWORD *)buf = 138412802;
      v29 = CFSTR("com.apple.mobile.iTunes.store");
      v30 = 2112;
      v31 = CFSTR("KnownAccounts");
      v32 = 2112;
      v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@/%@ item not a dictionary in %@", buf, 0x20u);
      v18 = "%@/%@ item not a dictionary in %@";
      goto LABEL_16;
    }
  }
  return v3;
}

- (id)knownAccountsByDSID
{
  id v2;
  void *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];

  v2 = -[MBiTunesStoreKVS knownAccounts](self, "knownAccounts");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
        if (v10)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, v10);
        }
        else
        {
          v12 = MBGetDefaultLog(0, v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_opt_class(self->_KVS);
            *(_DWORD *)buf = 138413314;
            v22 = CFSTR("DSPersonID");
            v23 = 2112;
            v24 = CFSTR("com.apple.mobile.iTunes.store");
            v25 = 2112;
            v26 = CFSTR("KnownAccounts");
            v27 = 2112;
            v28 = v9;
            v29 = 2112;
            v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ not in %@/%@ value in %@: %@", buf, 0x34u);
            v14 = objc_opt_class(self->_KVS);
            _MBLog(CFSTR("DEFAULT"), "%@ not in %@/%@ value in %@: %@", CFSTR("DSPersonID"), CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"), v9, v14);
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)setKnownAccounts:(id)a3
{
  -[MBiTunesStoreKVS setValue:forDomain:key:](self, "setValue:forDomain:key:", a3, CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"));
}

- (SSKeyValueStore)KVS
{
  return self->_KVS;
}

@end
