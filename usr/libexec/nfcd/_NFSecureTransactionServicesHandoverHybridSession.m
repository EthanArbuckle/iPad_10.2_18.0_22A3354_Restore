@implementation _NFSecureTransactionServicesHandoverHybridSession

- (_NFSecureTransactionServicesHandoverHybridSession)initWithRemoteObject:(id)a3 role:(unint64_t)a4 type:(unint64_t)a5 expressModeManager:(id)a6 seWrapper:(id)a7 driverWrapper:(id)a8 workQueue:(id)a9
{
  id v16;
  id v17;
  char *v18;
  char *v19;
  objc_super v21;

  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  v18 = -[_NFXPCSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:](&v21, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:", a3, a9, a6, 1);
  v19 = v18;
  if (v18)
  {
    *(_QWORD *)(v18 + 363) = a4;
    *(_QWORD *)(v18 + 371) = a5;
    objc_storeStrong((id *)(v18 + 387), a7);
    objc_storeStrong((id *)(v19 + 379), a8);
  }

  return (_NFSecureTransactionServicesHandoverHybridSession *)v19;
}

+ (BOOL)isRoleValid:(unint64_t)a3
{
  return a3 == 3 || a3 == 0;
}

- (BOOL)willStartSession
{
  STSHelperLibrary *v3;
  objc_super v5;

  v3 = objc_opt_new(STSHelperLibrary);
  -[_NFSecureTransactionServicesHandoverHybridSession setStsHelper:](self, "setStsHelper:", v3);

  v5.receiver = self;
  v5.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  return -[_NFContactlessSession willStartSession](&v5, "willStartSession");
}

- (void)endSession:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
  objc_msgSend(v5, "invalidate");

  -[_NFSecureTransactionServicesHandoverHybridSession setStsHelper:](self, "setStsHelper:", 0);
  v6.receiver = self;
  v6.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  -[_NFXPCSession endSession:](&v6, "endSession:", v4);

}

- (void)startSTSNotificationListenerEndpoint:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  id v35;
  const char *v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;

  v5 = a3;
  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v14, ClassName, Name, 99, v13);

    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      *(_DWORD *)buf = 67110146;
      v38 = v19;
      v39 = 2082;
      v40 = v20;
      v41 = 2082;
      v42 = v21;
      v43 = 1024;
      v44 = 99;
      v45 = 2114;
      v46 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", buf, 0x2Cu);

    }
  }
  else
  {
    v23 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v24 = NFLogGetLogger(v23);
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(self);
      v36 = sel_getName(a2);
      v29 = 45;
      if (v27)
        v29 = 43;
      v25(6, "%c[%{public}s %{public}s]:%i ", v29, v28, v36, 102);
    }
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      *(_DWORD *)buf = 67109890;
      v38 = v34;
      v39 = 2082;
      v40 = object_getClassName(self);
      v41 = 2082;
      v42 = sel_getName(a2);
      v43 = 1024;
      v44 = 102;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    v17 = objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
    v35 = -[NSObject connectToNotificationListener:](v17, "connectToNotificationListener:", v5);
  }

}

- (void)getAppletsWithCompletion:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  -[_NFContactlessPaymentSession getAppletsWithCompletion:](&v3, "getAppletsWithCompletion:", a3);
}

- (void)startDeferredCardEmulationWithAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v15[0] = v9;
  v15[1] = &off_100303608;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 119);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v13 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 14, v12);
  (*((void (**)(id, id))a4 + 2))(v6, v13);

}

- (void)startHostCardEmulationWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v5 = a3;
  v6 = objc_alloc((Class)NSError);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v13[0] = NSLocalizedDescriptionKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v14[0] = v8;
  v14[1] = &off_100303620;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 125);
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v12 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 14, v11);
  (*((void (**)(id, id))a3 + 2))(v5, v12);

}

- (void)getFelicaAppletState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v15[0] = v9;
  v15[1] = &off_100303638;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 131);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v13 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 14, v12);
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v13);

}

- (void)getTransitAppletState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v15[0] = v9;
  v15[1] = &off_100303650;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 137);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v13 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 14, v12);
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v13);

}

- (void)enablePlasticCardMode:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v6 = a4;
  v7 = objc_alloc((Class)NSError);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v14[0] = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v15[0] = v9;
  v15[1] = &off_100303668;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v15[2] = v10;
  v14[3] = NSDebugDescriptionErrorKey;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 143);
  v15[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
  v13 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 14, v12);
  (*((void (**)(id, id))a4 + 2))(v6, v13);

}

- (void)startExpressModeWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v5 = a3;
  v6 = objc_alloc((Class)NSError);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v13[0] = NSLocalizedDescriptionKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Feature Not Supported"));
  v14[0] = v8;
  v14[1] = &off_100303680;
  v13[1] = CFSTR("Line");
  v13[2] = CFSTR("Method");
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v14[2] = v9;
  v13[3] = NSDebugDescriptionErrorKey;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 149);
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
  v12 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 14, v11);
  (*((void (**)(id, id))a3 + 2))(v5, v12);

}

- (void)handleFieldChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  _QWORD v5[6];

  v3 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002196FC;
  v5[3] = &unk_1002E5F60;
  v5[4] = self;
  v5[5] = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v5));
  objc_msgSend(v4, "fieldChange:", v3);

}

- (void)handleFieldNotification:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  _NFSecureTransactionServicesHandoverHybridSession *v10;
  SEL v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100219910;
  v9 = &unk_1002E5F60;
  v10 = self;
  v11 = a2;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", &v6));
  objc_msgSend(v5, "fieldNotification:", v4, v6, v7, v8, v9, v10, v11);

}

