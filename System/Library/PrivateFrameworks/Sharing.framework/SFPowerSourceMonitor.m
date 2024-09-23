@implementation SFPowerSourceMonitor

- (void)_triggerUpdatePowerSources
{
  int var0;
  CUCoalescer *v4;
  CUCoalescer *updateCoalescer;
  int v6;
  uint64_t v7;
  CFTypeRef cf;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_skipCoalescing)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[SFPowerSourceMonitor _updatePowerSources](self, "_updatePowerSources");
  }
  else
  {
    if (!self->_updateCoalescer)
    {
      v4 = (CUCoalescer *)objc_alloc_init(MEMORY[0x1E0D1B350]);
      updateCoalescer = self->_updateCoalescer;
      self->_updateCoalescer = v4;

      -[CUCoalescer setDispatchQueue:](self->_updateCoalescer, "setDispatchQueue:", self->_dispatchQueue);
      -[CUCoalescer setMaxDelay:](self->_updateCoalescer, "setMaxDelay:", 0.05);
      -[CUCoalescer setMinDelay:](self->_updateCoalescer, "setMinDelay:", 0.03);
      location = 0;
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__SFPowerSourceMonitor__triggerUpdatePowerSources__block_invoke;
      v9[3] = &unk_1E482E2A8;
      objc_copyWeak(&v10, &location);
      -[CUCoalescer setActionHandler:](self->_updateCoalescer, "setActionHandler:", v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    location = 0;
    v7 = 0;
    cf = 0;
    if (-[SFPowerSourceMonitor powerSourcesListWithOutInfo:outSources:outSourcesCount:](self, "powerSourcesListWithOutInfo:outSources:outSourcesCount:", &location, &cf, &v7))
    {
      if (v7 == self->_previousSourcesCount)
      {
        -[SFPowerSourceMonitor _updatePowerSourcesWithInfo:sources:sourcesCount:](self, "_updatePowerSourcesWithInfo:sources:sourcesCount:", location, cf);
      }
      else
      {
        v6 = self->_ucat->var0;
        if (v6 <= 10 && (v6 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        -[CUCoalescer trigger](self->_updateCoalescer, "trigger");
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (location)
        CFRelease(location);
    }
  }
}

- (BOOL)powerSourcesListWithOutInfo:(const void *)a3 outSources:(const __CFArray *)a4 outSourcesCount:(int64_t *)a5
{
  uint64_t v9;
  uint64_t v10;
  int var0;
  const void *v12;
  const __CFArray *v13;
  void *v14;
  BOOL v15;
  int v17;
  uint64_t v18;
  void *v19;
  CFTypeRef cf;

  cf = 0;
  v9 = IOPSCopyPowerSourcesByTypePrecise();
  if ((_DWORD)v9)
  {
    v10 = v9;
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v18 = v10;
      LogPrintF();
    }
    v12 = (const void *)IOPSCopyPowerSourcesByType();
    cf = v12;
  }
  else
  {
    v12 = 0;
  }
  if (v12)
  {
    v13 = IOPSCopyPowerSourcesList(v12);
    if (v13)
    {
      *a3 = cf;
      *a4 = v13;
      v14 = 0;
      *a5 = CFArrayGetCount(v13);
LABEL_11:
      v15 = 1;
      goto LABEL_12;
    }
  }
  NSErrorWithOSStatusF();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_11;
  v17 = self->_ucat->var0;
  if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v14, "localizedDescription", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (cf)
    CFRelease(cf);
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)_updatePowerSourcesWithInfo:(void *)a3 sources:(__CFArray *)a4 sourcesCount:(int64_t)a5
{
  unsigned __int16 powerSourcesUpdateIndex;
  int var0;
  NSMutableDictionary *powerSources;
  CFIndex v12;
  const void *ValueAtIndex;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  SFPowerSourceMonitor *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t i;
  void *v40;
  int v41;
  int v42;
  unsigned int v43;
  int v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  CFDictionaryRef v56;
  id obj;
  void *v58;
  SFPowerSourceMonitor *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  _BYTE v73[128];
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex + 1;
  self->_powerSourcesUpdateIndex = powerSourcesUpdateIndex;
  var0 = self->_ucat->var0;
  if (var0 <= 10)
  {
    if (var0 != -1)
    {
LABEL_3:
      v50 = a5;
      v52 = -[NSMutableDictionary count](self->_powerSources, "count");
      v48 = powerSourcesUpdateIndex;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
      goto LABEL_3;
    }
  }
LABEL_5:
  self->_previousSourcesCount = a5;
  powerSources = self->_powerSources;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __73__SFPowerSourceMonitor__updatePowerSourcesWithInfo_sources_sourcesCount___block_invoke;
  v72[3] = &unk_1E4830D90;
  v59 = self;
  v72[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](powerSources, "enumerateKeysAndObjectsUsingBlock:", v72, v48, v50, v52);
  v56 = IOPSCopyExternalPowerAdapterDetails();
  if (a5 >= 1)
  {
    v12 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a4, v12);
      IOPSGetPowerSourceDescription(a3, ValueAtIndex);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_ucat->var0;
      if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
      {
        v49 = self->_powerSourcesUpdateIndex;
        v51 = v14;
        LogPrintF();
      }
      if (v14)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Power Source ID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_powerSources, "objectForKeyedSubscript:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            -[SFPowerSourceMonitor _updatePowerSource:desc:adapterDesc:](self, "_updatePowerSource:desc:adapterDesc:", v17, v14, v56);

          }
          else
          {
            -[SFPowerSourceMonitor _foundPowerSource:desc:adapterDesc:](self, "_foundPowerSource:desc:adapterDesc:", v16, v14, v56);
          }
        }
        else
        {
          v20 = self->_ucat->var0;
          if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize()))
          {
            v49 = self->_powerSourcesUpdateIndex;
            v51 = v14;
            LogPrintF();
          }
        }

      }
      else
      {
        v19 = self->_ucat->var0;
        if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        {
          v49 = self->_powerSourcesUpdateIndex;
          v51 = (void *)v12;
          LogPrintF();
        }
      }

      ++v12;
    }
    while (a5 != v12);
  }
  v21 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v22 = self;
  -[NSMutableDictionary allValues](self->_powerSources, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v61)
  {
    v60 = *(_QWORD *)v69;
    v58 = v21;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v69 != v60)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v23);
        objc_msgSend(v24, "groupID", v49, v51, v53, v54, v55);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "length"))
        {
          if (objc_msgSend(v21, "containsObject:", v25))
          {
            v26 = v22->_ucat->var0;
            if (v26 <= 10 && (v26 != -1 || _LogCategory_Initialize()))
            {
              v49 = v22->_powerSourcesUpdateIndex;
              v51 = v24;
              LogPrintF();
            }
            v32 = 0;
            goto LABEL_76;
          }
          -[NSMutableDictionary allValues](v22->_powerSources, "allValues");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("groupID == %@"), v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "filteredArrayUsingPredicate:", v29);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "addObject:", v25);
        }
        else
        {
          v74 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v30 = v22->_ucat->var0;
        if (v30 <= 10 && (v30 != -1 || _LogCategory_Initialize()))
        {
          v31 = v22->_powerSourcesUpdateIndex;
          objc_msgSend(v24, "accessoryCategory");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v27, "count");
          v49 = v31;
          v51 = v25;
          LogPrintF();

        }
        v62 = v25;
        v63 = v23;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v32 = v27;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        if (v33)
        {
          v34 = v33;
          LODWORD(v35) = 0;
          v36 = *(_QWORD *)v65;
          v37 = 1;
          v38 = 1;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v65 != v36)
                objc_enumerationMutation(v32);
              v40 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              v41 = objc_msgSend(v40, "present", v49) ^ 1;
              v42 = objc_msgSend(v40, "added");
              v38 &= v41;
              v37 &= v42;
              v43 = objc_msgSend(v40, "changes") | v35;
              if (v41 | v42)
                v35 = v43 | 0x200;
              else
                v35 = v43;
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          }
          while (v34);
        }
        else
        {
          v35 = 0;
          v37 = 1;
          v38 = 1;
        }

        v22 = v59;
        v44 = v59->_ucat->var0;
        if (v44 <= 10 && (v44 != -1 || _LogCategory_Initialize()))
        {
          v45 = "no";
          if (v38)
            v46 = "yes";
          else
            v46 = "no";
          if (v37)
            v45 = "yes";
          v54 = v35;
          v55 = &unk_1A2AF77F8;
          v51 = (void *)v46;
          v53 = (void *)v45;
          v49 = v59->_powerSourcesUpdateIndex;
          LogPrintF();
        }
        if (v38)
        {
          -[SFPowerSourceMonitor _handlePowerSourcesLost:](v59, "_handlePowerSourcesLost:", v32);
        }
        else if (v37)
        {
          -[SFPowerSourceMonitor _handlePowerSourcesFound:](v59, "_handlePowerSourcesFound:", v32);
        }
        else if ((_DWORD)v35)
        {
          -[SFPowerSourceMonitor _handlePowerSourcesChanged:changes:](v59, "_handlePowerSourcesChanged:changes:", v32, v35);
        }
        v21 = v58;
        v25 = v62;
        v23 = v63;
