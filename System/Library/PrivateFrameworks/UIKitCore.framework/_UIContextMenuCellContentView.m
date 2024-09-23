@implementation _UIContextMenuCellContentView

- (_UIContextMenuCellContentView)initWithFrame:(CGRect)a3
{
  _UIContextMenuCellContentView *v3;
  _UIContextMenuCellContentView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIContextMenuCellContentView;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    -[UIView setTintAdjustmentMode:](v4, "setTintAdjustmentMode:", 1);
    -[_UIContextMenuCellContentView setOverrideNumberOfTitleLines:](v4, "setOverrideNumberOfTitleLines:", -1);
    -[_UIContextMenuCellContentView setOverrideNumberOfSubtitleLines:](v4, "setOverrideNumberOfSubtitleLines:", -1);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, sel__updateCompositingFiltersForCurrentState);

    v13 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v9, sel__updateLabelsForCurrentState);

  }
  return v4;
}

- (void)setLayoutClass:(Class)a3
{
  void *v5;
  objc_class *v6;
  _UIContextMenuCellLayout *v7;
  _UIContextMenuCellLayout *layout;
  void *v9;
  void *v10;

  -[_UIContextMenuCellContentView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();

  if (v6 != a3)
  {
    -[UIView setHoverStyle:](self, "setHoverStyle:", 0);
    -[_UIContextMenuCellLayout removeConstraints](self->_layout, "removeConstraints");
    v7 = (_UIContextMenuCellLayout *)objc_msgSend([a3 alloc], "initWithContentView:", self);
    layout = self->_layout;
    self->_layout = v7;

    -[_UIContextMenuCellContentView _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:](self, "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setOverridingSymbolConfiguration:", v9);

    -[_UIContextMenuCellContentView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");
    -[_UIContextMenuCellContentView setNeedsHoverStyleUpdate:](self, "setNeedsHoverStyleUpdate:", 1);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuCellContentView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_UIContextMenuCellContentView setNeedsHoverStyleUpdate:](self, "setNeedsHoverStyleUpdate:", 1);
  -[_UIContextMenuCellContentView _updateHoverStyleIfNeeded](self, "_updateHoverStyleIfNeeded");
}

- (UIView)iconView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIView *)v6;
}

- (BOOL)shouldHighlightOnHover
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIContextMenuCellContentView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hoverStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (int64_t)focusStyle
{
  void *v2;
  int64_t v3;

  -[_UIContextMenuCellContentView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "focusStyle");

  return v3;
}

- (UIShape)contentShape
{
  void *v2;
  void *v3;

  -[_UIContextMenuCellContentView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentShape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIShape *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _UIContextMenuCellContentView *v10;

  v7 = a3;
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42___UIContextMenuCellContentView_setTitle___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v7;
    v10 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

- (void)setAttributedTitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _UIContextMenuCellContentView *v10;

  v7 = a3;
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToAttributedString:", v5);

  if ((v6 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52___UIContextMenuCellContentView_setAttributedTitle___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v7;
    v10 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _UIContextMenuCellContentView *v10;

  v7 = a3;
  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45___UIContextMenuCellContentView_setSubtitle___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v7;
    v10 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

- (void)setImage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _UIContextMenuCellContentView *v11;

  v8 = a3;
  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[_UIContextMenuCellContentView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42___UIContextMenuCellContentView_setImage___block_invoke;
    v9[3] = &unk_1E16B1B50;
    v10 = v8;
    v11 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

  }
}

- (void)setAccessoryAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    if (!v4)
    {
      +[UIButton systemButtonWithPrimaryAction:](UIButton, "systemButtonWithPrimaryAction:", v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView setAccessoryButton:](self, "setAccessoryButton:", v5);

      -[_UIContextMenuCellContentView _primaryContentColorForCurrentState](self, "_primaryContentColorForCurrentState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTintColor:", v6);

      -[_UIContextMenuCellContentView _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:](self, "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPreferredSymbolConfiguration:", v8);

      -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    }
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[_UIContextMenuCellContentView setAccessoryButton:](self, "setAccessoryButton:", 0);
  }
  -[_UIContextMenuCellContentView setImage:](self, "setImage:", 0);
  -[_UIContextMenuCellContentView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");

}

- (void)_setDecorationImage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _UIContextMenuCellContentView *v10;

  v7 = a3;
  -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53___UIContextMenuCellContentView__setDecorationImage___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v7;
    v10 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

  }
}

- (void)_setNeedsConstraintRebuild
{
  -[_UIContextMenuCellContentView setNeedsConstraintRebuild:](self, "setNeedsConstraintRebuild:", 1);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuCellContentView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIContextMenuCellContentView _updateSecureView](self, "_updateSecureView");
  -[_UIContextMenuCellContentView _updateHoverStyleIfNeeded](self, "_updateHoverStyleIfNeeded");
}

