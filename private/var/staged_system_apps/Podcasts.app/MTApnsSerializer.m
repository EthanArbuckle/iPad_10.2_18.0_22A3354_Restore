@implementation MTApnsSerializer

- (id)payload
{
  void *i;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v26;
  id obj;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  NSObject *v37;
  _BYTE v38[128];

  v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer keys](self, "keys"));
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(obj);
        v4 = *(NSObject **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processor"));

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreSerializer transaction](self, "transaction"));
        v31 = 0;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataForSetTransaction:key:version:", v7, v4, &v31));
        v9 = v31;

        if (v8)
        {
          v11 = objc_msgSend((id)objc_opt_class(self), "whitelistedClasses");
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v30 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v8, &v30));
          v14 = v30;

          if (v14 || !v13)
          {
            v17 = _MTLogCategoryCloudSync(v15);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v4;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Processor returned data for key %@ that isn't a valid archive. Skipping.", buf, 0xCu);
            }

            if (v14)
            {
              v20 = _MTLogCategoryCloudSync(v19);
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v14;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error = %@", buf, 0xCu);
              }

            }
          }
          else
          {
            -[NSObject setValue:forKey:](v26, "setValue:forKey:", v13, v4);
          }

        }
        else
        {
          v16 = _MTLogCategoryCloudSync(v10);
          v14 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v4;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Processor returned nil data for key %@. Skipping.", buf, 0xCu);
          }
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v29);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v26, 200, 0, 0));
  v23 = _MTLogCategoryCloudSync(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "APNS subscription payload: %@", buf, 0xCu);
  }

  return v22;
}

+ (id)whitelistedClasses
{
  if (qword_1005675B8 != -1)
    dispatch_once(&qword_1005675B8, &stru_1004ABDD0);
  return (id)qword_1005675C0;
}

@end