LABEL_76:

        ++v23;
      }
      while (v23 != v61);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      v61 = v47;
    }
    while (v47);
  }

}

- (void)_updatePowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v8;
  uint64_t v9;
  int var0;
  id v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  uint64_t powerSourcesUpdateIndex;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a5;
  v9 = objc_msgSend(v19, "updateWithPowerSourceDescription:", a4);
  var0 = self->_ucat->var0;
  if (var0 <= 10)
  {
    v11 = v19;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v11 = v19;
    }
    v17 = v9;
    v18 = &unk_1A2AF77F8;
    powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
    v16 = v11;
    LogPrintF();
  }
LABEL_5:
  if ((objc_msgSend(v19, "isInternal", powerSourcesUpdateIndex, v16, v17, v18) & 1) != 0
    || (objc_msgSend(v19, "groupID"),
        v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
        v12 == CFSTR("Internal"))
    || (v13 = v12) != 0
    && (v14 = -[__CFString isEqual:](v12, "isEqual:", CFSTR("Internal")), v13, v13, v14))
  {
    v9 = objc_msgSend(v19, "updateWithPowerAdapterDetails:", v8) | v9;
  }
  objc_msgSend(v19, "setChanges:", v9);

}

void __73__SFPowerSourceMonitor__updatePowerSourcesWithInfo_sources_sourcesCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(_DWORD **)(v6 + 8);
  if (v7 <= 10)
  {
    if (v7 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v6 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(unsigned __int16 *)(v6 + 32);
    v9 = v5;
    LogPrintF();
  }
LABEL_5:
  objc_msgSend(v5, "setAdded:", 0, v8, v9);
  objc_msgSend(v5, "setPresent:", 0);
  objc_msgSend(v5, "setChanges:", 0);

}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_4(uint64_t a1)
{
  int v2;

  v2 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_triggerUpdatePowerSources");
}

