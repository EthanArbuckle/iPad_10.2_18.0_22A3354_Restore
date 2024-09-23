@implementation STUFetchApplicationsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchApplicationsOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchApplicationsRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D2B88);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  NSMutableDictionary *v18;
  _QWORD v19[4];
  NSMutableDictionary *v20;
  STUFetchApplicationsOperation *v21;
  _QWORD v22[4];
  NSMutableDictionary *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bundleIdentifiers"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "installedApplicationInfo"));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CRKApplicationInfo bundleIdentifiersFromDictionaryRepresentations:](CRKApplicationInfo, "bundleIdentifiersFromDictionaryRepresentations:", v9));

  }
  v10 = objc_opt_new(NSMutableDictionary);
  v11 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v11);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000DDAC;
        v22[3] = &unk_1000C9C18;
        v23 = v10;
        v24 = v11;
        -[STUFetchApplicationsOperation fetchApplicationWithBundleIdentifier:completion:](self, "fetchApplicationWithBundleIdentifier:completion:", v17, v22);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DE28;
  v19[3] = &unk_1000C9B00;
  v20 = v10;
  v21 = self;
  v18 = v10;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v19);

}

- (void)fetchApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)CRKApplicationDescriptor), "initWithBundleIdentifier:includeIcon:includeBadgeIcon:", v6, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchApplicationsOperation appProvider](self, "appProvider"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000DF54;
  v12[3] = &unk_1000C9C40;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "fetchApplicationWithDescriptor:completion:", v8, v12);

}

- (STUApplicationProviding)appProvider
{
  STUApplicationProviding *appProvider;
  STUApplicationProviding *v4;
  STUApplicationProviding *v5;

  appProvider = self->_appProvider;
  if (!appProvider)
  {
    v4 = (STUApplicationProviding *)objc_claimAutoreleasedReturnValue(-[STUFetchApplicationsOperation makeAppProvider](self, "makeAppProvider"));
    v5 = self->_appProvider;
    self->_appProvider = v4;

    appProvider = self->_appProvider;
  }
  return appProvider;
}

- (id)makeAppProvider
{
  return objc_opt_new(STUApplicationProvider_iOS);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProvider, 0);
}

@end