- (void)handleHostCardReaderDetected:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = NFSharedSignpostLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[_NFSession signpostId](self, "signpostId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, v8, "ReaderDetected", ", v9, 2u);
    }
  }

  -[_NFSecureTransactionServicesHandoverHybridSession startHCEProcessingWithDevice:completion:](self, "startHCEProcessingWithDevice:completion:", v4, 0);
}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id *v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v6)
    goto LABEL_10;
  v7 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagA"));
      if (v10)
      {

LABEL_13:
        v6 = v9;

        if (!v6)
          goto LABEL_16;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession driverWrapper](self, "driverWrapper"));
        if (v13)
        {
          v14 = v13;
          v15 = sub_10017E9A4(v13, v6, 0);

          if (v15)
            goto LABEL_16;
        }
        v17 = NFSharedSignpostLog(v13);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = -[_NFSession signpostId](self, "signpostId");
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v20 = v19;
          if (os_signpost_enabled(v18))
          {
            *(_WORD *)v25 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, v20, "TargetTagDetected", ", v25, 2u);
          }
        }

        -[_NFSecureTransactionServicesHandoverHybridSession setConnectedTag:](self, "setConnectedTag:", v6);
        v21 = objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
        if (v21)
        {
          v22 = (void *)v21;
          if ((id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)4)
          {

LABEL_25:
            v16 = (id *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession connectedTag](self, "connectedTag"));
            sub_10023B858(v16, v24);

            goto LABEL_17;
          }
          v23 = -[_NFSecureTransactionServicesHandoverHybridSession role](self, "role");

          if (v23 == 1)
            goto LABEL_25;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NFSecureTransactionServicesHandoverHybridSession.m"), 220, CFSTR("Tag not handle!"));
        goto LABEL_11;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagB"));

      if (v11)
        goto LABEL_13;
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
      continue;
    break;
  }
LABEL_10:
  v12 = v5;
LABEL_11:

LABEL_16:
  v16 = (id *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession driverWrapper](self, "driverWrapper"));
  sub_1001FBF60(v16);
LABEL_17:

}

+ (id)validateEntitlements:(id)a3
{
  id v5;
  id v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  const char *Name;
  _QWORD v27[4];
  _QWORD v28[4];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v5 = a3;
  if (objc_msgSend(v5, "seSessionAccess") && (objc_msgSend(v5, "hceAccess") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v13, ClassName, Name, 232);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(a1);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v30 = v18;
      v31 = 2082;
      v32 = object_getClassName(a1);
      v33 = 2082;
      v34 = sel_getName(a2);
      v35 = 1024;
      v36 = 232;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    v19 = objc_alloc((Class)NSError);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v27[0] = NSLocalizedDescriptionKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
    v28[0] = v21;
    v28[1] = &off_100303698;
    v27[1] = CFSTR("Line");
    v27[2] = CFSTR("Method");
    v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v28[2] = v22;
    v27[3] = NSDebugDescriptionErrorKey;
    v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 233);
    v28[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    v6 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 32, v24);

  }
  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode");
}

- (void)cleanup
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  const char *Name;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;

  v4 = NFSharedSignpostLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }

  if (-[_NFSession needsCleanup](self, "needsCleanup") && !-[_NFSession isSuspended](self, "isSuspended"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOffWithFD:](NFRoutingConfig, "routingOffWithFD:", 0));
    v8 = objc_msgSend(v6, "setRoutingConfig:", v7);

    if ((id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)1
      || (id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      v10 = objc_msgSend(v9, "configureECPPolling:", 0);

      if ((v10 & 1) == 0)
      {
        specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = NFLogGetLogger(specific);
        if (Logger)
        {
          v13 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          v17 = 45;
          if (isMetaClass)
            v17 = 43;
          v13(3, "%c[%{public}s %{public}s]:%i Failed to restore ECP", v17, ClassName, Name, 253);
        }
        v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v19 = NFSharedLogGetLogger(v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = object_getClass(self);
          if (class_isMetaClass(v21))
            v22 = 43;
          else
            v22 = 45;
          v23 = object_getClassName(self);
          v24 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          v32 = v22;
          v33 = 2082;
          v34 = v23;
          v35 = 2082;
          v36 = v24;
          v37 = 1024;
          v38 = 253;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to restore ECP", buf, 0x22u);
        }

      }
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
    objc_msgSend(v25, "invalidate");

  }
  v30.receiver = self;
  v30.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  v26 = -[_NFContactlessPaymentSession cleanup](&v30, "cleanup");
  v27 = NFSharedSignpostLog(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "cleanup", "_NFSecureTransactionServicesHelperSession", buf, 2u);
  }

}

- (void)_setReaderECP
{
  void *v2;
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026AA10, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  objc_msgSend(v2, "configureECPPolling:", v3);

}

- (void)_startSEProxyListener
{
  NFSecureElementProxyListener *v4;
  void *v5;
  NFSecureElementProxyListener *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;

  v4 = [NFSecureElementProxyListener alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession driverWrapper](self, "driverWrapper"));
  v6 = -[NFSecureElementProxyListener initWithDriverWrapper:](v4, "initWithDriverWrapper:", v5);
  -[_NFSecureTransactionServicesHandoverHybridSession setSeProxyListener:](self, "setSeProxyListener:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession seProxyListener](self, "seProxyListener"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startSEProxyListener:parameters:workQueue:", v8, &__NSDictionary0__struct, v9));

  if (v10)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i SE proxy listener start error=%{public}@", v16, ClassName, Name, 278, v10);
    }
    v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67110146;
      v25 = v21;
      v26 = 2082;
      v27 = object_getClassName(self);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 278;
      v32 = 2114;
      v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SE proxy listener start error=%{public}@", buf, 0x2Cu);
    }

  }
}

