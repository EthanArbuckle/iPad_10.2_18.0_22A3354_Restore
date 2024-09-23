@implementation TRIRemoteAssetExtractor

- (TRIRemoteAssetExtractor)initWithMonitoredActivity:(id)a3
{
  id v5;
  TRIRemoteAssetExtractor *v6;
  TRIRemoteAssetExtractor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRemoteAssetExtractor;
  v6 = -[TRIRemoteAssetExtractor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_monitoredActivity, a3);

  return v7;
}

- ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromFile:(id)a3 withArchiveName:(id)a4 toEmptyDirectory:(id)a5 postExtractionCompression:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  OS_xpc_object *monitoredActivity;
  NSObject *v15;
  $A5A652246548B43F8BC05201A1C72A70 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  OS_xpc_object *v24;
  NSObject *v25;
  unint64_t var0;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BYTE *v36;
  unint64_t v37;
  id v38;
  _QWORD v39[5];
  uint8_t buf[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[24];
  const char *v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v29 = a4;
  v13 = a5;
  monitoredActivity = self->_monitoredActivity;
  if (monitoredActivity && xpc_activity_should_defer(monitoredActivity))
  {
    TRILogCategory_Archiving();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16.var0 = 2;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Deferral requested before start of archive extraction.", buf, 2u);
    }
    else
    {
      v16.var0 = 2;
    }
  }
  else
  {
    var0 = a6.var0;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.trial.TrialArchivingService"));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC9D248);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteObjectInterface:](v15, "setRemoteObjectInterface:", v17);

    -[NSObject resume](v15, "resume");
    *(_QWORD *)buf = 0;
    v41 = buf;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__27;
    v44 = __Block_byref_object_dispose__27;
    v18 = MEMORY[0x1E0C809B0];
    v45 = 0;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke;
    v39[3] = &unk_1E9333890;
    v39[4] = buf;
    -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v15, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v13, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3608];
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v12);
      v38 = 0;
      objc_msgSend(v20, "fileHandleForReadingFromURL:error:", v21, &v38);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v38;

      if (v22)
      {
        *(_QWORD *)v46 = 0;
        *(_QWORD *)&v46[8] = v46;
        *(_QWORD *)&v46[16] = 0x2810000000;
        v47 = "";
        v48 = 0;
        v24 = self->_monitoredActivity;
        v30[0] = v18;
        v30[1] = 3221225472;
        v30[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_20;
        v30[3] = &unk_1E93338E0;
        v31 = v28;
        v32 = v22;
        v33 = v29;
        v34 = v13;
        v35 = v19;
        v36 = v46;
        v37 = var0;
        +[TRIDeferralNotifier forwardDeferralsFromMonitoredActivity:usingDarwinNotificationName:whileExecutingBlock:](TRIDeferralNotifier, "forwardDeferralsFromMonitoredActivity:usingDarwinNotificationName:whileExecutingBlock:", v24, "com.apple.trial.TrialArchivingService.shouldDefer", v30);
        -[NSObject invalidate](v15, "invalidate");
        if (a7)
          *a7 = objc_retainAutorelease(*((id *)v41 + 5));
        if (*((_QWORD *)v41 + 5))
          v16.var0 = 0;
        else
          v16.var0 = *(_BYTE *)(*(_QWORD *)&v46[8] + 32);

        _Block_object_dispose(v46, 8);
      }
      else
      {
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v46 = 138543618;
          *(_QWORD *)&v46[4] = v12;
          *(_WORD *)&v46[12] = 2114;
          *(_QWORD *)&v46[14] = v23;
          _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to open archive handle for %{public}@ with error %{public}@", v46, 0x16u);
        }

        v16.var0 = 0;
      }

    }
    else
    {
      v16.var0 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v16;
}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "connection invalidated with error %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_20(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a1[7], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_2;
  v8[3] = &unk_1E93338B8;
  v6 = a1[8];
  v7 = a1[10];
  v10 = a1[9];
  v9 = (id)a1[6];
  objc_msgSend(v2, "extractArchiveFromHandle:withArchiveName:toDirectory:destDirExtension:postExtractionCompression:completion:", v3, v4, v5, v6, v7, v8);

}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
    if (v5 > 2)
      v6 = 0;
    else
      v6 = off_1E9333900[v5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "extraction of %{public}@ completed with result: %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredActivity, 0);
}

@end
