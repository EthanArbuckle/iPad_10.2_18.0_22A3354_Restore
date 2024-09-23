@implementation UIKeyboardEmojiDraggableView

- (UIKeyboardEmojiDraggableView)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiDraggableView *v3;
  UIKeyboardEmojiDraggableView *v4;
  uint64_t v5;
  UIFont *font;
  uint64_t v7;
  UILabel *fixedLabel;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiDraggableView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIKeyboardEmojiDraggableView updateLiftScale](v3, "updateLiftScale");
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 32.0);
    v5 = objc_claimAutoreleasedReturnValue();
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    -[UIKeyboardEmojiDraggableView createLabel](v4, "createLabel");
    v7 = objc_claimAutoreleasedReturnValue();
    fixedLabel = v4->_fixedLabel;
    v4->_fixedLabel = (UILabel *)v7;

    -[UIView addSubview:](v4, "addSubview:", v4->_fixedLabel);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    -[UIKeyboardEmojiDraggableView updateDragInteraction](v4, "updateDragInteraction");
  }
  return v4;
}

- (void)updateLiftScale
{
  self->_liftScale = 1.0;
}

- (id)createLabel
{
  UILabel *v3;
  UILabel *v4;

  v3 = [UILabel alloc];
  v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UILabel setFont:](v4, "setFont:", self->_font);
  -[UIView setOpaque:](v4, "setOpaque:", 0);
  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 1);
  -[UILabel setText:](v4, "setText:", self->_text);
  -[UIView bounds](self, "bounds");
  -[UILabel setFrame:](v4, "setFrame:");
  return v4;
}

- (id)newLiftContainerView
{
  double liftScale;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *v10;
  UIView *v11;
  UIImageView *v12;
  UIImageView *upscaledImageView;
  UILabel *v14;
  UILabel *previewLabel;
  UIFont *font;
  double v17;
  void *v18;
  NSString *text;
  UIView *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  UIKeyboardEmojiDraggableView *v26;
  UIView *v27;

  -[UIView bounds](self, "bounds");
  liftScale = self->_liftScale;
  v5 = v4 * liftScale;
  v7 = v6 * liftScale;
  v8 = v4 * liftScale * 0.5;
  v9 = v6 * liftScale * 0.5;
  v10 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v4 * liftScale, v6 * liftScale);
  v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v5, v7);
  -[UIView addSubview:](v10, "addSubview:", v11);
  v12 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", 0.0, 0.0, v5, v7);
  upscaledImageView = self->_upscaledImageView;
  self->_upscaledImageView = v12;

  -[UIImageView setContentMode:](self->_upscaledImageView, "setContentMode:", 1);
  -[UIKeyboardEmojiDraggableView createLabel](self, "createLabel");
  v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
  previewLabel = self->_previewLabel;
  self->_previewLabel = v14;

  font = self->_font;
  -[UIFont pointSize](font, "pointSize");
  -[UIFont fontWithSize:](font, "fontWithSize:", v17 * self->_liftScale);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_previewLabel, "setFont:", v18);

  -[UILabel setBounds:](self->_previewLabel, "setBounds:", 0.0, 0.0, v5, v7);
  -[UIView setCenter:](self->_previewLabel, "setCenter:", v8, v9);
  -[UIView addSubview:](v11, "addSubview:", self->_previewLabel);
  text = self->_text;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __52__UIKeyboardEmojiDraggableView_newLiftContainerView__block_invoke;
  v25 = &unk_1E16B77F8;
  v26 = self;
  v27 = v11;
  v20 = v11;
  -[UIKeyboardEmojiDraggableView generateEmoji:withCompletion:](self, "generateEmoji:withCompletion:", text, &v22);
  -[UIKeyboardEmojiDraggableView addSilhouetteFiltersToView:](self, "addSilhouetteFiltersToView:", self->_fixedLabel, v22, v23, v24, v25, v26);
  self->_lifted = 1;

  return v10;
}

void __52__UIKeyboardEmojiDraggableView_newLiftContainerView__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setImage:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 432);
  *(_QWORD *)(v3 + 432) = 0;

}

- (void)reset
{
  void *v3;
  UIView *liftContainerView;
  UILabel *previewLabel;
  UIImageView *upscaledImageView;
  _MSStickerDragPreviewContainerView *container;

  -[UIView layer](self->_fixedLabel, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

  -[UIView removeFromSuperview](self->_liftContainerView, "removeFromSuperview");
  liftContainerView = self->_liftContainerView;
  self->_liftContainerView = 0;

  previewLabel = self->_previewLabel;
  self->_previewLabel = 0;

  upscaledImageView = self->_upscaledImageView;
  self->_upscaledImageView = 0;

  container = self->_container;
  self->_container = 0;

  self->_lifted = 0;
  self->_shouldLiftFromLastTouchLocation = 0;
  -[UIDragInteraction setEnabled:](self->_dragInteraction, "setEnabled:", self->_dragEnabled);
}

- (void)setFont:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_font, a3);
  v5 = a3;
  -[UILabel setFont:](self->_fixedLabel, "setFont:", v5);

}

