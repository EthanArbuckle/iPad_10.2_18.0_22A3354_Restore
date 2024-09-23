@implementation PXCMMSectionHeaderController

- (PXCMMSectionHeaderController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 64, CFSTR("%s is not available as initializer"), "-[PXCMMSectionHeaderController init]");

  abort();
}

- (PXCMMSectionHeaderController)initWithActivityType:(unint64_t)a3 viewModel:(id)a4 momentShareStatusPresentation:(id)a5 importStatusManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXCMMSectionHeaderController *v14;
  PXCMMSectionHeaderController *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXCMMSectionHeaderController;
  v14 = -[PXCMMSectionHeaderController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_activityType = a3;
    objc_storeStrong((id *)&v14->_viewModel, a4);
    -[PXCMMViewModel registerChangeObserver:context:](v15->_viewModel, "registerChangeObserver:context:", v15, PXCMMViewModelObservationContext);
    -[PXCMMViewModel selectionManager](v15->_viewModel, "selectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerChangeObserver:context:", v15, SelectionModelObservationContext);

    objc_storeStrong((id *)&v15->_momentShareStatusPresentation, a5);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v15->_momentShareStatusPresentation, "registerChangeObserver:context:", v15, PXMomentShareStatusPresentationObservationContext_170786);
    objc_storeStrong((id *)&v15->_importStatusManager, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v15, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v15;
}

- (void)_loadViewIfNeeded
{
  id v3;
  UIView *v4;
  UIView *underlyingView;
  void *v6;
  UILabel *v7;
  UILabel *photosLabel;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_isViewLoaded)
  {
    self->_isViewLoaded = 1;
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    underlyingView = self->_underlyingView;
    self->_underlyingView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_underlyingView, "setBackgroundColor:", v6);

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    photosLabel = self->_photosLabel;
    self->_photosLabel = v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_photosLabel, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_photosLabel, "setNumberOfLines:", 1);
    objc_msgSend((id)objc_opt_class(), "_photosLabelFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_photosLabel, "setFont:", v10);

    PXLocalizedStringFromTable(CFSTR("PXCMMSectionHeaderTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_photosLabel, "setText:", v11);

    -[UIView addSubview:](self->_underlyingView, "addSubview:", self->_photosLabel);
    -[PXCMMSectionHeaderController _updateActionButtons](self, "_updateActionButtons");
  }
}

- (UIView)view
{
  -[PXCMMSectionHeaderController _loadViewIfNeeded](self, "_loadViewIfNeeded");
  return self->_underlyingView;
}

- (void)_handleActionButtonTapped:(id)a3
{
  PXCMMViewModel *v3;
  BOOL v4;
  _QWORD v5[4];
  BOOL v6;

  v3 = self->_viewModel;
  v4 = -[PXCMMViewModel isSelecting](v3, "isSelecting");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PXCMMSectionHeaderController__handleActionButtonTapped___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
  v6 = v4;
  -[PXCMMViewModel performChanges:](v3, "performChanges:", v5);

}

- (void)_handleSecondaryButtonTapped:(id)a3
{
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[PXCMMSectionHeaderController secondaryActionButtonType](self, "secondaryActionButtonType");
  if (v5 == 3)
  {
    -[PXCMMSectionHeaderController _selectAllAssets](self, "_selectAllAssets");
  }
  else if (v5 == 4)
  {
    -[PXCMMSectionHeaderController _deselectAllAssets](self, "_deselectAllAssets");
  }
  else if (v5 < 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 143, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }

}

- (void)_setActionButtonType:(int64_t)a3
{
  UIButton *actionButton;
  __CFString *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;

  if (self->_actionButtonType != a3)
  {
    self->_actionButtonType = a3;
    switch(a3)
    {
      case 0:
      case 3:
      case 4:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 164, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1:
        actionButton = self->_actionButton;
        v5 = CFSTR("PXCMMSelectButtonTitle");
        goto LABEL_5;
      case 2:
        actionButton = self->_actionButton;
        v5 = CFSTR("PXCMMCancelButtonTitle");
LABEL_5:
        PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v6, 0);

        break;
      default:
        break;
    }
    -[UIView frame](self->_underlyingView, "frame");
    -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v7, v8);
  }
}

