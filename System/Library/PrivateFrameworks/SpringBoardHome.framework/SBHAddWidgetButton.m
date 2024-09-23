@implementation SBHAddWidgetButton

- (SBHAddWidgetButton)initWithFrame:(CGRect)a3
{
  SBHAddWidgetButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTStylingProvidingSolidColorView *v10;
  MTStylingProvidingSolidColorView *backgroundView;
  void *v12;
  UIView *v13;
  UIView *highlightView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SBHAddWidgetButton;
  v3 = -[SBHAddWidgetButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    SBHBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WIDGET_ADD_SHEET_ADD_WIDGET_THIS_STRING_NEEDS_TO_HAVE_A_LEADING_SPACE_FOR_LAYOUT_PURPOSES"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetButton setTitle:forState:](v3, "setTitle:forState:", v5, 0);

    -[SBHAddWidgetButton imageView](v3, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 1);

    -[SBHAddWidgetButton titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    -[SBHAddWidgetButton _titleLabelFont](v3, "_titleLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[SBHAddWidgetButton _addSymbolImage](v3, "_addSymbolImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetButton setImage:forState:](v3, "setImage:forState:", v9, 0);

    -[SBHAddWidgetButton setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    v10 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x1E0D474B0]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v10;

    -[MTStylingProvidingSolidColorView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SBHAddWidgetButton insertSubview:atIndex:](v3, "insertSubview:atIndex:", v3->_backgroundView, 0);
    -[MTStylingProvidingSolidColorView visualStylingProviderForCategory:](v3->_backgroundView, "visualStylingProviderForCategory:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "automaticallyUpdateView:withStyle:", v3, 0);

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v13;

    -[UIView setUserInteractionEnabled:](v3->_highlightView, "setUserInteractionEnabled:", 0);
    -[UIView setAlpha:](v3->_highlightView, "setAlpha:", 0.0);
    -[SBHAddWidgetButton insertSubview:aboveSubview:](v3, "insertSubview:aboveSubview:", v3->_highlightView, v3->_backgroundView);
    -[SBHAddWidgetButton layoutIfNeeded](v3, "layoutIfNeeded");
    -[MTStylingProvidingSolidColorView visualStylingProviderForCategory:](v3->_backgroundView, "visualStylingProviderForCategory:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "automaticallyUpdateView:withStyle:andObserverBlock:", v3->_highlightView, 0, &__block_literal_global_57);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[SBHAddWidgetButton addInteraction:](v3, "addInteraction:", v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)-[SBHAddWidgetButton registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v19, sel__contentSizeCategoryDidChange);

  }
  return v3;
}

void *__36__SBHAddWidgetButton_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD aBlock[5];

  objc_msgSend(a3, "alpha");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__SBHAddWidgetButton_initWithFrame___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  return _Block_copy(aBlock);
}

uint64_t __36__SBHAddWidgetButton_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetButton;
  -[SBHAddWidgetButton dealloc](&v4, sel_dealloc);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  double v6;
  _QWORD v7[5];
  BOOL v8;
  objc_super v9;

  v3 = a3;
  v5 = -[SBHAddWidgetButton isHighlighted](self, "isHighlighted");
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetButton;
  -[SBHAddWidgetButton setHighlighted:](&v9, sel_setHighlighted_, v3);
  if (v5 != -[SBHAddWidgetButton isHighlighted](self, "isHighlighted"))
  {
    v6 = 0.3;
    if (v3)
      v6 = 0.0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__SBHAddWidgetButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E8D85BB8;
    v7[4] = self;
    v8 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v7, 0, v6, 0.0);
  }
}

uint64_t __37__SBHAddWidgetButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 768), "setAlpha:", v1);
}

- (void)layoutSubviews
{
  UIView *highlightView;
  MTStylingProvidingSolidColorView *backgroundView;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetButton;
  -[SBHAddWidgetButton layoutSubviews](&v7, sel_layoutSubviews);
  highlightView = self->_highlightView;
  -[SBHAddWidgetButton bounds](self, "bounds");
  -[UIView setFrame:](highlightView, "setFrame:");
  -[SBHAddWidgetButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_highlightView);
  backgroundView = self->_backgroundView;
  -[SBHAddWidgetButton bounds](self, "bounds");
  -[MTStylingProvidingSolidColorView setFrame:](backgroundView, "setFrame:");
  -[SBHAddWidgetButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  -[SBHAddWidgetButton _buttonCornerRadius](self, "_buttonCornerRadius");
  v6 = v5;
  -[MTStylingProvidingSolidColorView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", v6);
}

- (double)_buttonCornerRadius
{
  double result;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  result = self->_buttonCornerRadius;
  if (result <= 0.0)
  {
    v4 = -[SBHAddWidgetButton addWidgetSheetStyle](self, "addWidgetSheetStyle");
    -[SBHAddWidgetButton _screen](self, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayCornerRadius");
    v8 = v7;

    -[SBHAddWidgetButton bounds](self, "bounds");
    result = v9 * 0.5;
    if (v4 != 1)
    {
      if (v8 + -24.0 <= result)
        result = v8 + -24.0;
      if (v4)
        result = 14.0;
      if (v8 <= 0.0)
        return 14.0;
    }
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  -[SBHAddWidgetButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4 + 20.0;

  -[SBHAddWidgetButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7 + 20.0;

  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetButton;
  -[SBHAddWidgetButton intrinsicContentSize](&v11, sel_intrinsicContentSize);
  if (v5 >= v8)
    v10 = v5;
  else
    v10 = v8;
  if (v10 < 50.0)
    v10 = 50.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_titleLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  -[SBHAddWidgetButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_addSymbolImage
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHAddWidgetButton _titleLabelFont](self, "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.circle.fill"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHAddWidgetButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetButton _titleLabelFont](self, "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[SBHAddWidgetButton _addSymbolImage](self, "_addSymbolImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetButton setImage:forState:](self, "setImage:forState:", v5, 0);

  -[SBHAddWidgetButton setNeedsLayout](self, "setNeedsLayout");
  -[SBHAddWidgetButton layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  -[SBHAddWidgetButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)mt_applyVisualStyling:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SBHAddWidgetButton_mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E8D8BE88;
  v3[4] = self;
  objc_msgSend(a3, "applyToView:withColorBlock:", self, v3);
}

void __44__SBHAddWidgetButton_mt_applyVisualStyling___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setTintColor:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setTitleColor:forState:", v4, 0);

}

- (void)mt_removeAllVisualStyling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetButton;
  -[SBHAddWidgetButton mt_removeAllVisualStyling](&v3, sel_mt_removeAllVisualStyling);
  -[SBHAddWidgetButton setTintColor:](self, "setTintColor:", 0);
  -[SBHAddWidgetButton setTitleColor:forState:](self, "setTitleColor:forState:", 0, 0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0DC3B28];
  v7 = a5;
  -[SBHAddWidgetButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3B30];
  -[SBHAddWidgetButton frame](self, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[SBHAddWidgetButton _buttonCornerRadius](self, "_buttonCornerRadius");
  objc_msgSend(v8, "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
