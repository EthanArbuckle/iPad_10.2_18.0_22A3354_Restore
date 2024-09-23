@implementation PXForYouSuggestionGadgetContentView

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_assetView)
    +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_unregisterChangeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PXForYouSuggestionGadgetContentView;
  -[PXForYouSuggestionGadgetContentView dealloc](&v5, sel_dealloc);
}

- (PXForYouSuggestionGadgetContentView)initWithFrame:(CGRect)a3
{
  PXForYouSuggestionGadgetContentView *v3;
  PXForYouSuggestionGadgetContentView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *v10;
  void *v11;
  UILabel *titleLabel;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  UILabel *subtitleLabel;
  UILabel *v18;
  PXRoundedCornerOverlayView *v19;
  PXForYouSuggestionGadgetContentView *v20;
  PXRoundedCornerOverlayView *roundedOverlayView;
  PXRoundedCornerOverlayView *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  PXForYouSuggestionGadgetContentView *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PXForYouSuggestionGadgetContentView;
  v3 = -[PXForYouSuggestionGadgetContentView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_mode = 0;
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    -[UILabel setLineBreakMode:](v10, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](v10, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[PXForYouSuggestionGadgetContentView addSubview:](v4, "addSubview:", v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;
    v13 = v10;

    -[PXForYouSuggestionGadgetContentView _updateTitleFont](v4, "_updateTitleFont");
    v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    -[UILabel setAdjustsFontForContentSizeCategory:](v14, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v15);

    -[UILabel setLineBreakMode:](v14, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v14, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](v14, "setTextAlignment:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTintColor:](v14, "setTintColor:", v16);

    -[UILabel _setTextColorFollowsTintColor:](v14, "_setTextColorFollowsTintColor:", 1);
    -[PXForYouSuggestionGadgetContentView addSubview:](v4, "addSubview:", v14);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;
    v18 = v14;

    v19 = objc_alloc_init(PXRoundedCornerOverlayView);
    -[PXRoundedCornerOverlayView setUserInteractionEnabled:](v19, "setUserInteractionEnabled:", 0);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__PXForYouSuggestionGadgetContentView_initWithFrame___block_invoke;
    v26[3] = &unk_1E51406D0;
    v20 = v4;
    v27 = v20;
    -[PXRoundedCornerOverlayView performChanges:](v19, "performChanges:", v26);
    -[PXForYouSuggestionGadgetContentView addSubview:](v20, "addSubview:", v19);
    roundedOverlayView = v20->_roundedOverlayView;
    v20->_roundedOverlayView = v19;
    v22 = v19;

    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addDeferredKeyObserver:", v20);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v20, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  $F40CD077B40800501ED060B808F886F7 *v10;
  _BOOL4 willPerformUpdate;
  _BOOL4 v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXForYouSuggestionGadgetContentView;
  -[PXForYouSuggestionGadgetContentView traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[PXForYouSuggestionGadgetContentView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  if (v7 != v8)
  {
    p_updateFlags = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate |= 2uLL;
LABEL_8:
        -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      if (!willPerformUpdate)
        -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView traitCollectionDidChange:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 169, CFSTR("invalidating %lu after it already has been updated"), 2);
      goto LABEL_23;
    }
    goto LABEL_7;
  }
LABEL_9:
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {
    v10 = &self->_updateFlags;
    if (self->_updateFlags.needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_15;
      goto LABEL_14;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_14:
      if ((self->_updateFlags.updated & 0x20) == 0)
      {
LABEL_15:
        v10->needsUpdate |= 0x20uLL;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView traitCollectionDidChange:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 173, CFSTR("invalidating %lu after it already has been updated"), 32);
LABEL_23:

      abort();
    }
    v12 = self->_updateFlags.willPerformUpdate;
    v10->needsUpdate = 32;
    if (!v12)
      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_16:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXForYouSuggestionGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXForYouSuggestionGadgetContentView;
  -[PXForYouSuggestionGadgetContentView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXForYouSuggestionGadgetContentView _updateIfNeeded](self, "_updateIfNeeded");
  -[PXForYouSuggestionGadgetContentView bounds](self, "bounds");
  -[PXForYouSuggestionGadgetContentView _calculateLayoutWithInputSize:apply:](self, "_calculateLayoutWithInputSize:apply:", 1, v3, v4);
}

- (BOOL)isDisplayingFullQualityContent
{
  void *v2;
  char v3;

  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisplayingFullQualityContent");

  return v3;
}

- (NSError)error
{
  void *v2;
  void *v3;

  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v3;
}

- (PXFocusInfo)focusInfo
{
  return -[PXRoundedCornerOverlayView focusInfo](self->_roundedOverlayView, "focusInfo");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v15)
  {
    NSStringFromSelector(sel_allowVideoPlayback);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (v9)
    {
      self->_forceAssetContentReload = 1;
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_8:
          p_updateFlags->needsUpdate = needsUpdate | 4;
          goto LABEL_9;
        }
LABEL_7:
        if ((self->_updateFlags.updated & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView settings:changedValueForKey:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 258, CFSTR("invalidating %lu after it already has been updated"), 4);

          abort();
        }
        goto LABEL_8;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_7;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 4;
      if (!willPerformUpdate)
        -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }
LABEL_9:

}

- (void)_updateIfNeeded
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
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
  void *v24;
  void *v25;
  id v26;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXForYouSuggestionGadgetContentView.m"), 290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXForYouSuggestionGadgetContentView _updateBadgeContents](self, "_updateBadgeContents");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXForYouSuggestionGadgetContentView.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXForYouSuggestionGadgetContentView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXForYouSuggestionGadgetContentView _updateAssetView](self, "_updateAssetView");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXForYouSuggestionGadgetContentView.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXForYouSuggestionGadgetContentView _updateTitleFont](self, "_updateTitleFont");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXForYouSuggestionGadgetContentView.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXForYouSuggestionGadgetContentView _updateBadgeViews](self, "_updateBadgeViews");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXForYouSuggestionGadgetContentView.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXForYouSuggestionGadgetContentView _updateAssetViewPlaceholderFilters](self, "_updateAssetViewPlaceholderFilters");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXForYouSuggestionGadgetContentView.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXForYouSuggestionGadgetContentView _updateAttributionView](self, "_updateAttributionView");
      v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _updateIfNeeded]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXForYouSuggestionGadgetContentView.m"), 312, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
}

- (CGRect)_assetFrameInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat MinX;
  double MinY;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = round(a3.size.width);
  MinX = CGRectGetMinX(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MinY = CGRectGetMinY(v13);
  v10 = MinX;
  v11 = width;
  v12 = v7;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = MinY;
  result.origin.x = v10;
  return result;
}

- (CGSize)_calculateLayoutWithInputSize:(CGSize)a3 apply:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat MinY;
  double v32;
  double v33;
  double MaxY;
  double MinX;
  double MaxX;
  double v37;
  double v38;
  void *v39;
  _BOOL4 ShouldShowAttributionViewForAsset;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  CGFloat rect;
  double rect_16;
  CGSize result;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXForYouSuggestionGadgetContentView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  -[PXForYouSuggestionGadgetContentView subtitleLabel](self, "subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentView badgeView](self, "badgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadgetContentView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  rect_16 = height;
  -[PXForYouSuggestionGadgetContentView _assetFrameInBounds:](self, "_assetFrameInBounds:", v8, v9, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[PXForYouSuggestionGadgetContentView roundedOverlayView](self, "roundedOverlayView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

  v24 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXForYouSuggestionGadgetContentView semanticContentAttribute](self, "semanticContentAttribute"));
  if (v4 && v12)
  {
    -[PXUIAssetBadgeView sizeThatFits:](self->_badgeView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v74 = width;
    v25 = v8;
    v27 = v26;
    v28 = v9;
    v30 = v29;
    v80.origin.x = v15;
    v80.origin.y = v17;
    v80.size.width = v19;
    v80.size.height = v21;
    MinY = CGRectGetMinY(v80);
    v32 = v27;
    v8 = v25;
    width = v74;
    v33 = v30;
    v9 = v28;
    objc_msgSend(v12, "setFrame:", 8.0, MinY + 8.0, v32, v33);
  }
  v81.origin.x = v15;
  v81.origin.y = v17;
  v81.size.width = v19;
  v81.size.height = v21;
  MaxY = CGRectGetMaxY(v81);
  v82.origin.x = v8;
  v82.origin.y = v9;
  v82.size.width = width;
  v82.size.height = rect_16;
  MinX = CGRectGetMinX(v82);
  v83.origin.x = v8;
  v75 = v9;
  v83.origin.y = v9;
  v83.size.width = width;
  v83.size.height = rect_16;
  MaxX = CGRectGetMaxX(v83);
  PXScaledValueForTextStyleWithSymbolicTraits();
  v38 = v37;
  rect = v8;
  if (-[PXForYouSuggestionGadgetContentView shouldShowSyndicationAttributionView](self, "shouldShowSyndicationAttributionView")&& (-[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset"), v39 = (void *)objc_claimAutoreleasedReturnValue(), ShouldShowAttributionViewForAsset = PXContentSyndicationShouldShowAttributionViewForAsset(v39), v39, ShouldShowAttributionViewForAsset))
  {
    -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sizeThatFits:", width, 1.79769313e308);
    v43 = fmax(v42, 25.0);
    v44 = MaxY + 7.0;
    if (v4)
    {
      objc_msgSend(v41, "prepareLayoutWithMaxWidth:", width);
      PXRectRoundToPixel();
      objc_msgSend(v41, "setFrame:");
    }
    v84.origin.x = MinX;
    v84.origin.y = v44;
    v84.size.width = width;
    v84.size.height = v43;
    v45 = CGRectGetMaxY(v84);
  }
  else
  {
    objc_msgSend(v13, "sizeThatFits:", width, rect_16, *(_QWORD *)&v75);
    v47 = v46;
    v49 = v48;
    v50 = MaxX - v46;
    if (v24)
      v51 = v50;
    else
      v51 = MinX;
    objc_msgSend(v13, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "ascender");
    v54 = MaxY + v38 - v53;

    if (v4)
    {
      PXRectRoundToPixel();
      objc_msgSend(v13, "setFrame:");
    }
    v85.origin.x = v51;
    v85.origin.y = v54;
    v85.size.width = v47;
    v85.size.height = v49;
    v55 = CGRectGetMaxY(v85);
    objc_msgSend(v13, "font");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "descender");
    v45 = v55 + v56;
  }

  objc_msgSend(v11, "sizeThatFits:", width, rect_16);
  v58 = v57;
  v60 = v59;
  -[PXForYouSuggestionGadgetContentView title](self, "title");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    v38 = v62;
  }

  if (v24)
    MinX = MaxX - v58;
  objc_msgSend(v11, "font", *(_QWORD *)&v75);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "ascender");
  v65 = v45 + v38 - v64;

  if (v4)
  {
    PXRectRoundToPixel();
    objc_msgSend(v11, "setFrame:");
  }
  -[PXForYouSuggestionGadgetContentView focusInfoChangeHandler](self, "focusInfoChangeHandler");
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v66;
  if (v66 && v4)
    (*(void (**)(uint64_t))(v66 + 16))(v66);
  v86.origin.x = rect;
  v86.origin.y = v76;
  v86.size.width = width;
  v86.size.height = rect_16;
  CGRectGetWidth(v86);
  v87.origin.x = MinX;
  v87.origin.y = v65;
  v87.size.width = v58;
  v87.size.height = v60;
  CGRectGetMaxY(v87);
  PXSizeRoundToPixel();
  v69 = v68;
  v71 = v70;

  v72 = v69;
  v73 = v71;
  result.height = v73;
  result.width = v72;
  return result;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[PXForYouSuggestionGadgetContentView _updateAssetView](self, "_updateAssetView");
  }
}

- (void)setMediaProvider:(id)a3
{
  void *v5;
  PXUIMediaProvider *v6;

  v6 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v6)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMediaProvider:", v6);

  }
}

