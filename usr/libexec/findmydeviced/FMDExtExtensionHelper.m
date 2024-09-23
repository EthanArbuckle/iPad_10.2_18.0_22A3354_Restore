@implementation FMDExtExtensionHelper

+ (id)getAccessoryProxyForId:(id)a3 withDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getConnectionForID:withDelegate:", v6, a4));
  v8 = v7;
  if (v7)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100055A10;
    v23[3] = &unk_1002C2130;
    v9 = v7;
    v24 = v9;
    v10 = v6;
    v25 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remoteObjectProxyWithErrorHandler:](v9, "remoteObjectProxyWithErrorHandler:", v23));
    v12 = sub_1000530AC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v27 = v11;
      v28 = 2048;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created new remoteObjectProxy %p with connection %p for extensionId = %@", buf, 0x20u);
    }

    v14 = v24;
  }
  else
  {
    v15 = sub_1000530AC();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1002294B0((uint64_t)v6, v14, v16, v17, v18, v19, v20, v21);
    v11 = 0;
  }

  return v11;
}

+ (id)_getConnectionForID:(id)a3 withDelegate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionsDataSource sharedInstance](FMDExtExtensionsDataSource, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "extensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v5));

  if (!v9)
  {
    v10 = sub_1000530AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1002295F8((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);

  }
  v46 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "beginExtensionRequestWithOptions:inputItems:error:", 0, 0, &v46));
  v19 = v46;
  if (v19)
  {
    v20 = sub_1000530AC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100229594((uint64_t)v19, v21, v22, v23, v24, v25, v26, v27);
    v28 = 0;
  }
  else
  {
    v29 = v18;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_extensionContextForUUID:", v29));
    if (v31)
    {
      v32 = objc_opt_class(FMDExtHostContext, v30);
      isKindOfClass = objc_opt_isKindOfClass(v31, v32);
      if (v6)
      {
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v31, "setAccessoryDelegate:", v6);
      }
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_auxiliaryConnection"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v34));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100055CF8;
      v43[3] = &unk_1002C13E8;
      v36 = v29;
      v44 = v36;
      v37 = v35;
      v45 = v37;
      objc_msgSend(v34, "setInterruptionHandler:", v43);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100055D40;
      v40[3] = &unk_1002C13E8;
      v41 = v36;
      v42 = v37;
      v38 = v37;
      objc_msgSend(v34, "setInvalidationHandler:", v40);

    }
    v21 = v34;

    v28 = v21;
  }

  return v28;
}

+ (id)getAllExtensions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionsDataSource sharedInstance](FMDExtExtensionsDataSource, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "extensions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  return v4;
}

+ (id)extensionforFeature:(id)a3 flavor:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = qword_100306660;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&qword_100306660, &stru_1002C3570);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@__%@"), v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100306658, "objectForKeyedSubscript:", v8));
  return v9;
}

+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper extensionforFeature:flavor:](FMDExtExtensionHelper, "extensionforFeature:flavor:", v5, v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryProxyForId:withDelegate:](FMDExtExtensionHelper, "getAccessoryProxyForId:withDelegate:", v7, 0));
  }
  else
  {
    v9 = sub_1000530AC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10022972C();

    v8 = 0;
  }

  return v8;
}

+ (id)getAccessoryControllerForFeature:(id)a3 flavor:(id)a4 withDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper extensionforFeature:flavor:](FMDExtExtensionHelper, "extensionforFeature:flavor:", v7, v8));
  if (!v10)
  {
    v14 = sub_1000530AC();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10022972C();
    v11 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtExtensionHelper getAccessoryProxyForId:withDelegate:](FMDExtExtensionHelper, "getAccessoryProxyForId:withDelegate:", v10, v9));
  if (!v11)
  {
    v12 = sub_1000530AC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100229794();
LABEL_8:

  }
  return v11;
}

@end
