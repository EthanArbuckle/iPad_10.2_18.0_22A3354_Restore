@implementation PXPhotosViewOptionsToolbarController

- (PXPhotosViewOptionsToolbarController)initWithModel:(id)a3 containerView:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PXPhotosViewOptionsToolbarController *v11;
  PXPhotosViewOptionsToolbarController *v12;
  PXPhotosLensControl *v13;
  PXPhotosLensControl *photosLensControl;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewOptionsToolbarController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("model"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewOptionsToolbarController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosViewOptionsToolbarController;
  v11 = -[PXSecondaryToolbarController initWithContainerView:styleGuideProvider:](&v19, sel_initWithContainerView_styleGuideProvider_, v10, self);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, a3);
    -[PXPhotosViewOptionsModel registerChangeObserver:context:](v12->_model, "registerChangeObserver:context:", v12, &PXPhotosViewOptionsModelObserverContext);
    v13 = objc_alloc_init(PXPhotosLensControl);
    photosLensControl = v12->_photosLensControl;
    v12->_photosLensControl = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLensControl setContentBackgroundColor:](v12->_photosLensControl, "setContentBackgroundColor:", v15);

    -[PXPhotosLensControl setDelegate:](v12->_photosLensControl, "setDelegate:", v12);
    v12->_shouldHideAccessoryViewsOnScroll = 1;
    -[PXPhotosViewOptionsToolbarController _updateLensControl](v12, "_updateLensControl");
    -[PXSecondaryToolbarController setContentView:](v12, "setContentView:", v12->_photosLensControl);
  }

  return v12;
}

- (void)backdropGroupNameDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewOptionsToolbarController;
  -[PXSecondaryToolbarController backdropGroupNameDidChange](&v3, sel_backdropGroupNameDidChange);
  -[PXPhotosViewOptionsToolbarController _updateLensControl](self, "_updateLensControl");
}

- (void)_updateLensControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PXPhotosViewOptionsToolbarController model](self, "model");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewOptionsToolbarController photosLensControl](self, "photosLensControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSecondaryToolbarController backdropGroupName](self, "backdropGroupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackdropGroupName:", v4);

  objc_msgSend(v8, "lensControlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItems:", v5);

  objc_msgSend(v8, "lensControlItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabledItems:", v6);

  objc_msgSend(v8, "selectedLensControlItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedItem:", v7);

}

- (void)_updateAccessoryViews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;

  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXNumberFilter output](self->_userScrollVelocityFilter, "output");
  v5 = v4;
  v6 = -v4;
  if (v5 >= 0.0)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(v3, "smallestSignificantScrollVelocity");
  if (v7 > v8 || self->_isScrolledAtBottom)
  {
    v9 = v5 < 0.0
      && !self->_isScrolledAtBottom
      && -[PXPhotosViewOptionsToolbarController shouldHideAccessoryViewsOnScroll](self, "shouldHideAccessoryViewsOnScroll");
    -[PXSecondaryToolbarController leadingAccessoryView](self, "leadingAccessoryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alpha");
    v12 = v11 >= 0.001;

    if (((v9 ^ v12) & 1) == 0)
    {
      if (v9)
        v13 = 0.0;
      else
        v13 = 1.0;
      -[PXSecondaryToolbarController leadingAccessoryView](self, "leadingAccessoryView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSecondaryToolbarController trailingAccessoryView](self, "trailingAccessoryView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0DC3F10];
      v17 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke;
      v24[3] = &unk_1E5145560;
      v25 = v14;
      v27 = v13;
      v26 = v15;
      v20[0] = v17;
      v20[1] = 3221225472;
      v20[2] = __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke_2;
      v20[3] = &unk_1E5122008;
      v23 = v9;
      v21 = v25;
      v22 = v26;
      v18 = v26;
      v19 = v25;
      objc_msgSend(v16, "animateWithDuration:animations:completion:", v24, v20, 0.2);

    }
  }

}

- (void)photosLensControl:(id)a3 didSelectItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "yearsAndMonthsMode");

  if (v7)
  {
    -[PXPhotosViewOptionsToolbarController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke;
    v16[3] = &unk_1E5144498;
    v17 = v5;
    objc_msgSend(v8, "performChanges:", v16);

  }
  else
  {
    objc_msgSend(v5, "identifier");
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == CFSTR("years")
      || (v11 = -[__CFString isEqual:](v9, "isEqual:", CFSTR("years")), v10, (v11 & 1) != 0)
      || (objc_msgSend(v5, "identifier"),
          v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
          v12 == CFSTR("months")))
    {

    }
    else
    {
      v13 = v12;
      v14 = -[__CFString isEqual:](v12, "isEqual:", CFSTR("months"));

      if ((v14 & 1) == 0)
        goto LABEL_10;
    }
    v15 = +[PXAlert show:](PXAlert, "show:", &__block_literal_global_76303);
  }