- (CGRect)assetContentBoundsInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[PXForYouSuggestionGadgetContentView bounds](self, "bounds");
  -[PXForYouSuggestionGadgetContentView _assetFrameInBounds:](self, "_assetFrameInBounds:");
  -[PXForYouSuggestionGadgetContentView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)assetContentsRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentContentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIImage)currentAssetImage
{
  void *v2;
  void *v3;

  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setKeyAsset:(id)a3
{
  PXDisplayAsset *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v8;
  _BOOL4 willPerformUpdate;
  void *v10;
  void *v11;
  PXDisplayAsset *v12;

  v5 = (PXDisplayAsset *)a3;
  if (self->_keyAsset == v5)
    goto LABEL_12;
  v12 = v5;
  objc_storeStrong((id *)&self->_keyAsset, a3);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 4;
      if (!willPerformUpdate)
        -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_6:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setKeyAsset:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXForYouSuggestionGadgetContentView.m"), 477, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
  }
  p_updateFlags->needsUpdate = needsUpdate | 4;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v8, "px_registerChangeObserver:", self);
  else
    objc_msgSend(v8, "px_unregisterChangeObserver:", self);

  v5 = v12;
LABEL_12:

}

- (void)setBlursDegradedContent:(BOOL)a3
{
  if (self->_blursDegradedContent != a3)
  {
    self->_blursDegradedContent = a3;
    -[PXForYouSuggestionGadgetContentView _updateAssetViewPlaceholderFilters](self, "_updateAssetViewPlaceholderFilters");
  }
}

