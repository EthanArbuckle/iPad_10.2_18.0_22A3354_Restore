@implementation STSHelperLibrary

- (id)startISO18013WithConnectionHandoverConfiguration:(unint64_t)a3 type:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v13[7];
  os_activity_scope_state_s state;

  v8 = a5;
  sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:]", 69, self, CFSTR("configuration = 0x%x"), v9, v10, a3);
  v11 = _os_activity_create(&dword_20A021000, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  objc_storeWeak((id *)&self->_delegate, v8);
  self->_type = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20A0266C0;
  v13[3] = &unk_24C2B3158;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  sub_20A026604((uint64_t)v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)connectToNotificationListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_20A021000, "connectToNotificationListener:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_20A026928;
  v9[3] = &unk_24C2B3180;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  sub_20A026604((uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)processUnifiedAccessStepupAPDU:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  STSHelperLibrary *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id *v18;
  _QWORD v19[5];
  id v20;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_20A021000, "processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = self;
  objc_sync_enter(v12);
  objc_msgSend_unifiedAccessHandler(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_20A026C00;
    v19[3] = &unk_24C2B3310;
    v19[4] = v12;
    v20 = v10;
    dispatch_async(v9, v19);

  }
  objc_sync_exit(v12);

  objc_msgSend_unifiedAccessHandler(v12, v16, v17);
  v18 = (id *)objc_claimAutoreleasedReturnValue();
  sub_20A02D9E8(v18, v8, v9, v10);

}

- (void)processConnectionHandoverRequest:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  os_activity_scope_state_s state;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = _os_activity_create(&dword_20A021000, "processConnectionHandoverRequest:callbackQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20A026EC0;
  v24[3] = &unk_24C2B31D0;
  v25 = v8;
  v26 = v9;
  v13 = v9;
  v14 = v8;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = sub_20A026FA8;
  v22[3] = &unk_24C2B31F8;
  v22[4] = self;
  v15 = (id)MEMORY[0x20BD1EA88](v24);
  v23 = v15;
  objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_20A027014;
  v20[3] = &unk_24C2B3220;
  v21 = v15;
  v18 = v15;
  objc_msgSend_processAlternativeCarrierRequest_callback_(v17, v19, (uint64_t)v10, v20);

}

- (void)processConnectionHandoverRequestData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  os_activity_scope_state_s state;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = _os_activity_create(&dword_20A021000, "processConnectionHandoverRequestData:callbackQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20A0271AC;
  v24[3] = &unk_24C2B3270;
  v25 = v8;
  v26 = v9;
  v13 = v9;
  v14 = v8;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = sub_20A0272AC;
  v22[3] = &unk_24C2B31F8;
  v22[4] = self;
  v15 = (id)MEMORY[0x20BD1EA88](v24);
  v23 = v15;
  objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_20A02731C;
  v20[3] = &unk_24C2B3298;
  v21 = v15;
  v18 = v15;
  objc_msgSend_processHandoverRequest_callback_(v17, v19, (uint64_t)v10, v20);

}

- (void)generateConnectionHandoverRequestWithQueue:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20A021000, "generateConnectionHandoverRequestWithQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20A0274A0;
  v21[3] = &unk_24C2B32C0;
  v22 = v6;
  v23 = v7;
  v10 = v7;
  v11 = v6;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = sub_20A027588;
  v19[3] = &unk_24C2B31F8;
  v19[4] = self;
  v12 = (id)MEMORY[0x20BD1EA88](v21);
  v20 = v12;
  objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = sub_20A0275F4;
  v17[3] = &unk_24C2B32E8;
  v18 = v12;
  v15 = v12;
  objc_msgSend_generateHandoverRequestWithCallback_(v14, v16, (uint64_t)v17);

}

- (void)generateQRCodeCHRequestAndStartACWithQueue:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20A021000, "generateQRCodeCHRequestAndStartACWithQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_20A027778;
  v21[3] = &unk_24C2B32C0;
  v22 = v6;
  v23 = v7;
  v10 = v7;
  v11 = v6;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = sub_20A027860;
  v19[3] = &unk_24C2B31F8;
  v19[4] = self;
  v12 = (id)MEMORY[0x20BD1EA88](v21);
  v20 = v12;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = sub_20A0278CC;
  v17[3] = &unk_24C2B32E8;
  v18 = v12;
  v15 = v12;
  objc_msgSend_generateQRCodeHandoverRequestWithCallback_(v14, v16, (uint64_t)v17);

}

