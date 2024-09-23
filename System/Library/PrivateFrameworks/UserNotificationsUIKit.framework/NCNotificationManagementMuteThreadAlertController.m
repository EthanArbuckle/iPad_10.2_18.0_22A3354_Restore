@implementation NCNotificationManagementMuteThreadAlertController

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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];

  -[NCNotificationManagementAlertController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLevelSectionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementAlertController settingsDelegate](self, "settingsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationManagementController:sectionSettingsForSectionIdentifier:", self, v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_MENU_THREAD_TITLE"), &stru_1E8D21F60, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementMuteThreadAlertController _threadName](self, "_threadName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementMuteThreadAlertController setTitle:](self, "setTitle:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_ONE_HOUR"), &stru_1E8D21F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__NCNotificationManagementMuteThreadAlertController__configureView__block_invoke;
  v27[3] = &unk_1E8D1EFC8;
  v27[4] = self;
  objc_msgSend(v12, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v14, 0, 0, 0, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementMuteThreadAlertController addAction:](self, "addAction:", v16);
  v17 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_TODAY"), &stru_1E8D21F60, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __67__NCNotificationManagementMuteThreadAlertController__configureView__block_invoke_2;
  v26[3] = &unk_1E8D1EFC8;
  v26[4] = self;
  objc_msgSend(v17, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v19, 0, 0, 0, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationManagementMuteThreadAlertController addAction:](self, "addAction:", v20);
  v21 = (void *)MEMORY[0x1E0DC3448];
  NCUserNotificationsUIKitFrameworkBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_CANCEL"), &stru_1E8D21F60, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementMuteThreadAlertController addAction:](self, "addAction:", v24);

}

uint64_t __67__NCNotificationManagementMuteThreadAlertController__configureView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

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
  objc_msgSend(*(id *)(a1 + 32), "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", v3, 1, v4, v5, v7, v9);

  return 1;
}

uint64_t __67__NCNotificationManagementMuteThreadAlertController__configureView__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

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
  objc_msgSend(*(id *)(a1 + 32), "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationManagementController:setMuted:untilDate:forNotificationRequest:withSectionIdentifier:threadIdentifier:", v3, 1, v4, v5, v7, v9);

  return 1;
}

- (id)_threadName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NCNotificationManagementMuteThreadAlertController _isMessagingThread](self, "_isMessagingThread"))
  {
    -[NCNotificationManagementAlertController request](self, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "communicationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_isMessagingThread
{
  void *v2;
  void *v3;
  char v4;

  -[NCNotificationManagementAlertController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMessagingType");

  return v4;
}

@end
