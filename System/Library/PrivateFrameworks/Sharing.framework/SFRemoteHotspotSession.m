@implementation SFRemoteHotspotSession

- (SFRemoteHotspotSession)init
{
  SFRemoteHotspotSession *v2;
  SFRemoteHotspotSession *v3;
  SFRemoteHotspotProtocol *connectionProxy;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRemoteHotspotSession;
  v2 = -[SFRemoteHotspotSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_browsing = 0;
    connectionProxy = v2->_connectionProxy;
    v2->_connectionProxy = 0;

    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", v3);

  }
  return v3;
}

- (void)startBrowsing
{
  SFRemoteHotspotSession *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  tethering_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Starting browsing", buf, 2u);
  }

  if (!-[SFRemoteHotspotSession browsing](v2, "browsing"))
  {
    -[SFRemoteHotspotSession setBrowsing:](v2, "setBrowsing:", 1);
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__SFRemoteHotspotSession_startBrowsing__block_invoke;
    v5[3] = &unk_1E482F4D8;
    v5[4] = v2;
    objc_msgSend(v4, "remoteHotspotSessionForClient:withCompletionHandler:", v2, v5);

  }
  objc_sync_exit(v2);

}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  os_activity_scope_state_s state;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "browsing"))
  {
    if (v5)
    {
      v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteHotspotSession/startBrowsing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v7, &state);
      objc_msgSend(*(id *)(a1 + 32), "setConnectionProxy:", v5);
      objc_msgSend(*(id *)(a1 + 32), "connectionProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startBrowsing");

      tethering_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Started browsing", v13, 2u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      tethering_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_2(v6, v11);

      tethering_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_1((uint64_t)v6, v12);

      objc_msgSend(*(id *)(a1 + 32), "setBrowsing:", 0);
    }
  }
  else
  {
    tethering_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Browsing stopped while getting proxy", (uint8_t *)&state, 2u);
    }

  }
}

- (void)stopBrowsing
{
  SFRemoteHotspotSession *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  os_activity_scope_state_s buf;

  v2 = self;
  objc_sync_enter(v2);
  tethering_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.opaque[0]) = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Stopping browsing", (uint8_t *)&buf, 2u);
  }

  if (-[SFRemoteHotspotSession browsing](v2, "browsing"))
  {
    v4 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteHotspotSession/stopBrowsing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v4, &buf);
    -[SFRemoteHotspotSession setBrowsing:](v2, "setBrowsing:", 0);
    -[SFRemoteHotspotSession connectionProxy](v2, "connectionProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopBrowsing");

    tethering_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Stopped browsing", v7, 2u);
    }

    os_activity_scope_leave(&buf);
  }
  objc_sync_exit(v2);

}

- (void)enableHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  -[SFRemoteHotspotSession connectionProxy](self, "connectionProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteHotspotSession/enableHotspotForDevice", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v9, &state);
    -[SFRemoteHotspotSession connectionProxy](self, "connectionProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__SFRemoteHotspotSession_enableHotspotForDevice_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E482F500;
    v12 = v7;
    objc_msgSend(v10, "enableHotspotForDevice:withCompletionHandler:", v6, v11);

    os_activity_scope_leave(&state);
  }

}

void __71__SFRemoteHotspotSession_enableHotspotForDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

- (void)enableRemoteHotspotForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  SFRemoteHotspotSession *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  os_activity_scope_state_s buf;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  tethering_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.opaque[0]) = 138412290;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Enabling %@", (uint8_t *)&buf, 0xCu);
  }

  -[SFRemoteHotspotSession connectionProxy](v8, "connectionProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteHotspotSession/enableHotspotForDevice", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    buf.opaque[0] = 0;
    buf.opaque[1] = 0;
    os_activity_scope_enter(v11, &buf);
    -[SFRemoteHotspotSession connectionProxy](v8, "connectionProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__SFRemoteHotspotSession_enableRemoteHotspotForDevice_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E482F528;
    v16 = v6;
    v17 = v7;
    objc_msgSend(v12, "enableHotspotForDevice:withCompletionHandler:", v16, v15);

    os_activity_scope_leave(&buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19 = CFSTR("XPC connection unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
  objc_sync_exit(v8);

}

void __77__SFRemoteHotspotSession_enableRemoteHotspotForDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  tethering_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Enabled %@, %@, error (%@)", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateLowLatencyFilter:(id)a3 isAddFilter:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateLowLatencyFilter:isAddFilter:completion:", v8, v5, v7);

}

- (void)updatedFoundDeviceList:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  tethering_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Updated device list %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:updatedFoundDevices:", self, v4);

}

- (void)xpcManagerConnectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  tethering_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "XPC Connection was interrupted", v3, 2u);
  }

}

- (SFRemoteHotspotSessionDelegate)delegate
{
  return (SFRemoteHotspotSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)browsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (SFRemoteHotspotProtocol)connectionProxy
{
  return (SFRemoteHotspotProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "remoteHotspotSessionForClient: %@", (uint8_t *)&v2, 0xCu);
}

void __39__SFRemoteHotspotSession_startBrowsing__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1A2830000, a2, OS_LOG_TYPE_FAULT, "Couldn't retrieve proxy %@", (uint8_t *)&v4, 0xCu);

}

@end
