@implementation SidecarTransfer

- (SidecarTransfer)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5
{
  id v8;
  SidecarTransfer *v9;
  SidecarTransfer *v10;
  _QWORD v12[4];
  SidecarTransfer *v13;
  id v14;
  int64_t v15;
  int64_t v16;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SidecarTransfer;
  v9 = -[SidecarTransfer init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__SidecarTransfer_initWithSession_requestID_transferID___block_invoke;
    v12[3] = &unk_24E5E1128;
    v13 = v9;
    v15 = a4;
    v14 = v8;
    v16 = a5;
    SidecarTransferLocked((os_unfair_lock_s *)v13, v12);

  }
  return v10;
}

- (SidecarSession)session
{
  return self->_session;
}

- (id)dataForType:(id)a3
{
  return 0;
}

- (id)_resumeMessage:(id)a3
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (SidecarTransferDelegate)delegate
{
  return (SidecarTransferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (int64_t)transferID
{
  return self->_transferID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__SidecarTransfer_initWithSession_requestID_transferID___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(a1 + 56);
}

@end