- (void)setOptions:(unint64_t)a3
{
  unint64_t options;

  options = self->_options;
  if (options != a3)
  {
    self->_options = a3;
    -[_UIContextMenuCellContentView _updateForOptionsChangeFromPreviousOptions:](self, "_updateForOptionsChangeFromPreviousOptions:", options);
  }
}

- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3
{
  uint64_t v4;
  uint64_t (**v5)(void *, uint64_t);
  int v6;
  _BOOL4 v7;
  int v8;
  _QWORD *v9;
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD aBlock[6];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke;
  aBlock[3] = &unk_1E16D5C20;
  aBlock[4] = self;
  aBlock[5] = a3;
  v5 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  v6 = v5[2](v5, 1);
  if (v6)
    v7 = self->_pasteVariant != 0;
  else
    v7 = 0;
  v8 = v5[2](v5, 2);
  if (v5[2](v5, 4))
  {
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_2;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    v9 = v13;
    goto LABEL_8;
  }
  if (v5[2](v5, 8))
  {
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_3;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    v9 = v12;
LABEL_8:
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);
    v7 = 1;
    if (!-[_UIContextMenuCellContentView _hasTrailingAccessory](self, "_hasTrailingAccessory"))
      goto LABEL_13;
    goto LABEL_11;
  }
  -[_UIContextMenuCellContentView _hasTrailingAccessory](self, "_hasTrailingAccessory");
LABEL_11:
  if (v5[2](v5, 16))
  {
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __76___UIContextMenuCellContentView__updateForOptionsChangeFromPreviousOptions___block_invoke_4;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    v7 = 1;
  }
LABEL_13:
  v10 = v8 | v6;
  if (v5[2](v5, 64))
    -[_UIContextMenuCellContentView setIsEmphasized:](self, "setIsEmphasized:", (-[_UIContextMenuCellContentView options](self, "options") >> 6) & 1);
  if (v10)
    -[_UIContextMenuCellContentView _updateAppearanceForStateChange](self, "_updateAppearanceForStateChange");
  if (v7)
    -[_UIContextMenuCellContentView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");
  if (v6)
  {
    -[_UIContextMenuCellContentView setNeedsHoverStyleUpdate:](self, "setNeedsHoverStyleUpdate:", 1);
    -[_UIContextMenuCellContentView _updateHoverStyleIfNeeded](self, "_updateHoverStyleIfNeeded");
  }

}

- (void)_updateHoverStyleIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    if (-[_UIContextMenuCellContentView needsHoverStyleUpdate](self, "needsHoverStyleUpdate"))
    {
      v4 = -[_UIContextMenuCellContentView needsConstraintRebuild](self, "needsConstraintRebuild");

      if (v4)
        return;
      -[_UIContextMenuCellContentView layout](self, "layout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hoverStyle");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      -[UIView setHoverStyle:](self, "setHoverStyle:", v8);
      v6 = (-[_UIContextMenuCellContentView options](self, "options") & 1) == 0;
      -[UIView hoverStyle](self, "hoverStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", v6);

      -[_UIContextMenuCellContentView setNeedsHoverStyleUpdate:](self, "setNeedsHoverStyleUpdate:", 0);
    }
    v3 = v8;
  }

}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    -[_UIContextMenuCellContentView _updateTitleLabelNumberOfLines](self, "_updateTitleLabelNumberOfLines");
    -[_UIContextMenuCellContentView _updateSubtitleLabelNumberOfLines](self, "_updateSubtitleLabelNumberOfLines");
  }
}

- (unint64_t)measuredNumberOfTitleLines
{
  void *v2;
  unint64_t v3;

  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_measuredNumberOfLines");

  return v3;
}

- (unint64_t)measuredNumberOfSubTitleLines
{
  void *v2;
  unint64_t v3;

  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_measuredNumberOfLines");

  return v3;
}

- (void)_inheritRelevantPropertiesFromContentView:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    -[_UIContextMenuCellContentView setOverrideNumberOfTitleLines:](self, "setOverrideNumberOfTitleLines:", objc_msgSend(v4, "measuredNumberOfTitleLines"));
    v5 = objc_msgSend(v6, "measuredNumberOfSubTitleLines");
  }
  else
  {
    v5 = -1;
    -[_UIContextMenuCellContentView setOverrideNumberOfTitleLines:](self, "setOverrideNumberOfTitleLines:", -1);
  }
  -[_UIContextMenuCellContentView setOverrideNumberOfSubtitleLines:](self, "setOverrideNumberOfSubtitleLines:", v5);
  -[_UIContextMenuCellContentView _updateTitleLabelNumberOfLines](self, "_updateTitleLabelNumberOfLines");
  -[_UIContextMenuCellContentView _updateSubtitleLabelNumberOfLines](self, "_updateSubtitleLabelNumberOfLines");

}

