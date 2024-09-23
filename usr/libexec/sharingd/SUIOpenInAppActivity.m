@implementation SUIOpenInAppActivity

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (id)ss_activityTypeToReportToHost
{
  return CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication");
}

- (id)ss_activitySpecificExtensionItemDataRequestInfo
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationIdentifier](self, "applicationIdentifier"));
  v3 = _UISUIActivitySpecificMetadataForOpeningDocumentWithApplicationID();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

+ (Class)classForOpenInPlaceActivity
{
  return (Class)objc_opt_class(SUIOpenInPlaceAppActivity, a2);
}

+ (Class)classForOpenByCopyActivity
{
  return (Class)objc_opt_class(SUIOpenCopyAppActivity, a2);
}

- (SUIOpenInAppActivity)initWithApplicationProxy:(id)a3 documentProxy:(id)a4 isContentManaged:(BOOL)a5 sourceApplicationAuditTokenData:(id)a6 appIsDocumentTypeOwner:(BOOL)a7 supportedTypeIdentifiers:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SUIOpenInAppActivity *v22;
  SUIOpenInAppActivity *v23;
  id v24;
  void *v26;
  uint64_t v27;
  objc_super v28;

  v9 = a7;
  v11 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v20 = objc_opt_class(self, v19);
  if (v20 == objc_opt_class(SUIOpenInAppActivity, v21))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUIOpenInAppActivity.m"), 89, CFSTR("%@ is an abstract class, use one of the concrete implementation classes instead"), objc_opt_class(self, v27));

  }
  v28.receiver = self;
  v28.super_class = (Class)SUIOpenInAppActivity;
  v22 = -[SUIOpenInAppActivity init](&v28, "init");
  v23 = v22;
  if (v22)
  {
    -[SUIOpenInAppActivity setApplicationProxy:](v22, "setApplicationProxy:", v15);
    -[SUIOpenInAppActivity setDocumentProxy:](v23, "setDocumentProxy:", v16);
    -[SUIOpenInAppActivity setIsContentManaged:](v23, "setIsContentManaged:", v11);
    -[SUIOpenInAppActivity setSourceApplicationAuditTokenData:](v23, "setSourceApplicationAuditTokenData:", v17);
    -[SUIOpenInAppActivity _setAppIsDocumentTypeOwner:](v23, "_setAppIsDocumentTypeOwner:", v9);
    v24 = objc_msgSend(v18, "copy");
    -[SUIOpenInAppActivity setSupportedTypeIdentifiers:](v23, "setSupportedTypeIdentifiers:", v24);

  }
  return v23;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (NSString)applicationIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationIdentifier"));

  return (NSString *)v3;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUIOpenInAppActivity;
  v3 = -[SUIOpenInAppActivity description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity activityTitle](self, "activityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ '%@'"), v4, v5));

  return (NSString *)v6;
}

+ (id)openInActivitiesForItems:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _OWORD v27[4];
  void *v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];

  v8 = a6;
  v9 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100719DF8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v15));

  if (objc_msgSend(v16, "count"))
  {

    v13 = 0;
  }
  else
  {
    memset(v27, 0, sizeof(v27));
    if (objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v27, v31, 16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", **((_QWORD **)&v27[0] + 1)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferredFilenameExtension"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fake.%@"), v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v19, 0));

      v21 = share_sheet_log();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: using fake fileURL:%@", buf, 0xCu);
      }

      v28 = v20;
      v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));

      v16 = (void *)v23;
    }
  }
  if (objc_msgSend(v16, "count"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_activitiesForFileURL:isContentManaged:sourceApplicationAuditTokenData:includeSourceApplicationInResults:supportedTypeIdentifiers:", v24, v9, v12, v8, v13));

  }
  else
  {
    v25 = &__NSArray0__struct;
  }

  return v25;
}