- (void)setText:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if ((-[NSString isEqual:](self->_text, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    if (v7)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
    else
      v5 = 0;
    objc_storeStrong((id *)&self->_attributedText, v5);
    v6 = v7;
    if (v7)
    {

      v6 = v7;
    }
    -[UILabel setText:](self->_fixedLabel, "setText:", v6);
    -[UIKeyboardEmojiDraggableView reset](self, "reset");
  }

}

- (void)setAttributedText:(id)a3
{
  NSString *v5;
  NSString *text;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((-[NSAttributedString isEqual:](self->_attributedText, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedText, a3);
    objc_msgSend(v9, "string");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v5;

    objc_msgSend(v9, "attributesAtIndex:effectiveRange:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong((id *)&self->_font, v8);
    -[UILabel setAttributedText:](self->_fixedLabel, "setAttributedText:", v9);
    -[UIKeyboardEmojiDraggableView reset](self, "reset");

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_fixedLabel, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiDraggableView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UILabel setFrame:](self->_fixedLabel, "setFrame:");
  -[UIKeyboardEmojiDraggableView updateLiftScale](self, "updateLiftScale");
}

- (void)addSilhouetteFiltersToView:(id)a3
{
  id v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  int v22;
  float v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29[2];

  v29[1] = *(double *)MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v26, &v27, &v28, v29);

  v5 = v26;
  v6 = v27;
  v7 = v28;
  v8 = v29[0];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = 0;
  v14 = v5;
  v16 = 0;
  v15 = 0;
  v17 = v6;
  v18 = 0;
  v19 = 0;
  v20 = v7;
  v21 = 0;
  v22 = 0;
  v23 = v8;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, *MEMORY[0x1E0CD2D20]);

  v25 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setFilters:", v11);
}

- (void)updateDragInteraction
{
  void *v3;
  void *v4;
  int v5;
  UIDragInteraction *dragInteraction;
  char v7;
  UIDragInteraction *v8;
  UIDragInteraction *v9;
  UIDragInteraction *v10;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLForPreferenceKey:", CFSTR("ShowStickers")) & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = _UIApplicationIsFirstPartyStickers() ^ 1;

  dragInteraction = self->_dragInteraction;
  if (self->_dragEnabled)
  {
    if (dragInteraction)
      v7 = 1;
    else
      v7 = v5;
    if ((v7 & 1) == 0)
    {
      v8 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
      v9 = self->_dragInteraction;
      self->_dragInteraction = v8;

      -[UIView addInteraction:](self, "addInteraction:", self->_dragInteraction);
    }
  }
  else if (dragInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    v10 = self->_dragInteraction;
    self->_dragInteraction = 0;

  }
}

- (void)setDragEnabled:(BOOL)a3
{
  self->_dragEnabled = a3;
  -[UIKeyboardEmojiDraggableView updateDragInteraction](self, "updateDragInteraction");
}

- (void)setEmojiPopoverBackgroundHitTestingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emojiPopoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setOverrideAllowsHitTestingOnBackgroundViews:", v3);
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  id v6;

  v5 = (id)objc_msgSend(getTUIEmojiUpscalerClass(), "sharedInstance");
  -[UIKeyboardEmojiDraggableView setEmojiPopoverBackgroundHitTestingEnabled:](self, "setEmojiPopoverBackgroundHitTestingEnabled:", 0);
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillBeginLiftEmoji"), self, 0);

  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id WeakRetained;
  char v8;
  id v9;
  id v10;
  id v11;

  -[UIKeyboardEmojiDraggableView setEmojiPopoverBackgroundHitTestingEnabled:](self, "setEmojiPopoverBackgroundHitTestingEnabled:", 1, a4);
  -[UIKeyboardEmojiDraggableView reset](self, "reset");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "dragDidEnd:withOperation:", self, a5);

  }
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v10 = -[_UIStickerUsageEvent initForEmojiKeyboardUsage]([_UIStickerUsageEvent alloc], "initForEmojiKeyboardUsage");
    objc_msgSend(v10, "setUsageType:", 1);
    objc_msgSend(v10, "send");

  }
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillEndLiftEmoji"), self, 0);

  }
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  UIKeyboardEmojiDraggableViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "dragWillBegin:", self);

  }
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__UIKeyboardEmojiDraggableView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v7[3] = &unk_1E16B42D0;
  v7[4] = self;
  objc_msgSend(a5, "addCompletion:", v7, a4);
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillCancelLiftEmoji"), self, 0);

  }
}

