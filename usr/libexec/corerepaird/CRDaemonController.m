@implementation CRDaemonController

+ (id)getAllowedListFromEntitlements:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", v3));

  v6 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = &__NSArray0__struct;

  return v7;
}

+ (void)controlWithParameters:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315394;
    v29 = "+[CRDaemonController controlWithParameters:withReply:]";
    v30 = 2112;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%s] parameters: %@", (uint8_t *)&v28, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "safeGetStringParam:key:", v6, CFSTR("action")));
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqual:", CFSTR("load")) & 1) != 0
      || objc_msgSend(v11, "isEqual:", CFSTR("unload")))
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getAllowedListFromEntitlements:", CFSTR("com.apple.private.corerepair.allow-job-control")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "safeGetStringParam:key:", v6, CFSTR("name")));
      if (v13)
      {
        if ((-[NSObject containsObject:](v12, "containsObject:", v13) & 1) != 0)
        {
          v14 = (uint64_t)objc_msgSend(a1, "doLaunchControl:action:", v13, v11);
LABEL_9:

          goto LABEL_10;
        }
        v22 = handleForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10003733C();
      }
      else
      {
        v20 = handleForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100037310();
      }

      v14 = 0;
      goto LABEL_9;
    }
    if (!objc_msgSend(v11, "isEqual:", CFSTR("writeDefaults")))
    {
      v14 = 0;
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getAllowedListFromEntitlements:", CFSTR("com.apple.private.corerepair.allow-pref-access")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "safeGetStringParam:key:", v6, CFSTR("name")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "safeGetStringParam:key:", v6, CFSTR("prefKey")));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prefValue")));
    if (v13)
    {
      if ((-[NSObject containsObject:](v12, "containsObject:", v13) & 1) != 0)
      {
        if (v15)
        {
          if (v16)
          {
            v17 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

            if (v16 == v17)
            {

              v16 = 0;
            }
            v18 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", v13);
            -[NSObject setObject:forKey:](v18, "setObject:forKey:", v16, v15);
            -[NSObject synchronize](v18, "synchronize");

            v14 = 1;
            v16 = v18;
            goto LABEL_21;
          }
          v27 = handleForCategory(0);
          v16 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            sub_1000373F4();
LABEL_41:
          v14 = 0;
LABEL_21:

          goto LABEL_9;
        }
        v26 = handleForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_1000373C8();
      }
      else
      {
        v25 = handleForCategory(0);
        v24 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_100037420();
      }
    }
    else
    {
      v23 = handleForCategory(0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10003739C();
    }

    goto LABEL_41;
  }
  v19 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1000372E4();
  v14 = 0;
LABEL_10:

  if (v7)
LABEL_11:
    v7[2](v7, v14, 0);
LABEL_12:

}

+ (BOOL)doLaunchControl:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, xpc_object_t, id *);
  void (*v10)(id);
  void (*v11)(id);
  unsigned __int8 v12;
  uint64_t v13;
  const char *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  id v17;
  xpc_object_t dictionary;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  char v23;
  uint64_t v25;
  _QWORD applier[5];
  unsigned __int8 v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/System/Library/LaunchDaemons/%@.plist"), v6));
  v9 = (void (*)(uint64_t, xpc_object_t, id *))objc_msgSend(a1, "getLibXPCInternalWithSymbol:", "_xpc_domain_routine");
  v10 = (void (*)(id))objc_msgSend(a1, "getLibXPCInternalWithSymbol:", "xpc_release");
  if (!v9 || (v11 = v10) == 0)
  {
    v25 = handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100037480();
    goto LABEL_17;
  }
  v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("load"));
  if ((v12 & 1) != 0)
  {
    v13 = 800;
    v14 = "enable";
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("unload")) & 1) == 0)
  {
    v21 = handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000374AC();
LABEL_17:

    v20 = 0;
    v16 = 0;
    v15 = 0;
    v17 = 0;
    goto LABEL_18;
  }
  v13 = 801;
  v14 = "disable";
LABEL_7:
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v15, "type", 7uLL);
  xpc_dictionary_set_uint64(v15, "handle", 0);
  xpc_dictionary_set_BOOL(v15, v14, 0);
  xpc_dictionary_set_BOOL(v15, "legacy-load", 1);
  xpc_dictionary_set_BOOL(v15, "force", 1);
  xpc_dictionary_set_BOOL(v15, "by-cli", 1);
  v16 = xpc_array_create(0, 0);
  xpc_array_set_string(v16, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  xpc_dictionary_set_value(v15, "paths", v16);
  if ((v12 & 1) == 0)
    xpc_dictionary_set_BOOL(v15, "no-einprogress", 1);
  v28 = 0;
  v9(v13, v15, &v28);
  v17 = v28;
  dictionary = xpc_dictionary_get_dictionary(v17, "errors");
  v19 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  v20 = v19;
  if (v19 && xpc_dictionary_get_count(v19))
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100008008;
    applier[3] = &unk_100050C38;
    applier[4] = &v29;
    v27 = v12;
    xpc_dictionary_apply(v20, applier);
    if (!v17)
      goto LABEL_18;
    goto LABEL_14;
  }
  *((_BYTE *)v30 + 24) = 1;
  if (v17)
LABEL_14:
    v11(v17);
LABEL_18:
  v23 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v23;
}

+ (void)getLibXPCInternalWithSymbol:(const char *)a3
{
  void *result;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;

  if (qword_100066850 != -1)
    dispatch_once(&qword_100066850, &stru_100050C58);
  if (qword_100066858)
  {
    result = dlsym((void *)qword_100066858, a3);
    if (result)
      return result;
    v5 = handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000375F8();
  }
  else
  {
    v7 = handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000375CC();
  }

  return 0;
}

+ (id)safeGetStringParam:(id)a3 key:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", a4));
      if (!v4
        || (v5 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v4, v5) & 1) == 0)
        || !objc_msgSend(v4, "length"))
      {

        v4 = 0;
      }
    }
  }
  return v4;
}

@end
