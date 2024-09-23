@implementation AAController

- (AAController)init
{
  AAController *v2;
  AAController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAController;
  v2 = -[AAController init](&v5, "init");
  if (v2)
  {
    v2->_clientID = sub_1000074F8();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_coreBluetoothInternalFlag = 0x2000;
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  unsigned int clientID;
  id v4;

  clientID = self->_clientID;
  v4 = 0;
  NSAppendPrintF(&v4, "AAController, CID 0x%X", clientID);
  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  AAController *v5;
  id v6;
  id activateCompletion;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    v6 = objc_retainBlock(v4);
    activateCompletion = v5->_activateCompletion;
    v5->_activateCompletion = v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000076D0;
    block[3] = &unk_1001E20E8;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

- (void)_activate
{
  uint64_t v3;
  void (**v4)(id, id);
  id activateCompletion;
  id v6;

  if (self->_invalidateCalled)
  {
    v3 = NSErrorF(NSOSStatusErrorDomain, 4294896148, "Activate after invalidate");
    v6 = (id)objc_claimAutoreleasedReturnValue(v3);
    if (dword_10020F700 <= 90
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
    {
      LogPrintF(&dword_10020F700, "-[AAController _activate]", 90, "### Activate failed: %@, %@", self, v6);
    }
    v4 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v4)
      v4[2](v4, v6);

  }
  else
  {
    -[AAController _activateXPC:](self, "_activateXPC:", 0);
  }
}

- (void)_activateXPC:(BOOL)a3
{
  xpc_object_t v4;
  void *v5;
  uint64_t coreBluetoothInternalFlag;
  _xpc_connection_s *v7;
  OS_dispatch_queue *dispatchQueue;
  _QWORD handler[5];

  if (a3)
  {
    if (dword_10020F700 <= 30
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 30)))
    {
      LogPrintF(&dword_10020F700, "-[AAController _activateXPC:]", 30, "Re-activate: CID 0x%X");
    }
  }
  else if (dword_10020F700 <= 30
         && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 30)))
  {
    LogPrintF(&dword_10020F700, "-[AAController _activateXPC:]", 30, "Activate: CID 0x%X");
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  coreBluetoothInternalFlag = self->_coreBluetoothInternalFlag;
  if ((_DWORD)coreBluetoothInternalFlag)
    xpc_dictionary_set_uint64(v4, "intF", coreBluetoothInternalFlag);
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100007924;
  handler[3] = &unk_1001E2210;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v7, v5, (dispatch_queue_t)dispatchQueue, handler);

}

- (void)_activateXPCCompleted:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t clientID;
  uint64_t v7;
  void *v8;
  xpc_object_t array;
  void (**v10)(id, void *);
  void (**v11)(id, void *);
  id activateCompletion;
  void (**v13)(id, _QWORD);
  id v14;
  xpc_object_t xdict;
  _QWORD applier[5];

  xdict = a3;
  v4 = CUXPCDecodeNSErrorIfNeeded(xdict);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    if (dword_10020F700 <= 90
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
    {
      clientID = self->_clientID;
      v7 = CUPrintNSError(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      LogPrintF(&dword_10020F700, "-[AAController _activateXPCCompleted:]", 90, "### Activate failed: CID 0x%X, %@", clientID, v8, xdict);

    }
    v11 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v11)
      v11[2](v11, v5);
  }
  else
  {
    array = xpc_dictionary_get_array(xdict, "aaDD");
    v10 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(array);
    v11 = v10;
    if (v10)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100007AFC;
      applier[3] = &unk_1001E2238;
      applier[4] = self;
      xpc_array_apply(v10, applier);
    }
    if (dword_10020F700 <= 30
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 30)))
    {
      LogPrintF(&dword_10020F700, "-[AAController _activateXPCCompleted:]", 30, "Activated: CID 0x%X", self->_clientID);
    }
    v13 = (void (**)(id, _QWORD))objc_retainBlock(self->_activateCompletion);
    v14 = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v13)
      v13[2](v13, 0);

  }
}

