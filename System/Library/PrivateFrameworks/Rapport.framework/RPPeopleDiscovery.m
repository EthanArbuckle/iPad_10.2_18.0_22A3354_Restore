@implementation RPPeopleDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPeopleDiscovery)init
{
  RPPeopleDiscovery *v2;
  RPPeopleDiscovery *v3;
  RPPeopleDiscovery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPPeopleDiscovery;
  v2 = -[RPPeopleDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (RPPeopleDiscovery)initWithCoder:(id)a3
{
  id v4;
  RPPeopleDiscovery *v5;
  RPPeopleDiscovery *v6;
  RPPeopleDiscovery *v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPPeopleDiscovery;
  v5 = -[RPPeopleDiscovery init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_changeFlags = v10;
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_discoveryFlags = v10;
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_discoveryMode = v10;
    objc_opt_class();
    NSDecodeNSSetOfClassIfPresent();
    v10 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_scanRate = v10;
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t changeFlags;
  uint64_t discoveryFlags;
  uint64_t discoveryMode;
  NSMutableSet *rangingPersonIDs;
  uint64_t scanRate;
  id v10;

  v4 = a3;
  changeFlags = self->_changeFlags;
  v10 = v4;
  if ((_DWORD)changeFlags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", changeFlags, CFSTR("cf"));
    v4 = v10;
  }
  discoveryFlags = self->_discoveryFlags;
  if ((_DWORD)discoveryFlags)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", discoveryFlags, CFSTR("df"));
    v4 = v10;
  }
  discoveryMode = self->_discoveryMode;
  if ((_DWORD)discoveryMode)
  {
    objc_msgSend(v10, "encodeInteger:forKey:", discoveryMode, CFSTR("dm"));
    v4 = v10;
  }
  rangingPersonIDs = self->_rangingPersonIDs;
  if (rangingPersonIDs)
  {
    objc_msgSend(v10, "encodeObject:forKey:", rangingPersonIDs, CFSTR("rpi"));
    v4 = v10;
  }
  scanRate = self->_scanRate;
  if ((_DWORD)scanRate)
  {
    objc_msgSend(v10, "encodeInt64:forKey:", scanRate, CFSTR("scr"));
    v4 = v10;
  }

}

- (id)description
{
  return -[RPPeopleDiscovery descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  int discoveryMode;
  const char *v6;
  id *v7;
  uint64_t v8;
  int peopleDensity;
  char *v10;
  id *v11;
  int v12;
  NSMutableDictionary *discoveredPeople;
  id v14;
  const char *v16;
  uint64_t v17;
  uint64_t discoveryFlags;
  char *v19;
  uint64_t changeFlags;
  _QWORD v21[5];
  int v22;
  id v23;
  id obj;
  id v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = (id *)&v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v25 = 0;
  discoveryMode = self->_discoveryMode;
  if (discoveryMode > 199)
  {
    if (discoveryMode == 200)
    {
      v6 = "MyMeDevices";
      goto LABEL_11;
    }
    if (discoveryMode == 400)
    {
      v6 = "Contacts";
      goto LABEL_11;
    }
LABEL_8:
    v6 = "?";
    goto LABEL_11;
  }
  if (!discoveryMode)
  {
    v6 = "~";
    goto LABEL_11;
  }
  if (discoveryMode != 1)
    goto LABEL_8;
  v6 = "PTS";
LABEL_11:
  changeFlags = self->_changeFlags;
  discoveryFlags = self->_discoveryFlags;
  v16 = v6;
  NSAppendPrintF();
  objc_storeStrong(&v31, v25);
  if (a3 <= 30)
  {
    v7 = v27 + 5;
    obj = v27[5];
    v8 = -[NSMutableDictionary count](self->_discoveredPeople, "count", v16, discoveryFlags, &unk_1AF307918, changeFlags, &unk_1AF307987);
    peopleDensity = self->_peopleDensity;
    if (peopleDensity < 1)
    {
      v10 = "None";
    }
    else if (peopleDensity >= 0xB)
    {
      v10 = peopleDensity >= 0x33 ? "High" : "Med";
    }
    else
    {
      v10 = "Low";
    }
    v17 = v8;
    v19 = v10;
    NSAppendPrintF();
    objc_storeStrong(v7, obj);
    if (a3 <= 20)
    {
      v11 = v27;
      v23 = v27[5];
      NSAppendPrintF();
      objc_storeStrong(v11 + 5, v23);
      if (a3 >= 11)
        v12 = 50;
      else
        v12 = 30;
      discoveredPeople = self->_discoveredPeople;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke;
      v21[3] = &unk_1E5F509B8;
      v21[4] = &v26;
      v22 = v12;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveredPeople, "enumerateKeysAndObjectsUsingBlock:", v21, v17, v19);
    }
  }
  v14 = v27[5];
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  CUDescriptionWithLevel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);

}

- (void)setDiscoveryFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke;
  v3[3] = &unk_1E5F4F450;
  v3[4] = self;
  v4 = a3;
  -[RPPeopleDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __39__RPPeopleDiscovery_setDiscoveryFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 64) = *(_DWORD *)(result + 40);
  return result;
}

