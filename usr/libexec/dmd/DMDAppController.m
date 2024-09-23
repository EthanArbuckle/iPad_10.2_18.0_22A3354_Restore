@implementation DMDAppController

+ (DMDAppController)sharedController
{
  if (qword_1000EB6F0 != -1)
    dispatch_once(&qword_1000EB6F0, &stru_1000B9CF0);
  return (DMDAppController *)(id)qword_1000EB6E8;
}

- (id)initPrivate
{
  DMDAppController *v2;
  DMDAppController *v3;
  NSString *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *manifest;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  id v24;
  OS_dispatch_queue *v25;
  DMFOSStateHandler *v26;
  DMFOSStateHandler *stateHandler;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  id v35;
  id v36;
  objc_super v37;
  const __CFString *v38;
  NSMutableDictionary *v39;
  const __CFString *v40;
  id v41;

  v37.receiver = self;
  v37.super_class = (Class)DMDAppController;
  v2 = -[DMDAppController init](&v37, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.dmd.%@.%p"), objc_opt_class(v2), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v4));
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend((id)objc_opt_class(v3), "metadataPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
    {
      v36 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v9, 0, &v36));
      v13 = v36;
      if (!v12)
      {
        v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not read app management plist at path: %@, error: %@"), v9, v13));
        v40 = CFSTR("error");
        v41 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
        v31 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v29, v30));

        objc_exception_throw(v31);
      }
      v35 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 1, 0, &v35));
      v15 = v35;
      v16 = v15;
      if (v14)
      {

        v17 = v14;
        manifest = v3->_manifest;
        v3->_manifest = v17;
LABEL_10:

        -[DMDAppController _cleanUpStaleManagementStatesAndStartObservingApps](v3, "_cleanUpStaleManagementStatesAndStartObservingApps");
        objc_initWeak(&location, v3);
        v24 = objc_alloc((Class)DMFOSStateHandler);
        v25 = v3->_queue;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000128F4;
        v32[3] = &unk_1000B9D18;
        objc_copyWeak(&v33, &location);
        v26 = (DMFOSStateHandler *)objc_msgSend(v24, "initWithQueue:name:stateHandlerBlock:", v25, CFSTR("Apps"), v32);
        stateHandler = v3->_stateHandler;
        v3->_stateHandler = v26;

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);

        return v3;
      }
      v19 = DMFAppLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100071830();

    }
    v38 = CFSTR("metadataByBundleID");
    manifest = objc_opt_new(NSMutableDictionary);
    v39 = manifest;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v22 = (NSMutableDictionary *)objc_msgSend(v21, "mutableCopy");
    v23 = v3->_manifest;
    v3->_manifest = v22;

    v17 = 0;
    goto LABEL_10;
  }
  return v3;
}

- (NSArray)foregroundBundleIdentifiers
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataByBundleIdentifier](self, "_metadataByBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; Apps: %@>"),
                   v3,
                   self,
                   v4));

  return (NSString *)v5;
}

- (void)getBundleIdentifierForManifestURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

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
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifestURL"));

    if (v9)
      goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
    *(_DWORD *)buf = 138543362;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for manifest URL from: %{public}@", buf, 0xCu);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100012B78;
  v16[3] = &unk_1000B9D40;
  v17 = v9;
  v13 = v9;
  -[DMDAppController _getEnterpriseAppMetadataForManifestURL:completion:](self, "_getEnterpriseAppMetadataForManifestURL:completion:", v7, v16);

}

- (void)getBundleIdentifierForAppRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for request: %{public}@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  if (v12)
  {
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v12, 0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeItemIdentifier"));
    if (v13)
    {
      v14 = DMFAppLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Get bundle identifier for store item identifier: %{public}@", buf, 0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeItemIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "personaIdentifier"));
      -[DMDAppController getBundleIdentifierForStoreItemIdentifier:personaIdentifier:completion:](self, "getBundleIdentifierForStoreItemIdentifier:personaIdentifier:completion:", v16, v17, v9);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestURL"));
      -[DMDAppController getBundleIdentifierForManifestURL:completion:](self, "getBundleIdentifierForManifestURL:completion:", v16, v9);
    }

  }
}

- (void)getMetadataForAppRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;

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
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestURL"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "manifestURL"));
    -[DMDAppController _getEnterpriseAppMetadataForManifestURL:completion:](self, "_getEnterpriseAppMetadataForManifestURL:completion:", v11, v9);

  }
  else
  {
    v12 = DMFAppLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Get metadata for non-enterprise app request: %{public}@", buf, 0xCu);
    }

    -[DMDAppController getMetadataForNonEnterpriseAppRequest:completion:](self, "getMetadataForNonEnterpriseAppRequest:completion:", v7, v9);
  }

}

