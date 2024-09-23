@implementation PXPeopleDonationSettingsSuggestionViewController

- (PXPeopleDonationSettingsSuggestionViewController)initWithPerson:(id)a3
{
  id v5;
  PXPeopleDonationSettingsSuggestionViewController *v6;
  PXPeopleDonationSettingsSuggestionViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleDonationSettingsSuggestionViewController;
  v6 = -[PXPeopleDonationSettingsSuggestionViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_person, a3);

  return v7;
}

- (void)loadDataSource
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  -[PXPeopleDonationSettingsSuggestionViewController person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDonationSettingsSuggestionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke;
  block[3] = &unk_1E51457C8;
  block[4] = self;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleDonationSettingsSuggestionViewController;
  -[PXPeopleDonationSettingsSuggestionViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setMinimumLineSpacing:", 15.0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[PXPeopleDonationSettingsSuggestionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setAllowsSelection:", 0);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("faceCellIdentifier"));
  -[PXPeopleDonationSettingsSuggestionViewController setCollectionView:](self, "setCollectionView:", v6);
  -[PXPeopleDonationSettingsSuggestionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDonationSettingsSuggestionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[PXPeopleDonationSettingsSuggestionViewController loadDataSource](self, "loadDataSource");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PHFetchResult count](self->_faceCrops, "count", a3, a4);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXPeopleDonationSettingsSuggestionViewController collectionView](self, "collectionView", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;

  v8 = 30.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("faceCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTag:", objc_msgSend(v7, "tag") + 1);
  v8 = objc_msgSend(v6, "item");

  -[PHFetchResult objectAtIndexedSubscript:](self->_faceCrops, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v10);
  objc_msgSend(v7, "setImage:", v11);

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

- (PHPerson)person
{
  return self->_person;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (PHFetchResult)faceCrops
{
  return self->_faceCrops;
}

- (void)setFaceCrops:(id)a3
{
  objc_storeStrong((id *)&self->_faceCrops, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0CD1538], "fetchTransientTrainingFaceCropsForPerson:options:", *(_QWORD *)(a1 + 40), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 992);
  *(_QWORD *)(v4 + 992) = v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke_2;
  block[3] = &unk_1E5149198;
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_sync_exit(v2);
}

uint64_t __66__PXPeopleDonationSettingsSuggestionViewController_loadDataSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

@end
