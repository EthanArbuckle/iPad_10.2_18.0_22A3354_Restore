@implementation TZUpdate

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_1);
  return (id)sharedInstance_tzUpdateShared;
}

void __26__TZUpdate_sharedInstance__block_invoke()
{
  TZUpdate *v0;
  void *v1;

  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  Initializing TZUpdate shared instance..."), "+[TZUpdate sharedInstance]_block_invoke");
  v0 = objc_alloc_init(TZUpdate);
  v1 = (void *)sharedInstance_tzUpdateShared;
  sharedInstance_tzUpdateShared = (uint64_t)v0;

}

- (TZUpdate)init
{
  TZUpdate *v2;
  uint64_t v3;
  TZFileSystemInterface *fileSystemInterface;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TZUpdate;
  v2 = -[TZUpdate init](&v6, sel_init);
  if (v2)
  {
    +[TZFileSystemInterface sharedInstance](TZFileSystemInterface, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    fileSystemInterface = v2->_fileSystemInterface;
    v2->_fileSystemInterface = (TZFileSystemInterface *)v3;

  }
  return v2;
}

- (id)createNewXPCConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.timezoneupdates.tzd.server"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0313410);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

- (void)isUpdateWaitingWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;

  v5 = a3;
  -[TZUpdate createNewXPCConnection](self, "createNewXPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  Calling %@ via XPC Connection"), "-[TZUpdate isUpdateWaitingWithCompletion:]", v7);

  }
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke;
  v18[3] = &unk_1EA3F4BC8;
  v21 = a2;
  v9 = v6;
  v19 = v9;
  v10 = v5;
  v20 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke_2;
  v14[3] = &unk_1EA3F4BF0;
  v16 = v10;
  v17 = a2;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "isUpdateWaitingWithReply:", v14);

}

void __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  %@ Encountered error: %@"), "-[TZUpdate isUpdateWaitingWithCompletion:]_block_invoke", v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __42__TZUpdate_isUpdateWaitingWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2)
{
  void *v4;

  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  %@ Receieved reply %d"), "-[TZUpdate isUpdateWaitingWithCompletion:]_block_invoke_2", v4, a2);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)purgeAllAssetsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SEL v21;

  v5 = a3;
  -[TZUpdate createNewXPCConnection](self, "createNewXPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  Calling %@ via XPC Connection"), "-[TZUpdate purgeAllAssetsWithCompletion:]", v7);

  }
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke;
  v18[3] = &unk_1EA3F4BC8;
  v21 = a2;
  v9 = v6;
  v19 = v9;
  v10 = v5;
  v20 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke_2;
  v14[3] = &unk_1EA3F4C18;
  v16 = v10;
  v17 = a2;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "purgeAllAssetsWithReply:", v14);

}

void __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  %@ Encountered error: %@"), "-[TZUpdate purgeAllAssetsWithCompletion:]_block_invoke", v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __41__TZUpdate_purgeAllAssetsWithCompletion___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s  %@ Receieved reply %d, with error %@"), "-[TZUpdate purgeAllAssetsWithCompletion:]_block_invoke_2", v5, a2, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)affectedZones
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[TZUpdate isUpdateWaiting](self, "isUpdateWaiting"))
  {
    v3 = (void *)MEMORY[0x1E0C99E20];
    -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestVersionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changedFiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E80], "knownTimeZoneNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intersectSet:", v10);

    objc_msgSend(v7, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)currentTZDataVersion
{
  void *v2;
  void *v3;
  void *v4;

  -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentVersionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "versionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)alertForAllZones
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[TZUpdate isUpdateWaiting](self, "isUpdateWaiting");
  if (v3)
  {
    -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestVersionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shouldAlertAll");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (id)updateTZDataVersion
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TZUpdate isUpdateWaiting](self, "isUpdateWaiting"))
  {
    -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "latestVersionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "versionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isUpdateWaiting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestVersionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "versionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestVersionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "versionString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TZUpdate fileSystemInterface](self, "fileSystemInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentVersionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "versionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToString:", v11) ^ 1;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (TZFileSystemInterface)fileSystemInterface
{
  return (TZFileSystemInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileSystemInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_fileSystemInterface, 0);
}

@end
