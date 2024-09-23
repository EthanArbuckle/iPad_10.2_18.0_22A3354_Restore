@implementation MobileActivationDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSXPCInterface *v6;
  OS_dispatch_queue *v7;

  v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MobileActivationProtocol);
  objc_msgSend(v5, "setExportedInterface:", v6);
  objc_msgSend(v5, "setExportedObject:", self);
  v7 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  objc_msgSend(v5, "_setQueue:", v7);

  objc_msgSend(v5, "resume");
  return 1;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)getActivationStateWithCompletionBlock:(id)a3
{
  void (**v4)(id, NSDictionary *, _QWORD);
  DataArk *v5;
  unsigned __int8 v6;
  DataArk *v7;
  id v8;
  __CFString *v9;
  NSDictionary *v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v4 = (void (**)(id, NSDictionary *, _QWORD))a3;
  v5 = -[MobileActivationDaemon dark](self, "dark");
  v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v13 = CFSTR("ActivationState");
    v14 = CFSTR("Unavailable");
    v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    if (!v4)
      goto LABEL_8;
LABEL_7:
    v4[2](v4, v10, 0);
    goto LABEL_8;
  }
  v7 = -[MobileActivationDaemon dark](self, "dark");
  v8 = data_ark_copy(v7, 0, CFSTR("ActivationState"));
  v9 = (__CFString *)isNSString(v8);

  if (!v9)
    v9 = CFSTR("Unactivated");
  v11 = CFSTR("ActivationState");
  v12 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);

  if (v4)
    goto LABEL_7;
LABEL_8:

}

- (DataArk)dark
{
  return self->_dark;
}

- (MobileActivationDaemon)initWithContext:(id)a3 Queue:(id)a4
{
  id v7;
  id v8;
  MobileActivationDaemon *v9;
  MobileActivationDaemon *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *creationQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *sessionQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MobileActivationDaemon;
  v9 = -[MobileActivationDaemon init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    if (!v7)
      goto LABEL_6;
    if (!v8)
      goto LABEL_6;
    objc_storeStrong((id *)&v9->_dark, a3);
    objc_storeStrong((id *)&v10->_xpcQueue, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_create("com.apple.mobileactivationd.xpc.create", v11);
    creationQueue = v10->_creationQueue;
    v10->_creationQueue = (OS_dispatch_queue *)v12;

    if (!v10->_creationQueue
      || (v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
          v15 = dispatch_queue_create("com.apple.mobileactivationd.xpc.session", v14),
          sessionQueue = v10->_sessionQueue,
          v10->_sessionQueue = (OS_dispatch_queue *)v15,
          sessionQueue,
          v14,
          !v10->_sessionQueue))
    {
LABEL_6:

      v10 = 0;
    }
  }

  return v10;
}

- (void)dealloc
{
  PSCSessionInternal_ *session;
  objc_super v4;

  session = self->_session;
  if (session)
    ZyNF2D9((uint64_t)session);
  v4.receiver = self;
  v4.super_class = (Class)MobileActivationDaemon;
  -[MobileActivationDaemon dealloc](&v4, "dealloc");
}

- (unint64_t)currentSessionDuration
{
  OS_dispatch_queue *v3;

  v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (self->_sessionStartTime)
    return (clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - self->_sessionStartTime) / 0x3B9ACA00;
  else
    return 0;
}

- (void)generateSession:(BOOL)a3
{
  _BOOL4 v3;
  OS_dispatch_queue *v5;
  uint64_t v6;
  id v7;
  id v8;
  PSCSessionInternal_ *session;
  PSCSessionInternal_ *v10;
  unsigned int v11;
  uint64_t v12;

  v3 = a3;
  v5 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  v12 = 0;
  v11 = 0;
  v10 = 0;
  if (self->_session
    && -[MobileActivationDaemon currentSessionDuration](self, "currentSessionDuration") <= 0x12C
    && !v3)
  {
    goto LABEL_6;
  }
  self->_sessionStartTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v6 = TcswZQtsc8hw((uint64_t)&v10, (uint64_t)&v12, (uint64_t)&v11);
  if ((_DWORD)v6)
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, CFSTR("Failed to create handshake request message: %d"), v6);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v8 = objc_alloc((Class)NSData);
  v7 = objc_msgSend(v8, "initWithBytes:length:", v12, v11);
  if (v7)
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, CFSTR("Generated new DRM session."));
    session = self->_session;
    if (session)
      ZyNF2D9((uint64_t)session);
    self->_session = v10;
    v10 = 0;
    objc_storeStrong((id *)&self->_sessionHelloMessage, v7);
  }
  else
  {
    maLog((uint64_t)"-[MobileActivationDaemon generateSession:]", 0, CFSTR("Failed to create data."));
  }
LABEL_7:
  if (v12)
    ewFHQ(v12);
  if (v10)
    ZyNF2D9((uint64_t)v10);

}

- (PSCSessionInternal_)session
{
  OS_dispatch_queue *v3;

  v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  -[MobileActivationDaemon generateSession:](self, "generateSession:", 0);
  return self->_session;
}

- (NSData)sessionHelloMessage
{
  OS_dispatch_queue *v3;

  v3 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  -[MobileActivationDaemon generateSession:](self, "generateSession:", 0);
  return self->_sessionHelloMessage;
}

- (id)callingProcessName
{
  OS_dispatch_queue *v3;
  DataArk *v4;
  _BOOL4 v5;
  DataArk *v6;
  id v7;

  v3 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[MobileActivationDaemon dark](self, "dark");
  v5 = data_ark_exists(v4, 0, CFSTR("HostProcessName"));

  if (v5)
  {
    v6 = -[MobileActivationDaemon dark](self, "dark");
    v7 = data_ark_copy(v6, 0, CFSTR("HostProcessName"));

  }
  else
  {
    v7 = copy_calling_process_name();
  }
  return v7;
}

- (BOOL)isHostConnection
{
  OS_dispatch_queue *v3;
  DataArk *v4;

  v3 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  v4 = -[MobileActivationDaemon dark](self, "dark");
  LOBYTE(v3) = data_ark_exists(v4, 0, CFSTR("HostProcessName"));

  return (char)v3;
}

- (BOOL)isEntitled:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  OS_dispatch_queue *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  v7 = 0;
  LOBYTE(v8) = 0;
  if (v4)
  {
    if (v5)
    {
      v7 = -[NSXPCConnection valueForEntitlement:](v5, "valueForEntitlement:", v4);
      v8 = isNSNumber(v7);

      if (v8)
        LOBYTE(v8) = objc_msgSend(v7, "BOOLValue");
    }
  }

  return (char)v8;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  OS_dispatch_queue *v6;
  id v7;

  v4 = a3;
  v5 = +[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection");
  v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  v7 = 0;
  if (v4 && v5)
    v7 = -[NSXPCConnection valueForEntitlement:](v5, "valueForEntitlement:", v4);

  return v7;
}

- (id)copyUCRTVersionInfoWithError:(id *)a3
{
  DataArk *v4;
  id v5;
  NSError *v6;
  id v7;
  NSError *v8;
  id v10;

  v4 = -[MobileActivationDaemon dark](self, "dark");
  v10 = 0;
  v5 = copyUCRTVersionInformation(v4, &v10);
  v6 = (NSError *)v10;

  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithError:]", 284, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v6, CFSTR("Failed to copy UCRT version info."));

    if (a3)
    {
      v6 = objc_retainAutorelease(v8);
      *a3 = v6;
    }
    else
    {
      v6 = v8;
    }
  }

  return v5;
}

- (BOOL)handleSessionResponse:(id)a3 withError:(id *)a4
{
  id v5;
  OS_dispatch_queue *v6;
  MACollectionInterface *v7;
  DataArk *v8;
  MACollectionInterface *v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *v26;
  BOOL v27;
  NSError *v28;
  id v29;
  NSError *v31;
  id v32;
  NSError *v33;
  id v34;
  NSError *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v40[5];
  id v41;
  id v42;
  uint64_t *v43;
  _QWORD *v44;
  _QWORD block[4];
  id v46;
  id v47;
  MobileActivationDaemon *v48;
  id v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t *v52;
  _QWORD *v53;
  id obj;
  _QWORD v55[3];
  int v56;
  _QWORD v57[5];
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  id *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v5 = a3;
  v65 = 0;
  v66 = (id *)&v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9;
  v69 = __Block_byref_object_dispose__9;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__9;
  v63 = __Block_byref_object_dispose__9;
  v64 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__9;
  v57[4] = __Block_byref_object_dispose__9;
  v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  v56 = 0;
  v6 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)v6);

  if (!v5)
  {
    v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 318, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
LABEL_15:
    v29 = v66[5];
    v66[5] = v28;

    v18 = 0;
    v19 = 0;
    v11 = 0;
    v27 = 0;
    v9 = 0;
LABEL_16:
    v17 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  v7 = [MACollectionInterface alloc];
  v8 = -[MobileActivationDaemon dark](self, "dark");
  v9 = -[MACollectionInterface initWithContext:](v7, "initWithContext:", v8);

  if (!v9)
  {
    v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 324, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create collection interface."));
    goto LABEL_15;
  }
  v10 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v11 = objc_msgSend(v10, "copyAnswer:", CFSTR("BuildVersion"));

  v12 = isNSString(v11);
  if (!v12)
  {
    v31 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 330, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve %@."), CFSTR("BuildVersion"));
    v32 = v66[5];
    v66[5] = v31;

    v18 = 0;
    v19 = 0;
    v27 = 0;
    goto LABEL_16;
  }
  v13 = v66;
  obj = 0;
  v14 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 0, 0, &obj);
  objc_storeStrong(v13 + 5, obj);
  v15 = isNSDictionary(v14);

  if (!v15)
  {
    v33 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 339, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v66[5], CFSTR("Failed to decode session data."));
    v34 = v66[5];
    v66[5] = v33;

    v18 = 0;
    v19 = 0;
    v27 = 0;
    v17 = 0;
    goto LABEL_17;
  }
  if (is_internal_build())
  {
    v16 = dictionary_to_xml((uint64_t)v14);
    maLog((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 0, CFSTR("Session message:\n%@"), v16);

  }
  v17 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HandshakeResponseMessage"));
  v18 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("serverKP"));
  v19 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SUInfo"));
  v20 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("FDRBlob"));
  v21 = (void *)v60[5];
  v60[5] = (uint64_t)v20;

  v22 = isNSData(v17);
  if (!v22)
    goto LABEL_25;
  v23 = isNSData(v18);
  if (!v23)
    goto LABEL_24;
  v24 = isNSData(v19);
  if (!v24)
  {

LABEL_24:
    goto LABEL_25;
  }
  v38 = v24;
  v37 = isNSData((void *)v60[5]);

  if (!v37)
  {
LABEL_25:
    v35 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]", 353, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid session response."));
    v36 = v66[5];
    v66[5] = v35;

    goto LABEL_26;
  }
  v25 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke;
  block[3] = &__block_descriptor_96_e8_32s40s48s56s64r72r80r88r_e5_v8__0l;
  v50 = v57;
  v51 = &v59;
  v52 = &v65;
  v9 = v9;
  v46 = v9;
  v19 = v19;
  v47 = v19;
  v48 = self;
  v53 = v55;
  v11 = v11;
  v49 = v11;
  dispatch_sync((dispatch_queue_t)v25, block);

  if (v66[5])
  {
LABEL_26:
    v27 = 0;
    goto LABEL_17;
  }
  v26 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3254779904;
  v40[2] = __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_131;
  v40[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
  v40[4] = self;
  v43 = &v65;
  v44 = v55;
  v17 = v17;
  v41 = v17;
  v18 = v18;
  v42 = v18;
  dispatch_sync((dispatch_queue_t)v26, v40);

  v27 = v66[5] == 0;
LABEL_17:
  if (a4 && !v27)
    *a4 = objc_retainAutorelease(v66[5]);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v27;
}

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSError *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSError *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id obj;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "base64EncodedStringWithOptions:", 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v5, "processSUInfo:withError:", v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = objc_msgSend(*(id *)(a1 + 48), "dark");
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      data_ark_set(v9, 0, CFSTR("PCRTToken"), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1);

      v11 = objc_msgSend(*(id *)(a1 + 48), "dark");
      data_ark_set(v11, 0, CFSTR("CollectionLastPerformed"), *(void **)(a1 + 56), 1);
      v12 = v11;
    }
    else
    {
      data_ark_remove(v9, 0, CFSTR("PCRTToken"));

      v16 = objc_msgSend(*(id *)(a1 + 48), "dark");
      writeSplunkLog(v16, 8, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 371, 0, 0, v17, v21);

      v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 372, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), CFSTR("Failed to process SUInfo."));
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
      v12 = v20;
    }

  }
  else
  {
    v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 363, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode PCRT receipt (%@)."), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __58__MobileActivationDaemon_handleSessionResponse_withError___block_invoke_131(uint64_t a1)
{
  int v2;
  id v4;
  uint64_t v5;
  NSError *MobileActivationError;
  NSError *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!objc_msgSend(*(id *)(a1 + 32), "session"))
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 396, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid session."));
    goto LABEL_9;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = xtiKg((uint64_t)objc_msgSend(*(id *)(a1 + 32), "session"), (uint64_t)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 48), "length"));
  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v2 != -42901 && v2 != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "dark");
    writeSplunkLog(v4, 7, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), (uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 407, 0, 0, v5, v10);

    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon handleSessionResponse:withError:]_block_invoke", 408, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to process handshake response message: %d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
LABEL_9:
    v7 = MobileActivationError;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (BOOL)validateActivationDataSignature:(id)a3 activationSignature:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *v11;
  BOOL v12;
  NSError *v13;
  void *v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[3];
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  if (v8 && v9)
  {
    v11 = -[MobileActivationDaemon sessionQueue](self, "sessionQueue");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3254779904;
    block[2] = __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke;
    block[3] = &__block_descriptor_72_e8_32s40s48s56r64r_e5_v8__0l;
    block[4] = self;
    v19 = &v23;
    v20 = v21;
    v17 = v8;
    v18 = v10;
    dispatch_sync((dispatch_queue_t)v11, block);

    v12 = v24[5] == 0;
    if (!a5)
      goto LABEL_8;
  }
  else
  {
    v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]", 440, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."));
    v14 = (void *)v24[5];
    v24[5] = (uint64_t)v13;

    v12 = 0;
    if (!a5)
      goto LABEL_8;
  }
  if (!v12)
    *a5 = objc_retainAutorelease((id)v24[5]);
LABEL_8:
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __88__MobileActivationDaemon_validateActivationDataSignature_activationSignature_withError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  NSError *v5;
  uint64_t v6;
  void *v7;
  NSError *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "session"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = mbdz5ztWyQD((uint64_t)objc_msgSend(*(id *)(a1 + 32), "session"), (uint64_t)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 48), "length"));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
      writeSplunkLog(v2, 6, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), (uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 458, 0, 0, v3, v11);

      v4 = objc_msgSend(*(id *)(a1 + 48), "base64EncodedStringWithOptions:", 0);
      v5 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 459, CFSTR("com.apple.MobileActivation.ErrorDomain"), -15, 0, CFSTR("Failed to verify message signature (%@): %d"), v4, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:]_block_invoke", 447, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid session."));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)performMigrationWithCompletion:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  DataArk *v15;
  unsigned __int8 v16;
  NSDictionary *v17;
  NSError *v18;
  DataArk *v19;
  char v20;
  NSError *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[8];
  const __CFString *v28;
  void *v29;

  v5 = a4;
  v6 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v7 = copySignpostLoggingHandle();
  v8 = os_signpost_enabled(v7);

  if (v8)
  {
    v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v5 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v10 = copySignpostLoggingHandle();
      v9 = os_signpost_id_make_with_pointer(v10, v5);

    }
    v11 = copySignpostLoggingHandle();
    v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformMigrationXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904;
    v24[2] = __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v25 = v5;
    v26 = v9;
    v5 = objc_retainBlock(v24);

  }
  if (!data_migration_supported())
    goto LABEL_13;
  v13 = is_erase_installed_build();
  v14 = CFSTR("upgrade-install");
  if (v13)
    v14 = CFSTR("erase-install");
  maLog((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 1, CFSTR("Data migration requested by %@ (%@)"), v6, v14);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v28 = CFSTR("com.apple.mobileactivationd.spi");
    v29 = &__kCFBooleanTrue;
    v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 535, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v17);
    goto LABEL_17;
  }
  v15 = -[MobileActivationDaemon dark](self, "dark");
  v16 = preSydroDataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    v19 = -[MobileActivationDaemon dark](self, "dark");
    v23 = 0;
    v20 = performMigration(v19, &v23);
    v17 = (NSDictionary *)v23;

    if ((v20 & 1) != 0)
      goto LABEL_18;
    v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon performMigrationWithCompletion:completion:]", 547, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v17, CFSTR("Failed to perform migration."), v22);
