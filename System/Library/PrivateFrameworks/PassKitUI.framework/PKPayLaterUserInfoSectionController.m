@implementation PKPayLaterUserInfoSectionController

- (PKPayLaterUserInfoSectionController)initWithPayLaterAccount:(id)a3 delegate:(id)a4
{
  id v6;
  PKPayLaterUserInfoSectionController *v7;
  PKPayLaterUserInfoSectionController *v8;
  uint64_t v9;
  PKPaymentWebService *paymentWebService;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterUserInfoSectionController;
  v7 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v12, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a3, 0, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v9 = objc_claimAutoreleasedReturnValue();
    paymentWebService = v8->_paymentWebService;
    v8->_paymentWebService = (PKPaymentWebService *)v9;

    -[PKPayLaterUserInfoSectionController _updateUserInfo](v8, "_updateUserInfo");
  }

  return v8;
}

- (void)setPayLaterAccount:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterUserInfoSectionController;
  -[PKPayLaterSectionController setPayLaterAccount:](&v4, sel_setPayLaterAccount_, a3);
  -[PKPayLaterUserInfoSectionController _updateUserInfo](self, "_updateUserInfo");
}

- (id)identifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kEmailAdderssSection");
  v3[1] = CFSTR("kOtherUserInfoSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterUserInfoSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v20, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (__CFString *)v6;
  v17 = v16;
  if (v16 == CFSTR("kEmailAdderssSection")
    || v16
    && (v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("kEmailAdderssSection")),
        v17,
        v18))
  {
    v13 = -15.0;
  }
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("kEmailAdderssSection")
    || v3 && (v5 = objc_msgSend(CFSTR("kEmailAdderssSection"), "isEqualToString:", v3), v4, v5))
  {
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_EMAIL_FOOTER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D66B00]);
    objc_msgSend(v7, "setFooterText:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0D66B08]);
    objc_msgSend(v8, "setLinkText:", v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=APPLE_ACCOUNT_CONTACT"));
    objc_msgSend(v8, "setLinkURL:", v9);
    objc_msgSend(v8, "setAnalyticsIdentifier:", *MEMORY[0x1E0D688B8]);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLinks:", v10);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kEmailAdderssSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kEmailAdderssSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterUserInfoSectionController _configureEmailAddressSection:](self, "_configureEmailAddressSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kOtherUserInfoSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kOtherUserInfoSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterUserInfoSectionController _configureOtherUserInfoSection:](self, "_configureOtherUserInfoSection:", v6);
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureEmailAddressSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterAccountUserInfo contact](self->_userInfo, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v7, "value"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[PKPayLaterAccountUserInfo emailAddress](self->_userInfo, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "length"))
  {
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_EMAIL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAxID:", *MEMORY[0x1E0D67B38]);
    objc_msgSend(v4, "addObject:", v11);
    v12 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v13, "appendItems:", v12);

  }
}