- (void)didStartSession:(id)a3
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  void *specific;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  os_signpost_id_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  unint64_t v32;
  os_signpost_id_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  objc_class *v38;
  _BOOL4 v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  unint64_t v52;
  os_signpost_id_t v53;
  const char *v54;
  NSObject *v55;
  os_signpost_type_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  _BOOL4 v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  unint64_t v75;
  os_signpost_id_t v76;
  const char *v77;
  NSObject *v78;
  os_signpost_type_t v79;
  uint64_t v80;
  NSObject *v81;
  unint64_t v82;
  os_signpost_id_t v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  objc_class *v96;
  int v97;
  const char *v98;
  const char *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  objc_class *v107;
  _BOOL4 v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  NSObject *v113;
  objc_class *v114;
  int v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  unint64_t v121;
  os_signpost_id_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  NSObject *v126;
  unint64_t v127;
  os_signpost_id_t v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  unint64_t v132;
  os_signpost_id_t v133;
  uint64_t v134;
  unint64_t v135;
  void *v136;
  const char *ClassName;
  const char *Name;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  _QWORD v143[5];
  _QWORD *v144;
  _QWORD *v145;
  SEL v146;
  _QWORD v147[5];
  _QWORD *v148;
  _QWORD *v149;
  SEL v150;
  _QWORD v151[6];
  _QWORD v152[6];
  objc_super v153;
  _QWORD v154[4];
  _QWORD v155[4];
  void *v156;
  uint8_t buf[4];
  _BYTE v158[14];
  __int16 v159;
  const char *v160;
  __int16 v161;
  int v162;
  __int16 v163;
  unint64_t v164;

  v5 = a3;
  v153.receiver = self;
  v153.super_class = (Class)_NFSecureTransactionServicesHandoverHybridSession;
  -[_NFContactlessPaymentSession didStartSession:](&v153, "didStartSession:", v5);
  v152[0] = _NSConcreteStackBlock;
  v152[1] = 3221225472;
  v152[2] = sub_10021B4D8;
  v152[3] = &unk_1002E5F60;
  v152[4] = self;
  v152[5] = a2;
  v6 = objc_retainBlock(v152);
  v151[0] = _NSConcreteStackBlock;
  v151[1] = 3221225472;
  v151[2] = sub_10021B878;
  v151[3] = &unk_1002E5C30;
  v151[4] = self;
  v151[5] = a2;
  v7 = objc_retainBlock(v151);
  if (v5)
  {
    ((void (*)(_QWORD *, id))v6[2])(v6, v5);
    goto LABEL_93;
  }
  if ((id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)1
    || (id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)4)
  {
    -[_NFSecureTransactionServicesHandoverHybridSession _setReaderECP](self, "_setReaderECP");
    if ((id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)1)
    {
      v8 = -[_NFSecureTransactionServicesHandoverHybridSession getCHConfig](self, "getCHConfig");
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v11 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v11(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", v14, ClassName, Name, 313, v8);
      }
      v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v16 = NFSharedLogGetLogger(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        v20 = object_getClassName(self);
        v21 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v158 = v19;
        *(_WORD *)&v158[4] = 2082;
        *(_QWORD *)&v158[6] = v20;
        v159 = 2082;
        v160 = v21;
        v161 = 1024;
        v162 = 313;
        v163 = 2048;
        v164 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 reader polling, hoConfig=0x%lx", buf, 0x2Cu);
      }

      v23 = NFSharedSignpostLog(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = -[_NFSession signpostId](self, "signpostId");
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v26 = v25;
        if (os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "Start_ISO18013_Reader", ", buf, 2u);
        }
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", v8, -[_NFSecureTransactionServicesHandoverHybridSession getSTSHelperOperation](self, "getSTSHelperOperation"), self));

      v30 = NFSharedSignpostLog(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      v32 = -[_NFSession signpostId](self, "signpostId");
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v158 = v28;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v33, "Start_ISO18013_Reader", "error=%@", buf, 0xCu);
        }
      }

      if (v28)
      {
LABEL_22:
        ((void (*)(_QWORD *, void *))v6[2])(v6, v28);
LABEL_92:

        goto LABEL_93;
      }
      v80 = NFSharedSignpostLog(v34);
      v81 = objc_claimAutoreleasedReturnValue(v80);
      v82 = -[_NFSession signpostId](self, "signpostId");
      if (v82 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v83 = v82;
        if (os_signpost_enabled(v81))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v81, OS_SIGNPOST_INTERVAL_BEGIN, v83, "Start_SEProxyListener", ", buf, 2u);
        }
      }

      v84 = NFSharedSignpostLog(-[_NFSecureTransactionServicesHandoverHybridSession _startSEProxyListener](self, "_startSEProxyListener"));
      v51 = objc_claimAutoreleasedReturnValue(v84);
      v85 = -[_NFSession signpostId](self, "signpostId");
      if (v85 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v53 = v85, !os_signpost_enabled(v51)))
      {
LABEL_58:

        v147[0] = _NSConcreteStackBlock;
        v147[1] = 3221225472;
        v147[2] = sub_10021BA80;
        v147[3] = &unk_1002E61C8;
        v147[4] = self;
        v150 = a2;
        v148 = v6;
        v149 = v7;
        -[_NFSecureTransactionServicesHandoverHybridSession _startTNEPReaderWithCallback:](self, "_startTNEPReaderWithCallback:", v147);

        goto LABEL_93;
      }
      *(_WORD *)buf = 0;
      v54 = "Start_SEProxyListener";
      v55 = v51;
      v56 = OS_SIGNPOST_INTERVAL_END;
    }
    else
    {
      v35 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v36 = NFLogGetLogger(v35);
      if (v36)
      {
        v37 = (void (*)(uint64_t, const char *, ...))v36;
        v38 = object_getClass(self);
        v39 = class_isMetaClass(v38);
        v40 = object_getClassName(self);
        v139 = sel_getName(a2);
        v41 = 45;
        if (v39)
          v41 = 43;
        v37(6, "%c[%{public}s %{public}s]:%i Starting TNEP reader", v41, v40, v139, 330);
      }
      v42 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v43 = NFSharedLogGetLogger(v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = object_getClass(self);
        if (class_isMetaClass(v45))
          v46 = 43;
        else
          v46 = 45;
        v47 = object_getClassName(self);
        v48 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v158 = v46;
        *(_WORD *)&v158[4] = 2082;
        *(_QWORD *)&v158[6] = v47;
        v159 = 2082;
        v160 = v48;
        v161 = 1024;
        v162 = 330;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP reader", buf, 0x22u);
      }

      v50 = NFSharedSignpostLog(v49);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      v52 = -[_NFSession signpostId](self, "signpostId");
      if (v52 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_58;
      v53 = v52;
      if (!os_signpost_enabled(v51))
        goto LABEL_58;
      *(_WORD *)buf = 0;
      v54 = "Start_TNEP_Reader";
      v55 = v51;
      v56 = OS_SIGNPOST_EVENT;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, v56, v53, v54, "", buf, 2u);
    goto LABEL_58;
  }
  if (!-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role")
    || (id)-[_NFSecureTransactionServicesHandoverHybridSession role](self, "role") == (id)3)
  {
    v57 = -[_NFSecureTransactionServicesHandoverHybridSession role](self, "role");
    v58 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v59 = NFLogGetLogger(v58);
    v60 = (void (*)(uint64_t, const char *, ...))v59;
    if (v57)
    {
      if (v59)
      {
        v61 = object_getClass(self);
        v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        v140 = sel_getName(a2);
        v64 = 45;
        if (v62)
          v64 = 43;
        v60(6, "%c[%{public}s %{public}s]:%i Starting TNEP device", v64, v63, v140, 360);
      }
      v65 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v66 = NFSharedLogGetLogger(v65);
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = object_getClass(self);
        if (class_isMetaClass(v68))
          v69 = 43;
        else
          v69 = 45;
        v70 = object_getClassName(self);
        v71 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v158 = v69;
        *(_WORD *)&v158[4] = 2082;
        *(_QWORD *)&v158[6] = v70;
        v159 = 2082;
        v160 = v71;
        v161 = 1024;
        v162 = 360;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting TNEP device", buf, 0x22u);
      }

      v73 = NFSharedSignpostLog(v72);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      v75 = -[_NFSession signpostId](self, "signpostId");
      if (v75 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_91;
      v76 = v75;
      if (!os_signpost_enabled(v74))
        goto LABEL_91;
      *(_WORD *)buf = 0;
      v77 = "Start_TNEP_Device";
      v78 = v74;
      v79 = OS_SIGNPOST_EVENT;
    }
    else
    {
      if (v59)
      {
        v107 = object_getClass(self);
        v108 = class_isMetaClass(v107);
        v109 = object_getClassName(self);
        v142 = sel_getName(a2);
        v110 = 45;
        if (v108)
          v110 = 43;
        v60(6, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", v110, v109, v142, 344);
      }
      v111 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v112 = NFSharedLogGetLogger(v111);
      v113 = objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        v114 = object_getClass(self);
        if (class_isMetaClass(v114))
          v115 = 43;
        else
          v115 = 45;
        v116 = object_getClassName(self);
        v117 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v158 = v115;
        *(_WORD *)&v158[4] = 2082;
        *(_QWORD *)&v158[6] = v116;
        v159 = 2082;
        v160 = v117;
        v161 = 1024;
        v162 = 344;
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Starting ISO18013 device", buf, 0x22u);
      }

      v119 = NFSharedSignpostLog(v118);
      v120 = objc_claimAutoreleasedReturnValue(v119);
      v121 = -[_NFSession signpostId](self, "signpostId");
      if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v122 = v121;
        if (os_signpost_enabled(v120))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v120, OS_SIGNPOST_INTERVAL_BEGIN, v122, "Start_ISO18013_Device", ", buf, 2u);
        }
      }

      v123 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", -[_NFSecureTransactionServicesHandoverHybridSession getCHConfig](self, "getCHConfig"), -[_NFSecureTransactionServicesHandoverHybridSession getSTSHelperOperation](self, "getSTSHelperOperation"), self));

      v125 = NFSharedSignpostLog(v124);
      v126 = objc_claimAutoreleasedReturnValue(v125);
      v127 = -[_NFSession signpostId](self, "signpostId");
      if (v127 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v128 = v127;
        if (os_signpost_enabled(v126))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v158 = v28;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v126, OS_SIGNPOST_INTERVAL_END, v128, "Start_ISO18013_Device", "error=%@", buf, 0xCu);
        }
      }

      if (v28)
        goto LABEL_22;
      v130 = NFSharedSignpostLog(v129);
      v131 = objc_claimAutoreleasedReturnValue(v130);
      v132 = -[_NFSession signpostId](self, "signpostId");
      if (v132 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v133 = v132;
        if (os_signpost_enabled(v131))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v131, OS_SIGNPOST_INTERVAL_BEGIN, v133, "Start_SEProxyListener", ", buf, 2u);
        }
      }

      v134 = NFSharedSignpostLog(-[_NFSecureTransactionServicesHandoverHybridSession _startSEProxyListener](self, "_startSEProxyListener"));
      v74 = objc_claimAutoreleasedReturnValue(v134);
      v135 = -[_NFSession signpostId](self, "signpostId");
      if (v135 - 1 > 0xFFFFFFFFFFFFFFFDLL || (v76 = v135, !os_signpost_enabled(v74)))
      {
LABEL_91:

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NFTNEPService serviceWithURI:minWaitTime:maxWaitTimeExtension:maxMessageSize:](NFTNEPService, "serviceWithURI:minWaitTime:maxWaitTimeExtension:maxMessageSize:", CFSTR("urn:nfc:sn:handover"), 20, 31, 2048));
        v156 = v28;
        v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v156, 1));
        v143[0] = _NSConcreteStackBlock;
        v143[1] = 3221225472;
        v143[2] = sub_10021BDCC;
        v143[3] = &unk_1002E61C8;
        v143[4] = self;
        v146 = a2;
        v144 = v6;
        v145 = v7;
        -[_NFSecureTransactionServicesHandoverHybridSession _startTNEPDeviceWithServices:optionalRecords:callback:](self, "_startTNEPDeviceWithServices:optionalRecords:callback:", v136, 0, v143);

        goto LABEL_92;
      }
      *(_WORD *)buf = 0;
      v77 = "Start_SEProxyListener";
      v78 = v74;
      v79 = OS_SIGNPOST_INTERVAL_END;
    }
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, v79, v76, v77, "", buf, 2u);
    goto LABEL_91;
  }
  v86 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v87 = NFLogGetLogger(v86);
  if (v87)
  {
    v88 = (void (*)(uint64_t, const char *, ...))v87;
    v89 = object_getClass(self);
    v90 = class_isMetaClass(v89);
    v91 = object_getClassName(self);
    v141 = sel_getName(a2);
    v92 = 45;
    if (v90)
      v92 = 43;
    v88(3, "%c[%{public}s %{public}s]:%i Invalid command", v92, v91, v141, 379);
  }
  v93 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v94 = NFSharedLogGetLogger(v93);
  v95 = objc_claimAutoreleasedReturnValue(v94);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
  {
    v96 = object_getClass(self);
    if (class_isMetaClass(v96))
      v97 = 43;
    else
      v97 = 45;
    v98 = object_getClassName(self);
    v99 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v158 = v97;
    *(_WORD *)&v158[4] = 2082;
    *(_QWORD *)&v158[6] = v98;
    v159 = 2082;
    v160 = v99;
    v161 = 1024;
    v162 = 379;
    _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid command", buf, 0x22u);
  }

  v100 = objc_alloc((Class)NSError);
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v154[0] = NSLocalizedDescriptionKey;
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid Command"));
  v155[0] = v102;
  v155[1] = &off_1003036E0;
  v154[1] = CFSTR("Line");
  v154[2] = CFSTR("Method");
  v103 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v155[2] = v103;
  v154[3] = NSDebugDescriptionErrorKey;
  v104 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 380);
  v155[3] = v104;
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v155, v154, 4));
  v106 = objc_msgSend(v100, "initWithDomain:code:userInfo:", v101, 11, v105);
  ((void (*)(_QWORD *, id))v6[2])(v6, v106);