- (id)managementInformationForBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v5));
  if (v6)
  {
    v7 = (void *)objc_opt_new(DMFAppManagementInformation);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state")));
    objc_msgSend(v7, "setState:", objc_msgSend(v8, "unsignedIntegerValue"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flags")));
    objc_msgSend(v7, "setOptions:", objc_msgSend(v9, "unsignedIntegerValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RedemptionCode")));
    objc_msgSend(v7, "setRedemptionCode:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UnusedRedemptionCode")));
    objc_msgSend(v7, "setUnusedRedemptionCode:", v11);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setManagementInformation:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v9)
    goto LABEL_7;
LABEL_3:
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v10));
  if (!v11)
    v11 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "state")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("state"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "options")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("flags"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "redemptionCode"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("RedemptionCode"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unusedRedemptionCode"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("UnusedRedemptionCode"));

LABEL_8:
  v17 = -[DMDAppController _setMetadata:forBundleIdentifier:error:](self, "_setMetadata:forBundleIdentifier:error:", v11, v10, a5);

  return v17;
}

- (BOOL)writeManagementInformationToDiskWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v26;
  NSErrorUserInfoKey v27;
  id v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController manifest](self, "manifest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, a3));

  if (v6)
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "metadataPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 0));

    v26 = 0;
    v10 = objc_msgSend(v6, "dm_atomicWriteToURL:error:", v9, &v26);
    v11 = v26;
    if ((v10 & 1) == 0)
    {
      v12 = DMFAppLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v14)
          sub_1000718D0((uint64_t)v11, v13, v15, v16, v17, v18, v19, v20);

        if (!a3)
          goto LABEL_14;
        v27 = NSUnderlyingErrorKey;
        v28 = v11;
        v21 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
        v22 = DMFErrorWithCodeAndUserInfo(4700, v21);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v22));
        *a3 = v23;

      }
      else
      {
        if (v14)
          sub_100071890(v13);

        if (!a3)
          goto LABEL_14;
        v24 = DMFErrorWithCodeAndUserInfo(4700, 0);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
        *a3 = v21;
      }

    }
LABEL_14:

    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (void)updateBundleIDPersonaIDMappingForPersonaID:(id)a3 addingBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](self, "managedBundleIdentifiers"));
    v13 = v12;
    if (v9)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v9));

      v13 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100013638;
    v17[3] = &unk_1000B9D68;
    v18 = v13;
    v19 = v8;
    v20 = v11;
    v16 = v13;
    objc_msgSend(v15, "setBundlesIdentifiers:forPersonaWithPersonaUniqueString:completionHandler:", v16, v19, v17);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (BOOL)removePersonaMappingForBundleID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  char v14;
  void *v15;
  void *v16;
  id *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];

  v18 = a4;
  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100013918;
  v28 = sub_100013928;
  v29 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "listAllPersonaWithAttributes"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userPersonaBundleIDList", v18));
        v13 = objc_msgSend(v12, "containsObject:", v5);

        if (v13)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userPersonaUniqueString"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100013930;
          v19[3] = &unk_1000B9D90;
          v19[4] = &v24;
          -[DMDAppController updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:](self, "updateBundleIDPersonaIDMappingForPersonaID:addingBundleID:completionHandler:", v15, 0, v19);

          v16 = (void *)v25[5];
          if (v16)
          {
            LOBYTE(v8) = 0;
            v14 = 0;
            if (v18)
              *v18 = objc_retainAutorelease(v16);
          }
          else
          {
            v14 = 0;
            LOBYTE(v8) = 1;
          }
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_14:

  _Block_object_dispose(&v24, 8);
  return (v8 | v14) & 1;
}

- (id)VPNUUIDStringForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VPNUUID")));

  return v5;
}

- (BOOL)setVPNUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set VPN UUID for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("VPNUUID"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)cellularSliceUUIDStringForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CellularSliceUUID")));

  return v5;
}

- (BOOL)setCellularSliceUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set CellularSlice UUID for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("CellularSliceUUID"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)contentFilterUUIDStringForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentFilterUUID")));

  return v5;
}

- (BOOL)setContentFilterUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set VPN UUID for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("ContentFilterUUID"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)DNSProxyUUIDStringForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DNSProxyUUID")));

  return v5;
}

- (BOOL)setDNSProxyUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set VPN UUID for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("DNSProxyUUID"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)relayUUIDStringForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RelayUUID")));

  return v5;
}

- (BOOL)setRelayUUIDString:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set relay UUID for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("RelayUUID"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)associatedDomainsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssociatedDomains")));

  return v5;
}

- (BOOL)setAssociatedDomains:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set associated domains for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("AssociatedDomains"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)associatedDomainsEnableDirectDownloadsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssociatedDomainsEnableDirectDownloads")));

  return v5;
}

- (BOOL)setAssociatedDomainsEnableDirectDownloads:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set associated domains enable direct downloads for bundle identifier: %{public}@", buf, 0xCu);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("AssociatedDomainsEnableDirectDownloads"), v9, v8, &v16);

  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)removabilityForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Removable")));

  return v5;
}

