@implementation PXPhotosGridAddButtonView

- (PXPhotosGridAddButtonView)initWithFrame:(CGRect)a3
{
  PXPhotosGridAddButtonView *v3;
  PXPhotosGridAddButtonView *v4;
  void *v5;
  uint64_t v6;
  PXUpdater *updater;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosGridAddButtonView;
  v3 = -[PXPhotosGridAddButtonView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXPhotosGridAddButtonView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v4, sel__setNeedsUpdate);
    updater = v4->_updater;
    v4->_updater = (PXUpdater *)v6;

    -[PXUpdater addUpdateSelector:needsUpdate:](v4->_updater, "addUpdateSelector:needsUpdate:", sel__updateButtonImage, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v4->_updater, "addUpdateSelector:needsUpdate:", sel__updateBackgroundProperties, 1);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  UIButton *button;
  UIButton *v5;
  UIButton *v6;
  objc_super v7;

  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXPhotosGridAddButtonView buttonImage](self, "buttonImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  if (!button)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "systemButtonWithImage:target:action:", v3, self, sel__handleButton_);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_button;
    self->_button = v5;

    -[PXPhotosGridAddButtonView addSubview:](self, "addSubview:", self->_button);
    button = self->_button;
  }
  -[UIButton setImage:forState:](button, "setImage:forState:", v3, 0);
  -[PXPhotosGridAddButtonView bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridAddButtonView;
  -[PXPhotosGridAddButtonView layoutSubviews](&v7, sel_layoutSubviews);

}

- (void)_updateBackgroundProperties
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[PXPhotosGridAddButtonView userData](self, "userData");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v13, "preferredUserInterfaceStyle");
  if (v3 == 2)
  {
    v5 = (void *)MEMORY[0x1E0DC3E88];
    v6 = 2;
LABEL_7:
    objc_msgSend(v5, "traitCollectionWithUserInterfaceStyle:", v6);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    v5 = (void *)MEMORY[0x1E0DC3E88];
    v6 = 1;
    goto LABEL_7;
  }
  if (v3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v7 = (void *)v4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedColorWithTraitCollection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAddButtonView setBackgroundColor:](self, "setBackgroundColor:", v9);

  objc_msgSend(v13, "cornerRadius");
  v11 = v10;
  -[PXPhotosGridAddButtonView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

}

- (void)_updateButtonImage
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (id)*MEMORY[0x1E0DC4B58];
  -[PXPhotosGridAddButtonView userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "style");

  if (v5 == 1)
  {
    -[PXPhotosGridAddButtonView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "horizontalSizeClass");
    v9 = (void *)*MEMORY[0x1E0DC4B50];
    if (v8 == 1)
      v9 = v3;
    v10 = v9;

    v7 = 3;
    v3 = v10;
  }
  else
  {
    if (v5)
    {
      v7 = 3;
      goto LABEL_11;
    }
    -[PXPhotosGridAddButtonView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "horizontalSizeClass") == 1)
      v7 = 1;
    else
      v7 = 3;
  }

LABEL_11:
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:contentSizeCategory:withSymbolicTraits:", v3, *MEMORY[0x1E0DC4920], 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosGridAddButtonView setButtonImage:](self, "setButtonImage:", v14);
}

- (void)_handleButton:(id)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[PXPhotosGridAddButtonView actionHandler](self, "actionHandler", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    PLGridZeroGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing action handler for photos grid add button", v6, 2u);
    }

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateButtonImage);
}

- (id)actionHandler
{
  void *v2;
  void *v3;

  -[PXPhotosGridAddButtonView userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUserData:(id)a3
{
  PXPhotosGridAddButtonViewUserData *v4;
  PXPhotosGridAddButtonViewUserData *userData;

  if (self->_userData != a3)
  {
    v4 = (PXPhotosGridAddButtonViewUserData *)objc_msgSend(a3, "copy");
    userData = self->_userData;
    self->_userData = v4;

    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateButtonImage);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBackgroundProperties);
  }
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXPhotosGridAddButtonViewUserData)userData
{
  return self->_userData;
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (void)setButtonImage:(id)a3
{
  objc_storeStrong((id *)&self->_buttonImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
