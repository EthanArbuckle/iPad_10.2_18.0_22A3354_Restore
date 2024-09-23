@implementation PUAdjustmentsViewController

- (PUAdjustmentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUAdjustmentsViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAdjustmentsViewController;
  result = -[PUAdjustmentsViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
  {
    result->_shouldDisplayControlValues = 1;
    result->_shouldDisplayMappedValues = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PUAdjustmentsViewFlowLayout *v5;
  PUAdjustmentsViewFlowLayout *collectionViewLayout;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PUSelectionFeedbackGenerator *v32;
  PUSelectionFeedbackGenerator *selectionFeedbackGenerator;
  void *v34;
  id v35;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PUAdjustmentsViewController;
  -[PUAdjustmentsViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[PUAdjustmentsViewController setLayoutDirection:](self, "setLayoutDirection:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PUAdjustmentsViewController setControlSize:](self, "setControlSize:", 51.0, 51.0);
  v5 = objc_alloc_init(PUAdjustmentsViewFlowLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  -[PUAdjustmentsViewController controlSize](self, "controlSize");
  -[UICollectionViewFlowLayout setItemSize:](self->_collectionViewLayout, "setItemSize:");
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_collectionViewLayout, "setMinimumInteritemSpacing:", 20.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", 20.0);
  -[UICollectionViewFlowLayout setScrollDirection:](self->_collectionViewLayout, "setScrollDirection:", 1);
  v7 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUAdjustmentsViewController setCollectionView:](self, "setCollectionView:", v8);

  -[PUAdjustmentsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowsHorizontalScrollIndicator:", 0);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsKeyboardScrolling:", 0);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 0);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSemanticContentAttribute:", 3);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentInsetAdjustmentBehavior:", 2);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSelectionFollowsFocus:", 1);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDataSource:", self);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setClipsToBounds:", 0);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUEditAdjustmentsCellReuseIdentifier"));

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUEditAutoEnhanceCellReuseIdentifier"));

  v24 = *MEMORY[0x1E0DC5360];
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDecelerationRate:", v24);

  +[PUPhotoEditSupport createEditSlider](PUPhotoEditSupport, "createEditSlider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController setSlider:](self, "setSlider:", v26);

  -[PUAdjustmentsViewController slider](self, "slider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDelegate:", self);

  -[PUAdjustmentsViewController slider](self, "slider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_sliderValueChanged_, 4096);

  -[PUAdjustmentsViewController slider](self, "slider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setEnabled:dimmed:animated:", 0, 1, 0);

  -[PUAdjustmentsViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController slider](self, "slider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  if (PUHapticsAllowed_onceToken != -1)
    dispatch_once(&PUHapticsAllowed_onceToken, &__block_literal_global_84809);
  if (PUHapticsAllowed_allowHaptics)
  {
    v32 = objc_alloc_init(PUSelectionFeedbackGenerator);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v32;

  }
  -[PUAdjustmentsViewController setDidPerformHapticFeedback:](self, "setDidPerformHapticFeedback:", 1);
  v37[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)-[PUAdjustmentsViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v34, sel_traitEnvironment_didChangeTraitCollection_);

}

- (void)_updateViewLayout
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  CGFloat v16;
  double MidY;
  void *v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  _OWORD v43[3];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[PUAdjustmentsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUAdjustmentsViewController slider](self, "slider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v43[0] = *MEMORY[0x1E0C9BAA8];
  v43[1] = v13;
  v43[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v12, "setTransform:", v43);

  if (-[PUAdjustmentsViewController layoutDirection](self, "layoutDirection"))
  {
    -[PUAdjustmentsViewController slider](self, "slider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v11, 66.0);

    CGAffineTransformMakeRotation(&v42, -1.57079633);
    -[PUAdjustmentsViewController slider](self, "slider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v42;
    objc_msgSend(v15, "setTransform:", &v41);

    v44.origin.x = v5;
    v44.origin.y = v7;
    v44.size.width = v9;
    v44.size.height = v11;
    v16 = CGRectGetMaxX(v44) + -33.0;
    v45.origin.x = v5;
    v45.origin.y = v7;
    v45.size.width = v9;
    v45.size.height = v11;
    MidY = CGRectGetMidY(v45);
    -[PUAdjustmentsViewController slider](self, "slider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCenter:", v16, MidY);

    v46.origin.x = v5;
    v46.origin.y = v7;
    v46.size.width = v9;
    v46.size.height = v11;
    v19 = CGRectGetMaxX(v46) + -51.0 + -66.0;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v19, 0.0, 51.0, v11);

    v21 = v11 * 0.5;
    -[PUAdjustmentsViewController controlSize](self, "controlSize");
    v23 = v11 * 0.5 - v22 * 0.5;
    -[PUAdjustmentsViewController controlSize](self, "controlSize");
    v25 = v21 - v24 * 0.5;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 0.0;
    v29 = 0.0;
    v30 = v23;
    v31 = v25;
  }
  else
  {
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    v32 = CGRectGetMaxY(v47) + -66.0;
    -[PUAdjustmentsViewController slider](self, "slider");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", 0.0, v32, v9, 66.0);

    v48.origin.x = v5;
    v48.origin.y = v7;
    v48.size.width = v9;
    v48.size.height = v11;
    v34 = CGRectGetMaxY(v48) + -51.0 + -66.0;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", 0.0, v34, v9, 51.0);

    v36 = v9 * 0.5;
    -[PUAdjustmentsViewController controlSize](self, "controlSize");
    v38 = v36 - v37 * 0.5;
    -[PUAdjustmentsViewController controlSize](self, "controlSize");
    v40 = v36 - v39 * 0.5;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v30 = 0.0;
    v31 = 0.0;
    v28 = v38;
    v29 = v40;
  }
  objc_msgSend(v26, "setContentInset:", v30, v28, v31, v29);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAdjustmentsViewController;
  -[PUAdjustmentsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PUAdjustmentsViewController _updateViewLayout](self, "_updateViewLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUAdjustmentsViewController;
  -[PUAdjustmentsViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUAdjustmentsViewController collectionViewLayout](self, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    UIRectGetCenter();
    objc_msgSend(v5, "nearestIndexPathForVisibleItemAtPoint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v7);

  }
  if (-[PUAdjustmentsViewController layoutDirection](self, "layoutDirection"))
    v8 = 2;
  else
    v8 = 16;
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "scrollToItemAtIndexPath:atScrollPosition:animated:", v12, v8, 0);

  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v13);

  -[PUAdjustmentsViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adjustmentsViewControllerDidAppear:", self);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)PUAdjustmentsViewController;
  v7 = a4;
  -[PUAdjustmentsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateLayout");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PUAdjustmentsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E58A7A08;
  v10[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);

}

- (void)_updateSliderForControlAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  PXUISnappingController *v28;
  PXUISnappingController *snappingController;
  double v30;
  double v31;
  void *v32;
  id v33;

  v33 = a3;
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v33;
  if (v4 == v33)
  {
    -[PUAdjustmentsViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoForItemAtIndexPath:", v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      LODWORD(v8) = objc_msgSend(v7, "enabled");
      v9 = v8 ^ 1;
      objc_msgSend(v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)*MEMORY[0x1E0D712F0];

      if (v10 == v11)
        v8 = v8;
      else
        v8 = 1;
      -[PUAdjustmentsViewController slider](self, "slider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnabled:dimmed:animated:", v8, v9, 1);

      objc_msgSend(v7, "minimumLevel");
      v14 = v13;
      -[PUAdjustmentsViewController slider](self, "slider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMinimumValue:", v14);

      objc_msgSend(v7, "maximumLevel");
      v17 = v16;
      -[PUAdjustmentsViewController slider](self, "slider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMaximumValue:", v17);

      objc_msgSend(v7, "defaultLevel");
      v20 = v19;
      -[PUAdjustmentsViewController slider](self, "slider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDefaultValue:", v20);

      -[PUAdjustmentsViewController slider](self, "slider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultValue");
      v24 = v23;
      -[PUAdjustmentsViewController slider](self, "slider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setMarkedValue:", v24);

      if (!self->_snappingController)
      {
        v26 = objc_alloc(MEMORY[0x1E0D7BB80]);
        -[PUAdjustmentsViewController slider](self, "slider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "defaultLevel");
        objc_msgSend(v27, "xOffsetForValue:");
        v28 = (PXUISnappingController *)objc_msgSend(v26, "initWithSnappingTarget:");
        snappingController = self->_snappingController;
        self->_snappingController = v28;

        -[PXUISnappingController setRetentionOffsetThreshold:](self->_snappingController, "setRetentionOffsetThreshold:", 5.0);
        -[PXUISnappingController setAttractionOffsetThreshold:](self->_snappingController, "setAttractionOffsetThreshold:", 5.0);
        -[PXUISnappingController setAttractionVelocityThreshold:](self->_snappingController, "setAttractionVelocityThreshold:", 30.0);
        -[PXUISnappingController setAccumulateOffsetWhileSnapped:](self->_snappingController, "setAccumulateOffsetWhileSnapped:", 1);
      }
      objc_msgSend(v7, "currentLevel");
      v31 = v30;
      -[PUAdjustmentsViewController slider](self, "slider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setValue:", v31);

    }
    v5 = v33;
  }

}

- (void)_updateCollectionViewLayoutDirection:(int64_t)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3 == 0;
  -[PUAdjustmentsViewController collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollDirection:", v4);

  -[PUAdjustmentsViewController collectionViewLayout](self, "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (void)setLayoutDirection:(int64_t)a3
{
  if (self->_layoutDirection != a3)
  {
    self->_layoutDirection = a3;
    -[PUAdjustmentsViewController _updateCollectionViewLayoutDirection:](self, "_updateCollectionViewLayoutDirection:");
  }
}

- (void)_updateSelectedInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoForItemAtIndexPath:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_selectedAdjustmentInfo, obj);
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = obj;
    if (v6)
    {
      -[PUAdjustmentsViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "adjustmentsViewControllerDidUpdateSelectedControl:", self);

      v5 = obj;
    }
  }

}

- (void)setSelectedIndexPath:(id)a3
{
  NSIndexPath *v5;
  void *v6;
  void *v7;
  NSIndexPath *v8;

  v5 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v5)
  {
    v8 = v5;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItemAtIndexPath:", self->_selectedIndexPath);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setIsUserModifying:", 0);
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    -[PUAdjustmentsViewController _updateSelectedInfo](self, "_updateSelectedInfo");

    v5 = v8;
  }

}

- (void)_resetControlsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resetToDefault");
  -[PUAdjustmentsViewController slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetToDefault");

}

- (BOOL)canToggleCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "canModifyAdjustmentAtIndexPath:", v7);
  return (char)v4;
}

