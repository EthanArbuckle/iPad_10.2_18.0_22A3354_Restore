@implementation NSDictionary

+ (NSDictionary)dictionaryWithXPCDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithXPCDictionary:", v3);

  return (NSDictionary *)v4;
}

- (NSDictionary)initWithXPCDictionary:(id)a3
{
  id v4;
  NSDictionary *v5;
  id v6;
  NSObject *v7;
  NSDictionary *v8;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  NSDictionary *v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v16 = 0;
  v17[0] = &v16;
  v17[1] = 0x3032000000;
  v17[2] = sub_100086228;
  v17[3] = sub_100086238;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100086240;
  v13 = &unk_10013F4E0;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_dictionary_apply(v4, &v10))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1000C6564((uint64_t)v17, v7);

    v5 = -[NSDictionary initWithDictionary:](v5, "initWithDictionary:", *(_QWORD *)(v17[0] + 40), v10, v11, v12, v13);
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)createXPCDictionary
{
  xpc_object_t v3;
  NSDictionary *v4;
  NSUInteger v5;
  NSUInteger v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  NSUInteger v36;
  id v37;
  id v38;
  id v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v3 = xpc_dictionary_create(0, 0, 0);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v4 = self;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = &AATermsEntryDevice_ptr;
    v8 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v10, (_QWORD)v42));
        v13 = objc_opt_class(v7[307], v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        {
          xpc_dictionary_set_string(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
        }
        else
        {
          v15 = objc_opt_class(NSData, v14);
          if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
          {
            v17 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            v18 = objc_retainAutorelease(v11);
            v19 = objc_msgSend(v18, "bytes");
            v20 = v18;
            v7 = &AATermsEntryDevice_ptr;
            xpc_dictionary_set_data(v3, v17, v19, (size_t)objc_msgSend(v20, "length"));
          }
          else
          {
            v21 = objc_opt_class(NSNumber, v16);
            if ((objc_opt_isKindOfClass(v11, v21) & 1) != 0)
            {
              v23 = objc_retainAutorelease(v11);
              if (!strcmp((const char *)objc_msgSend(v23, "objCType"), "i")
                || (v24 = objc_retainAutorelease(v23), !strcmp((const char *)objc_msgSend(v24, "objCType"), "s"))
                || (v25 = objc_retainAutorelease(v24), !strcmp((const char *)objc_msgSend(v25, "objCType"), "q"))
                || (v26 = objc_retainAutorelease(v25), !strcmp((const char *)objc_msgSend(v26, "objCType"), "q")))
              {
                xpc_dictionary_set_int64(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (int64_t)objc_msgSend(v23, "longLongValue"));
              }
              else
              {
                v27 = objc_retainAutorelease(v26);
                if (!strcmp((const char *)objc_msgSend(v27, "objCType"), "f")
                  || (v28 = objc_retainAutorelease(v27), !strcmp((const char *)objc_msgSend(v28, "objCType"), "d")))
                {
                  v34 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
                  objc_msgSend(v27, "doubleValue");
                  xpc_dictionary_set_double(v3, v34, v35);
                }
                else
                {
                  v29 = objc_retainAutorelease(v28);
                  if (strcmp((const char *)objc_msgSend(v29, "objCType"), "B"))
                  {
                    v30 = objc_retainAutorelease(v29);
                    if (strcmp((const char *)-[NSObject objCType](v30, "objCType"), "c"))
                    {
                      v40 = sub_1000604F0();
                      v41 = objc_claimAutoreleasedReturnValue(v40);
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                        sub_1000C6644(v30, v41);

LABEL_32:
                      v37 = 0;
                      goto LABEL_33;
                    }
                  }
                  xpc_dictionary_set_BOOL(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (BOOL)objc_msgSend(v29, "BOOLValue"));
                }
                v7 = &AATermsEntryDevice_ptr;
              }

            }
            else
            {
              v31 = objc_opt_class(NSDate, v22);
              if ((objc_opt_isKindOfClass(v11, v31) & 1) == 0)
              {
                v38 = sub_1000604F0();
                v30 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  sub_1000C66C0((uint64_t)v10, (uint64_t)v11, v30);
                goto LABEL_32;
              }
              v32 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              objc_msgSend(v11, "timeIntervalSince1970");
              xpc_dictionary_set_date(v3, v32, (uint64_t)v33);
            }
          }
        }

        ++v9;
      }
      while (v6 != v9);
      v36 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v6 = v36;
    }
    while (v36);
  }

  v37 = v3;
LABEL_33:

  return v37;
}

+ (id)dictionaryFromJsonData:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;

  v3 = a3;
  if (!v3)
  {
    v10 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000C6750(v6, v11, v12);
    goto LABEL_11;
  }
  v17 = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v3, 0, &v17));
  v6 = v17;
  if (!v4)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C67D0(v6);

LABEL_11:
    v8 = 0;
    goto LABEL_5;
  }
  v7 = objc_opt_class(NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    v8 = v4;

    v6 = v8;
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C6854();

    v8 = 0;
    v6 = v4;
  }
LABEL_5:

  return v8;
}

+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4
{
  id v6;
  void *v7;
  xpc_object_t value;
  char *v9;
  const void *bytes_ptr;
  size_t length;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  dispatch_data_t v14;
  void *v15;
  _QWORD destructor[4];
  char *v18;

  v6 = a3;
  v7 = v6;
  if (a4
    && (value = xpc_dictionary_get_value(v6, a4), v9 = (char *)objc_claimAutoreleasedReturnValue(value),
                                                  (a4 = v9) != 0)
    && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)a4);
    length = xpc_data_get_length((xpc_object_t)a4);
    global_queue = dispatch_get_global_queue(9, 0);
    v13 = objc_claimAutoreleasedReturnValue(global_queue);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472;
    destructor[2] = nullsub_2;
    destructor[3] = &unk_10013D868;
    a4 = (id)a4;
    v18 = (char *)a4;
    v14 = dispatch_data_create(bytes_ptr, length, v13, destructor);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dictionaryFromJsonData:", v14));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)saveAsDataInXPCDictionary:(id)a3 forKey:(const char *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  xpc_object_t v10;

  v6 = a3;
  LOBYTE(v7) = 0;
  if (v6)
  {
    if (a4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary convertToNSData](self, "convertToNSData"));
      v7 = v8;
      if (v8)
      {
        v9 = objc_msgSend(v8, "_createDispatchData");
        v10 = xpc_data_create_with_dispatch_data(v9);

        xpc_dictionary_set_value(v6, a4, v10);
        LOBYTE(v7) = 1;
      }
    }
  }

  return (char)v7;
}

- (id)convertToNSData
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", self))
  {
    v7 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000C694C();
    goto LABEL_10;
  }
  v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", self, 0, &v10));
  v4 = v10;
  if (!v3)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C68C8(v4);

LABEL_10:
    v5 = 0;
    goto LABEL_4;
  }
  v5 = v3;

  v4 = v5;
LABEL_4:

  return v5;
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

@end
