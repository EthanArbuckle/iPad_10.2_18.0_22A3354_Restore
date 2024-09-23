@implementation NCAvatarView

+ (BOOL)isAvatarPossibleWithNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "isAvatarImagePossibleForBundleIdentifier:", v6);
  return (char)v3;
}

- (NCAvatarView)initWithNotificationRequest:(id)a3 pointSize:(double)a4 compatibleWithInitialTraitCollection:(id)a5
{
  id v8;
  id v9;
  NCAvatarView *v10;
  NCAvatarView *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NCAvatarView;
  v10 = -[NCAvatarView init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_notificationRequest, v8);
    v11->_pointSize = a4;
    v11->_userInterfaceStyle = objc_msgSend(v9, "userInterfaceStyle");
  }

  return v11;
}

- (NCAvatarView)initWithNotificationRequest:(id)a3 compatibleWithInitialTraitCollection:(id)a4
{
  return -[NCAvatarView initWithNotificationRequest:pointSize:compatibleWithInitialTraitCollection:](self, "initWithNotificationRequest:pointSize:compatibleWithInitialTraitCollection:", a3, a4, 0.0);
}

- (NCAvatarView)initWithNotificationRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NCAvatarView *v7;

  v4 = (void *)MEMORY[0x1E0DC3E88];
  v5 = a3;
  objc_msgSend(v4, "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NCAvatarView initWithNotificationRequest:compatibleWithInitialTraitCollection:](self, "initWithNotificationRequest:compatibleWithInitialTraitCollection:", v5, v6);

  return v7;
}

