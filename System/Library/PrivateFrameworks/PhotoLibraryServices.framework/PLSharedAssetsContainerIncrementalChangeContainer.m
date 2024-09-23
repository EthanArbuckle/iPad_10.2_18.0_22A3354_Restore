@implementation PLSharedAssetsContainerIncrementalChangeContainer

- (PLSharedAssetsContainerIncrementalChangeContainer)initWithAsset:(id)a3 change:(id)a4
{
  id v8;
  id v9;
  PLSharedAssetsContainerIncrementalChangeContainer *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSharedAssetsContainerIncrementalChangeContainer;
  v10 = -[PLSharedAssetsContainerIncrementalChangeContainer init](&v14, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_asset, a3);
        objc_storeStrong((id *)&v10->_change, a4);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PLSharedAssetsContainer.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PLSharedAssetsContainer.m"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("change"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (PLSharedAssetsContainerIncrementalChange)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