- (void)connectRemoteWithConnectionHandoverSelect:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  os_activity_scope_state_s state;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = _os_activity_create(&dword_20A021000, "connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20A027A64;
  v24[3] = &unk_24C2B31F8;
  v25 = v8;
  v26 = v9;
  v13 = v9;
  v14 = v8;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = sub_20A027B24;
  v22[3] = &unk_24C2B31F8;
  v22[4] = self;
  v15 = (id)MEMORY[0x20BD1EA88](v24);
  v23 = v15;
  objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_20A027B8C;
  v20[3] = &unk_24C2B3338;
  v21 = v15;
  v18 = v15;
  objc_msgSend_processHandoverResponse_callback_(v17, v19, (uint64_t)v10, v20);

}

- (void)connectRemoteWithQRCodeHandoverData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  os_activity_scope_state_s state;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = _os_activity_create(&dword_20A021000, "connectRemoteWithQRCodeHandoverData:callbackQueue:responseHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_20A027D24;
  v24[3] = &unk_24C2B31F8;
  v25 = v8;
  v26 = v9;
  v13 = v9;
  v14 = v8;
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = sub_20A027DE4;
  v22[3] = &unk_24C2B31F8;
  v22[4] = self;
  v15 = (id)MEMORY[0x20BD1EA88](v24);
  v23 = v15;
  objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = sub_20A027E4C;
  v20[3] = &unk_24C2B3338;
  v21 = v15;
  v18 = v15;
  objc_msgSend_processQRCodeHandoverRequestMessage_callback_(v17, v19, (uint64_t)v10, v20);

}

- (id)startSEProxyListener:(id)a3 parameters:(id)a4 workQueue:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  STSRemoteTransceiverProxyListener *v20;
  id *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[5];
  os_activity_scope_state_s state;

  v7 = a5;
  v8 = a3;
  v9 = _os_activity_create(&dword_20A021000, "startSEProxyListener:parameters:workQueue:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  objc_msgSend_seProxyListener(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startSEProxyListener:parameters:workQueue:]", 326, self, CFSTR("Replacing existig STSRemoteTransceiverProxyListener; invalidate existing copy"),
      v13,
      v14,
      v29);
    objc_msgSend_seProxyListener(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_20A02C2F0((uint64_t)v17, v18, v19);

  }
  v20 = [STSRemoteTransceiverProxyListener alloc];
  if (v20)
    v21 = sub_20A02C1A8((id *)&v20->super.isa, v8, 0, v7);
  else
    v21 = 0;

  objc_msgSend_setSeProxyListener_(self, v22, (uint64_t)v21);
  objc_msgSend_seProxyListener(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20A02C290((uint64_t)v25, v26, v27);

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_20A027FC0;
  v30[3] = &unk_24C2B3360;
  v30[4] = self;
  sub_20A026604((uint64_t)v30);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)stopSEProxyListener
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_seProxyListener(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20A02C2F0((uint64_t)v4, v5, v6);

  objc_msgSend_setSeProxyListener_(self, v7, 0);
}

