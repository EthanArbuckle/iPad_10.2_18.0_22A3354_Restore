@implementation UMXPCServer

- (UMXPCServer)init
{
  UMXPCServer *v2;
  uint64_t v3;
  UMSideEffectsProviding *se;
  uint64_t v5;
  NSMutableArray *switchBlockingTasks;
  uint64_t v7;
  NSMutableArray *syncTasks;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UMXPCServer;
  v2 = -[UMXPCServer init](&v10, sel_init);
  if (v2)
  {
    sub_18FAEAA80();
    v3 = objc_claimAutoreleasedReturnValue();
    se = v2->_se;
    v2->_se = (UMSideEffectsProviding *)v3;

    *(_WORD *)&v2->_didBroadcastUploadContent = 0;
    *(_DWORD *)&v2->_currentlyBroadcastingWillSwitchToUser = 0;
    v5 = objc_opt_new();
    switchBlockingTasks = v2->_switchBlockingTasks;
    v2->_switchBlockingTasks = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    syncTasks = v2->_syncTasks;
    v2->_syncTasks = (NSMutableArray *)v7;

    v2->_willSwitchToUserAddedTaskCount = 0;
    v2->_interruptionRetryCount = 0;
    if ((sub_18FAE9DE8() & 1) == 0)
      sub_18FAEAFB4((uint64_t)v2);
  }
  return v2;
}

- (void)registerUserSwitchStakeHolder:(id)a3
{
  objc_msgSend_registerUserSwitchStakeHolder_completionHandler_(self, a2, (uint64_t)a3, 0);
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sub_18FAE8D1C();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAF9A28;
  v11[3] = &unk_1E2A4AC90;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAE8D1C();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAF9BC4;
  v7[3] = &unk_1E2A4ACB8;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UMXPCServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sub_18FAE8D1C();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAF9CA4;
  v11[3] = &unk_1E2A4ACE0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  sub_18FAE8D1C();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18FAF9EB4;
  v13[3] = &unk_1E2A4AD08;
  v15 = v9;
  v16 = a4;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  sub_18FAEBEE8((uint64_t)v10, self, v13);

}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_switchToLoginUserWithError_completionHandler_, 0);
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  sub_18FAE8D1C();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18FAFA0B0;
  v8[3] = &unk_1E2A4AD30;
  v9 = v5;
  v7 = v5;
  sub_18FAEBEE8((uint64_t)v6, self, v8);

}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAE8D1C();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFA1B8;
  v7[3] = &unk_1E2A4AD30;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  sub_18FAE8D1C();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18FAFA364;
  v23[3] = &unk_1E2A4AD58;
  v24 = v14;
  v25 = v12;
  v26 = v13;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  sub_18FAEBEE8((uint64_t)v17, self, v23);

}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  sub_18FAE8D1C();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18FAFA59C;
  v23[3] = &unk_1E2A4AD58;
  v24 = v14;
  v25 = v12;
  v26 = v13;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  sub_18FAEBEE8((uint64_t)v17, self, v23);

}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAE8D1C();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFA710;
  v7[3] = &unk_1E2A4AD30;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAE8D1C();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFA818;
  v7[3] = &unk_1E2A4AD30;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)resumeQuotas
{
  id v3;

  sub_18FAE8D1C();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4A728);

}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAE8D1C();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFA9B4;
  v7[3] = &unk_1E2A4AD30;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)resumeSync
{
  id v3;

  sub_18FAE8D1C();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4AD98);

}

- (void)userInteractionIsEnabled
{
  const char *v2;
  uint64_t v3;
  id v4;

  if (self)
    self = (UMXPCServer *)self->_xpcConnection;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(self, a2, (uint64_t)&unk_1E2A4ADD8);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginComplete(v4, v2, v3);

}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UMXPCServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sub_18FAEBD08();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAFD954;
  v11[3] = &unk_1E2A4B198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UMXPCServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  sub_18FAEBD08();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAFDBD0;
  v11[3] = &unk_1E2A4B198;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sub_18FAEBD08();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18FAFDDD8;
  v11[3] = &unk_1E2A4B1C0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  sub_18FAEBEE8((uint64_t)v8, self, v11);

}

- (void)userSwitchTaskListDidUpdate
{
  id WeakRetained;
  char v4;
  void *v5;
  _QWORD v6[5];

  if (self)
    WeakRetained = objc_loadWeakRetained(&self->_stakeholder);
  else
    WeakRetained = 0;
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    sub_18FAE8D1C();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18FAFDF4C;
    v6[3] = &unk_1E2A4ACB8;
    v6[4] = self;
    sub_18FAEBEE8((uint64_t)v5, self, v6);

  }
}

- (void)deviceLoginSessionStateDidUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_18FAEA1C0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v2, CFSTR("Update LoginSession Type Cache"), v3, v4, v5, v6, v7, v8, v9);

  sub_18FAF1B44();
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFE424;
  v7[3] = &unk_1E2A4AD30;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)bubbleDidPop
{
  id v3;

  sub_18FAEBD08();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAEBEE8((uint64_t)v3, self, &unk_1E2A4A828);

}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFE880;
  v7[3] = &unk_1E2A4B1C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sub_18FAEBD08();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_18FAFEA38;
  v7[3] = &unk_1E2A4B1C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  sub_18FAEBEE8((uint64_t)v5, self, v7);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;

  v5 = a4;
  sub_18FAE9AB8();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18FAE71DC((uint64_t)v6, CFSTR("Should accept connection"), v7, v8, v9, v10, v11, v12, v23);

  v13 = sub_18FAF6CF0(v5, CFSTR("com.apple.mobile.keybagd.bubbled.sync"));
  if ((v13 & 1) != 0)
  {
    sub_18FAE8D1C();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_18FAFEC50;
    v25[3] = &unk_1E2A4ACB8;
    v26 = v5;
    sub_18FAEBEE8((uint64_t)v14, self, v25);

  }
  else
  {
    sub_18FAEA1C0();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18FAE71DC((uint64_t)v15, CFSTR("Connection does not have entitlement"), v16, v17, v18, v19, v20, v21, v24);

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_personaUpdateCallbackStakeholder);
  objc_storeStrong(&self->_personaRegistrationCompletionHandler, 0);
  objc_destroyWeak(&self->_personaStakeholder);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_syncConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_bubblePopHandler, 0);
  objc_storeStrong((id *)&self->_syncTasks, 0);
  objc_storeStrong((id *)&self->_switchBlockingTasks, 0);
  objc_storeStrong(&self->_willSwitchCompletionHandler, 0);
  objc_storeStrong(&self->_uploadContentCompletionHandler, 0);
  objc_storeStrong(&self->_loginUICheckinSessionCompletionHandler, 0);
  objc_storeStrong(&self->_logoutToLoginSessionCompletionHandler, 0);
  objc_storeStrong(&self->_directSwitchCompletionHandler, 0);
  objc_storeStrong(&self->_suspendQuotasCompletionHandler, 0);
  objc_storeStrong(&self->_switchCompletionHandler, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong(&self->_provisionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_provisionDict, 0);
  objc_storeStrong((id *)&self->_personaProfileDict, 0);
  objc_storeStrong((id *)&self->_preferencesDict, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_passcodeData, 0);
  objc_storeStrong((id *)&self->_personaSpec, 0);
  objc_storeStrong((id *)&self->_unregistrationReason, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak(&self->_stakeholder);
  objc_storeStrong((id *)&self->_se, 0);
}

@end
