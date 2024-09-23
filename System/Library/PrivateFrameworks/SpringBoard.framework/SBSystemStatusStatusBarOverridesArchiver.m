@implementation SBSystemStatusStatusBarOverridesArchiver

+ (id)_archiveFileURL
{
  if (_archiveFileURL___onceToken != -1)
    dispatch_once(&_archiveFileURL___onceToken, &__block_literal_global_233);
  return (id)_archiveFileURL_sArchiveURL;
}

void __59__SBSystemStatusStatusBarOverridesArchiver__archiveFileURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  SBHomeDirectory();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("StatusBarOverrides"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathExtension:", CFSTR("archive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_archiveFileURL_sArchiveURL;
  _archiveFileURL_sArchiveURL = v3;

}

- (SBSystemStatusStatusBarOverridesArchiver)init
{
  SBSystemStatusStatusBarOverridesArchiver *v3;
  void *v4;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v7;
  STStatusBarOverridesStatusDomain *overridesDomain;
  uint64_t v9;
  STStatusBarOverridesStatusDomainPublisher *overridesPublisher;
  NSObject *v11;
  void *v13;
  _QWORD block[4];
  SBSystemStatusStatusBarOverridesArchiver *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBSystemStatusStatusBarOverridesArchiver;
  v3 = -[SBSystemStatusStatusBarOverridesArchiver init](&v16, sel_init);
  if (v3)
  {
    objc_msgSend((id)SBApp, "systemStatusServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SBSystemStatusStatusBarOverridesArchiver.m"), 61, CFSTR("don't initialize %@ before the server handle exists!"), objc_opt_class());

    }
    Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A18]), "initWithServerHandle:", v4);
    overridesDomain = v3->_overridesDomain;
    v3->_overridesDomain = (STStatusBarOverridesStatusDomain *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A28]), "initWithServerHandle:", v4);
    overridesPublisher = v3->_overridesPublisher;
    v3->_overridesPublisher = (STStatusBarOverridesStatusDomainPublisher *)v9;

    v11 = v3->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SBSystemStatusStatusBarOverridesArchiver_init__block_invoke;
    block[3] = &unk_1E8E9DED8;
    v15 = v3;
    dispatch_async(v11, block);

  }
  return v3;
}

uint64_t __48__SBSystemStatusStatusBarOverridesArchiver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setupObservingAndReconcileInitialState");
}

- (void)_queue_setupObservingAndReconcileInitialState
{
  uint64_t v3;
  STStatusBarOverridesStatusDomain *overridesDomain;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  STStatusBarOverridesStatusDomainPublisher *overridesPublisher;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  BSDispatchQueueAssert();
  v3 = MEMORY[0x1E0C809B0];
  overridesDomain = self->_overridesDomain;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke;
  v15[3] = &unk_1E8EB52F0;
  v15[4] = self;
  -[STStatusBarOverridesStatusDomain observeDataWithBlock:](overridesDomain, "observeDataWithBlock:", v15);
  -[STStatusBarOverridesStatusDomain data](self->_overridesDomain, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sbSystemStatusStatusBarOverridesArchiveRecord");
  v6 = objc_claimAutoreleasedReturnValue();

  -[SBSystemStatusStatusBarOverridesArchiver _queue_readStatusBarOverridesArchiveRecord](self, "_queue_readStatusBarOverridesArchiveRecord");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      if (v6)
      {
        -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:](self, "_queue_writeOutArchiveRecord:", v6);
        goto LABEL_14;
      }
      if (!v7)
        goto LABEL_14;
      objc_storeStrong((id *)&self->_queue_archiveRecord, (id)v7);
      v10 = v8;
    }
    else
    {
      objc_msgSend((id)v7, "recordByApplyingRecord:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:](self, "_queue_writeOutArchiveRecord:", v10);
      if (!v10)
        goto LABEL_14;
    }
    overridesPublisher = self->_overridesPublisher;
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_3;
    v13[3] = &unk_1E8EB5318;
    v14 = v10;
    v12 = v10;
    -[STStatusBarOverridesStatusDomainPublisher updateDataWithBlock:](overridesPublisher, "updateDataWithBlock:", v13);

  }
LABEL_14:

}

void __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a2, "_sbSystemStatusStatusBarOverridesArchiveRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_2;
  v7[3] = &unk_1E8E9E820;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_persistUpdatedArchiveRecord:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__SBSystemStatusStatusBarOverridesArchiver__queue_setupObservingAndReconcileInitialState__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_sbApplySystemStatusStatusBarOverridesArchiveRecord:", *(_QWORD *)(a1 + 32));
}