- (void)setShouldShowSyndicationAttributionView:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_shouldShowSyndicationAttributionView != a3)
  {
    self->_shouldShowSyndicationAttributionView = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x40;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x40) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setShouldShowSyndicationAttributionView:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXForYouSuggestionGadgetContentView.m"), 499, CFSTR("invalidating %lu after it already has been updated"), 64);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 64;
    if (!willPerformUpdate)
      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlight:(id)a3
{
  SLHighlight *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  SLHighlight *v11;

  v5 = (SLHighlight *)a3;
  if (self->_highlight != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_highlight, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x40;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 64;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setHighlight:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXForYouSuggestionGadgetContentView.m"), 507, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setSuggestion:(id)a3
{
  PXDisplaySuggestion *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 willPerformUpdate;
  _BOOL4 v12;
  void *v13;
  void *v14;
  PXDisplaySuggestion *v15;

  v5 = (PXDisplaySuggestion *)a3;
  if (self->_suggestion != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_suggestion, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        v9 = needsUpdate | 8;
        p_updateFlags->needsUpdate = v9;
        goto LABEL_9;
      }
    }
    else
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
        willPerformUpdate = self->_updateFlags.willPerformUpdate;
        p_updateFlags->needsUpdate = 8;
        if (willPerformUpdate)
        {
          v10 = 9;
          goto LABEL_12;
        }
        -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
        v9 = p_updateFlags->needsUpdate;
        isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
        if (!p_updateFlags->needsUpdate)
        {
          if (!self->_updateFlags.isPerformingUpdate)
          {
            v12 = self->_updateFlags.willPerformUpdate;
            p_updateFlags->needsUpdate = 1;
            v5 = v15;
            if (v12)
              goto LABEL_14;
            -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
            goto LABEL_13;
          }
          v9 = 0;
LABEL_10:
          if ((self->_updateFlags.updated & 1) == 0)
            goto LABEL_11;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setSuggestion:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 517, CFSTR("invalidating %lu after it already has been updated"), 1);
LABEL_24:

          abort();
        }
LABEL_9:
        if (!isPerformingUpdate)
        {
LABEL_11:
          v10 = v9 | 1;
LABEL_12:
          p_updateFlags->needsUpdate = v10;
LABEL_13:
          v5 = v15;
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      isPerformingUpdate = 1;
    }
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setSuggestion:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXForYouSuggestionGadgetContentView.m"), 516, CFSTR("invalidating %lu after it already has been updated"), 8);
      goto LABEL_24;
    }
    goto LABEL_8;
  }
