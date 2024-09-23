@implementation CHRemoteRecognitionServer

+ (id)sharedRemoteRecognitionServer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000994C;
  block[3] = &unk_1000247D8;
  block[4] = a1;
  if (qword_10002ADF0 != -1)
    dispatch_once(&qword_10002ADF0, block);
  return (id)qword_10002ADE8;
}

- (CHRemoteRecognitionServer)init
{
  id v2;
  id v3;
  void *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_workloop_t v11;
  void *v12;
  dispatch_workloop_t v13;
  void *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  dispatch_queue_t v21;
  void *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  void *v28;
  dispatch_queue_attr_t v29;
  NSObject *v30;
  dispatch_queue_attr_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  CHRemoteRecognitionRequestHandler *v35;
  void *v36;
  CHRemoteSynthesisRequestHandler *v37;
  void *v38;
  CHRemoteLineWrappingRequestHandler *v39;
  void *v40;
  id v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CHRemoteRecognitionServer;
  v2 = -[CHRemoteRecognitionServer init](&v44, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.handwritingd.remoterecognition"));
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    objc_msgSend(*((id *)v2 + 1), "setDelegate:", v2);
    *((_BYTE *)v2 + 24) = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v9 = dispatch_queue_create("com.apple.handwritingd.ServerQueue", v8);
    v10 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v9;

    v11 = dispatch_workloop_create("com.apple.handwritingd.recognitionProcessingWorkloop");
    v12 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v11;

    v13 = dispatch_workloop_create("com.apple.handwritingd.synthesisProcessingWorkloop");
    v14 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);

    v19 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.HighPriorityRecognitionProcessingQueue", v18, *((dispatch_queue_t *)v2 + 6));
    v20 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v19;

    v21 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.HighPrioritySynthesisProcessingQueue", v18, *((dispatch_queue_t *)v2 + 12));
    v22 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_UNSPECIFIED, 0);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    v27 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.LowPriorityRecognitionProcessingQueue", v26, *((dispatch_queue_t *)v2 + 6));
    v28 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v31 = dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_BACKGROUND, 0);
    v32 = objc_claimAutoreleasedReturnValue(v31);

    v33 = dispatch_queue_create_with_target_V2("com.apple.handwritingd.BackgroundPriorityRecognitionProcessingQueue", v32, *((dispatch_queue_t *)v2 + 12));
    v34 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v33;

    v35 = -[CHRemoteRecognitionRequestHandler initWithServerQueue:lowPriorityQueue:highPriorityQueue:]([CHRemoteRecognitionRequestHandler alloc], "initWithServerQueue:lowPriorityQueue:highPriorityQueue:", *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 4));
    v36 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v35;

    v37 = -[CHRemoteSynthesisRequestHandler initWithServerQueue:lowPriorityQueue:highPriorityQueue:recognitionHandler:]([CHRemoteSynthesisRequestHandler alloc], "initWithServerQueue:lowPriorityQueue:highPriorityQueue:recognitionHandler:", *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 11), *((_QWORD *)v2 + 10), *((_QWORD *)v2 + 8));
    v38 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v37;

    v39 = -[CHRemoteLineWrappingRequestHandler initWithServerQueue:lowPriorityQueue:highPriorityQueue:]([CHRemoteLineWrappingRequestHandler alloc], "initWithServerQueue:lowPriorityQueue:highPriorityQueue:", *((_QWORD *)v2 + 2), *((_QWORD *)v2 + 5), *((_QWORD *)v2 + 4));
    v40 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v39;

    v41 = objc_alloc_init((Class)CHSessionStateCounter);
    v42 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v41;

  }
  return (CHRemoteRecognitionServer *)v2;
}

- (void)dealloc
{
  OS_dispatch_workloop *recognitionProcessingWorkloop;
  OS_dispatch_queue *highPriorityRecognitionProcessingQueue;
  OS_dispatch_queue *lowPriorityRecognitionProcessingQueue;
  OS_dispatch_queue *serverQueue;
  objc_super v7;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  recognitionProcessingWorkloop = self->_recognitionProcessingWorkloop;
  self->_recognitionProcessingWorkloop = 0;

  highPriorityRecognitionProcessingQueue = self->_highPriorityRecognitionProcessingQueue;
  self->_highPriorityRecognitionProcessingQueue = 0;

  lowPriorityRecognitionProcessingQueue = self->_lowPriorityRecognitionProcessingQueue;
  self->_lowPriorityRecognitionProcessingQueue = 0;

  serverQueue = self->_serverQueue;
  self->_serverQueue = 0;

  v7.receiver = self;
  v7.super_class = (Class)CHRemoteRecognitionServer;
  -[CHRemoteRecognitionServer dealloc](&v7, "dealloc");
}

