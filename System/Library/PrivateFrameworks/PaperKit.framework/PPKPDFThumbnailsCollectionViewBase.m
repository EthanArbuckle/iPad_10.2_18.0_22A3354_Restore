@implementation PPKPDFThumbnailsCollectionViewBase

- (id)initFromThumbnailView:(id)a3
{
  PPKPDFThumbnailsCollectionViewBase *v4;
  PPKPDFThumbnailsCollectionViewBase *v5;
  PPKLayoutCompleteCollectionView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UICollectionView *collectionView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UICollectionViewDiffableDataSource *dataSource;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  obj = a3;
  v41.receiver = self;
  v41.super_class = (Class)PPKPDFThumbnailsCollectionViewBase;
  v4 = -[PPKPDFThumbnailsCollectionViewBase init](&v41, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_thumbnailView, obj);
    v37 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v37, "setScrollDirection:", 0);
    objc_msgSend(v37, "setMinimumLineSpacing:", 0.0);
    objc_msgSend(v37, "setEstimatedItemSize:", *MEMORY[0x1E0DC48B0], *(double *)(MEMORY[0x1E0DC48B0] + 8));
    objc_initWeak(&location, v5);
    v6 = [PPKLayoutCompleteCollectionView alloc];
    objc_msgSend(obj, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __60__PPKPDFThumbnailsCollectionViewBase_initFromThumbnailView___block_invoke;
    v38[3] = &unk_1EA839070;
    objc_copyWeak(&v39, &location);
    v15 = -[PPKLayoutCompleteCollectionView initWithFrame:collectionViewLayout:layoutCompletion:](v6, "initWithFrame:collectionViewLayout:layoutCompletion:", v37, v38, v8, v10, v12, v14);
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v15;

    -[PPKPDFThumbnailsCollectionViewBase addSubview:](v5, "addSubview:", v5->_collectionView);
    -[UICollectionView setAllowsFocus:](v5->_collectionView, "setAllowsFocus:", 1);
    -[UICollectionView setDragInteractionEnabled:](v5->_collectionView, "setDragInteractionEnabled:", 1);
    -[UICollectionView setDragDelegate:](v5->_collectionView, "setDragDelegate:", v5);
    -[UICollectionView setDropDelegate:](v5->_collectionView, "setDropDelegate:", v5);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v5->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = (void *)MEMORY[0x1E0CB3718];
    -[UICollectionView bottomAnchor](v5->_collectionView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailsCollectionViewBase bottomAnchor](v5, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v33;
    -[UICollectionView topAnchor](v5->_collectionView, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailsCollectionViewBase topAnchor](v5, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v17;
    -[UICollectionView leadingAnchor](v5->_collectionView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailsCollectionViewBase leadingAnchor](v5, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v20;
    -[UICollectionView trailingAnchor](v5->_collectionView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPKPDFThumbnailsCollectionViewBase trailingAnchor](v5, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v24);

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v5->_collectionView, "registerClass:forCellWithReuseIdentifier:", NSClassFromString(CFSTR("PPKPDFIconCollectionViewCell_iOS_Swift")), CFSTR("PDFIconCollectionViewCell"));
    -[PPKPDFThumbnailsCollectionViewBase makeDatasource](v5, "makeDatasource");
    v25 = objc_claimAutoreleasedReturnValue();
    dataSource = v5->_dataSource;
    v5->_dataSource = (UICollectionViewDiffableDataSource *)v25;

    -[UICollectionView setDataSource:](v5->_collectionView, "setDataSource:", v5->_dataSource);
    -[UICollectionView setDelegate:](v5->_collectionView, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v5->_collectionView, "setBackgroundColor:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v5);
    -[UICollectionView addInteraction:](v5->_collectionView, "addInteraction:", v28);
    -[PPKPDFThumbnailsCollectionViewBase _updateMetricsIfNeeded](v5, "_updateMetricsIfNeeded");

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __60__PPKPDFThumbnailsCollectionViewBase_initFromThumbnailView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_selectAndScrollToCurrentPageIfNeeded");

}

- (id)makeDatasource
{
  id v3;
  UICollectionView *collectionView;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0DC35E8]);
  collectionView = self->_collectionView;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke;
  v12[3] = &unk_1EA839098;
  objc_copyWeak(&v13, &location);
  v6 = (void *)objc_msgSend(v3, "initWithCollectionView:cellProvider:", collectionView, v12);
  objc_msgSend(v6, "reorderingHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanReorderItemHandler:", &__block_literal_global_0);

  objc_msgSend(v6, "reorderingHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_3;
  v10[3] = &unk_1EA839100;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "setDidReorderHandler:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v6;
}

id __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PDFIconCollectionViewCell"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (v8 && WeakRetained)
    objc_msgSend(WeakRetained, "configureCell:withPage:indexPath:", v9, v8, v7);

  return v9;
}

uint64_t __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_2()
{
  return 1;
}

void __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "movePageWithTransaction:", v5);

}