LABEL_93:
}

- (unint64_t)defaultEmulationType
{
  return 6;
}

- (void)_startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9;
  void *specific;
  id v11;
  id v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  NFTNEPHandler *v23;
  unint64_t v24;
  _NFSecureTransactionServicesHandoverHybridSession *v25;
  void *v26;
  id *v27;
  void *v28;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;

  v9 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v11 = a5;
  v12 = a4;
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v14(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v17, ClassName, Name, 395, v9);
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67110146;
    v32 = v22;
    v33 = 2082;
    v34 = object_getClassName(self);
    v35 = 2082;
    v36 = sel_getName(a2);
    v37 = 1024;
    v38 = 395;
    v39 = 2114;
    v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i services=%{public}@", buf, 0x2Cu);
  }

  v23 = [NFTNEPHandler alloc];
  v24 = -[_NFSecureTransactionServicesHandoverHybridSession role](self, "role");
  if (v24)
    v25 = (_NFSecureTransactionServicesHandoverHybridSession *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  else
    v25 = self;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession driverWrapper](self, "driverWrapper"));
  v27 = sub_10023B6B8((id *)&v23->super.isa, 0, v25, v26, -[_NFSession signpostId](self, "signpostId"));
  -[_NFSecureTransactionServicesHandoverHybridSession setTnepHandler:](self, "setTnepHandler:", v27);

  if (v24)
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
  objc_msgSend(v28, "startTNEPDeviceWithServices:optionalRecords:callback:", v9, v12, v11);

}