- (void)_hideContents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _UISlotView **p_securePasteButtonSlotView;
  id WeakRetained;

  -[_UIContextMenuCellContentView pasteVariant](self, "pasteVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[_UIContextMenuCellContentView setPasteVariant:](self, "setPasteVariant:", 0);
    p_securePasteButtonSlotView = &self->_securePasteButtonSlotView;
    WeakRetained = objc_loadWeakRetained((id *)p_securePasteButtonSlotView);
    objc_msgSend(WeakRetained, "removeFromSuperview");

    objc_storeWeak((id *)p_securePasteButtonSlotView, 0);
  }
}

- (void)_updateSecureView
{
  char v3;
  id WeakRetained;
  void *v5;
  _UISlotView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, void *);
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  if (self->_pasteVariant)
  {
    v3 = -[_UIContextMenuCellContentView options](self, "options");
    WeakRetained = objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
    v5 = WeakRetained;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "removeFromSuperview");

      objc_storeWeak((id *)&self->_securePasteButtonSlotView, 0);
    }
    else
    {

      if (v5)
      {
        v6 = (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
      }
      else
      {
        v6 = objc_alloc_init(_UISlotView);
        objc_storeWeak((id *)&self->_securePasteButtonSlotView, v6);
      }
      -[UIView origin](self->_labelStackView, "origin");
      v8 = v7;
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        -[UIView size](self, "size");
        v10 = v9;
        -[UIView frame](self->_labelStackView, "frame");
        v12 = v10 - v11;
        -[UIView frame](self->_labelStackView, "frame");
        v8 = v12 - v13;
      }
      v14 = (-[_UIContextMenuCellContentView options](self, "options") >> 5) & 1;
      v15 = (void *)MEMORY[0x1E0D6C0D8];
      -[_UIContextMenuCellContentView pasteVariant](self, "pasteVariant");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "secureName");
      -[UIView size](self, "size");
      v19 = v18 + -2.0;
      -[UIView size](self, "size");
      v21 = v20 + -2.0;
      -[UIView origin](self->_labelStackView, "origin");
      v23 = v22;
      -[_UIContextMenuCellContentView layout](self, "layout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contextMenuPasteButtonTagWithSecureName:size:titleOrigin:layoutSize:hasTrailingGutter:", v17, objc_msgSend(v24, "layoutSize"), v14, v19, v21, v8, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v26 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __50___UIContextMenuCellContentView__updateSecureView__block_invoke;
      v35[3] = &unk_1E16B59B0;
      v27 = v25;
      v36 = v27;
      -[_UISlotView _setSlotStyleResolver:](v6, "_setSlotStyleResolver:", v35);
      v29 = v26;
      v30 = 3221225472;
      v31 = __50___UIContextMenuCellContentView__updateSecureView__block_invoke_2;
      v32 = &unk_1E16B5A28;
      v28 = v27;
      v33 = v28;
      objc_copyWeak(&v34, &location);
      -[_UISlotView _setSlotAnyContentProvider:](v6, "_setSlotAnyContentProvider:", &v29);
      -[_UISlotView _overlayView:centerInView:](v6, "_overlayView:centerInView:", self, self, v29, v30, v31, v32);
      objc_destroyWeak(&v34);

      objc_destroyWeak(&location);
    }
  }
}

- (void)setPasteVariant:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UISPasteVariant *pasteVariant;
  id v10;

  v5 = a3;
  v10 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedStringForLocalization:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView setTitle:](self, "setTitle:", v6);

    -[_UIContextMenuCellContentView setSubtitle:](self, "setSubtitle:", 0);
    objc_msgSend(v10, "glyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView setImage:](self, "setImage:", v8);

    objc_storeStrong((id *)&self->_pasteVariant, a3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    pasteVariant = self->_pasteVariant;
    self->_pasteVariant = 0;

  }
}

- (unsigned)_secureName
{
  UISPasteVariant *pasteVariant;

  pasteVariant = self->_pasteVariant;
  if (pasteVariant)
    LODWORD(pasteVariant) = -[UISPasteVariant secureName](pasteVariant, "secureName");
  return pasteVariant;
}

