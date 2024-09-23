@implementation MSDComponentBuilder

- (MSDComponentBuilder)initWithSignedManifest:(id)a3 andOptions:(id)a4
{
  id v6;
  id v7;
  MSDComponentBuilder *v8;
  MSDComponentBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSDComponentBuilder;
  v8 = -[MSDComponentBuilder init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDComponentBuilder setSignedManifest:](v8, "setSignedManifest:", v6);
    -[MSDComponentBuilder setIsCriticalUpdate:](v9, "setIsCriticalUpdate:", 0);
    -[MSDComponentBuilder setForBackgroundDownload:](v9, "setForBackgroundDownload:", 0);
    -[MSDComponentBuilder setVerifyHashBeforeStaging:](v9, "setVerifyHashBeforeStaging:", 0);
    -[MSDComponentBuilder setAppItemToDefer:](v9, "setAppItemToDefer:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("IsCriticalUpdate")));
    v11 = v10;
    if (v10)
      -[MSDComponentBuilder setIsCriticalUpdate:](v9, "setIsCriticalUpdate:", objc_msgSend(v10, "BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ForBackgroundDownload")));
    v13 = v12;
    if (v12)
      -[MSDComponentBuilder setForBackgroundDownload:](v9, "setForBackgroundDownload:", objc_msgSend(v12, "BOOLValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("VerifyHashBeforeStaging")));
    v15 = v14;
    if (v14)
      -[MSDComponentBuilder setVerifyHashBeforeStaging:](v9, "setVerifyHashBeforeStaging:", objc_msgSend(v14, "BOOLValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("AppItemToDefer")));
    if (v16)
      -[MSDComponentBuilder setAppItemToDefer:](v9, "setAppItemToDefer:", v16);

  }
  return v9;
}

- (id)buildComponentsNotInManifest
{
  MSDOperationBuilder *v3;
  void *v4;
  MSDOperationBuilder *v5;
  id v6;
  void *v7;
  id v8;

  v3 = [MSDOperationBuilder alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v5 = -[MSDOperationBuilder initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:](v3, "initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:", v4, -[MSDComponentBuilder forBackgroundDownload](self, "forBackgroundDownload"), -[MSDComponentBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));

  v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder _buildAppComponentsNotInManifest:](self, "_buildAppComponentsNotInManifest:", v5));
  if (v7)
  {
    objc_msgSend(v6, "addObjectsFromArray:", v7);
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildComponentsFromManifest
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MSDOperationBuilder *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  MSDComponentBuilder *v24;
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];
  MSDOperationBuilder *v47;

  v3 = -[MSDComponentBuilder isCriticalUpdate](self, "isCriticalUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "criticalComponents"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installationOrder"));
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "installedApps"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "getVersion")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](MSDProgressUpdater, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleInProgress"));

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_10002ED70;
  v46[4] = sub_10002ED80;
  v14 = [MSDOperationBuilder alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v47 = -[MSDOperationBuilder initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:](v14, "initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:", v15, -[MSDComponentBuilder forBackgroundDownload](self, "forBackgroundDownload"), -[MSDComponentBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_10002ED70;
  v44 = sub_10002ED80;
  v45 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10002ED70;
  v38 = sub_10002ED80;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002ED88;
  v21[3] = &unk_10013E2F8;
  v16 = v11;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  v24 = self;
  v26 = v46;
  v18 = v9;
  v25 = v18;
  v27 = &v34;
  v28 = &v40;
  v29 = &v30;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);
  if (*((_BYTE *)v31 + 24))
  {
    if (v35[5])
      objc_msgSend((id)v41[5], "addObject:");
    v19 = objc_msgSend((id)v41[5], "copy");
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v46, 8);

  return v19;
}

- (id)_buildAppComponentsNotInManifest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  MSDComponent *v23;
  MSDComponent *v24;
  id v25;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAppList"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "installedApps"));

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Building components for removing app not in manifest...", buf, 2u);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v38;
    *(_QWORD *)&v14 = 138543362;
    v36 = v14;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v18, v36, (_QWORD)v37));

        if (!v19)
        {
          v20 = sub_1000604F0();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v36;
            v42 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Building component for removing app: %{public}@", buf, 0xCu);
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildAppRemovalOperationsWithIdentifier:", v18));
          if (!v22
            || (v23 = -[MSDComponent initWithName:andOperations:]([MSDComponent alloc], "initWithName:andOperations:", v18, v22)) == 0)
          {

            v27 = sub_1000604F0();
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              sub_1000BBB8C(v28, v29, v30, v31, v32, v33, v34, v35);

            v25 = 0;
            goto LABEL_17;
          }
          v24 = v23;
          -[MSDComponent setForRemoval:](v23, "setForRemoval:", 1);
          objc_msgSend(v5, "addObject:", v24);

        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v15)
        continue;
      break;
    }
  }

  v25 = v5;
LABEL_17:

  return v25;
}

- (BOOL)isCriticalUpdate
{
  return self->_isCriticalUpdate;
}

- (void)setIsCriticalUpdate:(BOOL)a3
{
  self->_isCriticalUpdate = a3;
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (NSString)appItemToDefer
{
  return self->_appItemToDefer;
}

- (void)setAppItemToDefer:(id)a3
{
  objc_storeStrong((id *)&self->_appItemToDefer, a3);
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
  objc_storeStrong((id *)&self->_signedManifest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedManifest, 0);
  objc_storeStrong((id *)&self->_appItemToDefer, 0);
}

@end