- (void)_startTNEPReaderWithCallback:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  NFTNEPHandler *v18;
  unint64_t v19;
  _NFSecureTransactionServicesHandoverHybridSession *v20;
  void *v21;
  id *v22;
  void *v23;
  id v24;
  const char *Name;
  _QWORD v26[5];
  id v27;
  SEL v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 406);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = object_getClass(self);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v30 = v17;
    v31 = 2082;
    v32 = object_getClassName(self);
    v33 = 2082;
    v34 = sel_getName(a2);
    v35 = 1024;
    v36 = 406;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v18 = [NFTNEPHandler alloc];
  v19 = -[_NFSecureTransactionServicesHandoverHybridSession role](self, "role");
  v20 = self;
  if (v19 != 1)
    v20 = (_NFSecureTransactionServicesHandoverHybridSession *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession driverWrapper](self, "driverWrapper"));
  v22 = sub_10023B6B8((id *)&v18->super.isa, (void *)1, v20, v21, -[_NFSession signpostId](self, "signpostId"));
  -[_NFSecureTransactionServicesHandoverHybridSession setTnepHandler:](self, "setTnepHandler:", v22);

  if (v19 != 1)
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10021C61C;
  v26[3] = &unk_1002E6218;
  v27 = v5;
  v28 = a2;
  v26[4] = self;
  v24 = v5;
  objc_msgSend(v23, "startTNEPReaderWithCallback:", v26);

}

- (void)iso18013DataRetrievalCompleted
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 437);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 437;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig embeddedWiredMode](NFRoutingConfig, "embeddedWiredMode"));
  v18 = objc_msgSend(v16, "setRoutingConfig:", v17);

}