- (void)_performLaunchServicesOpenWithDocumentOpenURL:(id)a3 launchServiceOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;

  v7 = a4;
  v8 = a3;
  v9 = _UIActivityDefaultOpenApplicationLaunchServiceOptions();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addEntriesFromDictionary:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity sourceApplicationAuditTokenData](self, "sourceApplicationAuditTokenData"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity sourceApplicationAuditTokenData](self, "sourceApplicationAuditTokenData"));
    v14 = sub_1001A3D38(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15)
    {
      v16 = v11;
      v17 = UIApplicationLaunchOptionsSourceApplicationKey;
      v18 = v15;
      if (v17)
      {
        v19 = LSOpenApplicationPayloadOptionsKey;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", LSOpenApplicationPayloadOptionsKey));
        v22 = objc_opt_class(NSMutableDictionary, v21);
        if ((objc_opt_isKindOfClass(v20, v22) & 1) == 0)
        {
          if (v20)
          {
            v23 = objc_msgSend(v20, "mutableCopy");

            v20 = v23;
          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v19);
        }
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v17);

      }
    }

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity openURLAnnotationsByURL](self, "openURLAnnotationsByURL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v8));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", LSFileProviderStringKey));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationProxy applicationIdentifier](self->_applicationProxy, "applicationIdentifier"));
  v29 = -[SUIOpenInAppActivity isContentManaged](self, "isContentManaged");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity sourceApplicationAuditTokenData](self, "sourceApplicationAuditTokenData")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v8, v28, v26, v29, objc_msgSend(v30, "bytes"), v25, v11, self));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001A3D5C;
  v35[3] = &unk_1007146D8;
  v35[4] = self;
  objc_msgSend(v31, "setCompletionBlock:", v35);
  v32 = share_sheet_log();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationProxy applicationIdentifier](self->_applicationProxy, "applicationIdentifier"));
    *(_DWORD *)buf = 138412546;
    v37 = v34;
    v38 = 2112;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: Performing open using application %@ with options %@", buf, 0x16u);

  }
  objc_msgSend(v31, "start");

}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v4 = a4;
  v5 = share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SUIOpenInAppActivity openResourceOperation:didFailWithError:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)openInPlaceWillHandlePromiseURLs
{
  return 1;
}

- (void)performLaunchServicesInPlaceOpenWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char CanOpenInPlaceByReferenceOriginalFile;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (*v14)(uint64_t, uint64_t, void *);
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity documentProxy](self, "documentProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  CanOpenInPlaceByReferenceOriginalFile = _UIApplicationCanOpenInPlaceByReferenceOriginalFile(v6, v8);

  if ((CanOpenInPlaceByReferenceOriginalFile & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUIOpenInAppActivity.m"), 256, CFSTR("unexpected state for open using _FPExtendBookmarkForDocumentURL"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity documentProxy](self, "documentProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001A4010;
  v18[3] = &unk_100719E48;
  v19 = v11;
  v20 = v5;
  v18[4] = self;
  v14 = (void (*)(uint64_t, uint64_t, void *))off_1007B3338;
  v15 = v11;
  v16 = v5;
  v14((uint64_t)v15, (uint64_t)v13, v18);

}

- (BOOL)openByImportWillHandlePromiseURLs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity documentProxy](self, "documentProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
  LOBYTE(v3) = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v5, v4);

  return (char)v3;
}

- (void)performLaunchServicesImportOpenWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int CanOpenInPlaceByCopyingFromOriginalFile;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity documentProxy](self, "documentProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
  CanOpenInPlaceByCopyingFromOriginalFile = _UIApplicationCanOpenInPlaceByCopyingFromOriginalFile(v8, v7);

  if (CanOpenInPlaceByCopyingFromOriginalFile)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
    v11 = objc_msgSend(v10, "supportsOpenInPlace");

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUIOpenInAppActivity.m"), 285, CFSTR("When a URL and app both support open-in-place, performLaunchServicesInPlaceOpenWithCompletion: should be used"));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity _bookmarkWithSandboxExtensionForExport](self, "_bookmarkWithSandboxExtensionForExport"));
    v15[0] = LSFileProviderStringKey;
    v15[1] = LSRequireOpenInPlaceKey;
    v16[0] = v12;
    v16[1] = &__kCFBooleanFalse;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

  }
  else
  {
    v13 = 0;
  }
  -[SUIOpenInAppActivity _performLaunchServicesOpenWithDocumentOpenURL:launchServiceOptions:completion:](self, "_performLaunchServicesOpenWithDocumentOpenURL:launchServiceOptions:completion:", v7, v13, v5);

}

- (id)_bookmarkWithSandboxExtensionForExport
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity documentProxy](self, "documentProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity securityContext](self, "securityContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A44C4;
  v11[3] = &unk_100719E70;
  v6 = v4;
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "securityScopedResourcesMatchingPredicate:", v11));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookmarkExportDataEncodedAsString"));
  if (!v9)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ui_bookmarkForExportWithError:", 0));

  return v9;
}

+ (Class)classForPreparingExtensionItemData
{
  return (Class)objc_opt_class(_UIOpenInAppActivityDataProvider, a2);
}

