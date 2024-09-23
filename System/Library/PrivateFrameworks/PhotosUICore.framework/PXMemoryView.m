@implementation PXMemoryView

- (PXMemoryView)init
{
  PXMemoryView *v2;
  PXMemoryView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXMemoryView;
  v2 = -[PXMemoryView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[PXMemoryView overlayView](v2, "overlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoryView highlightView](v3, "highlightView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoryView titleSubtitleLabel](v3, "titleSubtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoryView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    -[PXMemoryView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 4.0);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__didTap_);
    -[PXMemoryView addGestureRecognizer:](v3, "addGestureRecognizer:", v8);

  }
  return v3;
}

- (PXTitleSubtitleUILabel)titleSubtitleLabel
{
  PXTitleSubtitleUILabel *titleSubtitleLabel;
  PXTitleSubtitleUILabel *v4;
  PXTitleSubtitleUILabel *v5;

  titleSubtitleLabel = self->_titleSubtitleLabel;
  if (!titleSubtitleLabel)
  {
    v4 = objc_alloc_init(PXTitleSubtitleUILabel);
    v5 = self->_titleSubtitleLabel;
    self->_titleSubtitleLabel = v4;

    -[PXTitleSubtitleUILabel setRendersTextAsynchronously:](self->_titleSubtitleLabel, "setRendersTextAsynchronously:", 0);
    -[PXMemoryView addSubview:](self, "addSubview:", self->_titleSubtitleLabel);
    titleSubtitleLabel = self->_titleSubtitleLabel;
  }
  return titleSubtitleLabel;
}

- (UIView)overlayView
{
  UIView *overlayView;
  UIView *v4;
  UIView *v5;
  void *v6;

  overlayView = self->_overlayView;
  if (!overlayView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_overlayView;
    self->_overlayView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", v6);

    -[UIView setAlpha:](self->_overlayView, "setAlpha:", 0.2);
    -[PXMemoryView addSubview:](self, "addSubview:", self->_overlayView);
    overlayView = self->_overlayView;
  }
  return overlayView;
}

- (UIView)highlightView
{
  UIView *highlightView;
  UIView *v4;
  UIView *v5;
  void *v6;

  highlightView = self->_highlightView;
  if (!highlightView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_highlightView;
    self->_highlightView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v6);

    -[UIView setAlpha:](self->_highlightView, "setAlpha:", 0.3);
    -[UIView setHidden:](self->_highlightView, "setHidden:", 1);
    -[PXMemoryView addSubview:](self, "addSubview:", self->_highlightView);
    highlightView = self->_highlightView;
  }
  return highlightView;
}

- (void)setViewModel:(id)a3
{
  PXMemoryViewModel **p_viewModel;
  PXMemoryViewModel *v6;
  PXMemoryViewModel *v7;
  char v8;
  PXMemoryViewModel *v9;
  void *v10;
  void *v11;
  PXMemoryViewModel *v12;

  v12 = (PXMemoryViewModel *)a3;
  p_viewModel = &self->_viewModel;
  v6 = self->_viewModel;
  if (v6 == v12)
  {

LABEL_7:
    v9 = v12;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = -[PXMemoryViewModel isEqual:](v6, "isEqual:", v12);

  v9 = v12;
  if ((v8 & 1) == 0)
  {
    -[PXMemoryViewModel unregisterChangeObserver:context:](*p_viewModel, "unregisterChangeObserver:context:", self, PXMemoryViewModelObservationContext);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXMemoryViewModel registerChangeObserver:context:](*p_viewModel, "registerChangeObserver:context:", self, PXMemoryViewModelObservationContext);
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 0xB) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView setViewModel:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXMemoryView.m"), 108, CFSTR("invalidating %lu after it already has been updated"), 11);

      abort();
    }
    self->_updateFlags.needsUpdate |= 0xBuLL;
    -[PXMemoryView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setDisplayAssetView:(id)a3
{
  PXDisplayAssetContentView **p_displayAssetView;
  PXDisplayAssetContentView *v6;
  PXDisplayAssetContentView *v7;
  char v8;
  void *v9;
  PXPhotoKitUIMediaProvider *v10;
  void *v11;
  PXDisplayAssetContentView *v12;

  v12 = (PXDisplayAssetContentView *)a3;
  p_displayAssetView = &self->_displayAssetView;
  v6 = self->_displayAssetView;
  if (v6 == v12)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXDisplayAssetContentView isEqual:](v6, "isEqual:");

    if ((v8 & 1) == 0)
    {
      if (*p_displayAssetView)
      {
        -[PXDisplayAssetContentView removeFromSuperview](*p_displayAssetView, "removeFromSuperview");
        +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", *p_displayAssetView);
      }
      objc_storeStrong((id *)&self->_displayAssetView, a3);
      if (*p_displayAssetView)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXDisplayAssetContentView setBackgroundColor:](*p_displayAssetView, "setBackgroundColor:", v9);

        -[PXDisplayAssetContentView setContentMode:](*p_displayAssetView, "setContentMode:", 2);
        v10 = objc_alloc_init(PXPhotoKitUIMediaProvider);
        -[PXDisplayAssetContentView setMediaProvider:](*p_displayAssetView, "setMediaProvider:", v10);

        -[PXDisplayAssetContentView layer](*p_displayAssetView, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAllowsGroupBlending:", 1);

        -[PXMemoryView addSubview:](self, "addSubview:", *p_displayAssetView);
        -[PXMemoryView sendSubviewToBack:](self, "sendSubviewToBack:", *p_displayAssetView);
      }
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXMemoryView;
  -[PXMemoryView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 0xA) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView setFrame:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXMemoryView.m"), 138, CFSTR("invalidating %lu after it already has been updated"), 10);

    abort();
  }
  self->_updateFlags.needsUpdate |= 0xAuLL;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMemoryView;
  -[PXMemoryView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXMemoryView _updateIfNeeded](self, "_updateIfNeeded");
  -[PXMemoryView bounds](self, "bounds");
  -[PXMemoryView _performLayoutInRect:applyToSubviews:](self, "_performLayoutInRect:applyToSubviews:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[PXMemoryView _performLayoutInRect:applyToSubviews:](self, "_performLayoutInRect:applyToSubviews:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)_updateIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateIfNeeded]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXMemoryView.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 0;
    -[PXMemoryView _updateTitleSubtitleIfNeeded](self, "_updateTitleSubtitleIfNeeded");
    -[PXMemoryView _updateKeyAssetIfNeeded](self, "_updateKeyAssetIfNeeded");
    -[PXMemoryView _updateHighlightedIfNeeded](self, "_updateHighlightedIfNeeded");
    -[PXMemoryView _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    p_updateFlags->isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateIfNeeded]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXMemoryView.m"), 162, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (void)_updateTitleSubtitleIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateTitleSubtitleIfNeeded]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXMemoryView.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 1uLL;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXMemoryView viewModel](self, "viewModel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[PXMemoryView titleSubtitleLabel](self, "titleSubtitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E5149688;
    objc_msgSend(v5, "setTitleText:", v8);

    objc_msgSend(v14, "localizedDateText");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1E5149688;
    objc_msgSend(v5, "setSubtitleText:", v11);

  }
}

