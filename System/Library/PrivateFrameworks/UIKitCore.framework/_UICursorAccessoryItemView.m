@implementation _UICursorAccessoryItemView

+ (id)_makeLabelView
{
  UILabel *v2;
  UILabel *v3;
  void *v4;

  v2 = [UILabel alloc];
  v3 = -[UILabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[_UICursorAccessoryView baseFontSize](_UICursorAccessoryView, "baseFontSize");
  objc_msgSend(off_1E167A828, "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3, "setFont:", v4);

  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1);
  return v3;
}

+ (id)_makeImageView
{
  UIImageView *v2;
  void *v3;

  v2 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", 0);
  -[UIImageView setContentMode:](v2, "setContentMode:", 1);
  +[_UICursorAccessoryView baseFontSize](_UICursorAccessoryView, "baseFontSize");
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](v2, "setPreferredSymbolConfiguration:", v3);

  return v2;
}

- (_UICursorAccessoryItemView)initWithFrame:(CGRect)a3
{
  _UICursorAccessoryItemView *v3;
  _UICursorAccessoryItemView *v4;
  void *v5;
  void *v6;
  _UIShapeView *v7;
  uint64_t v8;
  _UIShapeView *backgroundView;
  void *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UICursorAccessoryItemView;
  v3 = -[UIControl initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_roundedEdges = 10;
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    v7 = [_UIShapeView alloc];
    v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (_UIShapeView *)v8;

    -[UIView setUserInteractionEnabled:](v4->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView insertSubview:atIndex:](v4, "insertSubview:atIndex:", v4->_backgroundView, 0);
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v10, sel__recomputeColors);

    -[_UICursorAccessoryItemView _recomputeColors](v4, "_recomputeColors");
    -[UIView _setDisableDictationTouchCancellation:](v4, "_setDisableDictationTouchCancellation:", 1);
  }
  return v4;
}

- (BOOL)isActive
{
  return self->_style == 1;
}

- (double)horizontalPadding
{
  double result;

  result = 10.0;
  if (self->_content.type == 3)
    return 3.0;
  return result;
}