- (void)setRemovability:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD *v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = DMFAppLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set removability for bundle identifier: %{public}@", buf, 0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100014614;
  v26[3] = &unk_1000B9DB8;
  v26[4] = self;
  v13 = v9;
  v27 = v13;
  v28 = v10;
  v14 = v10;
  v15 = objc_retainBlock(v26);
  if (v8)
  {
    v16 = objc_msgSend(v8, "BOOLValue");
    v17 = 1;
    if (!v16)
      v17 = 2;
  }
  else
  {
    v17 = 1;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001472C;
  v21[3] = &unk_1000B9E08;
  v24 = v15;
  v25 = v17;
  v22 = v13;
  v23 = v8;
  v18 = v8;
  v19 = v15;
  v20 = v13;
  +[IXAppInstallCoordinator removabilityForAppWithBundleID:completion:](IXAppInstallCoordinator, "removabilityForAppWithBundleID:completion:", v20, v21);

}

- (id)tapToPayScreenLockForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TapToPayScreenLock")));

  return v5;
}

+ (void)_setTapToPayAttribute:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;

  v5 = a3;
  v6 = a4;
  v7 = DMFAppLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v9)
      sub_100071ADC((uint64_t)v5, v8);

    objc_msgSend(sub_100014A6C(), "setMDMAppAttribute:withValue:forBundleID:", 0, objc_msgSend(v5, "BOOLValue"), v6);
  }
  else
  {
    if (v9)
      sub_100071A9C(v8);

    objc_msgSend(sub_100014A6C(), "removeMDMAppAttribute:forBundleID:", 0, v6);
  }

}

- (void)setTapToPayScreenLock:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = a3;
  v11 = DMFAppLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setTapToPayScreenLock for bundle identifier: %{public}@", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(self), "_setTapToPayAttribute:forBundleIdentifier:", v10, v8);
  v14 = 0;
  -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("TapToPayScreenLock"), v10, v8, &v14);

  v13 = v14;
  if (v9)
    v9[2](v9, v13);

}

- (id)allowUserToHideForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowUserToHide")));

  return v5;
}

- (BOOL)setAllowUserToHide:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set allow user to hide (%@) for bundle identifier: %{public}@", buf, 0x16u);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("AllowUserToHide"), v8, v9, &v16);
  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (id)allowUserToLockForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attributes")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowUserToLock")));

  return v5;
}

- (BOOL)setAllowUserToLock:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set allow user to lock (%@) for bundle identifier: %{public}@", buf, 0x16u);
  }

  v16 = 0;
  v12 = -[DMDAppController _updateMetadataSettingKey:toValue:forBundleIdentifier:error:](self, "_updateMetadataSettingKey:toValue:forBundleIdentifier:error:", CFSTR("AllowUserToLock"), v8, v9, &v16);
  v13 = v16;
  v14 = v13;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)_updateMetadataSettingKey:(id)a3 toValue:(id)a4 forBundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v12));
  if (!v13)
  {
    if (!v11)
    {
      v15 = 1;
      goto LABEL_10;
    }
    v13 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Attributes")));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v10);

  v19 = 0;
  v15 = -[DMDAppController _setMetadata:forBundleIdentifier:error:](self, "_setMetadata:forBundleIdentifier:error:", v13, v12, &v19);
  v16 = v19;
  if (!v15)
  {
    if (!v16)
    {
      v17 = DMFErrorWithCodeAndUserInfo(0, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue(v17);
    }
    if (a6)
    {
      v16 = objc_retainAutorelease(v16);
      *a6 = v16;
    }
  }

LABEL_10:
  return v15;
}

- (id)configurationForBundleIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 628, CFSTR("%@ must implement %@"), v6, v8);

  return 0;
}

- (BOOL)setConfiguration:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5));
  v8 = objc_opt_class(self);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 633, CFSTR("%@ must implement %@"), v8, v10);

  return 0;
}

- (id)feedbackForBundleIdentifier:(id)a3
{
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 638, CFSTR("%@ must implement %@"), v6, v8);

  return 0;
}

- (BOOL)setFeedback:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  NSString *v9;
  void *v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5));
  v8 = objc_opt_class(self);
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 643, CFSTR("%@ must implement %@"), v8, v10);

  return 0;
}

- (BOOL)setSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = DMFAppLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Set source ID %@ for bundle identifier: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v9));
  if (v12)
  {
    v13 = v12;
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("source")));
  }
  else
  {
    if (!v8)
    {
      v16 = 1;
      goto LABEL_12;
    }
    v13 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
    v14 = v8;
  }
  v15 = v14;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("source"));
  if ((v8 == 0) != (v15 == 0) || v15 && (objc_msgSend(v8, "isEqualToString:", v15) & 1) == 0)
    objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");
  v16 = -[DMDAppController _setMetadata:forBundleIdentifier:error:](self, "_setMetadata:forBundleIdentifier:error:", v13, v9, a5);

LABEL_12:
  return v16;
}

- (id)sourceIdentifierForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source")));

  return v4;
}