- (SFPowerSourceMonitor)init
{
  SFPowerSourceMonitor *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v5;
  NSMutableDictionary *powerSources;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPowerSourceMonitor;
  v2 = -[SFPowerSourceMonitor init](&v8, sel_init);
  if (v2)
  {
    ASPrintF();
    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    v2->_changeFlags = 5;
    SFMainQueue(0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    *(_QWORD *)&v2->_psNotifyTokenAccessoryAttach = -1;
    *(_QWORD *)&v2->_psNotifyTokenAccessoryTimeRemaining = -1;
    v5 = objc_opt_new();
    powerSources = v2->_powerSources;
    v2->_powerSources = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SFPowerSourceMonitor _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)SFPowerSourceMonitor;
  -[SFPowerSourceMonitor dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  CUCoalescer *updateCoalescer;
  id invalidationHandler;
  id powerSourcesFoundHandler;
  id powerSourcesLostHandler;
  id powerSourcesChangedHandler;
  NSMutableDictionary *powerSources;
  int psNotifyTokenAccessoryAttach;
  int psNotifyTokenAccessoryPowerSource;
  int psNotifyTokenAccessoryTimeRemaining;
  int psNotifyTokenAnyPowerSource;
  LogCategory *ucat;

  -[CUCoalescer invalidate](self->_updateCoalescer, "invalidate");
  updateCoalescer = self->_updateCoalescer;
  self->_updateCoalescer = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  powerSourcesFoundHandler = self->_powerSourcesFoundHandler;
  self->_powerSourcesFoundHandler = 0;

  powerSourcesLostHandler = self->_powerSourcesLostHandler;
  self->_powerSourcesLostHandler = 0;

  powerSourcesChangedHandler = self->_powerSourcesChangedHandler;
  self->_powerSourcesChangedHandler = 0;

  -[NSMutableDictionary removeAllObjects](self->_powerSources, "removeAllObjects");
  powerSources = self->_powerSources;
  self->_powerSources = 0;

  psNotifyTokenAccessoryAttach = self->_psNotifyTokenAccessoryAttach;
  if (psNotifyTokenAccessoryAttach != -1)
  {
    notify_cancel(psNotifyTokenAccessoryAttach);
    self->_psNotifyTokenAccessoryAttach = -1;
  }
  psNotifyTokenAccessoryPowerSource = self->_psNotifyTokenAccessoryPowerSource;
  if (psNotifyTokenAccessoryPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAccessoryPowerSource);
    self->_psNotifyTokenAccessoryPowerSource = -1;
  }
  psNotifyTokenAccessoryTimeRemaining = self->_psNotifyTokenAccessoryTimeRemaining;
  if (psNotifyTokenAccessoryTimeRemaining != -1)
  {
    notify_cancel(psNotifyTokenAccessoryTimeRemaining);
    self->_psNotifyTokenAccessoryTimeRemaining = -1;
  }
  psNotifyTokenAnyPowerSource = self->_psNotifyTokenAnyPowerSource;
  if (psNotifyTokenAnyPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAnyPowerSource);
    self->_psNotifyTokenAnyPowerSource = -1;
  }
  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
}

