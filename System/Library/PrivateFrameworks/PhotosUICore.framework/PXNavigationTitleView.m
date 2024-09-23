@implementation PXNavigationTitleView

- (PXNavigationTitleView)initWithFrame:(CGRect)a3
{
  PXNavigationTitleView *v3;
  PXNavigationTitleView *v4;
  UILabel *v5;
  UILabel *titleLabel;
  double v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  double v10;
  uint64_t v11;
  UIFont *titleFont;
  uint64_t v13;
  UIFont *subtitleFont;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXNavigationTitleView;
  v3 = -[PXNavigationTitleView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_textAlignment = 1;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->__titleLabel;
    v4->__titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->__titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setMinimumScaleFactor:](v4->__titleLabel, "setMinimumScaleFactor:", 0.75);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->__titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](v4->__titleLabel, "setTextAlignment:", v4->_textAlignment);
    LODWORD(v7) = 1144766464;
    -[UILabel setContentHuggingPriority:forAxis:](v4->__titleLabel, "setContentHuggingPriority:forAxis:", 1, v7);
    -[PXNavigationTitleView addSubview:](v4, "addSubview:", v4->__titleLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->__subtitleLabel;
    v4->__subtitleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->__subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v4->__subtitleLabel, "setTextAlignment:", v4->_textAlignment);
    LODWORD(v10) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->__subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    -[PXNavigationTitleView addSubview:](v4, "addSubview:", v4->__subtitleLabel);
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v11 = objc_claimAutoreleasedReturnValue();
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v11;

    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v13 = objc_claimAutoreleasedReturnValue();
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v13;

    __asm { FMOV            V1.2D, #6.0 }
    *(_OWORD *)&v4->_margins.top = xmmword_1A7C0C400;
    *(_OWORD *)&v4->_margins.bottom = _Q1;
    v4->_verticalSizeClass = 0;
    v4->_needsUpdateFlags = ($5C3876A65A6267886F64C983D29579CA)16843009;
    -[PXNavigationTitleView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXNavigationTitleView _updateIfNeeded](v4, "_updateIfNeeded");
  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v26;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  -[PXNavigationTitleView _constraints](self, "_constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v30[0] = CFSTR("titleLabel");
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("subtitleLabel");
    v31[0] = v4;
    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXNavigationTitleView margins](self, "margins");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v28[0] = CFSTR("leftMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    v28[1] = CFSTR("rightMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    v28[2] = CFSTR("topMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    v28[3] = CFSTR("bottomMargin");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[PXNavigationTitleView _isSubtitleVisible](self, "_isSubtitleVisible");
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(==leftMargin)-[titleLabel]-(==rightMargin)-|"), 0, v18, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

    v21 = (void *)MEMORY[0x1E0CB3718];
    if ((_DWORD)v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(==leftMargin)-[subtitleLabel]-(==rightMargin)-|"), 0, v18, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v22);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=topMargin@747)-[titleLabel]"), 0, v18, v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v23);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[titleLabel]-[subtitleLabel]"), 0x80000, v18, v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v24);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[subtitleLabel]-(>=bottomMargin@749)-|"), 0, v18, v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v25);
    }
    else
    {
      -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 10, 0, self, 10, 1.0, 0.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v26);

    }
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
    -[PXNavigationTitleView addConstraints:](self, "addConstraints:", v19);
    -[PXNavigationTitleView _setConstraints:](self, "_setConstraints:", v19);

  }
  v27.receiver = self;
  v27.super_class = (Class)PXNavigationTitleView;
  -[PXNavigationTitleView updateConstraints](&v27, sel_updateConstraints);
}

- (void)setMargins:(UIEdgeInsets)a3
{
  if (a3.left != self->_margins.left
    || a3.top != self->_margins.top
    || a3.right != self->_margins.right
    || a3.bottom != self->_margins.bottom)
  {
    self->_margins = a3;
    -[PXNavigationTitleView _invalidateConstraints](self, "_invalidateConstraints");
    -[PXNavigationTitleView _invalidateSize](self, "_invalidateSize");
  }
}

- (void)_setSubtitleVisible:(BOOL)a3
{
  if (self->__subtitleVisible != a3)
  {
    self->__subtitleVisible = a3;
    -[PXNavigationTitleView _invalidateConstraints](self, "_invalidateConstraints");
  }
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  if (self->_verticalSizeClass != a3)
  {
    self->_verticalSizeClass = a3;
    -[PXNavigationTitleView _invalidateTexts](self, "_invalidateTexts");
    -[PXNavigationTitleView _invalidateSize](self, "_invalidateSize");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[PXNavigationTitleView _invalidateTexts](self, "_invalidateTexts");
    v5 = v6;
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[PXNavigationTitleView _invalidateTexts](self, "_invalidateTexts");
    v5 = v6;
  }

}

- (void)setTitleTextColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_titleTextColor != v6)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (void)setSubtitleTextColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_subtitleTextColor != v6)
  {
    objc_storeStrong((id *)&self->_subtitleTextColor, a3);
    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (void)setTitleFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[PXNavigationTitleView _invalidateFonts](self, "_invalidateFonts");
    v5 = v6;
  }

}

- (void)setSubtitleFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_subtitleFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    -[PXNavigationTitleView _invalidateFonts](self, "_invalidateFonts");
    v5 = v6;
  }

}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;
  id v6;

  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", a3);

    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", a3);

  }
}

- (void)performChanges:(id)a3
{
  id v5;
  _BOOL4 isPerformingChanges;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationTitleView.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nil != changeBlock"), 0);

    if (self->_isPerformingChanges)
      goto LABEL_4;
    goto LABEL_3;
  }
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(void))v5 + 2))();
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
LABEL_3:
    -[PXNavigationTitleView _updateIfNeeded](self, "_updateIfNeeded");
