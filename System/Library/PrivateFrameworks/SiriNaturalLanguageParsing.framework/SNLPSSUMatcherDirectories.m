@implementation SNLPSSUMatcherDirectories

- (SNLPSSUMatcherDirectories)initWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5
{
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;
  SNLPSSUMatcherDirectories *v11;
  NSURL *cacheDirectoryURL;
  NSURL *v13;
  NSURL *modelAssetsDirectoryURL;
  NSURL *v15;
  NSURL *datasetAssetsDirectoryURL;
  objc_super v18;

  v8 = (NSURL *)a3;
  v9 = (NSURL *)a4;
  v10 = (NSURL *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SNLPSSUMatcherDirectories;
  v11 = -[SNLPSSUMatcherDirectories init](&v18, sel_init);
  cacheDirectoryURL = v11->_cacheDirectoryURL;
  v11->_cacheDirectoryURL = v8;
  v13 = v8;

  modelAssetsDirectoryURL = v11->_modelAssetsDirectoryURL;
  v11->_modelAssetsDirectoryURL = v9;
  v15 = v9;

  datasetAssetsDirectoryURL = v11->_datasetAssetsDirectoryURL;
  v11->_datasetAssetsDirectoryURL = v10;

  return v11;
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)modelAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)datasetAssetsDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_modelAssetsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
}

+ (id)directoriesWithCacheDirectoryURL:(id)a3 modelAssetsDirectoryURL:(id)a4 datasetAssetsDirectoryURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v30[0] = v10;
  v30[1] = v11;
  v30[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v18, "isFileURL") & 1) == 0)
        {
          if (a6)
          {
            v20 = *MEMORY[0x1E0CB2D68];
            v28[0] = *MEMORY[0x1E0CB2D50];
            v28[1] = v20;
            v29[0] = CFSTR("Could not build an SNLPSSUMatcherDirectories object");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The given directory is not a file URL: %@."), v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 1, v22);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          v19 = 0;
          goto LABEL_13;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v15)
        continue;
      break;
    }
  }

  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCacheDirectoryURL:modelAssetsDirectoryURL:datasetAssetsDirectoryURL:", v10, v11, v12);
LABEL_13:

  return v19;
}

@end