- (void)_createLabelStackViewIfNeeded
{
  void *v3;
  UIStackView *v4;
  void *v5;
  UIStackView *labelStackView;

  -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (UIStackView *)objc_opt_new();
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setBaselineRelativeArrangement:](v4, "setBaselineRelativeArrangement:", 1);
    -[UIStackView setAxis:](v4, "setAxis:", 1);
    -[UIStackView setSpacing:](v4, "setSpacing:", 20.0);
    -[UIView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

    labelStackView = self->_labelStackView;
    self->_labelStackView = v4;

    -[_UIContextMenuCellContentView _setNeedsConstraintRebuild](self, "_setNeedsConstraintRebuild");
  }
}

- (void)_installTitleLabelIfNeeded
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  id v7;

  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_UIContextMenuCellContentView _primaryTitleLabel](self, "_primaryTitleLabel");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v4;

    -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertArrangedSubview:atIndex:", v6, 0);

  }
}

- (id)_primaryTitleLabel
{
  UILabel *v3;
  UILabel *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = [UILabel alloc];
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAllowsDefaultTighteningForTruncation:](v4, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.9);
  LODWORD(v5) = 0.5;
  -[UILabel _setHyphenationFactor:](v4, "_setHyphenationFactor:", v5);
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](v4, "setFont:", v9);
  -[_UIContextMenuCellContentView _primaryContentColorForCurrentState](self, "_primaryContentColorForCurrentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v4, "setTextColor:", v10);

  -[_UIContextMenuCellContentView _primaryCompositingFilterForCurrentTraitsAndState](self, "_primaryCompositingFilterForCurrentTraitsAndState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v4, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCompositingFilter:", v11);

  return v4;
}

- (void)_installSubtitleLabelIfNeeded
{
  void *v3;
  UILabel *v4;
  UILabel *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *subtitleLabel;
  void *v15;
  id v16;

  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [UILabel alloc];
    v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v5, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v6) = 0.5;
    -[UILabel _setHyphenationFactor:](v5, "_setHyphenationFactor:", v6);
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_fontAdjustedForCurrentContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v5, "setFont:", v10);
    -[_UIContextMenuCellContentView _subtitleTextColor](self, "_subtitleTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v11);

    -[UIView _setOverrideUserInterfaceRenderingMode:](v5, "_setOverrideUserInterfaceRenderingMode:", -[_UIContextMenuCellContentView _subtitleLabelRenderingMode](self, "_subtitleLabelRenderingMode"));
    -[_UIContextMenuCellContentView _subtitleLabelFilterForCurrentTraitsAndState](self, "_subtitleLabelFilterForCurrentTraitsAndState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCompositingFilter:", v12);

    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    -[_UIContextMenuCellContentView _updateSubtitleLabelNumberOfLines](self, "_updateSubtitleLabelNumberOfLines");
    -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addArrangedSubview:", v15);

  }
}

- (id)_contentImageViewForImage:(id)a3
{
  id v4;
  UIImageView *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v4);
  -[UIImageView setContentMode:](v5, "setContentMode:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_UIContextMenuCellContentView _primaryContentColorForCurrentState](self, "_primaryContentColorForCurrentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](v5, "setTintColor:", v6);

  v7 = objc_msgSend(v4, "isSymbolImage");
  if (v7)
  {
    -[_UIContextMenuCellContentView _primaryCompositingFilterForCurrentTraitsAndState](self, "_primaryCompositingFilterForCurrentTraitsAndState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[UIView layer](v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v8);

  if (v7)
  return v5;
}

- (void)_updateAttachedConstraintsForViewHierarchyChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuCellContentView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints");

  -[_UIContextMenuCellContentView nonSymbolImageWidth](self, "nonSymbolImageWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[_UIContextMenuCellContentView nonSymbolImageHeight](self, "nonSymbolImageHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  -[_UIContextMenuCellContentView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installConstraints");

  -[_UIContextMenuCellContentView iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIContextMenuCellContentView iconView](self, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSymbolImage");

    if ((v11 & 1) == 0)
    {
      -[_UIContextMenuCellContentView _maxImageSize](self, "_maxImageSize");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v9, "widthAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintLessThanOrEqualToConstant:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView setNonSymbolImageWidth:](self, "setNonSymbolImageWidth:", v17);

      objc_msgSend(v9, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintLessThanOrEqualToConstant:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView setNonSymbolImageHeight:](self, "setNonSymbolImageHeight:", v19);

      v20 = (void *)MEMORY[0x1E0D156E0];
      -[_UIContextMenuCellContentView nonSymbolImageWidth](self, "nonSymbolImageWidth");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[_UIContextMenuCellContentView nonSymbolImageHeight](self, "nonSymbolImageHeight");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v23);

    }
  }
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateAppearanceForStateChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  -[_UIContextMenuCellContentView _primaryContentColorForCurrentState](self, "_primaryContentColorForCurrentState");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v21);

  -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v21);

  -[_UIContextMenuCellContentView _childIndicatorColorForCurrentState](self, "_childIndicatorColorForCurrentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v21);

  -[_UIContextMenuCellContentView _updateIconImageAppearanceForStateChange](self, "_updateIconImageAppearanceForStateChange");
  -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v21);

  -[_UIContextMenuCellContentView accessoryButton](self, "accessoryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v21);

  -[_UIContextMenuCellContentView layout](self, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredBackgroundColorForCurrentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v12);
  }
  else
  {
    v13 = -[_UIContextMenuCellContentView options](self, "options");
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");
    v16 = -[_UIContextMenuCellContentView controlState](self, "controlState");
    _UIContextMenuGetPlatformMetrics(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemBackgroundColorProvider");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v18 + 16))(v18, v16, (v13 >> 1) & 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }

    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v20);
  }

}

