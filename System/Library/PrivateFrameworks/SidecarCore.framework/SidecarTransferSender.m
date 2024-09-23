@implementation SidecarTransferSender

- (SidecarTransferSender)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5
{
  SidecarTransferSender *v5;
  SidecarTransferSender *v6;
  _QWORD v8[4];
  SidecarTransferSender *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SidecarTransferSender;
  v5 = -[SidecarTransfer initWithSession:requestID:transferID:](&v10, sel_initWithSession_requestID_transferID_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__SidecarTransferSender_initWithSession_requestID_transferID___block_invoke;
    v8[3] = &unk_24E5E1578;
    v9 = v5;
    SidecarTransferLocked((os_unfair_lock_s *)v9, v8);

  }
  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_resumeMessage:(id)a3
{
  __SidecarTransferSendMessage(self, a3);
  return 0;
}

- (void)sendItems:(id)a3 messageType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SidecarTransferSender_sendItems_messageType___block_invoke;
  v9[3] = &unk_24E5E0B88;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  v11 = a4;
  SidecarTransferLocked((os_unfair_lock_s *)self, v9);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  SidecarMessageSetItemMetaData(v7, v8);
  if (SidecarTransferSenderSliceData(self))
    SidecarTransferSenderSetMessageData(self, v7);
  SidecarTransferSendMessage(self, v7);

}

- (void)_sendCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *log;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      log = v6;
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      v6 = log;
      if (v7)
      {
        objc_msgSend(v4, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v4, "code");
        objc_msgSend(v4, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v13 = v8;
        v14 = 2048;
        v15 = v9;
        v16 = 2113;
        v17 = v10;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v6 = log;
      }
    }

    goto LABEL_6;
  }
  if (!SidecarTransferSenderSliceData(self))
  {
LABEL_6:
    -[SidecarTransfer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sidecarTransfer:didComplete:", self, v4);
    goto LABEL_7;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  SidecarTransferSenderSetMessageData(self, v5);
  SidecarTransferSendMessage(self, v5);
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slices, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

void __47__SidecarTransferSender_sendItems_messageType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) != -1)
    __assert_rtn("-[SidecarTransferSender sendItems:messageType:]_block_invoke", "SidecarTransfer.m", 437, "self->_itemID == -1");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 48);
}

uint64_t __62__SidecarTransferSender_initWithSession_requestID_transferID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = -1;
  return result;
}

@end
