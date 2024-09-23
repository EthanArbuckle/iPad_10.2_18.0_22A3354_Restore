@implementation PXSharedLibraryEmptyDataSourceManager

- (id)createInitialDataSource
{
  return objc_alloc_init(PXSharedLibraryEmptyDataSource);
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareURL"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1002, CFSTR("Failed to fetch shared library for URL in the PXSharedLibraryEmptyDataSourceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v8);

}

- (id)fetchPreview
{
  return 0;
}

- (id)fetchSharedLibrary
{
  return 0;
}

- (id)fetchExiting
{
  return 0;
}

@end