LABEL_17:
    v21 = v18;

    v17 = (NSDictionary *)v21;
    goto LABEL_18;
  }
LABEL_13:
  v17 = 0;
LABEL_18:
  (*((void (**)(id, _QWORD, NSDictionary *))v5 + 2))(v5, 0, v17);

}

void __68__MobileActivationDaemon_performMigrationWithCompletion_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "PerformMigrationXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

- (void)copyAutomaticTimeEnabledWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);

}

void __65__MobileActivationDaemon_copyAutomaticTimeEnabledWithCompletion___block_invoke(uint64_t a1)
{
  NSNumber *v2;
  NSDictionary *v3;
  uint64_t v4;
  const __CFString *v5;
  NSNumber *v6;

  v5 = CFSTR("AutomaticTimeEnabled");
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", isAutomaticTimeEnabled());
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, NSDictionary *, _QWORD))(v4 + 16))(v4, v3, 0);

}

- (void)copyRTCResetCountWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = copyRTCResetSerialQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3254779904;
  v7[2] = __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke;
  v7[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__MobileActivationDaemon_copyRTCResetCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  NSDictionary *v4;
  NSError *v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = data_ark_copy(v2, 0, CFSTR("TotalRTCResetCount"));

  v4 = (NSDictionary *)isNSNumber(v3);
  if (v4)
  {
    v7 = CFSTR("TotalRTCResetCount");
    v8 = v3;
    v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = 0;
  }
  else
  {
    v5 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyRTCResetCountWithCompletionBlock:]_block_invoke", 581, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve RTC reset count."));
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v4, v5);

}

- (void)copyMonotonicClockWithCompletionBlock:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke;
  block[3] = &__block_descriptor_40_e8_32bs_e5_v8__0l;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)v5, block);

}

void __64__MobileActivationDaemon_copyMonotonicClockWithCompletionBlock___block_invoke(uint64_t a1)
{
  double v2;
  NSError *v3;
  NSNumber *v4;
  NSDictionary *v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  NSNumber *v9;

  v7 = 0;
  v2 = copyMonotonicClockTimeInterval(&v7);
  v3 = (NSError *)v7;
  if (v2 <= 0.0)
  {
    v5 = 0;
    v4 = (NSNumber *)v3;
    v3 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyMonotonicClockWithCompletionBlock:]_block_invoke", 604, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v3, CFSTR("Failed to retrieve monotonic clock interval."));
  }
  else
  {
    v8 = CFSTR("MonotonicClockNow");
    v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v2);
    v9 = v4;
    v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v6 + 16))(v6, v5, v3);

}

- (void)deactivateDeviceWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD, NSError *);
  id v5;
  DataArk *v6;
  unsigned __int8 v7;
  DataArk *v8;
  NSError *v9;

  v4 = (void (**)(id, _QWORD, NSError *))a3;
  v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]", 1, CFSTR("Deactivation requested by %@"), v5);

  v6 = -[MobileActivationDaemon dark](self, "dark");
  v7 = dataMigrationCompleted(v6);

  if ((v7 & 1) != 0)
  {
    v8 = -[MobileActivationDaemon dark](self, "dark");
    handle_deactivate(v8, 1);

    v9 = 0;
    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = createAndLogError((uint64_t)"-[MobileActivationDaemon deactivateDeviceWithCompletionBlock:]", 625, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
  if (v4)
LABEL_5:
    v4[2](v4, 0, v9);
LABEL_6:

}

- (void)createTunnel1ActivationInfo:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSUUID *v18;
  NSString *v19;
  DataArk *v20;
  id v21;
  OS_dispatch_queue *v22;
  id v23;
  id v24;
  NSString *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  os_signpost_id_t v36;
  uint8_t buf[8];
  _QWORD v38[5];
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__9;
  v38[4] = __Block_byref_object_dispose__9;
  v39 = 0;
  v12 = copySignpostLoggingHandle();
  v13 = os_signpost_enabled(v12);

  if (v13)
  {
    v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v15 = copySignpostLoggingHandle();
      v14 = os_signpost_id_make_with_pointer(v15, v8);

    }
    v16 = copySignpostLoggingHandle();
    v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CreateActivationInfoXPCV2", " enableTelemetry=YES ", buf, 2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904;
    v34[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v35 = v10;
    v36 = v14;
    v10 = objc_retainBlock(v34);

  }
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]", 1, CFSTR("Tunnel1 Activation info creation requested by %@"), v11);
  v18 = +[NSUUID UUID](NSUUID, "UUID");
  v19 = -[NSUUID UUIDString](v18, "UUIDString");

  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", v19);
  -[MobileActivationDaemon setActivationSessionClientName:](self, "setActivationSessionClientName:", v11);
  v20 = -[MobileActivationDaemon dark](self, "dark");
  v21 = copy_activation_record(v20);

  v22 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_164;
  block[3] = &__block_descriptor_81_e8_32s40s48s56s64bs72r_e5_v8__0l;
  block[4] = self;
  v28 = v9;
  v33 = v21 != 0;
  v29 = v19;
  v30 = v8;
  v31 = v10;
  v32 = v38;
  v23 = v10;
  v24 = v8;
  v25 = v19;
  v26 = v9;
  dispatch_async((dispatch_queue_t)v22, block);

  _Block_object_dispose(v38, 8);
}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateActivationInfoXPCV2", " enableTelemetry=YES ", v11, 2u);
  }

}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_164(uint64_t a1)
{
  id v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  NSNumber *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  NSDictionary *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _BOOL4 v30;
  NSError *v31;
  NSError *v32;
  NSError *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSError *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  NSDictionary *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  BOOL v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[5];
  id v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  id v71;
  id v72;
  id v73;
  id obj;
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[5];
  _QWORD v94[5];

  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v76 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 676, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
LABEL_22:
    v31 = v32;
    v5 = 0;
    v6 = 0;
LABEL_28:
    v25 = 0;
    v16 = 0;
    goto LABEL_29;
  }
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = v4;
  if (!v4)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 682, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."));
    goto LABEL_22;
  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "addEntriesFromDictionary:");
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("UseCommittedUIK"));
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
  {
    v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 700, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("Failed to create activation nonce."));
LABEL_27:
    v31 = v33;
    goto LABEL_28;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ActivationRandomness"));
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "handleSessionResponse:withError:", v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 707, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("Failed to establish session."));
    goto LABEL_27;
  }
  if (!-[NSNumber BOOLValue](v6, "BOOLValue"))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v73 = *(id *)(v12 + 40);
    v13 = libaks_system_key_operate(2, 1, (NSError **)&v73);
    objc_storeStrong((id *)(v12 + 40), v73);
    if ((v13 & 1) == 0)
    {
      v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 713, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("Failed to bump UIK."));
      goto LABEL_27;
    }
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v72 = *(id *)(v15 + 40);
  v16 = create_activation_info(v14, v5, &v72);
  objc_storeStrong((id *)(v15 + 40), v72);

  if (!v16)
  {
    v34 = objc_msgSend(*(id *)(a1 + 32), "dark");
    writeSplunkLog(v34, 2, -1, (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 720, 0, CFSTR("%@"), v35, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

    v33 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 721, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), CFSTR("Failed to create activation info."));
    goto LABEL_27;
  }
  v17 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v18 = isNSData(v17);
  if (!v18)
  {
LABEL_41:

    goto LABEL_42;
  }
  v19 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v20 = isNSData(v19);
  if (!v20)
  {
LABEL_40:

    goto LABEL_41;
  }
  v60 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v59 = isNSData(v60);
  if (!v59)
  {
LABEL_39:

    goto LABEL_40;
  }
  v58 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v57 = isNSData(v58);
  if (!v57)
  {

    goto LABEL_39;
  }
  v21 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v22 = isNSData(v21);
  v56 = v22 == 0;

  if (v56)
  {
LABEL_42:
    v44 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 730, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid activation record."));
LABEL_43:
    v31 = v44;
    v25 = 0;
    goto LABEL_29;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v25 = 0;
    goto LABEL_47;
  }
  v23 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("ActivationInfoXML"));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v71 = 0;
  v25 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v23, 0, 0, &v71);
  objc_storeStrong((id *)(v24 + 40), v71);

  if (!v25)
  {
    v44 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 739, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to convert data to dictionary."));
    goto LABEL_43;
  }
  v26 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ActivationLockInfo"));
  v27 = isNSString(v26);
  if (v27)
  {
    v28 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ActivationLockInfo"));
    v29 = isNSString(v28);
    v30 = v29 == 0;

    if (v30)
    {
      v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 744, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Missing activation lock data."));
LABEL_29:
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v31;

      v38 = 0;
      v39 = 0;
LABEL_30:
      v40 = 0;
      goto LABEL_31;
    }
  }
  else
  {

  }
LABEL_47:
  v61 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("ActivationInfoXML"));
  v45 = objc_alloc((Class)NSMutableDictionary);
  v94[0] = v61;
  v93[0] = CFSTR("ActivationInfoXML");
  v93[1] = CFSTR("FairPlaySignature");
  v62 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[1] = v62;
  v93[2] = CFSTR("FairPlayCertChain");
  v46 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[2] = v46;
  v93[3] = CFSTR("RKCertification");
  v47 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[3] = v47;
  v93[4] = CFSTR("RKSignature");
  v48 = -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:");
  v94[4] = v48;
  v49 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 5);
  v40 = objc_msgSend(v45, "initWithDictionary:", v49);

  v50 = objc_msgSend(*(id *)(a1 + 32), "sessionQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_2;
  block[3] = &__block_descriptor_96_e8_32s40s48r56r64r72r80r88r_e5_v8__0l;
  v51 = *(_QWORD *)(a1 + 72);
  block[4] = *(_QWORD *)(a1 + 32);
  v65 = v51;
  v66 = v75;
  v39 = v61;
  v64 = v39;
  v67 = &v89;
  v68 = &v85;
  v69 = &v81;
  v70 = &v77;
  dispatch_sync(v50, block);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v38 = v40;
    goto LABEL_30;
  }
  v52 = objc_alloc((Class)NSData);
  v53 = objc_msgSend(v52, "initWithBytes:length:", v82[3], *((unsigned int *)v78 + 6));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v53, CFSTR("serverKP"));

  v54 = objc_alloc((Class)NSData);
  v55 = objc_msgSend(v54, "initWithBytes:length:", v90[3], *((unsigned int *)v86 + 6));
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v55, CFSTR("signActRequest"));

  v38 = dictionary_to_xml((uint64_t)v40);
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke", 0, CFSTR("Activation info: \n%@"), v38);
LABEL_31:

  v41 = v90[3];
  if (v41)
    ewFHQ(v41);
  v42 = v82[3];
  if (v42)
    ewFHQ(v42);
  v43 = *(_QWORD *)(a1 + 64);
  if (v43)
    (*(void (**)(uint64_t, id, _QWORD))(v43 + 16))(v43, v40, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  _Block_object_dispose(v75, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

}

void __82__MobileActivationDaemon_createTunnel1ActivationInfo_options_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSError *v4;
  NSError *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "session"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = qSCskg((uint64_t)objc_msgSend(*(id *)(a1 + 32), "session"), (uint64_t)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), (int)objc_msgSend(*(id *)(a1 + 40), "length"), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      return;
    v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
    writeSplunkLog(v2, 9, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), (uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 777, 0, 0, v3, v8);

    v4 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 778, CFSTR("com.apple.MobileActivation.ErrorDomain"), -15, 0, CFSTR("PSCSign failed: %d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
  else
  {
    v4 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1ActivationInfo:options:withCompletionBlock:]_block_invoke_2", 764, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Invalid session."));
  }
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)createTunnel1SessionInfoWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  OS_dispatch_queue *v12;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[4];
  id v17;
  os_signpost_id_t v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v6 = copySignpostLoggingHandle();
  v7 = os_signpost_enabled(v6);

  if (v7)
  {
    v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v9 = copySignpostLoggingHandle();
      v8 = os_signpost_id_make_with_pointer(v9, v4);

    }
    v10 = copySignpostLoggingHandle();
    v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateSessionInfoXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904;
    v16[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v17 = v4;
    v18 = v8;
    v4 = objc_retainBlock(v16);

  }
  maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]", 1, CFSTR("Session creation requested by %@"), v5);
  v12 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_190;
  block[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  block[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async((dispatch_queue_t)v12, block);

}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateSessionInfoXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_190(uint64_t a1)
{
  id v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  MACollectionInterface *v6;
  id v7;
  MACollectionInterface *v8;
  id *v9;
  id *v10;
  id v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSDictionary *v17;
  id *v18;
  NSData *v19;
  id v20;
  id v21;
  id v22;
  NSError *v23;
  id v24;
  uint64_t v25;
  NSObject *queue;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  uint64_t *v31;
  id v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];

  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  v41 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 846, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v28 = 0;
LABEL_16:
    v17 = 0;
    v19 = 0;
    v27 = 0;
    v13 = 0;
    v11 = 0;
    v14 = 0;
    v16 = 0;
    v8 = 0;
LABEL_17:
    v22 = 0;
    v24 = v37[5];
    v37[5] = v23;
LABEL_18:

    goto LABEL_19;
  }
  v4 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v28 = objc_msgSend(v4, "copyAnswer:", CFSTR("UniqueDeviceID"));

  v5 = isNSString(v28);
  LODWORD(v4) = v5 == 0;

  if ((_DWORD)v4)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 852, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve UDID."));
    goto LABEL_16;
  }
  v6 = [MACollectionInterface alloc];
  v7 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v8 = -[MACollectionInterface initWithContext:](v6, "initWithContext:", v7);

  if (!v8)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 860, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to initialize collection interface."));
    goto LABEL_16;
  }
  v9 = v37 + 5;
  obj = v37[5];
  v27 = -[MACollectionInterface copyIngestData:](v8, "copyIngestData:", &obj);
  objc_storeStrong(v9, obj);
  if (!v27)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 866, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v37[5], CFSTR("Failed to copy ingest data."));
    v17 = 0;
    v19 = 0;
    v27 = 0;
LABEL_25:
    v13 = 0;
    v11 = 0;
LABEL_26:
    v14 = 0;
    v16 = 0;
    goto LABEL_17;
  }
  v10 = v37 + 5;
  v34 = v37[5];
  v11 = -[MACollectionInterface signatureForData:error:](v8, "signatureForData:error:", v27, &v34);
  objc_storeStrong(v10, v34);
  if (!v11)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 874, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v37[5], CFSTR("Failed to compute data signature."));
    v17 = 0;
    v19 = 0;
    goto LABEL_25;
  }
  v12 = v37 + 5;
  v33 = v37[5];
  v13 = -[MACollectionInterface signingKeyPublicKeyWithError:](v8, "signingKeyPublicKeyWithError:", &v33);
  objc_storeStrong(v12, v33);
  if (!v13)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 882, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v37[5], CFSTR("Failed to retrieve signing key public key."));
    v17 = 0;
    v19 = 0;
    v13 = 0;
    goto LABEL_26;
  }
  v14 = objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v15 = objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v16 = v15;
  if (!v14 || !v15)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 891, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode data as string."));
    v17 = 0;
