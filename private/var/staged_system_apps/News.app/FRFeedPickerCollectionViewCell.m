@implementation FRFeedPickerCollectionViewCell

- (FRFeedPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRFeedPickerCollectionViewCell;
  return -[FRFeedBasedCollectionViewCell initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  FCFeedDescriptor *populatedFeed;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRFeedPickerCollectionViewCell;
  -[FRFeedBasedCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  populatedFeed = self->_populatedFeed;
  self->_populatedFeed = 0;

  -[FRFeedPickerCollectionViewCell setMode:](self, "setMode:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)applyLayoutAttributes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRFeedPickerCollectionViewCell;
  -[FRFeedBasedCollectionViewCell applyLayoutAttributes:](&v4, "applyLayoutAttributes:", a3);
  -[FRFeedPickerCollectionViewCell _updateActionButtonPosition](self, "_updateActionButtonPosition");
}

- (void)populateWithFeed:(id)a3 context:(id)a4
{
  id v6;
  void *v7;

  objc_storeStrong((id *)&self->_populatedFeed, a3);
  v6 = a4;
  objc_storeWeak((id *)&self->_feldsparContext, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscriptionController"));

  objc_storeWeak((id *)&self->_subscriptionController, v7);
  -[FRFeedBasedCollectionViewCell _updateButtonImage](self, "_updateButtonImage");
  -[FRFeedPickerCollectionViewCell _updateActionButtonPosition](self, "_updateActionButtonPosition");
  -[FRFeedBasedCollectionViewCell _updateNotificationsBadgeButton](self, "_updateNotificationsBadgeButton");
  -[FRFeedPickerCollectionViewCell fr_accessibilityWorkaroundFor20458918ByClearingParentTableCellsChildCache](self, "fr_accessibilityWorkaroundFor20458918ByClearingParentTableCellsChildCache");
}

- (void)_updateHighlightedState
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (!-[FRFeedBasedCollectionViewCell hideHighlightState](self, "hideHighlightState"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](self, "highlightedScrimView"));
    objc_msgSend(v3, "bringSubviewToFront:", v4);

    v5 = -[FRFeedPickerCollectionViewCell isHighlighted](self, "isHighlighted") ^ 1;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](self, "highlightedScrimView"));
    objc_msgSend(v6, "setHidden:", v5);

  }
}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRFeedPickerCollectionViewCell;
  -[FRFeedBasedCollectionViewCell setSelected:](&v3, "setSelected:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRFeedPickerCollectionViewCell;
  -[FRFeedBasedCollectionViewCell setHighlighted:](&v4, "setHighlighted:", a3);
  -[FRFeedPickerCollectionViewCell _updateHighlightedState](self, "_updateHighlightedState");
}

- (BOOL)isAddable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v3 = objc_msgSend(v2, "isSubscribable");

  return v3;
}

- (BOOL)isSubscribedTo
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell feldsparContext](self, "feldsparContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionController"));
  v6 = objc_msgSend(v3, "isSubscribedToWithSubscriptionController:", v5);

  return v6;
}

- (BOOL)hasNotificationsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell feldsparContext](self, "feldsparContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subscriptionController"));
  v6 = objc_msgSend(v3, "hasNotificationsEnabledWithSubscriptionController:", v5);

  return v6;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  if ((id)-[FRFeedBasedCollectionViewCell mode](self, "mode") != (id)1)
    return 0;
  if (-[FRFeedPickerCollectionViewCell isAddable](self, "isAddable")
    && !-[FRFeedPickerCollectionViewCell isSubscribedTo](self, "isSubscribedTo"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Follow %@"), &stru_1000DF290, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell accessibilityPublisherOrTopicName](self, "accessibilityPublisherOrTopicName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v11));

    v7 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v6, self, "_accessibilityPerformSubscribeAction");
    v14 = v7;
    v8 = &v14;
    goto LABEL_9;
  }
  if (!-[FRFeedPickerCollectionViewCell isRemovable](self, "isRemovable")
    || !-[FRFeedPickerCollectionViewCell isSubscribedTo](self, "isSubscribedTo"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Unfollow %@"), &stru_1000DF290, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell accessibilityPublisherOrTopicName](self, "accessibilityPublisherOrTopicName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5));

  v7 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v6, self, "_accessibilityPerformUnsubscribeAction");
  v13 = v7;
  v8 = &v13;
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 1));

  return v12;
}

- (BOOL)_accessibilityPerformSubscribeAction
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backingTag"));

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008062C();
  -[FRFeedPickerCollectionViewCell _attemptSubscriptionToPopulatedFeed](self, "_attemptSubscriptionToPopulatedFeed");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);

  return 1;
}

- (BOOL)_accessibilityPerformUnsubscribeAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backingTag"));

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000806E4();
  -[FRFeedPickerCollectionViewCell _unsubscribeToPopulatedFeed](self, "_unsubscribeToPopulatedFeed");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Unfollowed %@"), &stru_1000DF290, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell accessibilityPublisherOrTopicName](self, "accessibilityPublisherOrTopicName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7));

  FRAccessibilitySpeakAndDoNotBeInterrupted(v8);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);

  return 1;
}

