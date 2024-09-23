@implementation STSTapToProvisionReader

- (STSTapToProvisionReader)init
{
  STSTapToProvisionReader *v2;
  void *v3;
  uint64_t v4;
  id v5;
  ORReader *reader;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  ORReader *v15;
  ORReader *v16;
  STSTapToProvisionReader *v17;
  ORReader *v18;
  id v20;
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STSTapToProvisionReader;
  v2 = -[STSTapToProvisionReader init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEAE6A0], "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v3, "makeORReaderAndReturnError:", &v21);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v21;
    reader = v2->_reader;
    v2->_reader = (ORReader *)v4;

    if (v5)
    {
      v9 = 1;
      do
      {
        v10 = objc_msgSend(v5, "code");
        if ((v9 & 1) == 0 || v10 != 14001)
          goto LABEL_11;

        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSTapToProvisionReader init]", 38, v2, CFSTR("Failed to create OR reader : %@, retrying.."), v11, v12, 0);
        objc_msgSend(MEMORY[0x24BEAE6A0], "shared");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        objc_msgSend(v13, "makeORReaderAndReturnError:", &v20);
        v14 = objc_claimAutoreleasedReturnValue();
        v5 = v20;
        v15 = v2->_reader;
        v2->_reader = (ORReader *)v14;

        v9 = 0;
      }
      while (v5);
    }
    v16 = v2->_reader;
    if (!v16)
    {
      v5 = 0;
LABEL_11:
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSTapToProvisionReader init]", 46, v2, CFSTR("Failed to create OR reader : %@"), v7, v8, (uint64_t)v5);
      v18 = v2->_reader;
      v2->_reader = 0;

      v17 = 0;
      goto LABEL_12;
    }
    -[ORReader setDelegate:](v16, "setDelegate:", v2);
  }
  v17 = v2;
LABEL_12:

  return v17;
}

- (void)onUpdateWithEvent:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "onUpdateWithEvent:", a3);

}

- (id)checkStatusWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_2158D3B74;
  v23 = sub_2158D3B84;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_2158D3B74;
  v17 = sub_2158D3B84;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2158D3B8C;
  v9[3] = &unk_24D3A7828;
  v11 = &v13;
  v12 = &v19;
  v6 = v5;
  v10 = v6;
  -[STSTapToProvisionReader checkStatusWithCompletion:](self, "checkStatusWithCompletion:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)checkStatusWithCompletion:(id)a3
{
  id v4;
  ORReader *reader;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  reader = self->_reader;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2158D3C88;
  v7[3] = &unk_24D3A7850;
  v8 = v4;
  v6 = v4;
  -[ORReader checkStatusWithCompletion:](reader, "checkStatusWithCompletion:", v7);

}

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  ORReader *reader;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "toOR");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  reader = self->_reader;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2158D3D94;
  v10[3] = &unk_24D3A7878;
  v11 = v6;
  v9 = v6;
  -[ORReader provisionCardWithParameters:completion:](reader, "provisionCardWithParameters:completion:", v7, v10);

}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
{
  return MEMORY[0x24BEDD108](self->_reader, sel_cancelProvisionAndReturnError_);
}

- (STSTapToProvisionDelegate)delegate
{
  return (STSTapToProvisionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ORReader)reader
{
  return (ORReader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
