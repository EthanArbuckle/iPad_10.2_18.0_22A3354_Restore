@implementation NCNotificationCommunicationsSummaryContentProvider

- (id)summaryTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  -[NCNotificationSummaryContentProvider notificationRequests](self, "notificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_32);

  -[NCNotificationSummaryContentProvider notificationRequests](self, "notificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_155);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = &stru_1E8D21F60;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return v7;
    goto LABEL_6;
  }
  NCUserNotificationsUIKitFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_COMMUNICATION_CALLS"), &stru_1E8D21F60, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E8D21F60, "stringByAppendingString:", v9);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_CONNECTOR_AND"), &stru_1E8D21F60, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(" %@ "), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v12;
LABEL_6:
    NCUserNotificationsUIKitFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_COMMUNICATION_MESSAGES"), &stru_1E8D21F60, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v15;
  }
  return v7;
}

uint64_t __66__NCNotificationCommunicationsSummaryContentProvider_summaryTitle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMessagingType");

  return v3;
}

uint64_t __66__NCNotificationCommunicationsSummaryContentProvider_summaryTitle__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCallType");

  return v3;
}

- (BOOL)isIconViewLeading
{
  return 0;
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[NCNotificationSummaryContentProvider _summaryStringForCommunicationNotificationRequest:](self, "_summaryStringForCommunicationNotificationRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationSummaryContentProvider _shouldShowContentForNotificationRequest:](self, "_shouldShowContentForNotificationRequest:", v4)&& v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultHeader");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