LABEL_30:
    v19 = 0;
    goto LABEL_17;
  }
  v42[0] = CFSTR("X-Apple-Signature");
  v42[1] = CFSTR("X-Apple-Sig-Key");
  v43[0] = v14;
  v43[1] = v15;
  v42[2] = CFSTR("IngestBody");
  v43[2] = v27;
  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v18 = v37;
  v32 = 0;
  v19 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v17, 100, 0, &v32);
  objc_storeStrong(v18 + 5, v32);
  if (!v19)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 904, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v37[5], CFSTR("Failed to convert dictionary to data."));
    goto LABEL_30;
  }
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v20)
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 910, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create dictionary."));
    goto LABEL_17;
  }
  queue = objc_msgSend(*(id *)(a1 + 32), "sessionQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2;
  block[3] = &__block_descriptor_56_e8_32s40s48r_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  v31 = &v36;
  v21 = v20;
  v30 = v21;
  dispatch_sync(queue, block);

  if (v37[5])
  {
    v22 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("UniqueDeviceID"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("CollectionBlob"));
  v22 = v21;
  if (is_internal_build())
  {
    v24 = dictionary_to_xml((uint64_t)v22);
    maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke", 0, CFSTR("Session info: \n%@"), v24);
    goto LABEL_18;
  }
LABEL_19:
  v21 = v22;
LABEL_20:
  v25 = *(_QWORD *)(a1 + 40);
  if (v25)
    (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v22, v37[5]);

  _Block_object_dispose(&v36, 8);
}

void __70__MobileActivationDaemon_createTunnel1SessionInfoWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  NSError *v5;
  uint64_t v6;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentSessionDuration") >= 0x97)
  {
    maLog((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2", 0, CFSTR("Forcibly refreshing DRM session as more than half of the existing period (%llu secs of %u secs) has expired."), objc_msgSend(*(id *)(a1 + 32), "currentSessionDuration"), 300);
    objc_msgSend(*(id *)(a1 + 32), "generateSession:", 1);
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "sessionHelloMessage");

  if (v2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "sessionHelloMessage");
    v4 = objc_msgSend(v3, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, CFSTR("HandshakeRequestMessage"));

  }
  else
  {
    v5 = createAndLogError((uint64_t)"-[MobileActivationDaemon createTunnel1SessionInfoWithCompletionBlock:]_block_invoke_2", 926, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid session hello message."));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(id *)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }

}

- (void)createActivationInfoWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSUUID *v12;
  NSString *v13;
  OS_dispatch_queue *v14;
  id v15;
  NSString *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  MobileActivationDaemon *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v6 = copySignpostLoggingHandle();
  v7 = os_signpost_enabled(v6);

  if (v7)
  {
    v8 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v9 = copySignpostLoggingHandle();
      v8 = os_signpost_id_make_with_pointer(v9, v4);

    }
    v10 = copySignpostLoggingHandle();
    v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateActivationInfoLegacyXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904;
    v23[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v24 = v4;
    v25 = v8;
    v4 = objc_retainBlock(v23);

  }
  v12 = +[NSUUID UUID](NSUUID, "UUID");
  v13 = -[NSUUID UUIDString](v12, "UUIDString");

  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", v13);
  -[MobileActivationDaemon setActivationSessionClientName:](self, "setActivationSessionClientName:", v5);
  v14 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3254779904;
  v18[2] = __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_215;
  v18[3] = &__block_descriptor_64_e8_32s40s48s56bs_e5_v8__0l;
  v19 = v5;
  v20 = self;
  v21 = v13;
  v22 = v4;
  v15 = v4;
  v16 = v13;
  v17 = v5;
  dispatch_async((dispatch_queue_t)v14, v18);

}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CreateActivationInfoLegacyXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

void __66__MobileActivationDaemon_createActivationInfoWithCompletionBlock___block_invoke_215(uint64_t a1)
{
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSDictionary *v5;
  id v6;
  NSDictionary *v7;
  NSError *v8;
  id v9;
  NSError *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSError *v14;
  id v15;
  const __CFString *v16;
  uint64_t v17;

  maLog((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 1, CFSTR("Activation info creation requested by %@"), *(_QWORD *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 40), "dark");
  v3 = dataMigrationCompleted(v2);

  if ((v3 & 1) == 0)
  {
    v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 984, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
LABEL_7:
    v8 = v10;
    v7 = 0;
    v5 = 0;
    goto LABEL_8;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (!v4)
  {
    v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 989, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create activation nonce."));
    goto LABEL_7;
  }
  v16 = CFSTR("ActivationRandomness");
  v17 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v6 = objc_msgSend(*(id *)(a1 + 40), "dark");
  v15 = 0;
  v7 = create_activation_info_legacy(v6, v5, &v15);
  v8 = (NSError *)v15;

  if (v7)
  {
    v9 = dictionary_to_xml((uint64_t)v7);
    maLog((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 0, CFSTR("Activation info: \n%@"), v9);

  }
  else
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "dark");
    writeSplunkLog(v12, 1, -1, (uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 997, 0, CFSTR("%@"), v13, (uint64_t)v8);

    v14 = createAndLogError((uint64_t)"-[MobileActivationDaemon createActivationInfoWithCompletionBlock:]_block_invoke", 998, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v8, CFSTR("Failed to create activation info."));
    v7 = 0;
    v8 = v14;
  }
LABEL_8:
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, NSDictionary *, NSError *))(v11 + 16))(v11, v7, v8);

}

- (void)handleActivationInfo:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  DataArk *v15;
  unsigned __int8 v16;
  DataArk *v17;
  id v18;
  __CFString *v19;
  id v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  unsigned __int8 v24;
  id v25;
  DataArk *v26;
  char v27;
  NSError *v28;
  DataArk *v29;
  uint64_t v30;
  NSError *v31;
  NSError *v32;
  NSString *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  os_signpost_id_t v37;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v9 = copySignpostLoggingHandle();
  v10 = os_signpost_enabled(v9);

  if (v10)
  {
    v11 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v12 = copySignpostLoggingHandle();
      v11 = os_signpost_id_make_with_pointer(v12, v7);

    }
    v13 = copySignpostLoggingHandle();
    v14 = v13;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "HandleActivationInfoLegacyXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3254779904;
    v35[2] = __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke;
    v35[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v36 = v7;
    v37 = v11;
    v7 = objc_retainBlock(v35);

  }
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1, CFSTR("Activation (legacy) requested by %@"), v8);
  if (!v6)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1029, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
LABEL_20:
    v28 = v32;
    v19 = 0;
LABEL_21:
    v21 = 0;
LABEL_22:
    v22 = 0;
    goto LABEL_23;
  }
  v15 = -[MobileActivationDaemon dark](self, "dark");
  v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1034, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_20;
  }
  v17 = -[MobileActivationDaemon dark](self, "dark");
  v18 = data_ark_copy(v17, 0, CFSTR("ActivationState"));
  v19 = (__CFString *)isNSString(v18);

  if (!v19)
    v19 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Unactivated")) & 1) == 0)
  {
    v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1044, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is already activated (%@)."), v19);
    goto LABEL_21;
  }
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  v21 = v20;
  if (!v20)
  {
    v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1050, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."));
    goto LABEL_22;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UseFactoryCertificates"));
  v22 = -[MobileActivationDaemon activationNonce](self, "activationNonce");
  if (v22)
  {
    -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", 0);
    v23 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
    v24 = -[NSString isEqualToString:](v23, "isEqualToString:", v8);

    if ((v24 & 1) != 0)
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("ActivationRandomness"));
      v25 = dictionary_to_xml((uint64_t)v6);
      maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 0, CFSTR("Activation message:\n%@"), v25);

      v26 = -[MobileActivationDaemon dark](self, "dark");
      v34 = 0;
      v27 = handle_activate(v26, v6, v21, (NSError **)&v34);
      v28 = (NSError *)v34;

      if ((v27 & 1) == 0)
      {
        v29 = -[MobileActivationDaemon dark](self, "dark");
        writeSplunkLog(v29, 3, -1, (uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1081, 0, CFSTR("%@"), v30, (uint64_t)v28);

        v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1082, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, v28, CFSTR("Failed to activate device."));
        v28 = v31;
      }
    }
    else
    {
      v33 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
      v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1072, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid activation session (actual, expected): (%@, %@)"), v8, v33);

    }
  }
  else
  {
    v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfo:withCompletionBlock:]", 1065, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid activation nonce."));
  }
LABEL_23:
  if (v7)
    (*((void (**)(id, _QWORD, NSError *))v7 + 2))(v7, 0, v28);

}

void __67__MobileActivationDaemon_handleActivationInfo_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "HandleActivationInfoLegacyXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

- (void)copyUCRTWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  DataArk *v11;
  unsigned __int8 v12;
  DataArk *v13;
  __SecCertificate *v14;
  NSError *v15;
  CFDataRef v16;
  CFDataRef v17;
  NSDictionary *v18;
  id v19;
  NSDictionary *v20;
  NSError *v21;
  NSError *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[8];
  const __CFString *v28;
  CFDataRef v29;
  const __CFString *v30;
  void *v31;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyUCRTXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3254779904;
    v24[2] = __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke;
    v24[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v25 = v4;
    v26 = v7;
    v4 = objc_retainBlock(v24);

  }
  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v11 = -[MobileActivationDaemon dark](self, "dark");
    v12 = dataMigrationCompleted(v11);

    if ((v12 & 1) != 0)
    {
      v13 = -[MobileActivationDaemon dark](self, "dark");
      v23 = 0;
      v14 = copyUCRT(v13, (NSError **)&v23);
      v15 = (NSError *)v23;

      if (v14)
      {
        v16 = SecCertificateCopyData(v14);
        v17 = v16;
        if (v16)
        {
          v28 = CFSTR("UCRTData");
          v29 = v16;
          v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        }
        else
        {
          v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1124, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy UCRT certificate data."));

          v18 = 0;
          v15 = v22;
        }
        CFRelease(v14);
      }
      else
      {
        v21 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1118, CFSTR("com.apple.MobileActivation.ErrorDomain"), -4, v15, CFSTR("Failed to copy UCRT."));

        v17 = 0;
        v18 = 0;
        v15 = v21;
      }
      goto LABEL_16;
    }
    v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1112, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
  }
  else
  {
    v19 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    v30 = CFSTR("com.apple.mobileactivationd.spi");
    v31 = &__kCFBooleanTrue;
    v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTWithCompletionBlock:]", 1107, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("%@ is missing required entitlement: %@"), v19, v20);

  }
  v17 = 0;
  v18 = 0;
LABEL_16:
  if (v4)
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v18, v15);

}

void __54__MobileActivationDaemon_copyUCRTWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyUCRTXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)copyPCRTTokenWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  DataArk *v11;
  unsigned __int8 v12;
  DataArk *v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  DataArk *v17;
  BOOL v18;
  DataArk *v19;
  id v20;
  NSDictionary *v21;
  NSError *v22;
  id v23;
  NSDictionary *v24;
  NSError *MobileActivationError;
  _QWORD v26[4];
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[8];
  const __CFString *v30;
  id v31;
  const __CFString *v32;
  void *v33;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyPCRTXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3254779904;
    v26[2] = __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke;
    v26[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v27 = v4;
    v28 = v7;
    v4 = objc_retainBlock(v26);

  }
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v23 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    v32 = CFSTR("com.apple.mobileactivationd.spi");
    v33 = &__kCFBooleanTrue;
    v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1153, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("%@ is missing required entitlement: %@"), v23, v24);

LABEL_19:
    v21 = 0;
    v14 = 0;
    goto LABEL_23;
  }
  v11 = -[MobileActivationDaemon dark](self, "dark");
  v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1158, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_19;
  }
  v13 = -[MobileActivationDaemon dark](self, "dark");
  v14 = (__CFString *)data_ark_copy(v13, 0, CFSTR("ActivationState"));

  v15 = isNSString(v14);
  if (!v15)
  {
    v16 = CFSTR("Unactivated");

    v14 = v16;
  }
  if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
  {
    v17 = -[MobileActivationDaemon dark](self, "dark");
    v18 = collectionAlreadyPerformed(v17);

    if (v18)
    {
      v19 = -[MobileActivationDaemon dark](self, "dark");
      v20 = data_ark_copy(v19, 0, CFSTR("PCRTToken"));

      v21 = (NSDictionary *)isNSString(v20);
      if (v21)
      {
        v30 = CFSTR("PCRTToken");
        v31 = v20;
        v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v22 = 0;
        if (!v4)
          goto LABEL_25;
      }
      else
      {
        v22 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1179, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy PCRT token."));
        if (!v4)
          goto LABEL_25;
      }
      goto LABEL_24;
    }
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1173, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Collection has not been performed for this build."));
  }
  else
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyPCRTTokenWithCompletionBlock:]", 1168, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated (%@)."), v14);
  }
  v22 = MobileActivationError;
  v21 = 0;
LABEL_23:
  v20 = 0;
  if (v4)
LABEL_24:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v21, v22);
LABEL_25:

}

void __59__MobileActivationDaemon_copyPCRTTokenWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyPCRTXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)isDeviceBrickedWithCompletionBlock:(id)a3
{
  void (**v4)(id, NSDictionary *, NSError *);
  DataArk *v5;
  unsigned __int8 v6;
  DataArk *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSError *v11;
  NSDictionary *v12;
  NSNumber *v13;
  const __CFString *v14;
  NSNumber *v15;

  v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  v5 = -[MobileActivationDaemon dark](self, "dark");
  v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v11 = createAndLogError((uint64_t)"-[MobileActivationDaemon isDeviceBrickedWithCompletionBlock:]", 1200, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v9 = 0;
    v12 = 0;
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = -[MobileActivationDaemon dark](self, "dark");
  v8 = data_ark_copy(v7, 0, CFSTR("BrickState"));
  v9 = isNSNumber(v8);

  if (v9)
    v10 = (uint64_t)objc_msgSend(v9, "BOOLValue");
  else
    v10 = 1;
  v14 = CFSTR("BrickState");
  v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10);
  v15 = v13;
  v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);

  v11 = 0;
  if (v4)
LABEL_8:
    v4[2](v4, v12, v11);
LABEL_9:

}

- (void)getActivationBuildWithCompletionBlock:(id)a3
{
  void (**v4)(id, NSDictionary *, NSError *);
  DataArk *v5;
  unsigned __int8 v6;
  DataArk *v7;
  id v8;
  id v9;
  NSDictionary *v10;
  NSError *v11;
  const __CFString *v12;
  id v13;

  v4 = (void (**)(id, NSDictionary *, NSError *))a3;
  v5 = -[MobileActivationDaemon dark](self, "dark");
  v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v11 = createAndLogError((uint64_t)"-[MobileActivationDaemon getActivationBuildWithCompletionBlock:]", 1226, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v10 = 0;
    v9 = 0;
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = -[MobileActivationDaemon dark](self, "dark");
  v8 = data_ark_copy(v7, 0, CFSTR("LastActivated"));
  v9 = isNSString(v8);

  if (v9)
  {
    v12 = CFSTR("LastActivated");
    v13 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
  if (v4)
LABEL_8:
    v4[2](v4, v10, v11);
LABEL_9:

}

- (void)requestDeviceReactivationWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD, NSError *);
  DataArk *v5;
  unsigned __int8 v6;
  NSObject *v7;
  _BOOL4 v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  DataArk *v14;
  NSError *v15;
  _QWORD v16[4];
  id v17;
  os_signpost_id_t v18;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, NSError *))a3;
  v5 = -[MobileActivationDaemon dark](self, "dark");
  v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v15 = createAndLogError((uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]", 1247, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    if (!v4)
      goto LABEL_15;
LABEL_14:
    v4[2](v4, 0, v15);
    goto LABEL_15;
  }
  v7 = copySignpostLoggingHandle();
  v8 = os_signpost_enabled(v7);

  if (v8)
  {
    v9 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (void (**)(id, _QWORD, NSError *))0xEEEEB0B5B2B2EEEELL)
    {
      v10 = copySignpostLoggingHandle();
      v9 = os_signpost_id_make_with_pointer(v10, v4);

    }
    v11 = copySignpostLoggingHandle();
    v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RequestReactivationXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3254779904;
    v16[2] = __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke;
    v16[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v17 = v4;
    v18 = v9;
    v4 = objc_retainBlock(v16);

  }
  if (!use_hactivation())
  {
    v13 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    maLog((uint64_t)"-[MobileActivationDaemon requestDeviceReactivationWithCompletionBlock:]", 1, CFSTR("Reactivation requested by %@"), v13);

    v14 = -[MobileActivationDaemon dark](self, "dark");
    handle_deactivate(v14, 0);

  }
  v15 = 0;
  if (v4)
    goto LABEL_14;
LABEL_15:

}

void __71__MobileActivationDaemon_requestDeviceReactivationWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "RequestReactivationXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)copyActivationRecordWithCompletionBlock:(id)a3
{
  void (**v4)(id, id, NSError *);
  DataArk *v5;
  unsigned __int8 v6;
  DataArk *v7;
  id v8;
  __CFString *v9;
  DataArk *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSError *v17;

  v4 = (void (**)(id, id, NSError *))a3;
  v5 = -[MobileActivationDaemon dark](self, "dark");
  v6 = dataMigrationCompleted(v5);

  if ((v6 & 1) == 0)
  {
    v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1279, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v11 = 0;
    v12 = 0;
    v9 = 0;
    if (!v4)
      goto LABEL_14;
LABEL_13:
    v4[2](v4, v12, v17);
    goto LABEL_14;
  }
  v7 = -[MobileActivationDaemon dark](self, "dark");
  v8 = data_ark_copy(v7, 0, CFSTR("ActivationState"));
  v9 = (__CFString *)isNSString(v8);

  if (!v9)
    v9 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1289, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), v9);
    v11 = 0;
    goto LABEL_17;
  }
  v10 = -[MobileActivationDaemon dark](self, "dark");
  v11 = copy_activation_record(v10);

  if (!v11)
  {
    v17 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyActivationRecordWithCompletionBlock:]", 1295, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy activation record."));
