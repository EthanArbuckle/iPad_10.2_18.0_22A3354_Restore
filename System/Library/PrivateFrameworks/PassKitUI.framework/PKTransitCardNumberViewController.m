@implementation PKTransitCardNumberViewController

- (PKTransitCardNumberViewController)initWithPass:(id)a3
{
  id v5;
  PKTransitCardNumberViewController *v6;
  PKTransitCardNumberViewController *v7;
  PKPassDetailsCardInfoSectionController *v8;
  PKPassDetailsCardInfoSectionController *cardInfoSectionController;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKTransitCardNumberViewController;
  v6 = -[PKDynamicTableViewController initWithStyle:](&v14, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    v8 = -[PKPassDetailsCardInfoSectionController initWithPass:peerPaymentAccount:mode:detailViewStyle:delegate:]([PKPassDetailsCardInfoSectionController alloc], "initWithPass:peerPaymentAccount:mode:detailViewStyle:delegate:", v7->_pass, 0, 1, 0, 0);
    cardInfoSectionController = v7->_cardInfoSectionController;
    v7->_cardInfoSectionController = v8;

    -[PKPassDetailsCardInfoSectionController setHideSectionTitles:](v7->_cardInfoSectionController, "setHideSectionTitles:", 1);
    v15[0] = v7->_cardInfoSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController setSectionControllers:](v7, "setSectionControllers:", v10);

    -[PKTransitCardNumberViewController navigationItem](v7, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("SETTINGS_VIEW_TRANSIT_CARD_NUMBER"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

  }
  return v7;
}

+ (BOOL)canShowForPass:(id)a3 expressPassController:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "activationState") != 2
    && +[PKPassDetailsCardInfoSectionController canShowSectionForPaymentPass:expressPassController:](PKPassDetailsCardInfoSectionController, "canShowSectionForPaymentPass:expressPassController:", v5, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardInfoSectionController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