- (void)didToggleCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isUserModified = 1;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEnabled");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__PUAdjustmentsViewController_didToggleCell___block_invoke;
  v11[3] = &unk_1E589E760;
  v11[4] = self;
  v12 = v6;
  v13 = v4;
  v9 = v4;
  v10 = v6;
  objc_msgSend(v7, "setAdjustmentEnabled:atIndexPath:completionHandler:", v8, v10, v11);

  self->_isUserModified = 0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    if (a5 < 1)
    {
      v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      v14 = *MEMORY[0x1E0DC49E8];
      v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    }
    else
    {
      v10 = -[PUAdjustmentsViewController layoutDirection](self, "layoutDirection");
      if (v10)
        v11 = 0.0;
      else
        v11 = 10.0;
      if (v10)
        v12 = 10.0;
      else
        v12 = 0.0;
      if (v10)
        v13 = 0.0;
      else
        v13 = 10.0;
      if (v10)
        v14 = 10.0;
      else
        v14 = 0.0;
    }
  }
  else
  {
    v15 = -[PUAdjustmentsViewController layoutDirection](self, "layoutDirection");
    v13 = 0.0;
    if (v15)
      v11 = 0.0;
    else
      v11 = 10.0;
    if (v15)
      v12 = 10.0;
    else
      v12 = 0.0;
    v14 = 0.0;
  }

  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  v5 = a4;
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[PUAdjustmentsViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v5);
    -[PUAdjustmentsViewController slider](self, "slider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:dimmed:animated:", 0, 1, 1);

    -[PUAdjustmentsViewController setIsAnimatingScroll:](self, "setIsAnimatingScroll:", 1);
    if (-[PUAdjustmentsViewController layoutDirection](self, "layoutDirection"))
      v8 = 2;
    else
      v8 = 16;
    v9 = MEMORY[0x1E0C809B0];
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v13[3] = &unk_1E58A9DF0;
    v13[4] = self;
    v14 = v5;
    v15 = v8;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v11[3] = &unk_1E58AAE08;
    v11[4] = self;
    v12 = v14;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11, 0.25);

  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t v8;

  -[PUAdjustmentsViewController dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", a4);

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PUAdjustmentsViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSections");

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PUPhotoEditAutoAdjustmentCell *v12;
  PUPhotoEditAutoAdjustmentCell *v13;
  PUPhotoEditAutoAdjustmentCell *autoEnhanceCell;

  v6 = a4;
  v7 = a3;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoForItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D712F0];

  if (v10 == v11)
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUEditAutoEnhanceCellReuseIdentifier"), v6);
    v13 = (PUPhotoEditAutoAdjustmentCell *)objc_claimAutoreleasedReturnValue();

    autoEnhanceCell = self->_autoEnhanceCell;
    self->_autoEnhanceCell = v13;

    -[PUPhotoEditAutoAdjustmentCell setDelegate:](self->_autoEnhanceCell, "setDelegate:", self);
    v12 = self->_autoEnhanceCell;
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUEditAdjustmentsCellReuseIdentifier"), v6);
    v12 = (PUPhotoEditAutoAdjustmentCell *)objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditAutoAdjustmentCell setDelegate:](v12, "setDelegate:", self);
    -[PUPhotoEditAutoAdjustmentCell setShouldDisplayValueLabel:](v12, "setShouldDisplayValueLabel:", -[PUAdjustmentsViewController shouldDisplayControlValues](self, "shouldDisplayControlValues"));
    -[PUPhotoEditAutoAdjustmentCell setDisplayMappedValue:](v12, "setDisplayMappedValue:", -[PUAdjustmentsViewController shouldDisplayMappedValues](self, "shouldDisplayMappedValues"));
  }
  -[PUAdjustmentsViewController _updateCell:withInfo:](self, "_updateCell:withInfo:", v12, v9);

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAdjustmentsViewController _updateCell:withInfo:](self, "_updateCell:withInfo:", v10, v9);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)_circularImageWithSize:(CGSize)a3 color:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PUAdjustmentsViewController__circularImageWithSize_color___block_invoke;
  v11[3] = &unk_1E589BB90;
  v12 = v6;
  v13 = width;
  v14 = height;
  v8 = v6;
  objc_msgSend(v7, "imageWithActions:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setupCellBackgroundImagesIfNeeded
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *itemBackgroundImage;
  void *v7;
  UIImage *v8;
  UIImage *selectedItemBackgroundImage;
  id v10;

  if (!self->_itemBackgroundImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v4, 51.0, 51.0);
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    itemBackgroundImage = self->_itemBackgroundImage;
    self->_itemBackgroundImage = v5;

  }
  if (!self->_selectedItemBackgroundImage)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v10, 53.0, 53.0);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    selectedItemBackgroundImage = self->_selectedItemBackgroundImage;
    self->_selectedItemBackgroundImage = v8;

  }
}