- (void)setChangeFlags:(unsigned int)a3
{
  SFPowerSourceMonitor *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  unsigned int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SFPowerSourceMonitor_setChangeFlags___block_invoke;
    v6[3] = &unk_1E4830D68;
    v7 = a3;
    v6[4] = v4;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_changeFlags = a3;
  }
  objc_sync_exit(v4);

}

uint64_t __39__SFPowerSourceMonitor_setChangeFlags___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 76))
  {
    *(_DWORD *)(v2 + 76) = v1;
    return objc_msgSend(*(id *)(result + 32), "_update");
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFPowerSourceMonitor *v5;
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
  v8[2] = __47__SFPowerSourceMonitor_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __47__SFPowerSourceMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  uint64_t v5;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[1];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_update");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_triggerUpdatePowerSources");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFPowerSourceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFPowerSourceMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 8);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(_QWORD *)(v2 + 88);
  if (v5)
  {
    (*(void (**)(_QWORD))(v5 + 16))(*(_QWORD *)(v2 + 88));
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v2, "_cleanup");
}

- (void)_update
{
  NSObject *dispatchQueue;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD handler[5];

  if (self->_psNotifyTokenAccessoryAttach == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __31__SFPowerSourceMonitor__update__block_invoke;
    handler[3] = &unk_1E482FB48;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.attach", &self->_psNotifyTokenAccessoryAttach, dispatchQueue, handler);
  }
  if (self->_psNotifyTokenAccessoryPowerSource == -1)
  {
    v4 = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__SFPowerSourceMonitor__update__block_invoke_2;
    v9[3] = &unk_1E482FB48;
    v9[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.source", &self->_psNotifyTokenAccessoryPowerSource, v4, v9);
  }
  if (self->_psNotifyTokenAccessoryTimeRemaining == -1)
  {
    v5 = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__SFPowerSourceMonitor__update__block_invoke_3;
    v8[3] = &unk_1E482FB48;
    v8[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_psNotifyTokenAccessoryTimeRemaining, v5, v8);
  }
  if (self->_psNotifyTokenAnyPowerSource == -1)
  {
    v6 = self->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__SFPowerSourceMonitor__update__block_invoke_4;
    v7[3] = &unk_1E482FB48;
    v7[4] = self;
    notify_register_dispatch("com.apple.system.powersources", &self->_psNotifyTokenAnyPowerSource, v6, v7);
  }
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke(uint64_t a1)
{
  int v2;

  v2 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_triggerUpdatePowerSources");
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_triggerUpdatePowerSources");
}

uint64_t __31__SFPowerSourceMonitor__update__block_invoke_3(uint64_t a1)
{
  int v2;

  v2 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2 <= 10 && (v2 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_triggerUpdatePowerSources");
}

void __50__SFPowerSourceMonitor__triggerUpdatePowerSources__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePowerSources");

}

- (void)_updatePowerSources
{
  uint64_t v3;
  CFTypeRef cf;
  CFTypeRef v5;

  cf = 0;
  v5 = 0;
  v3 = 0;
  if (-[SFPowerSourceMonitor powerSourcesListWithOutInfo:outSources:outSourcesCount:](self, "powerSourcesListWithOutInfo:outSources:outSourcesCount:", &v5, &cf, &v3))
  {
    -[SFPowerSourceMonitor _updatePowerSourcesWithInfo:sources:sourcesCount:](self, "_updatePowerSourcesWithInfo:sources:sourcesCount:", v5, cf, v3);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (v5)
      CFRelease(v5);
  }
}

- (void)_foundPowerSource:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v8;
  id v9;
  SFPowerSource *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  int var0;
  id v18;

  v18 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(SFPowerSource);
  -[SFPowerSource setSourceID:](v10, "setSourceID:", objc_msgSend(v18, "integerValue"));
  -[SFPowerSource updateWithPowerSourceDescription:](v10, "updateWithPowerSourceDescription:", v9);

  -[SFPowerSource setAdded:](v10, "setAdded:", 1);
  if (!-[SFPowerSource isInternal](v10, "isInternal"))
  {
    -[SFPowerSource accessoryCategory](v10, "accessoryCategory");
    v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == CFSTR("Battery Case")
      || v11 && (v13 = -[__CFString isEqual:](v11, "isEqual:", CFSTR("Battery Case")), v12, v13))
    {
      -[SFPowerSource transportType](v10, "transportType");
      v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v14 == CFSTR("AID"))
      {

LABEL_12:
        -[SFPowerSource setGroupID:](v10, "setGroupID:", CFSTR("Internal"));
        goto LABEL_13;
      }
      v15 = v14;
      if (v14)
      {
        v16 = -[__CFString isEqual:](v14, "isEqual:", CFSTR("AID"));

        if ((v16 & 1) == 0)
          goto LABEL_13;
        goto LABEL_12;
      }
    }

    goto LABEL_13;
  }
  -[SFPowerSource setGroupID:](v10, "setGroupID:", CFSTR("Internal"));
  -[SFPowerSource updateWithPowerAdapterDetails:](v10, "updateWithPowerAdapterDetails:", v8);
