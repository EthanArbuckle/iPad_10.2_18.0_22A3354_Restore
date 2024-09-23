@implementation PUPhotosGridCell

- (PUPhotosGridCell)initWithFrame:(CGRect)a3
{
  PUPhotosGridCell *v4;
  PUPhotosGridCell *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridCell;
  v4 = -[PUPhotosGridCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[PUPhotosGridCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PUPhotosGridCell.m"), 63, CFSTR("The content view must be a PUPhotoView: %@"), v6);

    }
    -[PUPhotosGridCell setPhotoContentView:](v5, "setPhotoContentView:", v6);
    -[PUPhotosGridCell layer](v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  }
  return v5;
}

- (void)addTemporaryPhotoContentView
{
  PUPhotoView *v3;
  void *v4;
  PUPhotoView *v5;
  PUPhotoView *temporaryPhotoContentView;
  void *v7;
  void *v8;

  if (!self->_temporaryPhotoContentView)
  {
    v3 = [PUPhotoView alloc];
    -[PUPhotosGridCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = -[PUPhotoView initWithFrame:](v3, "initWithFrame:");
    temporaryPhotoContentView = self->_temporaryPhotoContentView;
    self->_temporaryPhotoContentView = v5;

    -[PUPhotoView contentHelper](self->_temporaryPhotoContentView, "contentHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAvoidsImageViewIfPossible:", 1);

    -[PUPhotoView setAlpha:](self->_temporaryPhotoContentView, "setAlpha:", 0.0);
    -[PUPhotoView layer](self->_temporaryPhotoContentView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_temporaryPhotoContentView);
    -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
  }
}

- (void)removeTemporaryPhotoContentView
{
  PUPhotoView *temporaryPhotoContentView;

  -[PUPhotoView removeFromSuperview](self->_temporaryPhotoContentView, "removeFromSuperview");
  temporaryPhotoContentView = self->_temporaryPhotoContentView;
  self->_temporaryPhotoContentView = 0;

}

- (void)setTemporaryPhotoImage:(id)a3 with:(int64_t)a4
{
  PUPhotoView *temporaryPhotoContentView;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  temporaryPhotoContentView = self->_temporaryPhotoContentView;
  v7 = a3;
  -[PUPhotoView contentHelper](temporaryPhotoContentView, "contentHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPhotoImage:", v7);

  -[PUPhotoView contentHelper](self->_temporaryPhotoContentView, "contentHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridCell photoContentView](self, "photoContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoSize");
  objc_msgSend(v9, "setPhotoSize:");

  -[PUPhotoView contentHelper](self->_temporaryPhotoContentView, "contentHelper");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFillMode:", a4);

}

- (void)setTransitionFillerViewEnabled:(BOOL)a3
{
  id v4;
  UIView *v5;
  UIView *transitionFillerView;
  void *v7;
  UIView *v8;
  void *v9;

  if (self->_transitionFillerViewEnabled != a3)
  {
    self->_transitionFillerViewEnabled = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      transitionFillerView = self->_transitionFillerView;
      self->_transitionFillerView = v5;

      -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_transitionFillerView);
      -[PUPhotosGridCell setNeedsLayout](self, "setNeedsLayout");
      -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_transitionFillerView;
      objc_msgSend(v7, "photoCollectionViewBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[UIView setOpaque:](self->_transitionFillerView, "setOpaque:", 1);
    }
    else
    {
      -[UIView removeFromSuperview](self->_transitionFillerView, "removeFromSuperview");
      v7 = self->_transitionFillerView;
      self->_transitionFillerView = 0;
    }

    -[PUPhotosGridCell _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
  }
}

- (void)setFillerEdgeInsets:(UIEdgeInsets)a3
{
  _QWORD v6[5];

  if (self->_fillerEdgeInsets.left != a3.left
    || self->_fillerEdgeInsets.top != a3.top
    || self->_fillerEdgeInsets.right != a3.right
    || self->_fillerEdgeInsets.bottom != a3.bottom)
  {
    self->_fillerEdgeInsets = a3;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__PUPhotosGridCell_setFillerEdgeInsets___block_invoke;
    v6[3] = &unk_1E58ABD10;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  }
}

- (void)_updateHighlight
{
  UIView *highlightOverlayView;
  id v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;

  if (-[PUPhotosGridCell isHighlighted](self, "isHighlighted")
    && !-[PUPhotosGridCell isDraggable](self, "isDraggable"))
  {
    highlightOverlayView = self->_highlightOverlayView;
    if (!highlightOverlayView)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PUPhotosGridCell bounds](self, "bounds");
      v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
      v6 = self->_highlightOverlayView;
      self->_highlightOverlayView = v5;

      -[UIView setUserInteractionEnabled:](self->_highlightOverlayView, "setUserInteractionEnabled:", 0);
      v7 = self->_highlightOverlayView;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      -[UIView setAlpha:](self->_highlightOverlayView, "setAlpha:", 0.5);
      -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_highlightOverlayView);
      highlightOverlayView = self->_highlightOverlayView;
    }
    -[UIView setHidden:](highlightOverlayView, "setHidden:", 0);
    -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
  }
  else
  {
    -[UIView setHidden:](self->_highlightOverlayView, "setHidden:", 1);
  }
  -[PUPhotosGridCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSelectionBadge
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  int v6;
  UIView *selectionOverlayView;
  id v8;
  UIView *v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *selectionBadgeView;

  if (-[PUPhotosGridCell isSelectionBadgeVisible](self, "isSelectionBadgeVisible")
    && -[PUPhotosGridCell dragState](self, "dragState") != 1)
  {
    selectionOverlayView = self->_selectionOverlayView;
    v3 = selectionOverlayView == 0;
    if (!selectionOverlayView)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PUPhotosGridCell bounds](self, "bounds");
      v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
      v10 = self->_selectionOverlayView;
      self->_selectionOverlayView = v9;

      -[UIView setUserInteractionEnabled:](self->_selectionOverlayView, "setUserInteractionEnabled:", 0);
      v11 = self->_selectionOverlayView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      -[UIView setAlpha:](self->_selectionOverlayView, "setAlpha:", 0.25);
      -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_selectionOverlayView);
    }
    if (self->_selectionBadgeView)
    {
      v4 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("checkmark.circle"), v14);
      v15 = (UIView *)objc_claimAutoreleasedReturnValue();
      selectionBadgeView = self->_selectionBadgeView;
      self->_selectionBadgeView = v15;

      -[UIView setUserInteractionEnabled:](self->_selectionBadgeView, "setUserInteractionEnabled:", 0);
      -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_selectionBadgeView);
      v4 = 0;
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
    v4 = 1;
  }
  objc_msgSend(MEMORY[0x1E0D7B4C0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableSelectionOverlayView");

  -[UIView setHidden:](self->_selectionOverlayView, "setHidden:", v4 | v6);
  -[UIView setHidden:](self->_selectionBadgeView, "setHidden:", v4);
  -[PUPhotosGridCell _updateCloudIcon](self, "_updateCloudIcon");
  if (v3)
    -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
  -[PUPhotosGridCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateCloudIcon
{
  void *v3;
  UIImageView *v4;
  UIImageView *cloudIconImageView;
  uint64_t v6;

  if (!-[PUPhotosGridCell isCloudIconVisible](self, "isCloudIconVisible")
    || -[PUPhotosGridCell isSelectionBadgeVisible](self, "isSelectionBadgeVisible"))
  {
    v6 = 1;
  }
  else
  {
    if (!self->_cloudIconImageView)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("Thumbnail_Loading.png"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v3);
      cloudIconImageView = self->_cloudIconImageView;
      self->_cloudIconImageView = v4;

      objc_msgSend(v3, "size");
      PXRectWithOriginAndSize();
      -[UIImageView setFrame:](self->_cloudIconImageView, "setFrame:");
      -[UIImageView setUserInteractionEnabled:](self->_cloudIconImageView, "setUserInteractionEnabled:", 0);
      -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_cloudIconImageView);
      -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");

    }
    v6 = 0;
  }
  -[UIImageView setHidden:](self->_cloudIconImageView, "setHidden:", v6);
  -[PUPhotosGridCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateProgressImmediately:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *progress;
  PUProgressIndicatorView *progressIndicatorView;
  PUProgressIndicatorView *v7;
  PUProgressIndicatorView *v8;
  PUProgressIndicatorView *v9;
  PUProgressIndicatorView *v10;
  NSArray *progressIndicatorViewConstraints;
  PUProgressIndicatorView *v12;
  PUProgressIndicatorView *v13;
  float v14;
  _QWORD v15[4];
  PUProgressIndicatorView *v16;

  v3 = a3;
  progress = self->_progress;
  progressIndicatorView = self->_progressIndicatorView;
  if (!progress)
  {
    if (!progressIndicatorView)
      return;
    v9 = progressIndicatorView;
    v10 = self->_progressIndicatorView;
    self->_progressIndicatorView = 0;

    progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
    self->_progressIndicatorViewConstraints = 0;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__PUPhotosGridCell__updateProgressImmediately___block_invoke;
    v15[3] = &unk_1E58ABD10;
    v16 = v9;
    v12 = v9;
    -[PUProgressIndicatorView endShowingProgressImmediately:animated:withCompletionHandler:](v12, "endShowingProgressImmediately:animated:withCompletionHandler:", v3, v3 ^ 1, v15);

LABEL_6:
    progressIndicatorView = self->_progressIndicatorView;
    if (!progressIndicatorView)
      return;
    goto LABEL_7;
  }
  if (!progressIndicatorView)
  {
    v7 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 1);
    v8 = self->_progressIndicatorView;
    self->_progressIndicatorView = v7;

    -[PUProgressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUProgressIndicatorView beginShowingProgressImmediately:animated:](self->_progressIndicatorView, "beginShowingProgressImmediately:animated:", v3, v3 ^ 1);
    -[PUPhotosGridCell addSubview:](self, "addSubview:", self->_progressIndicatorView);
    -[PUPhotosGridCell _updateSubviewOrdering](self, "_updateSubviewOrdering");
    -[PUPhotosGridCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    goto LABEL_6;
  }
LABEL_7:
  -[PUProgressIndicatorView setDeterminate:](progressIndicatorView, "setDeterminate:", 1);
  v13 = self->_progressIndicatorView;
  -[NSNumber floatValue](self->_progress, "floatValue");
  -[PUProgressIndicatorView setCurrentProgress:](v13, "setCurrentProgress:", v14);
}

- (void)_updateSubviewOrdering
{
  -[PUPhotosGridCell sendSubviewToBack:](self, "sendSubviewToBack:", self->_transitionFillerView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_selectionOverlayView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_selectionBadgeView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_cloudIconImageView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_progressIndicatorView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_highlightOverlayView);
  -[PUPhotosGridCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_temporaryPhotoContentView);
}

- (void)_updateContentViewClipsToBounds
{
  UIView *transitionFillerView;

  transitionFillerView = self->_transitionFillerView;
  if (-[PUPhotosGridCell clipsToBounds](self, "clipsToBounds") != (transitionFillerView == 0))
    -[PUPhotosGridCell setClipsToBounds:](self, "setClipsToBounds:", transitionFillerView == 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v34.receiver = self;
  v34.super_class = (Class)PUPhotosGridCell;
  -[PUPhotosGridCell layoutSubviews](&v34, sel_layoutSubviews);
  -[PUPhotosGridCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUPhotosGridCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PUPhotoView setFrame:](self->_temporaryPhotoContentView, "setFrame:", v4, v6, v8, v10);
  -[PUPhotosGridCell photoContentView](self, "photoContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageContentFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[UIView setFrame:](self->_highlightOverlayView, "setFrame:", v15, v17, v19, v21);
  -[UIView setFrame:](self->_selectionOverlayView, "setFrame:", v15, v17, v19, v21);
  -[UIView bounds](self->_selectionBadgeView, "bounds");
  v23 = v22;
  v25 = v24;
  v35.origin.x = v15;
  v35.origin.y = v17;
  v35.size.width = v19;
  v35.size.height = v21;
  v26 = CGRectGetMaxX(v35) - v23 + -3.5;
  v36.origin.x = v15;
  v36.origin.y = v17;
  v36.size.width = v19;
  v36.size.height = v21;
  -[UIView setFrame:](self->_selectionBadgeView, "setFrame:", v26, CGRectGetMaxY(v36) - v25 + -3.5, v23, v25);
  -[UIImageView bounds](self->_cloudIconImageView, "bounds");
  v28 = v27;
  v30 = v29;
  v37.origin.x = v15;
  v37.origin.y = v17;
  v37.size.width = v19;
  v37.size.height = v21;
  v31 = CGRectGetMaxX(v37) - v28 + -8.0;
  v38.origin.x = v15;
  v38.origin.y = v17;
  v38.size.width = v19;
  v38.size.height = v21;
  -[UIImageView setFrame:](self->_cloudIconImageView, "setFrame:", v31, CGRectGetMaxY(v38) - v30 + -5.0, v28, v30);
  -[PUPhotosGridCell photoContentView](self, "photoContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentHelper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutSubviewsOfContentView");

  -[PUPhotosGridCell _layoutTransitionFillerView](self, "_layoutTransitionFillerView");
}

- (void)_layoutTransitionFillerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  if (self->_transitionFillerView)
  {
    -[PUPhotosGridCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[UIView setFrame:](self->_transitionFillerView, "setFrame:", v5 + self->_fillerEdgeInsets.left, v7 + self->_fillerEdgeInsets.top, v9 - (self->_fillerEdgeInsets.left + self->_fillerEdgeInsets.right), v11 - (self->_fillerEdgeInsets.top + self->_fillerEdgeInsets.bottom));
    v12 = (self->_fillerEdgeInsets.right - self->_fillerEdgeInsets.left) * 0.5;
    v13 = (self->_fillerEdgeInsets.bottom - self->_fillerEdgeInsets.top) * 0.5;
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&v16, v12, v13);
    -[UIView layer](self->_transitionFillerView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    objc_msgSend(v14, "setContentsTransform:", &v15);

  }
}

- (void)updateConstraints
{
  NSArray *v3;
  void *v4;
  void *v5;
  NSArray *progressIndicatorViewConstraints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridCell;
  -[PUPhotosGridCell updateConstraints](&v7, sel_updateConstraints);
  if (self->_progressIndicatorView)
  {
    if (!self->_progressIndicatorViewConstraints)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_progressIndicatorView, 9, 0, self, 9, 1.0, 0.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v3, "addObject:", v4);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_progressIndicatorView, 10, 0, self, 10, 1.0, 0.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v3, "addObject:", v5);

      -[PUPhotosGridCell addConstraints:](self, "addConstraints:", v3);
      progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
      self->_progressIndicatorViewConstraints = v3;

    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PUPhotosGridCell photoContentView](self, "photoContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentViewSizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)applyLayoutAttributes:(id)a3
{
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  PUPhotoView *temporaryPhotoContentView;
  double v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "interactiveTransitionProgress");
    if (v4 >= 0.0)
    {
      v5 = -[PUPhotosGridCell transitionIsAppearing](self, "transitionIsAppearing");
      objc_msgSend(v13, "interactiveTransitionProgress");
      v7 = fmin(v6, 1.0);
      -[PUPhotosGridCell transitionFillerView](self, "transitionFillerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = 1.0 - v7;
        if (v5)
          v10 = v7;
        objc_msgSend(v8, "setAlpha:", v10);
      }
      temporaryPhotoContentView = self->_temporaryPhotoContentView;
      if (temporaryPhotoContentView)
      {
        v12 = 1.0 - v7;
        if (!v5)
          v12 = v7;
        -[PUPhotoView setAlpha:](temporaryPhotoContentView, "setAlpha:", v12);
      }

    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotosGridCell;
  -[PUPhotosGridCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUPhotosGridCell removeTemporaryPhotoContentView](self, "removeTemporaryPhotoContentView");
  -[PUPhotosGridCell setSelectionBadgeVisible:](self, "setSelectionBadgeVisible:", 0);
  -[PUPhotosGridCell setHighlighted:](self, "setHighlighted:", 0);
  -[PUPhotosGridCell setCloudIconVisible:](self, "setCloudIconVisible:", 0);
  -[PUPhotosGridCell setDraggable:](self, "setDraggable:", 0);
  -[PUPhotosGridCell setProgress:immediately:](self, "setProgress:immediately:", 0, 1);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PUPhotosGridCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotosGridCell;
    -[PUPhotosGridCell setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[PUPhotosGridCell _updateHighlight](self, "_updateHighlight");
  }
}

- (void)setSelectionBadgeVisible:(BOOL)a3
{
  if (self->_selectionBadgeVisible != a3)
  {
    self->_selectionBadgeVisible = a3;
    -[PUPhotosGridCell _updateSelectionBadge](self, "_updateSelectionBadge");
  }
}

- (void)setCloudIconVisible:(BOOL)a3
{
  if (self->_cloudIconVisible != a3)
  {
    self->_cloudIconVisible = a3;
    -[PUPhotosGridCell _updateCloudIcon](self, "_updateCloudIcon");
  }
}

- (void)dragStateDidChange:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotosGridCell;
  -[PUPhotosGridCell dragStateDidChange:](&v5, sel_dragStateDidChange_);
  if (-[PUPhotosGridCell dragState](self, "dragState") != a3)
  {
    -[PUPhotosGridCell setDragState:](self, "setDragState:", a3);
    -[PUPhotosGridCell _updateSelectionBadge](self, "_updateSelectionBadge");
  }
}

- (void)setProgress:(id)a3
{
  -[PUPhotosGridCell setProgress:immediately:](self, "setProgress:immediately:", a3, 1);
}

- (void)setProgress:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  NSNumber *v7;
  NSNumber *v8;

  v4 = a4;
  v7 = (NSNumber *)a3;
  if (self->_progress != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_progress, a3);
    -[PUPhotosGridCell _updateProgressImmediately:](self, "_updateProgressImmediately:", v4);
    v7 = v8;
  }

}

- (UIView)transitionFillerView
{
  return self->_transitionFillerView;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)isSelectionBadgeVisible
{
  return self->_selectionBadgeVisible;
}

- (BOOL)isCloudIconVisible
{
  return self->_cloudIconVisible;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (PUPhotoView)photoContentView
{
  return self->_photoContentView;
}

- (void)setPhotoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_photoContentView, a3);
}

