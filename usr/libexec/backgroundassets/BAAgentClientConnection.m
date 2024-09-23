@implementation BAAgentClientConnection

- (BAAgentClientConnection)initWithNSXPCConnection:(id)a3 error:(id *)a4
{
  id v6;
  BAAgentClientConnection *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_queue_t v38;
  id v39;
  dispatch_queue_t v40;
  NSObject *v41;
  BAAgentClientConnection *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  id v87;
  void *v88;
  _QWORD block[4];
  BAAgentClientConnection *v90;
  objc_super v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[4];
  _QWORD v104[2];
  _QWORD v105[2];
  uint64_t v106;
  _QWORD v107[4];

  v6 = a3;
  if (qword_1000655D8 != -1)
    dispatch_once(&qword_1000655D8, &stru_1000598D8);
  v91.receiver = self;
  v91.super_class = (Class)BAAgentClientConnection;
  v7 = -[BAAgentConnection initWithNSXPCConnection:error:](&v91, "initWithNSXPCConnection:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BAAgentClientXPCProtocol));
    v107[0] = objc_opt_class(BAURLDownload, v9);
    v107[1] = objc_opt_class(BACloudKitDownload, v10);
    v107[2] = objc_opt_class(BAManifestDownload, v11);
    v107[3] = objc_opt_class(NSArray, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, "currentDownloads:", 0, 1);

    v106 = objc_opt_class(NSDate, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v106, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v17, "performWithExclusiveControlBeforeDate:handler:", 0, 0);

    v105[0] = objc_opt_class(BAURLDownload, v18);
    v105[1] = objc_opt_class(BACloudKitDownload, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v105, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
    v88 = v8;
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v21, "scheduleDownload:reply:", 0, 0);

    v104[0] = objc_opt_class(BAURLDownload, v22);
    v104[1] = objc_opt_class(BACloudKitDownload, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v104, 2));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v24));
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v25, "startForegroundDownload:reply:", 0, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v7, "connection"));
    objc_msgSend(v26, "setExportedInterface:", v8);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v7, "connection"));
    objc_msgSend(v27, "setExportedObject:", v7);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v7, "connection"));
    v29 = objc_msgSend(v28, "processIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUIDString"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d.%@.worker"), v29, v31));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v7, "connection"));
    v34 = objc_msgSend(v33, "processIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d.%@.handler"), v34, v36));

    v87 = objc_retainAutorelease(v32);
    v38 = dispatch_queue_create((const char *)objc_msgSend(v87, "UTF8String"), 0);
    -[BAAgentClientConnection setClientWorkQueue:](v7, "setClientWorkQueue:", v38);

    v39 = objc_retainAutorelease(v37);
    v40 = dispatch_queue_create((const char *)objc_msgSend(v39, "UTF8String"), 0);
    -[BAAgentClientConnection setClientHandlerQueue:](v7, "setClientHandlerQueue:", v40);

    v41 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](v7, "clientWorkQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031848;
    block[3] = &unk_100058998;
    v42 = v7;
    v90 = v42;
    dispatch_async(v41, block);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v42, "connection"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientHandlerQueue](v42, "clientHandlerQueue"));
    objc_msgSend(v43, "_setQueue:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BADownloadManagerSyncProtocol));
    v103[0] = objc_opt_class(BAURLDownload, v46);
    v103[1] = objc_opt_class(BAManifestDownload, v47);
    v103[2] = objc_opt_class(BACloudKitDownload, v48);
    v103[3] = objc_opt_class(NSArray, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 4));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v50));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v51, "syncDownloads:", 0, 0);

    v102 = objc_opt_class(NSString, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v102, 1));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v53));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v54, "removeDownloadIdentifier:", 0, 0);

    v101 = objc_opt_class(NSString, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v101, 1));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v56));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v57, "downloadIdentifierDidBegin:", 0, 0);

    v100 = objc_opt_class(NSString, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v100, 1));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v59));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v60, "downloadIdentifierDidPause:", 0, 0);

    v99 = objc_opt_class(NSString, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v99, 1));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v62));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v63, "downloadIdentifier:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", 0, 0);

    v98 = objc_opt_class(NSString, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v98, 1));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v65));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v66, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:", 0, 0);

    v97 = objc_opt_class(NSURLAuthenticationChallenge, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v97, 1));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v68));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v69, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:", 1, 0);

    v96 = objc_opt_class(NSURLCredential, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v71));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v72, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:", 1, 1);

    v95 = objc_opt_class(NSString, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v74));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v75, "downloadIdentifier:didFailWithError:wasHandled:", 0, 0);

    v94 = objc_opt_class(NSError, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v77));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v78, "downloadIdentifier:didFailWithError:wasHandled:", 1, 0);

    v93 = objc_opt_class(NSString, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v93, 1));
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v80));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v81, "downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:", 0, 0);

    v92 = objc_opt_class(NSString, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v83));
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v84, "downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:", 1, 0);

    v85 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](v42, "connection"));
    objc_msgSend(v85, "setRemoteObjectInterface:", v45);

  }
  return v7;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BAAgentClientConnection;
  -[BAAgentConnection connectionInvalidated](&v5, "connectionInvalidated");
  v3 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031968;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection exclusiveAccessBlockQueue](self, "exclusiveAccessBlockQueue"));

  if (v3)
  {
    v4 = (void *)qword_1000655E0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection exclusiveAccessBlockQueue](self, "exclusiveAccessBlockQueue"));
    objc_msgSend(v4, "invalidateBlockQueue:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)BAAgentClientConnection;
  -[BAAgentClientConnection dealloc](&v6, "dealloc");
}

