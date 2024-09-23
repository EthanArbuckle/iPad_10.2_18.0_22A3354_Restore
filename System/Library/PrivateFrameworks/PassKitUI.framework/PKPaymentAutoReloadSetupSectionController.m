@implementation PKPaymentAutoReloadSetupSectionController

- (PKPaymentAutoReloadSetupSectionController)initWithDelegate:(id)a3
{
  id v5;
  PKPaymentAutoReloadSetupSectionController *v6;
  PKPaymentAutoReloadSetupSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAutoReloadSetupSectionController;
  v6 = -[PKPaymentPassDetailSectionController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegate, a3);

  return v7;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AutoReloadSetupSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPaymentAutoReloadSetupSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "activationState") == 0;
  else
    v5 = 0;

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return (id)PKLocalizedPaymentString(CFSTR("PASS_DETAILS_SETUP_AUTO_RELOAD_FOOTER_TITLE"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_USE_APPLE_PAY_TO_AUTO_RELOAD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSelectionStyle:", 3);
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (PKEqualObjects())
  {
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PKPaymentPassDetailAutoReloadActionSectionControllerDelegate presentAutoReloadSetupViewController](self->_delegate, "presentAutoReloadSetupViewController");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
