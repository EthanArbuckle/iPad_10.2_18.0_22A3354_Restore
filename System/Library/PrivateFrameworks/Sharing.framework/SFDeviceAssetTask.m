@implementation SFDeviceAssetTask

- (SFDeviceAssetTask)initWithDeviceQuery:(id)a3 requestConfiguration:(id)a4 dispatchQueue:(id)a5 useProcessLocalCache:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  SFDeviceAssetTask *v14;
  SFDeviceAssetTask *v15;
  double v16;
  dispatch_source_t v17;
  OS_dispatch_source *timer;
  double v19;
  unint64_t v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  _QWORD handler[4];
  SFDeviceAssetTask *v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SFDeviceAssetTask;
  v14 = -[SFDeviceAssetTask init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deviceAssetQuery, a3);
    objc_storeStrong((id *)&v15->_dispatchQueue, a5);
    v15->_useProcessLocalCache = a6;
    objc_storeStrong((id *)&v15->_configuration, a4);
    -[SFDeviceAssetRequestConfiguration timeout](v15->_configuration, "timeout");
    if (fabs(v16) >= 0.00000011920929)
    {
      v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v15->_dispatchQueue);
      timer = v15->_timer;
      v15->_timer = (OS_dispatch_source *)v17;

      -[SFDeviceAssetRequestConfiguration timeout](v15->_configuration, "timeout");
      v20 = (unint64_t)(v19 * 1000000000.0);
      v21 = v15->_timer;
      v22 = dispatch_time(0, v20);
      dispatch_source_set_timer(v21, v22, v20, v20 >> 2);
      v23 = v15->_timer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __97__SFDeviceAssetTask_initWithDeviceQuery_requestConfiguration_dispatchQueue_useProcessLocalCache___block_invoke;
      handler[3] = &unk_1E482DF78;
      v26 = v15;
      dispatch_source_set_event_handler(v23, handler);
      dispatch_resume((dispatch_object_t)v15->_timer);

    }
    -[SFDeviceAssetTask createQueryParameters](v15, "createQueryParameters");
  }

  return v15;
}

uint64_t __97__SFDeviceAssetTask_initWithDeviceQuery_requestConfiguration_dispatchQueue_useProcessLocalCache___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(int *)objc_msgSend(v2, "ucat") > 50)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)objc_msgSend(v3, "ucat") != -1)
  {

LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ucat");
    LogPrintF();
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ucat");
  v5 = _LogCategory_Initialize();

  if (v5)
    goto LABEL_5;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "cancelTimeout");
  objc_msgSend(*(id *)(a1 + 32), "completeIfPossible");
  return objc_msgSend(*(id *)(a1 + 32), "completeWithBundle:isFallback:isCached:", 0, 0, 0);
}