- (void)currentDownloads:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031B04;
  v7[3] = &unk_100059900;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)scheduleDownload:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031CA8;
  block[3] = &unk_100059928;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)performWithExclusiveControlWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031F90;
  v7[3] = &unk_100059900;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)performWithExclusiveControlBeforeDate:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032220;
  block[3] = &unk_100059928;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)exclusiveControlExitedWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032490;
  v7[3] = &unk_100058A10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_validateAndSetClientIdentifier
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  SecTaskRef v7;
  __SecTask *v8;
  const __CFURL *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const void *Value;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  id v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned __int8 v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned __int8 v81;
  __CFString *v82;
  void *v83;
  CFErrorRef v84;
  unsigned int v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  NSObject *v91;
  uint64_t v92;
  id v93;
  NSObject *v94;
  id v95;
  id v96;
  NSObject *v97;
  id v98;
  NSObject *v99;
  id v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  NSObject *v109;
  CFErrorRef error;
  id v111;
  id v112;
  audit_token_t token;
  CFTypeRef cf;
  SecStaticCodeRef staticCode;
  audit_token_t audittoken;
  _BYTE buffer[1024];

  memset(&audittoken, 0, sizeof(audittoken));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&audittoken, 0, sizeof(audittoken));

  cf = 0;
  staticCode = 0;
  bzero(buffer, 0x400uLL);
  if (proc_pidpath_audittoken(&audittoken, buffer, 0x400u) < 0)
  {
    v22 = sub_100012964();
    v6 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100037DD4();
    goto LABEL_16;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer));
  v6 = v5;
  if (!v5 || !-[NSObject length](v5, "length"))
  {
    v20 = sub_100012964();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100037E00();
    goto LABEL_13;
  }
  token = audittoken;
  v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v7)
  {
    v24 = sub_100012964();
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100037E2C();
LABEL_13:

LABEL_16:
    v23 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v10 = SecStaticCodeCreateWithPath(v9, 0, &staticCode);
  if ((_DWORD)v10)
  {
    v11 = v10;
    v12 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100038438(v11, v13, v14, v15, v16, v17, v18, v19);
LABEL_27:
    v34 = 0;
    goto LABEL_28;
  }
  v25 = SecCodeCopySigningInformation(staticCode, 0, (CFDictionaryRef *)&cf);
  if ((_DWORD)v25)
  {
    v26 = v25;
    v27 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000383D4(v26, v13, v28, v29, v30, v31, v32, v33);
    goto LABEL_27;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)cf, kSecCodeInfoPList);
  v36 = objc_claimAutoreleasedReturnValue(Value);
  if (!v36)
  {
    v38 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037E58();
    goto LABEL_27;
  }
  v34 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v36, "objectForKey:", CFSTR("EXAppExtensionAttributes")));
  if (v37)
  {

  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v34, "objectForKey:", CFSTR("NSExtension")));

    if (!v39)
    {
      v111 = 0;
      token = audittoken;
      v64 = objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", &token, &v111));
      v13 = v111;
      if (v64)
      {
        v66 = objc_opt_class(LSApplicationRecord, v65);
        if ((objc_opt_isKindOfClass(v64, v66) & 1) != 0)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bundleIdentifier](v64, "bundleIdentifier"));
          -[BAAgentClientConnection setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:", v67);

          v68 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
          -[BAAgentClientConnection setClientBundleIdentifier:](self, "setClientBundleIdentifier:", v68);

          v69 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
          if (v69)
          {
            -[BAAgentClientConnection setIsApplication:](self, "setIsApplication:", 1);

            goto LABEL_65;
          }
          v100 = sub_100012964();
          v91 = objc_claimAutoreleasedReturnValue(v100);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            sub_100037EE8();
        }
        else
        {
          v95 = sub_100012964();
          v91 = objc_claimAutoreleasedReturnValue(v95);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            sub_10003822C((uint64_t)v64, (uint64_t)v91);
        }
      }
      else
      {
        v90 = sub_100012964();
        v91 = objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          sub_100037E84();
      }

