@implementation BRCDownloadContentsBatchOperation

- (BRCDownloadContentsBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  return -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:](&v5, sel_initWithName_syncContext_sessionContext_, CFSTR("dl-content"), a3, a4);
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "dl-content", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  BRCDownloadContentsBatchOperation *v17;
  id v18;

  v13 = a3;
  v6 = a4;
  -[BRCDownloadContentsBatchOperation perDownloadCompletionBlock](self, "perDownloadCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v13;
    -[BRCSyncContext session](self->super.super._syncContext, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientDB");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_24FE3FB98;
    v15 = v6;
    v16 = v8;
    v17 = self;
    v18 = v7;
    v12 = v8;
    dispatch_sync(v11, block);

  }
}

void __74__BRCDownloadContentsBatchOperation_sendTransferCompletionCallBack_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  if (!v4)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 256), "downloadStager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_stageWithDownloadStager:error:", v3, &v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)mainWithTransfers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCTransferBatchOperation fetchOperationForTransfers:traceCode:](self, "fetchOperationForTransfers:traceCode:", v4, 18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB91D8], "desiredKeysWithMask:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDesiredKeys:", v6);

  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);
}

- (id)transferredObjectsPrettyName
{
  return CFSTR("documents");
}

- (id)actionPrettyName
{
  return CFSTR("downloading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCDownloadContentsBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCDownloadContentsBatchOperation setPerDownloadCompletionBlock:](self, "setPerDownloadCompletionBlock:", 0);
}

- (id)perDownloadCompletionBlock
{
  return objc_getProperty(self, a2, 576, 1);
}

- (void)setPerDownloadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perDownloadCompletionBlock, 0);
}

@end