+ (NSString)metadataPath
{
  return 0;
}

- (void)getBundleIdentifierForStoreItemIdentifier:(id)a3 personaIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5));
  v7 = objc_opt_class(self);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 696, CFSTR("%@ must implement %@"), v7, v9);

}

- (void)getMetadataForNonEnterpriseAppRequest:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 701, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)handleFetchRequest:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 706, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)startInstallingEnterpriseAppWithManifestURL:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 711, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)startInstallingNonEnterpriseAppForRequest:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 716, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)startRedeemingAppWithCode:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 721, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)cancelAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 726, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)resumeAppInstallationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 731, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)startUpdatingAppForRequest:(id)a3 metadata:(id)a4 completion:(id)a5
{
  uint64_t v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5));
  v7 = objc_opt_class(self);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 737, CFSTR("%@ must implement %@"), v7, v9);

}

- (void)cancelAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 742, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)resumeAppUpdateWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 747, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)startUninstallingAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = objc_opt_class(self);
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 752, CFSTR("%@ must implement %@"), v6, v8);

}

- (void)sendManagedAppsChangedNotification
{
  uint64_t v4;
  NSString *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v4 = objc_opt_class(self);
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 756, CFSTR("%@ must implement %@"), v4, v6);

}

- (void)didStartInstallingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[3];

  v6[0] = &off_1000C32D0;
  v6[1] = &off_1000C3300;
  v7[0] = &off_1000C32E8;
  v7[1] = &off_1000C32E8;
  v6[2] = &off_1000C3318;
  v7[2] = &off_1000C3330;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didFailInstallingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v6 = &off_1000C32E8;
  v7 = &off_1000C3348;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didFinishInstallingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v6 = &off_1000C32E8;
  v7 = &off_1000C3360;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didStartUpdatingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v6 = &off_1000C3360;
  v7 = &off_1000C3378;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didFinishUpdatingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v6 = &off_1000C3378;
  v7 = &off_1000C3360;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didFinishUninstallingForLifeCycle:(id)a3
{
  id v4;
  void *v5;
  _UNKNOWN **v6;
  _UNKNOWN **v7;

  v6 = &off_1000C3360;
  v7 = &off_1000C32D0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  -[DMDAppController _applyChangeInLifeCycle:stateMap:](self, "_applyChangeInLifeCycle:stateMap:", v4, v5);

}

- (void)didResetStateForLifeCycle:(id)a3 state:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a3;
  v7 = DMFAppLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v10 = 138543362;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DMDAppController::didResetStateForLifeCycle(%{public}@)", (uint8_t *)&v10, 0xCu);

  }
  -[DMDAppController _resetStateForChangeInLifeCycle:newState:](self, "_resetStateForChangeInLifeCycle:newState:", v6, a4);

}

- (NSArray)managedBundleIdentifiers
{
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100013918;
  v13 = sub_100013928;
  v14 = 0;
  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016268;
  block[3] = &unk_1000B9E30;
  block[4] = &v9;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v3, block);

  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 associatedDomains:(id)a5 enableDirectDownloads:(id)a6 configuration:(id)a7 options:(unint64_t)a8 forBundleIdentifier:(id)a9
{
  -[DMDAppController setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:](self, "setVPNUUIDString:cellularSliceUUIDString:contentFilterUUIDString:DNSProxyUUIDString:relayUUIDString:associatedDomains:enableDirectDownloads:allowUserToHide:allowUserToLock:configuration:options:sourceIdentifier:forBundleIdentifier:", a3, a4, 0, 0, 0, a5, a6, 0, 0, a7, a8, 0, a9);
}