LABEL_17:
    v12 = 0;
    if (!v4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));

  if (v13)
  {
    v14 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DeviceConfigurationFlags"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("DeviceConfigurationFlags"));

  }
  v15 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SoftwareUpdate"));

  if (v15)
  {
    v16 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SoftwareUpdate"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("SoftwareUpdate"));

  }
  v17 = 0;
  if (v4)
    goto LABEL_13;
LABEL_14:

}

- (void)unbrickDeviceWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  DataArk *v12;
  unsigned __int8 v13;
  DataArk *v14;
  id v15;
  __CFString *v16;
  DataArk *v17;
  char v18;
  NSError *v19;
  NSError *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UnbrickDeviceXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904;
    v22[2] = __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v23 = v4;
    v24 = v7;
    v4 = objc_retainBlock(v22);

  }
  v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1, CFSTR("Unbrick requested by %@"), v11);

  v12 = -[MobileActivationDaemon dark](self, "dark");
  v13 = dataMigrationCompleted(v12);

  if ((v13 & 1) != 0)
  {
    v14 = -[MobileActivationDaemon dark](self, "dark");
    v15 = data_ark_copy(v14, 0, CFSTR("ActivationState"));
    v16 = (__CFString *)isNSString(v15);

    if (!v16)
      v16 = CFSTR("Unactivated");
    if (!-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Unactivated")))
    {
      v19 = 0;
      if (!v4)
        goto LABEL_18;
      goto LABEL_17;
    }
    v17 = -[MobileActivationDaemon dark](self, "dark");
    v21 = 0;
    v18 = handle_unbrick(v17, &v21);
    v19 = (NSError *)v21;

    if ((v18 & 1) == 0)
    {
      v20 = createAndLogError((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1341, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v19, CFSTR("Unbrick failed."));

      v19 = v20;
      if (!v4)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else
  {
    v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon unbrickDeviceWithCompletionBlock:]", 1330, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v16 = 0;
  }
  if (v4)
LABEL_17:
    (*((void (**)(id, _QWORD, NSError *))v4 + 2))(v4, 0, v19);
LABEL_18:

}

void __59__MobileActivationDaemon_unbrickDeviceWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UnbrickDeviceXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)recertifyDeviceWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  DataArk *v12;
  unsigned __int8 v13;
  DataArk *v14;
  id v15;
  __CFString *v16;
  MobileRecertifyEngine *v17;
  OS_dispatch_queue *v18;
  DataArk *v19;
  MobileRecertifyEngine *v20;
  OS_dispatch_queue *v21;
  MobileRecertifyEngine *v22;
  NSError *v23;
  NSError *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  MobileActivationDaemon *v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  os_signpost_id_t v33;
  uint8_t buf[16];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v40 = 0;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RecerityDeviceXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904;
    v31[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v32 = v4;
    v33 = v7;
    v4 = objc_retainBlock(v31);

  }
  v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1, CFSTR("Recertification (SB) requested by %@"), v11);

  v12 = -[MobileActivationDaemon dark](self, "dark");
  v13 = dataMigrationCompleted(v12);

  if ((v13 & 1) != 0)
  {
    v14 = -[MobileActivationDaemon dark](self, "dark");
    v15 = data_ark_copy(v14, 0, CFSTR("ActivationState"));
    v16 = (__CFString *)isNSString(v15);

    if (!v16)
      v16 = CFSTR("Unactivated");
    if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
    {
      v17 = [MobileRecertifyEngine alloc];
      v18 = -[MobileActivationDaemon xpcQueue](self, "xpcQueue");
      v19 = -[MobileActivationDaemon dark](self, "dark");
      v20 = -[MobileRecertifyEngine initWithQueue:dark:](v17, "initWithQueue:dark:", v18, v19);

      if (v20)
      {
        v21 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904;
        block[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_257;
        block[3] = &__block_descriptor_64_e8_32s40s48bs56r_e5_v8__0l;
        v22 = v20;
        v27 = v22;
        v28 = self;
        v30 = &v35;
        v29 = v4;
        dispatch_async((dispatch_queue_t)v21, block);

        goto LABEL_22;
      }
      v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1385, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Failed to allocate recert engine."));
    }
    else
    {
      v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1379, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), v16);
    }
    v23 = v24;
  }
  else
  {
    v23 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]", 1369, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v16 = 0;
  }
  v25 = (void *)v36[5];
  v36[5] = (uint64_t)v23;

  if (v4)
    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, v36[5]);
  v22 = 0;
LABEL_22:

  _Block_object_dispose(&v35, 8);
}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "RecerityDeviceXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

void __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_257(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  id v5[2];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3254779904;
  v4[2] = __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2;
  v4[3] = &__block_descriptor_56_e8_32s40bs48r_e17_v16__0__NSError_8l;
  v1 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 48);
  v2 = (id)v3;
  *(_OWORD *)v5 = v3;
  objc_msgSend(v1, "recertifyDevice:", v4);

}

uint64_t __61__MobileActivationDaemon_recertifyDeviceWithCompletionBlock___block_invoke_2(_QWORD *a1, id a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSError *v7;
  uint64_t v8;
  void *v9;

  if (a2)
  {
    v3 = (void *)a1[4];
    v4 = a2;
    v5 = objc_msgSend(v3, "dark");
    writeSplunkLog(v5, 12, -1, (uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2", 1395, 0, CFSTR("%@"), v6, (uint64_t)v4);

    v7 = createAndLogError((uint64_t)"-[MobileActivationDaemon recertifyDeviceWithCompletionBlock:]_block_invoke_2", 1396, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v4, CFSTR("Recertification failed."));
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  DataArk *v18;
  unsigned __int8 v19;
  DataArk *v20;
  id v21;
  __CFString *v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSString *v28;
  NSString *v29;
  unsigned __int8 v30;
  NSDictionary *v31;
  id v32;
  id v33;
  NSNumber *v34;
  id v35;
  NSError *v36;
  DataArk *v37;
  NSError *v38;
  NSString *v39;
  NSString *v40;
  DataArk *v41;
  uint64_t v42;
  NSError *v43;
  NSDictionary *v44;
  DataArk *v45;
  DataArk *v46;
  id v47;
  DataArk *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  os_signpost_id_t v55;
  uint8_t buf[16];
  const __CFString *v57;
  id v58;
  const __CFString *v59;
  NSString *v60;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v12 = copySignpostLoggingHandle();
  v13 = os_signpost_enabled(v12);

  if (v13)
  {
    v14 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v15 = copySignpostLoggingHandle();
      v14 = os_signpost_id_make_with_pointer(v15, v8);

    }
    v16 = copySignpostLoggingHandle();
    v17 = v16;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HandleActivationInfoXPCV2", " enableTelemetry=YES ", buf, 2u);
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3254779904;
    v53[2] = __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke;
    v53[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v54 = v10;
    v55 = v14;
    v10 = objc_retainBlock(v53);

  }
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1, CFSTR("Activation (session) requested by %@"), v11);
  v49 = v9;
  if (!v8)
  {
    v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1430, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
LABEL_24:
    v36 = v38;
    v26 = 0;
    v22 = 0;
LABEL_29:
    v32 = 0;
    v28 = 0;
LABEL_30:
    v34 = 0;
    goto LABEL_31;
  }
  v18 = -[MobileActivationDaemon dark](self, "dark");
  v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1435, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_24;
  }
  v20 = -[MobileActivationDaemon dark](self, "dark");
  v21 = data_ark_copy(v20, 0, CFSTR("ActivationState"));
  v22 = (__CFString *)isNSString(v21);

  if (!v22)
    v22 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("Unactivated")) & 1) == 0)
  {
    v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1445, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is already activated (%@)."), v22);
LABEL_28:
    v26 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    v25 = 0;
    goto LABEL_27;
  }
  v52 = 0;
  v23 = -[MobileActivationDaemon validateActivationDataSignature:activationSignature:withError:](self, "validateActivationDataSignature:activationSignature:withError:", v8, v9, &v52);
  v24 = v52;
  v25 = v24;
  if ((v23 & 1) == 0)
  {
LABEL_27:
    v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1450, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v25, CFSTR("Invalid activation signature."));

    goto LABEL_28;
  }
  v51 = v24;
  v26 = getSessionActivationRecordFromData(v8, &v51);
  v27 = v51;

  if (!v26)
  {
    v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1456, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, v27, CFSTR("Failed to extract activation record."));

    goto LABEL_29;
  }
  v28 = -[MobileActivationDaemon activationNonce](self, "activationNonce");
  if (!v28)
  {
    v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1462, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid activation nonce."));
    v39 = (NSString *)v27;
LABEL_37:

    v32 = 0;
    goto LABEL_30;
  }
  v47 = v27;
  -[MobileActivationDaemon setActivationNonce:](self, "setActivationNonce:", 0);
  v29 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
  v30 = -[NSString isEqualToString:](v29, "isEqualToString:", v11);

  if ((v30 & 1) == 0)
  {
    v40 = -[MobileActivationDaemon activationSessionClientName](self, "activationSessionClientName");
    v36 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1469, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid activation session (actual, expected): (%@, %@)"), v11, v40);

    v39 = v40;
    goto LABEL_37;
  }
  v59 = CFSTR("ActivationRandomness");
  v60 = v28;
  v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v32 = -[NSDictionary mutableCopy](v31, "mutableCopy");

  v46 = -[MobileActivationDaemon dark](self, "dark");
  v33 = copy_activation_record(v46);
  v34 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33 != 0);

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("UseCommittedUIK"));
  v35 = dictionary_to_xml((uint64_t)v26);
  maLog((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 0, CFSTR("Activation message:\n%@"), v35);

  v45 = -[MobileActivationDaemon dark](self, "dark");
  v57 = CFSTR("ActivationRecord");
  v58 = v26;
  v44 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v50 = v47;
  LOBYTE(v46) = handle_activate(v45, v44, v32, (NSError **)&v50);
  v36 = (NSError *)v50;

  if ((v46 & 1) == 0)
  {
    v41 = -[MobileActivationDaemon dark](self, "dark");
    writeSplunkLog(v41, 4, -1, (uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1487, 0, CFSTR("%@"), v42, (uint64_t)v36);

    v43 = createAndLogError((uint64_t)"-[MobileActivationDaemon handleActivationInfoWithSession:activationSignature:completionBlock:]", 1488, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v36, CFSTR("Failed to activate device."));
    v36 = v43;
    if (!v10)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (device_supports_dcrt_oob())
  {
    v48 = -[MobileActivationDaemon dark](self, "dark");
    scheduleXPCActivity(v48, (const char *)objc_msgSend(CFSTR("com.apple.mobileactivationd.DCRT.OOB"), "UTF8String"), 5u, 1, 0x4000u, 0x1000u, &__block_literal_global_9);

    v37 = -[MobileActivationDaemon dark](self, "dark");
    scheduleXPCActivity(v37, (const char *)objc_msgSend(CFSTR("com.apple.mobileactivationd.SDCRT.OOB"), "UTF8String"), 5u, 1, 0x4000u, 0x1000u, &__block_literal_global_269);

    if (!v10)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_31:
  if (v10)
LABEL_32:
    (*((void (**)(id, _QWORD, NSError *))v10 + 2))(v10, 0, v36);
LABEL_33:

}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "HandleActivationInfoXPCV2", " enableTelemetry=YES ", v11, 2u);
  }

}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_267(id a1, DataArk *a2)
{
  dcrt_oob_activity_handler(a2, 0, 1);
}

void __94__MobileActivationDaemon_handleActivationInfoWithSession_activationSignature_completionBlock___block_invoke_2(id a1, DataArk *a2)
{
  dcrt_oob_activity_handler(a2, 1, 1);
}

- (void)issueClientCertificateLegacy:(id)a3 WithCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  DataArk *v15;
  unsigned __int8 v16;
  DataArk *v17;
  id v18;
  __CFString *v19;
  OS_dispatch_queue *v20;
  NSDictionary *v21;
  NSError *v22;
  void *v23;
  NSError *v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  id v41;
  const __CFString *v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__9;
  v40[4] = __Block_byref_object_dispose__9;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v39 = 0;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v6 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v6);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueClientCertificateLegacyXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904;
    v30[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v31 = v7;
    v32 = v10;
    v7 = objc_retainBlock(v30);

  }
  v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1, CFSTR("Client certification (legacy) requested by %@"), v14);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v42 = CFSTR("com.apple.mobileactivationd.spi");
    v43 = &__kCFBooleanTrue;
    v21 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v22 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1530, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v21);
    v23 = (void *)v35[5];
    v35[5] = (uint64_t)v22;

    v19 = 0;
    goto LABEL_20;
  }
  if (v6)
  {
    v15 = -[MobileActivationDaemon dark](self, "dark");
    v16 = dataMigrationCompleted(v15);

    if ((v16 & 1) != 0)
    {
      v17 = -[MobileActivationDaemon dark](self, "dark");
      v18 = data_ark_copy(v17, 0, CFSTR("ActivationState"));
      v19 = (__CFString *)isNSString(v18);

      if (!v19)
        v19 = CFSTR("Unactivated");
      if ((-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
      {
        v20 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
        block[0] = _NSConcreteStackBlock;
        block[1] = 3254779904;
        block[2] = __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_272;
        block[3] = &__block_descriptor_64_e8_32s40bs48r56r_e5_v8__0l;
        v28 = &v34;
        v26 = v6;
        v29 = v40;
        v27 = v7;
        dispatch_async((dispatch_queue_t)v20, block);

        goto LABEL_22;
      }
      v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1550, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), v19);
      goto LABEL_19;
    }
    v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1540, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
  }
  else
  {
    v24 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]", 1535, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
  }
  v19 = 0;
LABEL_19:
  v21 = (NSDictionary *)v35[5];
  v35[5] = (uint64_t)v24;
LABEL_20:

  if (v7)
    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v35[5]);
LABEL_22:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);

}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueClientCertificateLegacyXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

void __75__MobileActivationDaemon_issueClientCertificateLegacy_WithCompletionBlock___block_invoke_272(_QWORD *a1)
{
  SecAccessControlRef v2;
  SecAccessControlRef v3;
  uint64_t v4;
  NSDictionary *v5;
  SecKeyRef v6;
  SecKeyRef v7;
  uint64_t v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  NSError *v12;
  uint64_t v13;
  NSError *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id obj;
  CFErrorRef error;
  const __CFString *v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[4];

  error = 0;
  v2 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (v2)
  {
    v3 = v2;
    v24[0] = kSecAttrIsPermanent;
    v24[1] = kSecAttrTokenID;
    v25[0] = &__kCFBooleanFalse;
    v25[1] = kSecAttrTokenIDAppleKeyStore;
    v4 = a1[4];
    v24[2] = kSecAttrTokenOID;
    v24[3] = kSecAttrAccessControl;
    v25[2] = v4;
    v25[3] = v2;
    v5 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v6 = SecKeyCreateWithData((CFDataRef)+[NSData data](NSData, "data"), (CFDictionaryRef)v5, &error);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1[6] + 8);
      obj = *(id *)(v8 + 40);
      v9 = security_create_system_key_attestation((uint64_t)v6, 2, 0, &obj);
      objc_storeStrong((id *)(v8 + 40), obj);
      if (v9)
      {
        v22 = CFSTR("RKCertification");
        v23 = v9;
        v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v11 = a1[7];
      }
      else
      {
        v10 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1583, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(a1[6] + 8) + 40), CFSTR("Failed to create reference key attestation."));
        v11 = a1[6];
      }
      v17 = *(_QWORD *)(v11 + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v10;

      CFRelease(v7);
    }
    else
    {
      v14 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1577, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, error, CFSTR("Failed to convert legacy RK."));
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v9 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v12 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateLegacy:WithCompletionBlock:]_block_invoke", 1566, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create access control."));
    v9 = 0;
    v13 = *(_QWORD *)(a1[6] + 8);
    v5 = *(NSDictionary **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

  if (error)
    CFRelease(error);
  error = 0;
  v19 = a1[5];
  if (v19)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v19 + 16))(v19, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

}