LABEL_13:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_powerSources, "setObject:forKeyedSubscript:", v10, v18);
  var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();

}

- (void)_handlePowerSourcesFound:(id)a3
{
  id v4;
  int var0;
  int v6;
  void (**powerSourcesFoundHandler)(id, _QWORD);
  id v8;

  v4 = a3;
  var0 = self->_ucat->var0;
  v8 = v4;
  if (var0 <= 10)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      LogPrintF();
      v4 = v8;
    }
  }
  powerSourcesFoundHandler = (void (**)(id, _QWORD))self->_powerSourcesFoundHandler;
  if (powerSourcesFoundHandler)
  {
    ((void (**)(id, id))powerSourcesFoundHandler)[2](powerSourcesFoundHandler, v8);
    v4 = v8;
  }

}

- (void)_handlePowerSourcesChanged:(id)a3 changes:(unsigned int)a4
{
  id v5;
  int var0;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void (**powerSourcesChangedHandler)(id, void *);
  uint64_t powerSourcesUpdateIndex;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
    v20 = v5;
    LogPrintF();
  }
  v7 = (void *)objc_msgSend(v5, "mutableCopy", powerSourcesUpdateIndex, v20);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "present") & 1) == 0)
        {
          v14 = self->_ucat->var0;
          if (v14 <= 10 && (v14 != -1 || _LogCategory_Initialize()))
          {
            v19 = self->_powerSourcesUpdateIndex;
            v21 = v13;
            LogPrintF();
          }
          objc_msgSend(v7, "removeObject:", v13, v19, v21);
          v27 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPowerSourceMonitor _removePowerSources:](self, "_removePowerSources:", v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v10 = v16;
    }
    while (v16);
  }

  powerSourcesChangedHandler = (void (**)(id, void *))self->_powerSourcesChangedHandler;
  if (powerSourcesChangedHandler && (self->_changeFlags & a4) != 0)
    powerSourcesChangedHandler[2](powerSourcesChangedHandler, v7);

}

