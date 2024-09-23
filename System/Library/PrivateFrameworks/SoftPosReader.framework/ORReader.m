@implementation ORReader

- (ORReader)initWithConnector:(id)a3
{
  ORReader *v3;
  uint64_t v4;
  OS_dispatch_queue *relayQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ORReader;
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

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  id v16;
  const char *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_2159727EC;
  v21[3] = &unk_24D3CCE28;
  v21[4] = self;
  v8 = v6;
  v22 = v8;
  v9 = a3;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v10, (uint64_t)v21, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = sub_215972898;
  v19[3] = &unk_24D3CD038;
  v19[4] = self;
  v20 = v8;
  v16 = v8;
  objc_msgSend_provisionCardWithParameters_delegate_reply_(v14, v17, (uint64_t)v9, (uint64_t)WeakRetained, (uint64_t)v19, v18);

}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
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
  v25 = sub_215972AC4;
  v26 = sub_215972AD4;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v21 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215972ADC;
  v17[3] = &unk_24D3CCCC0;
  v17[4] = &v22;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v17, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_215972AEC;
  v16[3] = &unk_24D3CCD10;
  v16[4] = &v18;
  v16[5] = &v22;
  objc_msgSend_cancelProvisionWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

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

- (void)checkStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_215972BE4;
  v19[3] = &unk_24D3CCE28;
  v19[4] = self;
  v6 = v4;
  v20 = v6;
  objc_msgSend_asyncProxyWithErrorHandler_(self, v7, (uint64_t)v19, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = sub_215972C90;
  v17[3] = &unk_24D3CD060;
  v17[4] = self;
  v18 = v6;
  v12 = v6;
  objc_msgSend_checkStatusWithReply_(v11, v13, (uint64_t)v17, v14, v15, v16);

}

- (id)checkStatusWithError:(id *)a3
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
  id v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_215972AC4;
  v28 = sub_215972AD4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_215972AC4;
  v22 = sub_215972AD4;
  v7 = MEMORY[0x24BDAC760];
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_215972EC8;
  v17[3] = &unk_24D3CCCC0;
  v17[4] = &v24;
  objc_msgSend_syncProxyWithErrorHandler_(self, a2, (uint64_t)v17, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = sub_215972ED8;
  v16[3] = &unk_24D3CD088;
  v16[4] = &v18;
  v16[5] = &v24;
  objc_msgSend_checkStatusWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a3)
  {
    v13 = (void *)v25[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

- (ORProvisionDelegate)delegate
{
  return (ORProvisionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayQueue, 0);
}

@end
