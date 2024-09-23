@implementation PXPeopleDetailSettingsAssetsViewController

- (PXPeopleDetailSettingsAssetsViewController)initWithAssets:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
  {
    -[PXPeopleDetailSettingsAssetsViewController superclass](self, "superclass");
    objc_storeStrong((id *)&self->_assets, a3);
  }

  return self;
}

- (void)viewDidLoad
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXPeopleDetailSettingsAssetsViewController;
  -[PXPeopleDetailSettingsAssetsViewController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 15.0);
  objc_msgSend(v3, "setMinimumLineSpacing:", 15.0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXPeopleDetailSettingsAssetsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  -[PXPeopleDetailSettingsAssetsViewController setCollectionView:](self, "setCollectionView:", v6);

  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("faceCellIdentifier"));

  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  -[PXPeopleDetailSettingsAssetsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsAssetsViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("faceCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tag") + 1;
  objc_msgSend(v7, "setTag:", v8);
  -[PXPeopleDetailSettingsAssetsViewController assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v12, "setDeliveryMode:", 0);
  objc_msgSend(v12, "setResizeMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v19[3] = &unk_1E5146170;
  v17 = v7;
  v20 = v17;
  v21 = v8;
  objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 1, v12, v19, v15 * 110.0, v15 * 110.0);

  return v17;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleDetailSettingsAssetsViewController assets](self, "assets", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 110.0;
  v6 = 110.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 2.0;
  v6 = 2.0;
  v7 = 2.0;
  v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  PXPeopleDetailSettingsOneUpViewController *v16;
  void *v17;
  void *v18;
  PXPeopleDetailSettingsOneUpViewController *v19;
  _QWORD v20[4];
  PXPeopleDetailSettingsOneUpViewController *v21;

  v5 = a4;
  -[PXPeopleDetailSettingsAssetsViewController assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v9, "setDeliveryMode:", 0);
  objc_msgSend(v9, "setResizeMode:", 1);
  -[PXPeopleDetailSettingsAssetsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  -[PXPeopleDetailSettingsAssetsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  v16 = -[PXPeopleDetailSettingsOneUpViewController initWithAsset:]([PXPeopleDetailSettingsOneUpViewController alloc], "initWithAsset:", 0);
  -[PXPeopleDetailSettingsAssetsViewController navigationController](self, "navigationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pushViewController:animated:", v16, 1);

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v20[3] = &unk_1E513F148;
  v21 = v16;
  v19 = v16;
  objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v9, v20, v12, v15);

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

void __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E5148D08;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __86__PXPeopleDetailSettingsAssetsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAsset:", *(_QWORD *)(a1 + 40));
}

void __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5145560;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__PXPeopleDetailSettingsAssetsViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  return result;
}

@end
