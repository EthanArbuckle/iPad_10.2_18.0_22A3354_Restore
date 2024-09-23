@implementation VUIAccountSettingsButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[VUIAccountSettingsButton contentSize](self, "contentSize", a3.width, a3.height);
  v5 = v4;
  -[VUIButton padding](self, "padding");
  v7 = v5 + v6;
  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_updateAccessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[VUIButton padding](self, "padding");
  -[VUIAccountSettingsButton bounds](self, "bounds");
  CGRectGetMinY(v12);
  -[VUIAccountSettingsButton bounds](self, "bounds");
  CGRectGetWidth(v13);
  -[VUIButton padding](self, "padding");
  -[VUIAccountSettingsButton bounds](self, "bounds");
  CGRectGetHeight(v14);
  -[VUIAccountSettingsButton bounds](self, "bounds");
  -[VUIAccountSettingsButton vuiIsRTL](self, "vuiIsRTL");
  VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIAccountSettingsButton convertRect:toView:](self, "convertRect:toView:", 0);
  -[VUIAccountSettingsButton setAccessibilityFrame:](self, "setAccessibilityFrame:");
  -[VUIButton imageView](self, "imageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIButton imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)setPreferedContentSize:(CGSize)a3
{
  self->_preferedContentSize = a3;
  -[VUIAccountSettingsButton calculateContentSize](self, "calculateContentSize");
  -[VUIAccountSettingsButton setContentSize:](self, "setContentSize:");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAccountSettingsButton;
  -[VUIAccountSettingsButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VUIAccountSettingsButton _updateAccessibilityFrame](self, "_updateAccessibilityFrame");
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGSize)preferedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferedContentSize.width;
  height = self->_preferedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIAccountSettingsButton;
  -[VUIButton layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIAccountSettingsButton _updateAccessibilityFrame](self, "_updateAccessibilityFrame");
  -[VUIAccountSettingsButton _updateImageViewFrame](self, "_updateImageViewFrame");
}

