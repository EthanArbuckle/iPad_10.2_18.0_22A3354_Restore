@implementation SDXPCHelperConnection

+ (void)updateCacheFromSFCGImageData:(id)a3 cacheKey:(id)a4 contactIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  const void *v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v12 = v7;
  if (v12)
  {
    v10 = SFCreateCGImageFromData(v12);
    if (v10)
    {
      v11 = (const void *)v10;
      +[SDXPCHelperImageCache setImage:forKey:contactIDs:](_TtC16DaemoniOSLibrary21SDXPCHelperImageCache, "setImage:forKey:contactIDs:", v10, v8, v9);
      CFRelease(v11);
    }
  }

}

- (SDXPCHelperConnection)initWithQueue:(id)a3 serviceName:(id)a4
{
  id v6;
  SDXPCHelperConnection *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSString *signpostName;
  NSMutableDictionary *v12;
  NSMutableDictionary *cacheAccessDict;
  NSMutableArray *v14;
  NSMutableArray *queuedBlocks;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SDXPCHelperConnection;
  v7 = -[SDXPCHelperConnection init](&v17, "init");
  if (v7)
  {
    v8 = sharingXPCHelperLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v7->_intervalID = os_signpost_id_generate(v9);

    v10 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection description](v7, "description"));
    signpostName = v7->_signpostName;
    v7->_signpostName = (NSString *)v10;

    v7->_cacheAccessCount = 0;
    v12 = objc_opt_new(NSMutableDictionary);
    cacheAccessDict = v7->_cacheAccessDict;
    v7->_cacheAccessDict = v12;

    v7->_cacheAccessLock._os_unfair_lock_opaque = 0;
    v14 = objc_opt_new(NSMutableArray);
    queuedBlocks = v7->_queuedBlocks;
    v7->_queuedBlocks = v14;

    objc_storeStrong((id *)&v7->_serviceName, a4);
  }

  return v7;
}

- (SDXPCHelperConnection)initWithQueue:(id)a3
{
  return -[SDXPCHelperConnection initWithQueue:serviceName:](self, "initWithQueue:serviceName:", a3, CFSTR("com.apple.SharingXPCHelper"));
}

- (SDXPCHelperConnection)initWithQueue:(id)a3 xrRenderingMode:(unint64_t)a4
{
  return -[SDXPCHelperConnection initWithQueue:serviceName:](self, "initWithQueue:serviceName:", a3, CFSTR("com.apple.SharingXPCHelper"));
}

- (void)activate
{
  id v3;
  void *v4;
  NSXPCConnection *v5;
  NSXPCConnection *connectionToService;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;

  if (!self->_activated)
  {
    self->_activated = 1;
    v3 = objc_alloc((Class)NSXPCConnection);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection serviceName](self, "serviceName"));
    v5 = (NSXPCConnection *)objc_msgSend(v3, "initWithServiceName:", v4);
    connectionToService = self->_connectionToService;
    self->_connectionToService = v5;

    if (self->_queue)
      -[NSXPCConnection _setQueue:](self->_connectionToService, "_setQueue:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SharingXPCHelperProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setInvalidationHandler:](self->_connectionToService, "setInvalidationHandler:", self->_invalidationHandler);
    -[NSXPCConnection setInterruptionHandler:](self->_connectionToService, "setInterruptionHandler:", self->_interruptionHandler);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](self->_connectionToService, "remoteObjectInterface"));
    v9 = objc_opt_class(SharingXPCHelperContactIcon);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(NSArray), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, "monogramImagesForMultipleContactsSync:style:diameter:monogramAsFlatImages:replyHandler:", 0, 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](self->_connectionToService, "remoteObjectInterface"));
    v13 = objc_opt_class(SharingXPCHelperImageItem);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(NSArray), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, "CGImgDataForUIActivityTitles:foregroundColor:replyHandler:", 0, 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](self->_connectionToService, "remoteObjectInterface"));
    v17 = objc_opt_class(SharingXPCHelperGroupContactIcon);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(NSArray), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v19, "groupMonogramImageDataForContactsSync:style:diameter:backgroundStyle:monogramsAsFlatImages:replyHandler:", 0, 1);

    -[NSXPCConnection resume](self->_connectionToService, "resume");
  }
}

