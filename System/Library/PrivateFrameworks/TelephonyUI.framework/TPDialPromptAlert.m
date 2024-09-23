@implementation TPDialPromptAlert

- (TPDialPromptAlert)initWithDialRequest:(id)a3 dialAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BSProcessHandle *v17;
  BSProcessHandle *processHandle;
  TPDialPromptAlert *v19;

  v6 = a3;
  v7 = a4;
  TelephonyUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CALL"), &stru_1E75FDD38, CFSTR("General"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isFaceTimeProvider"))
    v11 = objc_msgSend(v6, "isVideo");
  else
    v11 = 0;

  objc_msgSend(v6, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  v13 = v12;
  if (objc_msgSend(v12, "type") != 2
    || (TUDialAssistedDialRequest(),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "handle"),
        v15 = objc_claimAutoreleasedReturnValue(),
        v13,
        v14,
        (v13 = (void *)v15) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "processHandle");
  v17 = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();
  processHandle = self->_processHandle;
  self->_processHandle = v17;

  v19 = -[TPDialPromptAlert initWithButtonTitle:handles:isFaceTimeRequest:dialAction:](self, "initWithButtonTitle:handles:isFaceTimeRequest:dialAction:", v9, v16, v11, v7);
  return v19;
}

- (TPDialPromptAlert)initWithJoinRequest:(id)a3 dialAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TPDialPromptAlert *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v6, "remoteMembers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "remoteMembers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "handles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "anyObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  TelephonyUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CALL"), &stru_1E75FDD38, CFSTR("General"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[TPDialPromptAlert initWithButtonTitle:handles:isFaceTimeRequest:dialAction:](self, "initWithButtonTitle:handles:isFaceTimeRequest:dialAction:", v19, v10, 1, v7);

  return v20;
}

- (TPDialPromptAlert)initWithButtonTitle:(id)a3 handles:(id)a4 isFaceTimeRequest:(BOOL)a5 dialAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  TPDialPromptAlert *v13;
  uint64_t v14;
  NSString *buttonTitle;
  uint64_t v16;
  NSSet *handles;
  void *v18;
  id dialAction;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)TPDialPromptAlert;
  v13 = -[TPDialPromptAlert init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    buttonTitle = v13->_buttonTitle;
    v13->_buttonTitle = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    handles = v13->_handles;
    v13->_handles = (NSSet *)v16;

    v18 = _Block_copy(v12);
    dialAction = v13->_dialAction;
    v13->_dialAction = v18;

    v13->_isFaceTimeRequest = a5;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)TPDialPromptAlert;
  -[TPAlert dealloc](&v5, sel_dealloc);
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPDialPromptAlert handles](self, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TPDialPromptAlert handles](self, "handles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type");
        if (v12 == 1 || v12 == 3)
        {
          objc_msgSend(v11, "value");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (v12 == 2)
        {
          objc_msgSend(v11, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          TUNetworkCountryCode();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            TUHomeCountryCode();
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v18;

          v20 = PNCreateFormattedStringWithCountry();
          v21 = (void *)v20;
          if (v20)
            v22 = (void *)v20;
          else
            v22 = v15;
          v14 = v22;

        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  TelephonyUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("COMMA"), &stru_1E75FDD38, CFSTR("General"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)invalidate
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  TPDialPromptAlert *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TPDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1BCFA3000, v3, OS_LOG_TYPE_DEFAULT, "invalidating alert: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)TPDialPromptAlert;
  -[TPAlert invalidate](&v4, sel_invalidate);
}

- (void)show
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  -[TPDialPromptAlert phoneNumberHandle](self, "phoneNumberHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !TUCurrentProcessHasEntitlement())
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 1 || _MKBGetDeviceLockState() == 1)
  {

LABEL_6:
    v28.receiver = self;
    v28.super_class = (Class)TPDialPromptAlert;
    -[TPAlert show](&v28, sel_show);
    goto LABEL_7;
  }
  v5 = _MKBGetDeviceLockState();

  if (v5 == 2)
    goto LABEL_6;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.BusinessChatViewService"), CFSTR("BCChatSuggestRemoteViewController"));
  v7 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  v8 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  -[TPDialPromptAlert title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v10, 2);

  -[TPDialPromptAlert defaultButtonTitle](self, "defaultButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v11, 3);

  -[TPDialPromptAlert otherButtonTitle](self, "otherButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v12, 4);

  v13 = objc_alloc(MEMORY[0x1E0D01698]);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __25__TPDialPromptAlert_show__block_invoke;
  v29[3] = &unk_1E75FD280;
  v29[4] = self;
  v14 = (void *)objc_msgSend(v13, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v8, MEMORY[0x1E0C80D38], v29, 0.0);
  -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unregisterObserver:", self);

    -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invalidate");

  }
  v18 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v6, v7);
  -[TPDialPromptAlert setRemoteAlertHandle:](self, "setRemoteAlertHandle:", v18);

  -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerObserver:", self);

  v20 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActions:", v21);

  objc_msgSend(v3, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUserInfo:", v22);

  objc_msgSend(v20, "setReason:", CFSTR("Confirmaiton Alert"));
  -[TPDialPromptAlert processHandle](self, "processHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0DAAFA8]);
    -[TPDialPromptAlert processHandle](self, "processHandle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithTargetProcess:", v25);
    objc_msgSend(v20, "setPresentationTarget:", v26);

  }
  -[TPDialPromptAlert remoteAlertHandle](self, "remoteAlertHandle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateWithContext:", v20);

LABEL_7:
}

void __25__TPDialPromptAlert_show__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 10);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("Call"));
  v5 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v5, "defaultResponse");
  else
    objc_msgSend(v5, "otherResponse");

}

- (id)otherButtonTitle
{
  void *v2;
  void *v3;

  TelephonyUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E75FDD38, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)defaultResponse
{
  void *v3;
  void (**v4)(id, uint64_t);

  -[TPDialPromptAlert dialAction](self, "dialAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPDialPromptAlert dialAction](self, "dialAction");
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

  }
}

- (void)otherResponse
{
  void *v3;
  void (**v4)(id, _QWORD);

  -[TPDialPromptAlert dialAction](self, "dialAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPDialPromptAlert dialAction](self, "dialAction");
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

- (id)phoneNumberHandle
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TPDialPromptAlert handles](self, "handles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type") == 2)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  TPDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BCFA3000, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  TPDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCFA3000, v4, OS_LOG_TYPE_DEFAULT, "Remote alert deactivated", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__TPDialPromptAlert_remoteAlertHandleDidDeactivate___block_invoke;
  block[3] = &unk_1E75FD2A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__TPDialPromptAlert_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "otherResponse");
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  TPDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1BCFA3000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Remote alert invalidated with error %@", (uint8_t *)&v6, 0xCu);
  }

}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, a3);
}

- (id)dialAction
{
  return self->_dialAction;
}

- (void)setDialAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSSet)handles
{
  return self->_handles;
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (BOOL)isFaceTimeRequest
{
  return self->_isFaceTimeRequest;
}

- (void)setIsFaceTimeRequest:(BOOL)a3
{
  self->_isFaceTimeRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_dialAction, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end
