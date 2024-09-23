@implementation NEHelperAppTrackerManager

- (NEHelperAppTrackerManager)initWithFirstMessage:(id)a3
{
  xpc_connection_t remote_connection;
  void *v5;
  NEHelperAppTrackerManager *v6;
  objc_super v8;

  remote_connection = xpc_dictionary_get_remote_connection(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
  objc_opt_self(NEHelperAppTrackerManager);
  v8.receiver = self;
  v8.super_class = (Class)NEHelperAppTrackerManager;
  v6 = -[NEHelperAppTrackerManager init](&v8, "init");

  return v6;
}

- (void)handleMessage:(id)a3
{
  id v3;
  char uint64;
  NSString *v5;
  void *v6;
  xpc_object_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  xpc_object_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  int64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];

  v3 = a3;
  uint64 = xpc_dictionary_get_uint64(v3, "app-tracker-check");
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, "app-tracker-signing-identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    if ((uint64 & 1) != 0)
    {
      v25 = 0;
      v8 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v25);
      v9 = v25;
      if (v9 || !v8)
      {
        sub_1000037E4((uint64_t)NEHelperServer, v3, 22, 0);

        goto LABEL_18;
      }
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privacyTrackingDomains"));
      if (v10)
      {
        v11 = (void *)v10;
        v12 = xpc_array_create(0, 0);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v13);
              xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "UTF8String", (_QWORD)v21));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v15);
        }

        xpc_dictionary_set_value(v7, "app-tracker-domains", v12);
      }

    }
    v18 = v3;
    v19 = 0;
    v20 = v7;
  }
  else
  {
    v18 = v3;
    v19 = 22;
    v20 = 0;
  }
  sub_1000037E4((uint64_t)NEHelperServer, v18, v19, v20);
LABEL_18:

}

@end