- (void)invalidate
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001BD6B0;
  v16[3] = &unk_1007146D8;
  v16[4] = self;
  v3 = objc_retainBlock(v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    v7 = objc_retainBlock(v3);
    objc_msgSend(v6, "addObject:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    v9 = objc_msgSend(v8, "copy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    objc_msgSend(v10, "removeAllObjects");

    global_queue = dispatch_get_global_queue(-32768, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001BD738;
    v14[3] = &unk_1007146D8;
    v15 = v9;
    v13 = v9;
    dispatch_async(v12, v14);

  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
  }

}

- (void)dealloc
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  objc_super v8;

  if (!self->_invalidateCalled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDXPCHelperConnection.m"), 198, CFSTR("SDXPCHelperConnection deallocated without -invalidate call"));

    if (!self->_invalidateCalled)
    {
      v6 = daemon_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_1001C299C();

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SDXPCHelperConnection;
  -[SDXPCHelperConnection dealloc](&v8, "dealloc");
}

+ (id)makeActivatedConnection
{
  SDXPCHelperConnection *v2;

  v2 = -[SDXPCHelperConnection initWithQueue:]([SDXPCHelperConnection alloc], "initWithQueue:", 0);
  -[SDXPCHelperConnection setInvalidationHandler:](v2, "setInvalidationHandler:", &stru_10071A280);
  -[SDXPCHelperConnection activate](v2, "activate");
  return v2;
}

- (id)whitelistedDownloadsFolderURL
{
  return 0;
}

- (id)monogramImageDataForContact:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 isContactImage:(BOOL *)a7
{
  _BOOL8 v7;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t intervalID;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CGImage *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  uint64_t v41;
  id v42;
  _QWORD v43[6];
  uint8_t v44[4];
  os_signpost_id_t v45;
  __CFString *v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __CFString *v52;
  _QWORD v53[5];

  v7 = a6;
  v42 = a3;
  v11 = sharingXPCHelperLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "monogramImageDataForContact", "%llu", (uint8_t *)&buf, 0xCu);
  }

  v15 = v42;
  if (!v42)
  {
    v16 = sharingXPCHelperLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "monogramImageDataForContact called with nil contact, will use fallback.", (uint8_t *)&buf, 2u);
    }

    v15 = 0;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier", a7));
  v19 = (void *)v18;
  v20 = CFSTR("FALLBACK");
  if (v18)
    v20 = (__CFString *)v18;
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:]"));
  v53[0] = v22;
  v53[1] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v53[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(a5)));
  v53[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v53[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 5));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsJoinedByString:", CFSTR(",")));
  v52 = v21;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
  v29 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v27, v28, CFSTR("contact"));

  if (v29)
  {
    v30 = SFDataFromCGImage(v29);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
  }
  else
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x3032000000;
    v49 = sub_1001BDDA4;
    v50 = sub_1001BDDB4;
    v51 = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A2A0));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001BDE0C;
    v43[3] = &unk_10071A2C8;
    v43[4] = &buf;
    v43[5] = v41;
    objc_msgSend(v32, "monogramImageDataForContactSync:style:diameter:monogramsAsFlatImages:replyHandler:", v42, a4, v7, v43, a5);

    v33 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v46 = v21;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", v33, v27, v34);

    v35 = sharingXPCHelperLog();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = v36;
    v38 = self->_intervalID;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)v44 = 134217984;
      v45 = v38;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, v38, "monogramImageDataForContact", "%llu", v44, 0xCu);
    }

    v31 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

  }
  return v31;
}

- (id)copyConversationIdentityImageIconDataForImage:(id)a3 forConversationIdentifier:(id)a4 style:(int64_t)a5 diameter:(double)a6 monogramsAsFlatImages:(BOOL)a7 isContactImage:(BOOL *)a8
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t intervalID;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  CGImage *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  os_signpost_id_t v53;
  uint64_t v54;
  void *v55;
  _BOOL4 v59;
  _QWORD v60[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  os_signpost_id_t v70;

  v59 = a7;
  v11 = a3;
  v12 = a4;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_1001BDDA4;
  v65 = sub_1001BDDB4;
  v66 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_uri"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[SDXPCHelperConnection copyConversationIdentityImageIconDataForImage:forConversationIdentifier:style:diameter:monogramsAsFlatImages:isContactImage:]"));
  v15 = sharingXPCHelperLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134217984;
    v70 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
  }

  v19 = sharingXPCHelperLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_identifier"));
    *(_DWORD *)buf = 138412290;
    v70 = (os_signpost_id_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching donated contact icon for image %@", buf, 0xCu);

  }
  if (!objc_msgSend(v13, "isFileURL"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_identifier"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(",%@,%@,%f"), v12, v27, floor(a6)));
    goto LABEL_10;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

  if ((v24 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "attributesOfItemAtPath:error:", v26, 0));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileModificationDate));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("/")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastObject"));

    objc_msgSend(v28, "timeIntervalSince1970");
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(",%@,%@,%f,%f"), v31, v12, v32, floor(a6)));

