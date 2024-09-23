@implementation PKPassShareActivationExternalKeyEducationView

- (PKPassShareActivationExternalKeyEducationView)init
{

  return 0;
}

- (PKPassShareActivationExternalKeyEducationView)initWithContinueButtonText:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKPassShareActivationExternalKeyEducationView *v8;
  PKPassShareActivationExternalKeyEducationView *v9;
  uint64_t v10;
  UIImageView *educationImageView;
  PKContinuousButton *v12;
  PKContinuousButton *nextButton;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  __int128 v21;
  int64x2_t v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationExternalKeyEducationView;
  v8 = -[PKPassShareActivationExternalKeyEducationView init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    educationImageView = v9->_educationImageView;
    v9->_educationImageView = (UIImageView *)v10;

    -[UIImageView setContentMode:](v9->_educationImageView, "setContentMode:", 1);
    -[PKPassShareActivationExternalKeyEducationView addSubview:](v9, "addSubview:", v9->_educationImageView);
    v20 = 0x4024000000000000;
    v21 = xmmword_19DEE0240;
    v22 = vdupq_n_s64(2uLL);
    v12 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v20);
    nextButton = v9->_nextButton;
    v9->_nextButton = v12;

    v14 = (void *)MEMORY[0x1E0DC3520];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pkui_plainConfigurationWithTitle:font:", v6, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBaseForegroundColor:", v17);

    objc_msgSend(v16, "setContentInsets:", 8.0, 25.0, 8.0, 25.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBaseBackgroundColor:", v18);

    objc_msgSend(v16, "setTitleAlignment:", 2);
    -[PKContinuousButton setConfiguration:](v9->_nextButton, "setConfiguration:", v16);
    -[PKContinuousButton addTarget:action:forControlEvents:](v9->_nextButton, "addTarget:action:forControlEvents:", v9, sel__nextButtonPressed, 64);
    -[PKPassShareActivationExternalKeyEducationView addSubview:](v9, "addSubview:", v9->_nextButton);

  }
  return v9;
}

- (void)setEducationImage:(id)a3
{
  -[UIImageView setImage:](self->_educationImageView, "setImage:", a3);
  -[PKPassShareActivationExternalKeyEducationView setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)educationImage
{
  return -[UIImageView image](self->_educationImageView, "image");
}

- (void)_nextButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "externalKeyEdicationViewDidSelectNext:", self);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 200.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  CGRect v3;
  CGRect remainder;
  CGRect v5;

  -[PKPassShareActivationExternalKeyEducationView bounds](self, "bounds");
  remainder = v5;
  memset(&v3, 0, sizeof(v3));
  CGRectDivide(v5, &v3, &remainder, 111.0, CGRectMinYEdge);
  -[UIImageView setFrame:](self->_educationImageView, "setFrame:", *(_OWORD *)&v3.origin, *(_OWORD *)&v3.size);
  CGRectDivide(remainder, &v3, &remainder, 24.0, CGRectMinYEdge);
  CGRectDivide(remainder, &v3, &remainder, 50.0, CGRectMinYEdge);
  -[PKContinuousButton setFrame:](self->_nextButton, "setFrame:", *(_OWORD *)&v3.origin, *(_OWORD *)&v3.size);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_educationImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
