@implementation UIProgressView

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
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float progress;
  double v23;
  uint64_t v24;
  double v25;
  _BOOL4 v26;
  double v27;
  void *v28;
  int v29;
  double v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  double v40;
  double v41;
  UIImage *progressImage;
  double v43;
  double v44;
  double v45;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v12 = v11;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[UIProgressView _effectiveContentView](self, "_effectiveContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[UIImageView setFrame:](self->_trackView, "setFrame:", v15, v17, v19, v21);
  progress = self->_progress;
  v23 = round(v12 * progress);
  v24 = MEMORY[0x1E0C9D538];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
    v25 = v12 - v23;
  else
    v25 = *MEMORY[0x1E0C9D538];
  v26 = progress != 0.0;
  -[UIView alpha](self->_progressView, "alpha");
  if (((v26 ^ (v27 == 0.0)) & 1) == 0)
  {
    -[UIImageView image](self->_progressView, "image");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_isResizable");

    if (v29)
    {
      v30 = 1.0;
      if (self->_progress == 0.0)
        v30 = 0.0;
      -[UIView setAlpha:](self->_progressView, "setAlpha:", v30);
    }
  }
  -[UIImageView image](self->_progressView, "image");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "_isResizable");

  if (!v32)
    goto LABEL_14;
  -[UIImageView image](self->_progressView, "image");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "capInsets");
  v35 = v34;
  v37 = v36;

  v38 = v35 + v37;
  v39 = v38;
  if (v23 < v38)
  {
    v40 = v39 - v23;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v40 = 0.0;
    v25 = v25 - v40;
  }
  else
  {
LABEL_14:
    v39 = v23;
  }
  v41 = *(double *)(v24 + 8);
  progressImage = self->_progressImage;
  if (progressImage)
  {
    -[UIImage alignmentRectInsets](progressImage, "alignmentRectInsets");
    v45 = v43 + v44;
    v39 = v39 + v43 + v44;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0)
      v45 = 0.0;
    v25 = v25 - v45;
  }
  -[UIImageView setFrame:](self->_progressView, "setFrame:", v25, v41, v39, v21);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIProgressView;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UIProgressView _updateImages](self, "_updateImages");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[UIView _canDrawContent](self, "_canDrawContent")
    && (*(_QWORD *)&self->super._viewFlags & 0x400000000000000) == 0)
  {
    -[UIProgressView sizeThatFits:](self, "sizeThatFits:", width, height);
    width = v8;
    height = v9;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (width != v11 || height != v13)
  {
    if (-[UIView _canDrawContent](self, "_canDrawContent"))
    {
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    }
    else if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock")
           || (*(_QWORD *)&self->super._viewFlags & 0x400000000000000) != 0)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    }
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  UIImage *trackImage;
  UIImage *progressImage;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  UIEdgeInsets result;

  trackImage = self->_trackImage;
  progressImage = self->_progressImage;
  if (trackImage)
  {
    if (progressImage)
    {
      -[UIImage size](progressImage, "size");
      v6 = v5;
      -[UIImage size](self->_trackImage, "size");
      if (v6 > v7)
      {
        progressImage = self->_progressImage;
LABEL_10:
        -[UIImage alignmentRectInsets](progressImage, "alignmentRectInsets");
        goto LABEL_12;
      }
      trackImage = self->_trackImage;
    }
    progressImage = trackImage;
    goto LABEL_10;
  }
  if (progressImage)
    goto LABEL_10;
  if (self->_progressViewStyle == 1)
  {
    v8 = 0.0;
    v9 = 1.0;
    v10 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIProgressView;
    -[UIView alignmentRectInsets](&v12, sel_alignmentRectInsets);
  }
LABEL_12:
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[UIView _canDrawContent](self, "_canDrawContent"))
  {
    -[UIProgressView sizeThatFits:](self, "sizeThatFits:", width, height);
    width = v8;
    height = v9;
  }
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (width != v11 || height != v13)
  {
    if (-[UIView _canDrawContent](self, "_canDrawContent"))
    {
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    }
    else if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    }
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  CGFloat width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "_standardOuterImageForStyle:barStyle:", self->_progressViewStyle, self->_barStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  if (self->_progressViewStyle)
  {
    UICeilToViewScale(self);
    v7 = v6;
  }
  else if (dyld_program_sdk_at_least())
  {
    v7 = 4.0;
  }
  else
  {
    v7 = 2.0;
  }

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)_standardOuterImageForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a1, "_indexForStyle:barStyle:");
  objc_msgSend(a1, "_fillImagesForIndex:style:barStyle:", v7, a3, a4);
  return _MergedGlobals_11_10[v7 + 3];
}