- (void)setVPNUUIDString:(id)a3 cellularSliceUUIDString:(id)a4 contentFilterUUIDString:(id)a5 DNSProxyUUIDString:(id)a6 relayUUIDString:(id)a7 associatedDomains:(id)a8 enableDirectDownloads:(id)a9 allowUserToHide:(id)a10 allowUserToLock:(id)a11 configuration:(id)a12 options:(unint64_t)a13 sourceIdentifier:(id)a14 forBundleIdentifier:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  unsigned __int8 v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  unsigned __int8 v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  unsigned __int8 v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  unsigned __int8 v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  unsigned __int8 v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  unsigned __int8 v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  unsigned __int8 v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  unsigned __int8 v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  unsigned __int8 v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  id v66;
  uint64_t v67;
  NSObject *v68;
  unsigned __int8 v69;
  id v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  unsigned __int8 v75;
  id v76;
  uint64_t v77;
  NSObject *v78;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  uint8_t buf[4];
  id v100;

  v80 = a4;
  v19 = a5;
  v85 = a6;
  v84 = a7;
  v83 = a8;
  v82 = a9;
  v20 = a10;
  v21 = a11;
  v81 = a12;
  v22 = a14;
  v23 = a15;
  v24 = a3;
  v25 = DMFAppLog();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v100 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Set VPN UUID, associated domains, configuration, source ID, and management information for bundle identifier: %{public}@", buf, 0xCu);
  }

  v98 = 0;
  v27 = -[DMDAppController setVPNUUIDString:forBundleIdentifier:error:](self, "setVPNUUIDString:forBundleIdentifier:error:", v24, v23, &v98);

  v28 = v98;
  if ((v27 & 1) == 0)
  {
    v29 = DMFAppLog();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_100071F6C();

  }
  v97 = v28;
  v31 = -[DMDAppController setCellularSliceUUIDString:forBundleIdentifier:error:](self, "setCellularSliceUUIDString:forBundleIdentifier:error:", v80, v23, &v97, a3);
  v32 = v97;

  if ((v31 & 1) == 0)
  {
    v33 = DMFAppLog();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100071F0C();

  }
  v96 = v32;
  v35 = -[DMDAppController setContentFilterUUIDString:forBundleIdentifier:error:](self, "setContentFilterUUIDString:forBundleIdentifier:error:", v19, v23, &v96);
  v36 = v96;

  if ((v35 & 1) == 0)
  {
    v37 = DMFAppLog();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_100071EAC();

  }
  v95 = v36;
  v39 = -[DMDAppController setDNSProxyUUIDString:forBundleIdentifier:error:](self, "setDNSProxyUUIDString:forBundleIdentifier:error:", v85, v23, &v95);
  v40 = v95;

  if ((v39 & 1) == 0)
  {
    v41 = DMFAppLog();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_100071E4C();

  }
  v94 = v40;
  v43 = -[DMDAppController setRelayUUIDString:forBundleIdentifier:error:](self, "setRelayUUIDString:forBundleIdentifier:error:", v84, v23, &v94);
  v44 = v94;

  if ((v43 & 1) == 0)
  {
    v45 = DMFAppLog();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_100071DEC();

  }
  v93 = v44;
  v47 = -[DMDAppController setAssociatedDomains:forBundleIdentifier:error:](self, "setAssociatedDomains:forBundleIdentifier:error:", v83, v23, &v93);
  v48 = v93;

  if ((v47 & 1) == 0)
  {
    v49 = DMFAppLog();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_100071D8C();

  }
  v92 = v48;
  v51 = -[DMDAppController setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:](self, "setAssociatedDomainsEnableDirectDownloads:forBundleIdentifier:error:", v82, v23, &v92);
  v52 = v92;

  if ((v51 & 1) == 0)
  {
    v53 = DMFAppLog();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_100071D2C();

  }
  v91 = v52;
  v55 = -[DMDAppController setAllowUserToHide:forBundleIdentifier:error:](self, "setAllowUserToHide:forBundleIdentifier:error:", v20, v23, &v91);
  v56 = v91;

  if ((v55 & 1) == 0)
  {
    v57 = DMFAppLog();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      sub_100071CCC();

  }
  v90 = v56;
  v59 = -[DMDAppController setAllowUserToLock:forBundleIdentifier:error:](self, "setAllowUserToLock:forBundleIdentifier:error:", v21, v23, &v90);
  v60 = v90;

  if ((v59 & 1) == 0)
  {
    v61 = DMFAppLog();
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_100071C6C();

  }
  v63 = v21;
  v64 = v19;
  v89 = v60;
  v65 = -[DMDAppController setConfiguration:forBundleIdentifier:error:](self, "setConfiguration:forBundleIdentifier:error:", v81, v23, &v89);
  v66 = v89;

  if ((v65 & 1) == 0)
  {
    v67 = DMFAppLog();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_100071C0C();

  }
  v88 = v66;
  v69 = -[DMDAppController setSourceIdentifier:forBundleIdentifier:error:](self, "setSourceIdentifier:forBundleIdentifier:error:", v22, v23, &v88);
  v70 = v88;

  if ((v69 & 1) == 0)
  {
    v71 = DMFAppLog();
    v72 = objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      sub_100071BAC();

  }
  v73 = v20;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managementInformationForBundleIdentifier:](self, "managementInformationForBundleIdentifier:", v23));
  if (!v74)
    v74 = (void *)objc_opt_new(DMFAppManagementInformation);
  objc_msgSend(v74, "setOptions:", a13);
  v87 = v70;
  v75 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:](self, "setManagementInformation:forBundleIdentifier:error:", v74, v23, &v87);
  v76 = v87;

  if ((v75 & 1) == 0)
  {
    v77 = DMFAppLog();
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      sub_100071B4C();

  }
}

- (unint64_t)stateForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state")));
    v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");

  }
  else
  {
    v6 = 19;
  }

  return v6;
}