+ (BOOL)_hasEntitlement:(id)a3 connection:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  __SecTask *v8;
  __SecTask *v9;
  const __CFBoolean *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  BOOL v13;
  CFErrorRef error;
  audit_token_t token;

  v5 = (__CFString *)a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "auditToken");
  else
    memset(&token, 0, sizeof(token));
  v8 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  v9 = v8;
  if (v8)
  {
    error = 0;
    v10 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v8, v5, &error);
    v11 = v10;
    if (v10)
    {
      v12 = CFGetTypeID(v10);
      v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
      CFRelease(v11);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v9);
    if (error)
      CFRelease(error);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldFulfillRemoteRequestForConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  const __CFString *v16;
  unsigned int v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  NSObject *v22;
  const __CFString *v23;
  char v24;
  id v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", objc_msgSend(v6, "processIdentifier")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentState"));
  v10 = sub_1000097E4(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v12 = (id)qword_10002AE38;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138412290;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@", (uint8_t *)&v27, 0xCu);
  }

  if (objc_msgSend(v9, "taskState") == 4 || objc_msgSend(v9, "taskState") == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endowmentNamespaces"));
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    if (qword_10002AE88 == -1)
      goto LABEL_8;
LABEL_22:
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v15 = (id)qword_10002AE38;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    goto LABEL_9;
  }
  v14 = 0;
  if (qword_10002AE88 != -1)
    goto LABEL_22;
LABEL_8:
  v15 = (id)qword_10002AE38;
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    goto LABEL_12;
LABEL_9:
  v16 = CFSTR("NO");
  if (v14)
    v16 = CFSTR("YES");
  v27 = 138412546;
  v28 = v11;
  v29 = 2112;
  v30 = v16;
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ isForegroundClient: %@", (uint8_t *)&v27, 0x16u);
LABEL_12:

  if ((v14 & 1) != 0)
  {
LABEL_19:
    LOBYTE(v20) = 1;
    goto LABEL_20;
  }
  v17 = objc_msgSend((id)objc_opt_class(self), "_hasEntitlement:connection:", CFSTR("com.apple.handwritingd.allowBackgroundRecognition"), v6);
  if (qword_10002AE88 == -1)
  {
    v18 = (id)qword_10002AE38;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
  }
  else
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v18 = (id)qword_10002AE38;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
  }
  v19 = CFSTR("NO");
  if (v17)
    v19 = CFSTR("YES");
  v27 = 138412546;
  v28 = v11;
  v29 = 2112;
  v30 = v19;
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ hasBackgroundRecognitionEntitlement: %@", (uint8_t *)&v27, 0x16u);
LABEL_18:

  if ((v17 & 1) != 0)
    goto LABEL_19;
  LODWORD(v20) = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.PaperKit.extension"));
  if (qword_10002AE88 == -1)
  {
    v22 = (id)qword_10002AE38;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
LABEL_26:
      v23 = CFSTR("NO");
      if ((_DWORD)v20)
        v23 = CFSTR("YES");
      v27 = 138412546;
      v28 = v11;
      v29 = 2112;
      v30 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "_shouldFulfillRemoteRequestForConnection bundleIdentifier: %@ is white listed bundle: %@", (uint8_t *)&v27, 0x16u);
    }
  }
  else
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v22 = (id)qword_10002AE38;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
  }

  if (a4)
    v24 = (char)v20;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    v25 = sub_1000097E4(v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v26 = objc_msgSend((id)objc_opt_class(self), "_unableToProcessRequestErrorWithBundleIdentifier:", v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v26);

    LOBYTE(v20) = 0;
  }
LABEL_20:

  return (char)v20;
}