- (VUIAccountSettingsButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  VUIAccountSettingsButton *v4;
  VUIAccountSettingsButton *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VUIAccountSettingsButton;
  v4 = -[VUIButton initWithType:interfaceStyle:](&v11, sel_initWithType_interfaceStyle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[VUIAccountSettingsButton setPreferedContentSize:](v4, "setPreferedContentSize:", 34.0, 34.0);
    -[VUIButton setPadding:](v5, "setPadding:", 0.0, 15.0, 0.0, 0.0);
    -[VUIAccountSettingsButton _setup](v5, "_setup");
    objc_initWeak(&location, v5);
    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__VUIAccountSettingsButton_initWithType_interfaceStyle___block_invoke;
    v8[3] = &unk_1E9F99F98;
    objc_copyWeak(&v9, &location);
    -[VUIAccountSettingsButton vui_registerForTraitChanges:withHandler:](v5, "vui_registerForTraitChanges:withHandler:", v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (BOOL)hideAndDisable
{
  return self->_hideAndDisable;
}

- (void)configureWithLayoutProperties
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIAccountSettingsButton;
  -[VUIButton configureWithLayoutProperties](&v7, sel_configureWithLayoutProperties);
  -[VUIButton setImageTintColor:](self, "setImageTintColor:", 0);
  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  v4 = v3;
  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[VUIButton setCornerRadius:](self, "setCornerRadius:", v6 * 0.5);
}

- (CGSize)calculateContentSize
{
  void *v3;
  char v4;
  double v5;
  double v6;
  CGSize result;

  -[VUIAccountSettingsButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAXEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = 44.0;
    v6 = 44.0;
  }
  else
  {
    -[VUIAccountSettingsButton preferedContentSize](self, "preferedContentSize");
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateImageViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[VUIButton padding](self, "padding");
  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  -[VUIAccountSettingsButton bounds](self, "bounds");
  -[VUIAccountSettingsButton vuiIsRTL](self, "vuiIsRTL");
  VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIButton imageView](self, "imageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_updateAccountImage
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  VUIRequireMainThread();
  if (+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount"))
  {
    +[VUIAuthenticationManager userProfileImage](VUIAuthenticationManager, "userProfileImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scale");
      +[VUIAuthenticationManager monogramAvatarForSize:scale:isRTL:](VUIAuthenticationManager, "monogramAvatarForSize:scale:isRTL:", -[VUIAccountSettingsButton vuiIsRTL](self, "vuiIsRTL"), 34.0, 34.0, v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }
  -[VUIButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setImage:", v6);

}

- (void)_updateAccountButtonVisibility
{
  uint64_t v3;
  uint64_t v4;

  if (+[VUIAuthenticationManager allowsAccountModification](VUIAuthenticationManager, "allowsAccountModification")&& !-[VUIAccountSettingsButton hideAndDisable](self, "hideAndDisable"))
  {
    v4 = 0;
    v3 = 1;
  }
  else
  {
    v3 = 0;
    v4 = 1;
  }
  -[VUIAccountSettingsButton setHidden:](self, "setHidden:", v4);
  -[VUIAccountSettingsButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (void)_setup
{
  void *v3;
  id v4;

  -[VUIAccountSettingsButton _setupAccountImageView](self, "_setupAccountImageView");
  -[VUIAccountSettingsButton _updateAccountImage](self, "_updateAccountImage");
  -[VUIAccountSettingsButton _updateAccountButtonVisibility](self, "_updateAccountButtonVisibility");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountStoreDidChange_, CFSTR("VUIAuthenticationManagerAccountStoreDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__profileImageDidChange_, CFSTR("VUIAuthenticationManagerProfileImageDidChangeNotification"), 0);

}

- (void)_setupAccountImageView
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  -[VUIAccountSettingsButton contentSize](self, "contentSize");
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A58]), "initWithSymbol:size:symbolConfiguration:", CFSTR("person.crop.circle"), 0, v3, v4);
  objc_msgSend(v7, "setRenderAsTemplate:", 1);
  objc_msgSend(MEMORY[0x1E0DC6A00], "makeImageViewWithResourceDescriptor:existingView:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  if (v5)
  {
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderImage:", v6);

  }
  -[VUIButton setImageView:forHighlightedState:](self, "setImageView:forHighlightedState:", v5, 0);

}

void __56__VUIAccountSettingsButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "calculateContentSize");
  v2 = v1;
  v4 = v3;
  objc_msgSend(WeakRetained, "contentSize");
  if (v2 != v6 || v4 != v5)
  {
    objc_msgSend(WeakRetained, "setContentSize:", v2, v4);
    objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");
  }

}

- (id)largeContentImage
{
  void *v2;
  void *v3;

  -[VUIButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)hideAndDisable:(BOOL)a3
{
  -[VUIAccountSettingsButton setHideAndDisable:](self, "setHideAndDisable:", a3);
  -[VUIAccountSettingsButton _updateAccountButtonVisibility](self, "_updateAccountButtonVisibility");
}

- (void)_accountStoreDidChange:(id)a3
{
  _QWORD block[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  VUIAccountSettingsButton *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __51__VUIAccountSettingsButton__accountStoreDidChange___block_invoke;
  v5 = &unk_1E9F98DF0;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__VUIAccountSettingsButton__accountStoreDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateAccountButtonVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountImage");
}

- (void)_profileImageDidChange:(id)a3
{
  _QWORD block[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  VUIAccountSettingsButton *v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v4 = __51__VUIAccountSettingsButton__profileImageDidChange___block_invoke;
  v5 = &unk_1E9F98DF0;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3))
    v4((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__VUIAccountSettingsButton__profileImageDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccountImage");
}

- (void)setHideAndDisable:(BOOL)a3
{
  self->_hideAndDisable = a3;
}

@end