LABEL_4:

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.texts
      || self->_needsUpdateFlags.fonts
      || self->_needsUpdateFlags.constraints
      || self->_needsUpdateFlags.size;
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PXNavigationTitleView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXNavigationTitleView _updateFontsIfNeeded](self, "_updateFontsIfNeeded");
    -[PXNavigationTitleView _updateTextsIfNeeded](self, "_updateTextsIfNeeded");
    -[PXNavigationTitleView _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
    -[PXNavigationTitleView _updateSizeIfNeeded](self, "_updateSizeIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PXNavigationTitleView _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationTitleView.m"), 251, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationTitleView.m"), 255, CFSTR("not inside -performChanges: or _updateIfNeeded"));

  }
}

- (void)_invalidateTexts
{
  self->_needsUpdateFlags.texts = 1;
  -[PXNavigationTitleView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateTextsIfNeeded
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void *, void *, void *);
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  if (self->_needsUpdateFlags.texts)
  {
    self->_needsUpdateFlags.texts = 0;
    v3 = -[PXNavigationTitleView _isSubtitleVisible](self, "_isSubtitleVisible");
    -[PXNavigationTitleView title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationTitleView subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXNavigationTitleView verticalSizeClass](self, "verticalSizeClass") == 1)
    {

      v5 = 0;
    }
    -[PXNavigationTitleView titleFont](self, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXNavigationTitleView subtitleFont](self, "subtitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke_2;
    aBlock[3] = &unk_1E511D538;
    aBlock[4] = &v14;
    v10 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11, v7);

    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12, v9);

    -[PXNavigationTitleView _setSubtitleVisible:](self, "_setSubtitleVisible:", objc_msgSend(v9, "length") != 0);
    if (v3 != -[PXNavigationTitleView _isSubtitleVisible](self, "_isSubtitleVisible"))
      -[PXNavigationTitleView _invalidateConstraints](self, "_invalidateConstraints");
    if (*((_BYTE *)v15 + 24))
      -[PXNavigationTitleView _invalidateSize](self, "_invalidateSize");

    _Block_object_dispose(&v14, 8);
  }
}

- (void)_invalidateFonts
{
  self->_needsUpdateFlags.fonts = 1;
  -[PXNavigationTitleView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateFontsIfNeeded
{
  void (**v3)(void *, void *, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (self->_needsUpdateFlags.fonts)
  {
    self->_needsUpdateFlags.fonts = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PXNavigationTitleView__updateFontsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E511D560;
    aBlock[4] = &v9;
    v3 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationTitleView titleFont](self, "titleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v4, v5);

    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationTitleView subtitleFont](self, "subtitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v6, v7);

    if (*((_BYTE *)v10 + 24))
      -[PXNavigationTitleView _invalidateSize](self, "_invalidateSize");

    _Block_object_dispose(&v9, 8);
  }
}

- (void)_invalidateConstraints
{
  self->_needsUpdateFlags.constraints = 1;
  -[PXNavigationTitleView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateConstraintsIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.constraints)
  {
    self->_needsUpdateFlags.constraints = 0;
    -[PXNavigationTitleView _constraints](self, "_constraints");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v3);
    -[PXNavigationTitleView removeConstraints:](self, "removeConstraints:", v3);
    -[PXNavigationTitleView _setConstraints:](self, "_setConstraints:", 0);
    -[PXNavigationTitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
}

- (void)_invalidateSize
{
  self->_needsUpdateFlags.size = 1;
  -[PXNavigationTitleView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSizeIfNeeded
{
  double *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  id v14;

  if (self->_needsUpdateFlags.size)
  {
    self->_needsUpdateFlags.size = 0;
    v3 = (double *)MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *v3;
    objc_msgSend(v5, "sizeThatFits:", *v3, v4);
    v8 = v7;

    if (-[PXNavigationTitleView _isSubtitleVisible](self, "_isSubtitleVisible"))
    {
      -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sizeThatFits:", v6, v4);
      v11 = v10;

      if (v8 < v11)
        v8 = v11;
    }
    v12 = -[PXNavigationTitleView verticalSizeClass](self, "verticalSizeClass");
    if (v12 == 1)
    {
      if (-[PXNavigationTitleView _isSubtitleVisible](self, "_isSubtitleVisible"))
        v13 = 42.0;
      else
        v13 = 32.0;
    }
    else if (v12)
    {
      v13 = v4;
    }
    else
    {
      v13 = 44.0;
    }
    -[PXNavigationTitleView setBounds:](self, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v8, v13);
    -[PXNavigationTitleView superview](self, "superview");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)setSubviewsAlpha:(double)a3
{
  void *v5;
  id v6;

  if (self->_subviewsAlpha != a3)
  {
    self->_subviewsAlpha = a3;
    -[PXNavigationTitleView _titleLabel](self, "_titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", a3);

    -[PXNavigationTitleView _subtitleLabel](self, "_subtitleLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", a3);

  }
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)subviewsAlpha
{
  return self->_subviewsAlpha;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (BOOL)_isSubtitleVisible
{
  return self->__subtitleVisible;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (void)_setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __45__PXNavigationTitleView__updateFontsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "font");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v9, "setFont:", v5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

id __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v6 = v5;
  if (v3)
    v7 = v3;
  else
    v7 = &stru_1E5149688;
  if (v4)
  {
    v11 = *MEMORY[0x1E0DC1138];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, 0);
  }

  return v9;
}

void __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "attributedText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = objc_msgSend(v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v9, "setAttributedText:", v5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

@end
