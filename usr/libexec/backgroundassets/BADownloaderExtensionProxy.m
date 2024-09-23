@implementation BADownloaderExtensionProxy

- (BADownloaderExtensionProxy)initWithExtension:(id)a3 XPCConnection:(id)a4 applicationInfo:(id)a5
{
  BADownloaderExtensionProxy *v8;
  BADownloaderExtensionProxy *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  void *v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  uint64_t v20;
  NSSet *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSSet *v28;
  void *v29;
  uint64_t v30;
  NSSet *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;
  uint64_t v42;
  NSSet *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BADownloaderExtensionProxy *v64;
  void *v65;
  id v66;
  BADownloaderExtensionProxy *v67;
  void *v68;
  id v69;
  BADownloaderExtensionProxy *v70;
  void *v71;
  id v72;
  NSObject *v73;
  dispatch_semaphore_t v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  dispatch_time_t v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  char v91;
  id v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BADownloaderExtensionProxy *v106;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  _OWORD v113[2];
  uint8_t v114[8];
  _QWORD v115[4];
  NSObject *v116;
  uint8_t *v117;
  _QWORD v118[4];
  NSObject *v119;
  uint8_t buf[8];
  uint8_t *v121;
  uint64_t v122;
  char v123;
  _QWORD v124[4];
  id v125;
  BADownloaderExtensionProxy *v126;
  _QWORD v127[4];
  id v128;
  BADownloaderExtensionProxy *v129;
  objc_super v130;
  uint64_t v131;
  _QWORD v132[4];
  _QWORD v133[4];

  v110 = a3;
  v111 = a4;
  v112 = a5;
  v130.receiver = self;
  v130.super_class = (Class)BADownloaderExtensionProxy;
  v8 = -[BADownloaderExtensionProxy init](&v130, "init");
  v9 = v8;
  if (!v8)
    goto LABEL_21;
  -[BADownloaderExtensionProxy setExtensionConnection:](v8, "setExtensionConnection:", v111);
  -[BADownloaderExtensionProxy setExtensionProcess:](v9, "setExtensionProcess:", v110);
  -[BADownloaderExtensionProxy setApplicationInfo:](v9, "setApplicationInfo:", v112);
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "applicationIdentifier"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "_baassets_validUTI"));
  if ((objc_msgSend(v108, "isEqualToString:", v109) & 1) == 0)
  {

LABEL_22:
    v106 = 0;
    goto LABEL_23;
  }
  -[BADownloaderExtensionProxy setIdentifier:](v9, "setIdentifier:", v108);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy identifier](v9, "identifier"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.backgroundassets.extension.%@.shutdown_queue"), v10)));
  v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
  -[BADownloaderExtensionProxy setShutdownQueue:](v9, "setShutdownQueue:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BADownloaderExtensionSyncProtocol));
  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURL, v14), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:", 1, 0);

  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString, v17), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v19, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:", 2, 0);

  v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(BAAppExtensionInfo, v20), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v22, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:", 3, 0);

  v24 = objc_opt_class(NSSet, v23);
  v26 = objc_opt_class(BAURLDownload, v25);
  v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, v26, objc_opt_class(BAManifestDownload, v27), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v29, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:", 1, 1);

  v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURLAuthenticationChallenge, v30), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v32, "receivedAuthenticationChallenge:download:completionHandler:", 0, 0);

  v34 = objc_opt_class(BADownload, v33);
  v36 = objc_opt_class(BAURLDownload, v35);
  v38 = objc_opt_class(BAManifestDownload, v37);
  v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v34, v36, v38, objc_opt_class(BACloudKitDownload, v39), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v41, "receivedAuthenticationChallenge:download:completionHandler:", 1, 0);

  v43 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURLCredential, v42), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v44, "receivedAuthenticationChallenge:download:completionHandler:", 1, 1);

  v133[0] = objc_opt_class(BADownload, v45);
  v133[1] = objc_opt_class(BAURLDownload, v46);
  v133[2] = objc_opt_class(BACloudKitDownload, v47);
  v133[3] = objc_opt_class(BAManifestDownload, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v133, 4));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v49));
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v50, "backgroundDownload:failedWithError:completionHandler:", 0, 0);

  v132[0] = objc_opt_class(BADownload, v51);
  v132[1] = objc_opt_class(BAURLDownload, v52);
  v132[2] = objc_opt_class(BACloudKitDownload, v53);
  v132[3] = objc_opt_class(BAManifestDownload, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v132, 4));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v55));
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v56, "backgroundDownload:finishedWithSandboxToken:completionHandler:", 0, 0);

  v131 = objc_opt_class(NSString, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v58));
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v59, "backgroundDownload:finishedWithSandboxToken:completionHandler:", 1, 0);

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___BADownloaderExtensionClientSyncProtocol));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v9, "extensionConnection"));
  objc_msgSend(v61, "setRemoteObjectInterface:", v13);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v9, "extensionConnection"));
  objc_msgSend(v62, "setExportedInterface:", v60);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v9, "extensionConnection"));
  objc_msgSend(v63, "setExportedObject:", v9);

  v64 = v9;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v64, "extensionConnection"));
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_100008E34;
  v127[3] = &unk_100058A10;
  v66 = v108;
  v128 = v66;
  v67 = v64;
  v129 = v67;
  objc_msgSend(v65, "setInterruptionHandler:", v127);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v67, "extensionConnection"));
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_100008E84;
  v124[3] = &unk_100058A10;
  v69 = v66;
  v125 = v69;
  v70 = v67;
  v126 = v70;
  objc_msgSend(v68, "setInvalidationHandler:", v124);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v70, "extensionConnection"));
  objc_msgSend(v71, "resume");

  v72 = sub_100012964();
  v73 = objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Attempting to wakeup extension connection.\n", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v121 = buf;
  v122 = 0x2020000000;
  v123 = 0;
  v74 = dispatch_semaphore_create(0);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v70, "extensionConnection"));
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_100008F50;
  v118[3] = &unk_100058A38;
  v76 = v74;
  v119 = v76;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "remoteObjectProxyWithErrorHandler:", v118));
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100008FB4;
  v115[3] = &unk_100058A60;
  v117 = buf;
  v78 = v76;
  v116 = v78;
  objc_msgSend(v77, "wakeupForTokenWithReply:", v115);

  v79 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v78, v79))
  {
    v80 = sub_100012964();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      sub_100035020(v81, v82, v83, v84, v85, v86, v87, v88);
LABEL_8:

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v70, "extensionConnection"));
    objc_msgSend(v89, "invalidate");

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy exitTimer](v70, "exitTimer"));
    objc_msgSend(v90, "invalidate");

    v91 = 0;
    goto LABEL_20;
  }
  if (!v121[24])
  {
    v98 = sub_100012964();
    v81 = objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      sub_100034FEC(v81, v99, v100, v101, v102, v103, v104, v105);
    goto LABEL_8;
  }
  v92 = sub_100012964();
  v93 = objc_claimAutoreleasedReturnValue(v92);
  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v114 = 0;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Wakeup extension succeeded.\n", v114, 2u);
  }

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy applicationInfo](v70, "applicationInfo"));
  objc_msgSend(v94, "willLaunchExtension");

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy applicationInfo](v70, "applicationInfo"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](v70, "extensionConnection"));
  v97 = v96;
  if (v96)
    objc_msgSend(v96, "auditToken");
  else
    memset(v113, 0, sizeof(v113));
  objc_msgSend(v95, "determineInstallSourceIfUnsetFromAuditToken:", v113);

  -[BADownloaderExtensionProxy _startExitTimer](v70, "_startExitTimer");
  v91 = 1;
