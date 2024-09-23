@implementation SKUIStandardInteractiveSegment

- (SKUIStandardInteractiveSegment)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  SKUIStandardInteractiveSegment *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIView *borderAndBackgroundContainerView;
  uint64_t v17;
  UIImageView *borderImageView;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStandardInteractiveSegment initWithFrame:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIStandardInteractiveSegment;
  v8 = -[SKUIStandardInteractiveSegment initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v9 = (SKUIStandardInteractiveSegment *)v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 600) = xmmword_1BBED19F0;
    *(_OWORD *)(v8 + 616) = xmmword_1BBED19F0;
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    borderAndBackgroundContainerView = v9->_borderAndBackgroundContainerView;
    v9->_borderAndBackgroundContainerView = (UIView *)v15;

    -[UIView setTintAdjustmentMode:](v9->_borderAndBackgroundContainerView, "setTintAdjustmentMode:", 1);
    -[UIView setUserInteractionEnabled:](v9->_borderAndBackgroundContainerView, "setUserInteractionEnabled:", 0);
    -[SKUIStandardInteractiveSegment addSubview:](v9, "addSubview:", v9->_borderAndBackgroundContainerView);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v11, v12, v13, v14);
    borderImageView = v9->_borderImageView;
    v9->_borderImageView = (UIImageView *)v17;

    -[UIImageView setContentMode:](v9->_borderImageView, "setContentMode:", 0);
    -[UIView addSubview:](v9->_borderAndBackgroundContainerView, "addSubview:", v9->_borderImageView);
    -[SKUIStandardInteractiveSegment _updateBorderAndBackgroundContainerViewTinting](v9, "_updateBorderAndBackgroundContainerViewTinting");
  }
  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  char v22;
  double Width;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double top;
  double left;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double Height;
  double v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v47.receiver = self;
  v47.super_class = (Class)SKUIStandardInteractiveSegment;
  -[SKUIStandardInteractiveSegment layoutSubviews](&v47, sel_layoutSubviews);
  -[SKUIStandardInteractiveSegment traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 > 0.00000011920929)
  {
    v46 = v5;
    -[SKUIStandardInteractiveSegment bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIView setFrame:](self->_borderAndBackgroundContainerView, "setFrame:");
    -[UIView bounds](self->_borderAndBackgroundContainerView, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    if (!self->_hasValidCorneredImages)
      -[SKUIStandardInteractiveSegment _reloadCorneredImages](self, "_reloadCorneredImages");
    v22 = -[SKUIStandardInteractiveSegment _cornersForSegmentPosition:](self, "_cornersForSegmentPosition:", self->_segmentPosition);
    v48.origin.x = v15;
    v48.origin.y = v17;
    v48.size.width = v19;
    v48.size.height = v21;
    v40 = v17;
    v41 = v19;
    Width = CGRectGetWidth(v48);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v49.origin.x = v7;
    v49.origin.y = v9;
    v49.size.width = v11;
    v49.size.height = v13;
    v24 = v21;
    v25 = CGRectGetWidth(v49);
    v50.origin.x = v7;
    v50.origin.y = v9;
    v50.size.width = v11;
    v50.size.height = v13;
    Height = CGRectGetHeight(v50);
    v26 = Width + -0.5;
    v27 = v25 + -1.0;
    v28 = 1.0;
    if ((~v22 & 5) != 0)
    {
      v28 = 0.0;
      v27 = v25;
      v26 = Width;
      v29 = 0.0;
    }
    else
    {
      v29 = 0.5;
    }
    v30 = v27 + -1.0;
    if ((v22 & 0xA) != 0xALL)
      v30 = v27;
    v42 = v30;
    v43 = v28;
    if ((v22 & 0xA) == 0xALL)
      v31 = v26 + -0.5;
    else
      v31 = v26;
    v51.origin.x = v15;
    v51.origin.y = v40;
    v51.size.width = v41;
    v51.size.height = v24;
    v32 = CGRectGetHeight(v51) + -1.0;
    -[UIImageView setFrame:](self->_highlightedBackgroundImageView, "setFrame:", v29, 0.5, v31, v32);
    -[UIImageView setFrame:](self->_selectedBackgroundImageView, "setFrame:", v29, 0.5, v31, v32);
    -[UIImageView frame](self->_borderImageView, "frame");
    v52.origin.x = v15;
    v52.origin.y = v40;
    v52.size.width = v41;
    v52.size.height = v24;
    v33 = CGRectGetWidth(v52);
    v53.origin.x = v15;
    v53.origin.y = v40;
    v53.size.width = v41;
    v53.size.height = v24;
    -[UIImageView setFrame:](self->_borderImageView, "setFrame:", 0.0, 0.0, v33, CGRectGetHeight(v53));
    top = self->_contentEdgeInsets.top;
    left = self->_contentEdgeInsets.left;
    v36 = v43 + left;
    v37 = v45 + top;
    v38 = v42 - (left + self->_contentEdgeInsets.right);
    v39 = Height - (top + self->_contentEdgeInsets.bottom);
    -[SKUIStandardInteractiveSegment _titleLabelSize](self, "_titleLabelSize");
    v54.origin.x = v36;
    v54.origin.y = v37;
    v54.size.width = v38;
    v54.size.height = v39;
    CGRectGetWidth(v54);
    v55.origin.x = v36;
    v55.origin.y = v37;
    v55.size.width = v38;
    v55.size.height = v39;
    CGRectGetHeight(v55);
    UIRectCenteredIntegralRectScale();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *(_QWORD *)&v46);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double top;
  double bottom;
  double v10;
  double v11;
  char v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SKUIStandardInteractiveSegment _titleLabelSize](self, "_titleLabelSize");
  v7 = v6;
  top = self->_contentEdgeInsets.top;
  bottom = self->_contentEdgeInsets.bottom;
  v11 = v10 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  v12 = ~-[SKUIStandardInteractiveSegment _cornersForSegmentPosition:](self, "_cornersForSegmentPosition:", self->_segmentPosition);
  v13 = v11 + 1.0;
  if ((v12 & 5) != 0)
    v13 = v11;
  v14 = v13 + 1.0;
  if ((v12 & 0xA) != 0)
    v14 = v13;
  v15 = v7 + top + bottom;
  if (width < v14)
    v14 = width;
  if (height < v15)
    v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIStandardInteractiveSegment;
  -[SKUIStandardInteractiveSegment tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SKUIStandardInteractiveSegment _updateBorderAndBackgroundContainerViewTinting](self, "_updateBorderAndBackgroundContainerViewTinting");
  -[SKUIStandardInteractiveSegment _applySelectionProgress](self, "_applySelectionProgress");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIStandardInteractiveSegment;
  v4 = a3;
  -[SKUIStandardInteractiveSegment traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v13.receiver, v13.super_class);
  v6 = v5;

  -[SKUIStandardInteractiveSegment traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  v10 = v6 > 0.00000011920929 || v9 <= 0.00000011920929;
  v11 = vabdd_f64(v9, v6);
  if (!v10 || v11 > 0.00000011920929)
    -[SKUIStandardInteractiveSegment _setNeedsReloadCorneredImages](self, "_setNeedsReloadCorneredImages", v11);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  int64_t highlightTransactionCount;
  UIImageView *highlightedBackgroundImageView;
  id v9;
  UIImageView *v10;
  UIImageView *v11;
  UIImageView *v12;
  void *v13;
  int64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v3 = a3;
  v5 = -[SKUIStandardInteractiveSegment isHighlighted](self, "isHighlighted");
  v17.receiver = self;
  v17.super_class = (Class)SKUIStandardInteractiveSegment;
  -[SKUIStandardInteractiveSegment setHighlighted:](&v17, sel_setHighlighted_, v3);
  v6 = -[SKUIStandardInteractiveSegment isHighlighted](self, "isHighlighted");
  if (v5 != v6)
  {
    highlightTransactionCount = self->_highlightTransactionCount;
    if (v6)
    {
      self->_highlightTransactionCount = highlightTransactionCount + 1;
      highlightedBackgroundImageView = self->_highlightedBackgroundImageView;
      if (!highlightedBackgroundImageView)
      {
        v9 = objc_alloc(MEMORY[0x1E0DC3890]);
        v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v11 = self->_highlightedBackgroundImageView;
        self->_highlightedBackgroundImageView = v10;

        -[UIImageView setContentMode:](self->_highlightedBackgroundImageView, "setContentMode:", 0);
        v12 = self->_highlightedBackgroundImageView;
        -[SKUIStandardInteractiveSegment _backgroundImage](self, "_backgroundImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](v12, "setImage:", v13);

        -[UIView insertSubview:belowSubview:](self->_borderAndBackgroundContainerView, "insertSubview:belowSubview:", self->_highlightedBackgroundImageView, self->_borderImageView);
        -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
        highlightedBackgroundImageView = self->_highlightedBackgroundImageView;
      }
      -[UIImageView setAlpha:](highlightedBackgroundImageView, "setAlpha:", 0.15);
    }
    else
    {
      v14 = highlightTransactionCount - 1;
      if (v14)
      {
        self->_highlightTransactionCount = v14;
      }
      else
      {
        v15[4] = self;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke;
        v16[3] = &unk_1E739FD38;
        v16[4] = self;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke_2;
        v15[3] = &unk_1E73A0108;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327680, v16, v15, 0.2, 0.0);
      }
    }
  }
}