+ (unint64_t)_indexForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (a3 == 1 && (v7 & 0xFFFFFFFFFFFFFFFBLL) == 1 && a4 == 3)
    return (int)a3 + 1;
  else
    return (int)a3;
}

+ (void)_fillImagesForIndex:(unint64_t)a3 style:(int64_t)a4 barStyle:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  id v24;
  id v25;

  v23 = __defaultImageSuffixes[a3];
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (a5 != 3 && a4 == 1 && (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR("_Silver"));
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v10;
  }
  else
  {
    v11 = v23;
  }
  if (!_MergedGlobals_11_10[a3])
  {
    v24 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIProgressBarInner%@.png"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "size");
    objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, (v14 + -1.0) * 0.5, 0.0, (v14 + -1.0) * 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = _MergedGlobals_11_10[a3];
    _MergedGlobals_11_10[a3] = v15;

    v11 = v24;
  }
  v17 = &_MergedGlobals_11_10[a3];
  if (!v17[3])
  {
    v25 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIProgressBarOuter%@.png"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageWithName(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "size");
    objc_msgSend(v19, "resizableImageWithCapInsets:", 0.0, (v20 + -1.0) * 0.5, 0.0, (v20 + -1.0) * 0.5);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = v17[3];
    v17[3] = (id)v21;

    v11 = v25;
  }

}

void __90__UIProgressView__tintedImageWithTraitCollection_forHeight_andColors_roundingRectCorners___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  CGContext *v12;
  void *v13;
  void *v14;
  id v15;
  CGPoint v16;

  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 88);
  v9 = *(double *)(a1 + 96);
  v10 = a2;
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v3, v4, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CGContext *)objc_msgSend(v10, "CGContext");

  v15 = objc_retainAutorelease(v11);
  CGContextAddPath(v12, (CGPathRef)objc_msgSend(v15, "CGPath"));
  CGContextClip(v12);
  if (*(_BYTE *)(a1 + 120))
  {
    v16.y = *(CGFloat *)(a1 + 112);
    v16.x = 0.0;
    CGContextDrawLinearGradient(v12, *(CGGradientRef *)(a1 + 104), *MEMORY[0x1E0C9D538], v16, 0);
    CGGradientRelease(*(CGGradientRef *)(a1 + 104));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resolvedColorWithTraitCollection:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFill");

    CGContextFillRect(v12, *(CGRect *)(a1 + 48));
  }

}

+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5
{
  return +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:", a3, a5, -1, a4);
}