- (void)createQueryParameters
{
  NSMutableArray *v3;
  NSMutableArray *deviceQueryParameters;
  SFDeviceQueryParameters *v5;
  SFDeviceAssetQuery *deviceAssetQuery;
  void *v7;
  SFDeviceQueryParameters *v8;
  void *v9;
  NSMutableArray *v10;
  SFDeviceAssetQuery *v11;
  void *v12;
  SFDeviceQueryParameters *v13;

  v3 = (NSMutableArray *)objc_opt_new();
  deviceQueryParameters = self->_deviceQueryParameters;
  self->_deviceQueryParameters = v3;

  v5 = -[SFDeviceQueryParameters initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:]([SFDeviceQueryParameters alloc], "initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:", self->_deviceAssetQuery, 1, 0, 0);
  -[NSMutableArray addObject:](self->_deviceQueryParameters, "addObject:", v5);
  deviceAssetQuery = self->_deviceAssetQuery;
  -[SFDeviceQueryParameters maQuery](v5, "maQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SFDeviceAssetAddKeyValuePairsForStrictMatch(deviceAssetQuery, v7);

  v8 = -[SFDeviceQueryParameters initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:]([SFDeviceQueryParameters alloc], "initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:", self->_deviceAssetQuery, 1, 0, 1);
  -[SFDeviceAssetTask timer](self, "timer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_deviceQueryParameters;
  if (v9)
    -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v8, 0);
  else
    -[NSMutableArray addObject:](v10, "addObject:", v8);
  v13 = -[SFDeviceQueryParameters initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:]([SFDeviceQueryParameters alloc], "initWithDeviceAssetQuery:installedOnly:imperfectMatch:fallback:", self->_deviceAssetQuery, 0, 0, 0);

  v11 = self->_deviceAssetQuery;
  -[SFDeviceQueryParameters maQuery](v13, "maQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SFDeviceAssetAddKeyValuePairsForStrictMatch(v11, v12);

  -[NSMutableArray addObject:](self->_deviceQueryParameters, "addObject:", v13);
}

- (BOOL)updateTaskWithAssetURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a4;
  -[SFDeviceAssetTask bundleURLFromAssetURL:](self, "bundleURLFromAssetURL:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = -[SFDeviceAssetTask updateTaskWithAssetBundleURL:error:isFallback:isImperfectMatch:isCached:](self, "updateTaskWithAssetBundleURL:error:isFallback:isImperfectMatch:isCached:", v13, v12, v9, v8, v7);

  return v7;
}

- (BOOL)updateTaskWithAssetBundleURL:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  id v14;
  id v16;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v16 = a4;
  v12 = a4;
  -[SFDeviceAssetTask bundleAtURL:error:](self, "bundleAtURL:error:", a3, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;

  LOBYTE(v7) = -[SFDeviceAssetTask updateTaskWithBundle:error:isFallback:isImperfectMatch:isCached:](self, "updateTaskWithBundle:error:isFallback:isImperfectMatch:isCached:", v13, v14, v9, v8, v7);
  return v7;
}

- (BOOL)updateTaskWithBundle:(id)a3 error:(id)a4 isFallback:(BOOL)a5 isImperfectMatch:(BOOL)a6 isCached:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSBundle *v12;
  NSError *v13;
  NSBundle **p_cachedBundle;
  NSBundle *v15;
  NSBundle *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSError *error;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = (NSBundle *)a3;
  v13 = (NSError *)a4;
  if (v12)
  {
    if (v7)
    {
      p_cachedBundle = &self->_cachedBundle;
    }
    else
    {
      if (!v9)
      {
        v16 = v12;
        if (v8)
          p_cachedBundle = &self->_imperfectMatchBundle;
        else
          p_cachedBundle = &self->_matchBundle;
        goto LABEL_10;
      }
      p_cachedBundle = &self->_fallbackBundle;
    }
    v15 = v12;
LABEL_10:
    v17 = *p_cachedBundle;
    *p_cachedBundle = v12;

  }
  if (v13)
  {
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(int *)objc_msgSend(v18, "ucat") > 90)
    {
LABEL_17:

      goto LABEL_18;
    }
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_DWORD *)objc_msgSend(v19, "ucat") != -1)
    {

LABEL_16:
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ucat");
      LogPrintF();
      goto LABEL_17;
    }
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ucat");
    v21 = _LogCategory_Initialize();

    if (v21)
      goto LABEL_16;
  }
LABEL_18:
  error = self->_error;
  self->_error = v13;

  return v12 != 0;
}