- (id)_backgroundImageForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  int *v6;

  v4 = a3;
  -[PUAdjustmentsViewController _setupCellBackgroundImagesIfNeeded](self, "_setupCellBackgroundImagesIfNeeded");
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = &OBJC_IVAR___PUAdjustmentsViewController__itemBackgroundImage;
  if (v5 == v4)
    v6 = &OBJC_IVAR___PUAdjustmentsViewController__selectedItemBackgroundImage;
  return *(id *)((char *)&self->super.super.super.isa + *v6);
}

- (void)_updateCell:(id)a3 withInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14 && v6)
  {
    objc_msgSend(v6, "iconName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImageTransformBlock:", 0);
    -[PUAdjustmentsViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if (v9 == 1)
    {
      objc_msgSend(v6, "altIconName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v6, "altIconName");
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v11;
      }
      objc_msgSend(v6, "altImageTransformBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "altImageTransformBlock");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setImageTransformBlock:", v13);

      }
    }
    objc_msgSend(v14, "setImageName:", v7);
    objc_msgSend(v14, "setImageIsColor:", objc_msgSend(v6, "iconIsColor"));
    objc_msgSend(v14, "setEnabled:", objc_msgSend(v6, "enabled"));
    objc_msgSend(v6, "minimumLevel");
    objc_msgSend(v14, "setMinValue:");
    objc_msgSend(v6, "maximumLevel");
    objc_msgSend(v14, "setMaxValue:");
    objc_msgSend(v6, "defaultLevel");
    objc_msgSend(v14, "setDefaultValue:");
    objc_msgSend(v6, "identityLevel");
    objc_msgSend(v14, "setIdentityValue:");
    objc_msgSend(v6, "currentLevel");
    objc_msgSend(v14, "setValue:");

  }
}