LABEL_10:
    v34 = sharingXPCHelperLog();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = (os_signpost_id_t)v33;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "copyConversationIdentityImageIconDataForImage: cache key {%@}", buf, 0xCu);
    }

    v68 = v12;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));
    v37 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v33, v36, CFSTR("contact"));

    if (v37)
    {
      v38 = sharingXPCHelperLog();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = v39;
      v41 = self->_intervalID;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_DWORD *)buf = 134217984;
        v70 = v41;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, v41, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
      }

      v42 = SFDataFromCGImage(v37);
      v43 = (id)objc_claimAutoreleasedReturnValue(v42);
    }
    else
    {
      v44 = sharingXPCHelperLog();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "copyConversationIdentityImageIconDataForImage: image not found in cache", buf, 2u);
      }

      -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection _loadGroupContactIdentityImage:](self, "_loadGroupContactIdentityImage:", v11));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A2E8));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1001BE53C;
      v60[3] = &unk_10071A2C8;
      v60[4] = &v61;
      v60[5] = a8;
      objc_msgSend(v47, "monogramImageDataForContactSync:style:diameter:monogramsAsFlatImages:replyHandler:", v46, a5, v59, v60, a6);

      v48 = v62[5];
      v67 = v12;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
      +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", v48, v33, v49);

      v50 = sharingXPCHelperLog();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      v52 = v51;
      v53 = self->_intervalID;
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_DWORD *)buf = 134217984;
        v70 = v53;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v53, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
      }

      v43 = (id)v62[5];
    }
    goto LABEL_26;
  }
  v54 = sharingXPCHelperLog();
  v33 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
    sub_1001C2A60(v55, buf, v33);
  }
  v43 = 0;
LABEL_26:

  _Block_object_dispose(&v61, 8);
  return v43;
}

- (unint64_t)getContactBackgroundStyle
{
  UISUIActivityViewControllerConfiguration *latestHostConfig;
  void *v3;
  id v4;
  uint64_t v6;
  NSObject *v7;

  latestHostConfig = self->_latestHostConfig;
  if (latestHostConfig)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](latestHostConfig, "hostTraitCollection"));
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    if (v4 == (id)2)
      return 3;
    else
      return 2;
  }
  else
  {
    v6 = sharingXPCHelperLog(0, a2);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_1001C2B20();

    return 2;
  }
}

- (unint64_t)getOppositeBackgroundStyle:(unint64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 3;
  else
    return 2;
}

- (id)groupMonogramImageDataForContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 processOppositeBackgroundStyle:(BOOL)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t intervalID;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  _QWORD v29[8];
  BOOL v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  int64_t v34;
  double v35;
  unint64_t v36;
  BOOL v37;
  uint8_t buf[4];
  os_signpost_id_t v39;

  v12 = a3;
  v14 = sharingXPCHelperLog(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134217984;
    v39 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "groupMonogramImageDataForContacts", "%llu", buf, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[SDXPCHelperConnection groupMonogramImageDataForContacts:style:diameter:monogramsAsFlatImages:processOppositeBackgroundStyle:]"));
  v19 = -[SDXPCHelperConnection getContactBackgroundStyle](self, "getContactBackgroundStyle");
  if (!a7)
    v19 = -[SDXPCHelperConnection getOppositeBackgroundStyle:](self, "getOppositeBackgroundStyle:", v19);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001BE890;
  v32[3] = &unk_10071A310;
  v33 = v18;
  v34 = a4;
  v35 = a5;
  v37 = a6;
  v36 = v19;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001BE9C0;
  v29[3] = &unk_10071A3E8;
  v29[4] = self;
  v29[5] = a4;
  *(double *)&v29[6] = a5;
  v29[7] = v19;
  v30 = a6;
  v31 = a7;
  v20 = v18;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:](self, "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:", v12, v32, &stru_10071A350, v29, CFSTR("groupContacts")));

  v24 = sharingXPCHelperLog(v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  v27 = self->_intervalID;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 134217984;
    v39 = v27;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v27, "groupMonogramImageDataForContacts", "%llu", buf, 0xCu);
  }

  return v21;
}