- (void)reloadPageAt:(int64_t)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  void *v5;
  void *v6;
  id v7;

  dataSource = self->_dataSource;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](dataSource, "itemIdentifierForIndexPath:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[PPKPDFThumbnailsCollectionViewBase reloadPage:](self, "reloadPage:", v7);
    v6 = v7;
  }

}

- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  uint64_t v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id location;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PPKPDFThumbnailsCollectionViewBase configureCell:withPage:indexPath:].cold.1(v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v13 = objc_msgSend(WeakRetained, "layoutMode");
  objc_msgSend(WeakRetained, "thumbnailSize");
  if (v13)
    objc_msgSend(v8, "setThumbnailHeight:", v14);
  else
    objc_msgSend(v8, "setThumbnailWidth:");
  objc_msgSend(v8, "setHasLargeThumbnail:", self->_largeThumbnails);
  objc_msgSend(v9, "boundsForBox:", 1);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  memset(&v50, 0, sizeof(v50));
  CGAffineTransformMakeRotation(&v50, (double)objc_msgSend(v9, "rotation") / 180.0 * 3.14159265);
  v49 = v50;
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  v52 = CGRectApplyAffineTransform(v51, &v49);
  objc_msgSend(v8, "updateAspectConstraintWithSize:", v52.size.width, v52.size.height);
  objc_msgSend(v8, "setPage:", v9);
  -[PPKPDFThumbnailsCollectionViewBase updateImageForCell:indexPath:page:](self, "updateImageForCell:indexPath:page:", v8, v10, v9);
  objc_initWeak((id *)&v49, self);
  objc_initWeak(&location, v8);
  v44[1] = 3221225472;
  v44[2] = __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke;
  v44[3] = &unk_1EA839150;
  v44[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v46, (id *)&v49);
  objc_copyWeak(&v47, &location);
  v23 = v9;
  v45 = v23;
  objc_msgSend(v8, "actionsButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setMenuProvider:", v44);

  objc_msgSend(v8, "actionsButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShowsMenuAsPrimaryAction:", 1);

  LODWORD(v25) = -[PPKPDFThumbnailsCollectionViewBase shouldDisplayActionButtonForPage:](self, "shouldDisplayActionButtonForPage:", v23);
  objc_msgSend(v8, "actionsButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setHidden:", v25 ^ 1);

  objc_msgSend(v8, "invalidateIntrinsicContentSize");
  objc_msgSend(v23, "document");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "indexForPage:", v23);

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PaperKit"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Thumbnail for page %ld"), &stru_1EA857F40, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v28 + 1;
  objc_msgSend(v29, "stringWithFormat:", v31, v28 + 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v33);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PaperKit"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("PDF thumbnail"), &stru_1EA857F40, CFSTR("Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v35);

  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PaperKit"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Page actions for page %ld"), &stru_1EA857F40, CFSTR("Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", v38, v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionsButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityLabel:", v39);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PaperKit"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Page actions"), &stru_1EA857F40, CFSTR("Localizable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionsButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityIdentifier:", v42);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)&v49);

}