- (void)_updateImages
{
  UIImageView *v3;
  UIImageView *v4;
  UIImageView *trackView;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *progressView;
  void *v10;
  double Height;
  UIImageView *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  UIImageView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIImageView *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _QWORD v33[2];
  void *v34;
  _QWORD v35[3];
  CGRect v36;

  v35[2] = *MEMORY[0x1E0C80C00];
  if (!self->_trackView)
  {
    v3 = [UIImageView alloc];
    -[UIView bounds](self->_contentView, "bounds");
    v4 = -[UIImageView initWithFrame:](v3, "initWithFrame:");
    trackView = self->_trackView;
    self->_trackView = v4;

    -[UIProgressView _effectiveContentView](self, "_effectiveContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_trackView);

  }
  if (!self->_progressView)
  {
    v7 = [UIImageView alloc];
    v8 = -[UIImageView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    progressView = self->_progressView;
    self->_progressView = v8;

    -[UIProgressView _effectiveContentView](self, "_effectiveContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_progressView);

    -[UIView setAlpha:](self->_progressView, "setAlpha:", 1.0);
  }
  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v36);
  if (self->_trackImage)
  {
    v12 = self->_trackView;
    -[UIProgressView _appropriateTrackImage](self, "_appropriateTrackImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v12, "setImage:", v13);
    goto LABEL_17;
  }
  -[UIProgressView trackTintColor](self, "trackTintColor");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v30 = 0.0;
    v31 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    -[UIProgressView _defaultTrackColorForCurrentStyle](self, "_defaultTrackColorForCurrentStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0.0;
    v31 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    if (!v15)
      goto LABEL_12;
  }
  if (objc_msgSend(v15, "getRed:green:blue:alpha:", &v31, &v30, &v29, &v28))
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v31 * 0.978378378, v30 * 0.978378378, v29 * 0.978378378, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    v35[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
LABEL_12:
  v34 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (!objc_msgSend(v13, "isEqual:", self->_trackColors)
    || (-[UIImageView image](self->_trackView, "image"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    objc_storeStrong((id *)&self->_trackColors, v13);
    v18 = self->_trackView;
    -[UIView traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:", v19, self->_trackColors, -[UIProgressView _roundedCornersForTrackForCurrentStyle](self, "_roundedCornersForTrackForCurrentStyle"), Height);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v18, "setImage:", v20);

  }
LABEL_17:

  if (self->_progressImage)
  {
    -[UIProgressView _appropriateProgressImage](self, "_appropriateProgressImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_progressView, "setImage:", v21);
    if ((objc_msgSend(v21, "_isResizable") & 1) == 0)
      -[UIView setAlpha:](self->_progressView, "setAlpha:", 1.0);
    goto LABEL_31;
  }
  -[UIProgressView progressTintColor](self, "progressTintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21
    || (-[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor"),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = 0.0;
    v31 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0.0;
    v31 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    if (!v21)
      goto LABEL_26;
  }
  if (objc_msgSend(v21, "getRed:green:blue:alpha:", &v31, &v30, &v29, &v28))
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v31 * 0.978378378, v30 * 0.978378378, v29 * 0.978378378, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    v33[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
LABEL_26:
  v32 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
  if (!objc_msgSend(v23, "isEqual:", self->_progressColors)
    || (-[UIImageView image](self->_progressView, "image"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        !v24))
  {
    objc_storeStrong((id *)&self->_progressColors, v23);
    v25 = self->_progressView;
    -[UIView traitCollection](self, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIProgressView _tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:](UIProgressView, "_tintedImageWithTraitCollection:forHeight:andColors:roundingRectCorners:", v26, self->_progressColors, -[UIProgressView _roundedCornersForProgressForCurrentStyle](self, "_roundedCornersForProgressForCurrentStyle"), Height);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v25, "setImage:", v27);

  }
LABEL_31:

}

- (id)_effectiveContentView
{
  if (self->_contentView)
    self = (UIProgressView *)self->_contentView;
  return self;
}

- (UIColor)trackTintColor
{
  return self->_trackTintColor;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (id)_defaultTrackColorForCurrentStyle
{
  void *v2;

  if (self->_progressViewStyle)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (dyld_program_sdk_at_least())
      +[UIColor systemFillColor](UIColor, "systemFillColor");
    else
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.72265625, 0.72265625, 0.72265625, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)_roundedCornersForTrackForCurrentStyle
{
  if (self->_progressViewStyle)
    return 0;
  else
    return -1;
}

- (unint64_t)_roundedCornersForProgressForCurrentStyle
{
  if (self->_progressViewStyle)
    return 0;
  else
    return -1;
}

+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5 roundingRectCorners:(unint64_t)a6
{
  id v9;
  id v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  CGGradientRef v20;
  UIGraphicsImageRenderer *v21;
  void *v22;
  UIGraphicsImageRenderer *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  double v43;
  CGGradientRef v44;
  double v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "count");
  v12 = v11 > 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 < 2)
  {
    v20 = 0;
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v48;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v18), "resolvedColorWithTraitCollection:", v9);
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v13, "addObject:", objc_msgSend(v19, "CGColor"));

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v16);
    }

    v20 = CGGradientCreateWithColors(0, (CFArrayRef)v13, 0);
  }
  v21 = [UIGraphicsImageRenderer alloc];
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIGraphicsImageRenderer initWithSize:format:](v21, "initWithSize:format:", v22, a4 + a4 + 1.0, a4);

  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __90__UIProgressView__tintedImageWithTraitCollection_forHeight_andColors_roundingRectCorners___block_invoke;
  v34 = &unk_1E16DC5C0;
  v37 = 0;
  v38 = 0;
  v39 = a4 + a4 + 1.0;
  v40 = a4;
  v41 = a6;
  v42 = a4 * 0.5;
  v43 = a4 * 0.5;
  v46 = v12;
  v44 = v20;
  v45 = a4;
  v35 = v10;
  v36 = v9;
  v24 = v9;
  v25 = v10;
  -[UIGraphicsImageRenderer imageWithActions:](v23, "imageWithActions:", &v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, a4, 0.0, a4, v31, v32, v33, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a6 != -1)
  {
    objc_msgSend(v27, "imageFlippedForRightToLeftLayoutDirection");
    v29 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v29;
  }

  return v28;
}

- (UIProgressView)initWithProgressViewStyle:(UIProgressViewStyle)style
{
  UIProgressView *v4;
  UIProgressView *v5;

  v4 = -[UIProgressView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 160.0, 11.0);
  v5 = v4;
  if (v4)
    -[UIProgressView setProgressViewStyle:](v4, "setProgressViewStyle:", style);
  return v5;
}

- (UIProgressView)initWithFrame:(CGRect)frame
{
  UIProgressView *v3;
  UIProgressView *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIProgressView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIProgressView _setupProgressViewCommon](v3, "_setupProgressViewCommon");
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    LODWORD(v5) = 0;
    -[UIProgressView setProgress:](v4, "setProgress:", v5);
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v4;
}

- (void)setProgress:(float)progress
{
  double v3;
  float v4;

  v3 = fmin(progress, 1.0);
  if (v3 < 0.0)
    v3 = 0.0;
  v4 = v3;
  if (self->_progress != v4)
  {
    -[UIProgressView _setProgress:](self, "_setProgress:");
    if (-[UIView _canDrawContent](self, "_canDrawContent"))
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    else
      -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setProgressViewStyle:(UIProgressViewStyle)progressViewStyle
{
  _QWORD block[5];

  if (progressViewStyle < 2)
  {
    if (self->_progressViewStyle != progressViewStyle)
    {
      self->_progressViewStyle = progressViewStyle;
      -[UIImageView setImage:](self->_trackView, "setImage:", 0);
      -[UIImageView setImage:](self->_progressView, "setImage:", 0);
      -[UIProgressView _updateImages](self, "_updateImages");
      -[UIView sizeToFit](self, "sizeToFit");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__UIProgressView_setProgressViewStyle___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = progressViewStyle;
    if (setProgressViewStyle__onceToken != -1)
      dispatch_once(&setProgressViewStyle__onceToken, block);
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

uint64_t __66___UIProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgressValue");
}

+ (id)_standardInnerImageForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  uint64_t v7;

  v7 = objc_msgSend(a1, "_indexForStyle:barStyle:");
  objc_msgSend(a1, "_fillImagesForIndex:style:barStyle:", v7, a3, a4);
  return _MergedGlobals_11_10[v7];
}

- (UIProgressView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIProgressView *v5;
  uint64_t v6;
  UIColor *trackTintColor;
  uint64_t v8;
  UIColor *progressTintColor;
  uint64_t v10;
  UIImage *progressImage;
  uint64_t v12;
  UIImage *trackImage;
  objc_super v15;

  v4 = coder;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  v5 = -[UIView initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIProgressTrackTintColor")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIProgressTrackTintColor"));
      v6 = objc_claimAutoreleasedReturnValue();
      trackTintColor = v5->_trackTintColor;
      v5->_trackTintColor = (UIColor *)v6;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIProgressProgressTintColor")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIProgressProgressTintColor"));
      v8 = objc_claimAutoreleasedReturnValue();
      progressTintColor = v5->_progressTintColor;
      v5->_progressTintColor = (UIColor *)v8;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIProgressProgressImage")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIProgressProgressImage"));
      v10 = objc_claimAutoreleasedReturnValue();
      progressImage = v5->_progressImage;
      v5->_progressImage = (UIImage *)v10;

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UIProgressTrackImage")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIProgressTrackImage"));
      v12 = objc_claimAutoreleasedReturnValue();
      trackImage = v5->_trackImage;
      v5->_trackImage = (UIImage *)v12;

    }
    -[UIProgressView _setupProgressViewCommon](v5, "_setupProgressViewCommon");
    -[UIProgressView setProgressViewStyle:](v5, "setProgressViewStyle:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UIProgressViewStyle")));
    -[NSCoder decodeFloatForKey:](v4, "decodeFloatForKey:", CFSTR("UIProgress"));
    -[UIProgressView setProgress:](v5, "setProgress:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t progressViewStyle;
  UIColor *trackTintColor;
  UIColor *progressTintColor;
  UIImage *trackImage;
  UIImage *progressImage;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIProgressView;
  -[UIView encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  progressViewStyle = self->_progressViewStyle;
  if (progressViewStyle)
    objc_msgSend(v4, "encodeInteger:forKey:", progressViewStyle, CFSTR("UIProgressViewStyle"));
  if (self->_progress != 0.0)
    objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("UIProgress"));
  trackTintColor = self->_trackTintColor;
  if (trackTintColor)
    objc_msgSend(v4, "encodeObject:forKey:", trackTintColor, CFSTR("UIProgressTrackTintColor"));
  progressTintColor = self->_progressTintColor;
  if (progressTintColor)
    objc_msgSend(v4, "encodeObject:forKey:", progressTintColor, CFSTR("UIProgressProgressTintColor"));
  trackImage = self->_trackImage;
  if (trackImage)
    objc_msgSend(v4, "encodeObject:forKey:", trackImage, CFSTR("UIProgressTrackImage"));
  progressImage = self->_progressImage;
  if (progressImage)
    objc_msgSend(v4, "encodeObject:forKey:", progressImage, CFSTR("UIProgressProgressImage"));

}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIProgressView;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_progressView)
    objc_msgSend(v4, "removeObject:");
  if (self->_trackView)
    objc_msgSend(v4, "removeObject:");
  if (self->_effectView)
    objc_msgSend(v4, "removeObject:");
  if (self->_contentView)
    objc_msgSend(v4, "removeObject:");

}

