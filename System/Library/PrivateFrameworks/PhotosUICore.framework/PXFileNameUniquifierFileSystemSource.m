@implementation PXFileNameUniquifierFileSystemSource

- (PXFileNameUniquifierFileSystemSource)init
{
  PXFileNameUniquifierFileSystemSource *v2;
  NSFileManager *v3;
  NSFileManager *fileManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFileNameUniquifierFileSystemSource;
  v2 = -[PXFileNameUniquifierFileSystemSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;

  }
  return v2;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXFileNameUniquifierFileSystemSource fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
