@implementation UIKeyboardStickerCollectionViewCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return (id)-[STKImageGlyph toString](self->_imageGlyph, "toString");
}

- (UIKeyboardStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  UIKeyboardStickerCollectionViewCell *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  UIView *stickerView;
  void *v9;
  UIEditMenuInteraction *v10;
  UIEditMenuInteraction *editMenuInteraction;
  UILongPressGestureRecognizer *v12;
  UILongPressGestureRecognizer *longPressGR;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v4 = (void *)_MergedGlobals_3_11;
    v20 = _MergedGlobals_3_11;
    if (!_MergedGlobals_3_11)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getSTKStickerViewClass_block_invoke;
      v16[3] = &unk_1E16B14C0;
      v16[4] = &v17;
      __getSTKStickerViewClass_block_invoke((uint64_t)v16);
      v4 = (void *)v18[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v17, 8);
    v6 = [v5 alloc];
    -[UIView bounds](v3, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    stickerView = v3->_stickerView;
    v3->_stickerView = (UIView *)v7;

    -[UICollectionViewCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_stickerView);

    v10 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", v3);
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = v10;

    -[UIView addInteraction:](v3, "addInteraction:", v3->_editMenuInteraction);
    v12 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", v3, sel_didLongPress_);
    longPressGR = v3->_longPressGR;
    v3->_longPressGR = v12;

    -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressGR);
  }
  return v3;
}

- (void)setImageGlyph:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView configureWithImage:imageGlyph:effect:](self->_stickerView, "configureWithImage:imageGlyph:effect:", 0, v5, 0);
    objc_storeStrong((id *)&self->_imageGlyph, a3);
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  -[UIKeyboardStickerCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
    -[UIKeyboardStickerCollectionViewCell setNavigationHighlightView:](self, "setNavigationHighlightView:", v9);

    -[UICollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardStickerCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:belowSubview:", v11, self->_stickerView);

    -[UIKeyboardStickerCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 5.0);

    if (v3)
      goto LABEL_3;
LABEL_5:
    -[UIKeyboardStickerCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  +[UIColor systemBlueColor](UIColor, "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell navigationHighlightView](self, "navigationHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

LABEL_6:
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)performDeleteWithCompletionHandler:(id)a3
{
  id v4;
  UISpringTimingParameters *v5;
  UIViewPropertyAnimator *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 325.0, 32.0, 0.0, 0.0);
  v6 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v5, 0.4);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E16B1B28;
  v11[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v6, "addAnimations:", v11);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E16C2BB8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[UIViewPropertyAnimator addCompletion:](v6, "addCompletion:", v9);
  -[UIViewPropertyAnimator startAnimation](v6, "startAnimation");

}

void __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v5, 0.1, 0.1);
  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __74__UIKeyboardStickerCollectionViewCell_performDeleteWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  uint64_t result;
  _OWORD v6[3];

  objc_msgSend(*(id *)(a1 + 32), "setImageGlyph:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v6);

  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setRearrangeMode:(BOOL)a3
{
  _BOOL8 v4;

  v4 = a3 && -[UIKeyboardStickerCollectionViewCell allowsRearrange](self, "allowsRearrange");
  if (self->_rearrangeMode != v4)
  {
    self->_rearrangeMode = v4;
    -[UIGestureRecognizer setEnabled:](self->_rearrangeViewTapGR, "setEnabled:", v4);
    if (v4)
      -[UIKeyboardStickerCollectionViewCell _startRearrange](self, "_startRearrange");
    else
      -[UIKeyboardStickerCollectionViewCell _endRearrange](self, "_endRearrange");
  }
}

- (BOOL)allowsRearrange
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  objc_msgSend(getSTKImageGlyphDataSourceClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isStickerSection:", objc_msgSend(v5, "section")))
    v6 = !-[UIKeyboardStickerCollectionViewCell isEmptyCell](self, "isEmptyCell");
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)isEmptyCell
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmpty");

  return v6;
}

- (void)willDisplay
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willDisplay");

  }
}

- (void)didEndDisplaying
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didEndDisplaying");

  }
}