- (void)_updateIconImageAppearanceForStateChange
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isSymbolImage"))
  {
LABEL_9:

    return;
  }
  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isColoredSymbolImage");

  if (v6)
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "itemColoredSymbolImageUserInterfaceStyleOverrideProvider");
    v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3[2](v3, -[_UIContextMenuCellContentView controlState](self, "controlState"), (-[_UIContextMenuCellContentView options](self, "options") >> 1) & 1);
      -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _internalTraitOverrides](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8)
        objc_msgSend(v10, "setUserInterfaceStyle:", v8);
      else
        objc_msgSend(v10, "_removeTraitToken:", 0x1E1A994B0);

    }
    goto LABEL_9;
  }
}

- (void)updateConstraints
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  if (-[_UIContextMenuCellContentView needsConstraintRebuild](self, "needsConstraintRebuild"))
  {
    -[_UIContextMenuCellContentView setNeedsConstraintRebuild:](self, "setNeedsConstraintRebuild:", 0);
    -[_UIContextMenuCellContentView _updateAttachedConstraintsForViewHierarchyChange](self, "_updateAttachedConstraintsForViewHierarchyChange");
    -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertSubview:aboveSubview:", v9, v10);

      }
    }
    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UIView traitCollection](self, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v18, "userInterfaceIdiom"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "minIntraItemSpacing");
      v21 = v20;

      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

      -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "centerYAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "centerYAnchor");
    }
    else
    {
      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "trailingAnchor");
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstBaselineAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView labelStackView](self, "labelStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

  }
  -[_UIContextMenuCellContentView nonSymbolImageWidth](self, "nonSymbolImageWidth");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[_UIContextMenuCellContentView _maxImageSize](self, "_maxImageSize");
    v44 = v43;
    v46 = v45;
    -[_UIContextMenuCellContentView nonSymbolImageWidth](self, "nonSymbolImageWidth");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setConstant:", v44);

    -[_UIContextMenuCellContentView nonSymbolImageHeight](self, "nonSymbolImageHeight");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setConstant:", v46);

  }
  -[_UIContextMenuCellContentView layout](self, "layout");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "updateConstraints");

  v50.receiver = self;
  v50.super_class = (Class)_UIContextMenuCellContentView;
  -[UIView updateConstraints](&v50, sel_updateConstraints);
}

