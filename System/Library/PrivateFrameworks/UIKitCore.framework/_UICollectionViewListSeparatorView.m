@implementation _UICollectionViewListSeparatorView

- (void)applyLayoutAttributes:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UICollectionViewListSeparatorView;
  v4 = (id *)a3;
  -[UICollectionReusableView applyLayoutAttributes:](&v14, sel_applyLayoutAttributes_, v4);
  -[UIView traitCollection](self, "traitCollection", v14.receiver, v14.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewLayoutAttributes _existingListAttributes](v4);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(id *)(v7 + 48);
    v9 = *(void **)(v7 + 56);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = v9;
  v11 = v10;
  if (!v8 && v10)
  {
    if (v7 && (v12 = *(_QWORD *)(v7 + 16) - 1, v12 <= 2))
      v13 = qword_18667CB98[v12];
    else
      v13 = 0;
    objc_msgSend(v6, "defaultSeparatorColorForTableViewStyle:", v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v10)
  {
LABEL_12:
    -[_UICollectionViewListSeparatorView _setUpEffectViewWithEffect:](self, "_setUpEffectViewWithEffect:", v11);
    goto LABEL_13;
  }
  -[_UICollectionViewListSeparatorView _tearDownEffectView](self, "_tearDownEffectView");
LABEL_13:
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v8);

}

- (void)_tearDownEffectView
{
  UIVisualEffectView *effectView;

  -[UIView removeFromSuperview](self->_effectView, "removeFromSuperview");
  effectView = self->_effectView;
  self->_effectView = 0;

}

- (_UICollectionViewListSeparatorView)initWithFrame:(CGRect)a3
{
  _UICollectionViewListSeparatorView *v3;
  _UICollectionViewListSeparatorView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

  }
  return v4;
}

- (void)_setUpEffectViewWithEffect:(id)a3
{
  UIVisualEffectView *effectView;
  void *v6;
  char isKindOfClass;
  char v8;
  char v9;
  char v10;
  UIVisualEffectView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIVisualEffectView *v18;
  UIVisualEffectView *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];

  v22 = a3;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListSeparatorView.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effect != nil"));

  }
  effectView = self->_effectView;
  if (effectView)
  {
    -[UIVisualEffectView effect](effectView, "effect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v8 = isKindOfClass ^ 1;
  }
  else
  {
    v8 = 1;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  v10 = v9;
  if ((v8 & 1) == 0 && (v9 & 1) == 0)
    -[_UICollectionViewListSeparatorView _tearDownEffectView](self, "_tearDownEffectView");
  v11 = self->_effectView;
  if (!v11)
  {
    v18 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v22);
    v19 = self->_effectView;
    self->_effectView = v18;

    -[UIView layer](self->_effectView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsEdgeAntialiasing:", 1);

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65___UICollectionViewListSeparatorView__setUpEffectViewWithEffect___block_invoke;
    v23[3] = &unk_1E16B1B28;
    v23[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
    -[UIView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self, "addSubview:", self->_effectView);
    if ((v10 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[UIVisualEffectView setEffect:](v11, "setEffect:", v22);
  if ((v10 & 1) != 0)
  {
LABEL_11:
    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 1);

    -[UIVisualEffectView contentView](self->_effectView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 0);

  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end
