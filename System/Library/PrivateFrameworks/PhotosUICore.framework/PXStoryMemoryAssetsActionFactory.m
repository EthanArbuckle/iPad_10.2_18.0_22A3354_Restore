@implementation PXStoryMemoryAssetsActionFactory

- (PXStoryMemoryAssetsActionFactory)initWithViewModel:(id)a3
{
  id v5;
  PXStoryMemoryAssetsActionFactory *v6;
  PXStoryMemoryAssetsActionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMemoryAssetsActionFactory;
  v6 = -[PXStoryMemoryAssetsActionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (id)rearrangeMemoryAssetsActionWithAssetCollection:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  PXStoryRearrangeMemoryAssetsAction *v15;
  void *v17;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PXStoryMemoryAssetsActionFactory viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mainModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "currentAssetCollection");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryAssetsActionFactory.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection == modelCollection"));

  }
  v15 = -[PXStoryRearrangeMemoryAssetsAction initWithModel:movedAssets:beforeAsset:]([PXStoryRearrangeMemoryAssetsAction alloc], "initWithModel:movedAssets:beforeAsset:", v13, v10, v9);

  return v15;
}

- (id)assetsPickerPresenter
{
  void *v2;
  void *v3;

  -[PXStoryMemoryAssetsActionFactory viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
