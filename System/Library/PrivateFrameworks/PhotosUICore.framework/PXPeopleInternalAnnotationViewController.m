@implementation PXPeopleInternalAnnotationViewController

- (id)_initWithPerson:(id)a3 withDismissCompletion:(id)a4 withCancelCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  PXPeopleInternalAnnotationViewController *v13;
  PXPeopleInternalAnnotationDataSource *v14;
  PXPeopleInternalAnnotationDataSource *dataSource;
  void *v16;
  id dismissCompletion;
  void *v18;
  id cancelCompletion;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v21.receiver = self;
  v21.super_class = (Class)PXPeopleInternalAnnotationViewController;
  v13 = -[PXPeopleInternalAnnotationViewController initWithCollectionViewLayout:](&v21, sel_initWithCollectionViewLayout_, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_person, a3);
    v14 = -[PXPeopleInternalAnnotationDataSource initWithPerson:dataSourceDelegate:]([PXPeopleInternalAnnotationDataSource alloc], "initWithPerson:dataSourceDelegate:", v13->_person, v13);
    dataSource = v13->_dataSource;
    v13->_dataSource = v14;

    v16 = _Block_copy(v10);
    dismissCompletion = v13->_dismissCompletion;
    v13->_dismissCompletion = v16;

    v18 = _Block_copy(v11);
    cancelCompletion = v13->_cancelCompletion;
    v13->_cancelCompletion = v18;

  }
  return v13;
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
  v16.super_class = (Class)PXPeopleInternalAnnotationViewController;
  -[PXPeopleInternalAnnotationViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PXPeopleInternalAnnotationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView");
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

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRecoCollectionView setBackgroundColor:](v14, "setBackgroundColor:", v15);

  -[PXPeopleRecoCollectionView setContentInsetAdjustmentBehavior:](v14, "setContentInsetAdjustmentBehavior:", 3);
  -[PXPeopleRecoCollectionView setDelegate:](v14, "setDelegate:", self);
  -[PXPeopleInternalAnnotationViewController setCollectionView:](self, "setCollectionView:", v14);
  -[PXPeopleRecoCollectionView enableSwipeSelectionWithDelegate:](v14, "enableSwipeSelectionWithDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleInternalAnnotationViewController;
  -[PXPeopleInternalAnnotationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PXPeopleInternalAnnotationViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleInternalAnnotationViewController;
  -[PXPeopleInternalAnnotationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PXPeopleInternalAnnotationViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 1, 1);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[PXPeopleInternalAnnotationDataSource numberOfSections](self->_dataSource, "numberOfSections", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PXPeopleInternalAnnotationDataSource numberOfItemsInSection:](self->_dataSource, "numberOfItemsInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PXPeopleInternalAnnotationViewController getCellRegistrationForCollectionView:](self, "getCellRegistrationForCollectionView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v8, v6, self->_dataSource);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getCellRegistrationForCollectionView:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[8];

  v4 = a3;
  objc_msgSend(v4, "frame");
  +[PXPeopleGridSizer cellSizeForGridClass:width:](PXPeopleGridSizer, "cellSizeForGridClass:width:", 0, v5);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayScale");
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0DC35C8];
  v14 = objc_opt_class();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__PXPeopleInternalAnnotationViewController_getCellRegistrationForCollectionView___block_invoke;
  v16[3] = &unk_1E5124EE0;
  v16[4] = self;
  v16[5] = v7;
  v16[6] = v9;
  v16[7] = v12;
  objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, v16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v7 = (void *)MEMORY[0x1E0DC3640];
  v8 = a5;
  v9 = a3;
  v10 = objc_opt_class();
  v11 = *MEMORY[0x1E0DC48A8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__PXPeopleInternalAnnotationViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v15[3] = &unk_1E5125C38;
  v15[4] = self;
  objc_msgSend(v7, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v10, v11, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "cellForItemAtIndexPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasImageSet"))
    objc_msgSend(v6, "setIsRejected:", -[PXPeopleInternalAnnotationDataSource toggleRejectionForIndexPath:](self->_dataSource, "toggleRejectionForIndexPath:", v7));

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

- (id)initialSelectedIndexPathsForSwipeSelectionManager:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  return v6;
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "compare:", v8);
  if (v9 == -1)
    v10 = v7;
  else
    v10 = v8;
  v24 = v8;
  v25 = v7;
  if (v9 != -1)
    v8 = v7;
  v11 = v10;
  v12 = v8;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = v11;
  v14 = objc_msgSend(v11, "section");
  v15 = objc_msgSend(v12, "section");
  if (v14 <= v15)
  {
    v16 = v15;
    v17 = v14;
    do
    {
      -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PXPeopleInternalAnnotationViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v18, v17);

      if (v17 == v14)
        v20 = objc_msgSend(v26, "item");
      else
        v20 = 0;
      if (v17 == v16)
        v21 = objc_msgSend(v12, "item");
      else
        v21 = v19 - 1;
      while (v20 <= v21)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20, v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);

        ++v20;
      }
      ++v17;
    }
    while (v17 <= v16);
  }

  return v13;
}

