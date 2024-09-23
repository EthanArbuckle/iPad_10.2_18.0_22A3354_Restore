@implementation SFShareSheetSlotManager

- (SFShareSheetSlotManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFShareSheetSlotManager;
  return -[SFShareSheetSlotManager init](&v3, sel_init);
}

- (void)ensureXPCStarted
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_19E419000, v0, OS_LOG_TYPE_DEBUG, "connection created", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

void __43__SFShareSheetSlotManager_ensureXPCStarted__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interrupted");

}

void __43__SFShareSheetSlotManager_ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidated");

}

- (void)ensureConnectionEstablished
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Establishing connection", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SFShareSheetSlotManager_ensureConnectionEstablished__block_invoke;
  v5[3] = &unk_1E40016A0;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "establishConnectionWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak((id *)buf);
}

void __54__SFShareSheetSlotManager_ensureConnectionEstablished__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionEstablished");

}

- (void)invalidated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_19E419000, v0, v1, "XPC connection unexpectedly invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)connectionEstablished
{
  NSObject *v2;
  uint8_t v3[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "connection established", v3, 2u);
  }

}

- (void)connectionInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_19E419000, v0, v1, "connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (id)synchronousRemoteObjectProxy
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
}

void __55__SFShareSheetSlotManager_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get synchronous remote object proxy with error %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)remoteObjectProxy
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_81_0);
}

void __44__SFShareSheetSlotManager_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get asynchronous remote object proxy with error %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_19E419000, v0, v1, "Activate already called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)invalidate
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    connection = self->_connection;
    if (connection)
    {
      -[NSXPCConnection invalidate](connection, "invalidate");
      v4 = self->_connection;
      self->_connection = 0;

    }
    else
    {
      -[SFShareSheetSlotManager invalidated](self, "invalidated");
    }
  }
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  objc_msgSend(a4, "invoke", a3);
}

- (void)connectToDaemonWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/connectToDaemonWithSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connectToDaemonWithContext:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)connectUIServiceToDaemonWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/connectUIServiceToDaemonWithSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectUIServiceToDaemonWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)sendConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/sendConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendConfiguration:completion:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)requestConfigurationWithSessionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/requestConfigurationWithSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestConfigurationWithSessionID:completion:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActivityWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedActivityWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:selectedActivityWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedActionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedActionWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:selectedActionWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedPersonWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedPersonWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:selectedPersonWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 removedPersonWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerRemovedPersonWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:removedPersonWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 provideFeedbackForPeopleSuggestionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerProvideFeedbackForPeopleSuggestionWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 didLongPressShareActivityWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidLongPressShareActivityWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)activityViewControllerWithSessionID:(id)a3 toggledActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerToggledActivityWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityViewControllerWithSessionID:toggledActivityWithIdentifier:activityCategory:", v8, v9, a5);

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerWithSessionID:(id)a3 favoritedActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  os_activity_scope_state_s v14;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerFavoritedActivityWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v12, &v14);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activityViewControllerWithSessionID:favoritedActivity:withIdentifier:activityCategory:", v10, v8, v11, a6);

  os_activity_scope_leave(&v14);
}

- (void)activityViewControllerWithSessionID:(id)a3 selectedDefaultActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerSelectedDefaultActivityWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityViewControllerWithSessionID:selectedDefaultActivityWithIdentifier:activityCategory:", v8, v9, a5);

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerWithSessionID:(id)a3 updatedFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerUpdatedFavoritesProxies", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:", v8, v9, a5);

  os_activity_scope_leave(&v12);
}

- (void)activityViewControllerPerformedActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  os_activity_scope_state_s v16;

  v7 = a7;
  v12 = a3;
  v13 = a6;
  v14 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerPerformedActivityWithSessionIDPresentationMsTotalShareTimeMsActivityTypeSuccess", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v14, &v16);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityViewControllerPerformedActivityWithSessionID:presentationMs:totalShareTimeMs:activityType:success:", v12, a4, a5, v13, v7);

  os_activity_scope_leave(&v16);
}

- (void)activityViewControllerDidAppearWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidAppear", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerDidAppearWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerDidDisappearWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidDisappear", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerDidDisappearWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerDidEnterBackgroundWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerDidEnterBackground", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerDidEnterBackgroundWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerWillEnterForegroundWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerWillEnterForeground", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerWillEnterForegroundWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerPerformEditActionsWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerPerformEditActions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerPerformEditActionsWithSessionID:", v4);

  os_activity_scope_leave(&v7);
}

- (void)activityViewControllerWithSessionID:(id)a3 performActivityWithType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerWithSessionIDPerformActivityWithType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityViewControllerWithSessionID:performActivityWithType:completionHandler:", v8, v9, v10);

  os_activity_scope_leave(&v13);
}