- (void)_queue_persistUpdatedArchiveRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  v4 = a3;
  BSDispatchQueueAssert();
  if (!BSEqualObjects())
  {
    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        v11 = 0;
        v8 = "Received status bar overrides to persist…";
        v9 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else if (v7)
    {
      v10 = 0;
      v8 = "Clearing status bar overrides…";
      v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }

    -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:](self, "_queue_writeOutArchiveRecord:", v4);
    goto LABEL_12;
  }
  SBLogStatusBarish();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Received duplicate data…", buf, 2u);
  }

LABEL_12:
}

- (void)_queue_writeOutArchiveRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *p_super;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_archiveFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v21);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v21;
      v12 = v11;
      if (v10)
      {
        v20 = v11;
        v13 = -[NSObject writeToURL:options:error:](v10, "writeToURL:options:error:", v5, 1, &v20);
        v8 = v20;

        SBLogStatusBarish();
        v14 = objc_claimAutoreleasedReturnValue();
        p_super = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_DEFAULT, "Saved the status bar overrides archive.", buf, 2u);
          }

          v16 = (_SBSystemStatusStatusBarOverridesArchiveRecord *)v4;
          p_super = &self->_queue_archiveRecord->super;
          self->_queue_archiveRecord = v16;
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v17 = -[NSObject length](v10, "length");
          objc_msgSend(v8, "localizedDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v23 = v17;
          v24 = 2112;
          v25 = v5;
          v26 = 2112;
          v27 = v18;
          _os_log_error_impl(&dword_1D0540000, p_super, OS_LOG_TYPE_ERROR, "Error writing status bar overrides archive (len=%lu) to %@: %@", buf, 0x20u);

        }
      }
      else
      {
        SBLogStatusBarish();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:].cold.2(v12);
        v8 = v12;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v19);
      v8 = v19;

      SBLogStatusBarish();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Cleared the status bar overrides archive.", buf, 2u);
        }

        v10 = &self->_queue_archiveRecord->super;
        self->_queue_archiveRecord = 0;
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[SBSystemStatusStatusBarOverridesArchiver _queue_writeOutArchiveRecord:].cold.1((uint64_t)v5, v8);
      }
    }

  }
}

- (id)_queue_readStatusBarOverridesArchiveRecord
{
  void *v2;
  void *v3;
  id v4;
  _SBSystemStatusStatusBarOverridesArchiveRecord *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  objc_msgSend((id)objc_opt_class(), "_archiveFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 1, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

    SBLogStatusBarish();
    v12 = objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SBSystemStatusStatusBarOverridesArchiver _queue_readStatusBarOverridesArchiveRecord].cold.1((uint64_t)v2, v4);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v2;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't read archived status bar overrides because none exist at: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v17 = v4;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v17);
  v5 = (_SBSystemStatusStatusBarOverridesArchiveRecord *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (!v5)
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v2;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Unable to read status bar overrides archive, Falling back to the legacy format: %@", buf, 0xCu);
    }

    v16 = v6;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v4 = v16;

    if (v8)
    {
      v5 = -[_SBSystemStatusStatusBarOverridesArchiveRecord initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:]([_SBSystemStatusStatusBarOverridesArchiveRecord alloc], "initWithStatusBarData:andSuppressedBackgroundActivityIdentifiers:", v8, 0);
LABEL_15:

      v6 = v4;
      goto LABEL_16;
    }
    SBLogStatusBarish();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v3, "length");
      objc_msgSend(v4, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v14;
      v21 = 2112;
      v22 = v2;
      v23 = 2112;
      v24 = v15;
      _os_log_error_impl(&dword_1D0540000, v8, OS_LOG_TYPE_ERROR, "Error unarchiving status bar overrides from data (len=%lu) at %@: %@", buf, 0x20u);

    }
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STStatusBarOverridesStatusDomain invalidate](self->_overridesDomain, "invalidate");
  -[STStatusBarOverridesStatusDomainPublisher invalidate](self->_overridesPublisher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusStatusBarOverridesArchiver;
  -[SBSystemStatusStatusBarOverridesArchiver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_archiveRecord, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overridesPublisher, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
}

- (void)_queue_writeOutArchiveRecord:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v3, v4, "Error clearing status bar overrides archive at %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)_queue_writeOutArchiveRecord:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v2, v3, "Error archiving status bar overrides archive: %@'\ndata: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_20();
}

- (void)_queue_readStatusBarOverridesArchiveRecord
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v3, v4, "Error reading status bar overrides data at %@: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

@end