- (void)cancelTimeout
{
  OS_dispatch_source *timer;
  OS_dispatch_source *v4;
  NSObject *v5;

  timer = self->_timer;
  if (timer)
  {
    v5 = timer;
    dispatch_source_cancel(v5);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (BOOL)completeIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  SFDeviceAssetTask *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;

  -[SFDeviceAssetTask matchBundle](self, "matchBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SFDeviceAssetTask fallbackBundle](self, "fallbackBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SFDeviceAssetTask imperfectMatchBundle](self, "imperfectMatchBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[SFDeviceAssetTask cachedBundle](self, "cachedBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          return v3 == 0;
        -[SFDeviceAssetTask cachedBundle](self, "cachedBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self;
        v17 = v8;
        v18 = 0;
        v19 = 1;
        goto LABEL_18;
      }
      -[SFDeviceAssetTask imperfectMatchBundle](self, "imperfectMatchBundle");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    -[SFDeviceAssetTask timer](self, "timer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_DWORD *)objc_msgSend(v8, "ucat");
    if (v7)
    {
      if (v9 <= 50)
      {
        -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)objc_msgSend(v10, "ucat") == -1)
        {
          -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "ucat");
          v24 = _LogCategory_Initialize();

          if (!v24)
            return v3 == 0;
        }
        else
        {

        }
        -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ucat");
        LogPrintF();
      }
      goto LABEL_19;
    }
    if (v9 <= 50)
    {
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)objc_msgSend(v21, "ucat") == -1)
      {
        -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "ucat");
        v26 = _LogCategory_Initialize();

        if (!v26)
        {
LABEL_31:
          -[SFDeviceAssetTask fallbackBundle](self, "fallbackBundle");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = self;
          v17 = v8;
          v18 = 1;
          goto LABEL_17;
        }
      }
      else
      {

      }
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ucat");
      LogPrintF();
    }

    goto LABEL_31;
  }
  -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(int *)objc_msgSend(v4, "ucat") > 50)
  {
LABEL_14:

    goto LABEL_15;
  }
  -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)objc_msgSend(v5, "ucat") != -1)
  {

LABEL_13:
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ucat");
    -[SFDeviceAssetTask matchBundle](self, "matchBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundlePath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

    goto LABEL_14;
  }
  -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ucat");
  v14 = _LogCategory_Initialize();

  if (v14)
    goto LABEL_13;
LABEL_15:
  -[SFDeviceAssetTask matchBundle](self, "matchBundle", v27);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v8 = (void *)v12;
  v16 = self;
  v17 = v8;
  v18 = 0;
LABEL_17:
  v19 = 0;
LABEL_18:
  -[SFDeviceAssetTask completeWithBundle:isFallback:isCached:](v16, "completeWithBundle:isFallback:isCached:", v17, v18, v19);
LABEL_19:

  return v3 == 0;
}

- (void)completeWithBundle:(id)a3 isFallback:(BOOL)a4 isCached:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v8 = a3;
  -[SFDeviceAssetTask cancelTimeout](self, "cancelTimeout");
  -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectiveProductType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFDeviceAssetTask dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SFDeviceAssetTask_completeWithBundle_isFallback_isCached___block_invoke;
  v14[3] = &unk_1E4830960;
  v17 = a5;
  v18 = a4;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v12 = v10;
  v13 = v8;
  dispatch_async(v11, v14);

}

void __60__SFDeviceAssetTask_completeWithBundle_isFallback_isCached___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = CFSTR("cached");
  }
  else if (*(_BYTE *)(a1 + 57))
  {
    v2 = CFSTR("fallback");
  }
  else
  {
    v2 = CFSTR("matching");
  }
  v29 = v2;
  if ((objc_msgSend(*(id *)(a1 + 32), "queryResultCalled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "queryResultHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setQueryResultCalled:", 1);
      objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(int *)objc_msgSend(v5, "ucat") <= 50)
      {
        objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)objc_msgSend(v6, "ucat") == -1)
        {
          objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "ucat");
          v17 = _LogCategory_Initialize();

          if (!v17)
          {
LABEL_29:
            objc_msgSend(*(id *)(a1 + 32), "configuration", v27, v28);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "queryResultHandler");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v18;
            v20 = *(_QWORD *)(a1 + 48);
            if (*(_QWORD *)(a1 + 40))
            {
              (*(void (**)(uint64_t))(v18 + 16))(v18);
LABEL_33:

              goto LABEL_34;
            }
            v21 = *(unsigned __int8 *)(a1 + 57) != 0;
            objc_msgSend(*(id *)(a1 + 32), "error");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, uint64_t, _BOOL8, void *))v19)[2](v19, 0, v20, v21, v22);