id __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float minimum;
  float maximum;
  float preferred;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  CAFrameRateRange v31;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1E0CD1278];
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeToolPickerForWindow:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CD1150]);
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke_2;
      v28 = &unk_1EA839128;
      objc_copyWeak(&v30, (id *)(a1 + 48));
      v29 = v11;
      v13 = objc_msgSend(v12, "initWithHandler:", &v25);
      v14 = (void *)WeakRetained[55];
      WeakRetained[55] = v13;

      v15 = (void *)WeakRetained[55];
      v31 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
      minimum = v31.minimum;
      maximum = v31.maximum;
      preferred = v31.preferred;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v25, v26, v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = minimum;
      *(float *)&v21 = maximum;
      *(float *)&v22 = preferred;
      objc_msgSend(v15, "startWithPreferredFramesPerSecond:addToRunLoop:forMode:", v19, *MEMORY[0x1E0C99860], v20, v21, v22);

      objc_destroyWeak(&v30);
    }
    objc_msgSend(WeakRetained, "contextMenuForPage:", *(_QWORD *)(a1 + 32));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  int v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "actionsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHeld");

  v5 = objc_msgSend(*(id *)(a1 + 32), "_isLockedHidden");
  if ((_DWORD)v4)
  {
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_lockHidden");
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unlockHidden");
  }
  return v4;
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v16[5];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_isApplyingCollectionViewTransaction)
  {
    v3 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (WeakRetained)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8 && (objc_msgSend(v7, "isLocked") & 1) == 0)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC3398]);
      v18[0] = CFSTR("Thumbnails");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendSectionsWithIdentifiers:", v10);

      if (objc_msgSend(v7, "pageCount"))
      {
        v11 = 0;
        do
        {
          objc_msgSend(v7, "pageAtIndex:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
          {
            v17 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, CFSTR("Thumbnails"));

          }
          ++v11;
        }
        while (objc_msgSend(v7, "pageCount") > v11);
      }
      dataSource = self->_dataSource;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__PPKPDFThumbnailsCollectionViewBase_applySnapshotWithAnimation___block_invoke;
      v16[3] = &unk_1EA839178;
      v16[4] = self;
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](dataSource, "applySnapshot:animatingDifferences:completion:", v9, v3, v16);

    }
  }
}

uint64_t __65__PPKPDFThumbnailsCollectionViewBase_applySnapshotWithAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectAndScrollToCurrentPageIfNeeded");
}

- (BOOL)allowsPageReordering
{
  return -[UICollectionView dragInteractionEnabled](self->_collectionView, "dragInteractionEnabled");
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  -[UICollectionView setDragInteractionEnabled:](self->_collectionView, "setDragInteractionEnabled:", a3);
}

- (void)setLargeThumbnails:(BOOL)a3
{
  if (self->_largeThumbnails != a3)
  {
    self->_largeThumbnails = a3;
    -[PPKPDFThumbnailsCollectionViewBase _updateMetricsIfNeeded](self, "_updateMetricsIfNeeded");
  }
}

- (void)_updateMetricsIfNeeded
{
  _BOOL4 v3;
  double v4;
  double v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[PPKPDFThumbnailsCollectionViewBase largeThumbnails](self, "largeThumbnails");
  v4 = 5.0;
  v5 = 8.0;
  if (v3)
    v4 = 8.0;
  else
    v5 = 2.0;
  self->_SectionVerticalEdgesInset = v4;
  self->_ImageCornerRadius = v5;
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSectionInset:", self->_SectionVerticalEdgesInset, 0.0, self->_SectionVerticalEdgesInset, 0.0);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UICollectionView preparedCells](self->_collectionView, "preparedCells", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setHasLargeThumbnail:", -[PPKPDFThumbnailsCollectionViewBase largeThumbnails](self, "largeThumbnails"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)updateIconsImages
{
  -[PPKPDFThumbnailsCollectionViewBase applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (id)currentPage
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)documentChanged:(id)a3
{
  -[PPKPDFThumbnailsCollectionViewBase applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (void)documentMutated:(id)a3
{
  -[PPKPDFThumbnailsCollectionViewBase applySnapshotWithAnimation:](self, "applySnapshotWithAnimation:", 0);
}

- (void)currentPageChanged:(id)a3
{
  -[PPKPDFThumbnailsCollectionViewBase _updateScrubber](self, "_updateScrubber", a3);
  -[PPKPDFThumbnailsCollectionViewBase _selectAndScrollToCurrentPageIfNeeded](self, "_selectAndScrollToCurrentPageIfNeeded");
}

- (void)pageChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (!self->_isApplyingCollectionViewTransaction)
  {
    v4 = (void *)MEMORY[0x1E0DE7910];
    v5 = a3;
    objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_pageChanged_, 0);
    objc_msgSend(v5, "userInfo");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("page"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[PPKPDFThumbnailsCollectionViewBase reloadPage:](self, "reloadPage:", v6);

  }
}

- (void)reloadPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", v8);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v5, 0);
  }
  else
  {
    v9 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PPKPDFThumbnailsCollectionViewBase reloadPage:].cold.1(v9);

  }
}

