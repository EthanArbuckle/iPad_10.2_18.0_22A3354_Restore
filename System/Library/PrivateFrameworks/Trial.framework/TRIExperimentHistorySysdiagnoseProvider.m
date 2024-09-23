@implementation TRIExperimentHistorySysdiagnoseProvider

- (id)initIncompleteProvider
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIExperimentHistorySysdiagnoseProvider;
  return -[TRIExperimentHistorySysdiagnoseProvider init](&v3, sel_init);
}

+ (id)defaultProvider
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v2 = -[TRIExperimentHistorySysdiagnoseProvider initIncompleteProvider]([TRIExperimentHistorySysdiagnoseProvider alloc], "initIncompleteProvider");
  objc_initWeak(&location, v2);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __58__TRIExperimentHistorySysdiagnoseProvider_defaultProvider__block_invoke;
  v9 = &unk_1E3C00588;
  objc_copyWeak(&v10, &location);
  v3 = (void *)MEMORY[0x1A1AC6D30](&v6);
  +[TRIAllocationStatus syncProxyWithErrorHandler:](TRIAllocationStatus, "syncProxyWithErrorHandler:", v3, v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSyncStatusProvider:", v4);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v2;
}

void __58__TRIExperimentHistorySysdiagnoseProvider_defaultProvider__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setXpcError:", v5);

}

- (id)filename
{
  return CFSTR("trial-experiment-history.log");
}

- (id)sysdiagnoseLinesWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[TRIExperimentHistorySysdiagnoseProvider _allHistoryRecordsWithError:](self, "_allHistoryRecordsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[TRISysdiagnoseOutputFormatter formatRecords:](TRISysdiagnoseOutputFormatter, "formatRecords:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_allHistoryRecordsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TRIExperimentHistorySysdiagnoseProvider _experimentHistoryRecordsForEnvironment:error:](self, "_experimentHistoryRecordsForEnvironment:error:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRIExperimentHistorySysdiagnoseProvider _experimentHistoryRecordsForEnvironment:error:](self, "_experimentHistoryRecordsForEnvironment:error:", 2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[TRIExperimentHistorySysdiagnoseProvider _experimentHistoryRecordsForEnvironment:error:](self, "_experimentHistoryRecordsForEnvironment:error:", 3, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_9;
    -[TRIExperimentHistorySysdiagnoseProvider xpcError](self, "xpcError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "addObjectsFromArray:", v5);
      objc_msgSend(v10, "addObjectsFromArray:", v6);
      objc_msgSend(v10, "addObjectsFromArray:", v7);
      v9 = (void *)objc_msgSend(v10, "copy");

      goto LABEL_11;
    }
    if (a3)
    {
      -[TRIExperimentHistorySysdiagnoseProvider xpcError](self, "xpcError");
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      v9 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)_experimentHistoryRecordsForEnvironment:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = *(_QWORD *)&a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  -[TRIExperimentHistorySysdiagnoseProvider syncStatusProvider](self, "syncStatusProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__TRIExperimentHistorySysdiagnoseProvider__experimentHistoryRecordsForEnvironment_error___block_invoke;
  v10[3] = &unk_1E3C005B0;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v6, "experimentHistoryRecordsWithLimit:newerThanDate:privacyFilterPolicy:deploymentEnvironment:completion:", 0x7FFFFFFFFFFFFFFFLL, v7, 1, v5, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __89__TRIExperimentHistorySysdiagnoseProvider__experimentHistoryRecordsForEnvironment_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = a5;
  v13 = v7;
  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = v7;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    v11 = objc_msgSend(a3, "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
  }

}

- (TRIXPCStatusServiceProtocol)syncStatusProvider
{
  return self->_syncStatusProvider;
}

- (void)setSyncStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatusProvider, a3);
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
  objc_storeStrong((id *)&self->_xpcError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcError, 0);
  objc_storeStrong((id *)&self->_syncStatusProvider, 0);
}

@end
