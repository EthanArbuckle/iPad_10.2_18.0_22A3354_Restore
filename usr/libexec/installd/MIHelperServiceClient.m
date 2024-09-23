@implementation MIHelperServiceClient

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034AE4;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFC0 != -1)
    dispatch_once(&qword_10009DFC0, block);
  return (id)qword_10009DFC8;
}

- (void)_invalidateObject
{
  void *v2;
  MIHelperServiceClient *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](obj, "xpcConnection"));
  objc_msgSend(v2, "invalidate");

  -[MIHelperServiceClient setXpcConnection:](obj, "setXpcConnection:", 0);
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[MIHelperServiceClient _invalidateObject](self, "_invalidateObject");
  v3.receiver = self;
  v3.super_class = (Class)MIHelperServiceClient;
  -[MIHelperServiceClient dealloc](&v3, "dealloc");
}

- (id)_sharedConnection
{
  MIHelperServiceClient *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));

  if (v3)
    goto LABEL_4;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.MobileInstallationHelperService"));
  -[MIHelperServiceClient setXpcConnection:](v2, "setXpcConnection:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
  if (v5)
  {
    v6 = sub_100008058();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    objc_msgSend(v8, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, v2);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100034DC8;
    v15[3] = &unk_100085788;
    objc_copyWeak(&v16, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    objc_msgSend(v9, "setInterruptionHandler:", v15);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100034DF4;
    v13[3] = &unk_100085788;
    objc_copyWeak(&v14, &location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    objc_msgSend(v10, "setInvalidationHandler:", v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
    objc_msgSend(v11, "resume");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient xpcConnection](v2, "xpcConnection"));
  }
  objc_sync_exit(v2);

  return v5;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _sharedConnection](self, "_sharedConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4));
  }
  else
  {
    v9 = sub_100010E50((uint64_t)"-[MIHelperServiceClient _remoteObjectProxyWithErrorHandler:]", 85, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to get XPC connection"), v6, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v4[2](v4, v10);

    v8 = 0;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _sharedConnection](self, "_sharedConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4));
  }
  else
  {
    v9 = sub_100010E50((uint64_t)"-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:]", 96, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to get XPC connection"), v6, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v4[2](v4, v10);

    v8 = 0;
  }

  return v8;
}

- (BOOL)migrateMobileContentWithError:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000350AC;
  v14 = sub_1000350BC;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000350C4;
  v9[3] = &unk_1000857B0;
  v9[4] = &v10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v9));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003512C;
  v8[3] = &unk_1000857B0;
  v8[4] = &v10;
  objc_msgSend(v4, "migrateMobileContentWithCompletion:", v8);

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = objc_retainAutorelease(v5);
    v5 = (void *)v11[5];
  }
  v6 = v5 == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)wipeStagingRootAndSetUpPerUserDataDirWithError:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000350AC;
  v14 = sub_1000350BC;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035260;
  v9[3] = &unk_1000857B0;
  v9[4] = &v10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v9));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000352C8;
  v8[3] = &unk_1000857B0;
  v8[4] = &v10;
  objc_msgSend(v4, "wipeStagingRootAndSetUpPerUserDataDirWithCompletion:", v8);

  v5 = (void *)v11[5];
  if (a3 && v5)
  {
    *a3 = objc_retainAutorelease(v5);
    v5 = (void *)v11[5];
  }
  v6 = v5 == 0;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)stageItemAtURL:(id)a3 options:(id)a4 containedSymlink:(BOOL *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  id v15;
  _QWORD v17[7];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1000350AC;
  v33 = sub_1000350BC;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000350AC;
  v27 = sub_1000350BC;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000354CC;
  v18[3] = &unk_1000857B0;
  v18[4] = &v23;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v18));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100035534;
  v17[3] = &unk_1000857D8;
  v17[4] = &v23;
  v17[5] = &v29;
  v17[6] = &v19;
  objc_msgSend(v12, "stageItemAtURL:options:completion:", v10, v11, v17);

  v13 = v30;
  v14 = (void *)v30[5];
  if (a6 && !v14)
  {
    *a6 = objc_retainAutorelease((id)v24[5]);
    v13 = v30;
    v14 = (void *)v30[5];
  }
  if (a5 && v14)
  {
    *a5 = *((_BYTE *)v20 + 24);
    v14 = (void *)v13[5];
  }
  v15 = v14;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

- (BOOL)makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1000350AC;
  v20 = sub_1000350BC;
  v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003571C;
  v15[3] = &unk_1000857B0;
  v15[4] = &v16;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v15));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100035784;
  v14[3] = &unk_1000857B0;
  v14[4] = &v16;
  objc_msgSend(v10, "makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:", v8, v9, v14);

  v11 = (void *)v17[5];
  if (a5 && v11)
  {
    *a5 = objc_retainAutorelease(v11);
    v11 = (void *)v17[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

- (BOOL)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000350AC;
  v25 = sub_1000350BC;
  v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100035910;
  v20[3] = &unk_1000857B0;
  v20[4] = &v21;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v20));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100035978;
  v19[3] = &unk_1000857B0;
  v19[4] = &v21;
  objc_msgSend(v15, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:", v12, v13, a5, v14, v19);

  v16 = (void *)v22[5];
  if (a7 && v16)
  {
    *a7 = objc_retainAutorelease(v16);
    v16 = (void *)v22[5];
  }
  v17 = v16 == 0;
  _Block_object_dispose(&v21, 8);

  return v17;
}

- (BOOL)dataContainer:(id)a3 ofContainerType:(unint64_t)a4 isEmpty:(BOOL *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000350AC;
  v25 = sub_1000350BC;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100035B28;
  v16[3] = &unk_1000857B0;
  v16[4] = &v21;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100035B90;
  v15[3] = &unk_100085800;
  v15[4] = &v17;
  v15[5] = &v21;
  objc_msgSend(v11, "isDataContainerEmpty:ofContainerType:completion:", v10, a4, v15);

  if (a6)
  {
    v12 = (void *)v22[5];
    if (v12)
      *a6 = objc_retainAutorelease(v12);
  }
  if (a5)
    *a5 = *((_BYTE *)v18 + 24);
  v13 = v22[5] == 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 withError:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000350AC;
  v30 = sub_1000350BC;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000350AC;
  v24 = sub_1000350BC;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100035D64;
  v19[3] = &unk_1000857B0;
  v19[4] = &v26;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v19));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100035DCC;
  v18[3] = &unk_100085828;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend(v14, "createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:completion:", v12, v13, v9, v8, v18);

  v15 = (void *)v21[5];
  if (a7 && !v15)
  {
    *a7 = objc_retainAutorelease((id)v27[5]);
    v15 = (void *)v21[5];
  }
  v16 = v15;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (BOOL)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 withError:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  int v16;
  BOOL v17;
  _OWORD v19[2];
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a4;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000350AC;
  v30 = sub_1000350BC;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100036008;
  v21[3] = &unk_1000857B0;
  v21[4] = &v26;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIHelperServiceClient _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v21));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036070;
  v20[3] = &unk_100085850;
  v20[4] = &v26;
  v20[5] = &v22;
  v15 = *(_OWORD *)&a6->var0[4];
  v19[0] = *(_OWORD *)a6->var0;
  v19[1] = v15;
  objc_msgSend(v14, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:", a3, v12, v13, v19, v20);

  v16 = *((unsigned __int8 *)v23 + 24);
  if (a7 && !*((_BYTE *)v23 + 24))
  {
    *a7 = objc_retainAutorelease((id)v27[5]);
    v16 = *((unsigned __int8 *)v23 + 24);
  }
  v17 = v16 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