- (void)relinquishSEProxy
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 444);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v19 = v15;
    v20 = 2082;
    v21 = object_getClassName(self);
    v22 = 2082;
    v23 = sel_getName(a2);
    v24 = 1024;
    v25 = 444;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
  objc_msgSend(v16, "stopSEProxyListener");

  -[_NFSecureTransactionServicesHandoverHybridSession setSeProxyListener:](self, "setSeProxyListener:", 0);
}

- (void)restartNFCReaderDiscovery
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 452);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 452;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_1001FBF60(*(void **)((char *)&self->_type + 3));
}

- (void)reqlinquishNFCReaderProxy
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 458);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v21 = v15;
    v22 = 2082;
    v23 = object_getClassName(self);
    v24 = 2082;
    v25 = sel_getName(a2);
    v26 = 1024;
    v27 = 458;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
  v18 = objc_msgSend(v16, "setRoutingConfig:", v17);

}

- (void)coreDuetActivityRevoked
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D0B8;
  block[3] = &unk_1002E5C58;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D240;
  block[3] = &unk_1002E6240;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021DA2C;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)startTNEPReaderWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021E064;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepReaderSelectService:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021E5E0;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)tnepReaderDeselectWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021EC0C;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepReaderSend:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021F248;
  v12[3] = &unk_1002E6268;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)tnepReaderRestartPollingWithCallback:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021F860;
  block[3] = &unk_1002E5D28;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)tnepServiceInvalidate
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v8;
  const char *ClassName;
  const char *Name;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *v23;
  _BOOL4 isMetaClass;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  _QWORD block[4];
  id v35[2];
  id buf;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;

  if (!-[_NFSession didStart](self, "didStart")
    || -[_NFSession isSuspended](self, "isSuspended")
    || -[_NFSession didEnd](self, "didEnd"))
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      if (class_isMetaClass(Class))
        v8 = 43;
      else
        v8 = 45;
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      v6(3, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", v8, ClassName, Name, 607, v11);

    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession sessionUID](self, "sessionUID"));
      LODWORD(buf) = 67110146;
      HIDWORD(buf) = v16;
      v37 = 2082;
      v38 = v17;
      v39 = 2082;
      v40 = v18;
      v41 = 1024;
      v42 = 607;
      v43 = 2114;
      v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Session %{public}@ is not active", (uint8_t *)&buf, 0x2Cu);

    }
  }
  else
  {
    v20 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v21 = NFLogGetLogger(v20);
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      isMetaClass = class_isMetaClass(v23);
      v25 = object_getClassName(self);
      v33 = sel_getName(a2);
      v26 = 45;
      if (isMetaClass)
        v26 = 43;
      v22(6, "%c[%{public}s %{public}s]:%i ", v26, v25, v33, 609);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = object_getClass(self);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v31;
      v37 = 2082;
      v38 = object_getClassName(self);
      v39 = 2082;
      v40 = sel_getName(a2);
      v41 = 1024;
      v42 = 609;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
    }

    objc_initWeak(&buf, self);
    v32 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002201BC;
    block[3] = &unk_1002E6290;
    objc_copyWeak(v35, &buf);
    v35[1] = (id)a2;
    dispatch_async(v32, block);

    objc_destroyWeak(v35);
    objc_destroyWeak(&buf);
  }
}

- (void)tnepTagDeviceReaderDetected
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 628);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 628;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  unsigned int v9;
  uint64_t v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  void *v23;
  const char *Name;
  _QWORD v25[6];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("urn:nfc:sn:handover"));
  v10 = v9 ^ 1;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", v17, ClassName, Name, 638, v7, v10);
  }
  v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v19 = NFSharedLogGetLogger(v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = object_getClass(self);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67110402;
    v27 = v22;
    v28 = 2082;
    v29 = object_getClassName(self);
    v30 = 2082;
    v31 = sel_getName(a2);
    v32 = 1024;
    v33 = 638;
    v34 = 2114;
    v35 = v7;
    v36 = 2048;
    v37 = v9 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i service=%{public}@, status=%ld", buf, 0x36u);
  }

  if (v9)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100220778;
    v25[3] = &unk_1002E5F60;
    v25[4] = self;
    v25[5] = a2;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v25));
    objc_msgSend(v23, "connectionHandoverTNEPServiceSelected:", CFSTR("urn:nfc:sn:handover"));

  }
  v8[2](v8, v10, 0);

}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  NSErrorUserInfoKey v49;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession deviceHandoverSelectError](self, "deviceHandoverSelectError"));
    v14 = 45;
    if (isMetaClass)
      v14 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", v14, ClassName, Name, 652, v13, v5);

  }
  v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v16 = NFSharedLogGetLogger(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = object_getClass(self);
    if (class_isMetaClass(v18))
      v19 = 43;
    else
      v19 = 45;
    v20 = object_getClassName(self);
    v21 = sel_getName(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession deviceHandoverSelectError](self, "deviceHandoverSelectError"));
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = v19;
    v39 = 2082;
    v40 = v20;
    v41 = 2082;
    v42 = v21;
    v43 = 1024;
    v44 = 652;
    v45 = 2114;
    v46 = v22;
    v47 = 2114;
    v48 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CH status=%{public}@, link error=%{public}@", buf, 0x36u);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession deviceHandoverSelectError](self, "deviceHandoverSelectError"));

  if (v23)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100220D98;
    v37[3] = &unk_1002E5F60;
    v37[4] = self;
    v37[5] = a2;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v37));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession deviceHandoverSelectError](self, "deviceHandoverSelectError"));
    objc_msgSend(v24, "connectionHandoverProcessFailure:", v25);

    -[_NFSecureTransactionServicesHandoverHybridSession setDeviceHandoverSelectError:](self, "setDeviceHandoverSelectError:", 0);
  }
  else if (v5)
  {
    if (objc_msgSend(v5, "code") == (id)28)
    {
      v26 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[8];
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v28 = v26;
      v29 = 8;
    }
    else if (objc_msgSend(v5, "code") == (id)62 || objc_msgSend(v5, "code") == (id)59)
    {
      v31 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[2];
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v28 = v31;
      v29 = 2;
    }
    else
    {
      v32 = STS_XCPHELPER_ERROR_DOMAIN;
      v49 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = STSXPCHelperErrorDescriptions[10];
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v49, 1));
      v28 = v32;
      v29 = 10;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v28, v29, v27));

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100220F2C;
    v36[3] = &unk_1002E5F60;
    v36[4] = self;
    v36[5] = a2;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v36));
    objc_msgSend(v34, "connectionHandoverProcessFailure:", v33);

  }
  else
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002210C0;
    v35[3] = &unk_1002E5F60;
    v35[4] = self;
    v35[5] = a2;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v35));
    objc_msgSend(v30, "connectionHandoverProcessCompleted");

  }
}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[16];

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CH_Negotiation", ", buf, 2u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asData"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100221380;
  v13[3] = &unk_1002E62E0;
  v13[4] = self;
  v13[5] = a2;
  objc_msgSend(v10, "processConnectionHandoverRequestData:callbackQueue:responseHandler:", v11, v12, v13);

}