- (id)urlToCGImgDataForCallHandoffIconWithAppIconImageData:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t intervalID;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  id v21;
  _QWORD v23[5];
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1001BDDA4;
  v29 = sub_1001BDDB4;
  v30 = 0;
  v10 = sharingXPCHelperLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "urlToCGImgDataForCallHandoffIconWithAppIconImageData", ", buf, 2u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A408));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001BEED0;
  v23[3] = &unk_10071A430;
  v23[4] = &v25;
  objc_msgSend(v14, "urlToCGImgDataForCallHandoffIconWithAppIconImageData:contact:replyHandler:", v6, v7, v23);

  v17 = sharingXPCHelperLog(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  v20 = self->_intervalID;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v20, "urlToCGImgDataForCallHandoffIconWithAppIconImageData", ", buf, 2u);
  }

  v21 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v21;
}

- (id)monogramImagesForMultipleContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t intervalID;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  _QWORD v25[7];
  BOOL v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  double v30;
  BOOL v31;
  uint8_t buf[4];
  os_signpost_id_t v33;

  v10 = a3;
  v12 = sharingXPCHelperLog(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 134217984;
    v33 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "monogramImagesForMultipleContacts", "%llu", buf, 0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001BF10C;
  v27[3] = &unk_10071A458;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[SDXPCHelperConnection monogramImagesForMultipleContacts:style:diameter:monogramsAsFlatImages:]"));
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001BF2C4;
  v25[3] = &unk_10071A4E8;
  v25[4] = self;
  v25[5] = a4;
  *(double *)&v25[6] = a5;
  v26 = a6;
  v16 = v28;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:](self, "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:", v10, v27, &stru_10071A478, v25, CFSTR("multipleContacts")));

  v20 = sharingXPCHelperLog(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = v21;
  v23 = self->_intervalID;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 134217984;
    v33 = v23;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v23, "monogramImagesForMultipleContacts", "%llu", buf, 0xCu);
  }

  return v17;
}

- (id)_loadGroupContactIdentityImage:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSData *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_imageData"));
  if (v4)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_uri"));
  if (!objc_msgSend(v5, "isFileURL"))
  {
LABEL_5:
    v12 = -[objc_class sharedConnection](off_1007B34B8(), "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v28 = 0;
    v14 = objc_msgSend(v13, "loadDataImageFromImage:scaledSize:error:", v3, &v28, off_1007B34C0());
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v28;

    if (!v15 || v16)
    {
      v23 = sharingXPCHelperLog(v17, v18);
      v21 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1001C2CF0();
      v4 = 0;
    }
    else
    {
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_imageData"));
      v20 = sharingXPCHelperLog(v4, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_identifier"));
        *(_DWORD *)buf = 138412290;
        v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully fetched identity image {%@}", buf, 0xCu);

      }
    }

    if (!v4)
    {
      v24 = 0;
      goto LABEL_14;
    }
LABEL_13:
    v24 = objc_alloc_init((Class)CNMutableContact);
    objc_msgSend(v24, "setImageData:", v4);
LABEL_14:
    v7 = v24;
    v25 = v7;
    goto LABEL_15;
  }
  v6 = APP_SANDBOX_READ;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)sandbox_extension_issue_file(v6, objc_msgSend(v7, "fileSystemRepresentation"), 0);
  if (v8)
  {
    v10 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v3, "_setSandboxExtensionData:", v11);

    goto LABEL_5;
  }
  v27 = sharingXPCHelperLog(0, v9);
  v4 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100023DC0(v7, v4);
  v25 = 0;
LABEL_15:

  return v25;
}

- (id)getOppositeColor:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  unsigned int v7;
  CGColor *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v3, "isEqual:", v6);

    if (v7)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    }
    else
    {
      v8 = (CGColor *)objc_msgSend(objc_retainAutorelease(v3), "CGColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.235294118, 0.235294118, 0.262745098, 0.6));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.6));
      v11 = objc_retainAutorelease(v9);
      v12 = CGColorEqualToColor(v8, (CGColorRef)objc_msgSend(v11, "CGColor"));
      v13 = v10;
      if (v12
        || (v14 = CGColorEqualToColor(v8, (CGColorRef)objc_msgSend(objc_retainAutorelease(v10), "CGColor")),
            v13 = v11,
            v14))
      {
        v6 = v13;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (id)CGImgForUIActivityTitles:(id)a3 foregroundColor:(id)a4 processOppositeColor:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t intervalID;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  BOOL v32;
  _QWORD v33[5];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[16];

  v8 = a4;
  v9 = a3;
  v11 = sharingXPCHelperLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgDataForUIActivityTitle", ", buf, 2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "-[SDXPCHelperConnection CGImgForUIActivityTitles:foregroundColor:processOppositeColor:]"));
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001BFC54;
  v37[3] = &unk_100719CF8;
  v16 = objc_alloc_init((Class)NSMutableArray);
  v38 = v16;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v37);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001BFCB8;
  v33[3] = &unk_10071A510;
  v36 = a5;
  v33[4] = self;
  v17 = v15;
  v34 = v17;
  v35 = v8;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001BFE0C;
  v30[3] = &unk_10071A5A0;
  v30[4] = self;
  v18 = v35;
  v31 = v18;
  v32 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:](self, "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:", v16, v33, &stru_10071A530, v30, CFSTR("activityTitles")));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001C0194;
  v28[3] = &unk_10071A578;
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v29 = v20;
  v21 = objc_msgSend(v19, "enumerateObjectsUsingBlock:", v28);
  v23 = sharingXPCHelperLog(v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  v26 = self->_intervalID;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v26, "CGImgDataForUIActivityTitle", ", buf, 2u);
  }

  return v20;
}