- (void)activityViewControllerWithSessionID:(id)a3 findSupportedActivitiesWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/activityViewControllerWithSessionIDFindSupportedActivities", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceUpdatedWithSessionConfiguration:", v4);

}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performUserDefaultsWithFavoritesProxies:suggestionProxies:orderedUUIDs:activityCategory:", v12, v11, v10, a6);

}

- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performExtensionActivityInHostWithBundleID:request:", v7, v6);

}

- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performShortcutActivityInHostWithBundleID:singleUseToken:", v7, v6);

}

- (void)performActivityInHostWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performActivityInHostWithUUID:", v4);

}

- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAirDropActivityInHostWithNoContentView:", v3);

}

- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willPerformInServiceActivityWithRequest:completion:", v7, v6);

}

- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didPerformInServiceActivityWithIdentifier:completed:items:error:", v12, v7, v11, v10);

}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFShareSheetSlotManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateAirDropTransferWithChange:", v4);

}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/createSharingURLForCollaborationRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createSharingURLForCollaborationRequest:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/requestDefaultShareModeCollaborationForURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestDefaultShareModeCollaborationForURL:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/requestSharedURLForFileOrFolderURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSharedURLForFileOrFolderURL:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/requestCollaborativeModeForContentIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestCollaborativeModeForContentIdentifier:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/requestAddParticipantsAllowedForURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestAddParticipantsAllowedForURL:share:completionHandler:", v8, v9, v10);

  os_activity_scope_leave(&v13);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/saveCollaborativeMode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager synchronousRemoteObjectProxy](self, "synchronousRemoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveCollaborativeMode:forContentIdentifier:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/removeSharingURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteSharingURL:containerSetupInfo:completionHandler:", v8, v9, v10);

  os_activity_scope_leave(&v13);
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/isShareOwnerOrAdminForFileURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isShareOwnerOrAdminForFileURL:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (void)shareStatusForFileURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19E419000, "Sharing/SFShareSheetSlotManager/shareStatusForFileURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  -[SFShareSheetSlotManager remoteObjectProxy](self, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shareStatusForFileURL:completionHandler:", v6, v7);

  os_activity_scope_leave(&v10);
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.sharesheet");
}

- (id)exportedInterface
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE542A50);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0C99E60];
  v48 = objc_opt_class();
  v45 = objc_opt_class();
  v43 = objc_opt_class();
  v41 = objc_opt_class();
  v39 = objc_opt_class();
  v37 = objc_opt_class();
  v36 = objc_opt_class();
  v35 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v50, "setWithObjects:", v48, v45, v43, v41, v39, v37, v36, v35, v2, v3, v4, v5, v6, v7, v8, v9, v10,
    objc_opt_class(),
    0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_willPerformInServiceActivityWithRequest_completion_, 0, 1);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  v46 = objc_opt_class();
  v44 = objc_opt_class();
  v42 = objc_opt_class();
  v40 = objc_opt_class();
  v38 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v49, v46, v44, v42, v40, v38, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(),
    0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_didPerformInServiceActivityWithIdentifier_completed_items_error_, 1, 0);

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_, 0, 0);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_, 1, 0);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory_, 2, 0);

  objc_msgSend(v47, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdateAirDropTransferWithChange_, 0, 0);
  objc_msgSend(v47, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_dataSourceUpdatedWithSessionConfiguration_, 0, 0);
  return v47;
}

- (id)remoteObjectInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE576DE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_connectToDaemonWithContext_completionHandler_, 0, 0);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_connectUIServiceToDaemonWithSessionID_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendConfiguration_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestConfigurationWithSessionID_completion_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_selectedPersonWithIdentifier_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_selectedPersonWithIdentifier_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_removedPersonWithIdentifier_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_removedPersonWithIdentifier_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_didLongPressShareActivityWithIdentifier_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_didLongPressShareActivityWithIdentifier_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_provideFeedbackForPeopleSuggestionWithIdentifier_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_activityViewControllerWithSessionID_provideFeedbackForPeopleSuggestionWithIdentifier_, 1, 0);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_activityViewControllerWithSessionID_updatedFavoritesProxies_activityCategory_, 1, 0);

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_activityViewControllerWithSessionID_findSupportedActivitiesWithCompletionHandler_, 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createSharingURLForCollaborationRequest_completionHandler_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_createSharingURLForCollaborationRequest_completionHandler_, 0, 1);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", getCKContainerSetupInfoClass(), sel_deleteSharingURL_containerSetupInfo_completionHandler_, 1, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", getCKShareClass(), sel_requestAddParticipantsAllowedForURL_share_completionHandler_, 1, 0);
  return v2;
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (SFShareSheetSlotManagerDelegate)delegate
{
  return (SFShareSheetSlotManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
