@implementation PXCMMTranscriptBubbleStatusView

- (PXCMMTranscriptBubbleStatusView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMTranscriptBubbleStatusView.m"), 38, CFSTR("%s is not available as initializer"), "-[PXCMMTranscriptBubbleStatusView initWithCoder:]");

  abort();
}

- (PXCMMTranscriptBubbleStatusView)initWithFrame:(CGRect)a3
{
  PXCMMTranscriptBubbleStatusView *v3;
  uint64_t v4;
  PXUpdater *updater;
  void *v6;
  uint64_t v7;
  UIImageView *iconImageView;
  PXCMMTranscriptTextView *v9;
  uint64_t v10;
  PXCMMTranscriptTextView *textView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXCMMTranscriptBubbleStatusView;
  v3 = -[PXCMMTranscriptBubbleStatusView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel_setNeedsLayout);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateActivityIndicator, 0);
    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateRoundedCornerOverlayView, 1);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXMessagesPlaceholderIcon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v7;

    -[UIImageView setClipsToBounds:](v3->_iconImageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    -[PXCMMTranscriptBubbleStatusView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v9 = [PXCMMTranscriptTextView alloc];
    v10 = -[PXCMMTranscriptTextView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textView = v3->_textView;
    v3->_textView = (PXCMMTranscriptTextView *)v10;

    -[PXCMMTranscriptBubbleStatusView addSubview:](v3, "addSubview:", v3->_textView);
  }
  return v3;
}

- (void)setSpec:(id)a3
{
  PXCMMSpec *v5;
  void *v6;
  void *v7;
  PXCMMSpec *v8;

  v5 = (PXCMMSpec *)a3;
  if (self->_spec != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXCMMTranscriptBubbleStatusView spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bubbleBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMTranscriptBubbleStatusView setBackgroundColor:](self, "setBackgroundColor:", v7);

    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateRoundedCornerOverlayView);
    v5 = v8;
  }

}

- (void)setStatusTitle:(id)a3
{
  -[PXCMMTranscriptTextView setPrimaryText:](self->_textView, "setPrimaryText:", a3);
}

- (NSString)statusTitle
{
  return -[PXCMMTranscriptTextView primaryText](self->_textView, "primaryText");
}

- (void)setStatusDescription:(id)a3
{
  -[PXCMMTranscriptTextView setSecondaryText:](self->_textView, "setSecondaryText:", a3);
}

- (NSString)statusDescription
{
  return -[PXCMMTranscriptTextView secondaryText](self->_textView, "secondaryText");
}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  if (self->_showsActivityIndicator != a3)
  {
    self->_showsActivityIndicator = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateActivityIndicator);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  PXCMMSpec *spec;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  -[PXCMMTranscriptBubbleStatusView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 0, 0, a3.width, a3.height);
  v6 = v5;
  spec = self->_spec;
  if (spec)
  {
    -[PXFeatureSpec displayScale](spec, "displayScale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  +[PXCMMSpec maxBubbleWidthForDisplayScale:](PXCMMSpec, "maxBubbleWidthForDisplayScale:", v9);
  v13 = fmin(width, v12);
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMTranscriptBubbleStatusView;
  -[PXCMMTranscriptBubbleStatusView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXCMMTranscriptBubbleStatusView bounds](self, "bounds");
  -[PXCMMTranscriptBubbleStatusView _performLayoutInSize:minimizingSize:updateSubviewFrames:](self, "_performLayoutInSize:minimizingSize:updateSubviewFrames:", 1, 1, v3, v4);
}

- (CGSize)_performLayoutInSize:(CGSize)a3 minimizingSize:(BOOL)a4 updateSubviewFrames:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MinX;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double x;
  double v43;
  double v44;
  double v45;
  double v46;
  double MaxX;
  double v48;
  double rect;
  double v50;
  double v51;
  CGSize result;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v5 = a5;
  v6 = a4;
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXCMMTranscriptBubbleStatusView bubbleSafeAreaInsets](self, "bubbleSafeAreaInsets");
  UIEdgeInsetsAdd();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v45 = v14;
  PXEdgeInsetsInsetSize();
  v16 = v15;
  rect = v17;
  v53.origin.x = v11;
  v53.origin.y = v9;
  v53.size.width = 50.0;
  v53.size.height = 50.0;
  v18 = fmax(v11, CGRectGetMaxX(v53));
  v54.origin.x = v11;
  v54.origin.y = v9;
  v54.size.width = 50.0;
  v54.size.height = 50.0;
  v19 = fmax(v9, CGRectGetMaxY(v54));
  v48 = v13;
  if (-[PXCMMTranscriptBubbleStatusView showsActivityIndicator](self, "showsActivityIndicator"))
  {
    v20 = v18 + 10.0;
    v51 = 20.0;
    v55.size.width = 20.0;
    v55.size.height = 20.0;
    v55.origin.x = v18 + 10.0;
    v55.origin.y = v9;
    v18 = fmax(v18, CGRectGetMaxX(v55));
    v56.size.width = 20.0;
    v56.size.height = 20.0;
    x = v20;
    v56.origin.x = v20;
    v56.origin.y = v9;
    v19 = fmax(v19, CGRectGetMaxY(v56));
    v41 = 20.0;
  }
  else
  {
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    x = *MEMORY[0x1E0C9D648];
    v51 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v57.origin.x = v11;
  v57.origin.y = v9;
  v40 = v16;
  v57.size.width = v16;
  v57.size.height = rect;
  -[PXCMMTranscriptTextView sizeThatFits:](self->_textView, "sizeThatFits:", CGRectGetMaxX(v57) - v18 + -10.0, rect);
  v22 = v21;
  v24 = v23;
  if (v6)
  {
    PXSizeClampToSize();
    v22 = v25;
    v24 = v26;
  }
  v50 = v18;
  v27 = v18 + 10.0;
  v58.origin.x = v18 + 10.0;
  v58.origin.y = v9;
  v58.size.width = v22;
  v58.size.height = v24;
  MaxX = CGRectGetMaxX(v58);
  v59.origin.x = v18 + 10.0;
  v59.origin.y = v9;
  v44 = v22;
  v59.size.width = v22;
  v59.size.height = v24;
  v46 = fmax(v19, CGRectGetMaxY(v59));
  -[PXCMMTranscriptBubbleStatusView traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayScale");

  PXFloatFloorToPixel();
  v30 = v9 + v29;
  PXFloatFloorToPixel();
  v43 = v9 + v31;
  PXFloatFloorToPixel();
  v39 = v32;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXCMMTranscriptBubbleStatusView semanticContentAttribute](self, "semanticContentAttribute")) != 1)
  {
    v33 = v30;
    v36 = v44;
    v35 = v45;
    if (!v5)
      goto LABEL_13;
LABEL_12:
    -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v11, v33, 50.0, 50.0);
    -[PXRoundedCornerOverlayView setFrame:](self->_roundedCornerOverlay, "setFrame:", v11, v33, 50.0, 50.0);
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", x, v43, v41, v51);
    v18 = v50;
    -[PXCMMTranscriptTextView setFrame:](self->_textView, "setFrame:", v27, v9 + v39, v36, v24);
    goto LABEL_13;
  }
  v60.origin.x = v11;
  v60.origin.y = v9;
  v60.size.width = v40;
  v60.size.height = rect;
  v11 = CGRectGetMaxX(v60) + -50.0;
  v61.size.width = 50.0;
  v61.origin.x = v11;
  v33 = v30;
  v61.origin.y = v30;
  v61.size.height = 50.0;
  MinX = CGRectGetMinX(v61);
  if (-[PXCMMTranscriptBubbleStatusView showsActivityIndicator](self, "showsActivityIndicator"))
  {
    v62.size.width = v41;
    v62.origin.x = MinX + -10.0 - v41;
    x = v62.origin.x;
    v62.origin.y = v43;
    v62.size.height = v51;
    MinX = CGRectGetMinX(v62);
  }
  v36 = v44;
  v35 = v45;
  v27 = MinX + -10.0 - v44;
  v18 = v50;
  if (v5)
    goto LABEL_12;
