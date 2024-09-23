@implementation PKPaymentSetupPrivacyLinkSectionController

- (PKPaymentSetupPrivacyLinkSectionController)init
{
  PKPaymentSetupPrivacyLinkSectionController *v2;
  void *v3;
  uint64_t v4;
  PKPaymentSetupPrivacyLinkSectionController *v5;
  void *v6;
  _QWORD v8[4];
  PKPaymentSetupPrivacyLinkSectionController *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupPrivacyLinkSectionController;
  v2 = -[PKPaymentSetupListSectionController initWithIdentifiers:](&v10, sel_initWithIdentifiers_, &unk_1E3FAE6C8);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0DC35C8];
    v4 = objc_opt_class();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PKPaymentSetupPrivacyLinkSectionController_init__block_invoke;
    v8[3] = &unk_1E3E670D0;
    v5 = v2;
    v9 = v5;
    objc_msgSend(v3, "registrationWithCellClass:configurationHandler:", v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v5, "setCellRegistration:", v6);

  }
  return v2;
}

void __50__PKPaymentSetupPrivacyLinkSectionController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = a2;
  objc_msgSend(v2, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrivacyView:", v4);

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4;
  PKPaymentSetupListItem *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v5 = objc_alloc_init(PKPaymentSetupListItem);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendItems:", v6);

  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (OBPrivacyLinkController)privacyLink
{
  return self->_privacyLink;
}

- (void)setPrivacyLink:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLink, 0);
}

@end
