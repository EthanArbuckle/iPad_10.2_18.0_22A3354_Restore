@implementation WBSAuthenticationServicesAgentCredentialSharingGroupsProxy

- (WBSAuthenticationServicesAgentCredentialSharingGroupsProxy)init
{
  WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *v2;
  WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *v3;
  uint64_t v4;
  NSXPCConnection *connection;
  WBSAuthenticationServicesAgentCredentialSharingGroupsProxy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSAuthenticationServicesAgentCredentialSharingGroupsProxy;
  v2 = -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v2->_internalLock);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.AuthenticationServices.CredentialSharingGroups"), 0);
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy _setUpConnection:](v3, "_setUpConnection:", v3->_connection);
    os_unfair_lock_unlock(&v3->_internalLock);
    v6 = v3;
  }

  return v3;
}

- (void)_setUpConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke;
  v11 = &unk_1E649B5B0;
  objc_copyWeak(&v12, &location);
  v6 = _Block_copy(&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v6, v8, v9, v10, v11);
  objc_msgSend(v4, "setInterruptionHandler:", v6);
  WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v7);

  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(v4, "resume");

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(v2);
    os_unfair_lock_lock(WeakRetained + 4);
    v3 = *(void **)&WeakRetained[2]._os_unfair_lock_opaque;
    *(_QWORD *)&WeakRetained[2]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 4);
  }

}

- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void (**)(id, _QWORD))a3;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a2;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "notifyUserAboutSharedSavedAccountsInRecentlyDeleted:", v5);
  else
    v5[2](v5, 0);

}

void __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __125__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:", v3);

}

void __125__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke;
  v16 = &unk_1E649B5F8;
  v18 = a2;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "leaveGroupWithID:completionHandler:", v7, v10, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"), v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);

  }
}

void __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __98__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_deleteGroupWithID_completionHandler___block_invoke;
  v16 = &unk_1E649B5F8;
  v18 = a2;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "deleteGroupWithID:completionHandler:", v7, v10, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"), v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v12);

  }
}

void __98__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_deleteGroupWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __135__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler___block_invoke;
  v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v13[4] = a2;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v12, "groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:", v9, v6, v10);
  else
    v10[2](v10);

}

void __135__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)groupsUpdatedWithInfos:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a2;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:", v5, 0, &__block_literal_global_83);

}

void __85__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_groupsUpdatedWithInfos___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(a1, v4);

}

- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SEL v15;

  v5 = a3;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __105__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  v13 = &unk_1E649B5F8;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "fetchSharingGroupsThatIncludeFamilyMembers:", v7, v10, v11, v12, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"), v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

void __105__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

}

- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SEL v15;

  v5 = a3;
  -[WBSAuthenticationServicesAgentCredentialSharingGroupsProxy connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __121__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  v13 = &unk_1E649B5F8;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:", v7, v10, v11, v12, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"), v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

  }
}

void __121__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(a1, v4);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E0CB28A8], 4099, CFSTR("Couldn't connect to AuthenticationServicesAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

}

- (id)connection
{
  os_unfair_lock_s *p_internalLock;
  NSXPCConnection *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_connection;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __79__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy__setUpConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Connection to AuthenticationServicesAgent closed", v1, 2u);
}

void __114__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_6(a1, a2);
  v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B2621000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

void __97__WBSAuthenticationServicesAgentCredentialSharingGroupsProxy_leaveGroupWithID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_5_0(a1, a2);
  v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B2621000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

@end
