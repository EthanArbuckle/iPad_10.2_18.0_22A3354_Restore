@implementation MFDiagnosticExtension

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002874;
  block[3] = &unk_100004170;
  block[4] = a1;
  if (qword_100008670 != -1)
    dispatch_once(&qword_100008670, block);
  return (OS_os_log *)(id)qword_100008668;
}

- (void)dealloc
{
  objc_super v3;

  -[MFDiagnosticExtension setDaemonInterface:](self, "setDaemonInterface:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFDiagnosticExtension;
  -[MFDiagnosticExtension dealloc](&v3, "dealloc");
}

- (EMDaemonInterface)daemonInterface
{
  EMDaemonInterface *daemonInterface;
  EMDaemonInterface *v4;
  EMDaemonInterface *v5;

  daemonInterface = self->_daemonInterface;
  if (!daemonInterface)
  {
    v4 = (EMDaemonInterface *)objc_alloc_init((Class)EMDaemonInterface);
    v5 = self->_daemonInterface;
    self->_daemonInterface = v4;

    daemonInterface = self->_daemonInterface;
  }
  return daemonInterface;
}

- (id)requestDiagnostics:(id)a3 isSensitiveCollectionAllowed:(BOOL)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;

  LODWORD(v4) = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting diagnostics...", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.taptoradard")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.TapToRadar")))
  {
    v4 = v4;
  }
  else
  {
    v4 = 0;
  }
  v9 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting diagnostics using options %lu", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFDiagnosticExtension daemonInterface](self, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "diagnosticInfoGatherer"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002BE8;
  v15[3] = &unk_100004198;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v11, "gatherDiagnosticsWithOptions:completionHandler:", v4, v15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future"));
  return v13;
}

- (id)_attachmentForURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v3));
  else
    v4 = 0;

  return v4;
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  NSObject *v20;
  unsigned int v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  uint8_t v32[4];
  id v33;
  __int16 v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v23 = a3;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DEExtensionHostAppKey")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamConsentProvidedKey")));

  v5 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v25;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Host Application: %{public}@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFDiagnosticExtension requestDiagnostics:isSensitiveCollectionAllowed:](self, "requestDiagnostics:isSensitiveCollectionAllowed:", v25, v4 != 0));
  v31 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resultWithTimeout:error:", &v31, 120.0));
  v8 = v31;

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100003148((uint64_t)v8, v9);

    v10 = 0;
    v11 = &__NSArray0__struct;
  }
  else
  {
    v12 = objc_msgSend(v24, "startAccessingSecurityScopedResource");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = v12;
    v30 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v24, 0, 0, &v30));
    v10 = v30;

    if (v10)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
        sub_1000030E4(v15, (uint64_t)v10, buf, v14);
      }
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v8;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFDiagnosticExtension _attachmentForURL:](self, "_attachmentForURL:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v19, "setDeleteOnAttach:", &__kCFBooleanTrue);
            objc_msgSend(v6, "ef_addOptionalObject:", v19);

          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        }
        while (v16);
      }
    }

    if (v22)
      objc_msgSend(v24, "stopAccessingSecurityScopedResource");
    v20 = objc_claimAutoreleasedReturnValue(+[MFDiagnosticExtension log](MFDiagnosticExtension, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412546;
      v33 = v23;
      v34 = 2112;
      v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "attachmentsForParameters:%@ %@", v32, 0x16u);
    }

    v11 = v6;
  }

  return v11;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
}

@end
