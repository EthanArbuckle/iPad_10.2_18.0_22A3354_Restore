@implementation PKManageBarcodePassNotificationsViewController

+ (BOOL)canShowForPass:(id)a3
{
  return +[PKBarcodePassDetailsNotificationSettingsSectionController canShowSectionforPass:](PKBarcodePassDetailsNotificationSettingsSectionController, "canShowSectionforPass:", a3);
}

- (PKManageBarcodePassNotificationsViewController)initWithPass:(id)a3
{
  id v5;
  PKManageBarcodePassNotificationsViewController *v6;
  PKManageBarcodePassNotificationsViewController *v7;
  PKBarcodePassDetailsNotificationSettingsSectionController *v8;
  PKBarcodePassDetailsNotificationSettingsSectionController *notificationsSectionController;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKManageBarcodePassNotificationsViewController;
  v6 = -[PKDynamicTableViewController initWithStyle:](&v14, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    v8 = -[PKBarcodePassDetailsNotificationSettingsSectionController initWithPass:detailViewStyle:delegate:]([PKBarcodePassDetailsNotificationSettingsSectionController alloc], "initWithPass:detailViewStyle:delegate:", v7->_pass, 0, v7);
    notificationsSectionController = v7->_notificationsSectionController;
    v7->_notificationsSectionController = v8;

    v15[0] = v7->_notificationsSectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicTableViewController setSectionControllers:](v7, "setSectionControllers:", v10);

    -[PKManageBarcodePassNotificationsViewController navigationItem](v7, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("SETTINGS_MANAGE_SETTINGS_HEADER"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

  }
  return v7;
}

- (void)recomputeMappedSectionsAndReloadSections:(id)a3
{
  PKBarcodePassDetailsNotificationSettingsSectionController *notificationsSectionController;
  id v5;
  void *v6;
  objc_super v7;

  notificationsSectionController = self->_notificationsSectionController;
  v5 = a3;
  -[PKBarcodePassDetailsNotificationSettingsSectionController allSectionIdentifiers](notificationsSectionController, "allSectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKManageBarcodePassNotificationsViewController;
  -[PKDynamicTableViewController recomputeMappedSectionsAndReloadSections:sectionIdentifiers:](&v7, sel_recomputeMappedSectionsAndReloadSections_sectionIdentifiers_, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsSectionController, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