LABEL_14:

}

- (void)setAssetContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;

  if (self->_assetContentHidden != a3)
  {
    v3 = a3;
    self->_assetContentHidden = a3;
    -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x10;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x10) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setAssetContentHidden:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXForYouSuggestionGadgetContentView.m"), 526, CFSTR("invalidating %lu after it already has been updated"), 16);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 16;
    if (!willPerformUpdate)
      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  void *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v6;

      -[PXForYouSuggestionGadgetContentView titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v9);

      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitle;
  void *v8;
  NSString *v9;

  v9 = (NSString *)a3;
  v4 = self->_subtitle;
  if (v4 == v9)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v9, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v9, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      -[PXForYouSuggestionGadgetContentView subtitleLabel](self, "subtitleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v9);

      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setBadgeTypes:(unint64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_badgeTypes != a3)
  {
    self->_badgeTypes = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x10;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x10) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView setBadgeTypes:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXForYouSuggestionGadgetContentView.m"), 552, CFSTR("invalidating %lu after it already has been updated"), 16);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 16;
    if (!willPerformUpdate)
      -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAssetView:(id)a3
{
  PXDisplayAssetContentView *v5;
  PXDisplayAssetContentView **p_assetView;
  PXDisplayAssetContentView *assetView;
  void *v8;
  void *v9;
  PXDisplayAssetContentView *v10;

  v5 = (PXDisplayAssetContentView *)a3;
  p_assetView = &self->_assetView;
  assetView = self->_assetView;
  if (assetView != v5)
  {
    v10 = v5;
    if (assetView)
    {
      -[PXDisplayAssetContentView removeFromSuperview](assetView, "removeFromSuperview");
      +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", *p_assetView);
    }
    objc_storeStrong((id *)&self->_assetView, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView setBackgroundColor:](*p_assetView, "setBackgroundColor:", v8);

    -[PXDisplayAssetContentView setCanDisplayLoadingIndicator:](*p_assetView, "setCanDisplayLoadingIndicator:", 1);
    -[PXDisplayAssetContentView setHidden:](*p_assetView, "setHidden:", -[PXForYouSuggestionGadgetContentView assetContentHidden](self, "assetContentHidden"));
    -[PXForYouSuggestionGadgetContentView mediaProvider](self, "mediaProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDisplayAssetContentView setMediaProvider:](*p_assetView, "setMediaProvider:", v9);

    -[PXDisplayAssetContentView setPlaceholderTransitionDuration:](*p_assetView, "setPlaceholderTransitionDuration:", 0.2);
    -[PXDisplayAssetContentView setContentMode:](*p_assetView, "setContentMode:", 2);
    -[PXForYouSuggestionGadgetContentView _updateAssetViewPlaceholderFilters](self, "_updateAssetViewPlaceholderFilters");
    -[PXForYouSuggestionGadgetContentView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_assetView, 0);
    v5 = v10;
  }

}

- (void)_updateRoundedCornerOverlayView
{
  void *v3;
  _QWORD v4[5];

  -[PXForYouSuggestionGadgetContentView roundedOverlayView](self, "roundedOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PXForYouSuggestionGadgetContentView__updateRoundedCornerOverlayView__block_invoke;
  v4[3] = &unk_1E51406D0;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateBadgeViews
{
  void *v3;
  PXUIAssetBadgeView *v4;
  PXUIAssetBadgeView *v5;
  PXUIAssetBadgeView *v6;
  id v7;
  _QWORD v8[4];
  PXUIAssetBadgeView *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (-[PXForYouSuggestionGadgetContentView badgeTypes](self, "badgeTypes")
    && (-[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[PXForYouSuggestionGadgetContentView badgeView](self, "badgeView");
    v4 = (PXUIAssetBadgeView *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = [PXUIAssetBadgeView alloc];
      v4 = -[PXUIAssetBadgeView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[PXForYouSuggestionGadgetContentView addSubview:](self, "addSubview:", v4);
      -[PXForYouSuggestionGadgetContentView setBadgeView:](self, "setBadgeView:", v4);
    }
    -[PXUIAssetBadgeView setStyle:](v4, "setStyle:", 6);
    -[PXUIAssetBadgeView setOverContent:](v4, "setOverContent:", 1);
    v12 = 0u;
    v13 = 0u;
    PXAssetBadgeInfoCreateWithBadges();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__PXForYouSuggestionGadgetContentView__updateBadgeViews__block_invoke;
    v8[3] = &unk_1E51490B0;
    v9 = v4;
    v10 = 0u;
    v11 = 0u;
    v6 = v4;
    -[PXUIAssetBadgeView performChanges:animated:](v6, "performChanges:animated:", v8, 0);
    -[PXUIAssetBadgeView setHidden:](v6, "setHidden:", -[PXForYouSuggestionGadgetContentView assetContentHidden](self, "assetContentHidden"));

  }
  else
  {
    -[PXForYouSuggestionGadgetContentView badgeView](self, "badgeView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

  }
}

- (void)_updateAssetView
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXForYouSuggestionGadgetContentView mode](self, "mode");
  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 != 2 && v14)
  {
    v6 = objc_msgSend(v14, "playbackStyle");
    if (v6 == 3)
    {
      v7 = 1;
    }
    else
    {
      v7 = v6;
      if (v6 == 4)
      {
        +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "allowVideoPlayback") == 0;
        v10 = 4;
      }
      else
      {
        if (v6 != 5)
          goto LABEL_15;
        +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "allowLoopPlayback") == 0;
        v10 = 5;
      }
      if (v9)
        v7 = 1;
      else
        v7 = v10;

    }
LABEL_15:
    if (!self->_forceAssetContentReload)
    {
      objc_msgSend(v5, "asset");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v14)
      {
        v12 = objc_msgSend(v5, "playbackStyle");

        if (v12 == v7)
        {
LABEL_20:
          -[PXForYouSuggestionGadgetContentView _updateAssetViewAnimatedContentEnabled](self, "_updateAssetViewAnimatedContentEnabled");

          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", v14, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setCanDisplayLoadingIndicator:", 1);
    -[PXForYouSuggestionGadgetContentView setAssetView:](self, "setAssetView:", v13);
    v5 = v13;
    goto LABEL_20;
  }

  if (v5)
    -[PXForYouSuggestionGadgetContentView setAssetView:](self, "setAssetView:", 0);
LABEL_21:

}

- (void)_updateAssetViewAnimatedContentEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = -[PXForYouSuggestionGadgetContentView mode](self, "mode") == 0;
  -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimatedContentEnabled:", v3);

}

- (id)syndicationReplyActionFromAttributionView
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0DA88C0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)_updateAssetViewPlaceholderFilters
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (-[PXForYouSuggestionGadgetContentView blursDegradedContent](self, "blursDegradedContent")
    || (+[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "alwaysShowSuggestionRenderingOverlay"),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    v7 = (void *)objc_opt_class();
    if (v6 == 2)
      objc_msgSend(v7, "darkPlaceholderFilters");
    else
      objc_msgSend(v7, "lightPlaceholderFilters");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceholderImageFilters:", v9);

  }
  else
  {
    -[PXForYouSuggestionGadgetContentView assetView](self, "assetView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaceholderImageFilters:", 0);
  }

}

- (void)_updateTitleFont
{
  void *v2;
  id v3;

  -[PXForYouSuggestionGadgetContentView titleLabel](self, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v2);

  objc_msgSend(v3, "setNumberOfLines:", 2);
}

- (void)_updateTitleLabelVisibility
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[PXForYouSuggestionGadgetContentView shouldShowSyndicationAttributionView](self, "shouldShowSyndicationAttributionView");
  -[PXForYouSuggestionGadgetContentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "removeFromSuperview");
  else
    -[PXForYouSuggestionGadgetContentView addSubview:](self, "addSubview:", v4);

}

- (void)_updateAttributionView
{
  void *v3;
  _BOOL4 ShouldShowAttributionViewForAsset;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PXForYouSuggestionGadgetContentView shouldShowSyndicationAttributionView](self, "shouldShowSyndicationAttributionView")&& (-[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset"), v3 = (void *)objc_claimAutoreleasedReturnValue(), ShouldShowAttributionViewForAsset = PXContentSyndicationShouldShowAttributionViewForAsset(v3), v3, ShouldShowAttributionViewForAsset))
  {
    -[PXForYouSuggestionGadgetContentView _updateTitleLabelVisibility](self, "_updateTitleLabelVisibility");
    -[PXForYouSuggestionGadgetContentView highlight](self, "highlight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v11 = v5;
      -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        -[PXForYouSuggestionGadgetContentView setAttributionView:](self, "setAttributionView:", 0);
      }
      PXContentSyndicationAttributionViewForSocialLayerHighlight(v11, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateAlignment:", 0);
      -[PXForYouSuggestionGadgetContentView addSubview:](self, "addSubview:", v8);
      -[PXForYouSuggestionGadgetContentView setAttributionView:](self, "setAttributionView:", v8);

      v5 = v11;
    }

  }
  else
  {
    -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PXForYouSuggestionGadgetContentView attributionView](self, "attributionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[PXForYouSuggestionGadgetContentView setAttributionView:](self, "setAttributionView:", 0);
    }
    -[PXForYouSuggestionGadgetContentView _updateTitleLabelVisibility](self, "_updateTitleLabelVisibility");
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXForYouSuggestionGadgetContentView _contentSizeCategoryDidChange:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXForYouSuggestionGadgetContentView.m"), 694, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
  {
    v10 = v4;
    -[PXForYouSuggestionGadgetContentView setNeedsLayout](self, "setNeedsLayout");
    v4 = v10;
  }
LABEL_7:

}

- (void)_updateBadgeContents
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PXForYouSuggestionGadgetContentView suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "subtype");
    if ((v6 - 301) >= 5)
    {
      v7 = v6;
      if ((v6 - 501) >= 2 && (_DWORD)v6 != 401)
      {
        PLUIGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v10;
          _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unexpected suggestion type %@ received by %@", (uint8_t *)&v11, 0x16u);

        }
      }
    }
  }
  -[PXForYouSuggestionGadgetContentView setBadgeTypes:](self, "setBadgeTypes:", 0);

}