- (void)updateControls
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PUAdjustmentsViewController setUpdatingControls:](self, "setUpdatingControls:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUAdjustmentsViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PUAdjustmentsViewController dataSource](self, "dataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "infoForItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAdjustmentsViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAdjustmentsViewController _updateCell:withInfo:](self, "_updateCell:withInfo:", v13, v11);
        if (!self->_isUserModified)
          -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[PUAdjustmentsViewController setUpdatingControls:](self, "setUpdatingControls:", 0);
}

- (void)resetControls
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PUAdjustmentsViewController collectionView](self, "collectionView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[PUAdjustmentsViewController dataSource](self, "dataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "infoForItemAtIndexPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAdjustmentsViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForItemAtIndexPath:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAdjustmentsViewController _updateCell:withInfo:](self, "_updateCell:withInfo:", v13, v11);
        -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)increaseAdjustmentValue:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PUAdjustmentsViewController slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", v5, 0, v3);
  -[PUAdjustmentsViewController sliderValueChanged:](self, "sliderValueChanged:", v5);

}

- (void)decreaseAdjustmentValue:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PUAdjustmentsViewController slider](self, "slider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PUPhotoEditSupport changeValueOfSlider:reverse:coarse:](PUPhotoEditSupport, "changeValueOfSlider:reverse:coarse:", v5, 1, v3);
  -[PUAdjustmentsViewController sliderValueChanged:](self, "sliderValueChanged:", v5);

}