- (void)_setSecondaryActionButtonType:(int64_t)a3
{
  void *v5;
  UIButton *secondaryButton;
  __CFString *v7;
  void *v8;
  double v9;
  double v10;

  if (self->_secondaryActionButtonType != a3)
  {
    self->_secondaryActionButtonType = a3;
    if (a3 == 3)
    {
      secondaryButton = self->_secondaryButton;
      v7 = CFSTR("PXCMMSelectAllButtonTitle");
    }
    else
    {
      if (a3 != 4)
      {
        if ((unint64_t)a3 < 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 187, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
        goto LABEL_9;
      }
      secondaryButton = self->_secondaryButton;
      v7 = CFSTR("PXCMMDeselectAllButtonTitle");
    }
    PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](secondaryButton, "setTitle:forState:", v8, 0);

LABEL_9:
    -[UIView frame](self->_underlyingView, "frame");
    -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v9, v10);
  }
}

- (void)_layoutButtonWithSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PXCMMSectionHeaderController *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;

  height = a3.height;
  width = a3.width;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v7 = v6;
  v8 = height - v6;
  -[PXCMMSectionHeaderController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__PXCMMSectionHeaderController__layoutButtonWithSize___block_invoke;
  v11[3] = &unk_1E51313E0;
  v12 = v9;
  v13 = self;
  v14 = width;
  v15 = height;
  v16 = v8;
  v17 = v7;
  v10 = v9;
  +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", v10, v11);

}

- (BOOL)_wantsActionButtons
{
  unint64_t activityType;
  BOOL v3;
  void *v7;

  activityType = self->_activityType;
  if (activityType == 3)
    return 0;
  if (activityType)
    v3 = activityType == 4;
  else
    v3 = 1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 294, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 1;
}

