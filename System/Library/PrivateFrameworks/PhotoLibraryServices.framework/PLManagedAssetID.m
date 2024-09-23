@implementation PLManagedAssetID

- (PLManagedAssetID)initWithManagedAsset:(id)a3
{
  id v5;
  PLManagedAssetID *v6;
  uint64_t v7;
  NSString *uuid;
  uint64_t v9;
  NSString *filename;
  uint64_t v11;
  NSString *directory;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PLPhotoLibraryPathManagerIdentifier *libraryID;
  void *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLManagedAssetID;
  v6 = -[PLManagedAssetID init](&v20, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLManagedAssetID.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    }
    objc_msgSend(v5, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    objc_msgSend(v5, "filename");
    v9 = objc_claimAutoreleasedReturnValue();
    filename = v6->_filename;
    v6->_filename = (NSString *)v9;

    objc_msgSend(v5, "directory");
    v11 = objc_claimAutoreleasedReturnValue();
    directory = v6->_directory;
    v6->_directory = (NSString *)v11;

    v6->_bundleScope = objc_msgSend(v5, "bundleScope");
    objc_msgSend(v5, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryID");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PLLibraryIDFromPathManager();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    libraryID = v6->_libraryID;
    v6->_libraryID = (PLPhotoLibraryPathManagerIdentifier *)v15;

  }
  return v6;
}

- (PLManagedAssetID)initWithUUID:(id)a3 filename:(id)a4 directory:(id)a5 libraryID:(id)a6 bundleScope:(unsigned __int16)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PLManagedAssetID *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PLManagedAssetID;
  v17 = -[PLManagedAssetID init](&v24, sel_init);
  if (v17)
  {
    if (v13)
    {
      if (v14)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PLManagedAssetID.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

      if (v14)
      {
LABEL_4:
        if (v15)
          goto LABEL_5;
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PLManagedAssetID.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v15)
    {
LABEL_5:
      if (v16)
      {
LABEL_6:
        objc_storeStrong((id *)&v17->_uuid, a3);
        objc_storeStrong((id *)&v17->_filename, a4);
        objc_storeStrong((id *)&v17->_directory, a5);
        objc_storeStrong((id *)&v17->_libraryID, a6);
        v17->_bundleScope = a7;
        goto LABEL_7;
      }
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PLManagedAssetID.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryID"));

      goto LABEL_6;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PLManagedAssetID.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

    if (v16)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_7:

  return v17;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
