@implementation RAPThumbsButton

+ (id)buttonWithType:(int64_t)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RAPThumbsButton;
  v3 = objc_msgSendSuper2(&v6, "buttonWithType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "_updateColors");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  -[RAPThumbsButton layoutSubviews](&v4, "layoutSubviews");
  -[RAPThumbsButton frame](self, "frame");
  -[RAPThumbsButton _setCornerRadius:](self, "_setCornerRadius:", v3 * 0.5);
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  -[RAPThumbsButton setSelected:](&v4, "setSelected:", a3);
  -[RAPThumbsButton _updateColors](self, "_updateColors");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RAPThumbsButton;
  -[RAPThumbsButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[RAPThumbsButton _updateColors](self, "_updateColors");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPThumbsButton;
  v4 = a3;
  -[RAPThumbsButton traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPThumbsButton traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[RAPThumbsButton _updateColors](self, "_updateColors");
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if ((-[RAPThumbsButton isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[RAPThumbsButton isSelected](self, "isSelected") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPThumbsButton theme](self, "theme"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
    -[RAPThumbsButton setBackgroundColor:](self, "setBackgroundColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[RAPThumbsButton setBackgroundColor:](self, "setBackgroundColor:", v6);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v8 = (id)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPThumbsButton imageView](self, "imageView"));
  objc_msgSend(v7, "setTintColor:", v8);

}

@end