LABEL_10:

}

- (void)photosLensControl:(id)a3 didTapOnAlreadySelectedItem:(id)a4
{
  id v5;

  -[PXSecondaryToolbarController actionHandler](self, "actionHandler", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryToolbarController:scrollToBottomAnimated:", self, 1);

}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  PXVelocityNumberFilter *v4;
  PXVelocityNumberFilter *userScrollVelocityFilter;

  +[PXVelocityNumberFilter gestureVelocityFilter](PXVelocityNumberFilter, "gestureVelocityFilter", a3);
  v4 = (PXVelocityNumberFilter *)objc_claimAutoreleasedReturnValue();
  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  self->_userScrollVelocityFilter = v4;

}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4;
  PXVelocityNumberFilter *userScrollVelocityFilter;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  self->_isScrolledAtBottom = objc_msgSend(v4, "isScrolledAtEdge:tolerance:", 3, 100.0);
  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PXPhotosViewOptionsToolbarController_scrollViewControllerDidScroll___block_invoke;
  v7[3] = &unk_1E51222D8;
  v8 = v4;
  v6 = v4;
  -[PXNumberFilter performChanges:](userScrollVelocityFilter, "performChanges:", v7);
  -[PXPhotosViewOptionsToolbarController _updateAccessoryViews](self, "_updateAccessoryViews");

}

- (void)scrollViewControllerDidEndScrolling:(id)a3
{
  PXVelocityNumberFilter *userScrollVelocityFilter;

  userScrollVelocityFilter = self->_userScrollVelocityFilter;
  self->_userScrollVelocityFilter = 0;

}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  PXEdgeInsetsMake();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *(double *)off_1E50B8020;
  v4 = *((double *)off_1E50B8020 + 1);
  v5 = *((double *)off_1E50B8020 + 2);
  v6 = *((double *)off_1E50B8020 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  return 2;
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  return 0;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PXSecondaryToolbarController contentView](self, "contentView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 320.0, 200.0);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  return 1;
}

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  return 0.0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v8 = a3;
  if ((void *)PXPhotosViewOptionsModelObserverContext == a5)
  {
    v18 = v8;
    if ((v6 & 8) != 0)
    {
      -[PXPhotosViewOptionsToolbarController model](self, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lensControlItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewOptionsToolbarController photosLensControl](self, "photosLensControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setItems:", v10);

      -[PXPhotosViewOptionsToolbarController model](self, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lensControlItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewOptionsToolbarController photosLensControl](self, "photosLensControl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEnabledItems:", v13);

      v8 = v18;
    }
    if ((v6 & 4) != 0)
    {
      -[PXPhotosViewOptionsToolbarController model](self, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectedLensControlItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosViewOptionsToolbarController photosLensControl](self, "photosLensControl");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSelectedItem:", v16);

      v8 = v18;
    }
  }

}

- (PXPhotosViewOptionsModel)model
{
  return self->_model;
}

- (BOOL)shouldHideAccessoryViewsOnScroll
{
  return self->_shouldHideAccessoryViewsOnScroll;
}

- (void)setShouldHideAccessoryViewsOnScroll:(BOOL)a3
{
  self->_shouldHideAccessoryViewsOnScroll = a3;
}

- (PXPhotosLensControl)photosLensControl
{
  return self->_photosLensControl;
}

- (void)setPhotosLensControl:(id)a3
{
  objc_storeStrong((id *)&self->_photosLensControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLensControl, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_userScrollVelocityFilter, 0);
}

void __70__PXPhotosViewOptionsToolbarController_scrollViewControllerDidScroll___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  CGRect v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "visibleRect");
  objc_msgSend(v3, "setInput:", CGRectGetMidY(v4));

}

uint64_t __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedLensControlItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __72__PXPhotosViewOptionsToolbarController_photosLensControl_didSelectItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notImplementedWithTrackingRadar:", 116589942);
}

uint64_t __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 48));
}

uint64_t __61__PXPhotosViewOptionsToolbarController__updateAccessoryViews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", *(_BYTE *)(a1 + 48) == 0);
  return objc_msgSend(*(id *)(a1 + 40), "setUserInteractionEnabled:", *(_BYTE *)(a1 + 48) == 0);
}

@end
