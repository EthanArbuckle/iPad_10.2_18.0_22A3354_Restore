@implementation SBKLoadDomainVersionRequestHandler

+ (int64_t)conflictDetectionType
{
  return 0;
}

- (void)runWithCompletionHandler:(id)a3
{
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = -[SBKLoadDomainVersionRequestHandler loadsRemoteItemCount](self, "loadsRemoteItemCount");
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke;
  v8[3] = &unk_24E2A81A0;
  v8[1] = 3221225472;
  if (v5)
    v6 = CFSTR("0");
  else
    v6 = CFSTR("9223372036854775807");
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SBKSyncRequestHandler startTransactionWithSyncAnchor:keysToUpdate:keysToDelete:finishedBlock:](self, "startTransactionWithSyncAnchor:keysToUpdate:keysToDelete:finishedBlock:", v6, 0, 0, v8);

}

- (BOOL)loadsRemoteItemCount
{
  return self->_loadsRemoteItemCount;
}

- (void)setLoadsRemoteItemCount:(BOOL)a3
{
  self->_loadsRemoteItemCount = a3;
}

- (unint64_t)responseItemCount
{
  return self->_responseItemCount;
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

uint64_t __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "responseUpdatedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = objc_msgSend(v6, "count");

  if (objc_msgSend(*(id *)(a1 + 32), "loadsRemoteItemCount"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(", itemCount = %@"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_24E2A84D0;
  }
  v10 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "responseDomainVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_21E4FD000, v10, OS_LOG_TYPE_DEFAULT, "finished loading domain version: domainVersion = %@%@", buf, 0x16u);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke_4;
  block[3] = &unk_24E2A8178;
  v12 = *(id *)(a1 + 40);
  v16 = v5;
  v17 = v12;
  v13 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return 1;
}

uint64_t __63__SBKLoadDomainVersionRequestHandler_runWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