- (void)tnepReaderServicesDiscovered:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  const char *ClassName;
  const char *Name;
  const char *v42;
  _QWORD v43[5];
  id v44;
  SEL v45;
  _QWORD v46[6];
  _QWORD v47[6];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  id v62;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i services=%{public}@", v11, ClassName, Name, 713, v5);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v54 = v16;
    v55 = 2082;
    v56 = object_getClassName(self);
    v57 = 2082;
    v58 = sel_getName(a2);
    v59 = 1024;
    v60 = 713;
    v61 = 2114;
    v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i services=%{public}@", buf, 0x2Cu);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "isEqualToString:", CFSTR("urn:nfc:sn:handover")) & 1) != 0)
        {

          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_100221DC8;
          v47[3] = &unk_1002E5F60;
          v47[4] = self;
          v47[5] = a2;
          v36 = objc_retainBlock(v47);
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_1002221C8;
          v46[3] = &unk_1002E5F60;
          v46[4] = self;
          v46[5] = a2;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v46));
          objc_msgSend(v37, "connectionHandoverTNEPServiceSelected:", CFSTR("urn:nfc:sn:handover"));

          v38 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10022235C;
          v43[3] = &unk_1002E6218;
          v44 = v36;
          v45 = a2;
          v43[4] = self;
          v39 = v36;
          objc_msgSend(v38, "tnepReaderSelectService:callback:", CFSTR("urn:nfc:sn:handover"), v43);

          goto LABEL_29;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v19)
        continue;
      break;
    }
  }

  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v23 = NFLogGetLogger(v22);
  if (v23)
  {
    v24 = (void (*)(uint64_t, const char *, ...))v23;
    v25 = object_getClass(self);
    v26 = class_isMetaClass(v25);
    v27 = object_getClassName(self);
    v42 = sel_getName(a2);
    v28 = 45;
    if (v26)
      v28 = 43;
    v24(4, "%c[%{public}s %{public}s]:%i No matching service found", v28, v27, v42, 724);
  }
  v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v30 = NFSharedLogGetLogger(v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = object_getClass(self);
    if (class_isMetaClass(v32))
      v33 = 43;
    else
      v33 = 45;
    v34 = object_getClassName(self);
    v35 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v54 = v33;
    v55 = 2082;
    v56 = v34;
    v57 = 2082;
    v58 = v35;
    v59 = 1024;
    v60 = 724;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i No matching service found", buf, 0x22u);
  }

LABEL_29:
}

- (void)staticReaderEngagementDiscovered:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  const char *ClassName;
  const char *Name;
  _QWORD v22[6];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;

  v5 = a3;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i handover select = %@", v11, ClassName, Name, 795, v5);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v24 = v16;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 795;
    v31 = 2112;
    v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select = %@", buf, 0x2Cu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession stsHelper](self, "stsHelper"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asData"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100223218;
  v22[3] = &unk_1002E5F60;
  v22[4] = self;
  v22[5] = a2;
  objc_msgSend(v17, "connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:", v18, v19, v22);

}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  os_signpost_id_t v9;
  void *specific;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *ClassName;
  const char *Name;
  _QWORD v26[6];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;

  v5 = a3;
  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = -[_NFSession signpostId](self, "signpostId");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, v9, "ReaderServicesAborted", ", buf, 2u);
    }
  }

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v15 = 45;
    if (isMetaClass)
      v15 = 43;
    v12(3, "%c[%{public}s %{public}s]:%i error=%{public}@", v15, ClassName, Name, 818, v5);
  }
  v16 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v17 = NFSharedLogGetLogger(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    v28 = v20;
    v29 = 2082;
    v30 = v21;
    v31 = 2082;
    v32 = v22;
    v33 = 1024;
    v34 = 818;
    v35 = 2114;
    v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error=%{public}@", buf, 0x2Cu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002239DC;
  v26[3] = &unk_1002E5F60;
  v26[4] = self;
  v26[5] = a2;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v26));
  objc_msgSend(v23, "tnepReaderServicesAborted:", v5);

}

- (void)startHCEProcessingWithDevice:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  void *specific;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  const char *Name;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession tnepHandler](self, "tnepHandler"));
    v11 = (void *)v10;
    if (v10)
      sub_10023B7E0(v10, v7);

    if (v8)
      v8[2](v8, 0);
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Missing tnepHandler", v18, ClassName, Name, 832);
    }
    v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67109890;
      v33 = v23;
      v34 = 2082;
      v35 = object_getClassName(self);
      v36 = 2082;
      v37 = sel_getName(a2);
      v38 = 1024;
      v39 = 832;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing tnepHandler", buf, 0x22u);
    }

    if (v8)
    {
      v24 = objc_alloc((Class)NSError);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v30 = NSLocalizedDescriptionKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Unexpected Result"));
      v31 = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v28 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 13, v27);
      ((void (**)(id, id))v8)[2](v8, v28);

    }
  }

}