- (void)prepareForReuse
{
  STKImageGlyph *imageGlyph;
  UIView *stickerView;
  __int128 v5;
  void *v6;
  char v7;
  void *v8;
  _OWORD v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  -[UICollectionViewCell prepareForReuse](&v10, sel_prepareForReuse);
  imageGlyph = self->_imageGlyph;
  self->_imageGlyph = 0;

  -[UIView setAlpha:](self->_stickerView, "setAlpha:", 1.0);
  stickerView = self->_stickerView;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v5;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](stickerView, "setTransform:", v9);
  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareForReuse");

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  -[UICollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_stickerView, "setFrame:");
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_navigationHighlightView, "setFrame:");
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_rearrangingView, "setFrame:");
}

- (UIView)rearrangingView
{
  UIView *rearrangingView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UITapGestureRecognizer *v18;
  UITapGestureRecognizer *rearrangeViewTapGR;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  rearrangingView = self->_rearrangingView;
  if (!rearrangingView)
  {
    v4 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_rearrangingView;
    self->_rearrangingView = v5;

    -[UIView setClipsToBounds:](self->_rearrangingView, "setClipsToBounds:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_rearrangingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIKeyboardStickerCollectionViewCell deleteButton](self, "deleteButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = self->_rearrangingView;
    -[UIKeyboardStickerCollectionViewCell deleteButton](self, "deleteButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v8, "addSubview:", v9);

    v22 = (void *)MEMORY[0x1E0D156E0];
    -[UIKeyboardStickerCollectionViewCell deleteButton](self, "deleteButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_rearrangingView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    -[UIKeyboardStickerCollectionViewCell deleteButton](self, "deleteButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_rearrangingView, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v17);

    v18 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__didTapDuringRearrange_);
    rearrangeViewTapGR = self->_rearrangeViewTapGR;
    self->_rearrangeViewTapGR = v18;

    -[UIGestureRecognizer setEnabled:](self->_rearrangeViewTapGR, "setEnabled:", 0);
    -[UICollectionViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_rearrangingView);

    -[UIView setHidden:](self->_rearrangingView, "setHidden:", 1);
    -[UIView addGestureRecognizer:](self->_rearrangingView, "addGestureRecognizer:", self->_rearrangeViewTapGR);
    rearrangingView = self->_rearrangingView;
  }
  return rearrangingView;
}

- (void)_reportRearrangeStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UIKeyboardStickerCollectionViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardStickerCollectionViewCell delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rearrangeStateChanged:", v3);

  }
}

- (UIButton)deleteButton
{
  UIButton *deleteButton;
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
  UIButton *v14;
  UIButton *v15;
  _QWORD v17[5];

  deleteButton = self->_deleteButton;
  if (!deleteButton)
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("minus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageByApplyingSymbolConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 1, 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageByApplyingSymbolConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualEffect:", v11);

    +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v9);
    objc_msgSend(v12, "setBackground:", v10);
    objc_msgSend(v12, "setCornerStyle:", 4);
    objc_msgSend(v12, "setButtonSize:", 1);
    objc_msgSend(v12, "setContentInsets:", 3.0, 3.0, 3.0, 3.0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__UIKeyboardStickerCollectionViewCell_deleteButton__block_invoke;
    v17[3] = &unk_1E16B2C10;
    v17[4] = self;
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v12, v13);
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v15 = self->_deleteButton;
    self->_deleteButton = v14;

    deleteButton = self->_deleteButton;
  }
  return deleteButton;
}

uint64_t __51__UIKeyboardStickerCollectionViewCell_deleteButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDeleteAction");
}

- (void)_showRearrangeViewIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[UIKeyboardStickerCollectionViewCell rearrangingView](self, "rearrangingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_startRearrange
{
  -[UIKeyboardStickerCollectionViewCell _startJiggle](self, "_startJiggle");
  -[UIKeyboardStickerCollectionViewCell _showRearrangeViewIfNecessary:](self, "_showRearrangeViewIfNecessary:", 1);
}

- (void)_endRearrange
{
  -[UIKeyboardStickerCollectionViewCell _endJiggle](self, "_endJiggle");
  -[UIKeyboardStickerCollectionViewCell _showRearrangeViewIfNecessary:](self, "_showRearrangeViewIfNecessary:", 0);
}

- (void)_performDeleteAction
{
  void *v3;
  id v4;

  objc_msgSend(getSTKImageGlyphDataSourceClass(), "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteItem:completionHandler:", v3, &__block_literal_global_248);

}

- (void)_didTapDuringRearrange:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UIKeyboardStickerCollectionViewCell _reportRearrangeStateChanged:](self, "_reportRearrangeStateChanged:", 0);
}

