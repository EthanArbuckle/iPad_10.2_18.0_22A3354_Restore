@implementation SPRConfigurator

- (SPRConfigurator)initWithConnector:(id)a3
{
  SPRConfigurator *v3;
  uint64_t v4;
  OS_dispatch_queue *relayQueue;
  NSString *tokenKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPRConfigurator;
  v3 = -[SPRObject initWithConnector:](&v8, sel_initWithConnector_, a3);
  if (v3)
  {
    dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    relayQueue = v3->_relayQueue;
    v3->_relayQueue = (OS_dispatch_queue *)v4;

    tokenKey = v3->_tokenKey;
    v3->_tokenKey = (NSString *)CFSTR("token");

  }
  return v3;
}

- (id)prepare:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend_prepareAndWarnAndReturnError_(self, a2, (uint64_t)a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend_prepareAndWarnAndReturnError_(self, a2, (uint64_t)a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndWarnAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_prepareAndWarnWithForce_error_(self, a2, 0, (uint64_t)a3, v3, v4);
}

- (id)prepareWithForce:(BOOL)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend_prepareAndWarnWithForce_error_(self, a2, a3, (uint64_t)a4, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)self->_tokenKey, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)prepareAndWarnWithForce:(BOOL)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_prepareAndWarnWithToken_force_enableStoreAndForward_error_, 0, a3, 0, a4);
}

- (id)prepareAndWarnWithToken:(id)a3 force:(BOOL)a4 enableStoreAndForward:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_2159718AC;
  v33 = sub_2159718BC;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_2159718AC;
  v27 = sub_2159718BC;
  v11 = MEMORY[0x24BDAC760];
  v28 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_2159718C4;
  v22[3] = &unk_24D3CCCC0;
  v22[4] = &v29;
  objc_msgSend_syncProxyWithErrorHandler_(self, v12, (uint64_t)v22, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = sub_2159718D4;
  v21[3] = &unk_24D3CCDB0;
  v21[4] = &v23;
  v21[5] = &v29;
  objc_msgSend_prepareAndWarnWithToken_force_enableStoreAndForward_reply_(v16, v17, (uint64_t)v10, v8, v7, (uint64_t)v21);

  if (a6)
  {
    v18 = (void *)v30[5];
    if (v18)
      *a6 = objc_retainAutorelease(v18);
  }
  v19 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (id)installWithToken:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, id, _QWORD, id *))MEMORY[0x24BEDD108])(self, sel_installWithToken_force_error_, a3, 0, a4);
}

- (id)installWithToken:(id)a3 force:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a4;
  v8 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_2159718AC;
  v31 = sub_2159718BC;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_2159718AC;
  v25 = sub_2159718BC;
  v9 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_215971AE0;
  v20[3] = &unk_24D3CCCC0;
  v20[4] = &v27;
  objc_msgSend_syncProxyWithErrorHandler_(self, v10, (uint64_t)v20, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = sub_215971AF0;
  v19[3] = &unk_24D3CCDD8;
  v19[4] = &v21;
  v19[5] = &v27;
  objc_msgSend_installWithToken_force_delegate_reply_(v14, v15, (uint64_t)v8, v6, 0, (uint64_t)v19);

  if (a5)
  {
    v16 = (void *)v28[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (void)installWithToken:(id)a3 force:(BOOL)a4 delegate:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v7 = a4;
  v10 = a6;
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_215971C78;
  v24[3] = &unk_24D3CCE28;
  v24[4] = self;
  v12 = v10;
  v25 = v12;
  v13 = a5;
  v14 = a3;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v15, (uint64_t)v24, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = sub_215971D24;
  v22[3] = &unk_24D3CCE78;
  v22[4] = self;
  v23 = v12;
  v20 = v12;
  objc_msgSend_installWithToken_force_delegate_reply_(v19, v21, (uint64_t)v14, v7, (uint64_t)v13, (uint64_t)v22);

}

- (void)installAsyncWithToken:(id)a3 callback:(id)a4
{
  ((void (*)(SPRConfigurator *, char *, id, _QWORD, id))MEMORY[0x24BEDD108])(self, sel_installAsyncWithToken_force_callback_, a3, 0, a4);
}

- (void)installAsyncWithToken:(id)a3 force:(BOOL)a4 callback:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SPRInstallRelay *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [SPRInstallRelay alloc];
  v14 = (void *)objc_msgSend_initWithBase_queue_(v10, v11, (uint64_t)v8, (uint64_t)self->_relayQueue, v12, v13);
  v15 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_215971F3C;
  v26[3] = &unk_24D3CCEC8;
  v26[4] = self;
  v16 = v8;
  v27 = v16;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v17, (uint64_t)v26, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = sub_215971FE0;
  v24[3] = &unk_24D3CCF18;
  v24[4] = self;
  v25 = v16;
  v22 = v16;
  objc_msgSend_installWithToken_force_delegate_reply_(v21, v23, (uint64_t)v9, v5, (uint64_t)v14, (uint64_t)v24);

}

- (id)statusAndReturnError:(id *)a3
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, const __CFString *, uint64_t, id *))MEMORY[0x24BEDD108])(self, sel_statusWithToken_options_error_, &stru_24D3CDE20, 0x3FFFLL, a3);
}

- (id)statusWithToken:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(SPRConfigurator *, char *, id, uint64_t, id *))MEMORY[0x24BEDD108])(self, sel_statusWithToken_options_error_, a3, 0x3FFFLL, a4);
}

- (id)statusWithToken:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_2159718AC;
  v32 = sub_2159718BC;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_2159718AC;
  v26 = sub_2159718BC;
  v9 = MEMORY[0x24BDAC760];
  v27 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_215972270;
  v21[3] = &unk_24D3CCCC0;
  v21[4] = &v22;
  objc_msgSend_syncProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = sub_215972280;
  v20[3] = &unk_24D3CCDB0;
  v20[4] = &v28;
  v20[5] = &v22;
  objc_msgSend_statusWithToken_options_reply_(v14, v15, (uint64_t)v8, a4, (uint64_t)v20, v16);

  if (a5)
  {
    v17 = (void *)v23[5];
    if (v17)
      *a5 = objc_retainAutorelease(v17);
  }
  v18 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKey, 0);
  objc_storeStrong((id *)&self->_relayQueue, 0);
}

@end
