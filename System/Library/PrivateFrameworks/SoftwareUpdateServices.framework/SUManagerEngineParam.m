@implementation SUManagerEngineParam

- (SUManagerEngineParam)init
{
  SUManagerEngineParam *v2;
  SUManagerEngineParam *v3;
  SUCorePolicy *scanPolicy;
  NSString *scanUUID;
  SUManagerEngineDownloadDescriptor *downloadDescriptor;
  SUInstallOptions *installOptions;
  SURollbackOptions *rollbackOptions;
  SUCoreRollback *rollback;
  SUCoreProgress *progress;
  NSError *error;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUManagerEngineParam;
  v2 = -[SUManagerEngineParam init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    scanPolicy = v2->_scanPolicy;
    v2->_paramType = 0;
    v2->_scanPolicy = 0;

    scanUUID = v3->_scanUUID;
    v3->_scanUUID = 0;

    v3->_isManaged = 0;
    downloadDescriptor = v3->_downloadDescriptor;
    v3->_downloadDescriptor = 0;

    installOptions = v3->_installOptions;
    v3->_installOptions = 0;

    rollbackOptions = v3->_rollbackOptions;
    v3->_rollbackOptions = 0;

    rollback = v3->_rollback;
    v3->_rollback = 0;

    progress = v3->_progress;
    v3->_progress = 0;

    error = v3->_error;
    v3->_error = 0;

    v3->_skipDocAssetsPurge = 0;
  }
  return v3;
}

- (SUManagerEngineParam)initWithScanPolicy:(id)a3 scanUUID:(id)a4 isManaged:(BOOL)a5
{
  id v9;
  id v10;
  SUManagerEngineParam *v11;
  SUManagerEngineParam *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[SUManagerEngineParam init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_paramType = 1;
    objc_storeStrong((id *)&v11->_scanPolicy, a3);
    objc_storeStrong((id *)&v12->_scanUUID, a4);
    v12->_isManaged = a5;
  }

  return v12;
}

- (SUManagerEngineParam)initWithDownloadDescriptor:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 2;
    objc_storeStrong((id *)&v6->_downloadDescriptor, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithInstallOptions:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 3;
    objc_storeStrong((id *)&v6->_installOptions, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollbackOptions:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 8;
    objc_storeStrong((id *)&v6->_rollbackOptions, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollback:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 7;
    objc_storeStrong((id *)&v6->_rollback, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithRollback:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  SUManagerEngineParam *v9;
  SUManagerEngineParam *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[SUManagerEngineParam init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_paramType = 7;
    objc_storeStrong((id *)&v9->_rollback, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (SUManagerEngineParam)initWithProgress:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 4;
    objc_storeStrong((id *)&v6->_progress, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithPurgeOptions:(BOOL)a3 withError:(id)a4
{
  id v7;
  SUManagerEngineParam *v8;
  SUManagerEngineParam *v9;

  v7 = a4;
  v8 = -[SUManagerEngineParam init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_paramType = 9;
    v8->_skipDocAssetsPurge = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (SUManagerEngineParam)initWithError:(id)a3
{
  id v5;
  SUManagerEngineParam *v6;
  SUManagerEngineParam *v7;

  v5 = a3;
  v6 = -[SUManagerEngineParam init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_paramType = 5;
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (SUManagerEngineParam)initWithDescriptor:(id)a3 andError:(id)a4
{
  id v7;
  id v8;
  SUManagerEngineParam *v9;
  SUManagerEngineParam *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[SUManagerEngineParam init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_paramType = 6;
    objc_storeStrong((id *)&v9->_downloadDescriptor, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;

  switch(-[SUManagerEngineParam paramType](self, "paramType"))
  {
    case 0:
      -[SUManagerEngineParam _descriptionBlank](self, "_descriptionBlank");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[SUManagerEngineParam _descriptionScanPolicy](self, "_descriptionScanPolicy");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[SUManagerEngineParam _descriptionDownloadDescriptor](self, "_descriptionDownloadDescriptor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[SUManagerEngineParam _descriptionInstallOptions](self, "_descriptionInstallOptions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[SUManagerEngineParam _descriptionProgress](self, "_descriptionProgress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[SUManagerEngineParam _descriptionError](self, "_descriptionError");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[SUManagerEngineParam _descriptionErrorWithDescriptor](self, "_descriptionErrorWithDescriptor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[SUManagerEngineParam _descriptionRollback](self, "_descriptionRollback");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[SUManagerEngineParam _descriptionRollbackOptions](self, "_descriptionRollbackOptions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[SUManagerEngineParam _descriptionPurge](self, "_descriptionPurge");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[SUManagerEngineParam _descriptionUnknown](self, "_descriptionUnknown");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (id)_descriptionBlank
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n[>>>\n    paramType: Blank\n<<<]"));
}

- (id)_descriptionScanPolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam scanPolicy](self, "scanPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineParam scanUUID](self, "scanUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUManagerEngineParam isManaged](self, "isManaged");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n[>>>\n     paramType: ScanPolicy\n    scanPolicy: %@\n      scanUUID: %@\n     isManaged: %@\n<<<]"), v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_descriptionDownloadDescriptor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam downloadDescriptor](self, "downloadDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n             paramType: DownloadDescriptor\n    downloadDescriptor: %@\n<<<]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionInstallOptions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam installOptions](self, "installOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n         paramType: InstallOptions\n    installOptions: %@\n<<<]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionRollbackOptions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam rollbackOptions](self, "rollbackOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n         paramType: RollbackOptions:\n            %@\n<<<]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionPurge
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUManagerEngineParam skipDocAssetsPurge](self, "skipDocAssetsPurge"))
    v4 = CFSTR("skip doc assets");
  else
    v4 = CFSTR("purge doc assets");
  -[SUManagerEngineParam error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n[>>>\n         paramType: PurgeOptions:\n            %@\n            error: %@\n<<<]"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionRollback
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam rollback](self, "rollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n         paramType: Rollback:\n            %@\n<<<]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionProgress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n    paramType: Progress\n     progress: %@\n<<<]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n[>>>\n    paramType: Error\n        error: %@\n<<<]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionErrorWithDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUManagerEngineParam error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerEngineParam downloadDescriptor](self, "downloadDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n[>>>\n            paramType: ErrorWithDescriptor\n                error: %@\n   downloadDescriptor: %@\n<<<]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_descriptionUnknown
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n[>>>\n    paramType: Unknown(%ld)\n<<<]"), -[SUManagerEngineParam paramType](self, "paramType"));
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (SUManagerEngineDownloadDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (SUInstallOptions)installOptions
{
  return self->_installOptions;
}

- (SUCoreRollback)rollback
{
  return self->_rollback;
}

- (SURollbackOptions)rollbackOptions
{
  return self->_rollbackOptions;
}

- (SUCoreProgress)progress
{
  return self->_progress;
}

- (BOOL)skipDocAssetsPurge
{
  return self->_skipDocAssetsPurge;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_rollbackOptions, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
}

@end