- (void)_updateScrubber
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v4 = objc_msgSend(WeakRetained, "layoutMode");

  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = v5;
    if (v4 == 1)
      objc_msgSend(v5, "setScrollDirection:", 1);
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v7);
    v5 = v7;
  }

}

- (void)_selectAndScrollToCurrentPageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexForPage:", v5);

  v8 = objc_msgSend(v4, "pageCount");
  v9 = v7 & ~(v7 >> 31);
  if (v9 >= v8 - 1)
    v9 = v8 - 1;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView dataSource](self->_collectionView, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfSectionsInCollectionView:", self->_collectionView);

  if (v13)
  {
    if (-[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", 0) > v10)
    {
      -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 0, 1);
      -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v11);

      if ((v15 & 1) == 0)
      {
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v11, 1, 0);
        -[PPKPDFThumbnailsCollectionViewBase _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", v11);
      }
    }
  }

}

- (BOOL)_canEditDocument
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "documentCanBeEdited:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3
{
  PPKPDFThumbnailViewBase **p_thumbnailView;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;

  p_thumbnailView = &self->_thumbnailView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = -[PPKPDFThumbnailsCollectionViewBase shouldDisplayActionButtonForPage:](self, "shouldDisplayActionButtonForPage:", v13) ^ 1;
    objc_msgSend(v9, "actionsButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  PPKPDFThumbnailViewBase **p_thumbnailView;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  p_thumbnailView = &self->_thumbnailView;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "goToPage:", v9);

  -[PPKPDFThumbnailsCollectionViewBase _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", v6);
  v10 = objc_loadWeakRetained((id *)p_thumbnailView);
  objc_msgSend(v10, "thumbnailContextMenuDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "didSelectPage");
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "PDFView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x1E0DC36B8];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __102__PPKPDFThumbnailsCollectionViewBase_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v16[3] = &unk_1EA8391A0;
      objc_copyWeak(&v18, &location);
      v17 = v12;
      objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __102__PPKPDFThumbnailsCollectionViewBase_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "contextMenuForPage:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17[3];
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PPKPDFThumbnailsCollectionViewBase collectionView:contextMenuConfigurationForItemAtIndexPath:point:](self, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", self->_collectionView, v8, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "PDFView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v12, "pageCount") - 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E0DC36B8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__PPKPDFThumbnailsCollectionViewBase_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_1EA8391C8;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", v13, 0, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);

  }
  return v9;
}

id __92__PPKPDFThumbnailsCollectionViewBase_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contextMenuForBackgroundAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return -[PPKPDFThumbnailsCollectionViewBase previewForCollectionView:contextMenuInteraction:](self, "previewForCollectionView:contextMenuInteraction:", self->_collectionView, a3);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return -[PPKPDFThumbnailsCollectionViewBase previewForCollectionView:contextMenuInteraction:](self, "previewForCollectionView:contextMenuInteraction:", self->_collectionView, a3);
}

- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *backgroundOnePixelView;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "locationInView:", v6);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "indexPathForItemAtPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PPKPDFThumbnailsCollectionViewBase previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_backgroundOnePixelView)
    {
      v14 = (UIView *)objc_opt_new();
      backgroundOnePixelView = self->_backgroundOnePixelView;
      self->_backgroundOnePixelView = v14;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_backgroundOnePixelView, "setBackgroundColor:", v16);

      objc_msgSend(v6, "addSubview:", self->_backgroundOnePixelView);
    }
    objc_msgSend(v7, "locationInView:", self);
    v18 = v17;
    v20 = v19;
    -[UIView setFrame:](self->_backgroundOnePixelView, "setFrame:", v9, v11, 0.0, 0.0);
    v21 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B88]), "initWithContainer:center:", self, v18, v20);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", self->_backgroundOnePixelView, v21, v23);

  }
  return v13;
}