- (CGImage)CGImageWithCacheKey:(id)a3 contactIDs:(id)a4 type:(id)a5
{
  id v8;
  CGImage *v9;
  const __CFString *v10;
  void *v11;
  os_unfair_lock_s *p_cacheAccessLock;
  NSMutableDictionary *cacheAccessDict;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;

  v8 = a5;
  v9 = +[SDXPCHelperImageCache imageForKey:contactIDs:](_TtC16DaemoniOSLibrary21SDXPCHelperImageCache, "imageForKey:contactIDs:", a3, a4);
  if (v9)
    v10 = CFSTR("CacheHits");
  else
    v10 = CFSTR("CacheMisses");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", v10));

  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  cacheAccessDict = self->_cacheAccessDict;
  ++self->_cacheAccessCount;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cacheAccessDict, "objectForKeyedSubscript:", v11));
  v15 = self->_cacheAccessDict;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue") + 1));
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v11);

  os_unfair_lock_unlock(p_cacheAccessLock);
  return v9;
}

- (id)MD5HashOfStrings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  const char *v8;
  CC_LONG v9;
  id v10;
  uint64_t j;
  int8x16_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unsigned __int8 md[16];
  _BYTE v19[128];
  int8x16_t v20;

  v3 = a3;
  v20 = 0uLL;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v13 = v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)), "UTF8String");
        memset(md, 0, sizeof(md));
        v9 = strlen(v8);
        CC_MD5(v8, v9, md);
        v13 = veorq_s8(v13, *(int8x16_t *)md);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v5);
    v20 = v13;
  }
  v10 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 32);
  for (j = 0; j != 16; ++j)
    objc_msgSend(v10, "appendFormat:", CFSTR("%02x"), v20.u8[j]);

  return v10;
}

- (void)sendShareSheetInvocationMetricsWithAppBundleID:(id)a3 numSuggestions:(int64_t)a4 suggestionDisplayNames:(id)a5 extensionsCacheResult:(id)a6 isDarkMode:(BOOL)a7 duration:(int64_t)a8 isCollaborative:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  BOOL v27;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  if (self->_cacheAccessCount >= 1)
  {
    global_queue = dispatch_get_global_queue(-32768, 0);
    v19 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C05B8;
    block[3] = &unk_10071A5C8;
    block[4] = self;
    v21 = v16;
    v22 = v17;
    v23 = v15;
    v24 = a4;
    v25 = a8;
    v26 = a7;
    v27 = a9;
    dispatch_async(v19, block);

  }
}