- (void)_updateKeyAssetIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateKeyAssetIfNeeded]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXMemoryView.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 2uLL;
  if ((needsUpdate & 2) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    -[PXMemoryView viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyAsset");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[PXDisplayAssetContentView checkOutViewForAsset:](PXDisplayAssetContentView, "checkOutViewForAsset:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCanDisplayLoadingIndicator:", 1);
    }
    else
    {
      v6 = 0;
    }
    -[PXMemoryView setDisplayAssetView:](self, "setDisplayAssetView:", v6);

  }
}

- (void)_updateHighlightedIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateHighlightedIfNeeded]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXMemoryView.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    -[PXMemoryView viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHighlighted");

    -[PXMemoryView highlightView](self, "highlightView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v6 ^ 1u);

  }
}

- (void)_updateSpecIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
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
  void *v16;
  id v17;

  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView _updateSpecIfNeeded]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXMemoryView.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    -[PXMemoryView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[PXMemoryView viewModel](self, "viewModel");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B5C68, "memoriesTitleSubtitleSpecForTileKind:viewMode:boundedByRect:", 1, v17, v6, v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoryView titleSubtitleLabel](self, "titleSubtitleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSpec:", v13);

  }
}

- (CGRect)_performLayoutInRect:(CGRect)a3 applyToSubviews:(BOOL)a4
{
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    -[PXMemoryView displayAssetView](self, "displayAssetView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFrame:", x, y, width, width);

    -[PXMemoryView overlayView](self, "overlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFrame:", x, y, width, width);

    -[PXMemoryView highlightView](self, "highlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", x, y, width, width);

    -[PXMemoryView titleSubtitleLabel](self, "titleSubtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", x, y, width, width);

  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = width;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_didTap:(id)a3
{
  id v4;

  -[PXMemoryView presentationDelegate](self, "presentationDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentDetailsForMemoryView:", self);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)PXMemoryViewModelObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoryView.m"), 252, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView observable:didChange:context:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXMemoryView.m"), 237, CFSTR("invalidating %lu after it already has been updated"), 1);
      goto LABEL_27;
    }
    self->_updateFlags.needsUpdate |= 1uLL;
  }
  if ((v6 & 4) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView observable:didChange:context:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXMemoryView.m"), 240, CFSTR("invalidating %lu after it already has been updated"), 2);
      goto LABEL_27;
    }
    self->_updateFlags.needsUpdate |= 2uLL;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if ((v6 & 8) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView observable:didChange:context:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXMemoryView.m"), 243, CFSTR("invalidating %lu after it already has been updated"), 4);
      goto LABEL_27;
    }
    needsUpdate |= 4uLL;
    p_updateFlags->needsUpdate = needsUpdate;
  }
  if ((v6 & 0x10) == 0)
  {
    if (!needsUpdate)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXMemoryView observable:didChange:context:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXMemoryView.m"), 246, CFSTR("invalidating %lu after it already has been updated"), 8);
LABEL_27:

    abort();
  }
  p_updateFlags->needsUpdate = needsUpdate | 8;
LABEL_20:
  v15 = v9;
  -[PXMemoryView setNeedsLayout](self, "setNeedsLayout");
  v9 = v15;
LABEL_21:

}

- (PXMemoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXMemoryViewPresentationDelegate)presentationDelegate
{
  return (PXMemoryViewPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (PXDisplayAssetContentView)displayAssetView
{
  return self->_displayAssetView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssetView, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLabel, 0);
}

@end
