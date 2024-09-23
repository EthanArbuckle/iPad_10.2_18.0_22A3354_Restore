@implementation SidecarTransferReceiver

- (SidecarTransferReceiver)initWithSession:(id)a3 requestID:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SidecarTransferReceiver;
  return -[SidecarTransfer initWithSession:requestID:transferID:](&v5, sel_initWithSession_requestID_transferID_, a3, a4, 0);
}

- (void)handleMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__60;
  v13 = __Block_byref_object_dispose__61;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SidecarTransferReceiver_handleMessage___block_invoke;
  v6[3] = &unk_24E5E0D30;
  v8 = &v9;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v6);
  (*(void (**)(void))(v10[5] + 16))();

  _Block_object_dispose(&v9, 8);
}

- (id)_resumeMessage:(id)a3
{
  return SidecarTransferReceiverHandleMessage(self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedGroups, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

void __41__SidecarTransferReceiver_handleMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  SidecarTransferReceiverHandleMessage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