LABEL_96:
      goto LABEL_28;
    }
  }
  v40 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v34, "objectForKey:", kCFBundleIdentifierKey));
  if (!v40)
  {
    v61 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000382A8();
    goto LABEL_28;
  }
  v41 = (void *)v40;
  v112 = 0;
  token = audittoken;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", &token, &v112));
  v44 = v112;
  if (!v42)
  {
    v62 = sub_100012964();
    v54 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_100037E84();
    goto LABEL_62;
  }
  v45 = objc_opt_class(LSApplicationExtensionRecord, v43);
  if ((objc_opt_isKindOfClass(v42, v45) & 1) == 0)
  {
    v63 = sub_100012964();
    v54 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_100038358((uint64_t)v42, (uint64_t)v54);
    goto LABEL_62;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bundleIdentifier"));
  -[BAAgentClientConnection setClientBundleIdentifier:](self, "setClientBundleIdentifier:", v46);

  v47 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
  if (!v47
    || (v48 = (void *)v47,
        v108 = v44,
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientBundleIdentifier](self, "clientBundleIdentifier")),
        v50 = objc_msgSend(v49, "length"),
        v49,
        v44 = v108,
        v48,
        !v50))
  {
    v70 = sub_100012964();
    v54 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_1000382D4();
LABEL_62:
    v60 = 2;
    goto LABEL_63;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "containingBundleRecord"));
  v53 = objc_opt_class(LSApplicationRecord, v52);
  if ((objc_opt_isKindOfClass(v51, v53) & 1) == 0
    || (v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bundleIdentifier"))) == 0)
  {
    v55 = sub_100012964();
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_10003832C();

    v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "_baassets_stringByRemovingLastIdentifierComponent"));
  }
  v107 = v51;
  -[BAAgentClientConnection setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:", v54);
  v57 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  if (v57
    && (v58 = (void *)v57,
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier")),
        v106 = objc_msgSend(v59, "length"),
        v59,
        v58,
        v106))
  {
    -[BAAgentClientConnection setIsApplication:](self, "setIsApplication:", 0);
    v60 = 0;
  }
  else
  {
    v96 = sub_100012964();
    v97 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_100038300();

    v60 = 2;
  }

  v44 = v108;
LABEL_63:

  if (v60)
  {
    v23 = 0;
    goto LABEL_30;
  }
LABEL_65:
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier", v106));
  v13 = objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v71));

  if (!v13)
  {
    v88 = sub_100012964();
    v13 = objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037F4C(self);
    goto LABEL_28;
  }
  v72 = objc_msgSend(objc_alloc((Class)FBSApplicationInfo), "initWithApplicationProxy:", v13);
  if (!v72)
  {
    v89 = sub_100012964();
    v64 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_100037FC4(self);
    goto LABEL_96;
  }
  v64 = v72;
  v73 = -[NSObject unauthoritativeTrustState](v72, "unauthoritativeTrustState");
  if (v73 != (id)8)
  {
    v92 = (uint64_t)v73;
    v93 = sub_100012964();
    v94 = objc_claimAutoreleasedReturnValue(v93);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      sub_100038190(self, v92);

    goto LABEL_96;
  }
  v109 = v64;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_baassets_validUTI"));
  v77 = objc_msgSend(v74, "isEqualToString:", v76);

  if ((v77 & 1) != 0)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "_baassets_validUTI"));
    v81 = objc_msgSend(v78, "isEqualToString:", v80);

    if ((v81 & 1) != 0)
    {
      error = 0;
      v82 = (__CFString *)SecTaskCopySigningIdentifier(v8, &error);
      -[BAAgentClientConnection setSigningIdentifier:](self, "setSigningIdentifier:", v82);

      v83 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection signingIdentifier](self, "signingIdentifier"));
      v84 = error;
      if (v83)
      {
        if (error)
          CFRelease(error);
        v85 = -[BAAgentClientConnection isApplication](self, "isApplication");
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
        if (v85)
        {
          objc_msgSend(v86, "handleApplicationLaunched:", v87);

        }
        else
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "applicationInfoForIdentifier:", v87));

          objc_msgSend(v105, "setApplicationExtensionState:", 4);
        }

        v23 = 1;
        goto LABEL_29;
      }
      v103 = sub_100012964();
      v104 = objc_claimAutoreleasedReturnValue(v103);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        sub_10003803C();

    }
    else
    {
      v101 = sub_100012964();
      v102 = objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        sub_1000380A0(self);

      -[BAAgentClientConnection setClientBundleIdentifier:](self, "setClientBundleIdentifier:", 0);
    }
  }
  else
  {
    v98 = sub_100012964();
    v99 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      sub_100038118(self);

    -[BAAgentClientConnection setApplicationBundleIdentifier:](self, "setApplicationBundleIdentifier:", 0);
  }