- (void)didLongPress:(id)a3
{
  double v4;
  void *v5;
  id v6;

  if (!self->_rearrangeMode && !-[UIKeyboardStickerCollectionViewCell isEmptyCell](self, "isEmptyCell", a3))
  {
    -[UIView frame](self, "frame");
    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v4 * 0.5, 0.0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set_ignoresKeyboardAvoidance:", 1);
    -[UIKeyboardStickerCollectionViewCell editMenuInteraction](self, "editMenuInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentEditMenuWithConfiguration:", v6);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIView *v8;
  UIView *v9;
  void **p_deleteButton;
  UIView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardStickerCollectionViewCell;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_rearrangeMode)
  {
    p_deleteButton = (void **)&self->_deleteButton;
    if (-[UIView pointInside:withEvent:](self->_deleteButton, "pointInside:withEvent:", v7, x, y))
    {
LABEL_5:
      v8 = (UIView *)*p_deleteButton;
      goto LABEL_6;
    }
    v8 = v9;
    if (v9 == self->_stickerView)
    {
      p_deleteButton = (void **)&self->_rearrangingView;
      goto LABEL_5;
    }
  }
LABEL_6:
  v11 = v8;

  return v11;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _BOOL4 v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[11];

  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 1)
  {
    objc_msgSend(getSTKImageGlyphDataSourceClass(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItem:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v10;
    v11 = objc_msgSend(v8, "isStickerSection:", objc_msgSend(v10, "section"));
    -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "stickerSourceType") == 1)
      v13 = v11;
    else
      v13 = 0;
    v33 = v13;

    -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "stickerSourceType") == 6)
      v15 = v11;
    else
      v15 = 0;
    v32 = v15;

    v31 = -[UIKeyboardStickerCollectionViewCell allowsRearrange](self, "allowsRearrange");
    -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "stickerEffectType");

    _UINSLocalizedStringWithDefaultValue(CFSTR("Rearrange"), CFSTR("Rearrange"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v39[5] = MEMORY[0x1E0C809B0];
    v39[6] = 3221225472;
    v39[7] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
    v39[8] = &unk_1E16B2C10;
    v39[9] = self;
    v35 = (void *)v18;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v20 = CFSTR("Edit Effect");
    else
      v20 = CFSTR("Add Effect");
    _UINSLocalizedStringWithDefaultValue(v20, v20);
    v39[0] = v19;
    v39[1] = 3221225472;
    v39[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
    v39[3] = &unk_1E16B2C10;
    v39[4] = self;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v30, 0, 0, v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("New Emoji"), CFSTR("New Emoji"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
    v38[3] = &unk_1E16B2C10;
    v38[4] = self;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v23, 0, 0, v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Delete"), CFSTR("Delete"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
    v37[3] = &unk_1E16B2C10;
    v37[4] = self;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v25, 0, 0, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAttributes:", 2);
    v27 = (void *)objc_opt_new();
    v28 = v27;
    if (v31)
      objc_msgSend(v27, "addObject:", v34);
    if (v33)
      objc_msgSend(v28, "addObject:", v22);
    if (v32)
      objc_msgSend(v28, "addObject:", v24);
    if (v11)
      objc_msgSend(v28, "addObject:", v26);
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

uint64_t __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tappedRearrange:", a2);
}

uint64_t __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tappedAddEffect:", a2);
}

uint64_t __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tappedNewEmoji:", a2);
}

uint64_t __97__UIKeyboardStickerCollectionViewCell_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "tappedDelete:", a2);
}

- (void)tappedRearrange:(id)a3
{
  if (!self->_rearrangeMode)
    -[UIKeyboardStickerCollectionViewCell _reportRearrangeStateChanged:](self, "_reportRearrangeStateChanged:", 1);
}