- (id)_ensureXPCStarted
{
  AAController *v2;
  OS_xpc_object *v3;
  xpc_connection_t mach_service;
  _QWORD v6[4];
  OS_xpc_object *v7;
  AAController *v8;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v2->_xpcCnx)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100007C48;
    v6[3] = &unk_1001E2260;
    v3 = mach_service;
    v7 = v3;
    v8 = v2;
    xpc_connection_set_event_handler(v3, v6);
    xpc_connection_activate(v3);

  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_interrupted
{
  id v3;
  void *v4;

  if (!self->_invalidateCalled)
  {
    if (dword_10020F700 <= 30
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 30)))
    {
      LogPrintF(&dword_10020F700, "-[AAController _interrupted]", 30, "### Interrupted");
    }
    v3 = objc_retainBlock(self->_interruptionHandler);
    v4 = v3;
    if (v3)
      (*((void (**)(id))v3 + 2))(v3);

    if (self->_activateCalled)
      -[AAController _activateXPC:](self, "_activateXPC:", 1);
  }
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007D6C;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidated
{
  AAController *v3;
  OS_xpc_object *xpcCnx;
  id conversationDetectMessageHandler;
  id deviceInfoChangeHandler;
  id multimodalContextMessageHandler;
  id pmeConfigMessageHandler;
  id interruptionHandler;
  id invalidationHandler;
  void *v11;
  int v12;
  id v13;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      conversationDetectMessageHandler = v3->_conversationDetectMessageHandler;
      v3->_conversationDetectMessageHandler = 0;

      deviceInfoChangeHandler = v3->_deviceInfoChangeHandler;
      v3->_deviceInfoChangeHandler = 0;

      multimodalContextMessageHandler = v3->_multimodalContextMessageHandler;
      v3->_multimodalContextMessageHandler = 0;

      pmeConfigMessageHandler = v3->_pmeConfigMessageHandler;
      v3->_pmeConfigMessageHandler = 0;

      interruptionHandler = v3->_interruptionHandler;
      v3->_interruptionHandler = 0;

      v13 = objc_retainBlock(v3->_invalidationHandler);
      invalidationHandler = v3->_invalidationHandler;
      v3->_invalidationHandler = 0;

      v11 = v13;
      if (v13)
      {
        (*((void (**)(id))v13 + 2))(v13);
        v11 = v13;
      }
      self->_invalidateDone = 1;
      if (dword_10020F700 <= 30)
      {
        if (dword_10020F700 != -1 || (v12 = _LogCategory_Initialize(&dword_10020F700, 30), v11 = v13, v12))
        {
          LogPrintF(&dword_10020F700, "-[AAController _invalidated]", 30, "Invalidated");
          v11 = v13;
        }
      }

    }
  }
}

- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008074;
  v15[3] = &unk_1001E2288;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);

}

- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000081C4;
  v15[3] = &unk_1001E2288;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);

}

- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008314;
  v15[3] = &unk_1001E2288;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);

}

- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  AAController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008464;
  v15[3] = &unk_1001E2288;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);

}

- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AAController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008590;
  block[3] = &unk_1001E22B0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6
{
  unsigned int v8;
  id v10;
  id v11;
  void (**v12)(id, id);
  uint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  xpc_object_t v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  id v25;
  size_t v26;
  _xpc_connection_s *v27;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *bytes;
  _QWORD handler[4];
  void (**v36)(id, id);

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  if (self->_invalidateCalled)
  {
    v13 = NSErrorF(NSOSStatusErrorDomain, 4294896148, "Request after invalidate");
    v14 = (id)objc_claimAutoreleasedReturnValue(v13);
    if (dword_10020F700 > 90 || dword_10020F700 == -1 && !_LogCategory_Initialize(&dword_10020F700, 90))
      goto LABEL_21;
    if (v8 > 6)
      v15 = "?";
    else
      v15 = (&off_1001E2320)[(char)v8];
    v31 = CUPrintNSError(v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    LogPrintF(&dword_10020F700, "-[AAController _sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:]", 90, "### sendAccessoryEvent type %s, destination %@, failed with error: %@", v15, v11, v32);
LABEL_20:

LABEL_21:
    v12[2](v12, v14);
    goto LABEL_22;
  }
  if (!v11)
  {
    v29 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "Invalid parameter");
    v14 = (id)objc_claimAutoreleasedReturnValue(v29);
    if (dword_10020F700 > 90 || dword_10020F700 == -1 && !_LogCategory_Initialize(&dword_10020F700, 90))
      goto LABEL_21;
    if (v8 > 6)
      v30 = "?";
    else
      v30 = (&off_1001E2320)[(char)v8];
    v33 = CUPrintNSError(v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
    LogPrintF(&dword_10020F700, "-[AAController _sendAccessoryEventMessage:eventType:destinationIdentifier:completionHandler:]", 90, "### sendAccessoryEvent type %s failed with error: %@", v30, v32);
    goto LABEL_20;
  }
  v14 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v14, "setIdentifier:", v11);
  v16 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v14, "dictionaryRepresentation"));
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v17, "mTyp", "SnAE");
  xpc_dictionary_set_uint64(v17, "acET", v8);
  if (v10)
  {
    v18 = objc_retainAutorelease(v10);
    v19 = v17;
    v20 = v18;
    v21 = (const char *)objc_msgSend(v20, "bytes");
    v22 = "";
    if (v21)
      v22 = v21;
    bytes = v22;
    v23 = v14;
    v24 = v16;
    v25 = objc_msgSend(v20, "length");

    v26 = (size_t)v25;
    v16 = v24;
    v14 = v23;
    xpc_dictionary_set_data(v19, "acMd", bytes, v26);

  }
  xpc_dictionary_set_value(v17, "dstD", v16);
  v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008990;
  handler[3] = &unk_1001E22D8;
  v36 = v12;
  xpc_connection_send_message_with_reply(v27, v17, (dispatch_queue_t)dispatchQueue, handler);

