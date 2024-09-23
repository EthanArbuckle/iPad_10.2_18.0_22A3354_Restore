@implementation NCNotificationManagementPromotionAlertController

- (void)_configureView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  NCNotificationManagementPromotionAlertController *v25;
  id v26;
  _QWORD v27[5];
  id v28;

  -[NCNotificationManagementAlertController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_DELIVER_IMMEDIATELY"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke;
  v27[3] = &unk_1E8D1EF28;
  v27[4] = self;
  v9 = v4;
  v28 = v9;
  objc_msgSend(v5, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v7, 0, 0, 0, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementPromotionAlertController addAction:](self, "addAction:", v10);
  -[NCNotificationManagementAlertController settingsDelegate](self, "settingsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationManagementControllerRequestsSystemSettings:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isScheduledDeliveryEnabled"))
  {
    v13 = (void *)MEMORY[0x1E0DC3448];
    NCUserNotificationsUIKitFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_DELIVER_IN_SUMMARY"), &stru_1E8D21F60, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v8;
    v22 = 3221225472;
    v23 = __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke_2;
    v24 = &unk_1E8D1EF28;
    v25 = self;
    v26 = v9;
    objc_msgSend(v13, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v15, 0, 0, 0, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationManagementPromotionAlertController addAction:](self, "addAction:", v16, v21, v22, v23, v24, v25);
  }
  v17 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_CANCEL"), &stru_1E8D21F60, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementPromotionAlertController addAction:](self, "addAction:", v20);

}

uint64_t __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", v3, 0, v4, *(_QWORD *)(a1 + 40));

  return 1;
}

uint64_t __66__NCNotificationManagementPromotionAlertController__configureView__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setScheduledDelivery:forNotificationRequest:withSectionIdentifier:", v3, 1, v4, *(_QWORD *)(a1 + 40));

  return 1;
}

@end