uint64_t __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 0.0);
}

void __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 512);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 512))
  {
    objc_msgSend(*(id *)(v1 + 504), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 504);
    *(_QWORD *)(v3 + 504) = 0;

  }
}

- (double)relativeSelectionProgress
{
  return self->_relativeSelectionProgress;
}

- (int64_t)segmentPosition
{
  return self->_segmentPosition;
}

- (void)setRelativeSelectionProgress:(double)a3
{
  double v3;

  v3 = self->_relativeSelectionProgress - a3;
  if (v3 < 0.0 || v3 > 0.0 || !self->_hasSetRelativeSelectionProgress)
  {
    self->_hasSetRelativeSelectionProgress = 1;
    self->_relativeSelectionProgress = a3;
    -[SKUIStandardInteractiveSegment _applySelectionProgress](self, "_applySelectionProgress");
  }
}

- (void)setSegmentPosition:(int64_t)a3
{
  if (self->_segmentPosition != a3)
  {
    self->_segmentPosition = a3;
    -[SKUIStandardInteractiveSegment _setNeedsReloadCorneredImages](self, "_setNeedsReloadCorneredImages");
  }
}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;
  BOOL v6;
  NSAttributedString *v7;
  NSAttributedString *v8;
  NSAttributedString *v9;
  NSAttributedString *titleLabelAttributedString;
  UILabel *titleLabel;
  NSAttributedString *v12;

  v4 = (NSAttributedString *)a3;
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != v4)
  {
    v12 = v4;
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedTitle, "isEqualToAttributedString:", v4);
    v4 = v12;
    if (!v6)
    {
      v7 = (NSAttributedString *)-[NSAttributedString copy](v12, "copy");
      v8 = self->_attributedTitle;
      self->_attributedTitle = v7;

      v9 = (NSAttributedString *)-[NSAttributedString mutableCopy](self->_attributedTitle, "mutableCopy");
      -[NSAttributedString removeAttribute:range:](v9, "removeAttribute:range:", *MEMORY[0x1E0DC1140], 0, -[NSAttributedString length](v9, "length"));
      titleLabelAttributedString = self->_titleLabelAttributedString;
      if (titleLabelAttributedString != v9
        && !-[NSAttributedString isEqualToAttributedString:](titleLabelAttributedString, "isEqualToAttributedString:", v9))
      {
        objc_storeStrong((id *)&self->_titleLabelAttributedString, v9);
        titleLabel = self->_titleLabel;
        if (titleLabel)
        {
          -[UILabel setAttributedText:](titleLabel, "setAttributedText:", self->_titleLabelAttributedString);
          self->_hasDirtyTitleLabelSize = 1;
          -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
        }
        -[SKUIStandardInteractiveSegment _applySelectionProgress](self, "_applySelectionProgress");
      }

      v4 = v12;
    }
  }

}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (double)defaultHeight
{
  return 29.0;
}