- (void)toggleAutoEnhance
{
  -[PUPhotoEditAutoAdjustmentCell performPrimaryAction](self->_autoEnhanceCell, "performPrimaryAction");
}

- (void)hideUnselectedAdjustments:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PUAdjustmentsViewController collectionView](self, "collectionView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = !v3;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "compare:", v12);

        -[PUAdjustmentsViewController collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cellForItemAtIndexPath:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v17 = v10;
        else
          v17 = 1;
        objc_msgSend(v16, "setAlpha:", (double)v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (void)selectAdjustmentInfoAtIndexPath:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[PUAdjustmentsViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v8);
    if (-[PUAdjustmentsViewController layoutDirection](self, "layoutDirection"))
      v6 = 2;
    else
      v6 = 16;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, v6, 1);

  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  -[PUAdjustmentsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
    -[PUAdjustmentsViewController updateControls](self, "updateControls");
}

- (void)sliderValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!-[PUAdjustmentsViewController isAnimatingScroll](self, "isAnimatingScroll"))
  {
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEnabled") & 1) == 0)
    {
      objc_msgSend(v6, "setEnabled:", 1);
      objc_msgSend(v11, "setEnabled:dimmed:animated:", 1, 0, 1);
    }
    objc_msgSend(v6, "setIsUserModifying:", 1);
    objc_msgSend(v11, "value");
    objc_msgSend(v6, "setValue:");
    self->_isUserModified = 1;
    -[PUAdjustmentsViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v9 = v8;
    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modifyValue:atIndexPath:", v10, v9);

    self->_isUserModified = 0;
  }

}

- (void)sliderWillBeginScrolling:(id)a3
{
  int64_t sliderScrubbingLevel;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  if (!-[PUAdjustmentsViewController updatingControls](self, "updatingControls", a3))
  {
    sliderScrubbingLevel = self->_sliderScrubbingLevel;
    if (!sliderScrubbingLevel)
    {
      -[PUAdjustmentsViewController dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beginInteractiveChange");

      sliderScrubbingLevel = self->_sliderScrubbingLevel;
    }
    self->_sliderScrubbingLevel = sliderScrubbingLevel + 1;
  }
  -[PUAdjustmentsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustmentsViewControllerSliderWillBeginScrubbing:", self);

  }
  -[PXUISnappingController interactionBegan](self->_snappingController, "interactionBegan");
}

- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5
{
  -[PXUISnappingController updateOffset:withVelocity:shouldSnap:shouldBreak:](self->_snappingController, "updateOffset:withVelocity:shouldSnap:shouldBreak:", a4, 0, 0, -a5);
}

- (void)_sliderDidEndScrolling
{
  void *v3;
  char v4;
  void *v5;

  -[PUAdjustmentsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adjustmentsViewControllerSliderDidEndScrubbing:", self);

  }
  -[PXUISnappingController interactionEnded](self->_snappingController, "interactionEnded");
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  void *v7;
  char v8;
  void *v9;

  x = a4.x;
  -[PUAdjustmentsViewController delegate](self, "delegate", a3, a5, a4.x, a4.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjustmentsViewControllerSliderWillEndScrubbing:", self);

  }
  if (x == 0.0)
    -[PUAdjustmentsViewController _sliderDidEndScrolling](self, "_sliderDidEndScrolling");
}

- (void)sliderDidEndScrolling:(id)a3
{
  int64_t v4;
  id v5;

  -[PUAdjustmentsViewController _sliderDidEndScrolling](self, "_sliderDidEndScrolling", a3);
  if (!-[PUAdjustmentsViewController updatingControls](self, "updatingControls"))
  {
    v4 = self->_sliderScrubbingLevel - 1;
    self->_sliderScrubbingLevel = v4;
    if (!v4)
    {
      -[PUAdjustmentsViewController dataSource](self, "dataSource");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endInteractiveChange");

    }
  }
}

- (void)_performFeedbackIfNeeded
{
  void *v3;

  if (!-[PUAdjustmentsViewController didPerformHapticFeedback](self, "didPerformHapticFeedback"))
  {
    -[PUAdjustmentsViewController selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performFeedback");

    -[PUAdjustmentsViewController setDidPerformHapticFeedback:](self, "setDidPerformHapticFeedback:", 1);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  CFAbsoluteTime Current;
  CFAbsoluteTime v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  void *v23;
  double MidX;
  double v25;
  id v27;
  CGRect v28;
  CGRect v29;

  v27 = a3;
  if (!-[PUAdjustmentsViewController isAnimatingScroll](self, "isAnimatingScroll")
    && ((objc_msgSend(v27, "isTracking") & 1) != 0 || objc_msgSend(v27, "isDecelerating")))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = Current - self->_previousTimeStamp;
    objc_msgSend(v27, "contentOffset");
    v7 = fabs((v6 - self->_lastOffset.x) / v5) / 100.0;
    objc_msgSend(v27, "contentOffset");
    self->_lastOffset.x = v8;
    self->_lastOffset.y = v9;
    self->_previousTimeStamp = Current;
    -[PUAdjustmentsViewController collectionViewLayout](self, "collectionViewLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    PXRectGetCenter();
    objc_msgSend(v10, "nearestIndexPathForVisibleItemAtPoint:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      -[PUAdjustmentsViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v11);
      -[PUAdjustmentsViewController setDidPerformHapticFeedback:](self, "setDidPerformHapticFeedback:", 0);
      if (v7 > 15.0)
        -[PUAdjustmentsViewController _performFeedbackIfNeeded](self, "_performFeedbackIfNeeded");
    }
    objc_msgSend(v27, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutAttributesForItemAtIndexPath:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "frame");
    MidX = CGRectGetMidX(v28);
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v18;
    v29.size.height = v20;
    v25 = vabdd_f64(MidX, CGRectGetMidX(v29));
    if (v7 < 15.0 && v25 < 6.0)
      -[PUAdjustmentsViewController _performFeedbackIfNeeded](self, "_performFeedbackIfNeeded", v25);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[PUAdjustmentsViewController slider](self, "slider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:dimmed:animated:", 0, 1, 1);

  -[PUAdjustmentsViewController selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareFeedback");

  -[PUAdjustmentsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adjustmentsViewControllerToolWillBeginScrubbing:", self);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!a4)
  {
    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v6);

  }
  -[PUAdjustmentsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PUAdjustmentsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjustmentsViewControllerToolDidEndScrubbing:", self);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(a3, "isDragging") & 1) == 0)
  {
    -[PUAdjustmentsViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);

    -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v6);

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;

  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController _updateSliderForControlAtIndexPath:](self, "_updateSliderForControlAtIndexPath:", v4);

}

- (void)ppt_selectNextAdjustment
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "section");

  -[PUAdjustmentsViewController selectedIndexPath](self, "selectedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item") + 1;

  -[PUAdjustmentsViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", v4);

  if (v6 >= v8)
  {
    ++v4;
    -[PUAdjustmentsViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfSections") - 1;

    v9 = (void *)MEMORY[0x1E0CB36B0];
    if (v4 >= v12)
    {
      v10 = 0;
      v13 = 0;
      goto LABEL_7;
    }
    v10 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB36B0];
    v10 = v6;
  }
  v13 = v4;
LABEL_7:
  objc_msgSend(v9, "indexPathForItem:inSection:", v10, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scrollToItemAtIndexPath:atScrollPosition:animated:", v16, 16, 1);

  -[PUAdjustmentsViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAdjustmentsViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v15, v16);

}

- (double)ppt_sliderVisibleScaleValue
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[PUAdjustmentsViewController slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4 * 100.0;
  -[PUAdjustmentsViewController slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumValue");
  v8 = v5 / v7;

  return v8;
}

- (double)ppt_sliderValueIncrement
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;

  -[PUAdjustmentsViewController slider](self, "slider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumValue");
  v5 = v4;

  -[PUAdjustmentsViewController slider](self, "slider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumValue");
  v8 = v7;

  -[PUAdjustmentsViewController slider](self, "slider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tickMarkCount") - 1;

  -[PUAdjustmentsViewController slider](self, "slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumValue");
  v13 = (v8 - v5) / fmax((double)v10, 1.0) * 100.0 / v12;

  return v13;
}

- (PUAdjustmentsViewDataSource)dataSource
{
  return (PUAdjustmentsViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (PUAdjustmentViewControllerDelegate)delegate
{
  return (PUAdjustmentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (BOOL)shouldDisplayControlValues
{
  return self->_shouldDisplayControlValues;
}

- (void)setShouldDisplayControlValues:(BOOL)a3
{
  self->_shouldDisplayControlValues = a3;
}

- (BOOL)shouldDisplayMappedValues
{
  return self->_shouldDisplayMappedValues;
}

- (void)setShouldDisplayMappedValues:(BOOL)a3
{
  self->_shouldDisplayMappedValues = a3;
}

- (PUAdjustmentInfo)selectedAdjustmentInfo
{
  return self->_selectedAdjustmentInfo;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (PUAdjustmentsViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (CEKSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
  objc_storeStrong((id *)&self->_slider, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (CGSize)controlSize
{
  double width;
  double height;
  CGSize result;

  width = self->_controlSize.width;
  height = self->_controlSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setControlSize:(CGSize)a3
{
  self->_controlSize = a3;
}

- (BOOL)updatingControls
{
  return self->_updatingControls;
}

- (void)setUpdatingControls:(BOOL)a3
{
  self->_updatingControls = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (PUSelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (BOOL)didPerformHapticFeedback
{
  return self->_didPerformHapticFeedback;
}

- (void)setDidPerformHapticFeedback:(BOOL)a3
{
  self->_didPerformHapticFeedback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_selectedAdjustmentInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_snappingController, 0);
  objc_storeStrong((id *)&self->_autoEnhanceCell, 0);
  objc_storeStrong((id *)&self->_itemBackgroundImage, 0);
  objc_storeStrong((id *)&self->_selectedItemBackgroundImage, 0);
}

void __60__PUAdjustmentsViewController__circularImageWithSize_color___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  CGContext *v5;
  CGRect v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setFill");
  v5 = (CGContext *)objc_msgSend(v4, "CGContext");

  v6.size.width = *(CGFloat *)(a1 + 40);
  v6.size.height = *(CGFloat *)(a1 + 48);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  CGContextFillEllipseInRect(v5, v6);
}

void __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

uint64_t __71__PUAdjustmentsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSliderForControlAtIndexPath:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingScroll:", 0);
}

void __45__PUAdjustmentsViewController_didToggleCell___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSliderForControlAtIndexPath:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentLevel");
    objc_msgSend(*(id *)(a1 + 48), "setValue:");
    objc_msgSend(*(id *)(a1 + 48), "setIsUserModifying:", objc_msgSend(v4, "enabled"));

  }
}

void __82__PUAdjustmentsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "selectedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "layoutDirection"))
      v3 = 2;
    else
      v3 = 16;
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, v3, 0);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "selectedIndexPath");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateSliderForControlAtIndexPath:", v7);

  }
}

@end