LABEL_20:

  _Block_object_dispose(buf, 8);
  if ((v91 & 1) == 0)
    goto LABEL_22;
LABEL_21:
  v106 = v9;
LABEL_23:

  return v106;
}

- (void)requestDownloadsWithContentRequest:(int64_t)a3 manifestURL:(id)a4 extensionInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extendClientSandboxForStagedURL:allowWrites:](self, "extendClientSandboxForStagedURL:allowWrites:", v10, 0));
  if (v13)
  {
    -[BADownloaderExtensionProxy _sendingMessage](self, "_sendingMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100009184;
    v22[3] = &unk_100058A88;
    v22[4] = self;
    v15 = v12;
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v22));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000921C;
    v20[3] = &unk_100058AB0;
    v20[4] = self;
    v21 = v15;
    objc_msgSend(v16, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:", a3, v10, v13, v11, v20);

  }
  else
  {
    v17 = sub_100012964();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100035130();

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v19);

  }
}

- (BOOL)sendAuthenticationChallenge:(id)a3 download:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  -[BADownloaderExtensionProxy _sendingMessage](self, "_sendingMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000093AC;
  v17[3] = &unk_100058AD8;
  v17[4] = self;
  v17[5] = &v18;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009420;
  v15[3] = &unk_100058B00;
  v13 = v10;
  v15[4] = self;
  v16 = v13;
  objc_msgSend(v12, "receivedAuthenticationChallenge:download:completionHandler:", v8, v9, v15);

  LOBYTE(self) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)self;
}

- (void)extensionWillTerminate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000094C8;
  v5[3] = &unk_100058A38;
  v5[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5));
  objc_msgSend(v4, "extensionWillTerminate");

}

- (void)backgroundDownload:(id)a3 failedWithError:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BADownloaderExtensionProxy _sendingMessage](self, "_sendingMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009654;
  v17[3] = &unk_100058A88;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000096CC;
  v15[3] = &unk_100058B28;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "backgroundDownload:failedWithError:completionHandler:", v10, v9, v15);

}