- (void)_configureOtherUserInfoSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v13 = objc_alloc_init(v4);
  -[PKPayLaterUserInfoSectionController _legalNameRow](self, "_legalNameRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v6);

  -[PKPayLaterUserInfoSectionController _dobRow](self, "_dobRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v7);

  -[PKPayLaterUserInfoSectionController _phoneNumberRow](self, "_phoneNumberRow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v8);

  -[PKPayLaterUserInfoSectionController _addressRow](self, "_addressRow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v9);

  -[PKPayLaterUserInfoSectionController _ssnRow](self, "_ssnRow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v10);

  -[PKPayLaterUserInfoSectionController _yearlyIncomeRow](self, "_yearlyIncomeRow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safelyAddObject:", v11);

  v12 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v5, "appendItems:", v12);

}

- (id)_legalNameRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPayLaterAccountUserInfo contact](self->_userInfo, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "length"))
  {
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_LEGAL_NAME"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v6, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAxID:", *MEMORY[0x1E0D67D78]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_dobRow
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[PKPayLaterAccountUserInfo contact](self->_userInfo, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = *MEMORY[0x1E0C996C8];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCalendar:", v9);

  objc_msgSend(v8, "setDateStyle:", 1);
  objc_msgSend(v8, "stringFromDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_4:
    -[PKPayLaterAccountUserInfo dateOfBirth](self->_userInfo, "dateOfBirth");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v10, "length"))
  {
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_DOB"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v12, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAxID:", *MEMORY[0x1E0D67A78]);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_phoneNumberRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPayLaterSubtitleRow *v10;
  PKPayLaterSubtitleRow *phoneRow;
  PKPayLaterSubtitleRow *v12;
  _QWORD v14[5];
  id v15;
  id location;

  -[PKPayLaterAccountUserInfo contact](self->_userInfo, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v5, "value"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "stringValue"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    -[PKPayLaterAccountUserInfo phoneNumber](self->_userInfo, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "length"))
  {
    objc_initWeak(&location, self);
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_PHONE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke;
    v14[3] = &unk_1E3E61B68;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v9, v7, v14);
    v10 = (PKPayLaterSubtitleRow *)objc_claimAutoreleasedReturnValue();
    phoneRow = self->_phoneRow;
    self->_phoneRow = v10;

    -[PKPayLaterSubtitleRow setAxID:](self->_phoneRow, "setAxID:", *MEMORY[0x1E0D67E98]);
    v12 = self->_phoneRow;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id buf;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 144))
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on phone number row since there is already a request in flight", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      *((_BYTE *)WeakRetained + 144) = 1;
      objc_msgSend(WeakRetained, "viewControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0D68C08];
      v13[0] = *MEMORY[0x1E0D69440];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportAnalyticsEvent:", v6);

      objc_msgSend(v3[15], "setShowSpinner:", 1);
      objc_msgSend(v3, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadItem:animated:", v3[15], 1);

      objc_initWeak(&buf, *(id *)(a1 + 32));
      v8 = objc_loadWeakRetained(v3 + 12);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke_37;
      v9[3] = &unk_1E3E61310;
      objc_copyWeak(&v10, &buf);
      objc_msgSend(v8, "updateUserInfoForType:completion:", 1, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&buf);
    }
  }

}

void __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke_37(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 15), "setShowSpinner:", 0);
    objc_msgSend(v3, "dynamicCollectionDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadItem:animated:", v3[15], 1);

    WeakRetained = v3;
  }

}

- (id)_addressRow
{
  void *v3;
  void *v4;
  void *v5;
  PKPayLaterSubtitleRow *v6;
  PKPayLaterSubtitleRow *addressRow;
  PKPayLaterSubtitleRow *v8;
  _QWORD v10[5];
  id v11;
  id location;

  -[PKPayLaterAccountUserInfo contact](self->_userInfo, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkFormattedContactAddressWithoutName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_initWeak(&location, self);
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_ADDRESS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke;
    v10[3] = &unk_1E3E61B68;
    objc_copyWeak(&v11, &location);
    v10[4] = self;
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v5, v4, v10);
    v6 = (PKPayLaterSubtitleRow *)objc_claimAutoreleasedReturnValue();
    addressRow = self->_addressRow;
    self->_addressRow = v6;

    -[PKPayLaterSubtitleRow setAxID:](self->_addressRow, "setAxID:", *MEMORY[0x1E0D67878]);
    v8 = self->_addressRow;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id buf;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 144))
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on address row since there is already a request in flight", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      *((_BYTE *)WeakRetained + 144) = 1;
      objc_msgSend(WeakRetained, "viewControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0D68C08];
      v13[0] = *MEMORY[0x1E0D69428];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportAnalyticsEvent:", v6);

      objc_msgSend(v3[16], "setShowSpinner:", 1);
      objc_msgSend(v3, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadItem:animated:", v3[16], 1);

      objc_initWeak(&buf, *(id *)(a1 + 32));
      v8 = objc_loadWeakRetained(v3 + 12);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke_41;
      v9[3] = &unk_1E3E61310;
      objc_copyWeak(&v10, &buf);
      objc_msgSend(v8, "updateUserInfoForType:completion:", 2, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&buf);
    }
  }

}