LABEL_22:
}

- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  xpc_object_t v16;
  _xpc_connection_s *v17;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v19;
  uint64_t v20;
  _QWORD handler[4];
  void (**v22)(id, id);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if (self->_invalidateCalled)
  {
    v11 = NSErrorF(NSOSStatusErrorDomain, 4294896148, "Request after invalidate");
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);
    if (dword_10020F700 > 90 || dword_10020F700 == -1 && !_LogCategory_Initialize(&dword_10020F700, 90))
      goto LABEL_12;
    v13 = CUPrintNSError(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    LogPrintF(&dword_10020F700, "-[AAController _sendDeviceConfig:destinationIdentifier:completionHandler:]", 90, "### sendDeviceConfig destination %@, failed with error: %@", v9, v14);
LABEL_5:

LABEL_12:
    v10[2](v10, v12);
    goto LABEL_13;
  }
  if (!v9)
  {
    v19 = NSErrorF(NSOSStatusErrorDomain, 4294960591, "Invalid parameter");
    v12 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (dword_10020F700 > 90 || dword_10020F700 == -1 && !_LogCategory_Initialize(&dword_10020F700, 90))
      goto LABEL_12;
    v20 = CUPrintNSError(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
    LogPrintF(&dword_10020F700, "-[AAController _sendDeviceConfig:destinationIdentifier:completionHandler:]", 90, "### sendDeviceConfig failed with error: %@", v14);
    goto LABEL_5;
  }
  v12 = objc_alloc_init((Class)CBDevice);
  objc_msgSend(v12, "setIdentifier:", v9);
  v15 = (void *)_CFXPCCreateXPCObjectFromCFObject(objc_msgSend(v12, "dictionaryRepresentation"));
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "mTyp", "SnAC");
  xpc_dictionary_set_value(v16, "acMd", v8);
  xpc_dictionary_set_value(v16, "dstD", v15);
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[AAController _ensureXPCStarted](self, "_ensureXPCStarted"));
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100008C60;
  handler[3] = &unk_1001E22D8;
  v22 = v10;
  xpc_connection_send_message_with_reply(v17, v16, (dispatch_queue_t)dispatchQueue, handler);