- (id)automationElements
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_opt_new(NSMutableArray);
  if (+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
      -[NSMutableArray addObject:](v3, "addObject:", v5);

    }
  }
  v6 = -[NSMutableArray copy](v3, "copy");

  return v6;
}

- (id)accessibilityHint
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[FRFeedBasedCollectionViewCell accessibilitySupportsCellSelection](self, "accessibilitySupportsCellSelection"), v4, !v5))
  {
LABEL_10:
    v11 = 0;
    return v11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v7 = objc_msgSend(v6, "feedType");

  if (v7 == (id)11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("Double tap to view stories about this topic");
    goto LABEL_7;
  }
  if (v7 != (id)7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10008079C(self);
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  v10 = CFSTR("Double tap to view stories in this channel");
LABEL_7:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1000DF290, 0));

  return v11;
}

- (id)accessibilityPublisherOrTopicName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return v3;
}

- (void)setMode:(unint64_t)a3
{
  unint64_t v5;
  objc_super v6;

  v5 = -[FRFeedBasedCollectionViewCell mode](self, "mode");
  v6.receiver = self;
  v6.super_class = (Class)FRFeedPickerCollectionViewCell;
  -[FRFeedBasedCollectionViewCell setMode:](&v6, "setMode:", a3);
  if (v5 != a3)
    -[FRFeedPickerCollectionViewCell _updateActionButtonPosition](self, "_updateActionButtonPosition");
}

- (void)_updateActionButtonPosition
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v12);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v5, "bounds");
  v6 = CGRectGetWidth(v13);

  v7 = 8.0;
  if (v6 > 130.0)
    v7 = 12.0;
  v8 = Width * 0.5;
  v9 = v6 - Width * 0.5 - v7;
  v10 = v8 + v7;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v11, "setCenter:", v9, v10);

}

- (void)_actionButtonTapped:(id)a3
{
  void *v4;
  id v5;

  if ((id)-[FRFeedBasedCollectionViewCell mode](self, "mode", a3) == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
    v5 = objc_msgSend(v4, "subscriptionState");

    if (v5 == (id)2)
      -[FRFeedPickerCollectionViewCell _animateUnsubscribeToPopulatedFeed](self, "_animateUnsubscribeToPopulatedFeed");
    else
      -[FRFeedPickerCollectionViewCell _attemptSubscriptionToPopulatedFeed](self, "_attemptSubscriptionToPopulatedFeed");
  }
}

- (void)_animateUnsubscribeToPopulatedFeed
{
  if (-[FRFeedPickerCollectionViewCell isRemovable](self, "isRemovable"))
    -[FRFeedPickerCollectionViewCell _unsubscribeToPopulatedFeed](self, "_unsubscribeToPopulatedFeed");
}

- (void)_unsubscribeToPopulatedFeed
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell subscriptionModificationDelegate](self, "subscriptionModificationDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  objc_msgSend(v4, "feedUnsubscribedForCollectionViewCell:feed:", self, v3);

}

- (void)_attemptSubscriptionToPopulatedFeed
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell subscriptionController](self, "subscriptionController"));
  v4 = objc_msgSend(v3, "canAddSubscription");

  if (v4)
  {
    if (!-[FRFeedPickerCollectionViewCell isRemovable](self, "isRemovable"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingTag"));

      if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100080870();
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell subscriptionController](self, "subscriptionController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribedTagIDs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell subscriptionModificationDelegate](self, "subscriptionModificationDelegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
      objc_msgSend(v9, "feedSubscribedForCollectionViewCell:feed:preSubscribedTagIDs:", self, v10, v8);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asChannel"));
      LODWORD(v10) = objc_msgSend(v11, "supportsNotifications");

      if ((_DWORD)v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));
        objc_msgSend(v12, "showNotificationsEnabledAlertForTag:", v6);

      }
    }
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));
    objc_msgSend(v13, "exceededMaximumAllowedSubscription");

  }
}

- (FCFeedDescriptor)populatedFeed
{
  return self->_populatedFeed;
}

- (FRSubscriptionMonitorDelegate)subscriptionMonitorDelegate
{
  return (FRSubscriptionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_subscriptionMonitorDelegate);
}

- (void)setSubscriptionMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subscriptionMonitorDelegate, a3);
}

- (FRFeldsparContext)feldsparContext
{
  return (FRFeldsparContext *)objc_loadWeakRetained((id *)&self->_feldsparContext);
}

- (FCSubscriptionController)subscriptionController
{
  return (FCSubscriptionController *)objc_loadWeakRetained((id *)&self->_subscriptionController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subscriptionController);
  objc_destroyWeak((id *)&self->_feldsparContext);
  objc_destroyWeak((id *)&self->_subscriptionMonitorDelegate);
  objc_storeStrong((id *)&self->_populatedFeed, 0);
}

@end
