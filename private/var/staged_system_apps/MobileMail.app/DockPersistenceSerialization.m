@implementation DockPersistenceSerialization

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093404;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B48 != -1)
    dispatch_once(&qword_1005A9B48, block);
  return (id)qword_1005A9B40;
}

+ (id)dockedStatesFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;

  v4 = a3;
  if (!v4)
  {
    v6 = &__NSArray0__struct;
    goto LABEL_25;
  }
  v5 = objc_opt_class(NSDictionary);
  v6 = &__NSArray0__struct;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v7 = objc_msgSend(v4, "ef_objectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("RestorationCompatabilityVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "integerValue");
    else
      v10 = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218240;
      v21 = v10;
      v22 = 2048;
      v23 = 2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deserializing docked states from version %ld to version %ld.", (uint8_t *)&v20, 0x16u);
    }

    if (v10 == (id)2)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadFromV2Data:", v4));
    }
    else if (v10 == (id)1)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadFromV1Data:", v4));
    }
    else
    {
      if (v10)
      {
        v14 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1003915D8((uint64_t)v10, v14, v15);

        v13 = 0;
        goto LABEL_19;
      }
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadFromLegacyData:", v4));
    }
    v13 = (void *)v12;
LABEL_19:
    if (v13)
      v16 = v13;
    else
      v16 = &__NSArray0__struct;
    v6 = v16;

    v17 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v6, "count");
      v20 = 134217984;
      v21 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Deserialization finished with %lu states.", (uint8_t *)&v20, 0xCu);
    }

  }
LABEL_25:

  return v6;
}

+ (id)dictionaryFromDockedStates:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  uint64_t v16;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = objc_msgSend(v3, "count");
    v15 = 2048;
    v16 = 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Serializing %lu docked states with version %ld.", buf, 0x16u);
  }

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKey:", &off_100541440, CFSTR("RestorationCompatabilityVersion"));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12));
  v7 = v12;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
      sub_100391644(v9, (uint64_t)buf, v8);
    }

  }
  else
  {
    objc_msgSend(v5, "ef_setOptionalObject:forKey:", v6, CFSTR("DockedStates"));
  }
  v10 = objc_msgSend(v5, "copy");

  return v10;
}

+ (id)_loadFromLegacyData:(id)a3
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25;
  _BYTE v26[7];
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;

  v17 = a3;
  v20 = objc_alloc_init((Class)NSMutableArray);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("actorItems")));
  v3 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v30 = objc_msgSend(v18, "count", v17);
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Found %lu legacy serialized states.", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v18;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("identificationString"), v17));
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("resurrectionIdentifier")));
        if (objc_msgSend(v9, "length"))
        {
          v10 = objc_opt_class(NSString);
          v27 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v10, v9, &v27));
          v12 = v27;
          if (v12)
          {
            v13 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v12, "ef_publicDescription"));
              sub_1003916C8(v14, buf, &v30, v13);
            }

          }
        }
        else
        {
          v12 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            sub_10039168C(&v25, v26, v12);
          v11 = 0;
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[DockedViewControllerState withID:title:](DockedViewControllerState, "withID:title:", v11, v8));
        objc_msgSend(v20, "ef_addOptionalObject:", v15);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v4);
  }

  return v20;
}

+ (id)_loadFromV1Data:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t v20[4];
  id v21;
  uint8_t buf[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loadFromV2Data:", v4));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PresentedState")));
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Serialized state has previously presented state. Adding to docked states...", buf, 2u);
    }

    v19 = 0;
    v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(DockedViewControllerState), v7, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v19;
    if (v10)
    {
      objc_msgSend(v6, "insertObject:atIndex:", v10, 0);
      v12 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Previously presented state was added to docked states.", buf, 2u);
      }

    }
    if (v11)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
        sub_100391714(v14, (uint64_t)buf, v13);
      }

    }
  }
  v15 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v6, "count");
    *(_DWORD *)v20 = 134217984;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Found %lu serialized docked states. Updating identifiers and filtering...", v20, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_filter:", &stru_10051C788));
  return v17;
}

+ (id)_loadFromV2Data:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  _QWORD v14[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("DockedStates")));
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc((Class)NSSet);
    v14[0] = objc_opt_class(NSArray);
    v14[1] = objc_opt_class(DockedViewControllerState);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v7 = objc_msgSend(v5, "initWithArray:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v7, v4, 0));
    v9 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found %lu serialized docked states. Checking for missing identifiers...", (uint8_t *)&v12, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_filter:", &stru_10051C7A8));
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100391788();
    v10 = &__NSArray0__struct;
  }

  return v10;
}

@end