- (void)_updateActionButtons
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *actionButton;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  UIButton *v16;
  UIButton *secondaryButton;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  void *v22;
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  UIButton *v31;
  uint64_t v32;

  if (!self->_isViewLoaded || !-[PXCMMSectionHeaderController _wantsActionButtons](self, "_wantsActionButtons"))
    return;
  if (!self->_actionButton)
  {
    -[UIView tintColor](self->_underlyingView, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    actionButton = self->_actionButton;
    self->_actionButton = v5;

    objc_msgSend((id)objc_opt_class(), "_buttonLabelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_actionButton, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    v9 = self->_actionButton;
    -[UIView tintColor](self->_underlyingView, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    -[UIButton setTitleColor:forState:](self->_actionButton, "setTitleColor:forState:", v4, 1);
    -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__handleActionButtonTapped_, 0x2000);
    -[UIView addSubview:](self->_underlyingView, "addSubview:", self->_actionButton);

  }
  v11 = -[PXCMMViewModel isSelecting](self->_viewModel, "isSelecting");
  v12 = 1;
  if (v11)
    v13 = 2;
  else
    v13 = 1;
  -[PXCMMSectionHeaderController _setActionButtonType:](self, "_setActionButtonType:", v13);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", -[PXCMMViewModel selectionEnabled](self->_viewModel, "selectionEnabled") ^ 1);
  if (v11)
  {
    if (!self->_secondaryButton)
    {
      -[UIView tintColor](self->_underlyingView, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "colorWithAlphaComponent:", 0.3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = v16;

      objc_msgSend((id)objc_opt_class(), "_buttonLabelFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](self->_secondaryButton, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFont:", v18);

      v20 = self->_secondaryButton;
      -[UIView tintColor](self->_underlyingView, "tintColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v20, "setTitleColor:forState:", v21, 0);

      -[UIButton setTitleColor:forState:](self->_secondaryButton, "setTitleColor:forState:", v15, 1);
      -[UIButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__handleSecondaryButtonTapped_, 0x2000);
      -[UIView addSubview:](self->_underlyingView, "addSubview:", self->_secondaryButton);

    }
    -[PXCMMViewModel selectionManager](self->_viewModel, "selectionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    momentShareStatusPresentation = self->_momentShareStatusPresentation;
    if (momentShareStatusPresentation && self->_activityType == 2)
    {
      v24 = -[PXMomentShareStatusPresentation numberOfAssetsNotCopied](momentShareStatusPresentation, "numberOfAssetsNotCopied");
      objc_msgSend(v22, "selectionSnapshot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "selectedIndexPaths");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v24 != v27)
      {
LABEL_14:
        v28 = 3;
LABEL_18:
        -[PXCMMSectionHeaderController _setSecondaryActionButtonType:](self, "_setSecondaryActionButtonType:", v28);

        v12 = -[PXCMMViewModel selectionEnabled](self->_viewModel, "selectionEnabled") ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(v22, "selectionSnapshot");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "areAllItemsSelected");

      if ((v30 & 1) == 0)
        goto LABEL_14;
    }
    v28 = 4;
    goto LABEL_18;
  }
LABEL_19:
  -[UIButton setHidden:](self->_secondaryButton, "setHidden:", v12);
  v31 = self->_secondaryButton;
  if (v31)
    v32 = -[UIButton isHidden](v31, "isHidden") ^ 1;
  else
    v32 = 0;
  -[UILabel setHidden:](self->_photosLabel, "setHidden:", v32);
}

- (void)_selectAllAssets
{
  void *v3;
  id v4;

  -[PXCMMViewModel selectionManager](self->_viewModel, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_activityType == 2 && self->_importStatusManager)
    objc_msgSend(v3, "selectNonCopiedAssetsWithImportStatusManager:");
  else
    objc_msgSend(v3, "performChanges:", &__block_literal_global_170793);

}

- (void)_deselectAllAssets
{
  id v2;

  -[PXCMMViewModel selectionManager](self->_viewModel, "selectionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_159_170792);

}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", a3->contentSize.width, a3->contentSize.height);
}

- (void)becomeReusable
{
  -[UIView setHidden:](self->_underlyingView, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[UIView setHidden:](self->_underlyingView, "setHidden:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCMMViewModelObservationContext == a5)
  {
    if ((v6 & 0x4400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((void *)SelectionModelObservationContext == a5)
  {
    if ((v6 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_170786 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMSectionHeaderController.m"), 424, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x4000) != 0)
  {
LABEL_7:
    v11 = v9;
    -[PXCMMSectionHeaderController _updateActionButtons](self, "_updateActionButtons");
    v9 = v11;
  }
LABEL_8:

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend((id)objc_opt_class(), "_photosLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_photosLabel, "setFont:", v4);

  objc_msgSend((id)objc_opt_class(), "_buttonLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  objc_msgSend((id)objc_opt_class(), "_buttonLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_secondaryButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[UIButton titleLabel](self->_secondaryButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeToFit");

  -[UIView frame](self->_underlyingView, "frame");
  -[PXCMMSectionHeaderController _layoutButtonWithSize:](self, "_layoutButtonWithSize:", v11, v12);
}

- (int64_t)actionButtonType
{
  return self->_actionButtonType;
}

- (int64_t)secondaryActionButtonType
{
  return self->_secondaryActionButtonType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLabel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_underlyingView, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __50__PXCMMSectionHeaderController__deselectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __48__PXCMMSectionHeaderController__selectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

void __54__PXCMMSectionHeaderController__layoutButtonWithSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v19;
  NSString *v20;
  _BOOL4 IsAccessibilityCategory;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int64x2_t v38;
  void *v39;
  _QWORD v40[2];
  int64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int64x2_t v45;
  int64x2_t v46;
  _OWORD v47[3];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGRect v52;

  v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(*(id *)(a1 + 32), "semanticContentAttribute"));
  v5 = v4;
  if (v4 == 1)
    v6 = 64;
  else
    v6 = 56;
  if (v4 == 1)
    v7 = 56;
  else
    v7 = 64;
  v8 = *(id *)(*(_QWORD *)(a1 + 40) + v6);
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + v7);
  objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v11 = v10;
  v13 = v12;
  v14 = *(double *)(a1 + 48) - v10 + -20.0;
  objc_msgSend(v9, "sizeThatFits:");
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);

  v22 = 20.0;
  if (IsAccessibilityCategory)
    v23 = 20.0;
  else
    v23 = v14;
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (v5 == 1 && IsAccessibilityCategory)
  {
    v22 = *(double *)(a1 + 48) - v16 + -20.0;
    v23 = v14;
  }
  objc_msgSend(v8, "setFrame:", v23, *(double *)(MEMORY[0x1E0C9D648] + 8), v11, v13);
  objc_msgSend(v9, "setFrame:", v22, v24, v16, v18);
  v47[0] = vdupq_n_s64(0x7FF8000000000000uLL);
  v47[1] = v47[0];
  v47[2] = v47[0];
  v48 = v47[0];
  v49 = v47[0];
  v50 = v47[0];
  v51 = v47[0];
  *((_QWORD *)&v48 + 1) = *(_QWORD *)(a1 + 64);
  if (v9)
    objc_msgSend(v3, "layoutView:withAttributes:", v9, v47);
  if (v8)
    objc_msgSend(v3, "layoutView:withAttributes:", v8, v47);
  v25 = *(double *)(a1 + 72);
  if (IsAccessibilityCategory)
  {
    if (v5 == 1)
      v26 = v8;
    else
      v26 = v9;
    if (v5 == 1)
    {
      v27 = v23;
    }
    else
    {
      v13 = v18;
      v11 = v16;
      v27 = v22;
    }
    v28 = v26;
    objc_msgSend((id)objc_opt_class(), "_buttonLabelFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    v31 = v30;
    objc_msgSend(v29, "leading");
    v33 = v31 + v32;
    objc_msgSend(v29, "descender");
    v35 = v33 + v34;
    objc_msgSend(v29, "capHeight");
    v37 = v25 - (v35 - v36);
    v52.origin.x = v27;
    v52.origin.y = v24;
    v52.size.width = v11;
    v52.size.height = v13;
    objc_msgSend(v28, "setFrame:", v27, v37 + (CGRectGetHeight(v52) - v31) * -0.5, v11, v13);

  }
  v38 = vdupq_n_s64(0x7FF8000000000000uLL);
  v40[1] = v38.i64[1];
  v41 = v38;
  v42 = v38;
  v43 = v38;
  v45 = v38;
  v46 = v38;
  v40[0] = 0x4034000000000000;
  *(double *)&v45.i64[1] = *(double *)(a1 + 48) + 20.0;
  v43.i64[1] = *(_QWORD *)(a1 + 64);
  v44 = vdupq_n_s64(0x7FF0000000000000uLL);
  objc_msgSend(v3, "layoutView:withAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), v40);
  if (IsAccessibilityCategory)
  {
    objc_msgSend((id)objc_opt_class(), "_photosLabelFont");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "lineHeight");
    objc_msgSend(v39, "leading");
    objc_msgSend(v39, "descender");
    objc_msgSend(v39, "capHeight");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "frame");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setFrame:");

  }
}

uint64_t __58__PXCMMSectionHeaderController__handleActionButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelecting:", *(_BYTE *)(a1 + 32) == 0);
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMSectionHeaderController.m"), 68, CFSTR("%s is not available as initializer"), "+[PXCMMSectionHeaderController new]");

  abort();
}

+ (id)_buttonLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 0);
}

+ (id)_photosLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
}

@end