- (id)previewForCollectionView:(id)a3 indexPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  if (a4)
  {
    objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    v7 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v4, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisiblePath:", v9);

    v10 = objc_alloc(MEMORY[0x1E0DC3B88]);
    objc_msgSend(v4, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "center");
    v12 = (void *)objc_msgSend(v10, "initWithContainer:center:", v4);

    v13 = objc_alloc(MEMORY[0x1E0DC3D90]);
    objc_msgSend(v4, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithView:parameters:target:", v14, v5, v12);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFThumbnailsCollectionViewBase previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFThumbnailsCollectionViewBase previewForCollectionView:indexPath:](self, "previewForCollectionView:indexPath:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "thumbnailContextMenuDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pasteActionForPage:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1EA857F40, 0, 0, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contextMenuForPage:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(WeakRetained, "thumbnailContextMenuDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "menuElementsForPage:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  objc_msgSend(WeakRetained, "PDFView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexForPage:", v4) + 1;

  v13 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.PaperKit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1EA857F40, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v19, 0, 0, 0, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)shouldDisplayActionButtonForPage:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[PPKPDFThumbnailsCollectionViewBase contextMenuForPage:](self, "contextMenuForPage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = !-[UICollectionView hasActiveDrag](self->_collectionView, "hasActiveDrag");
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[PPKPDFThumbnailsCollectionViewBase itemsForDragWithSession:atIndexPath:](self, "itemsForDragWithSession:atIndexPath:", a4, a5);
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PPKPDFThumbnailsCollectionViewBase _updateActionsButtonVisibilityAtIndexPath:](self, "_updateActionsButtonVisibilityAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PPKPDFThumbnailsCollectionViewBase *v10;

  -[UICollectionView indexPathsForSelectedItems](self->_collectionView, "indexPathsForSelectedItems", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PPKPDFThumbnailsCollectionViewBase_collectionView_dragSessionDidEnd___block_invoke;
  v8[3] = &unk_1EA8391F0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

}

void __71__PPKPDFThumbnailsCollectionViewBase_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_updateActionsButtonVisibilityAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.adobe.pdf"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "hasItemsConformingToTypeIdentifiers:", v12);

  if (v13)
  {
    -[PPKPDFThumbnailsCollectionViewBase itemsForDragWithSession:atIndexPath:](self, "itemsForDragWithSession:atIndexPath:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "thumbnailContextMenuDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v11 = (void *)MEMORY[0x1E0DC3AC0];
  v12 = -[PPKPDFThumbnailsCollectionViewBase _dragDataOwner](self, "_dragDataOwner");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__PPKPDFThumbnailsCollectionViewBase_itemsForDragWithSession_atIndexPath___block_invoke;
  v19[3] = &unk_1EA839218;
  v22 = &v23;
  v13 = v10;
  v20 = v13;
  v14 = v7;
  v21 = v14;
  objc_msgSend(v11, "_performAsDataOwner:block:", v12, v19);
  v15 = objc_alloc(MEMORY[0x1E0DC3758]);
  v16 = (void *)objc_msgSend(v15, "initWithItemProvider:", v24[5]);
  objc_msgSend(v16, "setLocalObject:", v8);
  v29[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v17;
}

uint64_t __74__PPKPDFThumbnailsCollectionViewBase_itemsForDragWithSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "registerFileRepresentationsForPage:toItemProvider:", objc_msgSend(*(id *)(a1 + 40), "item"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[PPKPDFThumbnailsCollectionViewBase _canEditDocument](self, "_canEditDocument"))
  {
    objc_msgSend(v8, "localDragSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v7, "hasActiveDrag");
      v11 = objc_alloc(MEMORY[0x1E0DC3608]);
      if (v10)
        v12 = 3;
      else
        v12 = 2;
      v26 = objc_msgSend(v11, "initWithDropOperation:intent:", v12, 1);
      goto LABEL_24;
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v8, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v30)
    {
      v14 = *(_QWORD *)v39;
      v32 = v13;
      v33 = v7;
      v29 = *(_QWORD *)v39;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v13);
          v31 = v15;
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          -[PPKPDFThumbnailsCollectionViewBase supportedUTTypes](self, "supportedUTTypes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v35;
            while (2)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v35 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
                objc_msgSend(v16, "itemProvider");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "hasItemConformingToTypeIdentifier:", v24);

                if ((v25 & 1) != 0)
                {
                  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:intent:", 2, 1);

                  v7 = v33;
                  goto LABEL_25;
                }
                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v19)
                continue;
              break;
            }
          }

          v15 = v31 + 1;
          v13 = v32;
          v7 = v33;
          v14 = v29;
        }
        while (v31 + 1 != v30);
        v30 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v30);
    }

  }
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:", 1);
LABEL_24:
  v27 = (void *)v26;
