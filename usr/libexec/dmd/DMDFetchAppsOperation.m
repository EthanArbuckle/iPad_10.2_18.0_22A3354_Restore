@implementation DMDFetchAppsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFFetchAppsRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2BC8;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000443FC;
  v5[3] = &unk_1000BB0D8;
  v5[4] = self;
  objc_msgSend((id)objc_opt_class(self), "fetchAppsForRequest:completion:", v4, v5);

}

+ (void)fetchAppsForRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDFetchAppsOperation.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDFetchAppsOperation.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppController sharedController](DMDAppController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestURL"));
  v13 = DMFAppLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestURL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "host"));
      *(_DWORD *)buf = 138543362;
      v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetch app with manifest url from: %{public}@", buf, 0xCu);

    }
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100044780;
    v33[3] = &unk_1000BB100;
    v18 = (id *)v35;
    v35[0] = v9;
    v35[1] = a1;
    v19 = &v34;
    v34 = v7;
    v20 = v7;
    v21 = v9;
    objc_msgSend(v10, "getBundleIdentifierForManifestURL:completion:", v11, v33);
  }
  else
  {
    if (v15)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifiers"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeItemIdentifier"));
      *(_DWORD *)buf = 138543618;
      v37 = v22;
      v38 = 2114;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetch apps with bundle ids: %{public}@, store item id: %{public}@", buf, 0x16u);

    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000447F0;
    v29[3] = &unk_1000BB128;
    v18 = &v32;
    v19 = &v30;
    v32 = v9;
    v30 = v7;
    v24 = v10;
    v31 = v24;
    v25 = v7;
    v26 = v9;
    objc_msgSend(v24, "handleFetchRequest:completion:", v25, v29);

  }
}

+ (void)_fetchAppsForBundleIdentifier:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_opt_new(DMFFetchAppsRequest);
  v12 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  objc_msgSend(v10, "setBundleIdentifiers:", v11);
  objc_msgSend(v10, "setType:", a4);
  objc_msgSend(a1, "fetchAppsForRequest:completion:", v10, v8);

}

@end