- (void)_recomputeColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t style;
  uint64_t v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  _QWORD v28[5];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v26 = _recomputeColors___s_category;
    if (!_recomputeColors___s_category)
    {
      v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v26, (unint64_t *)&_recomputeColors___s_category);
    }
    v27 = *(NSObject **)(v26 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 6)
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    style = self->_style;
    if (style == 1)
    {
      -[UIView tintColor](self, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UICursorAccessoryView grayscaleLuminance:](_UICursorAccessoryView, "grayscaleLuminance:", v15);
      v17 = v16;

      if (v17 <= 0.75)
      {
        +[UIColor whiteColor](UIColor, "whiteColor");
        v11 = objc_claimAutoreleasedReturnValue();
        v18 = (id *)MEMORY[0x1E0CD2EA0];
        v13 = 0.95;
      }
      else
      {
        +[UIColor blackColor](UIColor, "blackColor");
        v11 = objc_claimAutoreleasedReturnValue();
        v18 = (id *)MEMORY[0x1E0CD2E98];
        v13 = 0.7;
      }

      v12 = *v18;
      if (!self->_highlighted)
        goto LABEL_17;
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
      v19 = objc_claimAutoreleasedReturnValue();
      v14 = v9;
    }
    else
    {
      if (style == 2)
      {
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v13 = 1.0;
        v14 = v8;
LABEL_16:

LABEL_17:
        v8 = (void *)v11;
LABEL_18:
        v20 = objc_retainAutorelease(v9);
        v21 = objc_msgSend(v20, "CGColor");
        -[_UIShapeView shapeLayer](self->_backgroundView, "shapeLayer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFillColor:", v21);

        -[UIView setTintColor:](self->_imageView, "setTintColor:", v8);
        -[UIView setAlpha:](self->_imageView, "setAlpha:", v13);
        -[UIView layer](self->_imageView, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCompositingFilter:", v12);

        -[UILabel setTextColor:](self->_labelView, "setTextColor:", v8);
        -[UIView setAlpha:](self->_labelView, "setAlpha:", v13);
        -[UIView layer](self->_labelView, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCompositingFilter:", v12);

        goto LABEL_19;
      }
      if (!self->_highlighted)
      {
        v12 = 0;
        v13 = 1.0;
        goto LABEL_18;
      }
      +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
      v19 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v14 = v9;
      v13 = 1.0;
      v11 = (uint64_t)v8;
    }
    v9 = (void *)v19;
    goto LABEL_16;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __46___UICursorAccessoryItemView__recomputeColors__block_invoke;
  v28[3] = &unk_1E16B1B28;
  v28[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v28, &__block_literal_global_252, 0.05, 0.0);
LABEL_19:
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  _UICursorAccessoryItemView *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  _UICursorAccessoryItemView *v18;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    -[_UICursorAccessoryItemView _recomputeColors](self, "_recomputeColors");
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 6)
    {
      if (v3)
      {
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __45___UICursorAccessoryItemView_setHighlighted___block_invoke;
        v17 = &unk_1E16B1B28;
        v18 = self;
        v7 = &__block_literal_global_14_3;
        v8 = &v14;
      }
      else
      {
        v9 = MEMORY[0x1E0C809B0];
        v10 = 3221225472;
        v11 = __45___UICursorAccessoryItemView_setHighlighted___block_invoke_3;
        v12 = &unk_1E16B1B28;
        v13 = self;
        v7 = &__block_literal_global_15_2;
        v8 = &v9;
      }
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, v7, 0.05, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[_UICursorAccessoryItemView _recomputeColors](self, "_recomputeColors");
}

- (void)setRoundedEdges:(unint64_t)a3
{
  self->_roundedEdges = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContent:(id *)a3
{
  $6EE0367BC1424C67B912F121DA160B19 *p_content;
  unint64_t type;
  UIImageView *imageView;
  UIImageView *v8;
  UIImageView *v9;
  void **p_labelView;
  UILabel *labelView;
  UILabel *v12;
  UILabel *v13;
  void *v14;

  p_content = &self->_content;
  __copy_assignment_8_8_s0_s8_t16w8((uint64_t)&self->_content, (uint64_t)a3);
  type = p_content->type;
  if (type - 2 < 2)
  {
    imageView = self->_imageView;
    if (!imageView)
    {
      objc_msgSend((id)objc_opt_class(), "_makeImageView");
      v8 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      v9 = self->_imageView;
      self->_imageView = v8;

      -[UIView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setImage:](imageView, "setImage:", a3->var1);
    p_labelView = (void **)&self->_labelView;
    -[UIView removeFromSuperview](self->_labelView, "removeFromSuperview");
LABEL_9:
    v14 = *p_labelView;
    *p_labelView = 0;

    goto LABEL_10;
  }
  if (type == 1)
  {
    labelView = self->_labelView;
    if (!labelView)
    {
      objc_msgSend((id)objc_opt_class(), "_makeLabelView");
      v12 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v13 = self->_labelView;
      self->_labelView = v12;

      -[UILabel setUserInteractionEnabled:](self->_labelView, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_labelView);
      labelView = self->_labelView;
    }
    -[UILabel setText:](labelView, "setText:", a3->var0);
    p_labelView = (void **)&self->_imageView;
    -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
    goto LABEL_9;
  }
LABEL_10:
  -[_UICursorAccessoryItemView _recomputeColors](self, "_recomputeColors");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  unint64_t type;
  double v4;
  double v5;
  NSString *label;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD v15[2];
  CGSize result;

  v15[1] = *MEMORY[0x1E0C80C00];
  type = self->_content.type;
  if (type == 1)
  {
    label = self->_content.label;
    v14 = *(_QWORD *)off_1E1678D90;
    -[UILabel font](self->_labelView, "font", a3.width, a3.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString sizeWithAttributes:](label, "sizeWithAttributes:", v8);
    v4 = v9;

  }
  else
  {
    if (type == 3)
    {
      -[UIImage size](self->_content.image, "size", a3.width, a3.height);
      goto LABEL_10;
    }
    v4 = 0.0;
    if (type == 2)
    {
      +[_UICursorAccessoryView glyphWidth](_UICursorAccessoryView, "glyphWidth", a3.width, a3.height);
      v4 = v5;
    }
  }
  +[_UICursorAccessoryView glyphWidth](_UICursorAccessoryView, "glyphWidth");
  if (v10 >= v4)
    v4 = v10;
  +[_UICursorAccessoryView glyphHeight](_UICursorAccessoryView, "glyphHeight");
  v12 = v11;
  v13 = v4;
LABEL_10:
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  UILabel *labelView;
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
  double v26;
  UIImageView *imageView;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unint64_t roundedEdges;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  objc_super v58;
  CGRect v59;

  v58.receiver = self;
  v58.super_class = (Class)_UICursorAccessoryItemView;
  -[UIView layoutSubviews](&v58, sel_layoutSubviews);
  labelView = self->_labelView;
  if (labelView)
  {
    -[UIView sizeToFit](labelView, "sizeToFit");
    -[UIView bounds](self->_labelView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UIView contentScaleFactor](self, "contentScaleFactor");
    -[UILabel setFrame:](self->_labelView, "setFrame:", UIRectCenteredIntegralRectScale(v5, v7, v9, v11, v13, v15, v17, v19, v20));
  }
  if (self->_imageView)
  {
    if (self->_content.type == 3)
    {
      v21 = *MEMORY[0x1E0C9D538];
      v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[UIImage size](self->_content.image, "size");
      v24 = v23;
      v26 = v25;
      imageView = self->_imageView;
      v28 = v21;
      v29 = v22;
    }
    else
    {
      +[_UICursorAccessoryView glyphWidth](_UICursorAccessoryView, "glyphWidth");
      v31 = v30;
      +[_UICursorAccessoryView glyphHeight](_UICursorAccessoryView, "glyphHeight");
      v26 = v32;
      imageView = self->_imageView;
      v28 = 0.0;
      v29 = 0.0;
      v24 = v31;
    }
    -[UIImageView setBounds:](imageView, "setBounds:", v28, v29, v24, v26);
    -[UIView traitCollection](self, "traitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "userInterfaceIdiom");

    if (v34 == 6)
    {
      -[UIView bounds](self, "bounds");
      v36 = v35;
      -[UIView bounds](self, "bounds");
      -[UIImageView setBounds:](self->_imageView, "setBounds:", v36);
    }
    -[UIView bounds](self, "bounds");
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v38 + v37 * 0.5, v40 + v39 * 0.5);
    v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v57.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v57.c = v41;
    *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (self->_style == 2)
      CGAffineTransformMakeScale(&v57, 0.78, 0.78);
    v56 = v57;
    -[UIView setTransform:](self->_imageView, "setTransform:", &v56);
  }
  if (self->_backgroundView)
  {
    -[UIView traitCollection](self, "traitCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "userInterfaceIdiom");

    -[UIView bounds](self, "bounds");
    v45 = v44;
    if (v43 == 6)
    {
      -[UIView bounds](self, "bounds");
      -[UIView setBounds:](self->_backgroundView, "setBounds:", v45);
      -[_UIShapeView shapeLayer](self->_backgroundView, "shapeLayer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setCornerRadius:", 22.0);

      -[UIView bounds](self, "bounds");
      -[UIView setCenter:](self->_backgroundView, "setCenter:", v48 + v47 * 0.5, v50 + v49 * 0.5);
    }
    else
    {
      -[UIView setFrame:](self->_backgroundView, "setFrame:", v44);
      roundedEdges = self->_roundedEdges;
      if ((roundedEdges & 8) != 0)
        v52 = ((uint64_t)(roundedEdges << 62) >> 63) & 5 | 0xA;
      else
        v52 = ((uint64_t)(roundedEdges << 62) >> 63) & 5;
      -[UIView bounds](self, "bounds");
      CGRectGetHeight(v59);
      -[UIView bounds](self, "bounds");
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v52);
      v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v54 = objc_msgSend(v53, "CGPath");
      -[_UIShapeView shapeLayer](self->_backgroundView, "shapeLayer");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setPath:", v54);

    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[_UICursorAccessoryItemView setHighlighted:](self, "setHighlighted:", 1);
  v9.receiver = self;
  v9.super_class = (Class)_UICursorAccessoryItemView;
  LOBYTE(self) = -[UIControl beginTrackingWithTouch:withEvent:](&v9, sel_beginTrackingWithTouch_withEvent_, v7, v6);

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryItemView;
  -[UIControl endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  -[_UICursorAccessoryItemView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UICursorAccessoryItemView;
  -[UIControl cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[_UICursorAccessoryItemView setHighlighted:](self, "setHighlighted:", 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)roundedEdges
{
  return self->_roundedEdges;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- ($90CBC7AD7F202ACD7E5E12C06C780520)content
{
  $6EE0367BC1424C67B912F121DA160B19 *p_content;
  $90CBC7AD7F202ACD7E5E12C06C780520 *result;
  unint64_t type;

  p_content = &self->_content;
  retstr->var0 = self->_content.label;
  result = p_content->image;
  type = p_content->type;
  retstr->var1 = result;
  retstr->var2 = type;
  return result;
}

- (void).cxx_destruct
{
  $6EE0367BC1424C67B912F121DA160B19 *p_content;

  p_content = &self->_content;

  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end