- (void)setRangingPeople:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  RPPeopleDiscovery *v12;
  NSMutableSet *rangingPersonIDs;
  NSMutableSet *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  char v17;
  NSObject *dispatchQueue;
  _QWORD block[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  if (v5)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  else
    v6 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v12 = self;
  objc_sync_enter(v12);
  rangingPersonIDs = v12->_rangingPersonIDs;
  v14 = (NSMutableSet *)v6;
  v15 = rangingPersonIDs;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    if ((v14 == 0) != (v15 != 0))
    {
      v17 = -[NSMutableSet isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

    }
    objc_storeStrong((id *)&v12->_rangingPeople, v5);
    objc_storeStrong((id *)&v12->_rangingPersonIDs, v6);
    if (v12->_activateCalled)
    {
      dispatchQueue = v12->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__RPPeopleDiscovery_setRangingPeople___block_invoke;
      block[3] = &unk_1E5F4EC60;
      block[4] = v12;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_19:
  objc_sync_exit(v12);

}

void __38__RPPeopleDiscovery_setRangingPeople___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcPeopleDiscoveryUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)setScanRate:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__RPPeopleDiscovery_setScanRate___block_invoke;
  v3[3] = &unk_1E5F4F450;
  v3[4] = self;
  v4 = a3;
  -[RPPeopleDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __33__RPPeopleDiscovery_setScanRate___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 76) = *(_DWORD *)(result + 40);
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  RPPeopleDiscovery *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__RPPeopleDiscovery_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5F4ED70;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __44__RPPeopleDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_7;
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 30
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
LABEL_7:
    if (self->_targetUserSession)
      v7 = "(TargetUserSession)";
    else
      v7 = "";
    v12 = v7;
    LogPrintF();
  }
  if (-[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted", v12))
  {
    xpcCnx = self->_xpcCnx;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke;
    v16[3] = &unk_1E5F4F478;
    v18 = v4;
    v16[4] = self;
    v10 = v6;
    v17 = v10;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2;
    v13[3] = &unk_1E5F509E0;
    v15 = v4;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v11, "xpcPeopleDiscoveryActivate:completion:", self, v13);

  }
  else
  {
    -[RPPeopleDiscovery _scheduleRetry](self, "_scheduleRetry");
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v5 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      v4 = v5;
      LogPrintF();
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 90
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry", v4);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

void __56__RPPeopleDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v29 = v5;
  if (!v6)
  {
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          if (!v12)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v14 = *(_QWORD *)(a1 + 32);
            v15 = *(void **)(v14 + 16);
            *(_QWORD *)(v14 + 16) = v13;

            v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          }
          objc_msgSend(v11, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v16);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }

    v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    objc_sync_exit(obj);

    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_RPPeopleDiscovery > 30
        || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_37;
      }
    }
    else if (gLogCategory_RPPeopleDiscovery > 30
           || gLogCategory_RPPeopleDiscovery == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_37;
    }
    objc_msgSend(v7, "count");
    LogPrintF();
LABEL_37:
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
    v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
    if (v22)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v23 = v7;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v23);
            v22[2](v22, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v24);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_updatePeopleDensity:", v17);
    goto LABEL_49;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      v27 = v6;
      LogPrintF();
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 90
         && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "code", v27) == -71168)
  {
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
    {
      v19 = *(void (**)(void))(v18 + 16);
LABEL_33:
      v19();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry");
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
    {
      v19 = *(void (**)(void))(v20 + 16);
      goto LABEL_33;
    }
  }
LABEL_49:

}