LABEL_28:
  v23 = 0;
LABEL_29:

LABEL_30:
  CFRelease(v8);

  v6 = v34;
LABEL_17:

  if (staticCode)
    CFRelease(staticCode);
  if (cf)
    CFRelease(cf);
  -[BAAgentClientConnection setConnectionIsValid:](self, "setConnectionIsValid:", v23, v106);
}

- (BOOL)_entitledForCloudKitWithDownload:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.developer.icloud-services")));

  v10 = objc_opt_class(NSArray, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v12);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "caseInsensitiveCompare:", CFSTR("CloudKit")))
          {

            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        if (v14)
          continue;
        break;
      }
    }

    goto LABEL_13;
  }
  v17 = objc_opt_class(NSString, v11);
  if ((objc_opt_isKindOfClass(v8, v17) & 1) == 0 || objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("CloudKit")))
  {
LABEL_13:
    if (a4)
    {
      v18 = sub_1000272FC(-52);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_35;
  }
LABEL_16:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForEntitlement:", CFSTR("com.apple.developer.icloud-container-identifiers")));

  v23 = objc_opt_class(NSArray, v22);
  if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0 && objc_msgSend(v21, "count"))
  {
    v36 = a4;
    v37 = v21;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = v21;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v39;
      while (2)
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerID", v36));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "containerIdentifier"));
          LOBYTE(v29) = objc_msgSend(v31, "isEqualToString:", v29);

          if ((v29 & 1) != 0)
          {

            v34 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection signingIdentifier](self, "signingIdentifier"));
            objc_msgSend(v6, "setMasqueradeIdentifier:", v34);

            v19 = 1;
            goto LABEL_33;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v26)
          continue;
        break;
      }
    }

    if (v36)
    {
      v32 = sub_1000272FC(-54);
      v19 = 0;
      *v36 = (id)objc_claimAutoreleasedReturnValue(v32);
    }
    else
    {
      v19 = 0;
    }
LABEL_33:
    v21 = v37;
  }
  else if (a4)
  {
    v33 = sub_1000272FC(-53);
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v33);
  }
  else
  {
    v19 = 0;
  }

LABEL_35:
  return v19;
}