- (void)_handleChangedAsset:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PXForYouSuggestionGadgetContentView setKeyAsset:](self, "setKeyAsset:", v5);

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXForYouSuggestionGadgetContentView keyAsset](self, "keyAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "changeDetailsForObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "assetContentChanged"))
    {
      objc_msgSend(v5, "objectAfterChanges");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXForYouSuggestionGadgetContentView _handleChangedAsset:](self, "_handleChangedAsset:", v6);

    }
  }

}

- (id)focusInfoChangeHandler
{
  return self->_focusInfoChangeHandler;
}

- (void)setFocusInfoChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (PXDisplaySuggestion)suggestion
{
  return self->_suggestion;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (BOOL)assetContentHidden
{
  return self->_assetContentHidden;
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)blursDegradedContent
{
  return self->_blursDegradedContent;
}

- (BOOL)shouldShowSyndicationAttributionView
{
  return self->_shouldShowSyndicationAttributionView;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (PXDisplayAssetContentView)assetView
{
  return self->_assetView;
}

- (PXUIAssetBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (PXRoundedCornerOverlayView)roundedOverlayView
{
  return self->_roundedOverlayView;
}

- (void)setRoundedOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedOverlayView, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (unint64_t)badgeTypes
{
  return self->_badgeTypes;
}

- (SLAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_roundedOverlayView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong(&self->_focusInfoChangeHandler, 0);
}

uint64_t __56__PXForYouSuggestionGadgetContentView__updateBadgeViews__block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[2];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  return objc_msgSend(*(id *)(a1 + 32), "setBadgeInfo:", v3);
}

void __70__PXForYouSuggestionGadgetContentView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  objc_msgSend(v3, "setDisplayScale:");

}

void __53__PXForYouSuggestionGadgetContentView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setCornerRadius:", 4.0);
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  objc_msgSend(v3, "setDisplayScale:");

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOverlayColor:", v5);

}

