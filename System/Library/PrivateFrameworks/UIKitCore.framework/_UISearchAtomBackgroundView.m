@implementation _UISearchAtomBackgroundView

- (_UISearchAtomBackgroundView)initWithFrame:(CGRect)a3
{
  _UISearchAtomBackgroundView *v3;
  _UISearchAtomBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchAtomBackgroundView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UISearchAtomBackgroundView _updateSelectionStyleMask](v3, "_updateSelectionStyleMask");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISearchAtomBackgroundView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UISearchAtomBackgroundView _updateSelectionStyleMask](self, "_updateSelectionStyleMask");
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_visualEffectView, "setFrame:");
}

- (void)setSelectionStyle:(int64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    -[_UISearchAtomBackgroundView _updateSelectionStyleMask](self, "_updateSelectionStyleMask");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setBlurEffect:(id)a3
{
  UIBlurEffect *v4;
  UIBlurEffect *blurEffect;

  v4 = (UIBlurEffect *)a3;
  -[_UISearchAtomBackgroundView _transitionFromBlurEffect:toBlurEffect:](self, "_transitionFromBlurEffect:toBlurEffect:", self->_blurEffect, v4);
  blurEffect = self->_blurEffect;
  self->_blurEffect = v4;

}

- (void)_transitionFromBlurEffect:(id)a3 toBlurEffect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIVisualEffectView *v10;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v12;
  void (**v13)(void *, uint64_t, _QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  _UISearchAtomBackgroundView *v18;
  UIVisualEffectView *v19;
  id v20;
  _QWORD v21[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (!v6 && v7)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke;
    v21[3] = &unk_1E16B1B28;
    v21[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
  }
  -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v6);
  if (v6 && !v8)
  {
    v10 = self->_visualEffectView;
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = 0;

    -[UIVisualEffectView setEffect:](v10, "setEffect:", 0);
    v14 = v9;
    v15 = 3221225472;
    v16 = __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke_2;
    v17 = &unk_1E16B7A10;
    v18 = self;
    v19 = v10;
    v20 = v6;
    v12 = v10;
    v13 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v14);
    if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", v14, v15, v16, v17, v18)|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v13))
    {
      v13[2](v13, 1, 0);
    }

  }
}

- (void)_updateSelectionStyleMask
{
  int64_t selectionStyle;
  uint64_t v4;
  void *v5;
  UIVisualEffectView *visualEffectView;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  selectionStyle = self->_selectionStyle;
  if (selectionStyle > 7)
  {
    if (selectionStyle == 8)
    {
      v4 = 5;
      goto LABEL_12;
    }
    if (selectionStyle == 12)
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
LABEL_10:
    NSLog(CFSTR("unexpected selection style: %lx"), a2, self->_selectionStyle);
    goto LABEL_11;
  }
  if ((unint64_t)selectionStyle >= 2)
  {
    if (selectionStyle == 4)
    {
      v4 = 10;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v4 = 15;
LABEL_12:
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", v4);

  visualEffectView = self->_visualEffectView;
  -[UIView layer](self, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cornerRadius");
  v8 = v7;
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _setCornerRadius:continuous:maskedCorners:](visualEffectView, "_setCornerRadius:continuous:maskedCorners:", v10 == (void *)*MEMORY[0x1E0CD2A68], v4, v8);

}

- (int64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