LABEL_13:
  v37 = fmax(v48 + fmax(v18, MaxX), 50.0);
  v38 = fmax(v35 + v46, 50.0);
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)_updateActivityIndicator
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;

  if (!self->_activityIndicator
    && -[PXCMMTranscriptBubbleStatusView showsActivityIndicator](self, "showsActivityIndicator"))
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[PXCMMTranscriptBubbleStatusView addSubview:](self, "addSubview:", self->_activityIndicator);
  }
  if (-[PXCMMTranscriptBubbleStatusView showsActivityIndicator](self, "showsActivityIndicator")
    && !-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
  {
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  }
  else if (!-[PXCMMTranscriptBubbleStatusView showsActivityIndicator](self, "showsActivityIndicator"))
  {
    if (-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  }
}

- (void)_updateRoundedCornerOverlayView
{
  PXRoundedCornerOverlayView *roundedCornerOverlay;
  PXRoundedCornerOverlayView *v4;
  PXRoundedCornerOverlayView *v5;
  _QWORD v6[5];

  roundedCornerOverlay = self->_roundedCornerOverlay;
  if (!roundedCornerOverlay)
  {
    v4 = objc_alloc_init(PXRoundedCornerOverlayView);
    v5 = self->_roundedCornerOverlay;
    self->_roundedCornerOverlay = v4;

    -[PXCMMTranscriptBubbleStatusView addSubview:](self, "addSubview:", self->_roundedCornerOverlay);
    roundedCornerOverlay = self->_roundedCornerOverlay;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PXCMMTranscriptBubbleStatusView__updateRoundedCornerOverlayView__block_invoke;
  v6[3] = &unk_1E51406D0;
  v6[4] = self;
  -[PXRoundedCornerOverlayView performChanges:](roundedCornerOverlay, "performChanges:", v6);
}

- (PXCMMSpec)spec
{
  return self->_spec;
}

- (UIEdgeInsets)bubbleSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bubbleSafeAreaInsets.top;
  left = self->_bubbleSafeAreaInsets.left;
  bottom = self->_bubbleSafeAreaInsets.bottom;
  right = self->_bubbleSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBubbleSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_bubbleSafeAreaInsets = a3;
}

- (BOOL)showsActivityIndicator
{
  return self->_showsActivityIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlay, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __66__PXCMMTranscriptBubbleStatusView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 464);
  v5 = a2;
  objc_msgSend(v3, "bubbleBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayColor:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "bubbleStatusIconCornerRadius");
  objc_msgSend(v5, "setCornerRadius:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "displayScale");
  objc_msgSend(v5, "setDisplayScale:");

}

@end