- (BOOL)_ensureXPCStarted
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSXPCConnection *v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  _QWORD v13[5];

  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AC98);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_xpcPeopleDiscoveryActivate_completion_, 0, 1);

    v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.people"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v7;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE44760);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v3);
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke;
    v13[3] = &unk_1E5F4EC60;
    v13[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v13);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2;
    v12[3] = &unk_1E5F4EC60;
    v12[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPPeopleDiscovery <= 10
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  return 1;
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __38__RPPeopleDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
  }
  else
  {
    if (gLogCategory_RPPeopleDiscovery <= 90
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleRetry");
  }
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  RPPeopleDiscovery *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E5F4F4C8;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

void __46__RPPeopleDiscovery__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcPeopleDiscoveryUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPPeopleDiscovery <= 50
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPPeopleDiscovery _lostAllPeople](self, "_lostAllPeople");
  if (self->_activateCalled)
    -[RPPeopleDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__RPPeopleDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__RPPeopleDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(_QWORD *)(v2 + 32) + 40);
    if (v3)
    {
      v4 = v3;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(v2 + 32);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 48), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  id interruptionHandler;
  id v8;
  id peopleDensityChangedHandler;
  id personFoundHandler;
  id personLostHandler;
  id personChangedHandler;
  id statusChangedHandler;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v5 = retryTimer;
      dispatch_source_cancel(v5);
      v6 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    peopleDensityChangedHandler = self->_peopleDensityChangedHandler;
    self->_peopleDensityChangedHandler = 0;

    personFoundHandler = self->_personFoundHandler;
    self->_personFoundHandler = 0;

    personLostHandler = self->_personLostHandler;
    self->_personLostHandler = 0;

    personChangedHandler = self->_personChangedHandler;
    self->_personChangedHandler = 0;

    statusChangedHandler = self->_statusChangedHandler;
    self->_statusChangedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_scheduleRetry
{
  OS_dispatch_source *v3;
  OS_dispatch_source *retryTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_invalidateCalled && !self->_retryTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    retryTimer = self->_retryTimer;
    self->_retryTimer = v3;

    v5 = self->_retryTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __35__RPPeopleDiscovery__scheduleRetry__block_invoke;
    handler[3] = &unk_1E5F4EC60;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }
}

_BYTE *__35__RPPeopleDiscovery__scheduleRetry__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _BYTE *result;

  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_activateWithCompletion:reactivate:", 0, 1);
  return result;
}

- (NSArray)discoveredPeople
{
  RPPeopleDiscovery *v2;
  NSMutableDictionary *discoveredPeople;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)_lostAllPeople
{
  id personLostHandler;
  NSMutableDictionary *discoveredPeople;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (**v10)(id, _QWORD);
  RPPeopleDiscovery *obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  personLostHandler = self->_personLostHandler;
  obj = self;
  objc_sync_enter(obj);
  discoveredPeople = obj->_discoveredPeople;
  if (personLostHandler)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_discoveredPeople, "removeAllObjects");
    objc_sync_exit(obj);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = (void (**)(id, _QWORD))self->_personLostHandler;
          if (v10)
            v10[2](v10, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](discoveredPeople, "removeAllObjects");
    objc_sync_exit(obj);

  }
}

- (void)_updatePeopleDensity:(unint64_t)a3
{
  int v3;
  int v4;
  int v5;
  int peopleDensity;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  id v10;

  if (a3 >= 0x1E)
    v3 = 90;
  else
    v3 = 50;
  if (a3 >= 5)
    v4 = v3;
  else
    v4 = 10;
  if (a3)
    v5 = v4;
  else
    v5 = 0;
  peopleDensity = self->_peopleDensity;
  if (v5 != peopleDensity)
  {
    if (gLogCategory_RPPeopleDiscovery <= 30
      && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_peopleDensity = v5;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_peopleDensityChangedHandler);
    if (v8)
    {
      v10 = v8;
      v8[2](v8, v9);
      v8 = (void (**)(_QWORD, _QWORD))v10;
    }

  }
}

- (void)xpcPeopleStatusChanged:(unsigned int)a3
{
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPPeopleDiscovery <= 30
    && (gLogCategory_RPPeopleDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_statusFlags = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_statusChangedHandler);
  if (v5)
  {
    v9 = v5;
    v5[2](v5, v6, v7, v8);
    v5 = v9;
  }

}

- (void)xpcPersonFound:(id)a3
{
  RPPeopleDiscovery *v4;
  void *v5;
  NSMutableDictionary *discoveredPeople;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void (**personFoundHandler)(id, id);
  id v12;

  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  v5 = v12;
  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = v4->_discoveredPeople;
    v4->_discoveredPeople = v7;

    discoveredPeople = v4->_discoveredPeople;
    v5 = v12;
  }
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v12, v9);

  v10 = -[NSMutableDictionary count](v4->_discoveredPeople, "count");
  objc_sync_exit(v4);

  personFoundHandler = (void (**)(id, id))v4->_personFoundHandler;
  if (personFoundHandler)
    personFoundHandler[2](personFoundHandler, v12);
  -[RPPeopleDiscovery _updatePeopleDensity:](v4, "_updatePeopleDensity:", v10);

}