void __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke_41(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 16), "setShowSpinner:", 0);
    objc_msgSend(v3, "dynamicCollectionDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadItem:animated:", v3[16], 1);

    WeakRetained = v3;
  }

}

- (id)_ssnRow
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKPayLaterAccountUserInfo ssn](self->_userInfo, "ssn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasHiddenValue");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v8 = 0;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_SSN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_SSN_ON_FILE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAxID:", *MEMORY[0x1E0D67FB0]);
  }

  return v8;
}

- (id)_yearlyIncomeRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPayLaterSubtitleRow *v7;
  PKPayLaterSubtitleRow *incomeRow;
  PKPayLaterSubtitleRow *v9;
  _QWORD v11[5];
  id v12;
  id location;

  -[PKPayLaterAccountUserInfo yearlyIncome](self->_userInfo, "yearlyIncome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "length"))
  {
    objc_initWeak(&location, self);
    PKLocalizedCocoonString(CFSTR("ACCOUNT_INFORMATION_TOTAL_INCOME"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke;
    v11[3] = &unk_1E3E61B68;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    -[PKPayLaterUserInfoSectionController _subtitleRowWithTitle:subtitle:selectionHandler:](self, "_subtitleRowWithTitle:subtitle:selectionHandler:", v6, v5, v11);
    v7 = (PKPayLaterSubtitleRow *)objc_claimAutoreleasedReturnValue();
    incomeRow = self->_incomeRow;
    self->_incomeRow = v7;

    -[PKPayLaterSubtitleRow setAxID:](self->_incomeRow, "setAxID:", *MEMORY[0x1E0D67C68]);
    v9 = self->_incomeRow;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id buf;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 144))
    {
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on income row since there is already a request in flight", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      *((_BYTE *)WeakRetained + 144) = 1;
      objc_msgSend(WeakRetained, "viewControllerDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0D68C08];
      v13[0] = *MEMORY[0x1E0D69448];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportAnalyticsEvent:", v6);

      objc_msgSend(v3[17], "setShowSpinner:", 1);
      objc_msgSend(v3, "dynamicCollectionDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadItem:animated:", v3[17], 1);

      objc_initWeak(&buf, *(id *)(a1 + 32));
      v8 = objc_loadWeakRetained(v3 + 12);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke_48;
      v9[3] = &unk_1E3E61310;
      objc_copyWeak(&v10, &buf);
      objc_msgSend(v8, "updateUserInfoForType:completion:", 3, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&buf);
    }
  }

}

void __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke_48(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 17), "setShowSpinner:", 0);
    objc_msgSend(v3, "dynamicCollectionDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadItem:animated:", v3[17], 1);

    WeakRetained = v3;
  }

}

- (id)_subtitleRowWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKPayLaterSubtitleRow *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PKPayLaterSubtitleRow initWithTitle:subtitle:selectionHandler:]([PKPayLaterSubtitleRow alloc], "initWithTitle:subtitle:selectionHandler:", v9, v8, v7);

  v11 = (void *)*MEMORY[0x1E0DC4918];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSubtitleRow setTitleFont:](v10, "setTitleFont:", v12);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], v11, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterSubtitleRow setSubtitleFont:](v10, "setSubtitleFont:", v13);

  -[PKPayLaterSubtitleRow setExcludeFromScreenCapture:](v10, "setExcludeFromScreenCapture:", 1);
  return v10;
}

- (void)_updateUserInfo
{
  void *v3;
  PKPayLaterAccountUserInfo *v4;
  PKPayLaterAccountUserInfo *userInfo;
  id v6;

  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payLaterDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (PKPayLaterAccountUserInfo *)objc_claimAutoreleasedReturnValue();
  userInfo = self->_userInfo;
  self->_userInfo = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomeRow, 0);
  objc_storeStrong((id *)&self->_addressRow, 0);
  objc_storeStrong((id *)&self->_phoneRow, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