- (void)setIsEmphasized:(BOOL)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UIUserInterfaceLayoutDirection v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  _QWORD v48[5];
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  if (self->_isEmphasized != a3)
  {
    self->_isEmphasized = a3;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __49___UIContextMenuCellContentView_setIsEmphasized___block_invoke;
    v48[3] = &unk_1E16B1B28;
    v48[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v48);
    if (self->_isEmphasized)
      v4 = 0.0;
    else
      v4 = 1.0;
    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", v4);

    if (self->_isEmphasized)
      v6 = 1.0;
    else
      v6 = 0.0;
    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v6);

    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfLines");
    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", v9);

    if (self->_isEmphasized)
      v11 = 0.0;
    else
      v11 = 1.0;
    -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", v11);

    if (self->_isEmphasized)
      v13 = 1.0;
    else
      v13 = 0.0;
    -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", v13);

    if ((-[_UIContextMenuCellContentView options](self, "options") & 0x10) != 0)
    {
      if ((-[_UIContextMenuCellContentView options](self, "options") & 4) != 0)
      {
        if (self->_isEmphasized)
          v18 = 0.0;
        else
          v18 = 1.0;
        -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAlpha:", v18);
      }
      else
      {
        if (self->_isEmphasized)
        {
          -[UIView superview](self, "superview");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "flipsHorizontalAxis"))
            v17 = -1.57079633;
          else
            v17 = 1.57079633;

        }
        else
        {
          v17 = 0.0;
        }
        CGAffineTransformMakeRotation(&v47, v17);
        -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v47;
        objc_msgSend(v19, "setTransform:", &v46);
      }

    }
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v45.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v45.c = v20;
    *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v44.a = *(_OWORD *)&v45.a;
    *(_OWORD *)&v44.c = v20;
    *(_OWORD *)&v44.tx = *(_OWORD *)&v45.tx;
    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    objc_msgSend(v21, "sizeThatFits:", v23, v24);
    v26 = v25;

    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    objc_msgSend(v27, "sizeThatFits:", v29, v30);
    v32 = v31;

    v33 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    if (self->_isEmphasized)
    {
      -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      v35 = CGRectGetWidth(v51) * -0.5;
      if (v33 == UIUserInterfaceLayoutDirectionRightToLeft)
        v36 = -v35;
      else
        v36 = v35;
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, v36, 0.0);
      v49 = v43;
      CGAffineTransformScale(&v50, &v49, v32 / v26, 1.0);
      *(_OWORD *)&v43.c = *(_OWORD *)&v50.c;
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      *(_OWORD *)&v43.a = *(_OWORD *)&v50.a;
      v49 = v50;
      CGAffineTransformTranslate(&v50, &v49, -v36, 0.0);
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      v45 = v50;
    }
    else
    {
      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      v37 = CGRectGetWidth(v52) * -0.5;
      if (v33 == UIUserInterfaceLayoutDirectionRightToLeft)
        v38 = -v37;
      else
        v38 = v37;
      memset(&v43, 0, sizeof(v43));
      CGAffineTransformMakeTranslation(&v43, v38, 0.0);
      v49 = v43;
      CGAffineTransformScale(&v50, &v49, v26 / v32, 1.0);
      *(_OWORD *)&v43.c = *(_OWORD *)&v50.c;
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      *(_OWORD *)&v43.a = *(_OWORD *)&v50.a;
      v49 = v50;
      CGAffineTransformTranslate(&v50, &v49, -v38, 0.0);
      *(_OWORD *)&v43.tx = *(_OWORD *)&v50.tx;
      v44 = v50;
    }

    -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v45;
    objc_msgSend(v39, "setTransform:", &v42);

    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v44;
    objc_msgSend(v40, "setTransform:", &v41);

  }
}

- (void)setControlState:(unint64_t)a3
{
  -[_UIContextMenuCellContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", a3, 0);
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD aBlock[5];

  v6 = a4;
  self->_controlState = a3;
  -[_UIContextMenuCellContentView _updateCompositingFiltersForCurrentState](self, "_updateCompositingFiltersForCurrentState");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIContextMenuCellContentView_setControlState_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (v6)
    objc_msgSend(v6, "addCoordinatedAnimations:completion:", v7, 0);
  else
    (*((void (**)(void *))v7 + 2))(v7);
  -[_UIContextMenuCellContentView layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[_UIContextMenuCellContentView layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setControlState:withAnimationCoordinator:", a3, v6);

  }
}

- (void)_updateCompositingFiltersForCurrentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  -[_UIContextMenuCellContentView _primaryCompositingFilterForCurrentTraitsAndState](self, "_primaryCompositingFilterForCurrentTraitsAndState");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", v25);

  -[_UIContextMenuCellContentView _subtitleLabelFilterForCurrentTraitsAndState](self, "_subtitleLabelFilterForCurrentTraitsAndState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v5);

  -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v25);

  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isSymbolImage"))
    v12 = v25;
  else
    v12 = 0;
  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCompositingFilter:", v12);

  -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isSymbolImage"))
    v17 = v25;
  else
    v17 = 0;
  -[_UIContextMenuCellContentView emphasizediconImageView](self, "emphasizediconImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCompositingFilter:", v17);

  -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isSymbolImage"))
    v22 = v25;
  else
    v22 = 0;
  -[_UIContextMenuCellContentView decorationImageView](self, "decorationImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCompositingFilter:", v22);

}

- (void)_updateLabelsForCurrentState
{
  void *v3;
  void *v4;

  -[_UIContextMenuCellContentView _updateTitleLabelNumberOfLines](self, "_updateTitleLabelNumberOfLines");
  -[_UIContextMenuCellContentView _updateSubtitleLabelNumberOfLines](self, "_updateSubtitleLabelNumberOfLines");
  -[_UIContextMenuCellContentView _iconSymbolConfigurationForCurrentTraitsUsingBoldFont:](self, "_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuCellContentView iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOverridingSymbolConfiguration:", v3);

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)_primaryCompositingFilterForCurrentTraitsAndState
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "itemPrimaryCompositingFilterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "itemPrimaryCompositingFilterProvider");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, unint64_t))v6)[2](v6, v7, -[_UIContextMenuCellContentView controlState](self, "controlState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_subtitleLabelFilterForCurrentTraitsAndState
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "itemSubtitleCompositingFilterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "itemSubtitleCompositingFilterProvider");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, unint64_t))v6)[2](v6, v7, -[_UIContextMenuCellContentView controlState](self, "controlState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_subtitleLabelRenderingMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "itemSubtitleRenderingMode");
  return v4;
}

