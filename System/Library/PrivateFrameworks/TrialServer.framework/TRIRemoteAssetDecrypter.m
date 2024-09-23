@implementation TRIRemoteAssetDecrypter

+ (BOOL)decryptAssetWithURL:(id)a3 destinationFilename:(id)a4 namespaceName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v27 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.trial.TrialArchivingService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC9D248);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v13);

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__36;
  v34 = __Block_byref_object_dispose__36;
  v14 = MEMORY[0x1E0C809B0];
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke;
  v29[3] = &unk_1E9333890;
  v29[4] = &v30;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");
  objc_msgSend(v10, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIRemoteAssetDecrypter.m"), 34, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

  }
  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v11, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (!v17)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Unable to get source extension token for path: %{public}@, namespace name: %{public}@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (!v18)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Unable to get destination extension token for path: %{public}@, namespace name: %{public}@", buf, 0x16u);
    }
LABEL_14:

    v21 = 0;
    goto LABEL_17;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke_22;
  v28[3] = &unk_1E9334E50;
  v28[4] = buf;
  objc_msgSend(v15, "decryptAssetWithURL:toDestinationFileURL:namespaceName:sourceExtension:destinationExtension:completion:", v10, v20, v27, v17, v19, v28);

  objc_msgSend(v12, "invalidate");
  if (a6)
    *a6 = objc_retainAutorelease((id)v31[5]);
  if (v31[5])
    v21 = 0;
  else
    v21 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_17:

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke(uint64_t a1, void *a2)
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

void __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke_22(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "decryption of asset completed with result %{public}@", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

@end
