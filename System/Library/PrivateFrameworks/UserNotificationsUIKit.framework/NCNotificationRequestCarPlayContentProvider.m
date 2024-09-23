@implementation NCNotificationRequestCarPlayContentProvider

- (id)icons
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carPlayIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "content");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultHeader");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v11;
    }

    v5 = v10;
  }
  return v5;
}

- (id)primarySubtitleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "content");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "customHeader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "content");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "defaultHeader");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v5 = v15;
      }

      v5 = v14;
    }
  }
  return v5;
}

- (id)secondaryText
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