uint64_t __83__UIKeyboardEmojiDraggableView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)generateEmoji:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getTUIEmojiUpscalerClass(), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke;
  v9[3] = &unk_1E16B7820;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "generateEmoji:completion:", v6, v9);

}

void __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke_2;
  v13[3] = &unk_1E16B4420;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v17 = *(id *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __61__UIKeyboardEmojiDraggableView_generateEmoji_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = *(id *)(a1 + 40);
    if (!v2)
      v2 = *(id *)(a1 + 48);
    v3 = v2;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)registerPlainText:(id)a3 toItemProvider:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0CEC590];
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__UIKeyboardEmojiDraggableView_registerPlainText_toItemProvider___block_invoke;
  v10[3] = &unk_1E16B5178;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v8, 0, v10);

}

uint64_t __65__UIKeyboardEmojiDraggableView_registerPlainText_toItemProvider___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  NSString *v6;
  int v7;
  uint64_t v8;
  NSString *v9;
  UIDragItem *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  UIKeyboardEmojiDraggableView *v17;
  NSString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v6 = self->_text;
  if (dyld_program_sdk_at_least() && (_UIApplicationIsFirstPartyStickers() & 1) == 0)
  {
    -[UIKeyboardEmojiDraggableView registerPlainText:toItemProvider:](self, "registerPlainText:toItemProvider:", v6, v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  v8 = objc_opt_class();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke;
  v16 = &unk_1E16B7870;
  v17 = self;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v5, "registerObjectOfClass:visibility:loadHandler:", v8, 0, &v13);
  if (v7)
    -[UIKeyboardEmojiDraggableView registerPlainText:toItemProvider:](self, "registerPlainText:toItemProvider:", v9, v5, v13, v14, v15, v16, v17);
  objc_msgSend(v5, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.sticker"), 0, &__block_literal_global_82, v13, v14, v15, v16, v17);
  v10 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v5);
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_2;
  v8[3] = &unk_1E16B7848;
  v8[4] = v5;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "generateEmoji:withCompletion:", v4, v8);

  return 0;
}