- (unint64_t)getCHConfig
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  unsigned __int8 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unint64_t v32;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i type=0x%lx", v11, ClassName, Name, 839, v22);
  }
  v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v13 = NFSharedLogGetLogger(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v24 = v16;
    v25 = 2082;
    v26 = object_getClassName(self);
    v27 = 2082;
    v28 = sel_getName(a2);
    v29 = 1024;
    v30 = 839;
    v31 = 2048;
    v32 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i type=0x%lx", buf, 0x2Cu);
  }

  v17 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
  v18 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
  v19 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
  v20 = -[_NFSecureTransactionServicesHandoverHybridSession type](self, "type");
  return (16 * (v17 & 1)) | (v18 >> 1) & 1 | (v19 >> 1) & 2 | (v20 >> 1) & 4 | (-[_NFSecureTransactionServicesHandoverHybridSession type](self, "type") >> 1) & 8;
}

- (unint64_t)getSTSHelperOperation
{
  unint64_t v4;
  void *v6;

  v4 = -[_NFSecureTransactionServicesHandoverHybridSession role](self, "role");
  if (v4 - 2 >= 3 && v4 != -1)
    return v4 == 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_NFSecureTransactionServicesHandoverHybridSession.m"), 863, CFSTR("Invalid"));

  return -1;
}

- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4));

  return v6;
}

- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4));

  return v6;
}

- (id)createCHSelectErrorMessage
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_alloc_init((Class)NFNdefRecordInternal);
  objc_msgSend(v2, "setTypeNameFormat:", 1);
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026AA16, 3);
  objc_msgSend(v2, "setType:", v3);

  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026AA19, 2);
  objc_msgSend(v2, "setPayload:", v4);

  v5 = objc_alloc_init((Class)NFNdefRecordInternal);
  v6 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBytes:length:", &unk_10026AA1D, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asData"));
  objc_msgSend(v6, "appendData:", v7);

  objc_msgSend(v5, "setTypeNameFormat:", 1);
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_10026AA1B, 2);
  objc_msgSend(v5, "setType:", v8);

  objc_msgSend(v5, "setPayload:", v6);
  v9 = objc_alloc_init((Class)NFNdefMessageInternal);
  objc_msgSend(v9, "addRecord:", v5);

  return v9;
}

- (void)handleReaderBurnoutTimer
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  uint8_t buf[8];
  NSErrorUserInfoKey v16;
  void *v17;

  v4 = objc_claimAutoreleasedReturnValue(-[_NFSession workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v4);

  v6 = NFSharedSignpostLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "handleReaderBurnoutTimer", ", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100224480;
  v14[3] = &unk_1002E5F60;
  v14[4] = self;
  v14[5] = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NFSecureTransactionServicesHandoverHybridSession _synchronousRemoteProxyWithErrorHandler:](self, "_synchronousRemoteProxyWithErrorHandler:", v14));
  v9 = objc_alloc((Class)NSError);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v16 = NSLocalizedDescriptionKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Reader mode temporarily disabled"));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v13 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 47, v12);
  objc_msgSend(v8, "tnepReaderServicesAborted:", v13);

  -[_NFSecureTransactionServicesHandoverHybridSession endSession:](self, "endSession:", 0);
}

- (void)handleReaderBurnoutCleared
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", v10, ClassName, Name, 926);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v18 = v15;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 926;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Warning : message received - session should be gone.", buf, 0x22u);
  }

}

- (unint64_t)role
{
  return *(_QWORD *)(&self->super._transactionState + 1);
}

- (void)setRole:(unint64_t)a3
{
  *(_QWORD *)(&self->super._transactionState + 1) = a3;
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->_role + 3);
}

- (void)setType:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_role + 3) = a3;
}

- (NFDriverWrapper)driverWrapper
{
  return *(NFDriverWrapper **)((char *)&self->_type + 3);
}

- (void)setDriverWrapper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_type + 3), a3);
}

- (NFSecureElementWrapper)seWrapper
{
  return *(NFSecureElementWrapper **)((char *)&self->_driverWrapper + 3);
}

- (void)setSeWrapper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), a3);
}

- (STSHelperLibrary)stsHelper
{
  return *(STSHelperLibrary **)((char *)&self->_seWrapper + 3);
}

- (void)setStsHelper:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_seWrapper + 3), a3);
}

- (NFTagInternal)connectedTag
{
  return *(STSHelperLibrary **)((char *)&self->_stsHelper + 3);
}

- (void)setConnectedTag:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_stsHelper + 3), a3);
}

- (NFTNEPHandler)tnepHandler
{
  return *(NFTNEPHandler **)((char *)&self->_connectedTag + 3);
}

- (void)setTnepHandler:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_connectedTag + 3), a3);
}

- (NFSecureElementProxyListener)seProxyListener
{
  return *(NFSecureElementProxyListener **)((char *)&self->_tnepHandler + 3);
}

- (void)setSeProxyListener:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_tnepHandler + 3), a3);
}

- (NSError)deviceHandoverSelectError
{
  return *(NSError **)((char *)&self->_seProxyListener + 3);
}

- (void)setDeviceHandoverSelectError:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_seProxyListener + 3), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_seProxyListener + 3), 0);
  objc_storeStrong((id *)((char *)&self->_tnepHandler + 3), 0);
  objc_storeStrong((id *)((char *)&self->_connectedTag + 3), 0);
  objc_storeStrong((id *)((char *)&self->_stsHelper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_seWrapper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_driverWrapper + 3), 0);
  objc_storeStrong((id *)((char *)&self->_type + 3), 0);
}

@end
