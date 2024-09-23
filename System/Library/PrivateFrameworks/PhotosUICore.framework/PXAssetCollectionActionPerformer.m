@implementation PXAssetCollectionActionPerformer

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionActionManager.m"), 214, CFSTR("%s is not available as initializer"), "-[PXAssetCollectionActionPerformer initWithActionType:]");

  abort();
}

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXAssetCollectionActionPerformer *v12;
  PXAssetCollectionActionPerformer *v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollectionActionManager.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollectionReference"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXAssetCollectionActionPerformer;
  v12 = -[PXActionPerformer initWithActionType:](&v16, sel_initWithActionType_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollectionReference, a4);
    objc_storeStrong((id *)&v13->_displayTitleInfo, a5);
  }

  return v13;
}

- (PXAssetCollectionActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXDisplayTitleInfo *v12;
  void *v13;
  PXDisplayTitleInfo *v14;
  PXAssetCollectionActionPerformer *v15;
  PXAssetCollectionActionPerformer *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = [PXDisplayTitleInfo alloc];
  objc_msgSend(v10, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:](v12, "initWithAssetCollection:useVerboseSmartDescription:", v13, 0);

  v15 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](self, "initWithActionType:assetCollectionReference:displayTitleInfo:", v9, v10, v14);
  if (v15)
  {
    v17 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PXAssetCollectionActionManager.m"), 232, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:parameters:]", v20);

    abort();
  }

  return 0;
}

- (PXDisplayAssetCollection)assetCollection
{
  void *v2;
  void *v3;

  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAssetCollection *)v3;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  return self->_displayTitleInfo;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (PHFetchResult)socialGroups
{
  return self->_socialGroups;
}

- (void)setSocialGroups:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroups, a3);
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (void)setDropTargetAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDragSession:(id)a3
{
  objc_storeStrong((id *)&self->_dragSession, a3);
}

- (UIDropSession)dropSession
{
  return self->_dropSession;
}

- (void)setDropSession:(id)a3
{
  objc_storeStrong((id *)&self->_dropSession, a3);
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void)setAssetsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDataSource, a3);
}

- (PHFetchResult)assetsFetchResult
{
  return self->_assetsFetchResult;
}

- (void)setAssetsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_assetsFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_socialGroups, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_displayTitleInfo, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
}

@end
