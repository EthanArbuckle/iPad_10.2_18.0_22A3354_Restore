@implementation _UIHorizontalIndexTitleBarCell

+ (id)cellFont
{
  if (qword_1ECD7A5A8 != -1)
    dispatch_once(&qword_1ECD7A5A8, &__block_literal_global_215);
  return (id)_MergedGlobals_3_9;
}

- (_UIHorizontalIndexTitleBarCell)initWithFrame:(CGRect)a3
{
  _UIHorizontalIndexTitleBarCell *v3;
  UIView *v4;
  uint64_t v5;
  UIView *roundedCornersBackground;
  void *v7;
  void *v8;
  UILabel *v9;
  uint64_t v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    roundedCornersBackground = v3->_roundedCornersBackground;
    v3->_roundedCornersBackground = (UIView *)v5;

    -[UIView layer](v3->_roundedCornersBackground, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 10.0);

    -[UIView layer](v3->_roundedCornersBackground, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[UIView setHidden:](v3->_roundedCornersBackground, "setHidden:", 1);
    -[UIView setAutoresizingMask:](v3->_roundedCornersBackground, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v3, "addSubview:", v3->_roundedCornersBackground);
    v9 = [UILabel alloc];
    -[UIView bounds](v3, "bounds");
    v10 = -[UILabel initWithFrame:](v9, "initWithFrame:");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v10;

    +[UIColor whiteColor](UIColor, "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v12);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    +[_UIHorizontalIndexTitleBarCell cellFont](_UIHorizontalIndexTitleBarCell, "cellFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v13);

    -[UIView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v24 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leftAnchor](v3->_titleLabel, "leftAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v3, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 14.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v26;
    -[UIView topAnchor](v3->_titleLabel, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    -[UIView rightAnchor](v3->_titleLabel, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v3, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v18;
    -[UIView bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v22);

    -[_UIHorizontalIndexTitleBarCell _updateColors](v3, "_updateColors");
  }
  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  -[_UIHorizontalIndexTitleBarCell _maxCellWidth](self, "_maxCellWidth");
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "size");
  if (v6 >= v9)
    v6 = v9;
  objc_msgSend(v8, "size");
  objc_msgSend(v8, "setSize:", v6);
  return v8;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  -[UICollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[_UIHorizontalIndexTitleBarCell setEntry:](self, "setEntry:", 0);
  -[_UIHorizontalIndexTitleBarCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[_UIHorizontalIndexTitleBarCell roundedCornersBackground](self, "roundedCornersBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  v4 = a3;
  -[UICollectionViewCell traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  _BOOL4 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v7, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  v5 = -[UICollectionViewCell isFocused](self, "isFocused");
  -[_UIHorizontalIndexTitleBarCell roundedCornersBackground](self, "roundedCornersBackground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", !v5);

  -[_UIHorizontalIndexTitleBarCell _updateColors](self, "_updateColors");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIHorizontalIndexTitleBarCell;
  -[UICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[_UIHorizontalIndexTitleBarCell _updateColors](self, "_updateColors");
}

- (void)updateForEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIHorizontalIndexTitleBarCell setEntry:](self, "setEntry:", v4);
  objc_msgSend(v4, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIHorizontalIndexTitleBarCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

}

- (double)_maxCellWidth
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double result;

  -[UICollectionReusableView _collectionView](self, "_collectionView");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 760.0;
  if (v3)
  {
    v5 = (void *)v3;
    -[UICollectionReusableView _collectionView](self, "_collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;

    if (v8 != 0.0)
    {
      -[UICollectionReusableView _collectionView](self, "_collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;

      v4 = v11 * 0.5 + -200.0;
    }
  }
  result = 200.0;
  if (v4 >= 200.0)
    return v4;
  return result;
}

- (BOOL)_isAnotherIndexTitleCellFocused
{
  void *v3;
  _UIHorizontalIndexTitleBarCell *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[UIView _focusSystem](self, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedView");
  v4 = (_UIHorizontalIndexTitleBarCell *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4 != self)
    {
      -[UICollectionReusableView _collectionView](v4, "_collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionReusableView _collectionView](self, "_collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v6 == v7;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateColors
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
  {
    v5 = 1.0;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.4;
    v8 = 1.0;
  }
  else
  {
    v5 = 0.0;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.6;
    v8 = 0.0;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, 1.0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_roundedCornersBackground, "setBackgroundColor:", v6);
  if (-[UICollectionViewCell isFocused](self, "isFocused"))
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHorizontalIndexTitleBarCell titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

  }
  else
  {
    if (-[UICollectionViewCell isSelected](self, "isSelected")
      && !-[_UIHorizontalIndexTitleBarCell _isAnotherIndexTitleCellFocused](self, "_isAnotherIndexTitleCellFocused"))
    {
      -[_UIHorizontalIndexTitleBarCell titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v13 = v14;
    }
    else
    {
      -[_UIHorizontalIndexTitleBarCell titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v13 = v9;
    }
    objc_msgSend(v12, "setTextColor:", v13);
  }

}

- (_UIFocusFastScrollingIndexBarEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)roundedCornersBackground
{
  return self->_roundedCornersBackground;
}

- (void)setRoundedCornersBackground:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornersBackground, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCornersBackground, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