- (void)prepareWithActivityItemData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "securityContexts", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10), "securityScopedResources"));
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(objc_alloc((Class)UISUISecurityContext), "initWithSecurityScopedResources:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "openURLAnnotationsByURL"));
  -[SUIOpenInAppActivity setOpenURLAnnotationsByURL:](self, "setOpenURLAnnotationsByURL:", v13);

  -[SUIOpenInAppActivity setSecurityContext:](self, "setSecurityContext:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity securityContext](self, "securityContext"));
  objc_msgSend(v14, "activate");

  v15 = sub_1001A472C(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[SUIOpenInAppActivity prepareWithActivityItems:](self, "prepareWithActivityItems:", v16);

}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  SUIOpenInAppActivity *v21;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;
  uint64_t v41;

  v21 = self;
  v22 = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "extensionItems"));
  v4 = dispatch_group_create();
  v40 = NSItemProviderOptionsDispatchModeKey;
  v41 = NSItemProviderOptionsDispatchModeAsynchronous;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(obj);
        v26 = v7;
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachments", v21));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v14, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.ShareUI.openURL.supplementalSecurityContext")))
              {
                dispatch_group_enter(v4);
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_1001A59C8;
                v27[3] = &unk_100719EE0;
                v28 = v6;
                v29 = v4;
                objc_msgSend(v14, "loadItemForTypeIdentifier:options:completionHandler:", CFSTR("com.apple.ShareUI.openURL.supplementalSecurityContext"), v5, v27);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v11);
        }

        v7 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v25);
  }

  v15 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v15);

  v16 = objc_msgSend(objc_alloc((Class)UISUISecurityContext), "initWithSecurityScopedResources:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "openURLAnnotationsByURL"));
  -[SUIOpenInAppActivity setOpenURLAnnotationsByURL:](v21, "setOpenURLAnnotationsByURL:", v17);

  -[SUIOpenInAppActivity setSecurityContext:](v21, "setSecurityContext:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity securityContext](v21, "securityContext"));
  objc_msgSend(v18, "activate");

  v19 = sub_1001A472C(v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[SUIOpenInAppActivity prepareWithActivityItems:](v21, "prepareWithActivityItems:", v20);

}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUIOpenInAppActivity;
  -[SUIOpenInAppActivity activityDidFinish:items:error:](&v7, "activityDidFinish:items:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity securityContext](self, "securityContext"));
  objc_msgSend(v6, "deactivate");

}

+ (int64_t)activityCategory
{
  return 1;
}

- (int64_t)_defaultSortGroup
{
  return 5;
}

- (id)_activityImage
{
  return +[UIImage _iconForResourceProxy:format:](UIImage, "_iconForResourceProxy:format:", self->_applicationProxy, 10);
}

- (id)_activitySettingsImage
{
  return +[UIImage _iconForResourceProxy:format:](UIImage, "_iconForResourceProxy:format:", self->_applicationProxy, 0);
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity supportedTypeIdentifiers](self, "supportedTypeIdentifiers"));

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity _firstMatchingDocumentProxyForActivityItems:](self, "_firstMatchingDocumentProxyForActivityItems:", v4));
    v6 = v7 != 0;

  }
  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  LSDocumentProxy *v4;
  LSDocumentProxy *documentProxy;

  v4 = (LSDocumentProxy *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity _firstMatchingDocumentProxyForActivityItems:](self, "_firstMatchingDocumentProxyForActivityItems:", a3));
  documentProxy = self->_documentProxy;
  self->_documentProxy = v4;

}

- (id)activityType
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationIdentifier](self, "applicationIdentifier"));
  v3 = _UISUIActivityRealActivityTypeForOpeningDocumentWithApplicationID();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

