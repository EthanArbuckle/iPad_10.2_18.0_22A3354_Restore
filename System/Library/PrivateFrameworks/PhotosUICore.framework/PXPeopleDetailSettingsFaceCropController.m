@implementation PXPeopleDetailSettingsFaceCropController

- (PXPeopleDetailSettingsFaceCropController)init
{
  PXPeopleDetailSettingsFaceCropController *v2;
  PXPeopleDetailSettingsFaceCropDataSource *v3;
  PXPeopleDetailSettingsFaceCropDataSource *dataSource;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsFaceCropController;
  v2 = -[PXPeopleDetailSettingsFaceCropController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXPeopleDetailSettingsFaceCropDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;

  }
  return v2;
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
  v15.super_class = (Class)PXPeopleDetailSettingsFaceCropController;
  -[PXPeopleDetailSettingsFaceCropController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 2.0);
  objc_msgSend(v3, "setMinimumLineSpacing:", 2.0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXPeopleDetailSettingsFaceCropController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  -[PXPeopleDetailSettingsFaceCropController setCollectionView:](self, "setCollectionView:", v6);

  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("faceCropCellIdentifier"));

  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  -[PXPeopleDetailSettingsFaceCropController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsFaceCropController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleDetailSettingsFaceCropController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfAssets");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  _OWORD v16[3];

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("faceCropCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTag:", objc_msgSend(v7, "tag") + 1);
  -[PXPeopleDetailSettingsFaceCropController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleDetailSettingsFaceCropController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImage:", v11);
  objc_msgSend(v7, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 1.0);
  objc_msgSend(v12, "setHighlighted:", 0);
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16[0] = *MEMORY[0x1E0C9BAA8];
  v16[1] = v13;
  v16[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v12, "setTransform:", v16);
  objc_msgSend(v7, "quantityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperview");

  objc_msgSend(v7, "setName:", v9);
  return v7;
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v6 = v5;
  v7 = 10.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 10.0;
  v6 = 0.0;
  v7 = 10.0;
  v8 = 2.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (PXPeopleDetailSettingsFaceCropDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
