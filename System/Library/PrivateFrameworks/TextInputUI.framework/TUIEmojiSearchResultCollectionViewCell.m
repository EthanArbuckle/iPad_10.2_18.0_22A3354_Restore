@implementation TUIEmojiSearchResultCollectionViewCell

- (TUIEmojiSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  TUIEmojiSearchResultCollectionViewCell *v3;
  uint64_t v4;
  _TUIKeyboardEmojiDraggableView *emojiLabel;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  v3 = -[TUIEmojiSearchResultCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_createDraggableEmojiLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    emojiLabel = v3->_emojiLabel;
    v3->_emojiLabel = (_TUIKeyboardEmojiDraggableView *)v4;

    -[TUIEmojiSearchResultCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_emojiLabel);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIEmojiSearchResultCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v7);

    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIEmojiSearchResultCollectionViewCell setBackgroundView:](v3, "setBackgroundView:", v9);

    -[TUIEmojiSearchResultCollectionViewCell backgroundView](v3, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 5.0);

    -[TUIEmojiSearchResultCollectionViewCell backgroundView](v3, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 1);

  }
  return v3;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  -[TUIEmojiSearchResultCollectionViewCell layoutSubviews](&v21, sel_layoutSubviews);
  -[TUIEmojiSearchResultCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIEmojiSearchResultCollectionViewCell backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TUIEmojiSearchResultCollectionViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  UIRectGetCenter();
  -[_TUIKeyboardEmojiDraggableView setCenter:](self->_emojiLabel, "setCenter:");
  -[_TUIKeyboardEmojiDraggableView setBounds:](self->_emojiLabel, "setBounds:", v14, v16, v18, v20);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIEmojiSearchResultCollectionViewCell;
  -[TUIEmojiSearchResultCollectionViewCell setHighlighted:](&v8, sel_setHighlighted_);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[TUIEmojiSearchResultCollectionViewCell backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

}

- (void)setDisplayedEmojiString:(id)a3
{
  -[TUIEmojiSearchResultCollectionViewCell setDisplayedEmojiString:animated:withAnimationOffset:](self, "setDisplayedEmojiString:animated:withAnimationOffset:", a3, 0, 0);
}

- (void)setDisplayedEmojiString:(id)a3 animated:(BOOL)a4 withAnimationOffset:(unint64_t)a5
{
  _BOOL4 v6;
  id v9;
  NSAttributedString **p_displayedEmojiString;
  NSAttributedString *v11;
  double v12;
  uint64_t v13;
  UILabel *v14;
  UILabel *animationFromLabel;
  UILabel *animationToLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  UILabel *v20;
  UILabel *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  _QWORD v25[4];
  UILabel *v26;
  TUIEmojiSearchResultCollectionViewCell *v27;
  _QWORD v28[4];
  UILabel *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _QWORD v32[4];
  UILabel *v33;
  _QWORD v34[4];
  UILabel *v35;
  _QWORD v36[5];
  _QWORD v37[7];

  v6 = a4;
  v9 = a3;
  p_displayedEmojiString = &self->_displayedEmojiString;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_displayedEmojiString, "isEqualToAttributedString:", v9))
  {
    v11 = *p_displayedEmojiString;
    objc_storeStrong((id *)&self->_displayedEmojiString, a3);
    -[_TUIKeyboardEmojiDraggableView setAttributedText:](self->_emojiLabel, "setAttributedText:", *p_displayedEmojiString);
    if (v6)
    {
      v12 = (double)a5 * 0.03;
      ++self->_nestedAnimationCount;
      -[_TUIKeyboardEmojiDraggableView setHidden:](self->_emojiLabel, "setHidden:", 1);
      v13 = MEMORY[0x1E0C809B0];
      if (!self->_animationFromLabel)
      {
        objc_msgSend((id)objc_opt_class(), "_createEmojiLabel");
        v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
        animationFromLabel = self->_animationFromLabel;
        self->_animationFromLabel = v14;

        -[UILabel setAttributedText:](self->_animationFromLabel, "setAttributedText:", v11);
        -[_TUIKeyboardEmojiDraggableView frame](self->_emojiLabel, "frame");
        -[UILabel setFrame:](self->_animationFromLabel, "setFrame:");
        -[TUIEmojiSearchResultCollectionViewCell addSubview:](self, "addSubview:", self->_animationFromLabel);
        v36[4] = self;
        v37[0] = v13;
        v37[1] = 3221225472;
        v37[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke;
        v37[3] = &unk_1E24FC068;
        v37[4] = self;
        v36[0] = v13;
        v36[1] = 3221225472;
        v36[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_2;
        v36[3] = &unk_1E24FBBC0;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v37, v36, 0.4, v12, 1.0, 1.0);
      }
      animationToLabel = self->_animationToLabel;
      if (animationToLabel)
      {
        v17 = animationToLabel;
        v18 = (void *)MEMORY[0x1E0DC3F10];
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_3;
        v34[3] = &unk_1E24FC068;
        v35 = v17;
        v32[0] = v13;
        v32[1] = 3221225472;
        v32[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_4;
        v32[3] = &unk_1E24FBBC0;
        v33 = v35;
        v19 = v35;
        objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 4, v34, v32, 0.2, 0.0);

        v13 = MEMORY[0x1E0C809B0];
      }
      objc_msgSend((id)objc_opt_class(), "_createEmojiLabel");
      v20 = (UILabel *)objc_claimAutoreleasedReturnValue();
      v21 = self->_animationToLabel;
      self->_animationToLabel = v20;

      -[UILabel setAttributedText:](self->_animationToLabel, "setAttributedText:", *p_displayedEmojiString);
      -[_TUIKeyboardEmojiDraggableView frame](self->_emojiLabel, "frame");
      -[UILabel setFrame:](self->_animationToLabel, "setFrame:");
      -[TUIEmojiSearchResultCollectionViewCell addSubview:](self, "addSubview:", self->_animationToLabel);
      v22 = self->_animationToLabel;
      -[UILabel setAlpha:](v22, "setAlpha:", 0.0);
      CGAffineTransformMakeScale(&v31, 0.001, 0.001);
      v30 = v31;
      -[UILabel setTransform:](v22, "setTransform:", &v30);
      v23 = (void *)MEMORY[0x1E0DC3F10];
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_5;
      v28[3] = &unk_1E24FC068;
      v29 = v22;
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_6;
      v25[3] = &unk_1E24FBBE8;
      v26 = v29;
      v27 = self;
      v24 = v29;
      objc_msgSend(v23, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v28, v25, 0.4, v12, 1.0, 1.0);

    }
  }

}

