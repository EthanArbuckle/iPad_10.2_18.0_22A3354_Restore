@implementation PKPaymentSetupVerificationMethodTableController

- (PKPaymentSetupVerificationMethodTableController)initWithVerificationController:(id)a3
{
  id v5;
  PKPaymentSetupVerificationMethodTableController *v6;
  PKPaymentSetupVerificationMethodTableController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupVerificationMethodTableController;
  v6 = -[PKPaymentSetupVerificationMethodTableController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_verificationController, a3);

  return v7;
}

- (id)defaultHeaderViewTitle
{
  void *v2;
  char v3;

  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBarcodePayment");

  if ((v3 & 1) != 0)
    PKLocalizedAquamanString(CFSTR("ACCOUNT_VERIFICATION_TITLE"));
  else
    PKLocalizedPaymentString(CFSTR("CARD_VERIFICATION_TITLE"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultHeaderViewSubTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsBarcodePayment") & 1) != 0)
  {
    objc_msgSend(v2, "organizationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedAquamanString(CFSTR("CHOOSE_ACCOUNT_VERIFICATION_METHOD"), CFSTR("%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CHOOSE_VERIFICATION_METHOD"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_verificationChannels, "count", a3) != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_verificationChannels, "count", a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  PKActivationMethodTableViewCell *sizingCell;
  PKActivationMethodTableViewCell *v7;
  PKActivationMethodTableViewCell *v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v7 = -[PKActivationMethodTableViewCell initWithStyle:reuseIdentifier:]([PKActivationMethodTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("PKActivationMethodTableViewCellIdentifier"));
    v8 = self->_sizingCell;
    self->_sizingCell = v7;

    sizingCell = self->_sizingCell;
  }
  objc_msgSend(v5, "bounds");
  -[PKActivationMethodTableViewCell sizeThatFits:](sizingCell, "sizeThatFits:", v9, 1.79769313e308);
  v11 = v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKActivationMethodTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKActivationMethodTableViewCellIdentifier"));
  v7 = (PKActivationMethodTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PKActivationMethodTableViewCell initWithStyle:reuseIdentifier:]([PKActivationMethodTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("PKActivationMethodTableViewCellIdentifier"));
    PKProvisioningSecondaryBackgroundColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKActivationMethodTableViewCell setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  -[NSArray objectAtIndex:](self->_verificationChannels, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKActivationMethodTableViewCell textLabel](v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  -[PKActivationMethodTableViewCell detailTextLabel](v7, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupVerificationMethodTableController _detailTextLabelForChannel:](self, "_detailTextLabelForChannel:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  v14 = objc_msgSend(v6, "row");
  if (v14 == self->_selectedIndex)
    v15 = 3;
  else
    v15 = 0;
  -[PKActivationMethodTableViewCell setAccessoryType:](v7, "setAccessoryType:", v15);

  return v7;
}

- (id)_detailTextLabelForChannel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "contactPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  if (v6 == 4 && !objc_msgSend(v5, "length"))
  {
    -[PKPaymentVerificationController pass](self->_verificationController, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_selectedIndex, objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryType:", 0);
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 3);
  v10 = objc_msgSend(v6, "row");

  self->_selectedIndex = v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  PKPaymentVerificationController *verificationController;
  id v6;

  verificationController = self->_verificationController;
  v6 = a4;
  PKPaymentSetupApplyContextAppearance(-[PKPaymentVerificationController context](verificationController, "context"), v6);

}

- (id)newVerificationRequest
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  unint64_t selectedIndex;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D673C0]);
  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPass:", v4);

  -[NSArray objectAtIndex:](self->_verificationChannels, "objectAtIndex:", self->_selectedIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = (unint64_t)v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Requesting channel :%@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v3, "setChannel:", v5);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      selectedIndex = self->_selectedIndex;
      v11 = 134217984;
      v12 = selectedIndex;
      _os_log_error_impl(&dword_19D178000, v8, OS_LOG_TYPE_ERROR, "Could not find channel at index :%lu@", (uint8_t *)&v11, 0xCu);
    }

  }
  return v3;
}

- (PKPaymentVerificationController)verificationController
{
  return self->_verificationController;
}

- (NSArray)verificationChannels
{
  return self->_verificationChannels;
}

- (void)setVerificationChannels:(id)a3
{
  objc_storeStrong((id *)&self->_verificationChannels, a3);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationChannels, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end
