@implementation NCNotificationEventTracker

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__NCNotificationEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance___sharedInstance_0;
}

void __44__NCNotificationEventTracker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v1;

}

- (NCNotificationEventTracker)init
{
  NCNotificationEventTracker *v2;
  uint64_t v3;
  ATXNotificationsLoggingClient *logger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationEventTracker;
  v2 = -[NCNotificationEventTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF8980], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (ATXNotificationsLoggingClient *)v3;

  }
  return v2;
}

- (unint64_t)primaryAttachmentTypeForRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(a3, "userNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "family");
  return v8;
}

- (id)notificationDestinationForState:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("destination"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E8D21F60;
  v5 = v3;

  return v5;
}

- (void)shortLookDefaultActionInvokedWithTrigger:(int64_t)a3 forNotificationRequest:(id)a4 withState:(id)a5
{
  ATXNotificationsLoggingClient *logger;
  id v6;

  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 20, v6, 0, 5);

}

- (void)shortLookDismissInvokedForNotificationRequest:(id)a3 withState:(id)a4
{
  ATXNotificationsLoggingClient *logger;
  id v5;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 21, v5, 0, 5);

}

- (void)shortLookClearedForNotificationRequest:(id)a3 withState:(id)a4
{
  ATXNotificationsLoggingClient *logger;
  id v5;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 22, v5, 0, 5);

}

- (void)longLookDefaultActionInvokedWithTrigger:(int64_t)a3 forNotificationRequest:(id)a4 withState:(id)a5
{
  ATXNotificationsLoggingClient *logger;
  id v6;

  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 23, v6, 0, 5);

}

- (void)longLookCustomAction:(id)a3 forNotificationRequest:(id)a4 withState:(id)a5
{
  ATXNotificationsLoggingClient *logger;
  id v6;

  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 24, v6, 0, 5);

}

- (void)longLookDismissInvokedWithTrigger:(int64_t)a3 forNotificationRequest:(id)a4 withState:(id)a5
{
  ATXNotificationsLoggingClient *logger;
  id v6;

  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 25, v6, 0, 5);

}

- (void)longLookReparkInvokedWithTrigger:(int64_t)a3 forNotificationRequest:(id)a4 withState:(id)a5
{
  ATXNotificationsLoggingClient *logger;
  id v6;

  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 26, v6, 0, 5);

}

- (void)receivedNotification:(id)a3 withProminence:(BOOL)a4 sectionSettings:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  ATXNotificationsLoggingClient *logger;
  void *v24;
  id v25;

  v6 = a4;
  v25 = a3;
  v8 = a5;
  objc_msgSend(v25, "alertOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suppression");

  v11 = 0;
  v12 = 17;
  if (!v10 && v6)
  {
    objc_msgSend(v25, "alertOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "reason");

    switch(v11)
    {
      case 1:
      case 2:
        break;
      case 3:
        objc_msgSend(v25, "content");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "communicationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sender");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "topLevelSectionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "curatedContactMatchDetailsForContact:bundleIdentifier:", v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if (objc_msgSend(v19, "isSuggestedMatch"))
            v11 = 4;
          else
            v11 = 3;
        }
        else
        {
          v11 = 3;
        }

        break;
      case 4:
        v11 = 5;
        break;
      default:
        v11 = 0;
        break;
    }
    if (objc_msgSend(v8, "isScheduledDeliveryEnabled"))
    {
      objc_msgSend(v25, "content");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "communicationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        v11 = 6;
    }
    v12 = 16;
  }
  if (objc_msgSend(v25, "isHighlight"))
    v22 = 6;
  else
    v22 = 5;
  logger = self->_logger;
  objc_msgSend(v25, "atxUserNotification");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", v12, v24, v11, v22);

}

- (void)insertedNotificationRequest:(id)a3 toSectionType:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a4 - 1 > 9)
    v5 = 2;
  else
    v5 = qword_1CFD91898[a4 - 1];
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationEventTracker _displayedNotificationRequests:inUILocation:](self, "_displayedNotificationRequests:inUILocation:", v8, v5, v9, v10);
}

- (void)presentedNotificationRequestAsBanner:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationEventTracker _displayedNotificationRequests:inUILocation:](self, "_displayedNotificationRequests:inUILocation:", v6, 3, v7, v8);
}

- (void)_displayedNotificationRequests:(id)a3 inUILocation:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)a4 > 5)
    v7 = 5;
  else
    v7 = qword_1CFD918E8[a4];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "uuid", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[ATXNotificationsLoggingClient logNotificationDeliveryUI:notificationUUIDs:](self->_logger, "logNotificationDeliveryUI:notificationUUIDs:", v7, v8);
}

- (void)modifiedNotificationRequest:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  id v4;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 18, v4, 0, 5);

}

