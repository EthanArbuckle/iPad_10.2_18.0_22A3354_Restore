@implementation ICPaperStyleCollectionViewController

- (ICPaperStyleCollectionViewController)init
{
  -[ICPaperStyleCollectionViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICPaperStyleCollectionViewController)initWithLargeIcons:(BOOL)a3 forPreferences:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  id v8;
  ICPaperStyleCollectionViewController *v9;
  ICPaperStyleCollectionViewController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v19;

  v4 = a4;
  if (a3)
  {
    v6 = 134.0;
    v7 = 164.0;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v7 = 156.0;
    else
      v7 = 132.0;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v6 = 125.0;
    else
      v6 = 108.0;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v8, "setItemSize:", v7, v6);
  objc_msgSend(v8, "setScrollDirection:", 0);
  v19.receiver = self;
  v19.super_class = (Class)ICPaperStyleCollectionViewController;
  v9 = -[ICPaperStyleCollectionViewController initWithCollectionViewLayout:](&v19, sel_initWithCollectionViewLayout_, v8);
  v10 = v9;
  if (v9)
  {
    -[ICPaperStyleCollectionViewController setForPreferences:](v9, "setForPreferences:", v4);
    -[ICPaperStyleCollectionViewController setItemSize:](v10, "setItemSize:", v7, v6);
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v11 = 32.0;
    else
      v11 = 16.0;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v12 = 32.0;
    else
      v12 = 16.0;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v13 = 32.0;
    else
      v13 = 16.0;
    -[ICPaperStyleCollectionViewController setSectionInsets:](v10, "setSectionInsets:", v11, v12, 0.0, v13);
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v14 = 0.0;
    else
      v14 = 21.0;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v15 = 32.0;
    else
      v15 = 16.0;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v16 = 32.0;
    else
      v16 = 16.0;
    -[ICPaperStyleCollectionViewController setTitleInsets:](v10, "setTitleInsets:", v14, v15, 16.0, v16);
    -[ICPaperStyleCollectionViewController setHeaderViewMeasuringCell:](v10, "setHeaderViewMeasuringCell:", 0);
    -[ICPaperStyleCollectionViewController setNeedsUpdateItemSpacing:](v10, "setNeedsUpdateItemSpacing:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICPaperStyleCollectionViewController;
  -[ICPaperStyleCollectionViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PaperStyleCell"));

  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("HeaderView"));

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Lines & Grids"), CFSTR("Lines & Grids"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCollectionViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

}

- (id)indexPathForInitialSelection
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("PaperStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCollectionViewController indexPathFromSetting:](self, "indexPathFromSetting:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  id v4;

  if (-[ICPaperStyleCollectionViewController needsUpdateItemSpacing](self, "needsUpdateItemSpacing"))
  {
    -[ICPaperStyleCollectionViewController setNeedsUpdateItemSpacing:](self, "setNeedsUpdateItemSpacing:", 0);
    -[ICPaperStyleCollectionViewController updateItemSpacing](self, "updateItemSpacing");
    objc_opt_class();
    -[ICPaperStyleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "invalidateLayout");
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICPaperStyleCollectionViewController;
  -[ICPaperStyleCollectionViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[ICPaperStyleCollectionViewController indexPathForInitialSelection](self, "indexPathForInitialSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);

    }
  }
}

- (void)updateItemSpacing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double v58;
  int v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;

  objc_opt_class();
  -[ICPaperStyleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v69 = (id)objc_claimAutoreleasedReturnValue();

  -[ICPaperStyleCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
  v8 = v7;
  v9 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v10 = 192.0;
  if (v9)
    v10 = 128.0;
  if (v6 <= v10 + v8 * 3.0)
  {
    -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
    v22 = v21;
    v23 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v24 = 64.0;
    if (v23)
      v24 = 128.0;
    v25 = v24 + v22 * 3.0;
    -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
    v27 = -v26;
    if (v6 >= v25)
    {
      v28 = (v6 + v27 * 3.0) * 0.25;
      v19 = 3;
    }
    else
    {
      v28 = (v6 + v27 * 2.0) / 3.0;
      v19 = 4;
    }
    -[ICPaperStyleCollectionViewController setItemSpacing:](self, "setItemSpacing:", floor(v28));
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    v30 = v29;
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    v32 = v31;
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:", v30, v32, 0.0, v33);
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v18 = 0.0;
    else
      v18 = 21.0;
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    v17 = v34;
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    v20 = v35;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v12 = 48.0;
    if (v11)
      v12 = 32.0;
    -[ICPaperStyleCollectionViewController setItemSpacing:](self, "setItemSpacing:", v12);
    -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
    v14 = v13;
    v15 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v16 = 96.0;
    if (v15)
      v16 = 64.0;
    v17 = (v6 - (v16 + v14 * 3.0)) * 0.5;
    -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
    v18 = 0.0;
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:");
    if (!objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v18 = 21.0;
    v19 = 3;
    v20 = v17;
  }
  -[ICPaperStyleCollectionViewController setTitleInsets:](self, "setTitleInsets:", v18, v17, 16.0, v20);
  -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
  -[ICPaperStyleCollectionViewController setItemSpacingVertical:](self, "setItemSpacingVertical:");
  -[ICPaperStyleCollectionViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;

  -[UIViewController ic_safeAreaDistanceFromTop](self, "ic_safeAreaDistanceFromTop");
  v40 = v39;
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleCollectionViewController collectionView:layout:referenceSizeForHeaderInSection:](self, "collectionView:layout:referenceSizeForHeaderInSection:", v41, v69, 0);
  v43 = v38 - (v40 + v42);

  -[ICPaperStyleCollectionViewController itemSpacingVertical](self, "itemSpacingVertical");
  v45 = v44;
  v46 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v47 = 60.0;
  if (!v46)
    v47 = 28.0;
  if (v45 >= v47)
    v48 = v45;
  else
    v48 = v47;
  -[ICPaperStyleCollectionViewController itemSpacingVertical](self, "itemSpacingVertical");
  v50 = v49;
  v51 = (double)(v19 - 1);
  -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
  if (v48 + v52 * (double)v19 + v50 * v51 > v43)
  {
    -[ICPaperStyleCollectionViewController itemSize](self, "itemSize");
    v54 = floor((v43 - (v48 + v53 * (double)v19)) / v51);
    v55 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v56 = 32.0;
    if (!v55)
      v56 = 16.0;
    if (v54 >= v56)
      v56 = v54;
    -[ICPaperStyleCollectionViewController setItemSpacingVertical:](self, "setItemSpacingVertical:", v56);
    -[ICPaperStyleCollectionViewController itemSpacingVertical](self, "itemSpacingVertical");
    v58 = v57;
    v59 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v60 = 60.0;
    if (!v59)
      v60 = 28.0;
    if (v58 >= v60)
      v48 = v58;
    else
      v48 = v60;
    -[ICPaperStyleCollectionViewController sectionInsets](self, "sectionInsets");
    -[ICPaperStyleCollectionViewController itemSpacingVertical](self, "itemSpacingVertical");
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:");
  }
  -[ICPaperStyleCollectionViewController itemSpacing](self, "itemSpacing");
  if (v48 >= v61)
    v62 = v61;
  else
    v62 = v48;
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setContentInset:", 0.0, 0.0, v62, 0.0);

  objc_opt_class();
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "supplementaryViewForElementKind:atIndexPath:", v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICPaperStyleCollectionViewController titleInsets](self, "titleInsets");
  objc_msgSend(v68, "setTitleInsets:");

}

- (void)updateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    v6 = (void *)MEMORY[0x1E0D64270];
    -[ICPaperStyleCollectionViewController settingFromIndexPath:](self, "settingFromIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("PaperStyle"));

    v5 = v8;
  }

}

- (id)settingFromIndexPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICPaperStyleCollectionViewController paperStyleTypeFromIndexPath:](self, "paperStyleTypeFromIndexPath:", a3));
}

