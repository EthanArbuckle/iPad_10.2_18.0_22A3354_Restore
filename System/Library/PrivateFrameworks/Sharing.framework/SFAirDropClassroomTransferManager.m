@implementation SFAirDropClassroomTransferManager

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFAirDropClassroomTransferManager;
  -[SFXPCClient _activate](&v2, sel__activate);
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFAirDropClassroomTransferManager;
  -[SFXPCClient _invalidate](&v2, sel__invalidate);
}

- (void)updateTransferWithIdentifier:(id)a3 withState:(int64_t)a4 information:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_1A2830000, "Sharing/SFAirDropClassroomTransferManager/updateTransferWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke;
  v17[3] = &unk_1E4830908;
  v17[4] = self;
  v14 = v10;
  v18 = v14;
  v21 = a4;
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  -[SFAirDropClassroomTransferManager _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v17);

  os_activity_scope_leave(&state);
}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  airdrop_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[5];
    v8 = a1[8];
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 1024;
    v22 = v8;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "updating daemon with transfer %@ with state %d", buf, 0x12u);
  }

  v9 = a1[8];
  v10 = (void *)a1[5];
  v11 = a1[6];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_81;
  v15[3] = &unk_1E48308E0;
  v12 = v10;
  v14 = (void *)a1[7];
  v13 = a1[8];
  v16 = v12;
  v18 = v13;
  v17 = v14;
  objc_msgSend(v4, "updateTransferWithIdentifier:withState:information:completionHandler:", v12, v9, v11, v15);

}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_81(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  airdrop_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = a1[6];
      v13 = 138412546;
      v14 = v11;
      v15 = 1024;
      v16 = v12;
      _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "updated daemon with transfer %@ with state %d", (uint8_t *)&v13, 0x12u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_81_cold_1((uint64_t)a1, (uint64_t)v7, v10);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

- (void)transferWithIdentifierWasAccepted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  airdrop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "transferWithIdentifierWasAccepted %@", (uint8_t *)&v7, 0xCu);
  }

  -[SFAirDropClassroomTransferManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transferWithIdentifierWasAccepted:", v4);

}

- (void)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  airdrop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 1024;
    v16 = a4;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "transferWithIdentifierWasDeclined %@, withFailureReason: %d", (uint8_t *)&v13, 0x12u);
  }

  -[SFAirDropClassroomTransferManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  -[SFAirDropClassroomTransferManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v10, "transferWithIdentifierWasDeclined:withFailureReason:", v6, a4);
LABEL_7:

    goto LABEL_8;
  }
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[SFAirDropClassroomTransferManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transferWithIdentifierWasDeclined:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.classroom-transfer");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6BDBF8);
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBC88);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFAirDropClassroomTransferDelegate)delegate
{
  return (SFAirDropClassroomTransferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __106__SFAirDropClassroomTransferManager_updateTransferWithIdentifier_withState_information_completionHandler___block_invoke_81_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Failed to update daemon with transfer %@ (%@)", (uint8_t *)&v4, 0x16u);
}

@end