void __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, UIImage *image, uint64_t a3)
{
  UIImage *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  id v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    UIImagePNGRepresentation(image);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = [UIImage alloc];
    objc_msgSend(*(id *)(a1 + 32), "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v7 = -[UIImage initWithData:scale:](v4, "initWithData:scale:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __73__UIKeyboardEmojiDraggableView_dragInteraction_itemsForBeginningSession___block_invoke_3(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIView *v11;
  UIView *liftContainerView;
  UIDragPreviewParameters *v13;
  UIBezierPath *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double x;
  double v24;
  double y;
  double v26;
  double v27;
  UIDragPreviewTarget *v28;
  void *v29;
  UIDragPreviewTarget *v30;
  UITargetedDragPreview *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  objc_class *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[UIKeyboardEmojiDraggableView newLiftContainerView](self, "newLiftContainerView");
  liftContainerView = self->_liftContainerView;
  self->_liftContainerView = v11;

  v13 = objc_alloc_init(UIDragPreviewParameters);
  v14 = objc_alloc_init(UIBezierPath);
  -[UIPreviewParameters setShadowPath:](v13, "setShadowPath:", v14);

  +[UIColor clearColor](UIColor, "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewParameters setBackgroundColor:](v13, "setBackgroundColor:", v15);

  -[UIView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView center](self, "center");
  v18 = v17;
  v20 = v19;
  -[UIView superview](self, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:fromView:", v21, v18, v20);
  x = v22;
  y = v24;

  if (self->_shouldLiftFromLastTouchLocation)
  {
    x = self->_lastTouchLocation.x;
    y = self->_lastTouchLocation.y;
  }
  -[UIView bounds](self, "bounds");
  v27 = 60.0;
  memset(&v45.c, 0, 32);
  if (v26 > 1.0)
    v27 = 60.0 / v26;
  *(_OWORD *)&v45.a = 0uLL;
  CGAffineTransformMakeScale(&v45, v27, v27);
  -[UIView setCenter:](self->_liftContainerView, "setCenter:", x, y);
  v28 = [UIDragPreviewTarget alloc];
  -[UIView window](self, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v45;
  v30 = -[UIPreviewTarget initWithContainer:center:transform:](v28, "initWithContainer:center:transform:", v29, &v44, x, y);

  v31 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", self->_liftContainerView, v13, v30);
  objc_msgSend(getTUIEmojiUpscalerClass(), "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "imageFromEmoji:", self->_text);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v34 = (void *)qword_1ECD79D38;
    v49 = qword_1ECD79D38;
    if (!qword_1ECD79D38)
    {
      *(_QWORD *)&v44.a = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v44.b = 3221225472;
      *(_QWORD *)&v44.c = __get_MSStickerDragPreviewContainerViewClass_block_invoke;
      *(_QWORD *)&v44.d = &unk_1E16B14C0;
      *(_QWORD *)&v44.tx = &v46;
      __get_MSStickerDragPreviewContainerViewClass_block_invoke((uint64_t)&v44);
      v34 = (void *)v47[3];
    }
    v35 = v9;
    v36 = v8;
    v37 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v46, 8);
    if (v37
      && -[objc_class instancesRespondToSelector:](v37, "instancesRespondToSelector:", sel_initWithIsDropAnimation_))
    {
      v43 = v33;
      v38 = (void *)objc_msgSend([v37 alloc], "initWithIsDropAnimation:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v38, "setImage:", v43);
        objc_msgSend(v38, "setUseEmojiKeyboardMeshTransform:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UIView frame](self, "frame");
          objc_msgSend(v38, "setInitialSize:", v39, v40);
        }
        -[UITargetedDragPreview _setPreviewContainer:](v31, "_setPreviewContainer:", v38);
        objc_storeStrong((id *)&self->_container, v38);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[objc_class shadowPropertiesForDrag](v37, "shadowPropertiesForDrag");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDragPreviewParameters _setShadowProperties:](v13, "_setShadowProperties:", v41);

      }
      v33 = v43;
    }

    v8 = v36;
    v9 = v35;
  }

  return v31;
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "set_rotatable:", 1);
  objc_msgSend(v4, "set_resizable:", 1);
  objc_msgSend(v4, "set_maximumResizableSize:", 300.0, 300.0);
  objc_msgSend(v4, "set_wantsElasticEffects:", 1);
  objc_msgSend(v4, "set_avoidsKeyboardSuppression:", 1);
  return v4;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  _MSStickerDragPreviewContainerView *container;
  void *v5;
  _QWORD v6[5];

  container = self->_container;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__UIKeyboardEmojiDraggableView__dragInteractionDidCancelLiftWithoutDragging___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  -[_MSStickerDragPreviewContainerView _animateLiftCancellationAlongsideAnimator:completion:](container, "_animateLiftCancellationAlongsideAnimator:completion:", 0, v6);
  if (_UIApplicationIsFirstPartyStickers())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardWillCancelLiftEmoji"), self, 0);

  }
}

uint64_t __77__UIKeyboardEmojiDraggableView__dragInteractionDidCancelLiftWithoutDragging___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardEmojiDraggableView;
  -[UIResponder touchesBegan:withEvent:](&v21, sel_touchesBegan_withEvent_, a3, a4);
  if (_UIApplicationIsFirstPartyStickers())
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self, "frame");
    objc_msgSend(v5, "convertRect:toView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[UIKeyboardEmojiDraggableView text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v14)
    {
      if (v15)
      {
        v23[0] = v14;
        v22[0] = CFSTR("emoji");
        v22[1] = CFSTR("frame");
        v20[0] = v7;
        v20[1] = v9;
        v20[2] = v11;
        v20[3] = v13;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v20, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = CFSTR("window");
        v23[1] = v17;
        v23[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardBeganTouchEmoji"), self, v18);

      }
    }

  }
}

- (void)willCancelVariantsWithTouch:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  UIDragInteraction *dragInteraction;
  _QWORD v9[5];

  v4 = a3;
  if (!-[UIKeyboardEmojiDraggableView dragEnabled](self, "dragEnabled"))
  {
    -[UIKeyboardEmojiDraggableView setDragEnabled:](self, "setDragEnabled:", 1);
    self->_dragEnabled = 0;
    self->_shouldLiftFromLastTouchLocation = 1;
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    self->_lastTouchLocation.x = v6;
    self->_lastTouchLocation.y = v7;

    dragInteraction = self->_dragInteraction;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__UIKeyboardEmojiDraggableView_willCancelVariantsWithTouch___block_invoke;
    v9[3] = &unk_1E16B3FD8;
    v9[4] = self;
    -[UIDragInteraction _immediatelyBeginDragWithTouch:completion:](dragInteraction, "_immediatelyBeginDragWithTouch:completion:", v4, v9);
  }

}

uint64_t __60__UIKeyboardEmojiDraggableView_willCancelVariantsWithTouch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (UIKeyboardEmojiDraggableViewDelegate)delegate
{
  return (UIKeyboardEmojiDraggableViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)text
{
  return self->_text;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)dragEnabled
{
  return self->_dragEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_upscaledImageView, 0);
  objc_storeStrong((id *)&self->_previewLabel, 0);
  objc_storeStrong((id *)&self->_liftContainerView, 0);
  objc_storeStrong((id *)&self->_fixedLabel, 0);
}

@end