- (void)issueClientCertificateWithReferenceKey:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  char v18;
  NSDictionary *v19;
  DataArk *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSDictionary *v26;
  NSError *v27;
  NSError *v28;
  NSError *v29;
  id v30;
  unsigned __int8 v31;
  DataArk *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  os_signpost_id_t v36;
  uint8_t buf[8];
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = copySignpostLoggingHandle();
  v12 = os_signpost_enabled(v11);

  if (v12)
  {
    v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v14 = copySignpostLoggingHandle();
      v13 = os_signpost_id_make_with_pointer(v14, v8);

    }
    v15 = copySignpostLoggingHandle();
    v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "IssueClientCertificateXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3254779904;
    v34[2] = __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke;
    v34[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v35 = v10;
    v36 = v13;
    v10 = objc_retainBlock(v34);

  }
  v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1, CFSTR("Client certification requested by %@"), v17);
  v33 = 0;
  v18 = isSupportedDeviceIdentityClient(1, (NSError **)&v33);
  v19 = (NSDictionary *)v33;
  if ((v18 & 1) == 0)
  {
    v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1625, CFSTR("com.apple.MobileActivation.ErrorDomain"), -25, v19, CFSTR("Client is not supported."));
LABEL_23:
    v29 = v28;
    goto LABEL_24;
  }
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v40 = CFSTR("com.apple.mobileactivationd.spi");
    v41 = &__kCFBooleanTrue;
    v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1630, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v26);
    goto LABEL_21;
  }
  v20 = -[MobileActivationDaemon dark](self, "dark");
  v21 = dataMigrationCompleted(v20);

  if ((v21 & 1) == 0)
  {
    v28 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1635, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_23;
  }
  if (!v9)
    goto LABEL_29;
  v22 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v23 = isNSArray(v22);

  if (!v23)
    goto LABEL_29;
  v24 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  if ((objc_msgSend(v24, "containsObject:", CFSTR("1.2.840.113635.100.10.1")) & 1) != 0)
    goto LABEL_16;
  v25 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  if (objc_msgSend(v25, "containsObject:", CFSTR("1.2.840.113635.100.8.1")))
  {

LABEL_16:
    goto LABEL_17;
  }
  v30 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v31 = objc_msgSend(v30, "containsObject:", CFSTR("1.2.840.113635.100.8.3"));

  if ((v31 & 1) == 0)
    goto LABEL_29;
LABEL_17:
  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.device-identifiers")))
  {
LABEL_29:
    v32 = -[MobileActivationDaemon dark](self, "dark");
    issueClientCertificateWithReferenceKey(v32, v17, v8, 0, v9, v10);

    goto LABEL_27;
  }
  v38 = CFSTR("com.apple.mobileactivationd.device-identifiers");
  v39 = &__kCFBooleanTrue;
  v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueClientCertificateWithReferenceKey:options:completion:]", 1645, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v26);
LABEL_21:
  v29 = v27;

  v19 = v26;
LABEL_24:

  if (v10)
    (*((void (**)(id, _QWORD, NSError *))v10 + 2))(v10, 0, v29);
  v19 = (NSDictionary *)v29;
LABEL_27:

}

void __84__MobileActivationDaemon_issueClientCertificateWithReferenceKey_options_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueClientCertificateXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

- (void)copyAttestationDictionaryWithCompletionBlock:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  DataArk *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSDictionary *v24;
  NSError *v25;
  void *v26;
  NSError *v27;
  __CFString *v28;
  id v29;
  id v30;
  NSError *v31;
  void *v32;
  id v33;
  unsigned __int8 v34;
  id v35;
  id v36;
  id v37;
  unsigned __int8 v38;
  DataArk *v39;
  id v40;
  OS_dispatch_queue *v41;
  DataArk *v42;
  id v43;
  DataArk *v44;
  id v45;
  id *v46;
  char v47;
  void *v48;
  DataArk *v49;
  id *v50;
  DataArk *v51;
  SecCertificateRef cf;
  _QWORD block[4];
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t *v58;
  id v59;
  id obj;
  _QWORD v61[4];
  id v62;
  os_signpost_id_t v63;
  uint8_t buf[16];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__9;
  v69 = __Block_byref_object_dispose__9;
  v70 = 0;
  v11 = copySignpostLoggingHandle();
  v12 = os_signpost_enabled(v11);

  if (v12)
  {
    v13 = 0xEEEEB0B5B2B2EEEELL;
    if (v8 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v14 = copySignpostLoggingHandle();
      v13 = os_signpost_id_make_with_pointer(v14, v8);

    }
    v15 = copySignpostLoggingHandle();
    v16 = v15;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CopyAttestationDictionaryXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3254779904;
    v61[2] = __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke;
    v61[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v62 = v10;
    v63 = v13;
    v10 = objc_retainBlock(v61);

  }
  v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1, CFSTR("Client attestation requested by %@"), v17);
  if (!v8 || !v17)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1685, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid input(s)."));
LABEL_21:
    v28 = 0;
LABEL_22:
    v29 = 0;
    v30 = 0;
LABEL_23:
    v24 = (NSDictionary *)v66[5];
    v66[5] = (uint64_t)v27;
    goto LABEL_26;
  }
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v73 = CFSTR("com.apple.mobileactivationd.spi");
    v74 = &__kCFBooleanTrue;
    v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1690, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v24);
    v32 = (void *)v66[5];
    v66[5] = (uint64_t)v31;

    goto LABEL_25;
  }
  v18 = -[MobileActivationDaemon dark](self, "dark");
  v19 = dataMigrationCompleted(v18);

  if ((v19 & 1) == 0)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1695, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_21;
  }
  if (!v9)
    goto LABEL_33;
  v20 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
  v21 = isNSArray(v20);

  if (v21)
  {
    v22 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
    if ((objc_msgSend(v22, "containsObject:", CFSTR("1.2.840.113635.100.10.1")) & 1) == 0)
    {
      v23 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
      if (!objc_msgSend(v23, "containsObject:", CFSTR("1.2.840.113635.100.8.1")))
      {
        v33 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OIDSToInclude"));
        v34 = objc_msgSend(v33, "containsObject:", CFSTR("1.2.840.113635.100.8.3"));

        if ((v34 & 1) == 0)
          goto LABEL_31;
        goto LABEL_18;
      }

    }
LABEL_18:
    if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.device-identifiers")))
    {
      v71 = CFSTR("com.apple.mobileactivationd.device-identifiers");
      v72 = &__kCFBooleanTrue;
      v24 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1705, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v24);
      v26 = (void *)v66[5];
      v66[5] = (uint64_t)v25;

LABEL_25:
      v28 = 0;
      v29 = 0;
      v30 = 0;
LABEL_26:

      if (v10)
        (*((void (**)(id, _QWORD, uint64_t))v10 + 2))(v10, 0, v66[5]);
      goto LABEL_28;
    }
  }
LABEL_31:
  v35 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
  v36 = isNSNumber(v35);

  if (v36)
  {
    v37 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("scrtAttestation"));
    v38 = objc_msgSend(v37, "BOOLValue");

    goto LABEL_34;
  }
LABEL_33:
  v38 = 0;
LABEL_34:
  v39 = -[MobileActivationDaemon dark](self, "dark");
  v40 = data_ark_copy(v39, 0, CFSTR("ActivationState"));
  v28 = (__CFString *)isNSString(v40);

  if (v28)
  {
    if ((v38 & 1) != 0)
    {
LABEL_36:
      v29 = 0;
      v30 = 0;
      cf = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v28 = CFSTR("Unactivated");
    if ((v38 & 1) != 0)
      goto LABEL_36;
  }
  if ((-[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1723, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), v28);
    goto LABEL_22;
  }
  v42 = -[MobileActivationDaemon dark](self, "dark");
  v29 = data_ark_copy(v42, 0, CFSTR("UCRTHealingRequired"));

  v43 = isNSNumber(v29);
  LODWORD(v42) = v43 == 0;

  if ((_DWORD)v42)
  {

    v29 = &__kCFBooleanFalse;
  }
  v44 = -[MobileActivationDaemon dark](self, "dark");
  v30 = data_ark_copy(v44, 0, CFSTR("UCRTOOBForbidden"));

  v45 = isNSNumber(v30);
  LODWORD(v44) = v45 == 0;

  if ((_DWORD)v44)
  {

    v30 = &__kCFBooleanFalse;
  }
  if (objc_msgSend(v29, "BOOLValue"))
  {
    v46 = (id *)(v66 + 5);
    obj = (id)v66[5];
    v47 = ucrtHealingSupported(&obj);
    objc_storeStrong(v46, obj);
    v48 = (void *)v66[5];
    if (v48)
    {
      v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1743, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v48, CFSTR("Failed to query UCRT healing support."));
    }
    else if ((v47 & 1) != 0)
    {
      if (objc_msgSend(v30, "BOOLValue"))
        v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1753, CFSTR("com.apple.MobileActivation.ErrorDomain"), -16, 0, CFSTR("UCRT healing required but not supported (max failure retries attempted)."));
      else
        v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1757, CFSTR("com.apple.MobileActivation.ErrorDomain"), -16, 0, CFSTR("UCRT healing required but not performed yet (try again later)."));
    }
    else
    {
      v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1748, CFSTR("com.apple.MobileActivation.ErrorDomain"), -16, 0, CFSTR("UCRT healing required but not supported (user signed into non-HSA2 iCloud account)."));
    }
    goto LABEL_23;
  }
  v49 = -[MobileActivationDaemon dark](self, "dark");
  v50 = (id *)(v66 + 5);
  v59 = (id)v66[5];
  v51 = v49;
  cf = copyUCRT(v49, (NSError **)&v59);
  objc_storeStrong(v50, v59);

  if (!cf)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]", 1763, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, (id)v66[5], CFSTR("Failed to copy UCRT."));
    goto LABEL_23;
  }
LABEL_37:
  v41 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3254779904;
  block[2] = __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke_293;
  block[3] = &__block_descriptor_72_e8_32s40s48s56bs64r_e5_v8__0l;
  v58 = &v65;
  v54 = v17;
  v55 = v9;
  v56 = v8;
  v57 = v10;
  dispatch_async((dispatch_queue_t)v41, block);

  if (cf)
    CFRelease(cf);
LABEL_28:
  _Block_object_dispose(&v65, 8);

}

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyAttestationDictionaryXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

void __90__MobileActivationDaemon_copyAttestationDictionaryWithCompletionBlock_options_completion___block_invoke_293(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSError *v13;
  SecAccessControlRef v14;
  SecAccessControlRef v15;
  NSNumber *v16;
  NSDictionary *v17;
  __SecKey *v18;
  __SecKey *v19;
  void *v20;
  uint64_t v21;
  __SecKey *v22;
  NSDictionary *v23;
  NSError *v24;
  uint64_t v25;
  void *v26;
  NSError *v27;
  uint64_t v28;
  void *v29;
  NSError *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  CFErrorRef error;
  const __CFString *v36;
  __SecKey *v37;
  _QWORD v38[5];
  _QWORD v39[5];

  error = 0;
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = v2;
  if (!v2)
  {
    v13 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1785, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."));
LABEL_14:
    v24 = v13;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    v23 = 0;
    v22 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("clientName"));
  v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
  v5 = isNSDictionary(v4);
  if (!v5)
  {
    v12 = 0;
    goto LABEL_7;
  }
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
  v8 = kSecUseSystemKeychain;
  v9 = objc_msgSend(v7, "objectForKeyedSubscript:", kSecUseSystemKeychain);
  v10 = isNSNumber(v9);

  if (v10)
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
    v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v12 = objc_msgSend(v11, "BOOLValue");

LABEL_7:
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:
  v14 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (!v14)
  {
    v13 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1799, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create access control."));
    goto LABEL_14;
  }
  v15 = v14;
  v38[0] = kSecAttrIsPermanent;
  v38[1] = kSecAttrTokenID;
  v39[0] = &__kCFBooleanFalse;
  v39[1] = kSecAttrTokenIDAppleKeyStore;
  v38[2] = kSecAttrTokenOID;
  v38[3] = kSecAttrAccessControl;
  v39[2] = *(_QWORD *)(a1 + 48);
  v39[3] = v14;
  v38[4] = kSecUseSystemKeychain;
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12);
  v39[4] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 5);

  v18 = SecKeyCreateWithData((CFDataRef)+[NSData data](NSData, "data"), (CFDictionaryRef)v17, &error);
  if (v18)
  {
    v19 = v18;
    v20 = *(void **)(a1 + 40);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v21 + 40);
    v22 = create_baa_info(v18, v20, &obj);
    objc_storeStrong((id *)(v21 + 40), obj);
    if (v22)
    {
      v36 = CFSTR("RKCertification");
      v37 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    }
    else
    {
      v30 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1820, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), CFSTR("Failed to create BAA info."));
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

      v23 = 0;
    }
    CFRelease(v19);
  }
  else
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyAttestationDictionaryWithCompletionBlock:options:completion:]_block_invoke", 1814, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, error, CFSTR("Failed to convert RK data blob."));
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    v23 = 0;
    v22 = 0;
  }
  CFRelease(v15);
LABEL_19:
  if (error)
    CFRelease(error);
  error = 0;
  v33 = *(_QWORD *)(a1 + 56);
  if (v33)
    (*(void (**)(uint64_t, NSDictionary *, _QWORD))(v33 + 16))(v33, v23, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (void)isInFieldCollectedWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  DataArk *v11;
  unsigned __int8 v12;
  DataArk *v13;
  BOOL v14;
  NSDictionary *v15;
  NSError *v16;
  id v17;
  NSDictionary *v18;
  NSError *MobileActivationError;
  _QWORD v20[4];
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[8];
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CollectionPerformedXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3254779904;
    v20[2] = __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke;
    v20[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v21 = v4;
    v22 = v7;
    v4 = objc_retainBlock(v20);

  }
  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v11 = -[MobileActivationDaemon dark](self, "dark");
    v12 = dataMigrationCompleted(v11);

    if ((v12 & 1) != 0)
    {
      v13 = -[MobileActivationDaemon dark](self, "dark");
      v14 = collectionAlreadyPerformed(v13);

      if (v14)
      {
        v24 = CFSTR("CollectionLastPerformed");
        v25 = &__kCFBooleanTrue;
        v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v16 = 0;
        if (!v4)
          goto LABEL_19;
        goto LABEL_18;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1869, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Collection has not been performed for this build."));
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1864, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    }
    v16 = MobileActivationError;
  }
  else
  {
    v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    v26 = CFSTR("com.apple.mobileactivationd.spi");
    v27 = &__kCFBooleanTrue;
    v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon isInFieldCollectedWithCompletionBlock:]", 1859, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("%@ is missing required entitlement: %@"), v17, v18);

  }
  v15 = 0;
  if (v4)
LABEL_18:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v15, v16);
LABEL_19:

}

void __64__MobileActivationDaemon_isInFieldCollectedWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CollectionPerformedXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)updateBasebandTicket:(id)a3 baaCertData:(id)a4 baaIntermediateCert:(id)a5 options:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  DataArk *v24;
  unsigned __int8 v25;
  DataArk *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSError *v31;
  NSDictionary *v32;
  NSError *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  double v38;
  OS_dispatch_queue *v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  MobileActivationDaemon *v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  _QWORD v51[4];
  id v52;
  os_signpost_id_t v53;
  uint8_t buf[16];
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  const __CFString *v67;
  void *v68;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__9;
  v65 = __Block_byref_object_dispose__9;
  v66 = 0;
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__9;
  v59 = __Block_byref_object_dispose__9;
  v60 = 0;
  v18 = copySignpostLoggingHandle();
  v19 = os_signpost_enabled(v18);

  if (v19)
  {
    v20 = 0xEEEEB0B5B2B2EEEELL;
    if (v12 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v21 = copySignpostLoggingHandle();
      v20 = os_signpost_id_make_with_pointer(v21, v12);

    }
    v22 = copySignpostLoggingHandle();
    v23 = v22;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v20, "UpdateBasebandTicketXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3254779904;
    v51[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke;
    v51[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v52 = v16;
    v53 = v20;
    v16 = objc_retainBlock(v51);

  }
  maLog((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1, CFSTR("Baseband ticket update requested by %@ (%@)"), v17, v15);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v67 = CFSTR("com.apple.mobileactivationd.spi");
    v68 = &__kCFBooleanTrue;
    v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v33 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1899, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v32);
    v34 = (void *)v62[5];
    v62[5] = (uint64_t)v33;

    v35 = 0;
    goto LABEL_24;
  }
  if (v12 && v13 && v14)
  {
    v24 = -[MobileActivationDaemon dark](self, "dark");
    v25 = dataMigrationCompleted(v24);

    if ((v25 & 1) != 0)
    {
      v26 = -[MobileActivationDaemon dark](self, "dark");
      v27 = data_ark_copy(v26, 0, CFSTR("ActivationState"));
      v28 = isNSString(v27);
      v29 = v56[5];
      v56[5] = v28;

      v30 = v56[5];
      if (!v30)
      {
        objc_storeStrong(v56 + 5, CFSTR("Unactivated"));
        v30 = v56[5];
      }
      if ((objc_msgSend(v30, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
      {
        if (use_hactivation())
        {
          v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1924, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device is hactivated (not supported)."));
        }
        else
        {
          if (is_product_cellular())
          {
            v36 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NetworkTimeoutInterval"));
            v37 = isNSNumber(v36);

            if (v37)
            {
              v35 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NetworkTimeoutInterval"));
              objc_msgSend(v35, "doubleValue");
              if (v38 <= 0.0)
              {
                v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1936, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid network timeout requested: %@"), v35);
                goto LABEL_23;
              }
            }
            else
            {
              v35 = 0;
            }
            v39 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_306;
            block[3] = &__block_descriptor_112_e8_32s40s48s56s64s72s80s88bs96r104r_e5_v8__0l;
            v49 = &v61;
            v41 = v17;
            v42 = v15;
            v43 = v12;
            v44 = v13;
            v45 = v14;
            v46 = self;
            v35 = v35;
            v47 = v35;
            v50 = &v55;
            v48 = v16;
            dispatch_async((dispatch_queue_t)v39, block);

            goto LABEL_26;
          }
          v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1929, CFSTR("com.apple.MobileActivation.ErrorDomain"), -3, 0, CFSTR("Device doesn't support telephony."));
        }
      }
      else
      {
        v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1919, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), v56[5]);
      }
    }
    else
    {
      v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1909, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    }
  }
  else
  {
    v31 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]", 1904, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input(s)."));
  }
  v35 = 0;
