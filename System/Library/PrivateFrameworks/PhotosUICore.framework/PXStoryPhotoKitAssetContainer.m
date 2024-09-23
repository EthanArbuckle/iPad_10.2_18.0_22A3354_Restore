@implementation PXStoryPhotoKitAssetContainer

- (PXStoryPhotoKitAssetContainer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPhotoKitAssetContainer.m"), 20, CFSTR("%s is not available as initializer"), "-[PXStoryPhotoKitAssetContainer init]");

  abort();
}

- (PXStoryPhotoKitAssetContainer)initWithAssetCollection:(id)a3 originalContainer:(id)a4
{
  id v8;
  id v9;
  PXStoryPhotoKitAssetContainer *v10;
  PXStoryPhotoKitAssetContainer *v11;
  uint64_t v12;
  PHPhotoLibrary *photoLibrary;
  PHObject *originalContainer;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  void *v23;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryPhotoKitAssetContainer;
  v10 = -[PXStoryPhotoKitAssetContainer init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    objc_storeStrong((id *)&v11->_originalContainer, a4);
    objc_msgSend(v8, "photoLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v11->_photoLibrary;
    v11->_photoLibrary = (PHPhotoLibrary *)v12;

    originalContainer = v11->_originalContainer;
    if (originalContainer)
    {
      -[PHObject photoLibrary](originalContainer, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v11->_photoLibrary);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PXStoryPhotoKitAssetContainer.m"), 31, CFSTR("photo library mismatch"));

      }
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v20;

  }
  return v11;
}

- (PHObject)container
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXStoryPhotoKitAssetContainer originalContainer](self, "originalContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PXStoryPhotoKitAssetContainer assetCollection](self, "assetCollection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (PHObject *)v6;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryPhotoKitAssetContainer *v4;
  PXStoryPhotoKitAssetContainer *v5;
  PXStoryPhotoKitAssetContainer *v6;
  PXStoryPhotoKitAssetContainer *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (PXStoryPhotoKitAssetContainer *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      if (!v7)
      {
        v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
      -[PXStoryPhotoKitAssetContainer assetCollection](self, "assetCollection");
      v6 = (PXStoryPhotoKitAssetContainer *)objc_claimAutoreleasedReturnValue();
      -[PXStoryPhotoKitAssetContainer assetCollection](v7, "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PXStoryPhotoKitAssetContainer isEqual:](v6, "isEqual:", v8))
      {
        -[PXStoryPhotoKitAssetContainer originalContainer](self, "originalContainer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryPhotoKitAssetContainer originalContainer](v7, "originalContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
          v11 = 1;
        else
          v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v7 = 0;
      v11 = 0;
    }

    goto LABEL_16;
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXStoryPhotoKitAssetContainer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[PXStoryPhotoKitAssetContainer originalContainer](self, "originalContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPhotoKitAssetContainer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHObject)originalContainer
{
  return self->_originalContainer;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_originalContainer, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

@end
