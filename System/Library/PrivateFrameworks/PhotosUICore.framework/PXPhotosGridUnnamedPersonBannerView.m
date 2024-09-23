@implementation PXPhotosGridUnnamedPersonBannerView

- (PXPhotosGridUnnamedPersonBannerView)initWithType:(int64_t)a3
{
  PXPhotosGridUnnamedPersonBannerView *v4;
  PXPhotosGridUnnamedPersonBannerView *v5;
  NSShadow *v6;
  NSShadow *buttonShadow;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIButton *primaryActionButton;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PXPhotosGridUnnamedPersonBannerView;
  v4 = -[PXPhotosGridUnnamedPersonBannerView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    buttonShadow = v5->_buttonShadow;
    v5->_buttonShadow = v6;

    -[NSShadow setShadowBlurRadius:](v5->_buttonShadow, "setShadowBlurRadius:", 10.0);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus.circle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseForegroundColor:", v10);

    objc_msgSend(v8, "setImagePadding:", 10.0);
    objc_initWeak(&location, v5);
    v11 = (void *)MEMORY[0x1E0DC3428];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __52__PXPhotosGridUnnamedPersonBannerView_initWithType___block_invoke;
    v19 = &unk_1E5147F40;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v11, "actionWithHandler:", &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v8, v12, v16, v17, v18, v19);
    v13 = objc_claimAutoreleasedReturnValue();
    primaryActionButton = v5->_primaryActionButton;
    v5->_primaryActionButton = (UIButton *)v13;

    -[PXPhotosGridUnnamedPersonBannerView _updateButtonConfiguration](v5, "_updateButtonConfiguration");
    -[PXPhotosGridUnnamedPersonBannerView addSubview:](v5, "addSubview:", v5->_primaryActionButton);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = a3.height + -20.0;
  -[PXPhotosGridUnnamedPersonBannerView primaryActionButton](self, "primaryActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, v4);
  v7 = v6;
  v9 = v8;

  v10 = v9 + 20.0;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
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
  v12.super_class = (Class)PXPhotosGridUnnamedPersonBannerView;
  -[PXPhotosGridUnnamedPersonBannerView layoutSubviews](&v12, sel_layoutSubviews);
  -[PXPhotosGridUnnamedPersonBannerView bounds](self, "bounds");
  PXEdgeInsetsMake();
  PXEdgeInsetsInsetRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXPhotosGridUnnamedPersonBannerView primaryActionButton](self, "primaryActionButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (NSString)actionString
{
  int64_t v4;
  __CFString *v5;
  void *v7;

  v4 = -[PXPhotosGridUnnamedPersonBannerView type](self, "type");
  if (v4)
  {
    if (v4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridUnnamedPersonBannerView.m"), 80, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v5 = CFSTR("PXPeopleBannerNameThisPet");
  }
  else
  {
    v5 = CFSTR("PXPeopleBannerNameThisPerson");
  }
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateButtonConfiguration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A85CC970](3, 32770, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC1138];
  v17[0] = v3;
  v5 = *MEMORY[0x1E0DC1198];
  v16[0] = v4;
  v16[1] = v5;
  -[PXPhotosGridUnnamedPersonBannerView buttonShadow](self, "buttonShadow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PXPhotosGridUnnamedPersonBannerView actionString](self, "actionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v7);

  -[PXPhotosGridUnnamedPersonBannerView primaryActionButton](self, "primaryActionButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v13, "setAttributedTitle:", v10);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredSymbolConfigurationForImage:", v14);

  -[PXPhotosGridUnnamedPersonBannerView primaryActionButton](self, "primaryActionButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConfiguration:", v13);

}

- (void)_handlePrimaryAction
{
  id v3;

  -[PXPhotosGridUnnamedPersonBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapUnnamedPersonBanner:", self);

}

- (void)setSpec:(id)a3
{
  PXFeatureSpec *v5;
  PXFeatureSpec *spec;
  uint64_t v7;
  int64_t v8;
  PXFeatureSpec *v9;

  v5 = (PXFeatureSpec *)a3;
  spec = self->_spec;
  if (spec != v5)
  {
    v9 = v5;
    v7 = -[PXFeatureSpec contentSizeCategory](spec, "contentSizeCategory");
    objc_storeStrong((id *)&self->_spec, a3);
    v8 = -[PXFeatureSpec contentSizeCategory](self->_spec, "contentSizeCategory");
    v5 = v9;
    if (v7 != v8)
    {
      -[PXPhotosGridUnnamedPersonBannerView _updateButtonConfiguration](self, "_updateButtonConfiguration");
      v5 = v9;
    }
  }

}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (PXFeatureSpec)spec
{
  return self->_spec;
}

- (PXPhotosGridUnnamedPersonBannerDelegate)delegate
{
  return (PXPhotosGridUnnamedPersonBannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSShadow)buttonShadow
{
  return self->_buttonShadow;
}

- (UIButton)primaryActionButton
{
  return self->_primaryActionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryActionButton, 0);
  objc_storeStrong((id *)&self->_buttonShadow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __52__PXPhotosGridUnnamedPersonBannerView_initWithType___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePrimaryAction");

}

@end