LABEL_32:

            goto LABEL_33;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ucat");
        if (*(_QWORD *)(a1 + 40))
        {
          v27 = v29;
          v28 = *(void **)(a1 + 40);
          LogPrintF();
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "error");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v29;
          LogPrintF();

        }
      }

      goto LABEL_29;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "downloadCompletionCalled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "downloadCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || *(_BYTE *)(a1 + 57))
    {

      goto LABEL_15;
    }
    v13 = *(unsigned __int8 *)(a1 + 56);

    if (!v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(int *)objc_msgSend(v14, "ucat") <= 50)
      {
        objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_DWORD *)objc_msgSend(v15, "ucat") == -1)
        {
          objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "ucat");
          v24 = _LogCategory_Initialize();

          if (!v24)
          {
LABEL_41:
            objc_msgSend(*(id *)(a1 + 32), "configuration", v27);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "downloadCompletionHandler");
            v25 = objc_claimAutoreleasedReturnValue();
            v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v25;
            v26 = *(_QWORD *)(a1 + 40);
            if (v26)
            {
              (*(void (**)(uint64_t, uint64_t, _QWORD))(v25 + 16))(v25, v26, 0);
              goto LABEL_33;
            }
            objc_msgSend(*(id *)(a1 + 32), "error");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), _QWORD, void *))v19[2])(v19, 0, v22);
            goto LABEL_32;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ucat");
        if (*(_QWORD *)(a1 + 40))
        {
          v27 = *(void **)(a1 + 40);
          LogPrintF();
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "error");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
      }

      goto LABEL_41;
    }
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(int *)objc_msgSend(v9, "ucat") > 50)
  {
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)objc_msgSend(v10, "ucat") != -1)
  {

LABEL_19:
    objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ucat");
    LogPrintF();
    goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceAssetQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ucat");
  v12 = _LogCategory_Initialize();

  if (v12)
    goto LABEL_19;
LABEL_35:

}

- (id)bundleURLFromAssetURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C99A10];
    v19[0] = *MEMORY[0x1E0C999D0];
    v19[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v7, 7, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(int *)objc_msgSend(v11, "ucat") >= 91)
    {

    }
    else
    {
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)objc_msgSend(v12, "ucat") != -1)
      {

LABEL_10:
        -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ucat");
        objc_msgSend(v4, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        goto LABEL_11;
      }
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ucat");
      v14 = _LogCategory_Initialize();

      if (v14)
        goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
  v9 = 0;
LABEL_13:

  return v10;
}

- (id)bundleAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int CanAccessURL;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  id v21;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v21 = 0;
      CanAccessURL = SFDeviceAssetProcessCanAccessURL(v9, (uint64_t)&v21);
      v11 = v21;
      if (CanAccessURL)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          if (a4)
            *a4 = 0;
          goto LABEL_17;
        }
        v14 = *a4;

        v11 = v14;
      }
    }
    else
    {
      v11 = 0;
    }
    -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(int *)objc_msgSend(v15, "ucat") <= 90)
    {
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_DWORD *)objc_msgSend(v16, "ucat") == -1)
      {
        -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ucat");
        v18 = _LogCategory_Initialize();

        if (!v18)
        {
LABEL_16:
          v13 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {

      }
      -[SFDeviceAssetTask deviceAssetQuery](self, "deviceAssetQuery");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ucat");
      objc_msgSend(v6, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_16;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (SFDeviceAssetQuery)deviceAssetQuery
{
  return self->_deviceAssetQuery;
}

- (SFDeviceAssetRequestConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)useProcessLocalCache
{
  return self->_useProcessLocalCache;
}

- (NSMutableArray)deviceQueryParameters
{
  return self->_deviceQueryParameters;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (NSBundle)matchBundle
{
  return self->_matchBundle;
}

- (NSBundle)imperfectMatchBundle
{
  return self->_imperfectMatchBundle;
}

- (NSBundle)fallbackBundle
{
  return self->_fallbackBundle;
}

- (NSBundle)cachedBundle
{
  return self->_cachedBundle;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)queryResultCalled
{
  return self->_queryResultCalled;
}

- (void)setQueryResultCalled:(BOOL)a3
{
  self->_queryResultCalled = a3;
}

- (BOOL)downloadCompletionCalled
{
  return self->_downloadCompletionCalled;
}

- (void)setDownloadCompletionCalled:(BOOL)a3
{
  self->_downloadCompletionCalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cachedBundle, 0);
  objc_storeStrong((id *)&self->_fallbackBundle, 0);
  objc_storeStrong((id *)&self->_imperfectMatchBundle, 0);
  objc_storeStrong((id *)&self->_matchBundle, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_deviceQueryParameters, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_deviceAssetQuery, 0);
}

@end
