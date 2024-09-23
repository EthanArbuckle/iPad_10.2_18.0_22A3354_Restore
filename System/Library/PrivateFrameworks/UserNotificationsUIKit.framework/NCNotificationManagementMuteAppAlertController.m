@implementation NCNotificationManagementMuteAppAlertController

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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];

  -[NCNotificationManagementAlertController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementAlertController settingsDelegate](self, "settingsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationManagementController:sectionSettingsForSectionIdentifier:", self, v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MENU_APP_TITLE"), &stru_1E8D21F60, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementMuteAppAlertController setTitle:](self, "setTitle:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_ONE_HOUR"), &stru_1E8D21F60, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__NCNotificationManagementMuteAppAlertController__configureView__block_invoke;
  v26[3] = &unk_1E8D1EFC8;
  v26[4] = self;
  objc_msgSend(v11, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v13, 0, 0, 0, v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementMuteAppAlertController addAction:](self, "addAction:", v15);
  v16 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_TODAY"), &stru_1E8D21F60, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __64__NCNotificationManagementMuteAppAlertController__configureView__block_invoke_2;
  v25[3] = &unk_1E8D1EFC8;
  v25[4] = self;
  objc_msgSend(v16, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v18, 0, 0, 0, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementMuteAppAlertController addAction:](self, "addAction:", v19);
  v20 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_CANCEL"), &stru_1E8D21F60, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementMuteAppAlertController addAction:](self, "addAction:", v23);

}

uint64_t __64__NCNotificationManagementMuteAppAlertController__configureView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  _dateOneHourFromNow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topLevelSectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", v3, 1, v4, v5, v7, 0);

  return 1;
}

uint64_t __64__NCNotificationManagementMuteAppAlertController__configureView__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "settingsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  _dateUntilEndOfToday();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topLevelSectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", v3, 1, v4, v5, v7, 0);

  return 1;
}

@end
