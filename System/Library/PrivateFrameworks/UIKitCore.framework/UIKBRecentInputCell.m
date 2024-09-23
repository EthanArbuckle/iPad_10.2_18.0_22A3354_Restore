@implementation UIKBRecentInputCell

- (UIKBRecentInputCell)initWithFrame:(CGRect)a3
{
  UIKBRecentInputCell *v3;
  UIKBRecentInputCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBRecentInputCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UICollectionViewCell _setFocusStyle:](v3, "_setFocusStyle:", 1);
  return v4;
}

- (BOOL)_canFocusProgrammatically
{
  return 1;
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBRecentInputCell;
  -[UICollectionViewCell setSelected:](&v8, sel_setSelected_, a3);
  v4 = (void *)objc_opt_class();
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColorForRenderConfig:isSelected:", v5, -[UICollectionViewCell isSelected](self, "isSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRecentInputCell label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKBRecentInputCell;
  -[UICollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3 + 20.0;
  v6 = v5 + -20.0;
  v8 = v7 + 9.0;
  v10 = v9 + -9.0;
  -[UIKBRecentInputCell label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v8, v6, v10);

}

- (void)setInputText:(id)a3
{
  id v4;
  void *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[UIKBRecentInputCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [UILabel alloc];
    -[UIView bounds](self, "bounds");
    v7 = -[UILabel initWithFrame:](v6, "initWithFrame:");
    -[UICollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7);

    -[UIKBRecentInputCell setLabel:](self, "setLabel:", v7);
  }
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10 = (void *)objc_opt_class();
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleAttributesForRenderConfig:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v4, v11);

  -[UIKBRecentInputCell label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v12);

}

+ (id)textColorForRenderConfig:(id)a3 isSelected:(BOOL)a4
{
  _BOOL4 v4;
  double v5;
  void *v6;

  v4 = a4;
  if (objc_msgSend(a3, "lightKeyboard"))
  {
    v5 = 0.0;
LABEL_6:
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, 0.6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (!v4)
  {
    v5 = 1.0;
    goto LABEL_6;
  }
  +[UIColor blackColor](UIColor, "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)titleAttributesForRenderConfig:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = qword_1ECD7AB80;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&qword_1ECD7AB80, &__block_literal_global_320);
  v6 = (void *)objc_msgSend((id)_MergedGlobals_5_9, "mutableCopy");
  objc_msgSend(a1, "textColorForRenderConfig:isSelected:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)off_1E1678D98);
  return v6;
}

void __54__UIKBRecentInputCell_titleAttributesForRenderConfig___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 36.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_5_9;
  _MergedGlobals_5_9 = v1;

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