- (CGImage)CGImgForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 processOppositeColor:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t intervalID;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CGImage *v25;
  void *v26;
  void *v27;
  void *v28;
  CGImage *v29;
  uint64_t v30;
  CGImage *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  SDXPCHelperConnection *v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  uint64_t v46;
  const void *v47;
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  unint64_t v53;
  BOOL v54;
  BOOL v55;
  _QWORD v56[5];
  uint8_t v57[4];
  os_signpost_id_t v58;
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v14 = a3;
  v49 = a4;
  v15 = v14;
  v17 = v15;
  if (v15)
  {
    v18 = sharingXPCHelperLog(v15, v16);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = intervalID;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForNameLabelWithStringDaemon", "%llu", (uint8_t *)&buf, 0xCu);
    }

    if (v8)
      v22 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties](self, "keyDerivedFromRelevantTraitCollectionProperties"));
    else
      v22 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle](self, "keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle"));
    v24 = v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:processOppositeColor:]"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCHelperConnection identifierForColor:](SDXPCHelperConnection, "identifierForColor:", v49));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingFormat:", CFSTR(",%@,%@,%lu,%i,%i,%@,"), v17, v27, a5, v10, v9, v24));

    v29 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v28, &__NSArray0__struct, CFSTR("nameLabel"));
    v31 = v29;
    if (v29)
    {
      v32 = sharingXPCHelperLog(v29, v30);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = v33;
      v35 = self->_intervalID;
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v35;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v35, "CGImgForNameLabelWithStringDaemon", "%llu", (uint8_t *)&buf, 0xCu);
      }

      if (v8)
        v25 = v31;
      else
        v25 = 0;
    }
    else
    {
      -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v60 = 0x3032000000;
      v61 = sub_1001BDDA4;
      v62 = sub_1001BDDB4;
      v63 = 0;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A5E8));
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1001C0BE8;
      v56[3] = &unk_10071A610;
      v56[4] = &buf;
      objc_msgSend(v36, "CGImgDataForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:replyHandler:", v17, v49, a5, v10, v9, v56);

      v37 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v28, &__NSArray0__struct);
      if (v8)
      {
        v39 = self;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](v39, "queuedBlocks"));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1001C0BF8;
        v50[3] = &unk_10071A638;
        v50[4] = v39;
        v51 = v49;
        v52 = v17;
        v53 = a5;
        v54 = v10;
        v55 = v9;
        v41 = objc_retainBlock(v50);
        objc_msgSend(v40, "addObject:", v41);

      }
      v42 = sharingXPCHelperLog(v37, v38);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v44 = v43;
      v45 = self->_intervalID;
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_DWORD *)v57 = 134217984;
        v58 = v45;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v45, "CGImgForNameLabelWithString", "%llu", v57, 0xCu);
      }

      v46 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v46)
      {
        v47 = (const void *)SFCreateCGImageFromData(v46);
        v25 = (CGImage *)CFAutorelease(v47);
      }
      else
      {
        v25 = 0;
      }
      _Block_object_dispose(&buf, 8);

    }
  }
  else
  {
    v23 = daemon_log(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      sub_1001C2DD8();
    v25 = 0;
  }

  return v25;
}

- (id)CGImgDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 processOppositeColor:(BOOL)a5 activityCategory:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t intervalID;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGImage *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  SDXPCHelperConnection *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  uint8_t v36[8];
  _QWORD v37[5];
  id v38;
  id v39;
  int64_t v40;
  _QWORD v41[5];
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v13 = sharingXPCHelperLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgDataForActivityMoreListEntryForActivityTitle", ", buf, 2u);
  }

  if (v7)
    v17 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties](self, "keyDerivedFromRelevantTraitCollectionProperties"));
  else
    v17 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle](self, "keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle"));
  v18 = (void *)v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgDataForActivityMoreListEntryForActivityTitle:labelColor:processOppositeColor:activityCategory:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCHelperConnection identifierForColor:](SDXPCHelperConnection, "identifierForColor:", v11));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(",%@,%@,%@,"), v10, v20, v18));

  v22 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v21, &__NSArray0__struct, CFSTR("activityTitle"));
  if (v22)
  {
    if (v7)
    {
      v23 = SFDataFromCGImage(v22);
      v24 = (id)objc_claimAutoreleasedReturnValue(v23);
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(_QWORD *)buf = 0;
    v43 = buf;
    v44 = 0x3032000000;
    v45 = sub_1001BDDA4;
    v46 = sub_1001BDDB4;
    v47 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A658));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001C1098;
    v41[3] = &unk_10071A610;
    v41[4] = buf;
    objc_msgSend(v25, "CGImgDataForActivityMoreListEntryForActivityTitle:labelColor:activityCategory:replyHandler:", v10, v11, a6, v41);

    v26 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", *((_QWORD *)v43 + 5), v21, &__NSArray0__struct);
    if (v7)
    {
      v28 = self;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](v28, "queuedBlocks"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1001C10A8;
      v37[3] = &unk_100716BB0;
      v37[4] = v28;
      v38 = v11;
      v39 = v10;
      v40 = a6;
      v30 = objc_retainBlock(v37);
      objc_msgSend(v29, "addObject:", v30);

    }
    v31 = sharingXPCHelperLog(v26, v27);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = v32;
    v34 = self->_intervalID;
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v36 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v34, "CGImgDataForActivityMoreListEntryForActivityTitle", ", v36, 2u);
    }

    v24 = *((id *)v43 + 5);
    _Block_object_dispose(buf, 8);

  }
  return v24;
}

