@implementation PKMapsMerchantStylingInfoViewController

- (PKMapsMerchantStylingInfoViewController)initWithStylingInfo:(id)a3
{
  id v5;
  PKMapsMerchantStylingInfoViewController *v6;
  PKMapsMerchantStylingInfoViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  v6 = -[PKMapsMerchantStylingInfoViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stylingInfo, a3);

  return v7;
}

- (void)viewDidLoad
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *iconImageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  -[PKMapsMerchantStylingInfoViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = PKUIScreenScale();
  -[MKWalletMerchantStylingInfo tintColorForScale:](self->_stylingInfo, "tintColorForScale:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKWalletMerchantStylingInfo imageForSize:scale:](self->_stylingInfo, "imageForSize:scale:", 4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMapsMerchantStylingInfoViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v7;

  objc_msgSend(v6, "addSubview:", self->_iconImageView);
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)viewDidLayoutSubviews
{
  UIImageView *iconImageView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMapsMerchantStylingInfoViewController;
  -[PKMapsMerchantStylingInfoViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  iconImageView = self->_iconImageView;
  -[PKMapsMerchantStylingInfoViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_stylingInfo, 0);
}

@end