- (unint64_t)paperStyleTypeFromIndexPath:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;

  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "section"))
  {
LABEL_8:
    v6 = 1;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v4, "item");
  if (v5 >= 6)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICPaperStyleCollectionViewController paperStyleTypeFromIndexPath:].cold.1(v4, v7);

    goto LABEL_8;
  }
  v6 = qword_1ACA58B18[v5];
LABEL_9:

  return v6;
}

- (id)indexPathFromSetting:(id)a3
{
  return -[ICPaperStyleCollectionViewController indexPathFromPaperStyleType:](self, "indexPathFromPaperStyleType:", objc_msgSend(a3, "unsignedIntegerValue"));
}

- (id)indexPathFromPaperStyleType:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;

  if (a3 > 1)
  {
    if (a3 - 2 >= 6)
    {
      v7 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICPaperStyleCollectionViewController indexPathFromPaperStyleType:].cold.1(a3, v7, v8);

      v4 = 0;
    }
    else
    {
      v4 = qword_1ACA58B48[a3 - 2];
    }
    v3 = (void *)MEMORY[0x1E0CB36B0];
    v5 = 1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB36B0];
    v4 = 0;
    v5 = 0;
  }
  objc_msgSend(v3, "indexPathForItem:inSection:", v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ICPaperStyleCollectionViewController;
  v7 = a4;
  -[ICPaperStyleCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICPaperStyleCollectionViewController setNeedsUpdateItemSpacing:](self, "setNeedsUpdateItemSpacing:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__ICPaperStyleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5C23858;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_81, v8);

}

uint64_t __91__ICPaperStyleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateItemSpacing");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  -[ICPaperStyleCollectionViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supplementaryViewForElementKind:atIndexPath:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "contentSizeCategoryDidChange");
  -[ICPaperStyleCollectionViewController setNeedsUpdateItemSpacing:](self, "setNeedsUpdateItemSpacing:", 1);
  objc_opt_class();
  -[ICPaperStyleCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "invalidateLayout");
  -[ICPaperStyleCollectionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (id)titleForHeaderView
{
  const __CFString *v2;

  if (-[ICPaperStyleCollectionViewController forPreferences](self, "forPreferences"))
    v2 = CFSTR("Choose your preferred line or grid style for handwriting in new notes.");
  else
    v2 = CFSTR("Change the line or grid style for handwriting in this note.");
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v2, v2, 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ICPaperStyleHeaderView)headerViewMeasuringCell
{
  ICPaperStyleHeaderView *headerViewMeasuringCell;
  ICPaperStyleHeaderView *v4;
  ICPaperStyleHeaderView *v5;
  ICPaperStyleHeaderView *v6;
  void *v7;

  headerViewMeasuringCell = self->_headerViewMeasuringCell;
  if (!headerViewMeasuringCell)
  {
    v4 = [ICPaperStyleHeaderView alloc];
    v5 = -[ICPaperStyleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_headerViewMeasuringCell;
    self->_headerViewMeasuringCell = v5;

    -[ICPaperStyleCollectionViewController titleForHeaderView](self, "titleForHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView setTitle:](self->_headerViewMeasuringCell, "setTitle:", v7);

    -[ICPaperStyleCollectionViewController titleInsets](self, "titleInsets");
    -[ICPaperStyleHeaderView setTitleInsets:](self->_headerViewMeasuringCell, "setTitleInsets:");
    headerViewMeasuringCell = self->_headerViewMeasuringCell;
  }
  return headerViewMeasuringCell;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4)
    return 6;
  else
    return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PaperStyleCell"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "section"))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Blank paper"), CFSTR("Blank paper"), 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

  }
  if (objc_msgSend(v5, "section") == 1)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Horizontal lines with small line spacing"), CFSTR("Horizontal lines with small line spacing"), 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Horizontal lines with medium line spacing"), CFSTR("Horizontal lines with medium line spacing"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Horizontal lines with large line spacing"), CFSTR("Horizontal lines with large line spacing"), 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Grid lines with small tiles"), CFSTR("Grid lines with small tiles"), 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v13;
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Grid lines with medium tiles"), CFSTR("Grid lines with medium tiles"), 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v14;
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Grid lines with large tiles"), CFSTR("Grid lines with large tiles"), 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v5, "item");
    if (v17 < objc_msgSend(&unk_1E5C71B08, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E5C71B08, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v19, v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setImage:", v20);

      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v22);

    }
  }

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]) && !objc_msgSend(v10, "section"))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("HeaderView"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleCollectionViewController titleForHeaderView](self, "titleForHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    -[ICPaperStyleCollectionViewController titleInsets](self, "titleInsets");
    objc_msgSend(v11, "setTitleInsets:");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  -[ICPaperStyleCollectionViewController sectionInsets](self, "sectionInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (!a5)
  {
    -[ICPaperStyleCollectionViewController collectionView:layout:referenceSizeForHeaderInSection:](self, "collectionView:layout:referenceSizeForHeaderInSection:", v8, v9, 0);
    v11 = v11 - v18;
    if (v11 < 0.0)
      v11 = 0.0;
  }

  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v17;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  if (a5)
  {
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend(a3, "bounds");
    v9 = v8;
    -[ICPaperStyleCollectionViewController sectionInsets](self, "sectionInsets");
    v11 = v10;
    -[ICPaperStyleCollectionViewController sectionInsets](self, "sectionInsets");
    v13 = v9 - (v11 + v12);
    -[ICPaperStyleCollectionViewController headerViewMeasuringCell](self, "headerViewMeasuringCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1148846080;
    LODWORD(v16) = 1112014848;
    objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v15, v16);
    v18 = v17;

    v19 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v20 = 21.0;
    if (v19)
      v20 = 0.0;
    v6 = v18 + v20 + 16.0;
  }
  v21 = v5;
  result.height = v6;
  result.width = v21;
  return result;
}

- (BOOL)forPreferences
{
  return self->_forPreferences;
}

- (void)setForPreferences:(BOOL)a3
{
  self->_forPreferences = a3;
}

- (BOOL)needsUpdateItemSpacing
{
  return self->_needsUpdateItemSpacing;
}

- (void)setNeedsUpdateItemSpacing:(BOOL)a3
{
  self->_needsUpdateItemSpacing = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)itemSpacingVertical
{
  return self->_itemSpacingVertical;
}

- (void)setItemSpacingVertical:(double)a3
{
  self->_itemSpacingVertical = a3;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (UIEdgeInsets)sectionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInsets.top;
  left = self->_sectionInsets.left;
  bottom = self->_sectionInsets.bottom;
  right = self->_sectionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (UIEdgeInsets)titleInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleInsets.top;
  left = self->_titleInsets.left;
  bottom = self->_titleInsets.bottom;
  right = self->_titleInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

- (void)setHeaderViewMeasuringCell:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewMeasuringCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerViewMeasuringCell, 0);
}

- (void)paperStyleTypeFromIndexPath:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = objc_msgSend(a1, "item");
  OUTLINED_FUNCTION_0_0(&dword_1AC7A1000, a2, v3, "Unknown index for paper style %ld", (uint8_t *)&v4);
}

- (void)indexPathFromPaperStyleType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AC7A1000, a2, a3, "Unknown paper style %ld", (uint8_t *)&v3);
}

@end
