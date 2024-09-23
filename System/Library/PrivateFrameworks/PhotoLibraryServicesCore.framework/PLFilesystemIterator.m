@implementation PLFilesystemIterator

- (PLFilesystemIterator)initWithFilePath:(id)a3
{
  id v6;
  PLFilesystemIterator *v7;
  PLFilesystemIterator *v8;
  NSFileManager *v9;
  NSFileManager *fileManager;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFilesystemIterator.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLFilesystemIterator;
  v7 = -[PLFilesystemIterator init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_path, a3);
    v9 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = v8->_fileManager;
    v8->_fileManager = v9;

  }
  return v8;
}

- (void)visitURLsLoadingPropertiesForKeys:(id)a3 withBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(id, _QWORD);
  BOOL v8;
  void *v9;
  NSString *path;
  NSFileManager *fileManager;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  NSError *v25;
  NSError *error;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  BOOL v32;
  char v33;
  uint64_t v34;
  NSString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, _QWORD))a4;
  v8 = -[PLFilesystemIterator continueAfterError](self, "continueAfterError");
  v33 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", self->_path, &v33))
  {
    v9 = (void *)MEMORY[0x19AEC2E4C]();
    path = self->_path;
    if (v33)
    {
      fileManager = self->_fileManager;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", path);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __68__PLFilesystemIterator_visitURLsLoadingPropertiesForKeys_withBlock___block_invoke;
      v31[3] = &unk_1E3768970;
      v31[4] = self;
      v32 = v8;
      -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v6, 0, v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x19AEC2E4C](v15);
          LODWORD(v19) = v7[2](v7, v19);
          objc_autoreleasePoolPop(v20);
          if (!(_DWORD)v19)
            break;
          if (v16 == ++v18)
          {
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
            v16 = v15;
            if (v15)
              goto LABEL_5;
            break;
          }
        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", path);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      ((uint64_t (**)(id, id))v7)[2](v7, v14);
    }

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2FE0];
    v23 = self->_path;
    v34 = *MEMORY[0x1E0CB2AA0];
    v35 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 2, v24);
    v25 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v25;

  }
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)continueAfterError
{
  return self->_continueAfterError;
}

- (void)setContinueAfterError:(BOOL)a3
{
  self->_continueAfterError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

uint64_t __68__PLFilesystemIterator_visitURLsLoadingPropertiesForKeys_withBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), obj);
  return *(unsigned __int8 *)(a1 + 40);
}

@end