- (id)startReaderSEProxyListener:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void **v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  os_activity_scope_state_s v33;

  v6 = a4;
  v7 = a3;
  v8 = _os_activity_create(&dword_20A021000, "startReaderSEProxyListener:parameters:workQueue:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v33.opaque[0] = 0;
  v33.opaque[1] = 0;
  os_activity_scope_enter(v8, &v33);
  os_activity_scope_leave(&v33);

  objc_msgSend_seProxyListener(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHelperLibrary startReaderSEProxyListener:workQueue:]", 359, self, CFSTR("Replacing existig STSRemoteTransceiverProxyListener; invalidate existing copy"),
      v12,
      v13,
      v33.opaque[0]);
    objc_msgSend_seProxyListener(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_20A02C2F0((uint64_t)v16, v17, v18);

  }
  v19 = sub_20A02C1A8((id *)[STSRemoteTransceiverProxyListener alloc], v7, 1, v6);

  objc_msgSend_setSeProxyListener_(self, v20, (uint64_t)v19);
  objc_msgSend_seProxyListener(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20A02C290((uint64_t)v23, v24, v25);

  objc_msgSend_seProxyListener(self, v26, v27);
  v28 = (void **)objc_claimAutoreleasedReturnValue();
  sub_20A02C324(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (void)stopReaderSEProxyListener
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_seProxyListener(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_20A02C2F0((uint64_t)v4, v5, v6);

  objc_msgSend_setSeProxyListener_(self, v7, 0);
}

- (id)signalUnifiedAccessStepUpWithEventDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  STSHelperLibrary *v15;
  id *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  os_activity_scope_state_s v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = _os_activity_create(&dword_20A021000, "signalUnifiedAccessStepUpWithEventDictionary:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v32.opaque[0] = 0;
  v32.opaque[1] = 0;
  os_activity_scope_enter(v5, &v32);
  os_activity_scope_leave(&v32);

  if (objc_msgSend_type(self, v6, v7) == 2)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("endpointIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("sharedSecret"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("appletIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v15 = self;
          objc_sync_enter(v15);
          v16 = sub_20A02C8E4((id *)[STSUnifiedAccessHandler alloc], v15, v14, v12, v10);
          objc_msgSend_setUnifiedAccessHandler_(v15, v17, (uint64_t)v16);

          objc_sync_exit(v15);
          v18 = 0;
        }
        else
        {
          v28 = (void *)MEMORY[0x24BDD1540];
          v33[0] = *MEMORY[0x24BDD0FC8];
          v32.opaque[0] = (uint64_t)off_2545C7C50;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)&v32, v33, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v25 = (void *)MEMORY[0x24BDD1540];
        v33[0] = *MEMORY[0x24BDD0FC8];
        v32.opaque[0] = (uint64_t)off_2545C7C50;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&v32, v33, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v33[0] = *MEMORY[0x24BDD0FC8];
      v32.opaque[0] = (uint64_t)off_2545C7C50;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)&v32, v33, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v33[0] = *MEMORY[0x24BDD0FC8];
    v32.opaque[0] = (uint64_t)off_2545C7C38;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)&v32, v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 2, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (void)invalidate
{
  NSObject *v3;
  STSHelperLibrary *v4;
  const char *v5;
  id v6;
  STSHelperLibrary *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_20A021000, "invalidate:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_xpc)
  {
    objc_sync_exit(v4);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_20A0287D0;
    v14[3] = &unk_24C2B3360;
    v14[4] = v4;
    v6 = sub_20A026604((uint64_t)v14);
    v7 = v4;
    objc_sync_enter(v7);
    objc_msgSend_setUnifiedAccessHandler_(v7, v8, 0);
    objc_msgSend_xpc(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invalidate(v11, v12, v13);

    objc_sync_exit(v7);
  }
  else
  {
    objc_msgSend_setUnifiedAccessHandler_(v4, v5, 0);
    objc_sync_exit(v4);

  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  STSHelperLibrary *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((objc_msgSend_setupConnectWithXPCService(v5, v6, v7) & 1) != 0)
  {
    objc_msgSend_xpc(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = off_2545C7C48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 4, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v16);
    v12 = 0;
  }
  objc_sync_exit(v5);

  return v12;
}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  STSHelperLibrary *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((objc_msgSend_setupConnectWithXPCService(v5, v6, v7) & 1) != 0)
  {
    objc_msgSend_xpc(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = off_2545C7C48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 4, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v16);
    v12 = 0;
  }
  objc_sync_exit(v5);

  return v12;
}

- (BOOL)setupConnectWithXPCService
{
  NSXPCConnection *xpc;
  id v4;
  const char *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  xpc = self->_xpc;
  if (!xpc)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (NSXPCConnection *)objc_msgSend_initWithServiceName_(v4, v5, (uint64_t)CFSTR("com.apple.STSXPCHelper"));
    v7 = self->_xpc;
    self->_xpc = v6;

    objc_msgSend__stsHelperInterface(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRemoteObjectInterface_(self->_xpc, v11, (uint64_t)v10);

    objc_msgSend__stsHelperCallbackInterface(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExportedInterface_(self->_xpc, v15, (uint64_t)v14);

    objc_msgSend_setExportedObject_(self->_xpc, v16, (uint64_t)self);
    objc_initWeak(&location, self);
    v17 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_20A028DD0;
    v25[3] = &unk_24C2B33A8;
    objc_copyWeak(&v26, &location);
    objc_msgSend_setInvalidationHandler_(self->_xpc, v18, (uint64_t)v25);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = sub_20A028E60;
    v23[3] = &unk_24C2B33A8;
    objc_copyWeak(&v24, &location);
    objc_msgSend_setInterruptionHandler_(self->_xpc, v19, (uint64_t)v23);
    objc_msgSend_resume(self->_xpc, v20, v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    xpc = self->_xpc;
  }
  return xpc != 0;
}

- (id)_stsHelperInterface
{
  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], a2, (uint64_t)&unk_2545CAD20);
}

- (id)_stsHelperCallbackInterface
{
  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], a2, (uint64_t)&unk_2545C9230);
}