+ (CGSize)sizeThatFits:(CGSize)a3 withSuggestion:(id)a4 title:(id)a5 subtitle:(id)a6
{
  double height;
  double width;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10 = sizeThatFits_withSuggestion_title_subtitle__onceToken;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  if (v10 != -1)
    dispatch_once(&sizeThatFits_withSuggestion_title_subtitle__onceToken, &__block_literal_global_126368);
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setSuggestion:", v13);

  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setTitle:", v12);
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setSubtitle:", v11);

  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "_updateIfNeeded");
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "sizeThatFits:", width, height);
  v15 = v14;
  v17 = v16;
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setSuggestion:", 0);
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setTitle:", 0);
  objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setSubtitle:", 0);
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (void)preloadResources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadResources_onceToken_126366 != -1)
    dispatch_once(&preloadResources_onceToken_126366, block);
}

+ (double)scaledSuggestionBaselineDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)scaledTitleBaselineDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)scaledTitleWithSuggestionBaselineDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (double)scaledSubtitleBaselineDistance
{
  double result;

  PXScaledValueForTextStyleWithSymbolicTraits();
  return result;
}

+ (id)suggestionLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AA0], 2, 0);
}

+ (id)titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4AD0], 0x8000, 0);
}

+ (id)_gaussianBlurFilter
{
  if (_gaussianBlurFilter_onceToken != -1)
    dispatch_once(&_gaussianBlurFilter_onceToken, &__block_literal_global_164_126359);
  return (id)_gaussianBlurFilter_blurFilter;
}