- (void)tappedAddEffect:(id)a3
{
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
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[4];
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stickerUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("UIEmojiAndStickerShouldEditNotificationUserInfoSourceRectKey");
  v32[0] = v17;
  v32[1] = v19;
  v32[2] = v21;
  v32[3] = v23;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v32, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldEditNotification"), v26, v28);

  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAlpha:", 0.0);

  v30[4] = self;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke;
  v31[3] = &unk_1E16B1B28;
  v31[4] = self;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke_2;
  v30[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v31, v30, 0.5);
}

void __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.001);

}

void __55__UIKeyboardStickerCollectionViewCell_tappedAddEffect___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stickerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)tappedNewEmoji:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell imageGlyph](self, "imageGlyph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldCreateNotification"), v5, 0);

}

- (void)_startJiggle
{
  double Height;
  double Width;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v12);
  -[UIView bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  if (Height >= Width)
    Width = Height;
  v5 = 1.0 / (Width / 100.0);
  if (v5 >= 1.0)
    v6 = 0.03;
  else
    v6 = v5 * 0.03;
  -[UIKeyboardStickerCollectionViewCell _jiggleAnimationWithVariation:keyPath:duration:](self, "_jiggleAnimationWithVariation:keyPath:duration:", CFSTR("transform.translation.x"), 0.4, 0.134);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell _jiggleAnimationWithVariation:keyPath:duration:](self, "_jiggleAnimationWithVariation:keyPath:duration:", CFSTR("transform.translation.y"), 0.4, 0.142);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell _jiggleAnimationWithVariation:keyPath:duration:](self, "_jiggleAnimationWithVariation:keyPath:duration:", CFSTR("transform.rotation"), -v6, 0.128);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("XTranslationJitterAnimation"));
  objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("YTranslationJitterAnimation"));
  objc_msgSend(v10, "addAnimation:forKey:", v8, CFSTR("RotationJitterAnimation"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setIsDragInteractionEnabled:", 0);

}

- (void)_endJiggle
{
  void *v2;
  id v3;

  -[UIKeyboardStickerCollectionViewCell stickerView](self, "stickerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setIsDragInteractionEnabled:", 1);

}

- (double)_jiggleTranslationAnimationTranslation:(double)a3
{
  return a3 * 0.4;
}

- (id)_jiggleAnimationWithVariation:(double)a3 keyPath:(id)a4 duration:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDuration:", a5);
  objc_msgSend(v7, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v9);

  LODWORD(v10) = 1052266988;
  LODWORD(v11) = 1059145646;
  LODWORD(v12) = 0;
  LODWORD(v13) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v14);

  LODWORD(v15) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v15);
  objc_msgSend(v7, "setAutoreverses:", 1);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  return v7;
}

- (STKImageGlyph)imageGlyph
{
  return self->_imageGlyph;
}

- (BOOL)rearrangeMode
{
  return self->_rearrangeMode;
}

- (UIKeyboardEmojiAndStickerCollectionViewCellDelegate)delegate
{
  return (UIKeyboardEmojiAndStickerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)stickerView
{
  return self->_stickerView;
}

- (void)setStickerView:(id)a3
{
  objc_storeStrong((id *)&self->_stickerView, a3);
}

- (void)setRearrangingView:(id)a3
{
  objc_storeStrong((id *)&self->_rearrangingView, a3);
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (UITapGestureRecognizer)rearrangeViewTapGR
{
  return self->_rearrangeViewTapGR;
}

- (void)setRearrangeViewTapGR:(id)a3
{
  objc_storeStrong((id *)&self->_rearrangeViewTapGR, a3);
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->_longPressGR;
}

- (void)setLongPressGR:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGR, a3);
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->_editMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editMenuInteraction, a3);
}

- (UIView)navigationHighlightView
{
  return self->_navigationHighlightView;
}

- (void)setNavigationHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHighlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationHighlightView, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGR, 0);
  objc_storeStrong((id *)&self->_rearrangeViewTapGR, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_rearrangingView, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageGlyph, 0);
}

@end
