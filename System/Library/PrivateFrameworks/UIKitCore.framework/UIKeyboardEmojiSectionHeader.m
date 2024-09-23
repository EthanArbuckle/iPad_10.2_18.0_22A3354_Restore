@implementation UIKeyboardEmojiSectionHeader

- (UIKeyboardEmojiSectionHeader)initWithFrame:(CGRect)a3
{
  UIKeyboardEmojiSectionHeader *v3;
  UILabel *v4;
  uint64_t v5;
  UILabel *emojiSectionHeader;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiSectionHeader;
  v3 = -[UICollectionReusableView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UILabel alloc];
    -[UIView bounds](v3, "bounds");
    v5 = -[UILabel initWithFrame:](v4, "initWithFrame:");
    emojiSectionHeader = v3->_emojiSectionHeader;
    v3->_emojiSectionHeader = (UILabel *)v5;

    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_emojiSectionHeader, "setBackgroundColor:", v7);

    -[UIView addSubview:](v3, "addSubview:", v3->_emojiSectionHeader);
  }
  return v3;
}

- (void)layoutSubviews
{
  UIVisualEffectView *backdropView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardEmojiSectionHeader;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  backdropView = self->_backdropView;
  if (backdropView)
  {
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](backdropView, "setFrame:");
  }
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIKeyboardEmojiSectionHeader insets](self, "insets");
  -[UILabel setFrame:](self->_emojiSectionHeader, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
}

- (void)setHeaderName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseStringWithLocale:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_emojiSectionHeader, "setText:", v7);
}

- (NSString)headerName
{
  return -[UILabel text](self->_emojiSectionHeader, "text");
}

- (void)setHeaderTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_emojiSectionHeader, "setTextColor:", a3);
}

- (UIColor)headerTextColor
{
  return -[UILabel textColor](self->_emojiSectionHeader, "textColor");
}

- (void)setHeaderFontSize:(double)a3
{
  UILabel *emojiSectionHeader;
  id v4;

  emojiSectionHeader = self->_emojiSectionHeader;
  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](emojiSectionHeader, "setFont:", v4);

}

- (double)headerFontSize
{
  void *v2;
  double v3;
  double v4;

  -[UILabel font](self->_emojiSectionHeader, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (void)setHeaderOpacity:(double)a3
{
  -[UIView setOpaque:](self->_emojiSectionHeader, "setOpaque:", 0);
  -[UIView setAlpha:](self->_emojiSectionHeader, "setAlpha:", a3);
}

- (double)headerOpacity
{
  double result;

  -[UIView alpha](self->_emojiSectionHeader, "alpha");
  return result;
}

- (void)setUseVibrantBlend:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_emojiSectionHeader, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v5);

  }
  else
  {
    -[UIView layer](self->_emojiSectionHeader, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", 0);
  }

  v7 = !v3;
  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsGroupOpacity:", v7);

  -[UIView layer](self, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupBlending:", v7);

}

- (BOOL)useVibrantBlend
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIView layer](self->_emojiSectionHeader, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compositingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setEffect:(id)a3
{
  id v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *backdropView;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4 && !self->_backdropView)
  {
    v5 = [UIVisualEffectView alloc];
    -[UIView bounds](self, "bounds");
    v6 = -[UIVisualEffectView initWithFrame:](v5, "initWithFrame:");
    backdropView = self->_backdropView;
    self->_backdropView = v6;

    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);
    v4 = v8;
  }
  -[UIVisualEffectView setEffect:](self->_backdropView, "setEffect:", v4);

}

- (UIVisualEffect)effect
{
  return -[UIVisualEffectView effect](self->_backdropView, "effect");
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_emojiSectionHeader, 0);
}

@end
