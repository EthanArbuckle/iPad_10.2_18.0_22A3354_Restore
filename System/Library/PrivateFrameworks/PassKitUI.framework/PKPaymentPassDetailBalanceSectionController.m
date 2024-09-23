@implementation PKPaymentPassDetailBalanceSectionController

- (PKPaymentPassDetailBalanceSectionController)initWithDelegate:(id)a3
{
  id v4;
  PKPaymentPassDetailBalanceSectionController *v5;
  PKPaymentPassDetailBalanceSectionController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassDetailBalanceSectionController;
  v5 = -[PKPaymentPassDetailSectionController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setBalance:(id)a3
{
  void *v4;
  id WeakRetained;

  objc_storeStrong((id *)&self->_balance, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPaymentPassDetailBalanceSectionController sectionIdentifiers](self, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSections:", v4);

}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("BalanceSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment") || !self->_balance)
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKPaymentPassDetailBalanceSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paymentNetworkIdentifier") == 135;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  PKLocalizedPaymentString(CFSTR("PASS_DETAILS_DEFAULT_BALANCE_NAME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount formattedStringValue](self->_balance, "formattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v7, v8, 1, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelectionStyle:", 0);
  return v9;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return self->_footerText;
}

- (PKPaymentPassDetailWrapperSectionControllerDelegate)delegate
{
  return (PKPaymentPassDetailWrapperSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->_footerText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