+ (NSArray)lightPlaceholderFilters
{
  if (lightPlaceholderFilters_onceToken != -1)
    dispatch_once(&lightPlaceholderFilters_onceToken, &__block_literal_global_171_126358);
  return (NSArray *)(id)lightPlaceholderFilters_filters;
}

+ (NSArray)darkPlaceholderFilters
{
  if (darkPlaceholderFilters_onceToken != -1)
    dispatch_once(&darkPlaceholderFilters_onceToken, &__block_literal_global_176_126351);
  return (NSArray *)(id)darkPlaceholderFilters_filters;
}

void __61__PXForYouSuggestionGadgetContentView_darkPlaceholderFilters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[10];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  CAColorMatrixMakeColorSourceOver();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v5, 0, sizeof(v5));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValue:forKey:", v1, CFSTR("inputColorMatrix"));

  +[PXForYouSuggestionGadgetContentView _gaussianBlurFilter](PXForYouSuggestionGadgetContentView, "_gaussianBlurFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)darkPlaceholderFilters_filters;
  darkPlaceholderFilters_filters = v3;

}

void __62__PXForYouSuggestionGadgetContentView_lightPlaceholderFilters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _OWORD v5[10];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  CAColorMatrixMakeColorSourceOver();
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v5, 0, sizeof(v5));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setValue:forKey:", v1, CFSTR("inputColorMatrix"));

  +[PXForYouSuggestionGadgetContentView _gaussianBlurFilter](PXForYouSuggestionGadgetContentView, "_gaussianBlurFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)lightPlaceholderFilters_filters;
  lightPlaceholderFilters_filters = v3;

}