- (void)setDragEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_TUIKeyboardEmojiDraggableView setDragEnabled:](self->_emojiLabel, "setDragEnabled:", v3);
}

- (NSAttributedString)displayedEmojiString
{
  return self->_displayedEmojiString;
}

- (BOOL)dragEnabled
{
  return self->_dragEnabled;
}

- (_TUIKeyboardEmojiDraggableView)emojiLabel
{
  return self->_emojiLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_displayedEmojiString, 0);
  objc_storeStrong((id *)&self->_animationToLabel, 0);
  objc_storeStrong((id *)&self->_animationFromLabel, 0);
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 648);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 648);
  *(_QWORD *)(v2 + 648) = 0;

}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_3(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.001, 0.001);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
  return result;
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_5(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __95__TUIEmojiSearchResultCollectionViewCell_setDisplayedEmojiString_animated_withAnimationOffset___block_invoke_6(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 664);
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v3 + 664))
  {
    v4 = *(void **)(v3 + 656);
    *(_QWORD *)(v3 + 656) = 0;

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 688), "setHidden:", 0);
  }
  return result;
}

+ (id)reuseIdentifier
{
  return CFSTR("esearchresultcell");
}

+ (id)_createDraggableEmojiLabel
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("UIKeyboardEmojiDraggableView"))), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "_createEmojiLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)_createEmojiLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0DC3990]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "setBaselineAdjustment:", 1);
  return v3;
}

@end
