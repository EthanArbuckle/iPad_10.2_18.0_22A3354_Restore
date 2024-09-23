@implementation NCMutingRemoteSuggestionContentProvider

- (NCMutingRemoteSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 managementDelegate:(id)a5 suggestionDelegate:(id)a6 uuid:(id)a7 scope:(unint64_t)a8
{
  id v14;
  NCMutingRemoteSuggestionContentProvider *v15;
  NCMutingRemoteSuggestionContentProvider *v16;
  __CFString *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  objc_super v26;

  v14 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NCMutingRemoteSuggestionContentProvider;
  v15 = -[NCRemoteSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:uuid:](&v26, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_uuid_, a3, v14, a5, a6, a7);
  v16 = v15;
  if (v15)
  {
    v15->_scope = a8;
    if (a8)
    {
      if (a8 != 1)
      {
        v17 = CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_EXPLANATION");
        v19 = &stru_1E8D21F60;
        goto LABEL_10;
      }
      objc_msgSend(CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_EXPLANATION"), "stringByAppendingString:", CFSTR("_THREAD"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NCUserNotificationsUIKitFrameworkBundle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_1E8D21F60, 0);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_EXPLANATION"), "stringByAppendingString:", CFSTR("_APP"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", v17, &stru_1E8D21F60, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v20, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), &v25, v14);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = v25;

      if (v18)
      {
        v23 = (void *)*MEMORY[0x1E0DC5F98];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F98], OS_LOG_TYPE_FAULT))
          +[NCModeConfigurationRemoteSuggestionContentProvider(Testing) _localizedSummaryStringForSuggestionType:configurationType:scope:semanticType:modeName:bundleDisplayName:preferredSenderSummary:localizedStringForKeyBlock:].cold.1((uint64_t)v19, v23, v18);
      }
    }

LABEL_10:
    -[NCNotificationManagementSuggestionContentProvider setAuxiliaryOptionsSummaryText:](v16, "setAuxiliaryOptionsSummaryText:", v19);

  }
  return v16;
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_NOT_NOW"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__NCMutingRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v18[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("notification-management-remote-muting-suggestion-reject"), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REMOTE_MANAGEMENT_MUTING_SUGGESTION_MUTE"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = 3221225472;
  v15 = __65__NCMutingRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v16 = &unk_1E8D1B1C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, CFSTR("notification-management-remote-muting-suggestion-accept"), &v13);
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

void __65__NCMutingRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
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

void __65__NCMutingRemoteSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v4, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", 1, 4, v5, v6);

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v7);

}

- (void)handleAcceptAction:(id)a3
{
  void *v4;
  unint64_t scope;
  void *v6;
  void *v7;
  NCMutingRemoteSuggestionContentProvider *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  -[NCNotificationManagementContentProvider managementDelegate](self, "managementDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  scope = self->_scope;
  if (scope == 1)
  {
    -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = self;
    v9 = 7;
    goto LABEL_5;
  }
  if (!scope)
  {
    -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = self;
    v9 = 6;
LABEL_5:
    objc_msgSend(v7, "notificationManagementContentProvider:requestsPresentingNotificationManagementViewType:forNotificationRequest:withPresentingView:", v8, v9, v6, v10);

  }
}

- (void)logSuggestionEvent:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NCRemoteSuggestionContentProvider uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logSuggestionEvent:suggestionType:suggestionIdentifier:timestamp:", a3, 4, v5, v6);

}

@end
