@implementation UIKeyboardStickerButtonView

- (UIKeyboardStickerButtonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIKeyboardStickerButtonView *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  UIButton *launchStickersButton;
  UIButton *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardStickerButtonView;
  v7 = -[UICollectionReusableView initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 30.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("sticker"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton systemButtonWithImage:target:action:](UIButton, "systemButtonWithImage:target:action:", v9, v7, sel_handleTap);
    v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton setFrame:](v10, "setFrame:", x, y, width, height);
    -[UIButton imageView](v10, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentMode:", 1);

    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v10, "setTintColor:", v12);

    launchStickersButton = v7->_launchStickersButton;
    v7->_launchStickersButton = v10;
    v14 = v10;

    -[UIView addSubview:](v7, "addSubview:", v7->_launchStickersButton);
  }
  return v7;
}

- (id)accessibilityIdentifier
{
  return CFSTR("StickerApp Button");
}

- (unint64_t)accessibilityTraits
{
  return 1;
}

- (void)layoutSubviews
{
  UIButton *launchStickersButton;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardStickerButtonView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  launchStickersButton = self->_launchStickersButton;
  -[UIView bounds](self, "bounds");
  -[UIButton setFrame:](launchStickersButton, "setFrame:");
}

- (void)handleTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("window");
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("windowScene");
  v9[0] = v3;
  -[UIView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("UIEmojiAndStickerShouldPresentPickerNotification"), 0, v6);

}

- (UIButton)launchStickersButton
{
  return self->_launchStickersButton;
}

- (void)setLaunchStickersButton:(id)a3
{
  objc_storeStrong((id *)&self->_launchStickersButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchStickersButton, 0);
}

@end