uint64_t __58__PXForYouSuggestionGadgetContentView__gaussianBlurFilter__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gaussianBlurFilter_blurFilter;
  _gaussianBlurFilter_blurFilter = v0;

  objc_msgSend((id)_gaussianBlurFilter_blurFilter, "setValue:forKey:", &unk_1E53ED7B8, CFSTR("inputRadius"));
  return objc_msgSend((id)_gaussianBlurFilter_blurFilter, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputHardEdges"));
}

void __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_2;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_3;
  v8[3] = &__block_descriptor_40_e5_v8__0l;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_4;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v7);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_5;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_6;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_7;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "scheduleMainQueueTask:", v4);
  +[PXUIAssetBadgeView preloadResourcesForStyle:](PXUIAssetBadgeView, "preloadResourcesForStyle:", 6);

}

uint64_t __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaledTitleBaselineDistance");
}

uint64_t __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaledTitleWithSuggestionBaselineDistance");
}

uint64_t __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaledSubtitleBaselineDistance");
}

uint64_t __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scaledSuggestionBaselineDistance");
}

void __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "suggestionLabelFont");

}

void __55__PXForYouSuggestionGadgetContentView_preloadResources__block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "titleLabelFont");

}

uint64_t __82__PXForYouSuggestionGadgetContentView_sizeThatFits_withSuggestion_title_subtitle___block_invoke()
{
  PXForYouSuggestionGadgetContentView *v0;
  void *v1;

  v0 = objc_alloc_init(PXForYouSuggestionGadgetContentView);
  v1 = (void *)sizeThatFits_withSuggestion_title_subtitle__measuringView;
  sizeThatFits_withSuggestion_title_subtitle__measuringView = (uint64_t)v0;

  return objc_msgSend((id)sizeThatFits_withSuggestion_title_subtitle__measuringView, "setMode:", 2);
}

@end