LABEL_23:
  v32 = (NSDictionary *)v62[5];
  v62[5] = (uint64_t)v31;
LABEL_24:

  if (v16)
    (*((void (**)(id, _QWORD, uint64_t))v16 + 2))(v16, 0, v62[5]);
LABEL_26:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UpdateBasebandTicketXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_306(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSDictionary *v7;
  NSError *v8;
  uint64_t v9;
  void *v10;
  __SecCertificate *v11;
  NSDictionary *v12;
  __SecKey *v13;
  NSError *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSDictionary *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  NSDictionary *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  unsigned int v36;
  NSError *v37;
  NSError *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  SecAccessControlRef v51;
  NSNumber *v52;
  NSDictionary *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  id v60;
  NSString *v61;
  NSURL *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  NSURL *v67;
  NSMutableString *v68;
  id v69;
  NSString *v70;
  id v71;
  MATelephonyInfo *v72;
  uint64_t v73;
  unsigned __int8 v74;
  NSObject *v75;
  MATelephonyInfo *v76;
  uint64_t v77;
  unsigned __int8 v78;
  NSObject *v79;
  uint64_t v80;
  id v81;
  id v82;
  MATelephonyInfo *v83;
  uint64_t v84;
  unsigned __int8 v85;
  NSObject *v86;
  MATelephonyInfo *v87;
  uint64_t v88;
  unsigned __int8 v89;
  NSObject *v90;
  NSMutableString *v91;
  id v92;
  NSString *v93;
  id v94;
  uint64_t v95;
  NSError *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSError *v100;
  uint64_t v101;
  void *v102;
  NSError *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  __SecKey *v107;
  __SecCertificate *v108;
  NSDictionary *v109;
  id v110;
  uint64_t v111;
  void *v112;
  NSError *v113;
  uint64_t v114;
  void *v115;
  NSError *v116;
  uint64_t v117;
  void *v118;
  NSError *MobileActivationError;
  NSError *v120;
  uint64_t v121;
  void *v122;
  void **v123;
  id v124;
  id *v125;
  id v126;
  NSObject *v127;
  void *v128;
  void *v129;
  NSString *v130;
  NSError *v131;
  uint64_t v132;
  NSString *v133;
  NSError *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  NSError *v139;
  uint64_t v140;
  void *v141;
  NSError *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t *v146;
  NSDictionary *v147;
  id v148;
  NSString *v149;
  NSDictionary *v150;
  SecAccessControlRef cf;
  NSDictionary *v152;
  id v153;
  id v154;
  id v155;
  NSDictionary *v156;
  id v157;
  _QWORD block[5];
  id v159;
  int8x16_t v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id obj;
  id v170;
  id v171;
  NSError *v172;
  NSError *v173;
  CFErrorRef error;
  uint64_t v175;
  _QWORD v176[5];
  _QWORD v177[5];
  _QWORD v178[2];
  _QWORD v179[2];

  error = 0;
  v175 = 0;
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v157 = v2;
  if (!v2)
  {
    v14 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1972, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate dictionary."));
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v155 = 0;
    v156 = 0;
    v154 = 0;
LABEL_76:
    cf = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_80:
    v7 = 0;
    goto LABEL_81;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("clientName"));
  v3 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("UseCellularBootstrapProxy"));
  v4 = isNSNumber(v3);

  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("UseCellularBootstrapProxy"));
    v155 = v5;
    if (is_product_cellular() && objc_msgSend(v5, "BOOLValue"))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v173 = *(NSError **)(v6 + 40);
      v7 = (NSDictionary *)copyCellularProxyDictionary(1, &v173);
      objc_storeStrong((id *)(v6 + 40), v173);
      if (!v7)
      {
        v8 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1983, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), CFSTR("Failed to query cellular network proxy info."));
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v149 = 0;
        v150 = 0;
        v152 = 0;
        v153 = 0;
        v156 = 0;
        v154 = 0;
        cf = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
LABEL_81:
        v41 = 0;
        v21 = 0;
        goto LABEL_82;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v155 = 0;
  }
  v17 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("UseCellularOTAProxy"));
  v18 = isNSNumber(v17);

  if (!v18)
  {
    v156 = v7;
    v154 = 0;
    goto LABEL_17;
  }
  v19 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("UseCellularOTAProxy"));
  v154 = v19;
  if (!is_product_cellular() || !objc_msgSend(v19, "BOOLValue"))
  {
    v156 = v7;
LABEL_17:
    v22 = 0;
    goto LABEL_18;
  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v172 = *(NSError **)(v20 + 40);
  v21 = (NSDictionary *)copyCellularProxyDictionary(0, &v172);
  objc_storeStrong((id *)(v20 + 40), v172);

  if (!v21)
  {
    v38 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 1996, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), CFSTR("Failed to query cellular network proxy info."));
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v40 = *(void **)(v39 + 40);
    *(_QWORD *)(v39 + 40) = v38;

    v149 = 0;
    v150 = 0;
    v152 = 0;
    v153 = 0;
    v156 = 0;
    cf = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v7 = 0;
    v41 = 0;
LABEL_82:
    v148 = 0;
    v81 = 0;
    v60 = 0;
    goto LABEL_83;
  }
  v22 = 1;
  v156 = v21;
LABEL_18:
  v23 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SOCKSProxyHost"));
  v24 = isNSString(v23);
  if (v24)
  {
    v25 = v24;
    v26 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SOCKSProxyPort"));
    v27 = isNSNumber(v26);

    if (!v27)
      goto LABEL_22;
    v178[0] = CFSTR("SOCKSProxyHost");
    v23 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SOCKSProxyHost"));
    v179[0] = v23;
    v178[1] = CFSTR("SOCKSProxyPort");
    v28 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SOCKSProxyPort"));
    v179[1] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v179, v178, 2);

    v156 = v29;
  }

LABEL_22:
  if (is_internal_build())
  {
    v30 = objc_alloc((Class)NSUserDefaults);
    v31 = objc_msgSend(v30, "persistentDomainForName:", CFSTR("com.apple.mobileactivationd"));

    v32 = objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("UseReverseProxy"));
    v33 = isNSNumber(v32);
    v153 = v31;
    if (v33)
    {
      v34 = v33;
      v35 = objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("UseReverseProxy"));
      v36 = objc_msgSend(v35, "BOOLValue");

      if (v36)
      {
        if (v156)
        {
          v37 = createAndLogError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2012, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Cannot set both '%@' override and '%@'/'%@' option."), CFSTR("UseReverseProxy"), CFSTR("UseCellularBootstrapProxy"), CFSTR("UseCellularOTAProxy"));
LABEL_75:
          v98 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          v99 = *(void **)(v98 + 40);
          *(_QWORD *)(v98 + 40) = v37;

          v149 = 0;
          v150 = 0;
          v152 = 0;
          goto LABEL_76;
        }
        v156 = (NSDictionary *)copyReverseProxyDictionary(0, 0, 0);
      }
    }
    else
    {

    }
  }
  else
  {
    v153 = 0;
  }
  v42 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
  v43 = isNSDictionary(v42);
  if (!v43)
  {
    v50 = 0;
    goto LABEL_35;
  }
  v44 = v43;
  v45 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
  v46 = kSecUseSystemKeychain;
  v47 = objc_msgSend(v45, "objectForKeyedSubscript:", kSecUseSystemKeychain);
  v48 = isNSNumber(v47);

  if (v48)
  {
    v42 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SigningKeyAttributes"));
    v49 = objc_msgSend(v42, "objectForKeyedSubscript:", v46);
    v50 = objc_msgSend(v49, "BOOLValue");

LABEL_35:
    goto LABEL_37;
  }
  v50 = 0;
LABEL_37:
  v51 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  if (!v51)
  {
    v37 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2028, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to create access control."));
    goto LABEL_75;
  }
  v176[0] = kSecAttrIsPermanent;
  v176[1] = kSecAttrTokenID;
  v177[0] = &__kCFBooleanFalse;
  v177[1] = kSecAttrTokenIDAppleKeyStore;
  v176[2] = kSecAttrTokenOID;
  v176[3] = kSecAttrAccessControl;
  v177[2] = *(_QWORD *)(a1 + 48);
  v177[3] = v51;
  cf = v51;
  v176[4] = kSecUseSystemKeychain;
  v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v50);
  v177[4] = v52;
  v53 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v177, v176, 5);

  v13 = SecKeyCreateWithData((CFDataRef)+[NSData data](NSData, "data"), (CFDictionaryRef)v53, &error);
  v152 = v53;
  if (!v13)
  {
    v100 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2043, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, error, CFSTR("Failed to convert RK data blob."));
    v101 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v102 = *(void **)(v101 + 40);
    *(_QWORD *)(v101 + 40) = v100;

    v149 = 0;
    v150 = 0;
    v11 = 0;
LABEL_79:
    v12 = 0;
    goto LABEL_80;
  }
  v11 = SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 56));
  if (!v11)
  {
    v103 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2049, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."));
    v104 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v105 = *(void **)(v104 + 40);
    *(_QWORD *)(v104 + 40) = v103;

    v149 = 0;
    v150 = 0;
    goto LABEL_79;
  }
  v7 = (NSDictionary *)SecCertificateCreateWithData(kCFAllocatorDefault, *(CFDataRef *)(a1 + 64));
  if (!v7)
  {
    v113 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2055, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create certificate."));
    v114 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v115 = *(void **)(v114 + 40);
    *(_QWORD *)(v114 + 40) = v113;

    v149 = 0;
    v150 = 0;
    v12 = 0;
    goto LABEL_81;
  }
  v54 = objc_msgSend(*(id *)(a1 + 72), "dark");
  v55 = a1 + 96;
  v56 = *(void **)(a1 + 40);
  v57 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v171 = *(id *)(v57 + 40);
  v147 = v7;
  v7 = create_baseband_info(v54, v13, v11, (__SecCertificate *)v7, v56, &v171);
  objc_storeStrong((id *)(v57 + 40), v171);

  if (v7)
  {
    v170 = 0;
    v58 = *(_QWORD *)(*(_QWORD *)v55 + 8);
    obj = *(id *)(v58 + 40);
    v59 = createXMLRequest(v7, &v170, (NSError **)&obj);
    v60 = v170;
    objc_storeStrong((id *)(v58 + 40), obj);
    v150 = v7;
    if ((v59 & 1) != 0)
    {
      v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), CFSTR("iOS Device Activator (MobileActivation-1006)"), *(_QWORD *)(a1 + 32));
      if (v61)
      {
        v146 = (uint64_t *)(a1 + 96);
        v149 = v61;
        objc_msgSend(v60, "setValue:forHTTPHeaderField:");
        v62 = +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://albert.apple.com/deviceservices/baseband"));
        objc_msgSend(v60, "setURL:", v62);

        v63 = *(void **)(a1 + 80);
        if (v63)
        {
          objc_msgSend(v63, "doubleValue");
          objc_msgSend(v60, "setTimeoutInterval:");
        }
        if (is_internal_build())
        {
          v64 = objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("BasebandOverrideURL"));
          v65 = isNSString(v64);

          if (v65)
          {
            v66 = objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("BasebandOverrideURL"));
            v67 = +[NSURL URLWithString:](NSURL, "URLWithString:", v66);
            objc_msgSend(v60, "setURL:", v67);

          }
        }
        v68 = formatURLRequest(v60);
        v69 = copy_log_directory_path();
        v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_baseband_request.txt"), *(_QWORD *)(a1 + 32));
        v71 = objc_msgSend(v69, "stringByAppendingPathComponent:", v70);
        -[NSMutableString writeToFile:atomically:encoding:error:](v68, "writeToFile:atomically:encoding:error:", v71, 0, 4, 0);

        if (is_product_cellular())
        {
          if (objc_msgSend(v155, "BOOLValue"))
          {
            v72 = +[MATelephonyInfo sharedInstance](MATelephonyInfo, "sharedInstance");
            v73 = *(_QWORD *)(*v146 + 8);
            v168 = *(id *)(v73 + 40);
            v74 = -[MATelephonyInfo setCellularBootstrapAssertion:withError:](v72, "setCellularBootstrapAssertion:withError:", 1, &v168);
            objc_storeStrong((id *)(v73 + 40), v168);

            if ((v74 & 1) == 0)
            {
              v75 = copyLoggingHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_4();

            }
          }
          if (objc_msgSend(v154, "BOOLValue"))
          {
            v76 = +[MATelephonyInfo sharedInstance](MATelephonyInfo, "sharedInstance");
            v77 = *(_QWORD *)(*v146 + 8);
            v167 = *(id *)(v77 + 40);
            v78 = -[MATelephonyInfo setOTAActivationAssertion:withError:](v76, "setOTAActivationAssertion:withError:", 1, &v167);
            objc_storeStrong((id *)(v77 + 40), v167);

            if ((v78 & 1) == 0)
            {
              v79 = copyLoggingHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_3();

            }
          }
        }
        v80 = *(_QWORD *)(*v146 + 8);
        v165 = *(id *)(v80 + 40);
        v166 = 0;
        v81 = talkToServerWithError(v60, 0, v22, v156, &v166, &v175, &v165);
        v82 = v166;
        objc_storeStrong((id *)(v80 + 40), v165);
        if (is_product_cellular())
        {
          if (objc_msgSend(v155, "BOOLValue"))
          {
            v83 = +[MATelephonyInfo sharedInstance](MATelephonyInfo, "sharedInstance");
            v84 = *(_QWORD *)(*v146 + 8);
            v164 = *(id *)(v84 + 40);
            v85 = -[MATelephonyInfo setCellularBootstrapAssertion:withError:](v83, "setCellularBootstrapAssertion:withError:", 0, &v164);
            objc_storeStrong((id *)(v84 + 40), v164);

            if ((v85 & 1) == 0)
            {
              v86 = copyLoggingHandle();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_2();

            }
          }
          if (objc_msgSend(v154, "BOOLValue"))
          {
            v87 = +[MATelephonyInfo sharedInstance](MATelephonyInfo, "sharedInstance");
            v88 = *(_QWORD *)(*v146 + 8);
            v163 = *(id *)(v88 + 40);
            v89 = -[MATelephonyInfo setOTAActivationAssertion:withError:](v87, "setOTAActivationAssertion:withError:", 0, &v163);
            objc_storeStrong((id *)(v88 + 40), v163);

            if ((v89 & 1) == 0)
            {
              v90 = copyLoggingHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
                __issueClientCertificateWithReferenceKey_block_invoke_4_cold_1();

            }
          }
        }
        v91 = formatURLResponse(v81, v175, v82);
        v92 = copy_log_directory_path();
        v93 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_baseband_response.txt"), *(_QWORD *)(a1 + 32));
        v94 = objc_msgSend(v92, "stringByAppendingPathComponent:", v93);
        -[NSMutableString writeToFile:atomically:encoding:error:](v91, "writeToFile:atomically:encoding:error:", v94, 0, 4, 0);

        v95 = v175;
        v148 = v82;
        if (v175 != 200)
        {
          if (v175)
          {
            v129 = *(void **)(*(_QWORD *)(*v146 + 8) + 40);
            v130 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v175);
            v131 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2123, CFSTR("com.apple.MobileActivation.ServerErrorDomain"), v95, v129, CFSTR("Server error: %ld (%@)"), v95, v130);

            v132 = v175;
            v133 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v175);
            v134 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2123, CFSTR("com.apple.MobileActivation.ErrorDomain"), -5, v131, CFSTR("Server error: %ld (%@)"), v132, v133);

            v135 = *(_QWORD *)(*v146 + 8);
            v136 = *(void **)(v135 + 40);
            *(_QWORD *)(v135 + 40) = v134;