- (BOOL)setState:(unint64_t)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v8 = a4;
  v9 = DMFAppLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", a3));
    v19 = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set state: %{public}@, for bundle identifier: %{public}@", (uint8_t *)&v19, 0x16u);

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController _metadataForBundleIdentifier:](self, "_metadataForBundleIdentifier:", v8));
  if (!v12)
    v12 = -[DMDAppController _newMetadataDictionary](self, "_newMetadataDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("state")));
  v14 = v13;
  if (v13)
    v15 = (uint64_t)objc_msgSend(v13, "unsignedIntegerValue");
  else
    v15 = 19;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("state"));

  v17 = -[DMDAppController _setMetadata:forBundleIdentifier:error:](self, "_setMetadata:forBundleIdentifier:error:", v12, v8, a5);
  if (v15 != a3)
    objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");

  return v17;
}

- (void)advanceTransientStates
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  __int128 v6;
  id v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  __int128 v37;
  id obj;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];

  v3 = DMFAppLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Advance transient app states", buf, 2u);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](self, "managedBundleIdentifiers"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v39 = *(_QWORD *)v44;
    *(_QWORD *)&v6 = 138543874;
    v37 = v6;
    while (1)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managementInformationForBundleIdentifier:](self, "managementInformationForBundleIdentifier:", v10));
        v13 = (char *)objc_msgSend(v12, "state");
        if ((unint64_t)(v13 - 9) >= 3)
        {
          if (v13 == (char *)15)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v10));
            v21 = objc_msgSend(v20, "currentState");

            if (v21)
              v22 = 7;
            else
              v22 = 8;
            v41 = v8;
            v23 = -[DMDAppController setState:forBundleIdentifier:error:](self, "setState:forBundleIdentifier:error:", v22, v10, &v41, v37);
            v24 = v41;

            if ((v23 & 1) == 0)
            {
              v27 = DMFAppLog(v25, v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v22));
                *(_DWORD *)buf = v37;
                v48 = v36;
                v49 = 2114;
                v50 = v10;
                v51 = 2114;
                v52 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);

              }
            }
            goto LABEL_22;
          }
          if (v13 != (char *)18)
          {
            v24 = v8;
LABEL_22:
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unusedRedemptionCode", v37));
            if (v19)
            {
              objc_msgSend(v12, "setUnusedRedemptionCode:", 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "redemptionCode"));
              v30 = objc_msgSend(v29, "isEqualToString:", v19);

              if (v30)
                objc_msgSend(v12, "setRedemptionCode:", 0);
              v40 = v24;
              v31 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:](self, "setManagementInformation:forBundleIdentifier:error:", v12, v10, &v40);
              v15 = v40;

              if ((v31 & 1) == 0)
              {
                v34 = DMFAppLog(v32, v33);
                v35 = objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v48 = v10;
                  v49 = 2114;
                  v50 = v15;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Could not set management information for bundle identifier: %{public}@, error: %{public}@", buf, 0x16u);
                }

              }
            }
            else
            {
              v15 = v24;
            }
            goto LABEL_30;
          }
        }
        v42 = v8;
        v14 = -[DMDAppController setManagementInformation:forBundleIdentifier:error:](self, "setManagementInformation:forBundleIdentifier:error:", 0, v10, &v42, v37);
        v15 = v42;

        if ((v14 & 1) != 0)
          goto LABEL_31;
        v18 = DMFAppLog(v16, v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v48 = v10;
          v49 = 2114;
          v50 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Could not remove management information for bundle identifier: %{public}@, error: %{public}@", buf, 0x16u);
        }
LABEL_30:

LABEL_31:
        v8 = v15;

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (!v7)
        goto LABEL_35;
    }
  }
  v8 = 0;
LABEL_35:

}

- (void)_cleanUpStaleManagementStatesAndStartObservingApps
{
  DMDAppController *v2;
  uint64_t v3;
  NSObject *v4;
  _UNKNOWN **v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id obj;
  DMDAppController *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];

  v2 = self;
  v3 = DMFAppLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clean up stale app states", buf, 2u);
  }

  if (qword_1000EB700 != -1)
    dispatch_once(&qword_1000EB700, &stru_1000B9E50);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](v2, "managedBundleIdentifiers"));
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v27)
  {
    v28 = 0;
    v26 = *(_QWORD *)v31;
    v5 = DMFUser_ptr;
    v25 = v2;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v8 = objc_autoreleasePoolPush();
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managementInformationForBundleIdentifier:](v2, "managementInformationForBundleIdentifier:", v7));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMDAppLifeCycle lifeCycleForBundleIdentifier:](DMDAppLifeCycle, "lifeCycleForBundleIdentifier:", v7));
        objc_msgSend(v10, "addObserver:", v2);
        v11 = (void *)qword_1000EB6F8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[57], "numberWithUnsignedInteger:", objc_msgSend(v9, "state")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[57], "numberWithUnsignedInteger:", objc_msgSend(v10, "currentState")));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

          if (v15)
          {
            v16 = objc_msgSend(v15, "unsignedIntegerValue");
            v29 = v28;
            v17 = -[DMDAppController setState:forBundleIdentifier:error:](v2, "setState:forBundleIdentifier:error:", v16, v7, &v29);
            v18 = v29;

            if ((v17 & 1) == 0)
            {
              v21 = DMFAppLog(v19, v20);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v16));
                *(_DWORD *)buf = 138543874;
                v35 = v23;
                v36 = 2114;
                v37 = v7;
                v38 = 2114;
                v39 = v18;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not set state to %{public}@ for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);

              }
            }
          }
          else
          {
            v18 = v28;
          }

          v28 = v18;
          v2 = v25;
          v5 = DMFUser_ptr;
        }

        objc_autoreleasePoolPop(v8);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }

}

