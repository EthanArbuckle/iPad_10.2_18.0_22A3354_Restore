@implementation PKPaymentPassDetailAutoReloadMerchantViewController

- (PKPaymentPassDetailAutoReloadMerchantViewController)initWithPass:(id)a3 viewStyle:(int64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKPaymentPassDetailAutoReloadMerchantViewController *v10;
  id v11;
  void *v12;
  void *v13;
  PKPaymentPassDetailAutoReloadMerchantSectionController *v14;
  PKPaymentAutoReloadSetupSectionController *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentPassDetailAutoReloadMerchantViewController;
  v10 = -[PKDynamicTableViewController initWithStyle:](&v19, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 2)
      PKBridgeButtonTextColor();
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PKPaymentPassDetailAutoReloadMerchantSectionController initWithPass:delegate:]([PKPaymentPassDetailAutoReloadMerchantSectionController alloc], "initWithPass:delegate:", v8, 0);
    -[PKPaymentPassDetailAutoReloadMerchantSectionController setSetupDelegate:](v14, "setSetupDelegate:", v9);
    -[PKPaymentPassDetailSectionController setLinkTextColor:](v14, "setLinkTextColor:", v13);
    objc_msgSend(v11, "addObject:", v14);
    if (+[PKPaymentAutoReloadSetupSectionController validForPaymentPass:](PKPaymentAutoReloadSetupSectionController, "validForPaymentPass:", v8))
    {
      v15 = -[PKPaymentAutoReloadSetupSectionController initWithDelegate:]([PKPaymentAutoReloadSetupSectionController alloc], "initWithDelegate:", v9);
      -[PKPaymentPassDetailSectionController setLinkTextColor:](v15, "setLinkTextColor:", v13);
      objc_msgSend(v11, "addObject:", v15);

    }
    -[PKDynamicTableViewController setSectionControllers:](v10, "setSectionControllers:", v11);
    -[PKPaymentPassDetailAutoReloadMerchantViewController navigationItem](v10, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v17);

  }
  return v10;
}

@end