- (void)_synthesizeStyleInventoryIfNeededWithConnection:(id)a3
{
  void *v4;
  id v5;
  CHRemoteSynthesisRequestHandler *synthesisRequestHandler;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CHSynthesisRequestOptions synthesisOptionsWithSynthesizeCharacterInventoryBehavior:](CHSynthesisRequestOptions, "synthesisOptionsWithSynthesizeCharacterInventoryBehavior:", 1));
  v5 = objc_msgSend(objc_alloc((Class)CHRemoteSynthesisRequest), "initWithString:drawing:options:requestType:", &stru_100025708, 0, v4, 0);
  synthesisRequestHandler = self->_synthesisRequestHandler;
  v7 = sub_1000097E4(v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[CHRemoteSynthesisRequestHandler handleRequest:withReply:bundleIdentifier:](synthesisRequestHandler, "handleRequest:withReply:bundleIdentifier:", v5, &stru_100024A30, v8);

}

- (void)handleRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  CHRemoteRecognitionRequestHandler *recognitionRequestHandler;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = 0;
  v10 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v9, &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    v13 = sub_1000097E4(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[CHRemoteRecognitionRequestHandler handleRequest:withReply:bundleIdentifier:](recognitionRequestHandler, "handleRequest:withReply:bundleIdentifier:", v6, v7, v14);

  }
  else
  {
    v7[2](v7, 0, v11);
  }

}

- (void)transcriptionPathsForTokenizedTextResult:(id)a3 recognitionRequest:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  CHRemoteRecognitionRequestHandler *recognitionRequestHandler;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v11 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v18 = 0;
  v13 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v12, &v18);
  v14 = v18;
  if ((v13 & 1) != 0)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    v16 = sub_1000097E4(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[CHRemoteRecognitionRequestHandler transcriptionPathsForTokenizedTextResult:recognitionRequest:withReply:bundleIdentifier:](recognitionRequestHandler, "transcriptionPathsForTokenizedTextResult:recognitionRequest:withReply:bundleIdentifier:", v8, v9, v10, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v14);
  }

}

- (void)handleRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  CHRemoteSynthesisRequestHandler *synthesisRequestHandler;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle synthesis requests", buf, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v17 = 0;
  v10 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v9, &v17);
  v11 = v17;
  if ((v10 & 1) != 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v12 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Handling remote synthesis request: %@", buf, 0xCu);
    }

    synthesisRequestHandler = self->_synthesisRequestHandler;
    v14 = sub_1000097E4(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[CHRemoteSynthesisRequestHandler handleRequest:withReply:bundleIdentifier:](synthesisRequestHandler, "handleRequest:withReply:bundleIdentifier:", v6, v7, v15);

  }
  else
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v16 = (id)qword_10002AE60;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handling remote synthesis request was not fullfilled due to: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v11);
  }

}

- (void)handleInventoryRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  CHRemoteSynthesisRequestHandler *synthesisRequestHandler;
  id v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle inventory requests", buf, 2u);
    }

  }
  if (qword_10002AE00 != -1)
    dispatch_once(&qword_10002AE00, &stru_100024A50);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v19 = 0;
  v10 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v9, &v19);
  v11 = v19;
  if (!v10)
    goto LABEL_18;
  v12 = sub_1000097E4(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend((id)qword_10002ADF8, "containsObject:", v13);
  if (!v13)
  {
    if (((os_variant_has_internal_diagnostics("com.apple.corehandwriting.handwritingd") | v14) & 1) != 0)
      goto LABEL_12;
LABEL_18:
    v7[2](v7, 0, v11);
    goto LABEL_19;
  }

  if ((v14 & 1) == 0)
    goto LABEL_18;
LABEL_12:
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v15 = (id)qword_10002AE18[0];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Handling remote inventory request: %@", buf, 0xCu);
  }

  synthesisRequestHandler = self->_synthesisRequestHandler;
  v17 = sub_1000097E4(v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[CHRemoteSynthesisRequestHandler handleInventoryRequest:withReply:bundleIdentifier:](synthesisRequestHandler, "handleInventoryRequest:withReply:bundleIdentifier:", v6, v7, v18);

  -[CHRemoteRecognitionServer _synthesizeStyleInventoryIfNeededWithConnection:](self, "_synthesizeStyleInventoryIfNeededWithConnection:", v9);
LABEL_19:

}