- (CGImage)CGImgForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t intervalID;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGImage *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint64_t v25;
  const void *v26;
  uint8_t v28[8];
  _QWORD v29[5];
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v9 = sharingXPCHelperLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForActionPlatterWithTitle", ", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForActionPlatterWithTitle:tintColor:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDXPCHelperConnection identifierForColor:](SDXPCHelperConnection, "identifierForColor:", v7));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties](self, "keyDerivedFromRelevantTraitCollectionProperties"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(",%@,%@,%@,"), v6, v14, v15));

  v17 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v16, &__NSArray0__struct, CFSTR("actionPlatter"));
  if (!v17)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(_QWORD *)buf = 0;
    v31 = buf;
    v32 = 0x3032000000;
    v33 = sub_1001BDDA4;
    v34 = sub_1001BDDB4;
    v35 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A678));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001C148C;
    v29[3] = &unk_10071A610;
    v29[4] = buf;
    objc_msgSend(v18, "CGImgDataForActionPlatterWithTitle:tintColor:replyHandler:", v6, v7, v29);

    v19 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", *((_QWORD *)v31 + 5), v16, &__NSArray0__struct);
    v21 = sharingXPCHelperLog(v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    v24 = self->_intervalID;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v24, "CGImgForActionPlatterWithTitle", ", v28, 2u);
    }

    v25 = *((_QWORD *)v31 + 5);
    if (v25)
    {
      v26 = (const void *)SFCreateCGImageFromData(v25);
      v17 = (CGImage *)CFAutorelease(v26);
    }
    else
    {
      v17 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  return v17;
}

- (CGImage)CGImgForNearbyBadgeWithCount:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t intervalID;
  void *v9;
  void *v10;
  void *v11;
  CGImage *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  const void *v21;
  uint8_t v23[8];
  _QWORD v24[5];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = sharingXPCHelperLog(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForNearbyBadgeWithCount", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForNearbyBadgeWithCount:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties](self, "keyDerivedFromRelevantTraitCollectionProperties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%li,%@"), a3, v10));

  v12 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v11, &__NSArray0__struct, CFSTR("nearbyBadge"));
  if (!v12)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = sub_1001BDDA4;
    v29 = sub_1001BDDB4;
    v30 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A698));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001C175C;
    v24[3] = &unk_10071A610;
    v24[4] = buf;
    objc_msgSend(v13, "CGImgDataForNearbyBadgeWithCount:replyHandler:", a3, v24);

    v14 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", *((_QWORD *)v26 + 5), v11, &__NSArray0__struct);
    v16 = sharingXPCHelperLog(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    v19 = self->_intervalID;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "CGImgForNearbyBadgeWithCount", ", v23, 2u);
    }

    v20 = *((_QWORD *)v26 + 5);
    if (v20)
    {
      v21 = (const void *)SFCreateCGImageFromData(v20);
      v12 = (CGImage *)CFAutorelease(v21);
    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  return v12;
}

- (id)loadBatchImageCacheData:(id)a3 cacheKey:(id)a4 mapCacheHitImage:(id)a5 runProxy:(id)a6 type:(id)a7
{
  id v12;
  uint64_t (**v13)(id, void *);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CGImage *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  uint64_t (**v45)(id, void *);
  id v46;
  void *v47;
  id obj;
  uint64_t (**v49)(id, void *, CGImage *);
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v12 = a3;
  v13 = (uint64_t (**)(id, void *))a4;
  v49 = (uint64_t (**)(id, void *, CGImage *))a5;
  v45 = (uint64_t (**)(id, void *))a6;
  v50 = a7;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v20 = v13[2](v13, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        objc_msgSend(v19, "setCacheLookupKey:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cacheLookupKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contactIDs"));
        v24 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:](self, "CGImageWithCacheKey:contactIDs:type:", v22, v23, v50);

        if (v24)
        {
          v25 = v49[2](v49, v19, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          objc_msgSend(v14, "addObject:", v26);

        }
        else
        {
          objc_msgSend(v47, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v16);
  }

  v27 = objc_msgSend(v47, "count");
  if (v27)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    v29 = v45[2](v45, v47);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v46 = (id)objc_claimAutoreleasedReturnValue(v29);
    v30 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(v46);
          v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageData", v45));

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageData"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cacheLookupKey"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contactIDs"));
            +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:](SDXPCHelperConnection, "updateCacheFromSFCGImageData:cacheKey:contactIDs:", v36, v37, v38);

          }
          objc_msgSend(v14, "addObject:", v34);
        }
        v31 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      }
      while (v31);
    }

  }
  v39 = sharingXPCHelperLog(v27, v28);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = objc_msgSend(obj, "count");
    v42 = objc_msgSend(v47, "count");
    v43 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218496;
    v60 = v41;
    v61 = 2048;
    v62 = v42;
    v63 = 2048;
    v64 = v43;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Need image data for %lu images, %lu are not in cache, return %lu image data.", buf, 0x20u);
  }

  return v14;
}