- (void)setMaterialBacked:(BOOL)a3
{
  MTMaterialView *backgroundMaterialView;

  if (self->_materialBacked != a3)
  {
    self->_materialBacked = a3;
    if (a3)
    {
      -[NCAvatarView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[MTMaterialView removeFromSuperview](self->_backgroundMaterialView, "removeFromSuperview");
      backgroundMaterialView = self->_backgroundMaterialView;
      self->_backgroundMaterialView = 0;

    }
  }
}

- (void)layoutSubviews
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)NCAvatarView;
  -[NCAvatarView layoutSubviews](&v10, sel_layoutSubviews);
  -[NCAvatarView _configureImageViewIfNecessary](self, "_configureImageViewIfNecessary");
  -[NCAvatarView _updateAvatarImageIfNecessary](self, "_updateAvatarImageIfNecessary");
  -[NCAvatarView _configureBackgroundMaterialViewIfNecessary](self, "_configureBackgroundMaterialViewIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
  objc_msgSend(WeakRetained, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBusinessCorrespondence");

  if (v6)
  {
    v7 = NCProminentIconCornerRadius();
    -[NCAvatarView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundMaterialView, "_setContinuousCornerRadius:", v7);
    -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", v7);
  }
  else
  {
    -[NCAvatarView frame](self, "frame");
    CGRectGetHeight(v11);
    UIRoundToScale();
    v9 = v8;
    -[NCAvatarView _setCornerRadius:](self, "_setCornerRadius:");
    -[MTMaterialView _setCornerRadius:](self->_backgroundMaterialView, "_setCornerRadius:", v9);
    -[UIImageView _setCornerRadius:](self->_imageView, "_setCornerRadius:", v9);
  }
}

- (BOOL)isEqual:(id)a3
{
  NCAvatarView *v4;
  NCAvatarView *v5;
  id *v6;
  id WeakRetained;
  id v8;
  BOOL v9;

  v4 = (NCAvatarView *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
      v8 = objc_loadWeakRetained(v6 + 56);
      if (BSEqualObjects())
        v9 = self->_pointSize == *((double *)v6 + 57);
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id WeakRetained;
  id v5;
  double pointSize;
  void *v7;
  int64_t userInterfaceStyle;
  void *v9;
  void *v10;
  id *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
  if (WeakRetained)
  {
    v5 = objc_alloc((Class)objc_opt_class());
    pointSize = self->_pointSize;
    -[NCAvatarView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    userInterfaceStyle = self->_userInterfaceStyle;
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollectionByReplacingNSIntegerValue:forTrait:", userInterfaceStyle, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)objc_msgSend(v5, "initWithNotificationRequest:pointSize:compatibleWithInitialTraitCollection:", WeakRetained, v10, pointSize);

    -[UIImageView image](self->_imageView, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v11, "_configureImageViewIfNecessary");
      objc_msgSend(v11[53], "setImage:", v12);
      objc_msgSend(v11[53], "setContentMode:", -[UIImageView contentMode](self->_imageView, "contentMode"));
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  int64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCAvatarView;
  -[NCAvatarView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[NCAvatarView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (self->_userInterfaceStyle != v5)
  {
    self->_userInterfaceStyle = v5;
    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
    -[NCAvatarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_configureImageViewIfNecessary
{
  id v3;
  UIImageView *v4;
  UIImageView *imageView;
  UIImageView *v6;
  void *v7;

  if (!self->_imageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[NCAvatarView bounds](self, "bounds");
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    v6 = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6, "setTintColor:", v7);

    -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
    -[NCAvatarView addSubview:](self, "addSubview:", self->_imageView);
    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
  }
}

- (void)_updateAvatarImageIfNecessary
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  CFTimeInterval v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;
  _QWORD v13[5];

  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!self->_isGeneratingAvatarImage)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
    if (objc_msgSend((id)objc_opt_class(), "isAvatarPossibleWithNotificationRequest:", WeakRetained))
    {
      -[NCAvatarView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke;
      v13[3] = &unk_1E8D1E0A0;
      v13[4] = self;
      objc_msgSend(v5, "traitCollectionByModifyingTraits:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      self->_isGeneratingAvatarImage = 1;
      objc_initWeak(&location, self);
      v8 = CACurrentMediaTime();
      +[NCAvatarImageRenderer sharedInstanceForPointSize:](NCAvatarImageRenderer, "sharedInstanceForPointSize:", self->_pointSize);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_2;
      v10[3] = &unk_1E8D1E0F0;
      objc_copyWeak(v11, &location);
      v11[1] = *(id *)&v8;
      objc_msgSend(v9, "renderAvatarForRequest:compatibleWithTraitCollection:completion:", WeakRetained, v7, v10);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);

    }
  }
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a2;
  objc_msgSend(v3, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v5, "setDisplayScale:");

  objc_msgSend(v5, "setUserInterfaceStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9[2];
  char v10;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_3;
  v7[3] = &unk_1E8D1E0C8;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  v8 = v5;
  v10 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v9);
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadImage:needsFormatting:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), CACurrentMediaTime() - *(double *)(a1 + 48) > 0.0083);
    WeakRetained = v3;
    *((_BYTE *)v3 + 440) = 0;
  }

}

- (void)_loadImage:(id)a3 needsFormatting:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  UIImageView *imageView;
  uint64_t v8;
  id v9;
  UIImageView *v10;
  _QWORD v11[5];

  v5 = a5;
  imageView = self->_imageView;
  if (a4)
    v8 = 2;
  else
    v8 = 1;
  v9 = a3;
  -[UIImageView setContentMode:](imageView, "setContentMode:", v8);
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  v10 = self->_imageView;
  if (v5)
  {
    -[UIImageView setAlpha:](v10, "setAlpha:", 0.0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__NCAvatarView__loadImage_needsFormatting_animated___block_invoke;
    v11[3] = &unk_1E8D1B568;
    v11[4] = self;
    +[NCMigrationGatewayFromCAtoC2 animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:](NCMigrationGatewayFromCAtoC2, "animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:", 1, v11, 0, 0.2, 240.0, 20.0);
  }
  else
  {
    -[UIImageView setAlpha:](v10, "setAlpha:", 1.0);
  }
}

uint64_t __52__NCAvatarView__loadImage_needsFormatting_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MTMaterialView *v11;
  MTMaterialView *backgroundMaterialView;
  MTMaterialView *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  MTMaterialView *v18;
  _QWORD v19[5];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (self->_materialBacked && !self->_backgroundMaterialView)
  {
    -[NCAvatarView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__NCAvatarView__configureBackgroundMaterialViewIfNecessary__block_invoke;
    v19[3] = &unk_1E8D1E0A0;
    v19[4] = self;
    objc_msgSend(v3, "traitCollectionByModifyingTraits:", v19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v21[0] = CFSTR("avatarBackground");
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    v21[1] = CFSTR("avatarBackground");
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    v21[2] = CFSTR("avatarBackgroundDark");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v9, v10, 0, 0, v4, 1.0);
    v11 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v11;

    v13 = self->_backgroundMaterialView;
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%p"), v16, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupNameBase:](v13, "setGroupNameBase:", v17);

    -[NCAvatarView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundMaterialView, 0);
    v18 = self->_backgroundMaterialView;
    -[NCAvatarView bounds](self, "bounds");
    -[MTMaterialView setFrame:](v18, "setFrame:");
    -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);

  }
}

uint64_t __59__NCAvatarView__configureBackgroundMaterialViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
}

- (NCNotificationRequest)notificationRequest
{
  return (NCNotificationRequest *)objc_loadWeakRetained((id *)&self->_notificationRequest);
}

- (double)pointSize
{
  return self->_pointSize;
}

- (BOOL)isMaterialBacked
{
  return self->_materialBacked;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationRequest);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