- (void)didInvalidateXPC:(BOOL)a3 connection:(id)a4
{
  _BOOL4 v4;
  STSHelperLibrary *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  NSXPCConnection *xpc;
  id v14;

  v4 = a3;
  v14 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary didInvalidateXPC:connection:]", 517, v6, CFSTR("XPC connection invalidated.  connection=%@"), v7, v8, (uint64_t)v14);
    objc_msgSend_stopSEProxyListener(v6, v9, v10);
    objc_msgSend_setInvalidationHandler_(v6->_xpc, v11, 0);
    objc_msgSend_setInterruptionHandler_(v6->_xpc, v12, 0);
    xpc = v6->_xpc;
    v6->_xpc = 0;

  }
  else
  {
    sub_20A02B138(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHelperLibrary didInvalidateXPC:connection:]", 525, v6, CFSTR("XPC connection interrupted.  connection=%@"), v7, v8, (uint64_t)v14);
  }
  objc_sync_exit(v6);

}

- (STSHelperLibraryDelegateProtocol)delegate
{
  return (STSHelperLibraryDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)handoverConfig
{
  return self->_handoverConfig;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSXPCConnection)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
  objc_storeStrong((id *)&self->_xpc, a3);
}

- (STSRemoteTransceiverProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
  objc_storeStrong((id *)&self->_seProxyListener, a3);
}

- (STSRemoteTransceiverProxyListener)nfcReaderListener
{
  return self->_nfcReaderListener;
}

- (void)setNfcReaderListener:(id)a3
{
  objc_storeStrong((id *)&self->_nfcReaderListener, a3);
}

- (STSUnifiedAccessHandler)unifiedAccessHandler
{
  return self->_unifiedAccessHandler;
}

- (void)setUnifiedAccessHandler:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedAccessHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedAccessHandler, 0);
  objc_storeStrong((id *)&self->_nfcReaderListener, 0);
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)startWifiPublisherWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_20A021000, "startWifiPublisherWithServiceName:datapathPMK:dataPathPMKID:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20A0291F4;
  v17[3] = &unk_24C2B33D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  sub_20A026604((uint64_t)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)startWifiSubscriberWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_20A021000, "startWifiSubscriberWithServiceName:datapathPMK:dataPathPMKID:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20A029444;
  v17[3] = &unk_24C2B33D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  sub_20A026604((uint64_t)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)startBTReaderWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5
{
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  os_activity_scope_state_s state;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = _os_activity_create(&dword_20A021000, "startBTReaderWithServiceUUID:peripheralAddrss:centralRole:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if (v8 | v9)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_20A029724;
    v17[3] = &unk_24C2B33F8;
    v17[4] = self;
    v20 = a5;
    v18 = (id)v8;
    v19 = (id)v9;
    sub_20A026604((uint64_t)v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v22[0] = *MEMORY[0x24BDD0FC8];
    state.opaque[0] = (uint64_t)off_2545C7C50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&state, v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)startBTDeviceWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5
{
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  os_activity_scope_state_s state;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = _os_activity_create(&dword_20A021000, "startBTDeviceWithServiceUUID:peripheralAddrss:centralRole:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if (v8 | v9)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_20A029A08;
    v17[3] = &unk_24C2B33F8;
    v17[4] = self;
    v20 = a5;
    v18 = (id)v8;
    v19 = (id)v9;
    sub_20A026604((uint64_t)v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v22[0] = *MEMORY[0x24BDD0FC8];
    state.opaque[0] = (uint64_t)off_2545C7C50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)&state, v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 5, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

@end
