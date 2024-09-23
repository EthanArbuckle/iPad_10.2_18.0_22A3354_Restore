@implementation SFSystemService

- (SFSystemService)init
{
  SFSystemService *v2;
  SFSystemService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSystemService;
  v2 = -[SFSystemService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFSystemService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFSystemService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SFSystemService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__SFSystemService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.System"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("System"));
  -[SFService setPairSetupDisabled:](self->_sfService, "setPairSetupDisabled:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 33);
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SFSystemService__sfServiceStart__block_invoke;
  v7[3] = &unk_1E482FA30;
  v7[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __34__SFSystemService__sfServiceStart__block_invoke_2;
  v6[3] = &unk_1E482FA58;
  v6[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v6);
  -[SFService activateWithCompletion:](self->_sfService, "activateWithCompletion:", &__block_literal_global_68);
}

uint64_t __34__SFSystemService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

uint64_t __34__SFSystemService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", a2);
}

void __34__SFSystemService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_SFSystemService <= 60)
    {
      v6 = v2;
      if (gLogCategory_SFSystemService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_SFSystemService <= 30)
  {
    v6 = 0;
    if (gLogCategory_SFSystemService != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }

}

- (void)_handleSessionStarted:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__SFSystemService__handleSessionStarted___block_invoke;
  v18[3] = &unk_1E482E2D0;
  v18[4] = self;
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("_getSysInfo"), &unk_1E48916D8, v18);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __41__SFSystemService__handleSessionStarted___block_invoke_2;
  v16[3] = &unk_1E48346D0;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v6, "registerRequestID:options:handler:", CFSTR("_rebootSystem"), &unk_1E4891700, v16);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __41__SFSystemService__handleSessionStarted___block_invoke_3;
  v14[3] = &unk_1E48346D0;
  v14[4] = self;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v7, "registerRequestID:options:handler:", CFSTR("_profilesGet"), &unk_1E4891700, v14);

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __41__SFSystemService__handleSessionStarted___block_invoke_4;
  v12[3] = &unk_1E48346D0;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v8, "registerRequestID:options:handler:", CFSTR("_profileInstall"), &unk_1E4891700, v12);

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __41__SFSystemService__handleSessionStarted___block_invoke_5;
  v10[3] = &unk_1E48346D0;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v9, "registerRequestID:options:handler:", CFSTR("_profileRemove"), &unk_1E4891700, v10);

}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetSystemInfoRequest:responseHandler:");
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRebootSystemForSession:request:responseHandler:", *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProfilesGetForSession:request:responseHandler:", *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProfileInstallForSession:request:responseHandler:", *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t __41__SFSystemService__handleSessionStarted___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProfileRemoveForSession:request:responseHandler:", *(_QWORD *)(a1 + 40), a3, a4);
}

- (void)_handleGetSystemInfoRequest:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)GestaltCopyAnswer();
  if (v8)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("model"));
  }
  else if (gLogCategory_SFSystemService <= 60
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = (void *)GestaltCopyAnswer();

  if (v9)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("name"));
  }
  else if (gLogCategory_SFSystemService <= 60
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = (void *)GestaltCopyAnswer();

  if (v10)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("osBuild"));
  }
  else if (gLogCategory_SFSystemService <= 60
         && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v7);

}

- (void)_handleRebootSystemForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    v12 = v8;
    LogPrintF();
  }
  if (((objc_msgSend(v13, "sessionFlags", v12) & 0x40) != 0
     || (objc_msgSend(v13, "pairingContainsACL:", CFSTR("com.apple.admin")) & 1) != 0)
    && !reboot3())
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, MEMORY[0x1E0C9AA70]);
    v10 = dispatch_time(0, 2000000000);
    dispatch_after(v10, (dispatch_queue_t)self->_dispatchQueue, &__block_literal_global_134_0);
  }
  else
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFSystemService <= 60
      && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v11, 0, 0);

  }
}

uint64_t __73__SFSystemService__handleRebootSystemForSession_request_responseHandler___block_invoke()
{
  uint64_t result;

  result = reboot3();
  if (gLogCategory_SFSystemService <= 60)
  {
    if (gLogCategory_SFSystemService != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)_handleProfilesGetForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    v24 = v8;
    LogPrintF();
  }
  if ((objc_msgSend(v7, "sessionFlags", v24) & 0x40) != 0
    || objc_msgSend(v7, "pairingContainsACL:", CFSTR("com.apple.admin")))
  {
    v26 = v8;
    v27 = v7;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "installedProfilesWithFilterFlags:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v14)
      goto LABEL_30;
    v15 = v14;
    v16 = *(_QWORD *)v29;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19
          && gLogCategory_SFSystemService <= 60
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(v18, "friendlyName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 || (objc_msgSend(v18, "displayName"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("name"));

          if (!v19)
            goto LABEL_21;
LABEL_20:
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("id"), v25);
          goto LABEL_21;
        }
        if (gLogCategory_SFSystemService <= 60
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          v25 = v19;
          LogPrintF();
        }
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (v19)
          goto LABEL_20;
LABEL_21:
        objc_msgSend(v10, "addObject:", v21, v25);

        ++v17;
      }
      while (v15 != v17);
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v15 = v22;
      if (!v22)
      {
LABEL_30:

        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, CFSTR("profiles"));
        v8 = v26;
        v7 = v27;
LABEL_31:
        if (gLogCategory_SFSystemService <= 30
          && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v23);

        goto LABEL_36;
      }
    }
  }
  NSErrorWithOSStatusF();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v23 = 0;
    v13 = 0;
    goto LABEL_31;
  }
  if (gLogCategory_SFSystemService <= 60
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v10, 0, 0);
LABEL_36:

}

- (void)_handleProfileInstallForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18[2];
  int v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    v17 = v8;
    LogPrintF();
  }
  v19 = 0;
  if ((objc_msgSend(v7, "sessionFlags", v17) & 0x40) == 0
    && (objc_msgSend(v7, "pairingContainsACL:", CFSTR("com.apple.admin")) & 1) == 0)
  {
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_21;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v11 = 0;
    goto LABEL_23;
  }
  v18[1] = 0;
  NSDataDecompress();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (!v11)
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(v13, "installProfileData:options:outError:", v11, 0, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18[0];

  if (!v14)
  {
    if (v15)
    {
      v16 = 0;
      v14 = 0;
LABEL_12:
      if (gLogCategory_SFSystemService <= 60
        && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v15, 0, 0);

      goto LABEL_29;
    }
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v14 = 0;
    v16 = 0;
    if (v12)
      goto LABEL_11;
    goto LABEL_24;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("id"));
  v12 = v15;
  if (v15)
  {
LABEL_11:
    v15 = v12;
    goto LABEL_12;
  }
LABEL_24:
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v16);
LABEL_29:

}

- (void)_handleProfileRemoveForSession:(id)a3 request:(id)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogCategory_SFSystemService <= 30
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    v13 = v8;
    LogPrintF();
  }
  if ((objc_msgSend(v7, "sessionFlags", v13) & 0x40) != 0
    || (objc_msgSend(v7, "pairingContainsACL:", CFSTR("com.apple.admin")) & 1) != 0)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeProfileWithIdentifier:", v11);

      goto LABEL_9;
    }
  }
  NSErrorWithOSStatusF();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_9:
    if (gLogCategory_SFSystemService <= 30
      && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, MEMORY[0x1E0C9AA70]);
    goto LABEL_14;
  }
  if (gLogCategory_SFSystemService <= 60
    && (gLogCategory_SFSystemService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v11, 0, 0);
LABEL_14:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