- (void)_applyChangeInLifeCycle:(id)a3 stateMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  v9 = -[DMDAppController _isManagedBundleIdentifier:](self, "_isManagedBundleIdentifier:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));

    v11 = -[DMDAppController stateForBundleIdentifier:](self, "stateForBundleIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));

    if (v13)
    {
      v16 = objc_msgSend(v13, "unsignedIntegerValue");
      v18 = DMFAppLog(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v11));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v16));
        *(_DWORD *)buf = 138543874;
        v34 = v20;
        v35 = 2114;
        v36 = v21;
        v37 = 2114;
        v38 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Observed change in life cycle from old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@", buf, 0x20u);

      }
      v32 = 0;
      v22 = -[DMDAppController setState:forBundleIdentifier:error:](self, "setState:forBundleIdentifier:error:", v16, v10, &v32);
      v23 = v32;
      v25 = v23;
      if ((v22 & 1) == 0)
      {
        v26 = DMFAppLog(v23, v24);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v16));
          *(_DWORD *)buf = 138543874;
          v34 = v31;
          v35 = 2114;
          v36 = v10;
          v37 = 2114;
          v38 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);

        }
      }
      objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");

    }
    else
    {
      v28 = DMFAppLog(v14, v15);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v11));
        *(_DWORD *)buf = 138543618;
        v34 = v30;
        v35 = 2114;
        v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Observed change in life cycle from old state: %{public}@ to missing new state for bundle identifier: %{public}@", buf, 0x16u);

      }
      objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");
    }

  }
  else
  {
    -[DMDAppController _stopObservingLifeCycle:](self, "_stopObservingLifeCycle:", v7);
    v10 = v7;
  }

}

- (void)_resetStateForChangeInLifeCycle:(id)a3 newState:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  unsigned __int8 v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  NSObject *v42;

  v6 = a3;
  v8 = DMFAppLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DMDAppController::_resetStateForChangeInLifeCycle(%{public}@)", buf, 0xCu);

  }
  if (qword_1000EB710 != -1)
    dispatch_once(&qword_1000EB710, &stru_1000B9E70);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v12 = -[DMDAppController _isManagedBundleIdentifier:](self, "_isManagedBundleIdentifier:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v14 = -[DMDAppController stateForBundleIdentifier:](self, "stateForBundleIdentifier:", v13);
    v15 = objc_msgSend((id)objc_opt_class(self), "_stateCanBeResetSafely:", v14);
    if ((_DWORD)v15)
    {
      v17 = (void *)qword_1000EB708;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));
      v20 = objc_msgSend(v19, "unsignedIntegerValue");

      v23 = DMFAppLog(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v14));
        v26 = objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v20));
        *(_DWORD *)buf = 138543874;
        v38 = v25;
        v39 = 2114;
        v40 = v26;
        v41 = 2114;
        v42 = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reset state due to change in life cycle, old state: %{public}@ to new state: %{public}@ for bundle identifier: %{public}@", buf, 0x20u);

      }
      v36 = 0;
      v27 = -[DMDAppController setState:forBundleIdentifier:error:](self, "setState:forBundleIdentifier:error:", v20, v13, &v36);
      v28 = v36;
      v30 = v28;
      if ((v27 & 1) == 0)
      {
        v31 = DMFAppLog(v28, v29);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v20));
          *(_DWORD *)buf = 138543874;
          v38 = v35;
          v39 = 2114;
          v40 = v13;
          v41 = 2114;
          v42 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Could not set new state: %{public}@, for bundle identifier: %{public}@, error: %{public}@", buf, 0x20u);

        }
      }
    }
    else
    {
      v33 = DMFAppLog(v15, v16);
      v30 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[DMFAppManagementInformation stringForState:](DMFAppManagementInformation, "stringForState:", v14));
        *(_DWORD *)buf = 138543618;
        v38 = v34;
        v39 = 2114;
        v40 = v13;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Reset state due to change in life cycle, old state preserved: %{public}@, for bundle identifier: %{public}@", buf, 0x16u);

      }
    }

    objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");
  }
  else
  {
    -[DMDAppController _stopObservingLifeCycle:](self, "_stopObservingLifeCycle:", v6);
  }

}

+ (BOOL)_stateCanBeResetSafely:(unint64_t)a3
{
  return (a3 > 0x11) | (0x1CFE7u >> a3) & 1;
}

- (BOOL)_isManagedBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController managedBundleIdentifiers](self, "managedBundleIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self == %@"), v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v9 = v8 != 0;

  return v9;
}

