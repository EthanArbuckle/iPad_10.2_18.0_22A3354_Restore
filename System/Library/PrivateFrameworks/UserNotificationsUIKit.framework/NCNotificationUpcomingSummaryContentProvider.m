@implementation NCNotificationUpcomingSummaryContentProvider

- (BOOL)isIconViewLeading
{
  return 1;
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
