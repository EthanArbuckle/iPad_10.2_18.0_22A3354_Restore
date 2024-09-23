@implementation WLDaemonController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __36__WLDaemonController_sharedInstance__block_invoke()
{
  WLDaemonController *v0;
  void *v1;

  v0 = objc_alloc_init(WLDaemonController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (WLDaemonController)init
{
  WLDaemonController *v2;
  WLDaemonConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLDaemonController;
  v2 = -[WLDaemonController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WLDaemonConnection);
    -[WLDaemonController setConnection:](v2, "setConnection:", v3);

  }
  return v2;
}

- (void)getLocalImportOptionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[WLDaemonController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke;
  v12[3] = &unk_24EFCA960;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "daemonWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke_2;
  v10[3] = &unk_24EFCA988;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "getLocalImportOptions:", v10);

}

void __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  _WLLog(v8, 0, CFSTR("%@: XPC error attempting to get local import options - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0FC8];
  v15[0] = CFSTR("Daemon interrupted");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.welcomekit"), 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v13);

}

void __58__WLDaemonController_getLocalImportOptionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v11 = v12;
  if (v12)
  {
    _WLLog(v4, 0, CFSTR("%@: Error from daemon get local import options - %@"), v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
    v11 = v12;
  }

}

- (void)importLocalContent
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[WLDaemonController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__WLDaemonController_importLocalContent__block_invoke;
  v5[3] = &unk_24EFCA8D0;
  v5[4] = self;
  objc_msgSend(v3, "daemonWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "importLocalContent");
}

void __40__WLDaemonController_importLocalContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error attempting local import - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

- (void)setStashDataLocally:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[WLDaemonController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__WLDaemonController_setStashDataLocally___block_invoke;
  v7[3] = &unk_24EFCA8D0;
  v7[4] = self;
  objc_msgSend(v5, "daemonWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStashDataLocally:", v3);
}

void __42__WLDaemonController_setStashDataLocally___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  _WLLog(v8, 0, CFSTR("%@: XPC error attempting set stash data locally - %@"), a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
}

- (WLDaemonConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
