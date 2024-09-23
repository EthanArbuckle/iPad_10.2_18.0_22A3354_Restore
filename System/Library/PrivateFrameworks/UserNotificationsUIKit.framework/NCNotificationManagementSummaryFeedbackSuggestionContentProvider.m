@implementation NCNotificationManagementSummaryFeedbackSuggestionContentProvider

- (NCNotificationManagementSummaryFeedbackSuggestionContentProvider)initWithNotificationRequest:(id)a3 bundleDisplayName:(id)a4 isStackedSummary:(BOOL)a5 managementDelegate:(id)a6 suggestionDelegate:(id)a7
{
  NCNotificationManagementSummaryFeedbackSuggestionContentProvider *v8;
  NCNotificationManagementSummaryFeedbackSuggestionContentProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NCNotificationManagementSummaryFeedbackSuggestionContentProvider;
  v8 = -[NCNotificationManagementSuggestionContentProvider initWithNotificationRequest:bundleDisplayName:managementDelegate:suggestionDelegate:](&v15, sel_initWithNotificationRequest_bundleDisplayName_managementDelegate_suggestionDelegate_, a3, a4, a6, a7);
  v9 = v8;
  if (v8)
  {
    v8->_isStackedSummary = a5;
    v10 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_SUMMARY_FEEDBACK_SUGGESTION"), &stru_1E8D21F60, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationManagementSuggestionContentProvider setAuxiliaryOptionsSummaryText:](v9, "setAuxiliaryOptionsSummaryText:", v13);

  }
  return v9;
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
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_SUGGESTION_GOOD"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke;
  v18[3] = &unk_1E8D1B1C8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("notification-management-summary-feedback-good"), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_MANAGEMENT_SUGGESTION_BAD"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = 3221225472;
  v15 = __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2;
  v16 = &unk_1E8D1B1C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, CFSTR("notification-management-summary-feedback-bad"), &v13);
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

void __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "handleGoodAction:", v4);
}

void __90__NCNotificationManagementSummaryFeedbackSuggestionContentProvider_auxiliaryOptionActions__block_invoke_2(uint64_t a1, void *a2)
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

  objc_msgSend(WeakRetained, "handleBadAction:", v4);
}

- (void)handleGoodAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[NCSummarizationFeedbackManager sharedInstance](NCSummarizationFeedbackManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbsUpFor:isShowingStackSummary:", v5, -[NCNotificationManagementSummaryFeedbackSuggestionContentProvider isStackedSummary](self, "isStackedSummary"));

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v6);

}

- (void)handleBadAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NCNotificationManagementSuggestionContentProvider suggestionDelegate](self, "suggestionDelegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[NCSummarizationFeedbackManager sharedInstance](NCSummarizationFeedbackManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thumbsDownFor:isShowingStackSummary:", v5, -[NCNotificationManagementSummaryFeedbackSuggestionContentProvider isStackedSummary](self, "isStackedSummary"));

  -[NCNotificationManagementContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notificationManagementContentProvider:requestsRemoveSuggestionForRequest:", self, v6);

}

- (BOOL)isStackedSummary
{
  return self->_isStackedSummary;
}

@end