- (void)xpcPersonLost:(id)a3
{
  RPPeopleDiscovery *v4;
  NSMutableDictionary *discoveredPeople;
  void *v6;
  uint64_t v7;
  void (**personLostHandler)(id, id);
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  discoveredPeople = v4->_discoveredPeople;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", 0, v6);

  v7 = -[NSMutableDictionary count](v4->_discoveredPeople, "count");
  objc_sync_exit(v4);

  personLostHandler = (void (**)(id, id))v4->_personLostHandler;
  if (personLostHandler)
    personLostHandler[2](personLostHandler, v9);
  -[RPPeopleDiscovery _updatePeopleDensity:](v4, "_updatePeopleDensity:", v7);

}

- (void)xpcPersonChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  RPPeopleDiscovery *v6;
  NSMutableDictionary *discoveredPeople;
  void *v8;
  void (**personChangedHandler)(id, id, _QWORD);
  id v10;

  v4 = *(_QWORD *)&a4;
  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self;
  objc_sync_enter(v6);
  discoveredPeople = v6->_discoveredPeople;
  objc_msgSend(v10, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v10, v8);

  objc_sync_exit(v6);
  personChangedHandler = (void (**)(id, id, _QWORD))v6->_personChangedHandler;
  if (personChangedHandler)
    personChangedHandler[2](personChangedHandler, v10, v4);

}

- (void)xpcPersonID:(id)a3 deviceID:(id)a4 updatedMeasurement:(id)a5
{
  id v8;
  id v9;
  RPPeopleDiscovery *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = a5;
  v10 = self;
  objc_sync_enter(v10);
  v22 = v8;
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_discoveredPeople, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_11;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v11, "devices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v14)
  {
LABEL_10:

LABEL_11:
    objc_sync_exit(v10);
    goto LABEL_12;
  }
  v15 = *(_QWORD *)v25;
LABEL_4:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v15)
      objc_enumerationMutation(v13);
    v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v16);
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v9);

    if ((v19 & 1) != 0)
      break;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  objc_msgSend(v17, "setRelativeLocation:", v23);

  v20 = (v10->_changeFlags & 8) == 0;
  objc_sync_exit(v10);

  if (v20)
    goto LABEL_13;
  v21 = MEMORY[0x1AF45BE48](v10->_personChangedHandler);
  v10 = (RPPeopleDiscovery *)v21;
  if (v21)
    (*(void (**)(uint64_t, void *, uint64_t))(v21 + 16))(v21, v12, 8);
LABEL_12:

LABEL_13:
}

- (void)addAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke;
  v17[3] = &unk_1E5F4ED20;
  v10 = v7;
  v18 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2;
  v14[3] = &unk_1E5F4F3E8;
  v15 = v6;
  v16 = v10;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v11, "xpcPeopleAddAppleID:completion:", v13, v14);

}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __43__RPPeopleDiscovery_addAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

- (void)removeAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[RPPeopleDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke;
  v17[3] = &unk_1E5F4ED20;
  v10 = v7;
  v18 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2;
  v14[3] = &unk_1E5F4F3E8;
  v15 = v6;
  v16 = v10;
  v12 = v10;
  v13 = v6;
  objc_msgSend(v11, "xpcPeopleRemoveAppleID:completion:", v13, v14);

}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_RPPeopleDiscovery <= 90)
  {
    if (gLogCategory_RPPeopleDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __46__RPPeopleDiscovery_removeAppleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    if (gLogCategory_RPPeopleDiscovery <= 90)
    {
      if (gLogCategory_RPPeopleDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPPeopleDiscovery <= 40)
  {
    if (gLogCategory_RPPeopleDiscovery != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)discoveryFlags
{
  return self->_discoveryFlags;
}

- (int)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int)a3
{
  self->_discoveryMode = a3;
}

- (int)peopleDensity
{
  return self->_peopleDensity;
}

- (id)peopleDensityChangedHandler
{
  return self->_peopleDensityChangedHandler;
}

- (void)setPeopleDensityChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)personFoundHandler
{
  return self->_personFoundHandler;
}

- (void)setPersonFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)personLostHandler
{
  return self->_personLostHandler;
}

- (void)setPersonLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSSet)rangingPeople
{
  return self->_rangingPeople;
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_rangingPeople, 0);
  objc_storeStrong(&self->_personChangedHandler, 0);
  objc_storeStrong(&self->_personLostHandler, 0);
  objc_storeStrong(&self->_personFoundHandler, 0);
  objc_storeStrong(&self->_peopleDensityChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_rangingPersonIDs, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
}

@end