- (void)_applySelectionProgress
{
  double v3;
  double v4;
  void *v5;
  double v6;
  float v7;
  float v8;
  NSUInteger v9;
  UILabel *titleLabel;
  id v11;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  UILabel *v19;
  uint64_t v20;
  void *v21;
  double v22;
  float v23;
  double v24;
  UIImageView *selectedBackgroundImageView;
  id v26;
  UIImageView *v27;
  UIImageView *v28;
  UIImageView *v29;
  void *v30;
  UIImageView *v31;
  id v32;

  if (self->_hasSetRelativeSelectionProgress)
  {
    -[SKUIStandardInteractiveSegment _normalizedSelectionProgressForRelativeSelectionProgress:](self, "_normalizedSelectionProgressForRelativeSelectionProgress:", self->_relativeSelectionProgress);
    v4 = v3;
    -[SKUIStandardInteractiveSegment _progressTimingFunction](self, "_progressTimingFunction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v6 = v4;
    v32 = v5;
    objc_msgSend(v5, "_solveForInput:", v6);
    v8 = v7;
    v9 = -[NSAttributedString length](self->_titleLabelAttributedString, "length");
    titleLabel = self->_titleLabel;
    if (v9)
    {
      if (!titleLabel)
      {
        v11 = objc_alloc(MEMORY[0x1E0DC3990]);
        v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v13 = self->_titleLabel;
        self->_titleLabel = v12;

        v14 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

        v16 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", self->_titleLabelAttributedString);
        -[UILabel _setTextColorFollowsTintColor:](self->_titleLabel, "_setTextColorFollowsTintColor:", 1);
        -[SKUIStandardInteractiveSegment addSubview:](self, "addSubview:", self->_titleLabel);
        self->_hasDirtyTitleLabelSize = 1;
        -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
      }
      -[UILabel layer](self->_titleLabel, "layer");
      v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v8 <= 0.00000011921)
        v20 = 0;
      else
        v20 = *MEMORY[0x1E0CD2F28];
      -[UILabel setCompositingFilter:](v18, "setCompositingFilter:", v20);
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v19 = self->_titleLabel;
      self->_titleLabel = 0;
    }

    -[SKUIStandardInteractiveSegment _inverseProgressTimingFunction](self, "_inverseProgressTimingFunction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 1.0 - v4;
    *(float *)&v22 = 1.0 - v4;
    objc_msgSend(v21, "_solveForInput:", v22);
    v24 = 1.0 - v23;
    selectedBackgroundImageView = self->_selectedBackgroundImageView;
    if (v24 <= 0.00000011920929)
    {
      -[UIImageView removeFromSuperview](selectedBackgroundImageView, "removeFromSuperview");
      v31 = self->_selectedBackgroundImageView;
      self->_selectedBackgroundImageView = 0;

    }
    else
    {
      if (!selectedBackgroundImageView)
      {
        v26 = objc_alloc(MEMORY[0x1E0DC3890]);
        v27 = (UIImageView *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v28 = self->_selectedBackgroundImageView;
        self->_selectedBackgroundImageView = v27;

        -[UIImageView setContentMode:](self->_selectedBackgroundImageView, "setContentMode:", 0);
        v29 = self->_selectedBackgroundImageView;
        -[SKUIStandardInteractiveSegment _backgroundImage](self, "_backgroundImage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](v29, "setImage:", v30);

        -[UIView insertSubview:aboveSubview:](self->_borderAndBackgroundContainerView, "insertSubview:aboveSubview:", self->_selectedBackgroundImageView, self->_borderImageView);
        -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
        selectedBackgroundImageView = self->_selectedBackgroundImageView;
      }
      -[UIImageView setAlpha:](selectedBackgroundImageView, "setAlpha:", v24);
    }

  }
}

- (id)_backgroundImage
{
  void *v3;
  double v4;
  double v5;
  UIImage *v6;
  UIImage *backgroundImage;

  if (!self->_backgroundImage)
  {
    -[SKUIStandardInteractiveSegment traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayScale");
    v5 = v4;

    if (v5 > 0.00000011920929)
    {
      -[SKUIStandardInteractiveSegment _createCorneredImageWithScale:forBorder:](self, "_createCorneredImageWithScale:forBorder:", 0, v5);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
      backgroundImage = self->_backgroundImage;
      self->_backgroundImage = v6;

    }
  }
  return self->_backgroundImage;
}

- (id)_borderImage
{
  void *v3;
  double v4;
  double v5;
  UIImage *v6;
  UIImage *borderImage;

  if (!self->_borderImage)
  {
    -[SKUIStandardInteractiveSegment traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayScale");
    v5 = v4;

    if (v5 > 0.00000011920929)
    {
      -[SKUIStandardInteractiveSegment _createCorneredImageWithScale:forBorder:](self, "_createCorneredImageWithScale:forBorder:", 1, v5);
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
      borderImage = self->_borderImage;
      self->_borderImage = v6;

    }
  }
  return self->_borderImage;
}

- (unint64_t)_cornersForSegmentPosition:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceLayoutDirection");

    v6 = v5 == 0;
    v7 = 5;
    v8 = 10;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
        return 0;
      else
        return -1;
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    v6 = v10 == 0;
    v7 = 10;
    v8 = 5;
  }
  if (v6)
    return v8;
  else
    return v7;
}

- (id)_createCorneredImageWithScale:(double)a3 forBorder:(BOOL)a4
{
  _BOOL4 v4;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGSize v25;
  CGRect v26;

  v4 = a4;
  v6 = -[SKUIStandardInteractiveSegment _cornersForSegmentPosition:](self, "_cornersForSegmentPosition:", self->_segmentPosition);
  if (v4)
    v7 = 8.0;
  else
    v7 = 7.0;
  if ((v6 & 5) != 0)
    v8 = -0.0;
  else
    v8 = v7;
  v9 = v7 * 2.0 + 1.0 + v8;
  if ((v6 & 5) != 0)
    v10 = 0.0;
  else
    v10 = 0.0 - v7;
  if ((v6 & 0xA) != 0)
    v11 = -0.0;
  else
    v11 = v7;
  v12 = v11 + v9;
  v25.width = v7 * 2.0 + 1.0;
  v25.height = v25.width;
  UIGraphicsBeginImageContextWithOptions(v25, 0, a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "set");

  v14 = (void *)MEMORY[0x1E0DC3508];
  v15 = 0;
  if (v4)
  {
    v16 = v10;
    v17 = v12;
    v18 = v7 * 2.0 + 1.0;
    v26 = CGRectInset(*(CGRect *)(&v15 - 1), 0.5, 0.5);
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height, 3.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLineWidth:", 1.0);
    objc_msgSend(v19, "stroke");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v10, 0.0, v12, v7 * 2.0 + 1.0, 3.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFill");

    objc_msgSend(v19, "fill");
  }

  UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v21, "resizableImageWithCapInsets:", v7, v7, v7, v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "imageWithRenderingMode:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_inverseProgressTimingFunction
{
  CAMediaTimingFunction *inverseProgressTimingFunction;
  CAMediaTimingFunction *v4;
  CAMediaTimingFunction *v5;

  inverseProgressTimingFunction = self->_inverseProgressTimingFunction;
  if (!inverseProgressTimingFunction)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v4 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inverseProgressTimingFunction;
    self->_inverseProgressTimingFunction = v4;

    inverseProgressTimingFunction = self->_inverseProgressTimingFunction;
  }
  return inverseProgressTimingFunction;
}

- (double)_normalizedSelectionProgressForRelativeSelectionProgress:(double)a3
{
  return 1.0 - fabs(a3);
}

- (id)_progressTimingFunction
{
  CAMediaTimingFunction *progressTimingFunction;
  CAMediaTimingFunction *v4;
  CAMediaTimingFunction *v5;

  progressTimingFunction = self->_progressTimingFunction;
  if (!progressTimingFunction)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v4 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    v5 = self->_progressTimingFunction;
    self->_progressTimingFunction = v4;

    progressTimingFunction = self->_progressTimingFunction;
  }
  return progressTimingFunction;
}

- (void)_reloadCorneredImages
{
  UIImage *backgroundImage;
  UIImage *borderImage;
  void *v5;
  id v6;

  self->_hasValidCorneredImages = 1;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  borderImage = self->_borderImage;
  self->_borderImage = 0;

  if (self->_highlightedBackgroundImageView || self->_selectedBackgroundImageView)
  {
    -[SKUIStandardInteractiveSegment _backgroundImage](self, "_backgroundImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_highlightedBackgroundImageView, "setImage:", v5);
    -[UIImageView setImage:](self->_selectedBackgroundImageView, "setImage:", v5);

  }
  if (self->_borderImageView)
  {
    -[SKUIStandardInteractiveSegment _borderImage](self, "_borderImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_borderImageView, "setImage:", v6);

  }
}

- (void)_setNeedsReloadCorneredImages
{
  self->_hasValidCorneredImages = 0;
  -[SKUIStandardInteractiveSegment setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_titleLabelSize
{
  CGSize *p_titleLabelSize;
  double width;
  double height;
  CGSize result;

  if (self->_hasDirtyTitleLabelSize)
  {
    self->_hasDirtyTitleLabelSize = 0;
    p_titleLabelSize = &self->_titleLabelSize;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    p_titleLabelSize->width = width;
    p_titleLabelSize->height = height;
  }
  else
  {
    width = self->_titleLabelSize.width;
    height = self->_titleLabelSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)_updateBorderAndBackgroundContainerViewTinting
{
  double v3;
  double v4;
  double v5;
  UIView *borderAndBackgroundContainerView;
  void *v7;
  void *v8;
  id v9;

  -[SKUIStandardInteractiveSegment tintColor](self, "tintColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alphaComponent");
  v4 = v3;
  v5 = fabs(v3 + -1.0);
  borderAndBackgroundContainerView = self->_borderAndBackgroundContainerView;
  if (v5 <= 0.00000011920929)
  {
    -[UIView setTintColor:](self->_borderAndBackgroundContainerView, "setTintColor:", v9);
    v4 = 1.0;
  }
  else
  {
    objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](borderAndBackgroundContainerView, "setTintColor:", v7);

  }
  -[UIView setAlpha:](self->_borderAndBackgroundContainerView, "setAlpha:", v4);
  -[UIView layer](self->_borderAndBackgroundContainerView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", v5 > 0.00000011920929);

}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributedString, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressTimingFunction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_inverseProgressTimingFunction, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_borderImageView, 0);
  objc_storeStrong((id *)&self->_borderImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_borderAndBackgroundContainerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStandardInteractiveSegment initWithFrame:]";
}

@end
