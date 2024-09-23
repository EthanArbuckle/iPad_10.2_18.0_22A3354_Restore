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
  v17[2] = sub_10001A924;
  v17[3] = sub_10001A934;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10001A93C;
  v13 = &unk_100048E58;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_dictionary_apply(v4, &v10))
  {
    v6 = sub_100024A40();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10002D544((uint64_t)v17, v7);

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
  const char *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  NSUInteger v32;
  id v33;
  id v34;
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v3 = xpc_dictionary_create(0, 0, 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = self;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = &APFSContainerGetSpaceInfo_ptr;
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v10, (_QWORD)v38));
        v12 = objc_opt_class(v7[120]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          xpc_dictionary_set_string(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
        }
        else
        {
          v13 = objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            v15 = objc_retainAutorelease(v11);
            v16 = objc_msgSend(v15, "bytes");
            v17 = v15;
            v7 = &APFSContainerGetSpaceInfo_ptr;
            xpc_dictionary_set_data(v3, v14, v16, (size_t)objc_msgSend(v17, "length"));
          }
          else
          {
            v18 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
            {
              v19 = objc_retainAutorelease(v11);
              if (!strcmp((const char *)objc_msgSend(v19, "objCType"), "i")
                || (v20 = objc_retainAutorelease(v19), !strcmp((const char *)objc_msgSend(v20, "objCType"), "s"))
                || (v21 = objc_retainAutorelease(v20), !strcmp((const char *)objc_msgSend(v21, "objCType"), "q"))
                || (v22 = objc_retainAutorelease(v21), !strcmp((const char *)objc_msgSend(v22, "objCType"), "q")))
              {
                xpc_dictionary_set_int64(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (int64_t)objc_msgSend(v19, "longLongValue"));
              }
              else
              {
                v23 = objc_retainAutorelease(v22);
                if (!strcmp((const char *)objc_msgSend(v23, "objCType"), "f")
                  || (v24 = objc_retainAutorelease(v23), !strcmp((const char *)objc_msgSend(v24, "objCType"), "d")))
                {
                  v30 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
                  objc_msgSend(v23, "doubleValue");
                  xpc_dictionary_set_double(v3, v30, v31);
                }
                else
                {
                  v25 = objc_retainAutorelease(v24);
                  if (strcmp((const char *)objc_msgSend(v25, "objCType"), "B"))
                  {
                    v26 = objc_retainAutorelease(v25);
                    if (strcmp((const char *)-[NSObject objCType](v26, "objCType"), "c"))
                    {
                      v36 = sub_100024A40();
                      v37 = objc_claimAutoreleasedReturnValue(v36);
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                        sub_10002D624(v26, v37);

LABEL_32:
                      v33 = 0;
                      goto LABEL_33;
                    }
                  }
                  xpc_dictionary_set_BOOL(v3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), (BOOL)objc_msgSend(v25, "BOOLValue"));
                }
                v7 = &APFSContainerGetSpaceInfo_ptr;
              }

            }
            else
            {
              v27 = objc_opt_class(NSDate);
              if ((objc_opt_isKindOfClass(v11, v27) & 1) == 0)
              {
                v34 = sub_100024A40();
                v26 = objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  sub_10002D6A0((uint64_t)v10, (uint64_t)v11, v26);
                goto LABEL_32;
              }
              v28 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
              objc_msgSend(v11, "timeIntervalSince1970");
              xpc_dictionary_set_date(v3, v28, (uint64_t)v29);
            }
          }
        }

        ++v9;
      }
      while (v6 != v9);
      v32 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v6 = v32;
    }
    while (v32);
  }

  v33 = v3;
LABEL_33:

  return v33;
}

+ (id)dictionaryFromJsonData:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;

  v3 = a3;
  if (!v3)
  {
    v9 = sub_100024A40();
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10002D730(v5, v10, v11);
    goto LABEL_11;
  }
  v16 = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v3, 0, &v16));
  v5 = v16;
  if (!v4)
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002D7B0(v5);

LABEL_11:
    v7 = 0;
    goto LABEL_5;
  }
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;

    v5 = v7;
  }
  else
  {
    v14 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002D834();

    v7 = 0;
    v5 = v4;
  }
LABEL_5:

  return v7;
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
    destructor[2] = nullsub_1;
    destructor[3] = &unk_100048E80;
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
    v7 = sub_100024A40();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10002D92C();
    goto LABEL_10;
  }
  v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", self, 0, &v10));
  v4 = v10;
  if (!v3)
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002D8A8(v4);

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
