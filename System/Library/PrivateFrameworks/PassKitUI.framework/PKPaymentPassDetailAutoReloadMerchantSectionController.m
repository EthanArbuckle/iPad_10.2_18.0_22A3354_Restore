@implementation PKPaymentPassDetailAutoReloadMerchantSectionController

- (PKPaymentPassDetailAutoReloadMerchantSectionController)initWithPass:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKPaymentPassDetailAutoReloadMerchantSectionController *v9;
  PKPaymentPassDetailAutoReloadMerchantSectionController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailAutoReloadMerchantSectionController;
  v9 = -[PKPaymentPassDetailSectionController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v10->_isAutoTopEnabled = -[PKPaymentPass isAutoTopEnabled](v10->_pass, "isAutoTopEnabled");
  }

  return v10;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AutoReloadMerchantSection");
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
    -[PKPaymentPassDetailAutoReloadMerchantSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  BOOL v4;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isAutoTopEnabled") && !objc_msgSend(v3, "activationState"))
  {
    +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "autoTopUpActionForPass:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "autoTopUpMerchantTokenIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 == 0;

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  void *v4;
  int64_t v5;

  -[PKPaymentPass autoTopUpFields](self->_pass, "autoTopUpFields", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  PKPaymentPass *pass;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;

  v7 = a3;
  pass = self->_pass;
  v9 = a4;
  -[PKPaymentPass autoTopUpFields](pass, "autoTopUpFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "row");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D6A6F0]);

  if ((_DWORD)v11)
  {
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isAutoTopEnabled)
      v15 = CFSTR("STATE_ON");
    else
      v15 = CFSTR("STATE_OFF");
    PKLocalizedPaymentString(&v15->isa);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v14, v16, 1, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v19 = 0;
  }
  else
  {
    objc_msgSend(v12, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D6A6F8]);

    if (!v21)
    {
      v17 = 0;
      goto LABEL_10;
    }
    -[PKPaymentPass organizationName](self->_pass, "organizationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_MANAGE_WITH"), CFSTR("%@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v23, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v19 = 3;
  }
  objc_msgSend(v18, "setSelectionStyle:", v19);
LABEL_10:

  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  PKPaymentPassDetailAutoReloadActionSectionControllerDelegate **p_setupDelegate;
  id WeakRetained;
  char v15;
  id v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if (PKEqualObjects())
  {
    objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v7, 1);
    -[PKPaymentPass autoTopUpFields](self->_pass, "autoTopUpFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "key");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6A6F8]);

    if (v11)
    {
      objc_msgSend(v9, "link");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      p_setupDelegate = &self->_setupDelegate;
      WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)p_setupDelegate);
        objc_msgSend(v16, "launchURL:", v12);

      }
    }

  }
}

- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate
{
  return (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
