@implementation PLAbstractLibraryServicesManagerService

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (PLAbstractLibraryServicesManagerService)initWithLibraryServicesManager:(id)a3
{
  id v6;
  PLAbstractLibraryServicesManagerService *v7;
  PLAbstractLibraryServicesManagerService *v8;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAbstractLibraryServicesManagerService.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager != nil"));

  }
  v7 = -[PLAbstractLibraryServicesManagerService init](self, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_libraryServicesManager, a3);

  return v8;
}

- (id)newShortLivedLibraryWithName:(const char *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", a3);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

@end
