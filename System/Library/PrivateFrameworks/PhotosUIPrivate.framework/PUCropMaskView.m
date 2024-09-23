@implementation PUCropMaskView

- (PUCropMaskView)initWithFrame:(CGRect)a3
{
  PUCropMaskView *v3;
  PUCropMaskView *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PUCropMaskView;
  v3 = -[PUCropMaskView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUCropMaskView _updateColor](v3, "_updateColor");
    v9[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[PUCropMaskView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v4;
}

- (void)_updateColor
{
  void *v3;
  void *v4;
  UIView *opaqueView;
  UIView *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  UIView *v12;
  objc_class *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  UIView *v18;
  id v19;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoEditingBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCropMaskView setBackgroundColor:](self, "setBackgroundColor:", v19);
  opaqueView = self->_opaqueView;
  if (opaqueView)
  {
    -[UIView removeFromSuperview](opaqueView, "removeFromSuperview");
    v6 = self->_opaqueView;
    self->_opaqueView = 0;

  }
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cropMaskBlurred");

  if (v8)
  {
    -[PUCropMaskView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (v10 == 2)
      v11 = 2030;
    else
      v11 = 2010;
    v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", v11);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setGroupName:](v12, "setGroupName:", v14);

    -[PUCropMaskView addSubview:](self, "addSubview:", v12);
    -[PUCropMaskView sendSubviewToBack:](self, "sendSubviewToBack:", v12);
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PUCropMaskView frame](self, "frame");
    v12 = (UIView *)objc_msgSend(v15, "initWithFrame:");
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoEditingBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v17);

    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    -[PUCropMaskView addSubview:](self, "addSubview:", v12);
  }
  v18 = self->_opaqueView;
  self->_opaqueView = v12;

}

- (UIView)opaqueView
{
  return self->_opaqueView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueView, 0);
}

@end
