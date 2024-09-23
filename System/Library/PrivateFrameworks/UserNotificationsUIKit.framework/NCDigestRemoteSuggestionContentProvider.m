@implementation NCDigestRemoteSuggestionContentProvider

- (NCDigestRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7
{
  id v12;
  NCDigestRemoteSuggestionContentProvider *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCDigestRemoteSuggestionContentProvider;
  v13 = -[NCRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](&v19, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_uuid_, a3, v12, a5, a6, a7);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_SUMMARY_SUGGESTION"), &stru_1E8D21F60, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementSuggestionContentProvider setAuxiliaryOptionsSummaryText:](v13, "setAuxiliaryOptionsSummaryText:", v17);

  }
  return v13;
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_SUGGESTION_NOT_NOW"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v18[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("notification-management-remote-suggestion-reject"), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_SUMMARY_SUGGESTION_ADD_TO_SUMMARY"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = 3221225472;
  v15 = __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v16 = &unk_1E8D1B1C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, CFSTR("notification-management-remote-suggestion-accept"), &v13);
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

void __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
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

void __65__NCDigestRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "handleAcceptAction:", v4);
}

- (void)handleRejectAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCRemoteSuggestionContentProvider uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 1, 6, v5, v6);

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v7);

}

- (void)handleAcceptAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationManagementContentProvider:setScheduledDelivery:forSectionIdentifier:", self, 1, v5);

  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCRemoteSuggestionContentProvider uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 2, 6, v7, v8);

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v9);

}

@end