- (void)backgroundDownload:(id)a3 finishedWithSandboxToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BADownloaderExtensionProxy _sendingMessage](self, "_sendingMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009824;
  v17[3] = &unk_100058A88;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v17));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000989C;
  v15[3] = &unk_100058B28;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "backgroundDownload:finishedWithSandboxToken:completionHandler:", v10, v9, v15);

}

- (void)wakeupForTokenWithReply:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("wakeupForTokenWithReply should never be called on the proxy object, it is for internal use only"), 0));
  objc_msgSend(v3, "raise");

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
  void *v12;
  _OWORD v14[2];

  v5 = (uint64_t *)&APP_SANDBOX_READ_WRITE;
  if (!a4)
    v5 = (uint64_t *)&APP_SANDBOX_READ;
  v6 = *v5;
  v7 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v8 = SANDBOX_EXTENSION_DEFAULT;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v11 = (void *)sandbox_extension_issue_file_to_process(v6, v7, v8, v14);

  if (!v11)
    return 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4));
  free(v11);
  return v12;
}

- (void)invalidate
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = sub_1000129D4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy identifier](self, "identifier"));
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Invalidating connection to extension: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  objc_msgSend(v6, "invalidate");

  -[BADownloaderExtensionProxy setExtensionConnection:](self, "setExtensionConnection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionProcess](self, "extensionProcess"));
  objc_msgSend(v7, "invalidate");

  -[BADownloaderExtensionProxy setExtensionProcess:](self, "setExtensionProcess:", 0);
}

- (void)_sendingMessage
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy shutdownQueue](self, "shutdownQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009B64;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)_checkForExit
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy shutdownQueue](self, "shutdownQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C0C;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startExitTimer
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 10000000000);
  v4 = objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy shutdownQueue](self, "shutdownQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D0C;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy exitTimer](self, "exitTimer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fireDate"));

  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy extensionConnection](self, "extensionConnection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Extension Proxy\nIdentifier: %@\nPID: %d\nExtension Termination Time: %@ (%.2lf seconds remaining)\n"), v7, objc_msgSend(v8, "processIdentifier"), v4, v6));

  return (NSString *)v9;
}

- (void)markPurgeableWithFileURL:(id)a3 sandboxToken:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(a4), "UTF8String"));
  if (v9 == -1)
  {
    v18 = *__error();
    v27 = CFSTR("FileURL");
    v19 = v7;
    if (!v7)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v28 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v18, v20));

    if (!v7)
    v22 = sub_100027310(CFSTR("BAErrorDomain"), -108, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v8[2](v8, 0, v23);

  }
  else
  {
    v10 = v9;
    v24 = 66564;
    v11 = objc_retainAutorelease(v7);
    if (fsctl((const char *)objc_msgSend(v11, "fileSystemRepresentation", 66564), 0xC0084A44uLL, &v24, 0))
    {
      v12 = *__error();
      v25 = CFSTR("FileURL");
      v13 = v11;
      if (!v11)
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v26 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v12, v14));

      if (!v11)
      sandbox_extension_release(v10);
      v16 = sub_100027310(CFSTR("BAErrorDomain"), -57, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v8[2](v8, 0, v17);

    }
    else
    {
      sandbox_extension_release(v10);
      v8[2](v8, 1, 0);
    }
  }

}

- (void)decrementWakeAssertionWithReply:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  _QWORD block[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy shutdownQueue](self, "shutdownQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A2D4;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_sync(v5, block);

  -[BADownloaderExtensionProxy _checkForExit](self, "_checkForExit");
  v4[2](v4);

}

- (void)incrementWakeAssertionWithReply:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  _QWORD block[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BADownloaderExtensionProxy shutdownQueue](self, "shutdownQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3D8;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_sync(v5, block);

  v4[2](v4);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)shutdownQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShutdownQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)extensionConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExtensionConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BAApplicationInfo)applicationInfo
{
  return (BAApplicationInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApplicationInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSTimer)exitTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExitTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (_EXExtensionProcess)extensionProcess
{
  return (_EXExtensionProcess *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensionProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (unint64_t)extensionActiveCalls
{
  return self->_extensionActiveCalls;
}

- (void)setExtensionActiveCalls:(unint64_t)a3
{
  self->_extensionActiveCalls = a3;
}

- (unint64_t)extensionWakeAssertions
{
  return self->_extensionWakeAssertions;
}

- (void)setExtensionWakeAssertions:(unint64_t)a3
{
  self->_extensionWakeAssertions = a3;
}

- (BOOL)sentWillTerminateMessage
{
  return self->_sentWillTerminateMessage;
}

- (void)setSentWillTerminateMessage:(BOOL)a3
{
  self->_sentWillTerminateMessage = a3;
}

- (BOOL)sentTerminatonMessage
{
  return self->_sentTerminatonMessage;
}

- (void)setSentTerminatonMessage:(BOOL)a3
{
  self->_sentTerminatonMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_extensionConnection, 0);
  objc_storeStrong((id *)&self->_shutdownQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