- (void)removedNotificationRequest:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  id v4;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 5, v4, 0, 5);

}

- (void)hideNotificationRequest:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  id v4;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 6, v4, 0, 5);

}

- (void)longLookPresentedForNotificationRequest:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  id v4;

  logger = self->_logger;
  objc_msgSend(a3, "atxUserNotification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", 7, v4, 0, 5);

}

- (void)toggledGroupState:(BOOL)a3 withLeadingNotificationRequest:(id)a4
{
  _BOOL4 v4;
  ATXNotificationsLoggingClient *logger;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  logger = self->_logger;
  objc_msgSend(a4, "atxUserNotification");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v6;
  if (v4)
    v7 = 12;
  else
    v7 = 19;
  -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](logger, "logNotificationEvent:notification:reason:interactionUI:", v7, v6, 0, 5);

}

- (void)executedActionWithIdentifier:(id)a3 forNotificationRequest:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "atxUserNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEC808]) & 1) != 0)
    {
      v7 = 1;
LABEL_10:
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:](self->_logger, "logNotificationEvent:notification:reason:interactionUI:", v7, v6, 0, 5);
      goto LABEL_11;
    }
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEC818]) & 1) != 0)
    {
      v7 = 3;
      goto LABEL_10;
    }
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEC828]) & 1) != 0)
    {
      v7 = 8;
      goto LABEL_10;
    }
    if (v8)
    {
      v7 = 2;
      goto LABEL_10;
    }
  }
LABEL_11:

}

+ (id)createATXNotificationInterfaceFromRequest:(id)a3
{
  id v3;
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
  uint64_t v18;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionID:", v5);

  objc_msgSend(v3, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  objc_msgSend(v3, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v9);

  objc_msgSend(v3, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v11);

  objc_msgSend(v3, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopic:", v12);

  objc_msgSend(v3, "supplementaryActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC5F58];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5F58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "supplementaryActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v4, "setNumSuppActions:", v18);

  return v4;
}

- (void)notificationCenterAppeared
{
  ATXNotificationsLoggingClient *logger;
  id v3;

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 1, 0, v3);

}

- (void)notificationCenterDisappeared
{
  ATXNotificationsLoggingClient *logger;
  id v3;

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 2, 0, v3);

}

- (void)notificationCenterClearAll
{
  ATXNotificationsLoggingClient *logger;
  id v3;

  logger = self->_logger;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 3, 0, v3);

}

- (void)missedBundleAppeared:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 4, v5, v6);

}

- (void)missedBundleExpired:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 5, v5, v6);

}

- (void)missedBundleDismissed:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 7, v5, v6);

}

- (void)missedBundleExpanded:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 6, v5, v6);

}

- (void)digestAppeared:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 8, v5, v6);

}

- (void)digestExpired:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 9, v5, v6);

}

- (void)digestDismissed:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 11, v5, v6);

}

- (void)digestExpanded:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 10, v5, v6);

}

- (void)prioritySectionAppeared:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 16, v5, v6);

}

- (void)prioritySectionExpanded:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 18, v5, v6);

}

- (void)prioritySectionCollapsed:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 19, v5, v6);

}

- (void)prioritySectionClearAll:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 20, v5, v6);

}

- (void)prioritySectionDisappeared:(id)a3
{
  ATXNotificationsLoggingClient *logger;
  void *v4;
  id v5;
  id v6;

  logger = self->_logger;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingClient logNotificationGroupEvent:eventIdentifier:timestamp:](logger, "logNotificationGroupEvent:eventIdentifier:timestamp:", 17, v5, v6);

}

- (void)dismissedSectionType:(unint64_t)a3 withUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 - 4 < 3)
  {
    v7 = v6;
    -[NCNotificationEventTracker digestDismissed:](self, "digestDismissed:", v6);
LABEL_7:
    v6 = v7;
    goto LABEL_8;
  }
  if (a3 == 10)
  {
    v7 = v6;
    -[NCNotificationEventTracker prioritySectionDisappeared:](self, "prioritySectionDisappeared:", v6);
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v7 = v6;
    -[NCNotificationEventTracker missedBundleDismissed:](self, "missedBundleDismissed:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)expandedSectionType:(unint64_t)a3 withUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 - 4 < 3)
  {
    v7 = v6;
    -[NCNotificationEventTracker digestExpanded:](self, "digestExpanded:", v6);
LABEL_7:
    v6 = v7;
    goto LABEL_8;
  }
  if (a3 == 10)
  {
    v7 = v6;
    -[NCNotificationEventTracker prioritySectionExpanded:](self, "prioritySectionExpanded:", v6);
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v7 = v6;
    -[NCNotificationEventTracker missedBundleExpanded:](self, "missedBundleExpanded:", v6);
    goto LABEL_7;
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