LABEL_109:

            v7 = 0;
LABEL_110:
            v41 = 0;
            v21 = 0;
            goto LABEL_111;
          }
          v96 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2118, CFSTR("com.apple.MobileActivation.ErrorDomain"), -6, *(void **)(*(_QWORD *)(*v146 + 8) + 40), CFSTR("Network communication error."));
          v97 = *v146;
LABEL_108:
          v137 = *(_QWORD *)(v97 + 8);
          v138 = *(void **)(v137 + 40);
          *(_QWORD *)(v137 + 40) = v96;
          v136 = v138;
          goto LABEL_109;
        }
        v123 = (void **)(*(_QWORD *)(*v146 + 8) + 40);
        if (!v81)
        {
          v96 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2128, CFSTR("com.apple.MobileActivation.ErrorDomain"), -5, *v123, CFSTR("Failed to retrieve client certificate."));
          v97 = *v146;
          goto LABEL_108;
        }
        v162 = 0;
        v7 = (NSDictionary *)+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v81, 0, 0, &v162);
        objc_storeStrong(v123, v162);
        v124 = isNSDictionary(v7);

        if (!v124)
        {
          v139 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2134, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*v146 + 8) + 40), CFSTR("Failed to convert data to XML."));
          v140 = *(_QWORD *)(*v146 + 8);
          v141 = *(void **)(v140 + 40);
          *(_QWORD *)(v140 + 40) = v139;

          goto LABEL_110;
        }
        v21 = (NSDictionary *)-[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("AccountToken"));
        v41 = isNSData(v21);

        if (v41)
        {
          v125 = (id *)(*(_QWORD *)(*v146 + 8) + 40);
          v161 = 0;
          v41 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v21, 0, 0, &v161);
          objc_storeStrong(v125, v161);
          v126 = isNSDictionary(v41);

          if (v126)
          {
            v127 = objc_msgSend(*(id *)(a1 + 72), "xpcQueue");
            block[0] = _NSConcreteStackBlock;
            block[1] = 3254779904;
            block[2] = __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2;
            block[3] = &__block_descriptor_64_e8_32s40s48r56r_e5_v8__0l;
            block[4] = *(_QWORD *)(a1 + 72);
            v160 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
            v41 = v41;
            v159 = v41;
            dispatch_sync(v127, block);

            v128 = v159;
LABEL_116:

            goto LABEL_111;
          }
          v142 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2146, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*v146 + 8) + 40), CFSTR("Failed to convert data to XML."));
          v143 = *v146;
        }
        else
        {
          v142 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2140, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid account token."));
          v143 = *v146;
        }
        v144 = *(_QWORD *)(v143 + 8);
        v145 = *(void **)(v144 + 40);
        *(_QWORD *)(v144 + 40) = v142;
        v128 = v145;
        goto LABEL_116;
      }
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2074, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create user agent string."));
    }
    else
    {
      MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2068, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)v55 + 8) + 40), CFSTR("Failed to create XML request."));
    }
    v120 = MobileActivationError;
    v121 = *(_QWORD *)(*(_QWORD *)v55 + 8);
    v122 = *(void **)(v121 + 40);
    *(_QWORD *)(v121 + 40) = v120;

    v148 = 0;
    v149 = 0;
    v7 = 0;
    v41 = 0;
    v21 = 0;
    v81 = 0;
  }
  else
  {
    v116 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2063, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)v55 + 8) + 40), CFSTR("Failed to verify baa cert."));
    v117 = *(_QWORD *)(*(_QWORD *)v55 + 8);
    v118 = *(void **)(v117 + 40);
    *(_QWORD *)(v117 + 40) = v116;

    v149 = 0;
    v150 = 0;
    v41 = 0;
    v21 = 0;
    v148 = 0;
    v81 = 0;
    v60 = 0;
  }
LABEL_111:
  v12 = v147;
LABEL_83:
  v106 = v60;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    v107 = v13;
    v108 = v11;
    v109 = v12;
    v110 = objc_msgSend(*(id *)(a1 + 72), "dark");
    writeSplunkLog(v110, 27, v175, (uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke", 2176, v157, CFSTR("%@"), v111, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
    v112 = v110;
    v12 = v109;
    v11 = v108;
    v13 = v107;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  if (v13)
    CFRelease(v13);
  if (v11)
    CFRelease(v11);
  if (v12)
    CFRelease(v12);
  if (cf)
    CFRelease(cf);
  if (error)
    CFRelease(error);

}

void __107__MobileActivationDaemon_updateBasebandTicket_baaCertData_baaIntermediateCert_options_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSError *v16;
  uint64_t v17;
  void *v18;
  NSError *v19;
  uint64_t v20;
  void *v21;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dark");
  v3 = data_ark_copy(v2, 0, CFSTR("ActivationState"));
  v4 = isNSString(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (!v10)
  {
    objc_storeStrong(v9, CFSTR("Unactivated"));
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "dark");
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v14 + 40);
    v15 = deliver_baseband_ticket((int)v11, v12, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);

    if ((v15 & 1) == 0)
    {
      v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke_2", 2163, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), CFSTR("Failed to deliver baseband ticket."));
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }
  else
  {
    v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon updateBasebandTicket:baaCertData:baaIntermediateCert:options:withCompletionBlock:]_block_invoke_2", 2158, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated: %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

- (void)copyDCRTWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  DataArk *v14;
  unsigned __int8 v15;
  DataArk *v16;
  id v17;
  __CFString *v18;
  NSError *v19;
  NSDictionary *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSNumber *v25;
  DataArk *v26;
  NSError *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[8];
  const __CFString *v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v7);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CopyDCRTXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904;
    v29[2] = __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v30 = v7;
    v31 = v10;
    v7 = objc_retainBlock(v29);

  }
  v14 = -[MobileActivationDaemon dark](self, "dark");
  v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) == 0)
  {
    v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2211, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v20 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  if (platform_supports_activation())
  {
    v16 = -[MobileActivationDaemon dark](self, "dark");
    v17 = data_ark_copy(v16, 0, CFSTR("ActivationState"));
    v18 = (__CFString *)isNSString(v17);

    if (!v18)
      v18 = CFSTR("Unactivated");
    if ((-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
    {
      v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2222, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated (%@)."), v18);
      v20 = 0;
LABEL_15:
      v21 = 0;
      v22 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0;
  }
  v23 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = v23;
  if (v23)
  {
    if (v6)
      objc_msgSend(v23, "addEntriesFromDictionary:", v6);
    v24 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
    v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", client_requires_critical_dcrt_oids((uint64_t)v24));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("ValidateCriticalDcrtOIDs"));

    v26 = -[MobileActivationDaemon dark](self, "dark");
    v28 = 0;
    v21 = copyDCRT(v26, 0, 0, v22, &v28);
    v19 = (NSError *)v28;

    if (v21)
    {
      v33 = CFSTR("DCRTData");
      v34 = v21;
      v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    }
    else
    {
      v27 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2241, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy DCRT."));

      v20 = 0;
      v19 = v27;
    }
  }
  else
  {
    v19 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyDCRTWithCompletionBlock:withCompletion:]", 2229, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create mutable dictionary."));
    v20 = 0;
    v21 = 0;
  }
LABEL_16:
  if (v7)
    (*((void (**)(id, NSDictionary *, NSError *))v7 + 2))(v7, v20, v19);

}

void __69__MobileActivationDaemon_copyDCRTWithCompletionBlock_withCompletion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyDCRTXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)getDCRTStateWithCompletionBlock:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  DataArk *v14;
  unsigned __int8 v15;
  DataArk *v16;
  id v17;
  __CFString *v18;
  NSDictionary *v19;
  NSError *v20;
  id v21;
  NSDictionary *v22;
  void *v23;
  id v24;
  id v25;
  NSNumber *v26;
  DataArk *v27;
  NSError *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[8];
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;

  v6 = a3;
  v7 = a4;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v7);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CopyDCRTStateXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3254779904;
    v30[2] = __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke;
    v30[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v31 = v7;
    v32 = v10;
    v7 = objc_retainBlock(v30);

  }
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v40 = CFSTR("com.apple.mobileactivationd.spi");
    v41 = &__kCFBooleanTrue;
    v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2269, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v22);

LABEL_17:
    v19 = 0;
    v21 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  v14 = -[MobileActivationDaemon dark](self, "dark");
  v15 = dataMigrationCompleted(v14);

  if ((v15 & 1) == 0)
  {
    v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2274, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_17;
  }
  if (platform_supports_activation())
  {
    v16 = -[MobileActivationDaemon dark](self, "dark");
    v17 = data_ark_copy(v16, 0, CFSTR("ActivationState"));
    v18 = (__CFString *)isNSString(v17);

    if (!v18)
      v18 = CFSTR("Unactivated");
    if ((-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
    {
      v38 = CFSTR("DCRTState");
      v39 = CFSTR("DCRTUnavailable");
      v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v20 = 0;
      v21 = 0;
LABEL_18:
      v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v18 = 0;
  }
  v24 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = v24;
  if (!v24)
  {
    v20 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2292, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create mutable dictionary."));
    v19 = 0;
LABEL_31:
    v21 = 0;
    goto LABEL_19;
  }
  if (v6)
    objc_msgSend(v24, "addEntriesFromDictionary:", v6);
  v25 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", client_requires_critical_dcrt_oids((uint64_t)v25));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("ValidateCriticalDcrtOIDs"));

  v27 = -[MobileActivationDaemon dark](self, "dark");
  v29 = 0;
  v21 = copyDCRT(v27, 0, 0, v23, &v29);
  v20 = (NSError *)v29;

  if (v21)
  {
    v34 = CFSTR("DCRTState");
    v35 = CFSTR("DCRTAvailable");
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    goto LABEL_19;
  }
  if (mobileactivationErrorHasDomainAndErrorCode(v20, CFSTR("com.apple.MobileActivation.ErrorDomain"), (id)0xFFFFFFFFFFFFFFF6))
  {

    v36 = CFSTR("DCRTState");
    v37 = CFSTR("DCRTUnavailable");
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v20 = 0;
    goto LABEL_31;
  }
  v28 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon getDCRTStateWithCompletionBlock:withCompletion:]", 2310, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v20, CFSTR("Failed to copy DCRT"));

  v19 = 0;
  v21 = 0;
  v20 = v28;
LABEL_19:
  if (v7)
    (*((void (**)(id, NSDictionary *, NSError *))v7 + 2))(v7, v19, v20);

}

void __73__MobileActivationDaemon_getDCRTStateWithCompletionBlock_withCompletion___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyDCRTStateXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)issueDCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  DataArk *v15;
  unsigned __int8 v16;
  DataArk *v17;
  id v18;
  __CFString *v19;
  id v20;
  void *v21;
  id v22;
  NSNumber *v23;
  DataArk *v24;
  NSError *v25;
  NSDictionary *v26;
  NSError *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[8];
  const __CFString *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v7);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueDCRTXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3254779904;
    v29[2] = __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke;
    v29[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v30 = v7;
    v31 = v10;
    v7 = objc_retainBlock(v29);

  }
  v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 1, CFSTR("DCRT reissue requested by %@ (%@)"), v14, v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v33 = CFSTR("com.apple.mobileactivationd.spi");
    v34 = &__kCFBooleanTrue;
    v26 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2342, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v26);

    goto LABEL_20;
  }
  v15 = -[MobileActivationDaemon dark](self, "dark");
  v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    v25 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2347, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
LABEL_20:
    v19 = 0;
    if (!v7)
      goto LABEL_22;
LABEL_21:
    (*((void (**)(id, _QWORD, NSError *))v7 + 2))(v7, 0, v25);
    goto LABEL_22;
  }
  v17 = -[MobileActivationDaemon dark](self, "dark");
  v18 = data_ark_copy(v17, 0, CFSTR("ActivationState"));
  v19 = (__CFString *)isNSString(v18);

  if (!v19)
    v19 = CFSTR("Unactivated");
  if (platform_supports_activation()
    && (-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2358, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is not activated (%@)."), v19);
LABEL_25:
    v25 = v27;
    if (!v7)
      goto LABEL_22;
    goto LABEL_21;
  }
  v20 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v20)
  {
    v27 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueDCRT:withCompletionBlock:]", 2365, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create mutable dictionary."), v28);
    goto LABEL_25;
  }
  v21 = v20;
  if (v6)
    objc_msgSend(v20, "addEntriesFromDictionary:", v6);
  v22 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", client_requires_critical_dcrt_oids((uint64_t)v22));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("ValidateCriticalDcrtOIDs"));

  v24 = -[MobileActivationDaemon dark](self, "dark");
  issueDCRT(v24, v14, v21, v7);

  v25 = 0;
LABEL_22:

}

void __56__MobileActivationDaemon_issueDCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueDCRTXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)issueUCRT:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  DataArk *v15;
  unsigned __int8 v16;
  DataArk *v17;
  id v18;
  __CFString *v19;
  DataArk *v20;
  NSError *v21;
  NSDictionary *v22;
  _QWORD v23[4];
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[8];
  const __CFString *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v7);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueUCRTXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3254779904;
    v23[2] = __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke;
    v23[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v24 = v7;
    v25 = v10;
    v7 = objc_retainBlock(v23);

  }
  v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 1, CFSTR("UCRT reissue requested by %@ (%@)"), v14, v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v27 = CFSTR("com.apple.mobileactivationd.spi");
    v28 = &__kCFBooleanTrue;
    v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2403, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v22);

    goto LABEL_16;
  }
  v15 = -[MobileActivationDaemon dark](self, "dark");
  v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2408, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
LABEL_16:
    v19 = 0;
    if (!v7)
      goto LABEL_18;
LABEL_17:
    (*((void (**)(id, _QWORD, NSError *))v7 + 2))(v7, 0, v21);
    goto LABEL_18;
  }
  v17 = -[MobileActivationDaemon dark](self, "dark");
  v18 = data_ark_copy(v17, 0, CFSTR("ActivationState"));
  v19 = (__CFString *)isNSString(v18);

  if (!v19)
    v19 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v21 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueUCRT:withCompletionBlock:]", 2418, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is not activated (%@)."), v19);
    if (!v7)
      goto LABEL_18;
    goto LABEL_17;
  }
  v20 = -[MobileActivationDaemon dark](self, "dark");
  issueUCRT(v20, v14, v6, v7);

  v21 = 0;
LABEL_18:

}

void __56__MobileActivationDaemon_issueUCRT_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueUCRTXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

- (void)issueCollection:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  DataArk *v15;
  unsigned __int8 v16;
  DataArk *v17;
  id v18;
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DataArk *v25;
  id v26;
  DataArk *v27;
  id v28;
  id v29;
  id v30;
  DataArk *v31;
  NSError *v32;
  NSDictionary *v33;
  DataArk *v34;
  id v35;
  DataArk *v36;
  NSObject *v37;
  _QWORD v38[4];
  id v39;
  os_signpost_id_t v40;
  uint8_t buf[4];
  id v42;
  const __CFString *v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  v8 = copySignpostLoggingHandle();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
    if (v7 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v11 = copySignpostLoggingHandle();
      v10 = os_signpost_id_make_with_pointer(v11, v7);

    }
    v12 = copySignpostLoggingHandle();
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "IssueCollectionXPC", " enableTelemetry=YES ", buf, 2u);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3254779904;
    v38[2] = __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke;
    v38[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v39 = v7;
    v40 = v10;
    v7 = objc_retainBlock(v38);

  }
  v14 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 1, CFSTR("Collection requested by %@ (%@)"), v14, v6);
  if (!-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v43 = CFSTR("com.apple.mobileactivationd.spi");
    v44 = &__kCFBooleanTrue;
    v33 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2455, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v33);

LABEL_32:
    v19 = 0;
