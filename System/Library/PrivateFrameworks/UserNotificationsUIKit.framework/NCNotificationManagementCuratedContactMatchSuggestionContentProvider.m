@implementation NCNotificationManagementCuratedContactMatchSuggestionContentProvider

- (NCNotificationManagementCuratedContactMatchSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 contactName:(id)a7
{
  id v12;
  id v13;
  NCNotificationManagementCuratedContactMatchSuggestionContentProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v12 = a4;
  v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationManagementCuratedContactMatchSuggestionContentProvider;
  v14 = -[NCNotificationManagementSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](&v20, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_, a3, v12, a5, a6);
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_CONTACT_SUGGESTION"), &stru_1E8D21F60, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v13, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationManagementSuggestionContentProvider setAuxiliaryOptionsSummaryText:](v14, "setAuxiliaryOptionsSummaryText:", v18);
  }

  return v14;
}

- (id)auxiliaryOptionActions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_CONTACT_UPDATE"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__NCNotificationManagementCuratedContactMatchSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v18[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("notification-management-contact-match-suggestion-confirm"), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_CONTACT_NOT_NOW"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = 3221225472;
  v15 = __94__NCNotificationManagementCuratedContactMatchSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v16 = &unk_1E8D1B1C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, CFSTR("notification-management-contact-match-suggestion-reject"), &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v6;
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v11;
}

void __94__NCNotificationManagementCuratedContactMatchSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleConfirmAction:", v4);
}

void __94__NCNotificationManagementCuratedContactMatchSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "handleRejectAction:", v4);
}

- (void)handleConfirmAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementContentProvider:setCuratedContactSuggestionConfirmed:request:", self, 1, v4);

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v5);

}

- (void)handleRejectAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementContentProvider:setCuratedContactSuggestionConfirmed:request:", self, 0, v4);

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v5);

}

@end