- (void)_updateTitleLabelNumberOfLines
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    v4 = -[_UIContextMenuCellContentView _resolvedLineLimit](self, "_resolvedLineLimit");
    if ((-[_UIContextMenuCellContentView overrideNumberOfTitleLines](self, "overrideNumberOfTitleLines") & 0x8000000000000000) == 0)
      v4 = -[_UIContextMenuCellContentView overrideNumberOfTitleLines](self, "overrideNumberOfTitleLines");
    objc_msgSend(v13, "setNumberOfLines:", v4);
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", v4 == 1);
    -[_UIContextMenuCellContentView layout](self, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", objc_msgSend(v5, "labelTextAlignment"));

    -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v13;
    if (v6)
    {
      v7 = objc_msgSend(v13, "textAlignment");
      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextAlignment:", v7);

      v9 = objc_msgSend(v13, "numberOfLines");
      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", v9);

      v11 = objc_msgSend(v13, "adjustsFontSizeToFitWidth");
      -[_UIContextMenuCellContentView emphasizedTitleLabel](self, "emphasizedTitleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", v11);

      v3 = v13;
    }
  }

}

- (void)_updateSubtitleLabelNumberOfLines
{
  void *v3;
  int64_t v4;
  id v5;

  -[_UIContextMenuCellContentView subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = -[_UIContextMenuCellContentView _resolvedLineLimit](self, "_resolvedLineLimit");
    if ((-[_UIContextMenuCellContentView overrideNumberOfSubtitleLines](self, "overrideNumberOfSubtitleLines") & 0x8000000000000000) == 0)
      v4 = -[_UIContextMenuCellContentView overrideNumberOfSubtitleLines](self, "overrideNumberOfSubtitleLines");
    objc_msgSend(v5, "setNumberOfLines:", v4);
    v3 = v5;
  }

}

- (int64_t)_resolvedLineLimit
{
  void *v3;
  void *v4;
  const char *v5;
  int IsAccessibilityContentSizeCategory;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  if (-[_UIContextMenuCellContentView numberOfTitleLines](self, "numberOfTitleLines") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v4, v5);

    if (IsAccessibilityContentSizeCategory)
      v7 = 0;
    else
      v7 = 2;
  }
  else
  {
    v7 = -[_UIContextMenuCellContentView numberOfTitleLines](self, "numberOfTitleLines");
  }
  -[_UIContextMenuCellContentView layout](self, "layout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "labelMaximumNumberOfLines");

  if (v7 >= v9)
    return v9;
  else
    return v7;
}