void __39__UIProgressView_setProgressViewStyle___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("A UIProgressViewStyle of %ld is not supported. Please choose a different style"), *(_QWORD *)(a1 + 32));
}

- (BOOL)_shouldTintProgress
{
  return self->_progressTintColor != 0;
}

- (BOOL)_shouldTintTrack
{
  return self->_trackTintColor != 0;
}

- (id)_appropriateTrackImage
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  UIImage *trackImage;
  UIImage *v14;

  if (-[UIView _canDrawContent](self, "_canDrawContent"))
  {
    v3 = 0;
  }
  else
  {
    -[UIImageView image](self->_trackView, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UIProgressView _shouldTintTrack](self, "_shouldTintTrack") || v3)
    {
      trackImage = self->_trackImage;
      if (trackImage)
      {
        v14 = trackImage;

        v3 = v14;
        return v3;
      }
    }
    else
    {
      if (self->_progressViewStyle == 1)
        v4 = CFSTR("Bar");
      else
        v4 = CFSTR("Default");
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("UIProgressBarCustomMaskOuter_%@.png"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIProgressBarCustomShineOuter_%@.png"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      _UIImageWithName(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _UIImageWithName(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", self->_trackTintColor, v10, v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      objc_msgSend(v11, "resizableImageWithCapInsets:", 0.0, (v12 + -1.0) * 0.5, 0.0, (v12 + -1.0) * 0.5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v3)
    {
      objc_msgSend((id)objc_opt_class(), "_standardOuterImageForStyle:barStyle:", self->_progressViewStyle, self->_barStyle);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_appropriateProgressImage
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  UIImage *progressImage;
  UIImage *v14;

  if (-[UIView _canDrawContent](self, "_canDrawContent"))
  {
    v3 = 0;
  }
  else
  {
    -[UIImageView image](self->_progressView, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UIProgressView _shouldTintProgress](self, "_shouldTintProgress") || v3)
    {
      progressImage = self->_progressImage;
      if (progressImage)
      {
        v14 = progressImage;

        v3 = v14;
        return v3;
      }
    }
    else
    {
      if (self->_progressViewStyle == 1)
        v4 = CFSTR("Bar");
      else
        v4 = CFSTR("Default");
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("UIProgressBarCustomMaskInner_%@.png"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIProgressBarCustomShineInner_%@.png"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      _UIImageWithName(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _UIImageWithName(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", self->_progressTintColor, v10, v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "size");
      objc_msgSend(v11, "resizableImageWithCapInsets:", 0.0, (v12 + -1.0) * 0.5, 0.0, (v12 + -1.0) * 0.5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v3)
    {
      objc_msgSend((id)objc_opt_class(), "_standardInnerImageForStyle:barStyle:", self->_progressViewStyle, self->_barStyle);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (void)_setupShadow
{
  UIView *v3;
  UIView *v4;
  UIView *shadowView;
  double v6;
  void *v7;
  double v8;
  id v9;

  if (!self->_shadowView)
  {
    v3 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    -[UIView setOpaque:](self->_shadowView, "setOpaque:", 0);
    -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", 0);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
    -[UIView layer](self->_shadowView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_contentView, "frame");
    objc_msgSend(v9, "setContents:", +[_UIStretchableShadow shadowWithRadius:cornerRadius:](_UIStretchableShadow, "shadowWithRadius:cornerRadius:", 5.0, floor(v6 * 0.5)));
    objc_msgSend(v9, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView _shadowOpacityForUserInterfaceStyle:](self, "_shadowOpacityForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    *(float *)&v8 = v8;
    objc_msgSend(v9, "setOpacity:", v8);

    -[UIProgressView _layoutShadow](self, "_layoutShadow");
    -[UIView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_layoutShadow
{
  double v3;
  double v4;
  CGFloat v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  -[UIView bounds](self, "bounds");
  v3 = CGRectGetHeight(v6) * 0.5;
  if (v3 >= 3.0)
    v4 = -2.0;
  else
    v4 = v3 + -5.0;
  -[UIView bounds](self, "bounds");
  v5 = CGRectGetWidth(v7) + 10.0 + 6.0;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_shadowView, "setFrame:", -8.0, v4, v5, CGRectGetHeight(v8) + 10.0);
}

- (double)_shadowOpacityForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3;
  double result;

  v3 = a3 == 2 || a3 == 1000;
  result = 0.2;
  if (v3)
    return 0.5;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIProgressView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  if (dyld_program_sdk_at_least())
    -[UIProgressView _updateImages](self, "_updateImages");
}

- (void)setObservedProgress:(NSProgress *)observedProgress
{
  NSProgress *v5;
  NSObservation *progressObservation;
  void *v7;
  NSObservation *v8;
  NSObservation *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = observedProgress;
  if ((-[NSProgress isEqual:](v5, "isEqual:", self->_observedProgress) & 1) == 0)
  {
    -[NSObservation finishObserving](self->_progressObservation, "finishObserving");
    progressObservation = self->_progressObservation;
    self->_progressObservation = 0;

    objc_storeStrong((id *)&self->_observedProgress, observedProgress);
    if (self->_observedProgress)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", self, "observedProgress.fractionCompleted");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __38__UIProgressView_setObservedProgress___block_invoke;
      v10[3] = &unk_1E16DC498;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v7, "addObserverBlock:", v10);
      v8 = (NSObservation *)objc_claimAutoreleasedReturnValue();
      v9 = self->_progressObservation;
      self->_progressObservation = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

}

void __38__UIProgressView_setObservedProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__UIProgressView_setObservedProgress___block_invoke_2;
  v5[3] = &unk_1E16B1500;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __38__UIProgressView_setObservedProgress___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  double v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observedProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    *(float *)&v5 = v5;
    objc_msgSend(v6, "_setProgressAnimated:duration:delay:options:", 4, v5, 0.1, 0.0);

  }
}

- (void)_setProgress:(float)a3
{
  self->_progress = a3;
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
  double v6;
  float v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  if (!animated)
    goto LABEL_5;
  if (-[UIView _canDrawContent](self, "_canDrawContent"))
  {
    if (setProgress_animated__onceToken != -1)
      dispatch_once(&setProgress_animated__onceToken, &__block_literal_global_444);
LABEL_5:
    *(float *)&v6 = progress;
    -[UIProgressView setProgress:](self, "setProgress:", v6);
    return;
  }
  v7 = vabds_f32(self->_progress, progress);
  -[UIImageView image](self->_progressView, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isResizable"))
  {
    if (progress == 0.0)
    {

      goto LABEL_11;
    }
    -[UIView alpha](self->_progressView, "alpha");
    v11 = v10;

    if (v11 == 0.0)
    {
LABEL_11:
      v9 = v7;
      if (v7 <= 0.2)
        v7 = 0.2;
    }
  }
  else
  {

  }
  *(float *)&v9 = progress;
  -[UIProgressView _setProgressAnimated:duration:delay:options:](self, "_setProgressAnimated:duration:delay:options:", 196612, v9, v7, 0.0);
}

void __39__UIProgressView_setProgress_animated___block_invoke()
{
  NSLog(CFSTR("-[UIProgressView setProgress:animated:] will not animate when -drawRect: has been overridden."));
}

- (void)_setProgressAnimated:(float)a3 duration:(double)a4 delay:(double)a5 options:(unint64_t)a6
{
  double v7;
  float v8;
  _QWORD v12[5];
  _QWORD v13[5];

  v7 = fmin(a3, 1.0);
  if (v7 < 0.0)
    v7 = 0.0;
  v8 = v7;
  if (self->_progress != v8)
  {
    self->_isAnimating = 1;
    -[UIProgressView _setProgress:](self, "_setProgress:");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v12[4] = self;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke_2;
    v12[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", a6, v13, v12, a4, a5);
  }
}

uint64_t __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutBelowIfNeeded");
}

uint64_t __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 480) = 0;
  return result;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
  UIColor *v5;
  UIImage *progressImage;
  UIColor *v7;

  v5 = progressTintColor;
  if (self->_progressTintColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_progressTintColor, progressTintColor);
    progressImage = self->_progressImage;
    self->_progressImage = 0;

    -[UIImageView setImage:](self->_progressView, "setImage:", 0);
    -[UIProgressView _updateImages](self, "_updateImages");
    v5 = v7;
    if (!self->_isAnimating)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (void)setProgressImage:(UIImage *)progressImage
{
  UIImage *v5;
  UIColor *progressTintColor;
  UIImage *v7;

  v5 = progressImage;
  if (self->_progressImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_progressImage, progressImage);
    progressTintColor = self->_progressTintColor;
    self->_progressTintColor = 0;

    -[UIImageView setImage:](self->_progressView, "setImage:", 0);
    -[UIProgressView _updateImages](self, "_updateImages");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v7;
    if (!self->_isAnimating)
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
  UIColor *v5;
  UIImage *trackImage;
  UIColor *v7;

  v5 = trackTintColor;
  if (self->_trackTintColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_trackTintColor, trackTintColor);
    trackImage = self->_trackImage;
    self->_trackImage = 0;

    -[UIImageView setImage:](self->_trackView, "setImage:", 0);
    -[UIProgressView _updateImages](self, "_updateImages");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTrackImage:(UIImage *)trackImage
{
  UIImage *v5;
  UIColor *trackTintColor;
  UIImage *v7;

  v5 = trackImage;
  if (self->_trackImage != v5)
  {
    trackTintColor = self->_trackTintColor;
    self->_trackTintColor = 0;
    v7 = v5;

    objc_storeStrong((id *)&self->_trackImage, trackImage);
    -[UIImageView setImage:](self->_trackView, "setImage:", 0);
    -[UIProgressView _updateImages](self, "_updateImages");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v7;
  }

}

- (void)_reducedTransparencyDidChange:(id)a3
{
  uint64_t v4;
  id v5;

  if (_AXSEnhanceBackgroundContrastEnabled())
    v4 = 4010;
  else
    v4 = 5001;
  +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:](UIBlurEffect, "_effectWithStyle:invertAutomaticStyle:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v5);

}

- (UIProgressViewStyle)progressViewStyle
{
  return self->_progressViewStyle;
}

- (float)progress
{
  return self->_progress;
}

- (UIImage)trackImage
{
  return self->_trackImage;
}

- (UIImage)progressImage
{
  return self->_progressImage;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressImage, 0);
  objc_storeStrong((id *)&self->_trackImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_progressObservation, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_progressColors, 0);
  objc_storeStrong((id *)&self->_trackColors, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_trackTintColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    -[UIProgressView _updateImages](self, "_updateImages");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 160.0;
  v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