- (void)_stopObservingLifeCycle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v6 = DMFAppLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing lifecycle observer for an app that is no longer managed: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend((id)objc_opt_class(self), "_sendAppStatusChangeNotification");

}

+ (void)_sendAppStatusChangeNotification
{
  notify_post((const char *)objc_msgSend(DMFAppStatusDidChangeNotificationName, "UTF8String"));
}

- (id)_metadataForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100013918;
  v18 = sub_100013928;
  v19 = 0;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017FC0;
  v9[3] = &unk_1000B9E98;
  v11 = &v14;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, v9);

  v7 = (id)v15[5];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)_setMetadata:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  __int128 *p_buf;
  id v23;
  id location;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  __int128 buf;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v11 = DMFAppLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set metadata for bundle identifier: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x3032000000;
  v31 = sub_100013918;
  v32 = sub_100013928;
  v33 = 0;
  objc_initWeak(&location, self);
  v13 = objc_claimAutoreleasedReturnValue(-[DMDAppController queue](self, "queue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100018264;
  v18[3] = &unk_1000B9EC0;
  objc_copyWeak(&v23, &location);
  v14 = v9;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  v21 = &v25;
  p_buf = &buf;
  dispatch_sync(v13, v18);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v16 = *((_BYTE *)v26 + 24) != 0;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v25, 8);
  return v16;
}

- (id)_metadataByBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAppController manifest](self, "manifest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("metadataByBundleID")));

  return v3;
}

- (id)_newMetadataDictionary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Attributes"));

  return v2;
}

- (void)_getEnterpriseAppMetadataForManifestURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;

  v7 = a3;
  v8 = a4;
  v10 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 1224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifestURL"));

    if (v10)
      goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAppController.m"), 1225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v11 = DMFAppLog(v8, v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
    *(_DWORD *)buf = 138543362;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Get metadata for manifest URL from: %{public}@", buf, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v15));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001861C;
  v21[3] = &unk_1000B9EE8;
  v21[4] = self;
  v22 = v10;
  v17 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataTaskWithRequest:completionHandler:", v14, v21));
  objc_msgSend(v18, "resume");

}

- (void)_getEnterpriseAppMetadataFromData:(id)a3 completion:(id)a4
{
  void (**v5)(id, DMDAppMetadata *, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  DMDAppMetadata *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = (void (**)(id, DMDAppMetadata *, _QWORD))a4;
  v29 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, 0, &v29));
  v7 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items")));
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && objc_msgSend(v8, "count"))
    {
      if ((unint64_t)objc_msgSend(v8, "count") < 2)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        v14 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("metadata")));
          v16 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kind")));
            v18 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0
              && (objc_msgSend(v17, "isEqualToString:", CFSTR("software")) & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("bundle-identifier")));
              v20 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("title")));
                v22 = objc_opt_class(NSString);
                if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
                {
                  v23 = objc_opt_new(DMDAppMetadata);
                  -[DMDAppMetadata setBundleIdentifier:](v23, "setBundleIdentifier:", v19);
                  -[DMDAppMetadata setStoreItemIdentifier:](v23, "setStoreItemIdentifier:", 0);
                  -[DMDAppMetadata setDisplayName:](v23, "setDisplayName:", v21);
                  -[DMDAppMetadata setIsStoreApp:](v23, "setIsStoreApp:", 0);
                  -[DMDAppMetadata setIsFree:](v23, "setIsFree:", 0);
                  -[DMDAppMetadata setIsUserLicensed:](v23, "setIsUserLicensed:", 0);
                  v5[2](v5, v23, 0);
                }
                else
                {
                  v28 = DMFErrorWithCodeAndUserInfo(2604, 0);
                  v23 = (DMDAppMetadata *)objc_claimAutoreleasedReturnValue(v28);
                  ((void (**)(id, DMDAppMetadata *, DMDAppMetadata *))v5)[2](v5, 0, v23);
                }

              }
              else
              {
                v27 = DMFErrorWithCodeAndUserInfo(2604, 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue(v27);
                ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v21);
              }

            }
            else
            {
              v26 = DMFErrorWithCodeAndUserInfo(2604, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue(v26);
              ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v19);
            }

          }
          else
          {
            v25 = DMFErrorWithCodeAndUserInfo(2604, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v25);
            ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v17);
          }

        }
        else
        {
          v24 = DMFErrorWithCodeAndUserInfo(2604, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v24);
          ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v15);
        }

        goto LABEL_9;
      }
      v10 = 2609;
    }
    else
    {
      v10 = 2604;
    }
    v12 = DMFErrorWithCodeAndUserInfo(v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v13);
LABEL_9:

    goto LABEL_10;
  }
  v11 = DMFErrorWithCodeAndUserInfo(2604, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v11);
  ((void (**)(id, DMDAppMetadata *, void *))v5)[2](v5, 0, v8);
LABEL_10:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)manifest
{
  return self->_manifest;
}

- (DMFOSStateHandler)stateHandler
{
  return self->_stateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