- (void)handleInventoryStatusRequestWithReply:(id)a3
{
  void (**v4)(id, _QWORD, id);
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  CHRemoteSynthesisRequestHandler *synthesisRequestHandler;
  id v11;
  void *v12;
  uint8_t v13[8];
  id v14;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, id))a3;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v5 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle inventory status requests", buf, 2u);
    }

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = 0;
  v7 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v6, &v14);
  v8 = v14;
  if ((v7 & 1) != 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v9 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Handling remote inventory status request", v13, 2u);
    }

    synthesisRequestHandler = self->_synthesisRequestHandler;
    v11 = sub_1000097E4(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[CHRemoteSynthesisRequestHandler handleInventoryStatusRequestWithReply:bundleIdentifier:](synthesisRequestHandler, "handleInventoryStatusRequestWithReply:bundleIdentifier:", v4, v12);

  }
  else
  {
    v4[2](v4, 0, v8);
  }

}

- (void)handleSketchRecognitionRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  CHRemoteRecognitionRequestHandler *recognitionRequestHandler;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = 0;
  v10 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v9, &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    recognitionRequestHandler = self->_recognitionRequestHandler;
    v13 = sub_1000097E4(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[CHRemoteRecognitionRequestHandler handleSketchRequest:withReply:bundleIdentifier:](recognitionRequestHandler, "handleSketchRequest:withReply:bundleIdentifier:", v6, v7, v14);

  }
  else
  {
    v7[2](v7, 0, v11);
  }

}

- (void)handleLineWrappingRequest:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  CHRemoteLineWrappingRequestHandler *lineWrappingHandler;
  id v13;
  void *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v15 = 0;
  v10 = -[CHRemoteRecognitionServer _shouldFulfillRemoteRequestForConnection:error:](self, "_shouldFulfillRemoteRequestForConnection:error:", v9, &v15);
  v11 = v15;
  if ((v10 & 1) != 0)
  {
    lineWrappingHandler = self->_lineWrappingHandler;
    v13 = sub_1000097E4(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[CHRemoteLineWrappingRequestHandler handleRequest:withReply:bundleIdentifier:](lineWrappingHandler, "handleRequest:withReply:bundleIdentifier:", v6, v7, v14);

  }
  else
  {
    v7[2](v7, 0, v11);
  }

}

- (void)handleSessionStateUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *serverQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  CHRemoteRecognitionServer *v10;
  uint8_t buf[16];

  v4 = a3;
  if (!self->_isListening)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v5 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "The listener must be resumed to handle recognition requests", buf, 2u);
    }

  }
  serverQueue = self->_serverQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B38C;
  v8[3] = &unk_100024A78;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async((dispatch_queue_t)serverQueue, v8);

}

- (void)optimizeResourceUsage
{
  dispatch_time_t v3;
  OS_dispatch_queue *serverQueue;
  _QWORD block[5];

  v3 = dispatch_time(0, 12000000000);
  serverQueue = self->_serverQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B5DC;
  block[3] = &unk_100024AA0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)serverQueue, block);
}

- (void)resumeConnectionIfIdle
{
  if (!self->_isListening)
  {
    -[NSXPCListener resume](self->_listener, "resume");
    self->_isListening = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CHRemoteRequestProtocol));
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

+ (id)_unableToProcessRequestErrorWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to fulfill request for %@. The application does not have permission to run remote recognition or synthesis at this time"), v3));
  v8[0] = NSLocalizedDescriptionKey;
  v8[1] = NSLocalizedFailureReasonErrorKey;
  v9[0] = v4;
  v9[1] = CFSTR("Requests cannot be executed because this app may not have permission to run remote recognition or synthesis in the background, or at all.");
  v8[2] = NSLocalizedRecoverySuggestionErrorKey;
  v9[2] = CFSTR("Re-submit the request from a permitted client application in an acceptable state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corehandwriting"), -1003, v5));

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisRequestHandler, 0);
  objc_storeStrong((id *)&self->_synthesisProcessingWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundPrioritySynthesisProcessingQueue, 0);
  objc_storeStrong((id *)&self->_highPrioritySynthesisProcessingQueue, 0);
  objc_storeStrong((id *)&self->_lineWrappingHandler, 0);
  objc_storeStrong((id *)&self->_recognitionRequestHandler, 0);
  objc_storeStrong((id *)&self->_activeSessionCounter, 0);
  objc_storeStrong((id *)&self->_recognitionProcessingWorkloop, 0);
  objc_storeStrong((id *)&self->_lowPriorityRecognitionProcessingQueue, 0);
  objc_storeStrong((id *)&self->_highPriorityRecognitionProcessingQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