- (BOOL)isActive
{
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;

  v3 = -[BAAgentClientConnection isApplication](self, "isApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  if (v3)
    v6 = objc_msgSend(v4, "applicationStateForIdentifier:", v5);
  else
    v6 = objc_msgSend(v4, "applicationExtensionStateForIdentifier:", v5);
  v7 = (unint64_t)v6;

  return (v7 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)startForegroundDownload:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033384;
  block[3] = &unk_100059928;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)cancelDownload:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BAAgentClientConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000335A8;
  block[3] = &unk_1000591B8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000337C4;
  v15[3] = &unk_1000599A0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)syncDownloads:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &stru_1000599C0));
  objc_msgSend(v5, "syncDownloads:", v4);

}

- (void)callBlockWhenConnectionReady:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientWorkQueue](self, "clientWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033C28;
  block[3] = &unk_1000591B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)removeDownloadIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033D70;
  v8[3] = &unk_100058A38;
  v9 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8));
  objc_msgSend(v7, "removeDownloadIdentifier:", v6);

}

- (void)downloadIdentifierDidBegin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033E7C;
  v8[3] = &unk_100058A38;
  v9 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8));
  objc_msgSend(v7, "downloadIdentifierDidBegin:", v6);

}

- (void)downloadIdentifierDidPause:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033F88;
  v8[3] = &unk_100058A38;
  v9 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8));
  objc_msgSend(v7, "downloadIdentifierDidPause:", v6);

}

- (void)downloadIdentifier:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000340B4;
  v14[3] = &unk_100058A38;
  v15 = v10;
  v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14));
  objc_msgSend(v13, "downloadIdentifier:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", v12, a4, a5, a6);

}

- (void)downloadIdentifier:(id)a3 didReceiveChallenge:(id)a4 authChallengeHandler:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_queue_create("com.apple.BAAgentClientConnection.AuthChallengeWaiter", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034220;
  block[3] = &unk_100059A10;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)downloadIdentifier:(id)a3 didFailWithError:(id)a4 wasHandled:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000344B8;
  v18[3] = &unk_100058A88;
  v19 = v8;
  v12 = v9;
  v20 = v12;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100034528;
  v16[3] = &unk_100059A38;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "downloadIdentifier:didFailWithError:wasHandled:", v13, v10, v16);

}

- (void)downloadIdentifierDidFinish:(id)a3 sandboxExtensionToken:(id)a4 wasHandled:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100034660;
  v18[3] = &unk_100058A88;
  v19 = v8;
  v12 = v9;
  v20 = v12;
  v13 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000346D0;
  v16[3] = &unk_100059A38;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:", v13, v10, v16);

}

- (id)extendClientSandboxForStagedURL:(id)a3 allowWrites:(BOOL)a4
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _OWORD v15[2];

  v5 = (uint64_t *)&APP_SANDBOX_READ_WRITE;
  if (!a4)
    v5 = (uint64_t *)&APP_SANDBOX_READ;
  v6 = *v5;
  v7 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v8 = SANDBOX_EXTENSION_DEFAULT;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v15, 0, sizeof(v15));
  v11 = (void *)sandbox_extension_issue_file_to_process(v6, v7, v8, v15);

  v12 = *__error();
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4));
    free(v11);
  }
  else
  {
    v13 = 0;
  }
  *__error() = v12;
  return v13;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection applicationBundleIdentifier](self, "applicationBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentClientConnection clientBundleIdentifier](self, "clientBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAgentConnection connection](self, "connection"));
  v6 = objc_msgSend(v5, "processIdentifier");
  v7 = -[BAAgentClientConnection isApplication](self, "isApplication");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Client Connection\nApp Identifier: %@\nClient Identifier: %@\nPID: %d\nIs Client App: %@"), v3, v4, v6, v8));

  return (NSString *)v9;
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (void)setIsApplication:(BOOL)a3
{
  self->_isApplication = a3;
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)clientHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientHandlerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)clientWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)connectionIsValid
{
  return self->_connectionIsValid;
}

- (void)setConnectionIsValid:(BOOL)a3
{
  self->_connectionIsValid = a3;
}

- (NSString)signingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSigningIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BABlockQueue)exclusiveAccessBlockQueue
{
  return (BABlockQueue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExclusiveAccessBlockQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSUUID)lastExclusiveAccessBlockToken
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastExclusiveAccessBlockToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExclusiveAccessBlockToken, 0);
  objc_storeStrong((id *)&self->_exclusiveAccessBlockQueue, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_clientWorkQueue, 0);
  objc_storeStrong((id *)&self->_clientHandlerQueue, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
