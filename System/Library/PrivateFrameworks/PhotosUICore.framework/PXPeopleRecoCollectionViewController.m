@implementation PXPeopleRecoCollectionViewController

- (id)_initWithPerson:(id)a3
{
  id v4;
  id v5;
  PXPeopleRecoCollectionViewController *v6;
  PXPeopleRecoDataSource *v7;
  PXPeopleRecoDataSource *dataSource;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UICollectionViewSupplementaryRegistration *headerRegistration;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleRecoCollectionViewController;
  v6 = -[PXPeopleRecoCollectionViewController initWithCollectionViewLayout:](&v17, sel_initWithCollectionViewLayout_, v5);

  if (v6)
  {
    v7 = -[PXPeopleRecoDataSource initWithPerson:dataSourceDelegate:]([PXPeopleRecoDataSource alloc], "initWithPerson:dataSourceDelegate:", v4, v6);
    dataSource = v6->_dataSource;
    v6->_dataSource = v7;

    v9 = (void *)MEMORY[0x1E0DC3640];
    v10 = objc_opt_class();
    v11 = *MEMORY[0x1E0DC48A8];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PXPeopleRecoCollectionViewController__initWithPerson___block_invoke;
    v15[3] = &unk_1E5125C38;
    v16 = v4;
    objc_msgSend(v9, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v10, v11, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    headerRegistration = v6->_headerRegistration;
    v6->_headerRegistration = (UICollectionViewSupplementaryRegistration *)v12;

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  PXPeopleRecoCollectionView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  PXPeopleRecoCollectionView *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXPeopleRecoCollectionViewController;
  -[PXPeopleRecoCollectionViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PXPeopleRecoCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PXPeopleRecoCollectionView alloc];
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXPeopleRecoCollectionView initWithFrame:collectionViewLayout:](v4, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);

  -[PXPeopleRecoCollectionView setRecoCollectionViewDelegate:](v14, "setRecoCollectionViewDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRecoCollectionView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  -[PXPeopleRecoCollectionView setPrefetchDataSource:](v14, "setPrefetchDataSource:", self);
  -[PXPeopleRecoCollectionView setContentInsetAdjustmentBehavior:](v14, "setContentInsetAdjustmentBehavior:", 3);
  -[PXPeopleRecoCollectionViewController setCollectionView:](self, "setCollectionView:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewController;
  -[PXPeopleRecoCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PXPeopleRecoCollectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRecoCollectionViewController;
  -[PXPeopleRecoCollectionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPeopleRecoCollectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 1, 1);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[7];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v8);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v7, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v15 = v14;

  v16 = (void *)MEMORY[0x1E0DC35C8];
  v17 = objc_opt_class();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v22[3] = &__block_descriptor_56_e83_v32__0__PXPeopleRecoCollectionViewCell_8__NSIndexPath_16__PXPeopleRecoDataSource_24l;
  v22[4] = v10;
  v22[5] = v12;
  v22[6] = v15;
  objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v18, v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  -[PXPeopleRecoCollectionViewController headerRegistration](self, "headerRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v13, "toggleRejectionForIndex:", objc_msgSend(v6, "item"));
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasImageSet"))
  {
    objc_msgSend(v9, "setIsRejected:", v8);
    v10 = objc_msgSend(v13, "shouldAllowCommitting");
    -[PXPeopleRecoCollectionViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", v10);

  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer marginForGridClass:width:](PXPeopleGridSizer, "marginForGridClass:width:", 0, v5);
  v7 = v6;
  v8 = v6;
  v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(a3, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemSize");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v6, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v8, "requestImageForItemAtIndex:targetSize:displayScale:imageBlock:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "item", (_QWORD)v22), 0, v11, v13, v16);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXPeopleRecoCollectionViewController view](self, "view", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = 40.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_doneTapped:(id)a3
{
  void *v4;
  id v5;

  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitChanges");

  -[PXPeopleRecoCollectionViewController presentingViewController](self, "presentingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_cancelTapped:(id)a3
{
  id v3;

  -[PXPeopleRecoCollectionViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_reviewMoreTapped:(id)a3
{
  PXPeopleSplitConfirmationViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPeopleSplitConfirmationViewController *v9;

  v4 = [PXPeopleSplitConfirmationViewController alloc];
  -[PXPeopleRecoCollectionViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPeopleSplitConfirmationViewController initWithPerson:](v4, "initWithPerson:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  -[PXPeopleRecoCollectionViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)recoDataSourceDataChanged:(id)a3
{
  id v3;

  -[PXPeopleRecoCollectionViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)collectionView:(id)a3 frameDidChange:(CGRect)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleRecoCollectionViewController.m"), 193, CFSTR("%s must be called on the main thread"), "-[PXPeopleRecoCollectionViewController collectionView:frameDidChange:]");

  }
  objc_msgSend(v8, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (PXPeopleRecoDataSource)dataSource
{
  return self->_dataSource;
}

- (UICollectionViewSupplementaryRegistration)headerRegistration
{
  return self->_headerRegistration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke(double *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(v7, "tag") + 1;
  objc_msgSend(v7, "setTag:", v10);
  v11 = objc_msgSend(v9, "item");

  v13 = a1[5];
  v12 = a1[6];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  v17[3] = &unk_1E5125C88;
  v18 = v7;
  v19 = v8;
  v20 = v10;
  v21 = v11;
  v14 = a1[4];
  v15 = v8;
  v16 = v7;
  objc_msgSend(v15, "requestImageForItemAtIndex:targetSize:displayScale:imageBlock:", v11, v17, v14, v13, v12);

}

void __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v4 = v3;
  px_dispatch_on_main_queue();

}

uint64_t __78__PXPeopleRecoCollectionViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "tag");
  if (result == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRejected:", objc_msgSend(*(id *)(a1 + 40), "isIndexRejected:", *(_QWORD *)(a1 + 64)));
    return objc_msgSend(*(id *)(a1 + 32), "setImage:contentsRect:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  return result;
}

void __56__PXPeopleRecoCollectionViewController__initWithPerson___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "px_localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, CFSTR("PXPeopleImproveRecoHeaderNamed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    PXStringWithValidatedFormat();
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v7, 0, CFSTR("PXPeopleImproveRecoHeaderUnnamed"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setTitle:", v10, v9);

}

+ (id)recoControllerForPerson:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PXPeopleRecoCollectionViewController _initWithPerson:]([PXPeopleRecoCollectionViewController alloc], "_initWithPerson:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v5, "setToolbarHidden:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PXLocalizedStringFromTable(CFSTR("PXPeopleImproveRecoReviewMore"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 0, v4, sel__reviewMoreTapped_);

  v21[0] = v6;
  v21[1] = v10;
  v21[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarItems:", v11);

  v12 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PXLocalizedStringFromTable(CFSTR("PXPeopleImproveRecoCancel"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTitle:style:target:action:", v13, 0, v4, sel__cancelTapped_);

  v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PXLocalizedStringFromTable(CFSTR("PXPeopleImproveRecoDone"), CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 2, v4, sel__doneTapped_);

  objc_msgSend(v4, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v14);
  objc_msgSend(v18, "setRightBarButtonItem:", v17);
  PXLocalizedStringFromTable(CFSTR("PXPeopleImproveRecoHeaderTitle"), CFSTR("PhotosUICore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v19);

  return v5;
}

@end