- (id)_iconSymbolConfigurationForCurrentTraitsUsingBoldFont:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  int IsAccessibilityContentSizeCategory;
  void *v11;

  v3 = a3;
  -[_UIContextMenuCellContentView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredIconFontUsingBoldFont:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v8, v9);

  if (IsAccessibilityContentSizeCategory)
    +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 1);
  else
    +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_primaryContentColorForCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void *v20;

  -[_UIContextMenuCellContentView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentColorForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((-[_UIContextMenuCellContentView options](self, "options") & 1) != 0)
  {
    _UIContextMenuItemPrimaryColor(v7, -[_UIContextMenuCellContentView controlState](self, "controlState") | 2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = -[_UIContextMenuCellContentView options](self, "options");
  v9 = -[_UIContextMenuCellContentView controlState](self, "controlState");
  if ((v8 & 2) != 0)
  {
    _UIContextMenuGetPlatformMetrics(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "itemPrimaryDestructiveColorProvider");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
    {
      (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_9;
  }
  _UIContextMenuItemPrimaryColor(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemPrimaryAlpha");
  v13 = v12;

  if (v13 >= 1.0)
  {
LABEL_9:
    v15 = v10;
    v10 = v15;
    goto LABEL_10;
  }
  objc_msgSend(v10, "alphaComponent");
  objc_msgSend(v10, "colorWithAlphaComponent:", v13 * v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v16 = v15;

  return v16;
}

- (id)_childIndicatorColorForCurrentState
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[_UIContextMenuCellContentView _hasTrailingAccessory](self, "_hasTrailingAccessory"))
    goto LABEL_3;
  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAccessoryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    -[_UIContextMenuCellContentView _primaryContentColorForCurrentState](self, "_primaryContentColorForCurrentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_subtitleTextColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "itemSubtitleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGSize)_maxImageSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[_UIContextMenuCellContentView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v9, "userInterfaceIdiom"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  _UIContextMenuGetPlatformMetrics(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dynamicImageBoxWidth");
  v14 = v13;

  objc_msgSend(v8, "_scaledValueForValue:", v14);
  UIRoundToViewScale(self);
  v16 = v15;
  _UIContextMenuGetPlatformMetrics(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemTopToFirstBaseline");
  v19 = v18;

  _UIContextMenuGetPlatformMetrics(v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "itemLastBaselineToBottom");
  v22 = v21;

  objc_msgSend(v8, "_scaledValueForValue:", v19 + v22);
  UIRoundToViewScale(self);
  v24 = v23 + -12.0;

  v25 = v16;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (id)_decorationSymbolImageConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decorationViewSymbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_selectionImage
{
  void *v2;
  void *v3;

  -[_UIContextMenuCellContentView _decorationSymbolImageConfiguration](self, "_decorationSymbolImageConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mixedSelectionImage
{
  void *v2;
  void *v3;

  -[_UIContextMenuCellContentView _decorationSymbolImageConfiguration](self, "_decorationSymbolImageConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("minus"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_childIndicatorImage
{
  void *v3;
  void *v4;

  if ((-[_UIContextMenuCellContentView options](self, "options") & 0x20) != 0)
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleEmphasizedFootnote"), 1);
  else
    -[_UIContextMenuCellContentView _decorationSymbolImageConfiguration](self, "_decorationSymbolImageConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_hasTrailingAccessory
{
  return (~-[_UIContextMenuCellContentView options](self, "options") & 0x30) == 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)selectedIconBehavior
{
  return self->_selectedIconBehavior;
}

- (void)setSelectedIconBehavior:(int64_t)a3
{
  self->_selectedIconBehavior = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (UIImageView)decorationImageView
{
  return self->_decorationImageView;
}

- (void)setDecorationImageView:(id)a3
{
  objc_storeStrong((id *)&self->_decorationImageView, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (UILabel)emphasizedTitleLabel
{
  return self->_emphasizedTitleLabel;
}

- (void)setEmphasizedTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizedTitleLabel, a3);
}

- (UIImageView)emphasizediconImageView
{
  return self->_emphasizediconImageView;
}

- (void)setEmphasizediconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizediconImageView, a3);
}

- (NSLayoutConstraint)nonSymbolImageWidth
{
  return self->_nonSymbolImageWidth;
}

- (void)setNonSymbolImageWidth:(id)a3
{
  objc_storeStrong((id *)&self->_nonSymbolImageWidth, a3);
}

- (NSLayoutConstraint)nonSymbolImageHeight
{
  return self->_nonSymbolImageHeight;
}

- (void)setNonSymbolImageHeight:(id)a3
{
  objc_storeStrong((id *)&self->_nonSymbolImageHeight, a3);
}

- (BOOL)needsHoverStyleUpdate
{
  return self->_needsHoverStyleUpdate;
}

- (void)setNeedsHoverStyleUpdate:(BOOL)a3
{
  self->_needsHoverStyleUpdate = a3;
}

- (BOOL)needsConstraintRebuild
{
  return self->_needsConstraintRebuild;
}

- (void)setNeedsConstraintRebuild:(BOOL)a3
{
  self->_needsConstraintRebuild = a3;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (_UISlotView)securePasteButtonSlotView
{
  return (_UISlotView *)objc_loadWeakRetained((id *)&self->_securePasteButtonSlotView);
}

- (void)setSecurePasteButtonSlotView:(id)a3
{
  objc_storeWeak((id *)&self->_securePasteButtonSlotView, a3);
}

- (int64_t)overrideNumberOfTitleLines
{
  return self->_overrideNumberOfTitleLines;
}

- (void)setOverrideNumberOfTitleLines:(int64_t)a3
{
  self->_overrideNumberOfTitleLines = a3;
}

- (int64_t)overrideNumberOfSubtitleLines
{
  return self->_overrideNumberOfSubtitleLines;
}

- (void)setOverrideNumberOfSubtitleLines:(int64_t)a3
{
  self->_overrideNumberOfSubtitleLines = a3;
}

- (_UIContextMenuCellLayout)layout
{
  return self->_layout;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UISPasteVariant)pasteVariant
{
  return self->_pasteVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteVariant, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_securePasteButtonSlotView);
  objc_storeStrong((id *)&self->_nonSymbolImageHeight, 0);
  objc_storeStrong((id *)&self->_nonSymbolImageWidth, 0);
  objc_storeStrong((id *)&self->_emphasizediconImageView, 0);
  objc_storeStrong((id *)&self->_emphasizedTitleLabel, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_decorationImageView, 0);
}

@end
