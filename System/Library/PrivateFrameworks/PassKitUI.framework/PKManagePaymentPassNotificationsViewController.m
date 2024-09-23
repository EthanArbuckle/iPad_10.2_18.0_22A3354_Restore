@implementation PKManagePaymentPassNotificationsViewController

+ (BOOL)canShowForPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v11, "passType") == 1)
  {
    v16 = v11;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v16);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v17);
    v19 = objc_msgSend(v16, "activationState") != 2
       && +[PKPaymentPassDetailsNotificationSettingsSectionController canShowSectionforPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:transactionSourceCollection:](PKPaymentPassDetailsNotificationSettingsSectionController, "canShowSectionforPass:dataProvider:peerPaymentAccount:bankConnectAccount:account:transactionSourceCollection:", v16, v12, v13, v14, v15, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  -[PKDynamicTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKManagePaymentPassNotificationsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DA0]);

}

- (PKManagePaymentPassNotificationsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 bankConnectAccount:(id)a6 account:(id)a7 transactionSourceCollection:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKManagePaymentPassNotificationsViewController *v21;
  PKManagePaymentPassNotificationsViewController *v22;
  PKPaymentPassDetailsNotificationSettingsSectionController *v23;
  PKPaymentPassDetailsNotificationSettingsSectionController *notificationsSectionController;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  v21 = -[PKDynamicTableViewController initWithStyle:](&v29, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_pass, a3);
    objc_storeStrong((id *)&v22->_defaultDataProvider, a4);
    v23 = -[PKPaymentPassDetailsNotificationSettingsSectionController initWithPass:peerPaymentAccount:bankConnectAccount:account:paymentDataProvider:transactionSourceCollection:detailViewStyle:delegate:]([PKPaymentPassDetailsNotificationSettingsSectionController alloc], "initWithPass:peerPaymentAccount:bankConnectAccount:account:paymentDataProvider:transactionSourceCollection:detailViewStyle:delegate:", v22->_pass, v17, v18, v19, v22->_defaultDataProvider, v20, 0, v22);
    notificationsSectionController = v22->_notificationsSectionController;
    v22->_notificationsSectionController = v23;

    v30[0] = v22->_notificationsSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController setSectionControllers:](v22, "setSectionControllers:", v25);

    -[PKManagePaymentPassNotificationsViewController navigationItem](v22, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("SETTINGS_MANAGE_NOTIFICATIONS_HEADER"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:", v27);

  }
  return v22;
}

- (void)didSelectEditNotificationSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "notificationAuthorizationStatus") == 1)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=%@"), *MEMORY[0x1E0D6B590]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openSensitiveURL:withOptions:", v6, 0);

  }
}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3
{
  PKPaymentPassDetailsNotificationSettingsSectionController *notificationsSectionController;
  id v5;
  void *v6;
  objc_super v7;

  notificationsSectionController = self->_notificationsSectionController;
  v5 = a3;
  -[PKPaymentPassDetailsNotificationSettingsSectionController allSectionIdentifiers](notificationsSectionController, "allSectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKManagePaymentPassNotificationsViewController;
  -[PKDynamicTableViewController recomputeMappedSectionsAndReloadSections:sectionIdentifiers:](&v7, sel_recomputeMappedSectionsAndReloadSections_sectionIdentifiers_, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDataProvider, 0);
  objc_storeStrong((id *)&self->_notificationsSectionController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