+ (id)_activitiesForFileURL:(id)a3 isContentManaged:(BOOL)a4 sourceApplicationAuditTokenData:(id)a5 includeSourceApplicationInResults:(BOOL)a6 supportedTypeIdentifiers:(id)a7
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  id v15;
  unsigned int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  NSMutableArray *v38;
  void *v41;
  _QWORD v42[4];
  id v43;
  NSMutableArray *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  BOOL v49;
  uint64_t v50;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a7;
  v14 = objc_opt_new(NSMutableArray);
  v15 = v11;
  v16 = objc_msgSend(v15, "isFileURL");
  v17 = v15;
  v18 = v17;
  v19 = v17;
  if (v16)
  {
    if (_UIIsIWorkArchiveURL(v17))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v21 = _UIStringByDeletingArchiveExtensions();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLByDeletingLastPathComponent"));
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathComponent:", v22));

    }
    else
    {
      v19 = v18;
    }

  }
  v24 = sub_1001A4FB8(v19, v10, v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v41 = v19;
  if (a6)
  {
    v26 = 0;
LABEL_10:
    v29 = &__NSArray0__struct;
    goto LABEL_11;
  }
  v27 = sub_1001A3D38(v12);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v26 = (void *)v28;
  if (!v28)
    goto LABEL_10;
  v50 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
LABEL_11:
  v30 = sub_1001A4FB8(v18, v10, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1001A5028;
  v42[3] = &unk_100719E98;
  v43 = v18;
  v32 = v14;
  v47 = v13;
  v48 = a1;
  v44 = v32;
  v45 = v31;
  v49 = v10;
  v46 = v12;
  v33 = v13;
  v34 = v12;
  v35 = v31;
  v36 = v18;
  _UIEnumerateApplicationsInPreferredOrderForOpeningDocument(v25, v29, v42);
  v37 = v47;
  v38 = v32;

  return v38;
}

- (id)_firstMatchingDocumentProxyForActivityItems:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  int *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  __int128 v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  SUIOpenInAppActivity *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v51;
    v10 = NSLocale_ptr;
    v11 = &OBJC_IVAR___SDBonjourBrowser__maxServices;
    *(_QWORD *)&v7 = 138412802;
    v39 = v7;
    v43 = v4;
    v44 = self;
    v40 = *(_QWORD *)v51;
    while (2)
    {
      v12 = 0;
      v41 = v8;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v12);
        v14 = objc_opt_class(v10[30], v6);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          v15 = v13;
          if (objc_msgSend(v15, "isFileURL"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathExtension"));
            v17 = v11[508];
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.isa + v17), "URL"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathExtension"));
            v20 = objc_msgSend(v16, "caseInsensitiveCompare:", v19);

            if (!v20)
            {
              v38 = sub_1001A4FB8(v15, self->_isContentManaged, self->_sourceApplicationAuditTokenData);
              v35 = (void *)objc_claimAutoreleasedReturnValue(v38);
LABEL_25:

              goto LABEL_27;
            }
            v42 = v17;
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            obj = (id)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity supportedTypeIdentifiers](self, "supportedTypeIdentifiers"));
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v47;
              while (2)
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v47 != v23)
                    objc_enumerationMutation(obj);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), v39));
                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pathExtension"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:](UTType, "typeWithFilenameExtension:", v26));

                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "preferredFilenameExtension"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "preferredFilenameExtension"));
                  v30 = objc_msgSend(v28, "isEqual:", v29);

                  if ((v30 & 1) != 0)
                  {
                    v36 = sub_1001A4FB8(v15, v44->_isContentManaged, v44->_sourceApplicationAuditTokenData);
                    v35 = (void *)objc_claimAutoreleasedReturnValue(v36);

                    v4 = v43;
                    goto LABEL_25;
                  }

                }
                v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                if (v22)
                  continue;
                break;
              }
            }

            v31 = share_sheet_log();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v44->super.super.isa + v42), "URL"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity supportedTypeIdentifiers](v44, "supportedTypeIdentifiers"));
              *(_DWORD *)buf = v39;
              v55 = v15;
              v56 = 2112;
              v57 = v33;
              v58 = 2112;
              v59 = v34;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SUIOpenInAppActivity: didn't find a matching document proxy for url:%@ documentProxy.URL:%@ supportedTypeIdentifiers:%@", buf, 0x20u);

            }
            v4 = v43;
            self = v44;
            v9 = v40;
            v8 = v41;
            v10 = NSLocale_ptr;
            v11 = &OBJC_IVAR___SDBonjourBrowser__maxServices;
          }

        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v8);
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      v35 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v35 = 0;
  }
LABEL_27:

  return v35;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (LSDocumentProxy)documentProxy
{
  return self->_documentProxy;
}

- (void)setDocumentProxy:(id)a3
{
  objc_storeStrong((id *)&self->_documentProxy, a3);
}

- (UISUISecurityContext)securityContext
{
  return self->_securityContext;
}

- (void)setSecurityContext:(id)a3
{
  objc_storeStrong((id *)&self->_securityContext, a3);
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (NSData)sourceApplicationAuditTokenData
{
  return self->_sourceApplicationAuditTokenData;
}

- (void)setSourceApplicationAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationAuditTokenData, a3);
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, a3);
}

- (BOOL)_appIsDocumentTypeOwner
{
  return self->_appIsDocumentTypeOwner;
}

- (void)_setAppIsDocumentTypeOwner:(BOOL)a3
{
  self->_appIsDocumentTypeOwner = a3;
}

- (void)setApplicationProxy:(id)a3
{
  objc_storeStrong((id *)&self->_applicationProxy, a3);
}

- (NSOrderedSet)supportedTypeIdentifiers
{
  return self->_supportedTypeIdentifiers;
}

- (void)setSupportedTypeIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationAuditTokenData, 0);
  objc_storeStrong((id *)&self->_securityContext, 0);
  objc_storeStrong((id *)&self->_documentProxy, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (id)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = sub_1001A5A48((uint64_t)self, (uint64_t)a2);
  NSRequestConcreteImplementation(v3, v2, v4);
  return &stru_10072FE60;
}

- (void)performActivity
{
  uint64_t v2;

  sub_1001A5A48((uint64_t)self, (uint64_t)a2);
  NSRequestConcreteImplementation(v2);
}

@end
