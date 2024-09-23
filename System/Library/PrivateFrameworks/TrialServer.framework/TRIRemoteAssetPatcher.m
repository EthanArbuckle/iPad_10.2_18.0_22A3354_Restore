@implementation TRIRemoteAssetPatcher

- (TRIRemoteAssetPatcher)initWithMonitoredActivity:(id)a3
{
  id v5;
  TRIRemoteAssetPatcher *v6;
  TRIRemoteAssetPatcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRemoteAssetPatcher;
  v6 = -[TRIRemoteAssetPatcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_monitoredActivity, a3);

  return v7;
}

- (id)_tokenForSandboxExtensionWithClass:(const char *)a3 path:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a4);
  objc_msgSend(v4, "fileSystemRepresentation");
  v5 = sandbox_extension_issue_file();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v5, 4);
    free(v6);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to create sandbox extension for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OS_xpc_object *monitoredActivity;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v29;
  OS_xpc_object *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  unint64_t var0;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  const char *v54;
  char v55;
  _QWORD v56[5];
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIRemoteAssetPatcher _tokenForSandboxExtensionWithClass:path:](self, "_tokenForSandboxExtensionWithClass:path:", "com.apple.app-sandbox.read", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[TRIRemoteAssetPatcher _tokenForSandboxExtensionWithClass:path:](self, "_tokenForSandboxExtensionWithClass:path:", "com.apple.app-sandbox.read", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[TRIRemoteAssetPatcher _tokenForSandboxExtensionWithClass:path:](self, "_tokenForSandboxExtensionWithClass:path:", "com.apple.app-sandbox.read-write", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        monitoredActivity = self->_monitoredActivity;
        if (monitoredActivity && xpc_activity_should_defer(monitoredActivity))
        {
          TRILogCategory_Archiving();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            LOBYTE(a7) = 2;
            _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Deferring before start of patch application.", buf, 2u);
          }
          else
          {
            LOBYTE(a7) = 2;
          }
        }
        else
        {
          v32 = v17;
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.trial.TrialArchivingService"));
          objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC9D248);
          v31 = v18;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setRemoteObjectInterface:", v22);

          objc_msgSend(v21, "resume");
          *(_QWORD *)buf = 0;
          v58 = buf;
          v59 = 0x3032000000;
          v60 = __Block_byref_object_copy__40;
          v61 = __Block_byref_object_dispose__40;
          v62 = 0;
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke;
          v56[3] = &unk_1E9333890;
          v56[4] = buf;
          v23 = (void *)MEMORY[0x1D8232C48](v56);
          v51 = 0;
          v52 = &v51;
          v53 = 0x2810000000;
          v54 = "";
          v55 = 0;
          v45 = 0;
          v46 = &v45;
          v47 = 0x3032000000;
          v48 = __Block_byref_object_copy__40;
          v49 = __Block_byref_object_dispose__40;
          v50 = 0;
          v30 = self->_monitoredActivity;
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_2;
          v33[3] = &unk_1E9335238;
          v24 = v21;
          v17 = v32;
          v20 = v24;
          v34 = v24;
          v25 = v23;
          v18 = v31;
          v29 = v25;
          v41 = v25;
          v35 = v12;
          v36 = v16;
          v37 = v13;
          v38 = v32;
          v39 = v14;
          v40 = v31;
          v42 = &v51;
          v43 = &v45;
          var0 = a6.var0;
          +[TRIDeferralNotifier forwardDeferralsFromMonitoredActivity:usingDarwinNotificationName:whileExecutingBlock:](TRIDeferralNotifier, "forwardDeferralsFromMonitoredActivity:usingDarwinNotificationName:whileExecutingBlock:", v30, "com.apple.trial.TrialArchivingService.shouldDefer", v33);
          -[NSObject invalidate](v20, "invalidate");
          v26 = (void *)*((_QWORD *)v58 + 5);
          if (v26)
          {
            v27 = v29;
            if (a7)
            {
              objc_storeStrong(a7, v26);
              LOBYTE(a7) = 0;
            }
          }
          else
          {
            v27 = v29;
            if (a7)
              objc_storeStrong(a7, (id)v46[5]);
            LOBYTE(a7) = *((_BYTE *)v52 + 32);
          }

          _Block_object_dispose(&v45, 8);
          _Block_object_dispose(&v51, 8);

          _Block_object_dispose(buf, 8);
        }

      }
      else
      {
        LOBYTE(a7) = 0;
      }

    }
    else
    {
      LOBYTE(a7) = 0;
    }

  }
  else
  {
    LOBYTE(a7) = 0;
  }

  objc_autoreleasePoolPop(v15);
  return ($A5A652246548B43F8BC05201A1C72A70)a7;
}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "synchronousRemoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 112);
  v10[1] = 3221225472;
  v10[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_3;
  v10[3] = &unk_1E9335210;
  v11 = *(_OWORD *)(a1 + 96);
  v10[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v2, "applyPatchWithFilename:patchExtension:toSrcDir:srcDirExtension:writingToDestDir:destDirExtension:postPatchCompression:completion:", v3, v4, v5, v6, v7, v8, v9, v10);

}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredActivity, 0);
}

@end
