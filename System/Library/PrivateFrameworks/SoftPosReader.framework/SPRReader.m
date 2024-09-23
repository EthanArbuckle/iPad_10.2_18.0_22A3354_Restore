@implementation SPRReader

- (SPRReader)initWithConnector:(id)a3
{
  SPRReader *v3;
  uint64_t v4;
  OS_dispatch_queue *relayQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPRReader;
  v3 = -[SPRObject initWithConnector:](&v7, sel_initWithConnector_, a3);
  if (v3)
  {
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    relayQueue = v3->_relayQueue;
    v3->_relayQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (BOOL)validateWithReadParameters:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_2159750A0;
  v29 = sub_2159750B0;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v24 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_2159750B8;
  v20[3] = &unk_24D3CCCC0;
  v20[4] = &v25;
  objc_msgSend_syncProxyWithErrorHandler_(self, v8, (uint64_t)v20, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_2159750C8;
  v19[3] = &unk_24D3CCD10;
  v19[4] = &v21;
  v19[5] = &v25;
  objc_msgSend_validateWithReadParameters_reply_(v12, v13, (uint64_t)v6, (uint64_t)v19, v14, v15);

  if (a4)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)readCardWithParameter:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  SPRReadRelay *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a4;
  v7 = a3;
  v8 = [SPRReadRelay alloc];
  v12 = (void *)objc_msgSend_initWithBase_queue_(v8, v9, (uint64_t)v6, (uint64_t)self->_relayQueue, v10, v11);
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_215975210;
  v25[3] = &unk_24D3CCEC8;
  v25[4] = self;
  v14 = v6;
  v26 = v14;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v15, (uint64_t)v25, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_2159752B4;
  v23[3] = &unk_24D3CD3A0;
  v23[4] = self;
  v24 = v14;
  v20 = v14;
  objc_msgSend_readCardWithParameter_delegate_reply_(v19, v21, (uint64_t)v7, (uint64_t)v12, (uint64_t)v23, v22);

}

- (void)readCardWithParameter:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_2159754A0;
  v23[3] = &unk_24D3CCE28;
  v23[4] = self;
  v10 = v8;
  v24 = v10;
  v11 = a4;
  v12 = a3;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = sub_21597554C;
  v21[3] = &unk_24D3CD3C8;
  v21[4] = self;
  v22 = v10;
  v18 = v10;
  objc_msgSend_readCardWithParameter_delegate_reply_(v17, v19, (uint64_t)v12, (uint64_t)v11, (uint64_t)v21, v20);

}

