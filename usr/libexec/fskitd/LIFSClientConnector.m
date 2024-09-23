@implementation LIFSClientConnector

+ (void)getLiveFSClientForProvider:(id)a3 handler:(id)a4
{
  id v5;
  void (**v6)(id, id, void *);
  const __CFString *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v5 = a3;
  v6 = (void (**)(id, id, void *))a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
  {
    v7 = CFSTR("machp://com.apple.filesystems.localLiveFiles");
LABEL_5:
    v8 = +[LiveFSClient newConnectionForService:](LiveFSClient, "newConnectionForService:", v7);
    if (v8)
      v9 = 0;
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 65, 0));
    v6[2](v6, v8, v9);

    goto LABEL_12;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
  {
    v7 = CFSTR("machp://com.apple.filesystems.smbclientd");
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 65, 0));
  v10 = livefs_std_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    sub_10003CAD8();

  v6[2](v6, 0, v9);
LABEL_12:

}

+ (void)getLiveFilesConnectionForProvider:(id)a3 volume:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v29 = 0;
  v30[0] = &v29;
  v30[1] = 0x3032000000;
  v30[2] = sub_10002C0D0;
  v30[3] = sub_10002C0E0;
  v31 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10002C0D0;
  v27 = sub_10002C0E0;
  v28 = 0;
  v10 = objc_autoreleasePoolPush();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10002C0E8;
  v22[3] = &unk_100055C30;
  v22[4] = &v29;
  v22[5] = &v23;
  +[LIFSClientConnector getLiveFSClientForProvider:handler:](LIFSClientConnector, "getLiveFSClientForProvider:handler:", v7, v22);
  v11 = (void *)v24[5];
  if (v11
    && (v12 = (id *)(v30[0] + 40),
        obj = *(id *)(v30[0] + 40),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listenerForVolume:error:", v8, &obj)),
        objc_storeStrong(v12, obj),
        v13))
  {
    v14 = (void *)v24[5];
    v24[5] = 0;

    v15 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v13);
    v16 = v15;
    if (!v15)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 65, 0));
      v18 = *(void **)(v30[0] + 40);
      *(_QWORD *)(v30[0] + 40) = v17;

    }
    v19 = livefs_std_log(v15);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_10003CB44((uint64_t)v16, (uint64_t)v30, v20);

    v9[2](v9, v16, *(_QWORD *)(v30[0] + 40));
  }
  else
  {
    v9[2](v9, 0, *(_QWORD *)(v30[0] + 40));
    v16 = 0;
    v13 = 0;
  }
  objc_autoreleasePoolPop(v10);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

}

+ (void)forgetLiveFilesVolumeForProvider:(id)a3 volume:(id)a4 withFlags:(unsigned int)a5 handler:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[6];
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

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10002C0D0;
  v30 = sub_10002C0E0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10002C0D0;
  v24 = sub_10002C0E0;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002C324;
  v19[3] = &unk_100055C30;
  v19[4] = &v26;
  v19[5] = &v20;
  +[LIFSClientConnector getLiveFSClientForProvider:handler:](LIFSClientConnector, "getLiveFSClientForProvider:handler:", v9, v19);
  v12 = (void *)v21[5];
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "forgetVolume:withFlags:", v10, v7));
    v14 = (void *)v27[5];
    v27[5] = v13;

    v16 = livefs_std_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10003CC2C();
  }
  else
  {
    v18 = livefs_std_log(0);
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10003CBCC();
  }

  v11[2](v11, v27[5]);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

@end
