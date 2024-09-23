@implementation NCBulletinActionRunner

- (NCBulletinActionRunner)initWithAction:(id)a3 bulletin:(id)a4 observer:(id)a5
{
  id v9;
  id v10;
  id v11;
  NCBulletinActionRunner *v12;
  NCBulletinActionRunner *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NCBulletinActionRunner;
  v12 = -[NCBulletinActionRunner init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_observer, a5);
    objc_storeStrong((id *)&v13->_bulletin, a4);
    objc_storeStrong((id *)&v13->_action, a3);
    *(_WORD *)&v13->_shouldForwardAction = 1;
  }

  return v13;
}

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  NCBulletinActionRunner *v17;
  NSObject *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BBObserver *observer;
  void *v30;
  _QWORD v31[4];
  __CFString *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t v42;
  __CFString *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v17 = self;
  objc_sync_enter(v17);
  if (objc_msgSend(v12, "isSiriAction"))
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke;
    v40[3] = &unk_1E8D1B170;
    v41 = v16;
    -[NCBulletinActionRunner executeSiriAction:completion:](v17, "executeSiriAction:completion:", v12, v40);
    v18 = v41;
  }
  else
  {
    v19 = (id *)MEMORY[0x1E0DC5F70];
    if (v17->_responseWasSent)
    {
      v18 = (id)*MEMORY[0x1E0DC5F70];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCBulletinActionRunner executeAction:fromOrigin:endpoint:withParameters:completion:].cold.1(v20, (uint64_t)v13, buf, v18);
      }
    }
    else
    {
      v17->_responseWasSent = 1;
      v21 = *v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "identifier");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = -[__CFString count](v15, "count");
        v24 = CFSTR("{}");
        *(_DWORD *)buf = 138543875;
        v45 = v22;
        if (v23)
          v24 = v15;
        v46 = 2114;
        v47 = v13;
        v48 = 2113;
        v49 = v24;
        _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "Sending response for action %{public}@ from origin %{public}@ with parameters %{private}@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17->_bulletin);
      v18 = objc_claimAutoreleasedReturnValue();
      -[BBBulletin sectionID](v17->_bulletin, "sectionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBulletinActionRunner bulletin](v17, "bulletin");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCBulletinActionRunner action](v17, "action");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "responseForAction:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27 && v17->_shouldForwardAction)
      {
        if (v15)
        {
          v42 = *MEMORY[0x1E0D036E8];
          v43 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setContext:", v28);
          objc_msgSend(v27, "setOriginID:", v13);
          objc_msgSend(v27, "setEndpoint:", v14);

        }
        objc_initWeak((id *)buf, v17->_observer);
        objc_initWeak(&location, v17);
        observer = v17->_observer;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke_5;
        v31[3] = &unk_1E8D1BF00;
        v32 = v15;
        v33 = v12;
        objc_copyWeak(&v37, (id *)buf);
        v34 = v18;
        v35 = v30;
        objc_copyWeak(&v38, &location);
        v36 = v16;
        -[BBObserver sendResponse:withCompletion:](observer, "sendResponse:withCompletion:", v27, v31);

        objc_destroyWeak(&v38);
        objc_destroyWeak(&v37);

        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else if (objc_msgSend(v12, "shouldDismissNotification"))
      {
        -[BBObserver clearBulletins:inSection:](v17->_observer, "clearBulletins:inSection:", v18, v30);
        if (v16)
          (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
      }
      else
      {
        -[NCBulletinActionRunner setResponseWasSent:](v17, "setResponseWasSent:", 0);
      }

    }
  }

  objc_sync_exit(v17);
}

uint64_t __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NCNotificationActionDeferClearForNotificationSummaryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;
  v7 = (void *)*MEMORY[0x1E0DC5F70];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F70], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 1024;
    v17 = a2;
    v18 = 1024;
    v19 = v6;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Running completion block for sendResponse for action %{public}@ with success=%d \t deferClearForNotificationSummary=%{BOOL}d", (uint8_t *)&v14, 0x18u);

  }
  if ((_DWORD)a2 && ((objc_msgSend(*(id *)(a1 + 40), "shouldDismissNotification") ^ 1 | v6) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "clearBulletins:inSection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v12, "setResponseWasSent:", 0);

  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, a2);

}

- (void)executeSiriAction:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D97828]);
  v7 = objc_alloc(MEMORY[0x1E0D97820]);
  -[NCBulletinActionRunner bulletin](self, "bulletin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithBBBulletin:", v8);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__NCBulletinActionRunner_executeSiriAction_completion___block_invoke;
  v11[3] = &unk_1E8D1B170;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v6, "activateWithContext:completion:", v9, v11);

}

uint64_t __55__NCBulletinActionRunner_executeSiriAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (BBAction)action
{
  return self->_action;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (BBObserver)observer
{
  return self->_observer;
}

- (BOOL)responseWasSent
{
  return self->_responseWasSent;
}

- (void)setResponseWasSent:(BOOL)a3
{
  self->_responseWasSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executeAction:(uint8_t *)buf fromOrigin:(os_log_t)log endpoint:withParameters:completion:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_ERROR, "Tried to send response for action %{public}@ more than once. origin: %{public}@", buf, 0x16u);

}

@end
