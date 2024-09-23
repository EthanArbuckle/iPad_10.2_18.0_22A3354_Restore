@implementation NCNotificationManagementTimeSensitiveKeepAlertController

- (void)_configureView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_TIME_SENSITIVE_SUGGESTION_EXPLANATION"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementTimeSensitiveKeepAlertController setTitle:](self, "setTitle:", v4);

  v5 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_TIME_SENSITIVE_SUGGESTION_KEEP_ON"), &stru_1E8D21F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NCNotificationManagementTimeSensitiveKeepAlertController__configureView__block_invoke;
  v13[3] = &unk_1E8D1EFC8;
  v13[4] = self;
  objc_msgSend(v5, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v7, 0, 0, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementTimeSensitiveKeepAlertController addAction:](self, "addAction:", v8);
  v9 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_CANCEL"), &stru_1E8D21F60, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementTimeSensitiveKeepAlertController addAction:](self, "addAction:", v12);

}

uint64_t __74__NCNotificationManagementTimeSensitiveKeepAlertController__configureView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setAllowsTimeSensitive:forNotificationRequest:withSectionIdentifier:", v3, 1, v4, v6);

  return 1;
}

@end
