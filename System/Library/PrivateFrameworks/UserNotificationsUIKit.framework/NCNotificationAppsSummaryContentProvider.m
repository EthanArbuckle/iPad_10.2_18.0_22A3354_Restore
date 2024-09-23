@implementation NCNotificationAppsSummaryContentProvider

- (id)summaryTitle
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_APP_TITLE"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isIconViewLeading
{
  return 0;
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)maxNumberOfSummaryItems
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hideSummaryIconViews
{
  return 1;
}

@end
