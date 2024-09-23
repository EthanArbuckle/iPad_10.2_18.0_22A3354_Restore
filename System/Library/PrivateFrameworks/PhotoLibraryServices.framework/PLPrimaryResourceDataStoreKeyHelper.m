@implementation PLPrimaryResourceDataStoreKeyHelper

- (PLPrimaryResourceDataStoreKeyHelper)initWithPathManager:(id)a3
{
  id v5;
  PLPrimaryResourceDataStoreKeyHelper *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  size_t v15;
  char *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLPrimaryResourceDataStoreKeyHelper;
  v6 = -[PLPrimaryResourceDataStoreKeyHelper init](&v19, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLPrimaryResourceDataStore.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    }
    objc_msgSend(v5, "photoDirectoryWithType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v7, &v6->bundleBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v12, &v6->originalsBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v8, &v6->rendersBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v9, &v6->derivativesBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v10, &v6->masterThumbsBaseData);
    __59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(v11, &v6->computeBaseData);
    +[PLThumbnailManager masterThumbFilename](PLThumbnailManager, "masterThumbFilename");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");

    v15 = strlen(v14);
    v16 = (char *)malloc_type_calloc(v15 + 1, 1uLL, 0x716AB79uLL);
    v6->masterThumbFilenameData = v16;
    strcpy(v16, v14);

  }
  return v6;
}

char *__59__PLPrimaryResourceDataStoreKeyHelper_initWithPathManager___block_invoke(void *a1, char **a2)
{
  const char *v3;
  size_t v4;
  char *v5;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v4 = strlen(v3);
  v5 = (char *)malloc_type_calloc(v4 + 1, 1uLL, 0x45D3FD29uLL);
  *a2 = v5;
  return strcpy(v5, v3);
}

- (void)dealloc
{
  objc_super v3;

  free(self->originalsBaseData);
  self->originalsBaseData = 0;
  free(self->rendersBaseData);
  self->rendersBaseData = 0;
  free(self->derivativesBaseData);
  self->derivativesBaseData = 0;
  free(self->masterThumbsBaseData);
  self->masterThumbsBaseData = 0;
  free(self->computeBaseData);
  self->computeBaseData = 0;
  free(self->masterThumbFilenameData);
  self->masterThumbFilenameData = 0;
  free(self->bundleBaseData);
  self->bundleBaseData = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStoreKeyHelper;
  -[PLPrimaryResourceDataStoreKeyHelper dealloc](&v3, sel_dealloc);
}

@end