- (PUPhotoView)temporaryPhotoContentView
{
  return self->_temporaryPhotoContentView;
}

- (void)setTemporaryPhotoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryPhotoContentView, a3);
}

- (BOOL)transitionFillerViewEnabled
{
  return self->_transitionFillerViewEnabled;
}

- (UIEdgeInsets)fillerEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fillerEdgeInsets.top;
  left = self->_fillerEdgeInsets.left;
  bottom = self->_fillerEdgeInsets.bottom;
  right = self->_fillerEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)transitionIsAppearing
{
  return self->_transitionIsAppearing;
}

- (void)setTransitionIsAppearing:(BOOL)a3
{
  self->_transitionIsAppearing = a3;
}

- (int)currentImageRequestID
{
  return self->_currentImageRequestID;
}

- (void)setCurrentImageRequestID:(int)a3
{
  self->_currentImageRequestID = a3;
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryPhotoContentView, 0);
  objc_storeStrong((id *)&self->_photoContentView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_transitionFillerView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_cloudIconImageView, 0);
  objc_storeStrong((id *)&self->_selectionBadgeView, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
}

uint64_t __47__PUPhotosGridCell__updateProgressImmediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __40__PUPhotosGridCell_setFillerEdgeInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutTransitionFillerView");
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end
