@implementation VideosExtrasNavigationBarButton

+ (id)textDodgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
}

+ (id)textFilter
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EB0]);
}

+ (id)extrasNavigationButton:(int64_t)a3
{
  _QWORD *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(a1, "buttonWithType:", 1);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), 0, CFSTR("VideosExtras"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  v8 = 4.0;
  if (a3 == 1)
    v8 = 2.0;
  objc_msgSend(v5, "setContentEdgeInsets:", v8, 10.0, v8, 8.0);
  objc_msgSend(v5, "setClipsToBounds:", 1);
  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 5.0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 11050);
  objc_msgSend(v10, "setGroupName:", CFSTR("VideosExtrasBlurGroupName"));
  v11 = (void *)v5[94];
  v5[94] = v10;
  v12 = v10;

  objc_msgSend(a1, "textDodgeColor");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v5[95];
  v5[95] = v13;

  objc_msgSend(v5, "setNeedsLayout");
  return v5;
}

+ (id)extrasBackButton:(int64_t)a3
{
  void *v4;
  uint64_t *v5;

  objc_msgSend(a1, "extrasNavigationButton:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (extrasBackButton__onceToken != -1)
    dispatch_once(&extrasBackButton__onceToken, &__block_literal_global_154);
  v5 = &extrasBackButton__landscapeBackIndicatorImage;
  if (a3 != 1)
    v5 = &extrasBackButton__backIndicatorImage;
  objc_msgSend(v4, "setImage:forState:", *v5, 0);
  objc_msgSend(v4, "setImageEdgeInsets:", 0.0, -8.0, 0.0, 0.0);
  return v4;
}

void __52__VideosExtrasNavigationBarButton_extrasBackButton___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorDefault"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageFlippedForRightToLeftLayoutDirection");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)extrasBackButton__backIndicatorImage;
  extrasBackButton__backIndicatorImage = v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UINavigationBarBackIndicatorLandscape"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageFlippedForRightToLeftLayoutDirection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)extrasBackButton__landscapeBackIndicatorImage;
  extrasBackButton__landscapeBackIndicatorImage = v3;

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  UIColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VideosExtrasNavigationBarButton;
  -[VideosExtrasNavigationBarButton layoutSubviews](&v13, sel_layoutSubviews);
  -[VideosExtrasNavigationBarButton bounds](self, "bounds");
  -[UIView setFrame:](self->_backdropView, "setFrame:");
  -[VideosExtrasNavigationBarButton addSubview:](self, "addSubview:", self->_backdropView);
  -[VideosExtrasNavigationBarButton layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupBlending:", 0);

  objc_msgSend((id)objc_opt_class(), "textFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_dodgeColor;
  -[VideosExtrasNavigationBarButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);
  -[VideosExtrasNavigationBarButton imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  -[VideosExtrasNavigationBarButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasNavigationBarButton imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCompositingFilter:", v4);
  objc_msgSend(v10, "setCompositingFilter:", v4);
  -[VideosExtrasNavigationBarButton layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", v8);

  -[VideosExtrasNavigationBarButton layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addSublayer:", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dodgeColor, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