LABEL_25:

  return v27;
}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1)
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_194);
  return (id)supportedUTTypes_supportedTypes;
}

void __54__PPKPDFThumbnailsCollectionViewBase_supportedUTTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEC520];
  v3[0] = *MEMORY[0x1E0CEC570];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;

}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  objc_msgSend(WeakRetained, "thumbnailDataSourceDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "insertFileAtURL:atIndex:completionHandler:", v12, a5, v9);

}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id obj;
  uint64_t v23;
  _QWORD v25[6];
  id v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  objc_msgSend(v19, "destinationIndexPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v20, "numberOfItemsInSection:", 0), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v20, "hasActiveDrag") & 1) == 0)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v37 = 0;
    v37 = objc_msgSend(v21, "item");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v19, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v6)
    {
      v23 = *(_QWORD *)v33;
      obj = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dragItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "itemProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            -[PPKPDFThumbnailsCollectionViewBase supportedUTTypes](self, "supportedUTTypes");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v29;
              while (2)
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v29 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                  objc_msgSend(v14, "identifier");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v15);

                  if (v16)
                  {
                    objc_msgSend(v14, "identifier");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v25[0] = MEMORY[0x1E0C809B0];
                    v25[1] = 3221225472;
                    v25[2] = __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke;
                    v25[3] = &unk_1EA839288;
                    v25[4] = self;
                    v25[5] = v14;
                    v27 = v36;
                    v26 = v9;
                    v18 = (id)objc_msgSend(v26, "loadFileRepresentationForTypeIdentifier:completionHandler:", v17, v25);

                    goto LABEL_20;
                  }
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
                if (v11)
                  continue;
                break;
              }
            }
LABEL_20:

          }
        }
        v5 = obj;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v6);
    }

    _Block_object_dispose(v36, 8);
  }

}

void __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];

  v5 = a3;
  if (a2)
  {
    v6 = (void *)a1[4];
    v7 = a1[5];
    v8 = a1[7];
    v9 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_2;
    v11[3] = &unk_1EA839260;
    v11[4] = v8;
    objc_msgSend(v6, "_insertFileAtURL:type:atIndex:completionHandler:", a2, v7, v9, v11);
  }
  else
  {
    v10 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v10);

  }
}

uint64_t __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (void)movePageWithTransaction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "difference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasChanges");

  v6 = v10;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    objc_msgSend(WeakRetained, "thumbnailDataSourceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self->_isApplyingCollectionViewTransaction = 1;
      objc_msgSend(v10, "difference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handlePageOrderedCollectionDifference:", v9);

      self->_isApplyingCollectionViewTransaction = 0;
    }

    v6 = v10;
  }

}

- (PPKPDFThumbnailViewBase)thumbnailView
{
  return (PPKPDFThumbnailViewBase *)objc_loadWeakRetained((id *)&self->_thumbnailView);
}

- (void)setThumbnailView:(id)a3
{
  objc_storeWeak((id *)&self->_thumbnailView, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BOOL)largeThumbnails
{
  return self->_largeThumbnails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_displayLinkObserver, 0);
  objc_storeStrong((id *)&self->_backgroundOnePixelView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
}

- (void)configureCell:(void *)a1 withPage:(NSObject *)a2 indexPath:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "item");
  _os_log_debug_impl(&dword_1DDB0F000, a2, OS_LOG_TYPE_DEBUG, "Configuring cell n°%lu", (uint8_t *)&v3, 0xCu);
}

- (void)reloadPage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDB0F000, log, OS_LOG_TYPE_ERROR, "Page was gone when we tried to reload it", v1, 2u);
}

void __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DDB0F000, log, OS_LOG_TYPE_ERROR, "Item provider %@ returned a nil URL. Error: %@", (uint8_t *)&v4, 0x16u);
}

@end