- (id)swipeSelectionManager:(id)a3 itemIndexPathAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a4.y;
  x = a4.x;
  -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)swipeSelectionManager:(id)a3 didSelectIndexPaths:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0)
        {
          -[PXPeopleInternalAnnotationViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v15);
          objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v15, 0, 0);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "minusSet:", v10);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        -[PXPeopleInternalAnnotationViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v6, v21, (_QWORD)v22);
        objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v21, 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v18);
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

  -[PXPeopleInternalAnnotationViewController view](self, "view", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = 40.0;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)_cancelTapped:(id)a3
{
  id v4;

  -[PXPeopleInternalAnnotationViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, self->_cancelCompletion);

}

- (void)_nextTapped:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  if (-[PXPeopleInternalAnnotationDataSource hasChanges](self->_dataSource, "hasChanges", a3))
  {
    -[PXPeopleInternalAnnotationViewController _commitChangesAndShowSpinner](self, "_commitChangesAndShowSpinner");
    -[PXPeopleInternalAnnotationViewController presentingViewController](self, "presentingViewController");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, self->_dismissCompletion);

  }
  else
  {
    -[PXPeopleInternalAnnotationViewController person](self, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "px_isHuman");
    v6 = CFSTR("pet");
    if (v5)
      v6 = CFSTR("person");
    v7 = v6;

    -[PXPeopleInternalAnnotationViewController person](self, "person");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "px_isHuman");
    v10 = CFSTR("pets");
    if (v9)
      v10 = CFSTR("people");
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Are all merge candidates and confirmed photos this %@, and all unverified %@ not this %@?"), v7, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__PXPeopleInternalAnnotationViewController__nextTapped___block_invoke;
    v17[3] = &unk_1E5144530;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Yes"), 0, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v14);

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("No"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v15);

    -[PXPeopleInternalAnnotationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }
}

- (void)_commitChangesAndShowSpinner
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v6, v8, v10, v12);

  objc_msgSend(v3, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v4);

  objc_msgSend(v4, "startAnimating");
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Committing changes..."), 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentViewController:", v3);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PXPeopleInternalAnnotationViewController__commitChangesAndShowSpinner__block_invoke;
  v16[3] = &unk_1E5149198;
  v16[4] = self;
  -[PXPeopleInternalAnnotationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, v16);

}

- (void)annotationDataSourceDataChanged:(id)a3
{
  id v3;

  -[PXPeopleInternalAnnotationViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (id)dismissCompletion
{
  return self->_dismissCompletion;
}

- (id)cancelCompletion
{
  return self->_cancelCompletion;
}

- (PHPerson)person
{
  return self->_person;
}

- (PXPeopleInternalAnnotationDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong(&self->_dismissCompletion, 0);
}

uint64_t __72__PXPeopleInternalAnnotationViewController__commitChangesAndShowSpinner__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "commitChanges");
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __56__PXPeopleInternalAnnotationViewController__nextTapped___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_commitChangesAndShowSpinner");
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));

}

void __105__PXPeopleInternalAnnotationViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
  v6 = a2;
  objc_msgSend(v5, "titleForIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

}

void __81__PXPeopleInternalAnnotationViewController_getCellRegistrationForCollectionView___block_invoke(double *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "tag") + 1;
  objc_msgSend(v5, "setTag:", v7);
  v8 = *((_QWORD *)a1 + 4);
  v9 = *(void **)(v8 + 1032);
  v11 = a1[6];
  v10 = a1[7];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__PXPeopleInternalAnnotationViewController_getCellRegistrationForCollectionView___block_invoke_2;
  v15[3] = &unk_1E5124EB8;
  v16 = v5;
  v17 = v8;
  v18 = v6;
  v19 = v7;
  v12 = a1[5];
  v13 = v6;
  v14 = v5;
  objc_msgSend(v9, "requestImageForItemAtIndexPath:targetSize:displayScale:imageBlock:", v13, v15, v12, v11, v10);

}

void __81__PXPeopleInternalAnnotationViewController_getCellRegistrationForCollectionView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  px_dispatch_on_main_queue();

}

void __81__PXPeopleInternalAnnotationViewController_getCellRegistrationForCollectionView___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsRejected:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "isIndexPathRejected:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(*(id *)(a1 + 32), "setImage:contentsRect:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    if (!objc_msgSend(*(id *)(a1 + 48), "section") || objc_msgSend(*(id *)(a1 + 48), "section") == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "dataSource");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "keyFaceDistanceForUnverifiedPersonIndexPath:", *(_QWORD *)(a1 + 48));
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v3 = objc_alloc(MEMORY[0x1E0DC3990]);
        objc_msgSend(*(id *)(a1 + 32), "bounds");
        v4 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setText:", v5);

        objc_msgSend(*(id *)(a1 + 32), "contentView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSubview:", v4);

      }
    }
  }
}

+ (id)peopleAnnotationViewControllerForPerson:(id)a3 withDismissCompletion:(id)a4 withCancelCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[PXPeopleInternalAnnotationViewController _initWithPerson:withDismissCompletion:withCancelCompletion:]([PXPeopleInternalAnnotationViewController alloc], "_initWithPerson:withDismissCompletion:withCancelCompletion:", v7, v9, v8);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
  objc_msgSend(v11, "setToolbarHidden:", 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v26[0] = v12;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setToolbarItems:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Next"), 2, v10, sel__nextTapped_);
  objc_msgSend(v10, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Cancel"), 2, v10, sel__cancelTapped_);
  objc_msgSend(v10, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

  objc_msgSend(v7, "px_localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "px_localizedName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Annotating %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v23);

  }
  else
  {
    objc_msgSend(v10, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", CFSTR("Annotating Photos"));
  }

  return v11;
}

@end