- (BOOL)cancelReadAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_2159750A0;
  v26 = sub_2159750B0;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v21 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215975778;
  v17[3] = &unk_24D3CCCC0;
  v17[4] = &v22;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v17, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_215975788;
  v16[3] = &unk_24D3CCD10;
  v16[4] = &v18;
  v16[5] = &v22;
  objc_msgSend_cancelReadWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a3)
  {
    v13 = (void *)v23[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[6];
  _QWORD v22[5];
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

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_2159750A0;
  v33 = sub_2159750B0;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_2159750A0;
  v27 = sub_2159750B0;
  v10 = MEMORY[0x24BDAC760];
  v28 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_215975940;
  v22[3] = &unk_24D3CCCC0;
  v22[4] = &v23;
  objc_msgSend_syncProxyWithErrorHandler_(self, v11, (uint64_t)v22, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = sub_215975950;
  v21[3] = &unk_24D3CD3F0;
  v21[4] = &v29;
  v21[5] = &v23;
  objc_msgSend_generateSecureReaderBlobWithTrxBlob_pinBlob_reply_(v15, v16, (uint64_t)v8, (uint64_t)v9, (uint64_t)v21, v17);

  if (a5)
  {
    v18 = (void *)v24[5];
    if (v18)
      *a5 = objc_retainAutorelease(v18);
  }
  v19 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  id v29;
  _QWORD v31[6];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_2159750A0;
  v43 = sub_2159750B0;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_2159750A0;
  v37 = sub_2159750B0;
  v21 = MEMORY[0x24BDAC760];
  v38 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = sub_215975BBC;
  v32[3] = &unk_24D3CCCC0;
  v32[4] = &v33;
  objc_msgSend_syncProxyWithErrorHandler_(self, v22, (uint64_t)v32, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  v31[1] = 3221225472;
  v31[2] = sub_215975BCC;
  v31[3] = &unk_24D3CD3F0;
  v31[4] = &v39;
  v31[5] = &v33;
  objc_msgSend_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_(v26, v27, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, v19, v20, v31);

  if (a9)
  {
    v28 = (void *)v34[5];
    if (v28)
      *a9 = objc_retainAutorelease(v28);
  }
  v29 = (id)v40[5];
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v29;
}

- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  char v23;
  _QWORD v25[6];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_2159750A0;
  v35 = sub_2159750B0;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v15 = MEMORY[0x24BDAC760];
  v30 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_215975DEC;
  v26[3] = &unk_24D3CCCC0;
  v26[4] = &v31;
  objc_msgSend_syncProxyWithErrorHandler_(self, v16, (uint64_t)v26, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = sub_215975DFC;
  v25[3] = &unk_24D3CCD10;
  v25[4] = &v27;
  v25[5] = &v31;
  objc_msgSend_validateStoreAndForwardResultsToken_sessionId_activationId_trxCount_reply_(v20, v21, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, a6, v25);

  if (a7)
  {
    v22 = (void *)v32[5];
    if (v22)
      *a7 = objc_retainAutorelease(v22);
  }
  v23 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v23;
}

- (id)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 mid:(id)a5 partnerId:(id)a6 virtualTerminalId:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_2159750A0;
  v41 = sub_2159750B0;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_2159750A0;
  v35 = sub_2159750B0;
  v19 = MEMORY[0x24BDAC760];
  v36 = 0;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = sub_215976004;
  v30[3] = &unk_24D3CCCC0;
  v30[4] = &v31;
  objc_msgSend_syncProxyWithErrorHandler_(self, v20, (uint64_t)v30, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v29[1] = 3221225472;
  v29[2] = sub_215976014;
  v29[3] = &unk_24D3CD3F0;
  v29[4] = &v37;
  v29[5] = &v31;
  objc_msgSend_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_(v24, v25, (uint64_t)v14, (uint64_t)v15, (uint64_t)CFSTR("00000000-0000-0000-0000-000000000000"), (uint64_t)v16, v17, v18, v29);

  if (a8)
  {
    v26 = (void *)v32[5];
    if (v26)
      *a8 = objc_retainAutorelease(v26);
  }
  v27 = (id)v38[5];
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v27;
}

- (BOOL)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 trxCount:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  char v20;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_2159750A0;
  v32 = sub_2159750B0;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v12 = MEMORY[0x24BDAC760];
  v27 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_215976228;
  v23[3] = &unk_24D3CCCC0;
  v23[4] = &v28;
  objc_msgSend_syncProxyWithErrorHandler_(self, v13, (uint64_t)v23, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = sub_215976238;
  v22[3] = &unk_24D3CCD10;
  v22[4] = &v24;
  v22[5] = &v28;
  objc_msgSend_validateStoreAndForwardResultsToken_sessionId_activationId_trxCount_reply_(v17, v18, (uint64_t)v10, (uint64_t)v11, (uint64_t)CFSTR("00000000-0000-0000-0000-000000000000"), a5, v22);

  if (a6)
  {
    v19 = (void *)v29[5];
    if (v19)
      *a6 = objc_retainAutorelease(v19);
  }
  v20 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v20;
}

- (id)getCardReaderBlobWithTxnBlob:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  __CFString *v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_2159750A0;
  v22 = sub_2159750B0;
  v5 = MEMORY[0x24BDAC760];
  v23 = &stru_24D3CDE20;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215976384;
  v17[3] = &unk_24D3CCD60;
  v17[4] = self;
  objc_msgSend_syncProxyWithErrorHandler_(self, v6, (uint64_t)v17, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = sub_2159763EC;
  v16[3] = &unk_24D3CD418;
  v16[4] = &v18;
  objc_msgSend_getCardReaderBlobWithTxnBlob_reply_(v10, v11, (uint64_t)v4, (uint64_t)v16, v12, v13);

  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

- (void)cancelReadWithCallback:(id)a3
{
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_2159764B0;
  v15[3] = &unk_24D3CCD60;
  v15[4] = self;
  v5 = a3;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v6, (uint64_t)v15, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = sub_215976518;
  v14[3] = &unk_24D3CCD60;
  v14[4] = self;
  objc_msgSend_cancelReadWithCallback_reply_(v10, v11, (uint64_t)v5, (uint64_t)v14, v12, v13);

}

- (BOOL)cancelReadWithCallback:(id)a3 error:(id *)a4
{
  id v6;
  SPRReadRelay *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_2159750A0;
  v34 = sub_2159750B0;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v7 = [SPRReadRelay alloc];
  v11 = (void *)objc_msgSend_initWithBase_queue_(v7, v8, (uint64_t)v6, (uint64_t)self->_relayQueue, v9, v10);
  v12 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_215976728;
  v25[3] = &unk_24D3CCCC0;
  v25[4] = &v30;
  objc_msgSend_syncProxyWithErrorHandler_(self, v13, (uint64_t)v25, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = sub_215976738;
  v24[3] = &unk_24D3CCD10;
  v24[4] = &v26;
  v24[5] = &v30;
  objc_msgSend_cancelReadWithCallback_reply_(v17, v18, (uint64_t)v11, (uint64_t)v24, v19, v20);

  if (a4)
  {
    v21 = (void *)v31[5];
    if (v21)
      *a4 = objc_retainAutorelease(v21);
  }
  v22 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayQueue, 0);
}

@end
