@implementation SUCoreStartup

+ (id)initializeSharedStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v15;
  id v16;
  int64_t v17;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke;
  block[3] = &unk_1E611D108;
  v16 = v8;
  v17 = a3;
  v15 = v7;
  v9 = initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce;
  v10 = v8;
  v11 = v7;
  if (v9 != -1)
    dispatch_once(&initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce, block);
  v12 = (id)initializeSharedStartup_usingDomain_usingFilesystemDir__startup;

  return v12;
}

void __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke(_QWORD *a1)
{
  id v1;
  void *v2;

  v1 = -[SUCoreStartup _initAtStartup:usingDomain:usingFilesystemDir:]([SUCoreStartup alloc], "_initAtStartup:usingDomain:usingFilesystemDir:", a1[6], a1[4], a1[5]);
  v2 = (void *)initializeSharedStartup_usingDomain_usingFilesystemDir__startup;
  initializeSharedStartup_usingDomain_usingFilesystemDir__startup = (uint64_t)v1;

}

- (id)_initAtStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  char v6;
  id v8;
  id v9;
  SUCoreStartup *v10;
  id v11;
  void *v13;
  void *v14;
  id v15;
  id v16;
  objc_super v17;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreStartup;
  v10 = -[SUCoreStartup init](&v17, sel_init);
  if (!v10)
    goto LABEL_7;
  if ((v6 & 1) != 0)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v8)
      objc_msgSend(v13, "useDomain:", v8);
    if (v9)
      objc_msgSend(v14, "useFilesystemBaseDir:", v9);

    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0)
        goto LABEL_5;
LABEL_14:
      v16 = +[SUCoreEventReporter sharedReporter](SUCoreEventReporter, "sharedReporter");
      if ((v6 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  v15 = +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  if ((v6 & 4) != 0)
    goto LABEL_14;
LABEL_5:
  if ((v6 & 8) != 0)
LABEL_6:
    v11 = +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
LABEL_7:

  return v10;
}

@end
