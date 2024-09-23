@implementation TRISandboxExtensionFactory

+ (id)extensionTokenForPath:(id)a3 extensionClass:(unsigned __int8)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int *v12;
  char *v13;
  int v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "fileSystemRepresentation");
  v5 = sandbox_extension_issue_file();
  if (!v5)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      v14 = *__error();
      v16 = 138543874;
      v17 = (uint64_t)v4;
      v18 = 2080;
      v19 = v13;
      v20 = 1024;
      v21 = v14;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "failed to issue extension for \"%{public}@\" err %s errno %d", (uint8_t *)&v16, 0x1Cu);
    }
    goto LABEL_11;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v5, 4);
  free(v6);
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "failed to construct sandbox extension with raw token", (uint8_t *)&v16, 2u);
    }

    v10 = 0;
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "issuing extension to com.apple.trial.TrialArchivingService for %s", (uint8_t *)&v16, 0xCu);
  }

  v10 = v7;
  v11 = v10;
LABEL_12:

  return v11;
}

@end