LABEL_33:
    v20 = 0;
    v24 = 0;
    v23 = 0;
    goto LABEL_34;
  }
  v15 = -[MobileActivationDaemon dark](self, "dark");
  v16 = dataMigrationCompleted(v15);

  if ((v16 & 1) == 0)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2460, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    goto LABEL_32;
  }
  v17 = -[MobileActivationDaemon dark](self, "dark");
  v18 = data_ark_copy(v17, 0, CFSTR("ActivationState"));
  v19 = (__CFString *)isNSString(v18);

  if (!v19)
    v19 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2470, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is not activated (%@)."), v19);
    goto LABEL_33;
  }
  v20 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scheduleCollectionForCurrentBuild"));
  v21 = isNSNumber(v20);

  if (!v21)
  {

    v20 = &__kCFBooleanFalse;
  }
  if (!objc_msgSend(v20, "BOOLValue"))
  {
    v34 = -[MobileActivationDaemon dark](self, "dark");
    issueCollection(v34, v14, v6, v7);

    v32 = 0;
    v30 = 0;
    v28 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_37;
  }
  v22 = +[GestaltHlpr getSharedInstance](GestaltHlpr, "getSharedInstance");
  v23 = objc_msgSend(v22, "copyAnswer:", CFSTR("BuildVersion"));

  v24 = isNSString(v23);
  if (v24)
  {
    v25 = -[MobileActivationDaemon dark](self, "dark");
    v24 = data_ark_copy(v25, 0, CFSTR("CollectionLastPerformed"));

    v26 = isNSString(v24);
    if (!v26)
    {

      v24 = 0;
    }
    v27 = -[MobileActivationDaemon dark](self, "dark");
    v28 = data_ark_copy(v27, 0, CFSTR("InFieldCollectionInFlight"));

    v29 = isNSNumber(v28);
    if (!v29)
    {

      v28 = &__kCFBooleanFalse;
    }
    v30 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IgnoreExistingCollection"));
    v35 = isNSNumber(v30);

    if (!v35)
    {

      v30 = &__kCFBooleanFalse;
    }
    if (((objc_msgSend(v30, "BOOLValue") & 1) != 0
       || (objc_msgSend(v24, "isEqualToString:", v23) & 1) == 0)
      && (objc_msgSend(v28, "BOOLValue") & 1) == 0)
    {
      v36 = -[MobileActivationDaemon dark](self, "dark");
      data_ark_remove(v36, 0, CFSTR("CollectionLastPerformed"));

      v37 = copyLoggingHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v14;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Scheduling collection as requested by %@.", buf, 0xCu);
      }

      v31 = -[MobileActivationDaemon dark](self, "dark");
      scheduleXPCActivity(v31, (const char *)objc_msgSend(CFSTR("com.apple.mobileactivationd.collection"), "UTF8String"), 5u, 1, 0x5000u, 0x1000u, &__block_literal_global_359);

    }
    v32 = 0;
    goto LABEL_35;
  }
  v32 = createAndLogError((uint64_t)"-[MobileActivationDaemon issueCollection:withCompletionBlock:]", 2487, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve build version."));
LABEL_34:
  v28 = 0;
  v30 = 0;
LABEL_35:
  if (v7)
    (*((void (**)(id, _QWORD, NSError *))v7 + 2))(v7, 0, v32);
LABEL_37:

}

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "IssueCollectionXPC", " enableTelemetry=YES ", v11, 2u);
  }

}

void __62__MobileActivationDaemon_issueCollection_withCompletionBlock___block_invoke_358(id a1, DataArk *a2)
{
  collection_activity_handler(a2, 0);
}

- (void)ucrtUpgradeRequiredWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  DataArk *v11;
  unsigned __int8 v12;
  DataArk *v13;
  id v14;
  __CFString *v15;
  DataArk *v16;
  SecCertificateRef v17;
  NSError *v18;
  DataArk *v19;
  id v20;
  id v21;
  void *v22;
  DataArk *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSDictionary *v27;
  NSNumber *v28;
  NSError *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  os_signpost_id_t v33;
  uint8_t buf[8];
  const __CFString *v35;
  NSNumber *v36;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UCRTUpgradeRequiredXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3254779904;
    v31[2] = __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke;
    v31[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v32 = v4;
    v33 = v7;
    v4 = objc_retainBlock(v31);

  }
  v11 = -[MobileActivationDaemon dark](self, "dark");
  v12 = dataMigrationCompleted(v11);

  if ((v12 & 1) == 0)
  {
    v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2545, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Data Migration not complete."));
    v17 = 0;
    v15 = 0;
    goto LABEL_24;
  }
  v13 = -[MobileActivationDaemon dark](self, "dark");
  v14 = data_ark_copy(v13, 0, CFSTR("ActivationState"));
  v15 = (__CFString *)isNSString(v14);

  if (!v15)
    v15 = CFSTR("Unactivated");
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
  {
    v18 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2555, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Device is not activated (%@)."), v15);
    v17 = 0;
LABEL_24:
    v22 = 0;
    v24 = 0;
    v27 = 0;
    if (!v4)
      goto LABEL_29;
    goto LABEL_28;
  }
  v16 = -[MobileActivationDaemon dark](self, "dark");
  v30 = 0;
  v17 = copyUCRT(v16, (NSError **)&v30);
  v18 = (NSError *)v30;

  if (!v17
    && (mobileactivationErrorHasDomainAndErrorCode(v18, CFSTR("com.apple.MobileActivation.ErrorDomain"), (id)0xFFFFFFFFFFFFFFFCLL) & 1) == 0)
  {
    v29 = createAndLogError((uint64_t)"-[MobileActivationDaemon ucrtUpgradeRequiredWithCompletionBlock:]", 2561, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v18, CFSTR("Failed to copy UCRT."));

    v17 = 0;
    v22 = 0;
    v24 = 0;
    v27 = 0;
    v18 = v29;
    if (!v4)
      goto LABEL_29;
LABEL_28:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v27, v18);
    goto LABEL_29;
  }
  v19 = -[MobileActivationDaemon dark](self, "dark");
  v20 = data_ark_copy(v19, 0, CFSTR("UCRTHealingRequired"));
  v21 = isNSNumber(v20);

  if (v21)
    v22 = v21;
  else
    v22 = &__kCFBooleanFalse;
  v23 = -[MobileActivationDaemon dark](self, "dark");
  v24 = data_ark_copy(v23, 0, CFSTR("UIKUpgradeRequired"));

  v25 = isNSNumber(v24);
  if (!v25)
  {

    v24 = &__kCFBooleanFalse;
  }
  v35 = CFSTR("UCRTUpgradeRequired");
  if (v17 && (objc_msgSend(v22, "BOOLValue") & 1) == 0)
    v26 = (uint64_t)objc_msgSend(v24, "BOOLValue");
  else
    v26 = 1;
  v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26);
  v36 = v28;
  v27 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);

  if (v4)
    goto LABEL_28;
LABEL_29:
  if (v17)
    CFRelease(v17);

}

void __65__MobileActivationDaemon_ucrtUpgradeRequiredWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "UCRTUpgradeRequiredXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)copyLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  DataArk *v11;
  id v12;
  __CFString *v13;
  OS_dispatch_queue *v14;
  NSDictionary *v15;
  NSError *v16;
  void *v17;
  NSError *v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[8];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  const __CFString *v32;
  void *v33;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9;
  v30 = __Block_byref_object_dispose__9;
  v31 = 0;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyLegacyIdentityXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3254779904;
    v22[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    v22[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v23 = v4;
    v24 = v7;
    v4 = objc_retainBlock(v22);

  }
  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v11 = -[MobileActivationDaemon dark](self, "dark");
    v12 = data_ark_copy(v11, 0, CFSTR("ActivationState"));
    v13 = (__CFString *)isNSString(v12);

    if (!v13)
      v13 = CFSTR("Unactivated");
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("Activated")) & 1) != 0)
    {
      v14 = -[MobileActivationDaemon creationQueue](self, "creationQueue");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3254779904;
      block[2] = __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_360;
      block[3] = &__block_descriptor_48_e8_32bs40r_e5_v8__0l;
      v21 = &v26;
      v20 = v4;
      dispatch_async((dispatch_queue_t)v14, block);

      goto LABEL_17;
    }
    v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]", 2609, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated (%@)."), v13);
    v15 = (NSDictionary *)v27[5];
    v27[5] = (uint64_t)v18;
  }
  else
  {
    v32 = CFSTR("com.apple.mobileactivationd.spi");
    v33 = &__kCFBooleanTrue;
    v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v16 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]", 2599, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v15);
    v17 = (void *)v27[5];
    v27[5] = (uint64_t)v16;

    v13 = 0;
  }

  if (v4)
    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, v27[5]);
LABEL_17:
  _Block_object_dispose(&v26, 8);

}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyLegacyIdentityXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

void __70__MobileActivationDaemon_copyLegacyDeviceIdentityWithCompletionBlock___block_invoke_360(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFDataRef v4;
  uint64_t v5;
  CFDataRef v6;
  CFDataRef v7;
  NSDictionary *v8;
  NSError *MobileActivationError;
  NSError *v10;
  uint64_t v11;
  void *v12;
  NSError *v13;
  NSError *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSError *v18;
  uint64_t v19;
  void *v20;
  id obj;
  CFErrorRef error;
  SecIdentityRef identityRef;
  SecKeyRef privateKeyRef;
  SecCertificateRef certificateRef;
  _QWORD v26[2];
  _QWORD v27[2];

  privateKeyRef = 0;
  certificateRef = 0;
  error = 0;
  identityRef = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v2 + 40);
  copy_keys_and_certs(CFSTR("lockdown-identities"), CFSTR("com.apple.lockdown.identity.activation"), 0, 0, 0, &identityRef, (NSError **)&obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  if (!identityRef)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2636, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("Failed to copy legacy device identity."));
LABEL_11:
    v10 = MobileActivationError;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v4 = 0;
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v3 = SecIdentityCopyCertificate(identityRef, &certificateRef);
  if ((_DWORD)v3 || !certificateRef)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2642, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode certificate: %d"), v3);
    goto LABEL_11;
  }
  v4 = SecCertificateCopyData(certificateRef);
  if (!v4)
  {
    v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2648, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy certificate data."));
LABEL_14:
    v14 = v13;
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    goto LABEL_15;
  }
  v5 = SecIdentityCopyPrivateKey(identityRef, &privateKeyRef);
  if ((_DWORD)v5 || !privateKeyRef)
  {
    v13 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2654, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to decode private key: %d"), v5);
    goto LABEL_14;
  }
  v6 = SecKeyCopyExternalRepresentation(privateKeyRef, &error);
  v7 = v6;
  if (v6)
  {
    v26[0] = CFSTR("LegacyDeviceIdentityCertificateDataBlob");
    v26[1] = CFSTR("LegacyDeviceIdentityPrivateKeyDataBlob");
    v27[0] = v4;
    v27[1] = v6;
    v8 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    goto LABEL_17;
  }
  v18 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyLegacyDeviceIdentityWithCompletionBlock:]_block_invoke", 2660, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, error, CFSTR("Failed to copy private key data."));
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

LABEL_16:
  v8 = 0;
LABEL_17:
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, NSDictionary *, _QWORD))(v17 + 16))(v17, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (error)
    CFRelease(error);
  error = 0;
  if (identityRef)
    CFRelease(identityRef);
  identityRef = 0;
  if (certificateRef)
    CFRelease(certificateRef);
  certificateRef = 0;
  if (privateKeyRef)
    CFRelease(privateKeyRef);
  privateKeyRef = 0;

}

- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  DataArk *v12;
  id v13;
  __CFString *v14;
  char v15;
  NSError *v16;
  NSError *v17;
  NSDictionary *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[8];
  const __CFString *v24;
  void *v25;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "DeleteLegacyIdentityXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3254779904;
    v20[2] = __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke;
    v20[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v21 = v4;
    v22 = v7;
    v4 = objc_retainBlock(v20);

  }
  v11 = -[MobileActivationDaemon callingProcessName](self, "callingProcessName");
  maLog((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 1, CFSTR("Legacy Identity (delete) requested by %@"), v11);

  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v12 = -[MobileActivationDaemon dark](self, "dark");
    v13 = data_ark_copy(v12, 0, CFSTR("ActivationState"));
    v14 = (__CFString *)isNSString(v13);

    if (!v14)
      v14 = CFSTR("Unactivated");
    if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("Activated")) & 1) == 0)
    {
      v16 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2717, CFSTR("com.apple.MobileActivation.ErrorDomain"), -8, 0, CFSTR("Device is not activated (%@)."), v14);
      if (!v4)
        goto LABEL_18;
      goto LABEL_17;
    }
    v19 = 0;
    v15 = delete_identity(CFSTR("lockdown-identities"), CFSTR("com.apple.lockdown.identity.activation"), (NSError **)&v19);
    v16 = (NSError *)v19;
    if ((v15 & 1) == 0)
    {
      v17 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2722, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v16, CFSTR("Failed to delete existing identity."));

      v16 = v17;
      if (!v4)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else
  {
    v24 = CFSTR("com.apple.mobileactivationd.spi");
    v25 = &__kCFBooleanTrue;
    v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = createAndLogError((uint64_t)"-[MobileActivationDaemon deleteLegacyDeviceIdentityWithCompletionBlock:]", 2707, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v18);

    v14 = 0;
  }
  if (v4)
LABEL_17:
    (*((void (**)(id, _QWORD, NSError *))v4 + 2))(v4, 0, v16);
LABEL_18:

}

void __72__MobileActivationDaemon_deleteLegacyDeviceIdentityWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "DeleteLegacyIdentityXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)copyUCRTVersionInfoWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSError *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  NSError *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  os_signpost_id_t v19;
  uint8_t buf[8];
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  void *v24;

  v4 = a3;
  v5 = copySignpostLoggingHandle();
  v6 = os_signpost_enabled(v5);

  if (v6)
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
    if (v4 != (id)0xEEEEB0B5B2B2EEEELL)
    {
      v8 = copySignpostLoggingHandle();
      v7 = os_signpost_id_make_with_pointer(v8, v4);

    }
    v9 = copySignpostLoggingHandle();
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CopyUCRTVersionInfoXPC", (const char *)&unk_1002533A1, buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3254779904;
    v17[2] = __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke;
    v17[3] = &__block_descriptor_48_e8_32bs_e34_v24__0__NSDictionary_8__NSError_16l;
    v18 = v4;
    v19 = v7;
    v4 = objc_retainBlock(v17);

  }
  if (-[MobileActivationDaemon isEntitled:](self, "isEntitled:", CFSTR("com.apple.mobileactivationd.spi")))
  {
    v16 = 0;
    v11 = -[MobileActivationDaemon copyUCRTVersionInfoWithError:](self, "copyUCRTVersionInfoWithError:", &v16);
    v12 = (NSError *)v16;
    if (v11)
    {
      v21 = CFSTR("UCRTVersionInfo");
      v22 = v11;
      v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      if (!v4)
        goto LABEL_14;
    }
    else
    {
      v15 = createMobileActivationError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]", 2752, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v12, CFSTR("Failed to copy UCRT version info."));

      v13 = 0;
      v12 = v15;
      if (!v4)
        goto LABEL_14;
    }
    goto LABEL_13;
  }
  v23 = CFSTR("com.apple.mobileactivationd.spi");
  v24 = &__kCFBooleanTrue;
  v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v12 = createAndLogError((uint64_t)"-[MobileActivationDaemon copyUCRTVersionInfoWithCompletionBlock:]", 2746, CFSTR("com.apple.MobileActivation.ErrorDomain"), -7, 0, CFSTR("Client is missing required entitlement: %@"), v14);

  v13 = 0;
  v11 = 0;
  if (v4)
LABEL_13:
    (*((void (**)(id, NSDictionary *, NSError *))v4 + 2))(v4, v13, v12);
LABEL_14:

}

void __65__MobileActivationDaemon_copyUCRTVersionInfoWithCompletionBlock___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  v8 = copySignpostLoggingHandle();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "CopyUCRTVersionInfoXPC", (const char *)&unk_1002533A1, v11, 2u);
  }

}

- (void)setDark:(id)a3
{
  objc_storeStrong((id *)&self->_dark, a3);
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (OS_dispatch_queue)creationQueue
{
  return self->_creationQueue;
}

- (NSString)activationNonce
{
  return self->_activationNonce;
}

- (void)setActivationNonce:(id)a3
{
  objc_storeStrong((id *)&self->_activationNonce, a3);
}

- (NSString)activationSessionClientName
{
  return self->_activationSessionClientName;
}

- (void)setActivationSessionClientName:(id)a3
{
  objc_storeStrong((id *)&self->_activationSessionClientName, a3);
}

- (NSString)recertNonce
{
  return self->_recertNonce;
}

- (void)setRecertNonce:(id)a3
{
  objc_storeStrong((id *)&self->_recertNonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recertNonce, 0);
  objc_storeStrong((id *)&self->_activationSessionClientName, 0);
  objc_storeStrong((id *)&self->_activationNonce, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_dark, 0);
  objc_storeStrong((id *)&self->_sessionHelloMessage, 0);
}

@end