LABEL_13:
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  AAController *v19;
  OS_xpc_object *xpcCnx;
  id v21;

  v4 = a3;
  v21 = v4;
  if (dword_10020F700 <= 10)
  {
    if (dword_10020F700 != -1 || (v7 = _LogCategory_Initialize(&dword_10020F700, 10), v4 = v21, v7))
    {
      v5 = CUPrintXPC(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF(&dword_10020F700, "-[AAController xpcReceivedMessage:]", 10, "XPC event: %@", v6);

      v4 = v21;
    }
  }
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[AAController _xpcReceivedMessage:](self, "_xpcReceivedMessage:", v21);
  }
  else if (v21 == &_xpc_error_connection_interrupted)
  {
    -[AAController _interrupted](self, "_interrupted");
  }
  else if (v21 == &_xpc_error_connection_invalid)
  {
    if (!self->_invalidateCalled
      && dword_10020F700 <= 90
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
    {
      v12 = (const char *)xpc_connection_copy_invalidation_reason(self->_xpcCnx);
      LogPrintF(&dword_10020F700, "-[AAController xpcReceivedMessage:]", 90, "### Invalidated unexpectedly for reason %s", v12);
    }
    v19 = self;
    objc_sync_enter(v19);
    xpcCnx = v19->_xpcCnx;
    v19->_xpcCnx = 0;

    objc_sync_exit(v19);
    -[AAController _invalidated](v19, "_invalidated");
  }
  else
  {
    v8 = CUXPCDecodeNSErrorIfNeeded(v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v13 = NSErrorF(NSOSStatusErrorDomain, 4294960596, "XPC event error");
      v11 = (id)objc_claimAutoreleasedReturnValue(v13);
    }
    v14 = v11;

    if (dword_10020F700 <= 90
      && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
    {
      v15 = CUPrintNSError(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = CUPrintXPC(v21);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      LogPrintF(&dword_10020F700, "-[AAController xpcReceivedMessage:]", 90, "### XPC error: %@, %@", v16, v18);

    }
  }

}

- (void)_xpcReceivedMessage:(id)a3
{
  const char *string;
  const char *v5;
  id v6;

  v6 = a3;
  string = xpc_dictionary_get_string(v6, "mTyp");
  if (string)
  {
    v5 = string;
    if (!strcmp(string, "AcRc"))
    {
      -[AAController _xpcReceivedAccessoryEvent:](self, "_xpcReceivedAccessoryEvent:", v6);
    }
    else if (!strcmp(v5, "AcIC"))
    {
      -[AAController _xpcReceivedAudioAccessoryDeviceInfoChange:](self, "_xpcReceivedAudioAccessoryDeviceInfoChange:", v6);
    }
    else if (dword_10020F700 <= 10
           && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 10)))
    {
      LogPrintF(&dword_10020F700, "-[AAController _xpcReceivedMessage:]", 10, "### XPC unknown message type: '%s'");
    }
  }
  else if (dword_10020F700 <= 90
         && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
  {
    LogPrintF(&dword_10020F700, "-[AAController _xpcReceivedMessage:]", 90, "### XPC no message type");
  }

}

- (void)_xpcReceivedAccessoryEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  int v10;
  unsigned __int8 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100009430;
  v36 = sub_100009440;
  v37 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100009448;
  v31[3] = &unk_1001E2300;
  v31[4] = &v32;
  v5 = objc_retainBlock(v31);
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = (id)v33[5];
    v33[5] = (uint64_t)CFSTR("non-dict message");
    goto LABEL_26;
  }
  v30 = 0;
  v6 = objc_opt_class(CBDevice);
  v29 = 0;
  CUXPCDecodeObject(v4, "srcD", v6, &v30, &v29);
  v7 = v29;
  v8 = v7;
  if (!v30)
  {
    v13 = CUPrintNSError(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = NSPrintF_safe("bad source device: %@", v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v33[5];
    v33[5] = v16;

    goto LABEL_25;
  }
  v27 = v7;
  v28 = 0;
  CUXPCDecodeNSData(v4, "acMd", &v28, &v27);
  v9 = v27;

  if (v28)
  {
    v26 = v9;
    v38 = 0;
    v10 = CUXPCDecodeUInt64RangedEx(v4, "acET", 0, 255, &v38, &v26);
    if (v10 == 6)
      v11 = v38;
    else
      v11 = 0;
    v8 = v26;

    if (v10 != 5)
    {
      switch(v11)
      {
        case 1u:
        case 3u:
          if (dword_10020F700 <= 30
            && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 30)))
          {
            if ((v11 - 1) > 2u)
              v12 = "?";
            else
              v12 = (&off_1001E2358)[(char)(v11 - 1)];
            LogPrintF(&dword_10020F700, "-[AAController _xpcReceivedAccessoryEvent:]", 30, "%s event unhandled", v12);
          }
          break;
        case 2u:
          -[AAController _conversationDetectMessageReceived:fromDevice:](self, "_conversationDetectMessageReceived:fromDevice:", v28, v30);
          break;
        case 4u:
          -[AAController _multimodalContextMessageReceived:fromDevice:](self, "_multimodalContextMessageReceived:fromDevice:", v28, v30);
          break;
        case 5u:
          -[AAController _pmeConfigDataReceived:fromDevice:](self, "_pmeConfigDataReceived:fromDevice:", v28, v30);
          break;
        default:
          if (dword_10020F700 <= 90
            && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 90)))
          {
            LogPrintF(&dword_10020F700, "-[AAController _xpcReceivedAccessoryEvent:]", 90, "### unknown event type: %d", v11);
          }
          break;
      }
      goto LABEL_24;
    }
    v23 = CUPrintNSError(v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v24 = NSPrintF_safe("bad accessory event type: %@", v19);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v22 = (void *)v33[5];
    v33[5] = v25;
  }
  else
  {
    v18 = CUPrintNSError(v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSPrintF_safe("bad message data: %@", v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v33[5];
    v33[5] = v21;
    v8 = v9;
  }

LABEL_24:
LABEL_25:

LABEL_26:
  ((void (*)(_QWORD *))v5[2])(v5);

  _Block_object_dispose(&v32, 8);
}

- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  id v4;
  _QWORD *v5;
  xpc_object_t value;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100009430;
  v15 = sub_100009440;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009678;
  v10[3] = &unk_1001E2300;
  v10[4] = &v11;
  v5 = objc_retainBlock(v10);
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    value = xpc_dictionary_get_value(v4, "aaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v8 = objc_retainBlock(self->_deviceInfoChangeHandler);
      v9 = v8;
      if (v8)
        (*((void (**)(id, void *))v8 + 2))(v8, v7);
    }
    else
    {
      v9 = (void *)v12[5];
      v12[5] = (uint64_t)CFSTR("missing key for AADeviceInfo");
    }

  }
  else
  {
    v7 = (void *)v12[5];
    v12[5] = (uint64_t)CFSTR("non-dict message");
  }

  ((void (*)(_QWORD *))v5[2])(v5);
  _Block_object_dispose(&v11, 8);

}

- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, void *, id);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100009430;
  v23 = sub_100009440;
  v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000990C;
  v18[3] = &unk_1001E2300;
  v18[4] = &v19;
  v8 = objc_retainBlock(v18);
  if (dword_10020F700 <= 10 && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 10)))
  {
    v9 = CUPrintNSDataHex(v6, 50, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_10020F700, "-[AAController _conversationDetectMessageReceived:fromDevice:]", 10, "Conversation detect message received: source %@, data <%@>", v7, v10);

  }
  v11 = (void (**)(id, void *, id))objc_retainBlock(self->_conversationDetectMessageHandler);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    if (v12)
    {
      v11[2](v11, v12, v6);
    }
    else
    {
      v13 = CUPrintNSError(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSPrintF_safe("bad source identifier: %@", v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)v20[5];
      v20[5] = v16;

    }
  }

  ((void (*)(_QWORD *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);

}

- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, void *, id);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100009430;
  v23 = sub_100009440;
  v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100009BA0;
  v18[3] = &unk_1001E2300;
  v18[4] = &v19;
  v8 = objc_retainBlock(v18);
  if (dword_10020F700 <= 10 && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 10)))
  {
    v9 = CUPrintNSDataHex(v6, 50, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_10020F700, "-[AAController _multimodalContextMessageReceived:fromDevice:]", 10, "Multimodal context message received: source %@, data <%@>", v7, v10);

  }
  v11 = (void (**)(id, void *, id))objc_retainBlock(self->_multimodalContextMessageHandler);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    if (v12)
    {
      v11[2](v11, v12, v6);
    }
    else
    {
      v13 = CUPrintNSError(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSPrintF_safe("bad source identifier: %@", v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)v20[5];
      v20[5] = v16;

    }
  }

  ((void (*)(_QWORD *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);

}

- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(id, void *, id);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100009430;
  v23 = sub_100009440;
  v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100009E34;
  v18[3] = &unk_1001E2300;
  v18[4] = &v19;
  v8 = objc_retainBlock(v18);
  if (dword_10020F700 <= 10 && (dword_10020F700 != -1 || _LogCategory_Initialize(&dword_10020F700, 10)))
  {
    v9 = CUPrintNSDataHex(v6, 50, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF(&dword_10020F700, "-[AAController _pmeConfigDataReceived:fromDevice:]", 10, "PME config received: source %@, data <%@>", v7, v10);

  }
  v11 = (void (**)(id, void *, id))objc_retainBlock(self->_pmeConfigMessageHandler);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    if (v12)
    {
      v11[2](v11, v12, v6);
    }
    else
    {
      v13 = CUPrintNSError(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSPrintF_safe("bad source identifier: %@", v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)v20[5];
      v20[5] = v16;

    }
  }

  ((void (*)(_QWORD *))v8[2])(v8);
  _Block_object_dispose(&v19, 8);

}

- (id)conversationDetectMessageHandler
{
  return self->_conversationDetectMessageHandler;
}

- (void)setConversationDetectMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceInfoChangeHandler
{
  return self->_deviceInfoChangeHandler;
}

- (void)setDeviceInfoChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)multimodalContextMessageHandler
{
  return self->_multimodalContextMessageHandler;
}

- (void)setMultimodalContextMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)pmeConfigMessageHandler
{
  return self->_pmeConfigMessageHandler;
}

- (void)setPmeConfigMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)coreBluetoothInternalFlag
{
  return self->_coreBluetoothInternalFlag;
}

- (void)setCoreBluetoothInternalFlag:(unsigned int)a3
{
  self->_coreBluetoothInternalFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pmeConfigMessageHandler, 0);
  objc_storeStrong(&self->_multimodalContextMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceInfoChangeHandler, 0);
  objc_storeStrong(&self->_conversationDetectMessageHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