+ (id)identifierForColor:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    v6 = 0;
    v5 = 0;
    objc_msgSend(a3, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(UIColor %.1f,%.1f,%.1f,%.1f)"), v8, v7, v6, v5));
  }
  return v3;
}

- (id)keyDerivedFromRelevantTraitCollectionProperties
{
  UISUIActivityViewControllerConfiguration *v2;
  uint64_t v3;
  UISUIActivityViewControllerConfiguration *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;

  v2 = self->_latestHostConfig;
  v4 = v2;
  if (v2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v2, "hostTraitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",%li,%@,%li,"), v6, v8, objc_msgSend(v9, "layoutDirection")));

  }
  else
  {
    v11 = sharingXPCHelperLog(0, v3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_1001C2B20();

    v10 = CFSTR("NULL");
  }

  return v10;
}

- (id)keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle
{
  UISUIActivityViewControllerConfiguration *v2;
  uint64_t v3;
  UISUIActivityViewControllerConfiguration *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;

  v2 = self->_latestHostConfig;
  v4 = v2;
  if (v2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v2, "hostTraitCollection"));
    if (objc_msgSend(v5, "userInterfaceStyle") == (id)1)
      v6 = 2;
    else
      v6 = 1;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",%li,%@,%li,"), v6, v8, objc_msgSend(v9, "layoutDirection")));

  }
  else
  {
    v11 = sharingXPCHelperLog(0, v3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_1001C2B20();

    v10 = CFSTR("NULL");
  }

  return v10;
}

- (id)perspectiveDataForUIActivityTitle:(id)a3 textColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1001BDDA4;
  v16 = sub_1001BDDB4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A6B8));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C1F34;
  v11[3] = &unk_10071A6E0;
  v11[4] = &v12;
  objc_msgSend(v8, "perspectiveDataForUIActivityTitle:textColor:replyHandler:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1001BDDA4;
  v22 = sub_1001BDDB4;
  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A700));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C20D4;
  v17[3] = &unk_10071A6E0;
  v17[4] = &v18;
  objc_msgSend(v14, "perspectiveDataForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:replyHandler:", v12, v13, a5, v8, v7, v17);

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (id)perspectiveDataForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1001BDDA4;
  v16 = sub_1001BDDB4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A720));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C224C;
  v11[3] = &unk_10071A6E0;
  v11[4] = &v12;
  objc_msgSend(v8, "perspectiveDataForActionPlatterWithTitle:tintColor:replyHandler:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1001BDDA4;
  v18 = sub_1001BDDB4;
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A740));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C23D4;
  v13[3] = &unk_10071A6E0;
  v13[4] = &v14;
  objc_msgSend(v10, "perspectiveDataForActivityMoreListEntryForActivityTitle:labelColor:activityCategory:replyHandler:", v8, v9, a5, v13);

  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)perspectiveDataForNearbyBadgeWithCount:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1001BDDA4;
  v13 = sub_1001BDDB4;
  v14 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A760));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C252C;
  v8[3] = &unk_10071A6E0;
  v8[4] = &v9;
  objc_msgSend(v5, "perspectiveDataForNearbyBadgeWithCount:replyHandler:", a3, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)updateShareSheetHostConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_latestHostConfig, a3);
}

- (void)_updateShareSheetHostConfiguration
{
  UISUIActivityViewControllerConfiguration *v3;
  uint64_t v4;
  UISUIActivityViewControllerConfiguration *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t intervalID;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint64_t v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = self->_latestHostConfig;
  v5 = v3;
  if (v3)
  {
    v6 = sharingXPCHelperLog(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "updateShareSheetHostConfiguration", ", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connectionToService, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_10071A780));
    objc_msgSend(v10, "updateShareSheetHostConfiguration:", v5);

    v13 = sharingXPCHelperLog(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    v16 = self->_intervalID;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v16, "updateShareSheetHostConfiguration", ", v18, 2u);
    }
  }
  else
  {
    v17 = daemon_log(0);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_1001C31D0();
  }

}

- (void)setSessionKeepAliveTransactionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  self->_needsTransactionRelease = v4 != 0;
  v8 = v4;
  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connectionToService, "remoteObjectProxyWithErrorHandler:", &stru_10071A7A0));
  objc_msgSend(v7, "setSessionKeepAliveTransactionIdentifier:", v6);

}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSMutableArray)queuedBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueuedBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queuedBlocks, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_latestHostConfig, 0);
  objc_storeStrong((id *)&self->_cacheAccessDict, 0);
  objc_storeStrong((id *)&self->_signpostName, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
