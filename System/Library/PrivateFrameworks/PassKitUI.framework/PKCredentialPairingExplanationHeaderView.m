@implementation PKCredentialPairingExplanationHeaderView

- (PKCredentialPairingExplanationHeaderView)initWithConfiguration:(id)a3
{
  id v5;
  PKCredentialPairingExplanationHeaderView *v6;
  PKCredentialPairingExplanationHeaderView *v7;
  UIImageView *v8;
  UIImageView *imageView;
  UIImageView *v10;
  void *v11;
  uint64_t v12;
  UIActivityIndicatorView *spinner;
  id v14;
  void *v15;
  uint64_t v16;
  UIVisualEffectView *blurView;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCredentialPairingExplanationHeaderView;
  v6 = -[PKCredentialPairingExplanationHeaderView init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v7->_imageView;
    v7->_imageView = v8;

    -[PKCredentialPairingExplanationHeaderView addSubview:](v7, "addSubview:", v7->_imageView);
    v10 = v7->_imageView;
    PKProvisioningBackgroundColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    spinner = v7->_spinner;
    v7->_spinner = (UIActivityIndicatorView *)v12;

    v14 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithEffect:", v15);
    blurView = v7->_blurView;
    v7->_blurView = (UIVisualEffectView *)v16;

    -[PKCredentialPairingExplanationHeaderView _showLoadingContent](v7, "_showLoadingContent");
    -[PKCredentialPairingExplanationHeaderView _loadPairingImage](v7, "_loadPairingImage");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCredentialPairingExplanationHeaderView setBackgroundColor:](v7, "setBackgroundColor:", v18);

    -[PKCredentialPairingExplanationHeaderView setClipsToBounds:](v7, "setClipsToBounds:", 1);
    -[PKCredentialPairingExplanationHeaderView setUseCompactLayout:](v7, "setUseCompactLayout:", (unint64_t)PKUIGetMinScreenType() < 4);
  }

  return v7;
}

- (void)layoutSubviews
{
  void *v3;
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
  UIActivityIndicatorView *spinner;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKCredentialPairingExplanationHeaderView;
  -[PKCredentialPairingExplanationHeaderView layoutSubviews](&v17, sel_layoutSubviews);
  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCredentialPairingExplanationHeaderView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "size");
  PKSizeAspectFill();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12 + 0.0, v13 + 1.0, v15, v14 + -2.0);
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  spinner = self->_spinner;
  PKSizeAlignedInRect();
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:");
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:", v5, v7, v9, v11);

}

- (void)_loadPairingImage
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if ((-[PKAddCarKeyPassConfiguration supportedRadioTechnologies](self->_configuration, "supportedRadioTechnologies") & 2) != 0)
    v3 = 2;
  else
    v3 = 1;
  -[PKCredentialPairingExplanationHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle") == 2;

  -[PKAddCarKeyPassConfiguration provisioningTemplateIdentifier](self->_configuration, "provisioningTemplateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67538], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PKCredentialPairingExplanationHeaderView__loadPairingImage__block_invoke;
  v8[3] = &unk_1E3E6E348;
  v8[4] = self;
  objc_msgSend(v7, "carPairingImageForRadioTechnology:templateIdentifier:darkMode:completion:", v3, v6, v5, v8);

}

void __61__PKCredentialPairingExplanationHeaderView__loadPairingImage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_setPairingImage:", v4);

  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_fallbackPairingImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPairingImage:", v3);
  }

}

- (void)_showLoadingContent
{
  UIImageView *imageView;
  void *v4;

  imageView = self->_imageView;
  -[PKCredentialPairingExplanationHeaderView _fallbackPairingImage](self, "_fallbackPairingImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v4);

  -[UIVisualEffectView setAlpha:](self->_blurView, "setAlpha:", 1.0);
  -[PKCredentialPairingExplanationHeaderView addSubview:](self, "addSubview:", self->_blurView);
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[PKCredentialPairingExplanationHeaderView addSubview:](self, "addSubview:", self->_spinner);
}

- (void)_setPairingImage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "stopAnimating");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v4 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_3;
  v5[3] = &unk_1E3E62288;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v6, v5, 0.300000012);

}

uint64_t __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
}

uint64_t __61__PKCredentialPairingExplanationHeaderView__setPairingImage___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 440), "removeFromSuperview");
  return result;
}

- (id)_fallbackPairingImage
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;

  -[PKAddCarKeyPassConfiguration provisioningTemplateIdentifier](self->_configuration, "provisioningTemplateIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsString:", CFSTR("RHD")))
  {
    v3 = CFSTR("CarPairingLightRHD");
    v4 = CFSTR("CarPairingDarkRHD");
  }
  else
  {
    v3 = CFSTR("CarPairingLightLHD");
    v4 = CFSTR("CarPairingDarkLHD");
  }
  PKUIDynamicImageNamed(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = dbl_19DF164B0[!self->_useCompactLayout];
  result.height = v3;
  return result;
}

- (void)setUseCompactLayout:(BOOL)a3
{
  if (self->_useCompactLayout != a3)
  {
    self->_useCompactLayout = a3;
    -[PKCredentialPairingExplanationHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[PKCredentialPairingExplanationHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PKCredentialPairingExplanationHeaderView _loadPairingImage](self, "_loadPairingImage");
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