- (void)_handlePowerSourcesLost:(id)a3
{
  id v4;
  int var0;
  int v6;
  void (**powerSourcesLostHandler)(id, id);
  uint64_t powerSourcesUpdateIndex;
  id v9;
  id v10;

  v4 = a3;
  var0 = self->_ucat->var0;
  v10 = v4;
  if (var0 <= 10)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v10, v6))
    {
      powerSourcesUpdateIndex = self->_powerSourcesUpdateIndex;
      v9 = v4;
      LogPrintF();
      v4 = v10;
    }
  }
  -[SFPowerSourceMonitor _removePowerSources:](self, "_removePowerSources:", v4, powerSourcesUpdateIndex, v9);
  powerSourcesLostHandler = (void (**)(id, id))self->_powerSourcesLostHandler;
  if (powerSourcesLostHandler)
    powerSourcesLostHandler[2](powerSourcesLostHandler, v10);

}

- (void)_removePowerSources:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary allKeysForObject:](self->_powerSources, "allKeysForObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectsForKeys:](self->_powerSources, "removeObjectsForKeys:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)skipCoalescing
{
  return self->_skipCoalescing;
}

- (void)setSkipCoalescing:(BOOL)a3
{
  self->_skipCoalescing = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)powerSourcesFoundHandler
{
  return self->_powerSourcesFoundHandler;
}

- (void)setPowerSourcesFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)powerSourcesLostHandler
{
  return self->_powerSourcesLostHandler;
}

- (void)setPowerSourcesLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)powerSourcesChangedHandler
{
  return self->_powerSourcesChangedHandler;
}

- (void)setPowerSourcesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_powerSourcesChangedHandler, 0);
  objc_storeStrong(&self->_powerSourcesLostHandler, 0);
  objc_storeStrong(&self->_powerSourcesFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_powerSources, 0);
  objc_storeStrong((id *)&self->_updateCoalescer, 0);
}

@end
