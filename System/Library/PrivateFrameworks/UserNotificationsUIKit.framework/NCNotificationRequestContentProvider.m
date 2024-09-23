@implementation NCNotificationRequestContentProvider

- (NCNotificationRequestContentProvider)initWithNotificationRequest:(id)a3
{
  id v5;
  NCNotificationRequestContentProvider *v6;
  NCNotificationRequestContentProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationRequestContentProvider;
  v6 = -[NCNotificationRequestContentProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationRequest, a3);

  return v7;
}

- (NCNotificationRequestContentProvider)init
{
  -[NCNotificationRequestContentProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNotificationRequest:", self->_notificationRequest);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)(v4 + 16), WeakRetained);

  *(_QWORD *)(v4 + 48) = self->_contentHidingEnforcement;
  objc_storeStrong((id *)(v4 + 24), self->_overriddenActions);
  v6 = -[UIView copy](self->_communicationAvatar, "copy");
  v7 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v6;

  v8 = -[NCBadgedIconView copy](self->_badgedIconView, "copy");
  v9 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v8;

  return (id)v4;
}

- (void)setNotificationRequest:(id)a3
{
  NCNotificationRequest *v5;
  NCNotificationRequest *v6;

  v5 = (NCNotificationRequest *)a3;
  if (self->_notificationRequest != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_notificationRequest, a3);
    -[NCNotificationRequestContentProvider _invalidateCachedData](self, "_invalidateCachedData");
    v5 = v6;
  }

}

- (BOOL)isPrimarySubtitleTextDisplayingRequestTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isPrimarySubtitleTextDisplayingRecipientsSummary
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NCNotificationRequestContentProvider isPrimarySubtitleTextDisplayingRequestTitle](self, "isPrimarySubtitleTextDisplayingRequestTitle"))
  {
    return 0;
  }
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "communicationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 != 0;

  return v3;
}

- (NCBadgedIconView)badgedIconView
{
  NCBadgedIconView *badgedIconView;
  void *v4;
  NCBadgedIconView *v5;
  NCBadgedIconView *v6;
  NCBadgedIconView *v7;

  badgedIconView = self->_badgedIconView;
  if (badgedIconView)
  {
    -[NCNotificationRequestContentProvider badgeText](self, "badgeText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NCBadgedIconView copyWithBadgeText:](badgedIconView, "copyWithBadgeText:", v4);
    v6 = self->_badgedIconView;
    self->_badgedIconView = v5;

  }
  else
  {
    v7 = -[NCNotificationRequestContentProvider _newBadgedIconView](self, "_newBadgedIconView");
    v4 = self->_badgedIconView;
    self->_badgedIconView = v7;
  }

  return self->_badgedIconView;
}

- (NSArray)icons
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHeader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultHeader");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
  {
    objc_msgSend(v7, "localizedUppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedUppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
}

- (NSDate)date
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (BOOL)isDateAllDay
{
  void *v2;
  void *v3;
  char v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDateAllDay");

  return v4;
}

- (NSTimeZone)timeZone
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v4;
}

- (NSString)primaryText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryTextForRequest:isThreadSummary:summarizedNotificationsAllHaveMatchingPrimaryText:", v4, -[NCNotificationRequestContentProvider isThreadSummary](self, "isThreadSummary"), -[NCNotificationRequestContentProvider summarizedNotificationsAllHaveMatchingPrimaryText](self, "summarizedNotificationsAllHaveMatchingPrimaryText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)defaultPrimaryTextForRequest:(id)a3
{
  return (id)objc_msgSend(a1, "primaryTextForRequest:isThreadSummary:summarizedNotificationsAllHaveMatchingPrimaryText:", a3, 0, 0);
}

+ (id)primaryTextForRequest:(id)a3 isThreadSummary:(BOOL)a4 summarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v18;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "communicationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = v9;
  }
  else
  {
    if (!v11)
    {
      if (!v6 || v5)
      {
        objc_msgSend(v7, "content");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      goto LABEL_9;
    }
    if (v6 && (objc_msgSend(v11, "isGroup") & 1) != 0)
    {
      objc_msgSend(v11, "preferredRecipientsSummary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "preferredSenderSummary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v13 = v12;
LABEL_9:
  if (!objc_msgSend(v13, "length"))
  {
    objc_msgSend(v7, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultHeader");
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  v16 = v13;

  return v16;
}

- (NSString)primarySubtitleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "communicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NCNotificationRequestContentProvider isPrimarySubtitleTextDisplayingRecipientsSummary](self, "isPrimarySubtitleTextDisplayingRecipientsSummary"))
  {
    objc_msgSend(v5, "preferredRecipientsSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[NCNotificationRequestContentProvider isPrimarySubtitleTextDisplayingRequestTitle](self, "isPrimarySubtitleTextDisplayingRequestTitle");
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
      objc_msgSend(v9, "title");
    else
      objc_msgSend(v9, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSAttributedString)secondaryText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollapsedNotification");

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "customHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "defaultHeader");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("COLLAPSED_NOTIFICATION_MESSAGE"), &stru_1E8D21F60, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, objc_msgSend(v17, "collapsedNotificationsCount"), v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
    v5 = v10;
  }
  else
  {
    objc_msgSend(v6, "attributedMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSAttributedString *)v11;
}

- (NSAttributedString)contentSummaryText
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v4;
}

- (NSString)importantText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "interruptionLevel") == 2)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TIME_SENSITIVE_TEXT"), &stru_1E8D21F60, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedUppercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isHighlight"))
    v3 = _NCIsNotificationHighlightsAllowed();
  else
    v3 = 0;

  return v3;
}

- (BOOL)isThreadSummary
{
  return -[NCNotificationRequestContentProvider summarizedNotificationsCount](self, "summarizedNotificationsCount") != 0;
}

- (void)setSummarizedNotificationsCount:(unint64_t)a3
{
  NCBadgedIconView *badgedIconView;

  if (self->_summarizedNotificationsCount != a3)
  {
    self->_summarizedNotificationsCount = a3;
    badgedIconView = self->_badgedIconView;
    self->_badgedIconView = 0;

  }
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interruptionLevel");

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intelligentBehavior");

  if ((v4 & 1) != 0 && v8 == 3)
  {
    -[NCNotificationRequestContentProvider _criticalAlertIconAttributedStringWithImageConfiguration:](self, "_criticalAlertIconAttributedStringWithImageConfiguration:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("CRITICAL_TEXT");
LABEL_7:
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E8D21F60, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedUppercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR(" %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v14, "initWithString:", v22);
    objc_msgSend(v13, "appendAttributedString:", v23);

    goto LABEL_8;
  }
  v13 = 0;
  if ((v4 & 2) != 0 && v11 == 2)
  {
    -[NCNotificationRequestContentProvider _intelligentManagementIconAttributedStringWithImageConfiguration:](self, "_intelligentManagementIconAttributedStringWithImageConfiguration:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v19, "mutableCopy");

    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v15 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("INTELLIGENCE_MAYBE_IMPORTANT");
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interruptionLevel");

  if (v3 == 3)
  {
    v4 = (void *)MEMORY[0x1E0D474B8];
    NCUserNotificationsUIKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_visualStylingProviderForStyleSetNamed:inBundle:", CFSTR("notificationCritical"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (MTVisualStylingProvider *)v6;
}

- (id)summaryText
{
  return 0;
}

- (NSString)footerText
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isNumberOfLinesInfinite
{
  void *v2;
  void *v3;
  char v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNumberOfLinesInfinite");

  return v4;
}

- (UIImage)thumbnail
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (UIView)communicationAvatar
{
  UIView *communicationAvatar;
  UIView *v4;
  void *v5;
  UIView *v6;
  UIView *v7;

  communicationAvatar = self->_communicationAvatar;
  if (communicationAvatar)
  {
    v4 = (UIView *)-[UIView copy](communicationAvatar, "copy");
    v5 = self->_communicationAvatar;
    self->_communicationAvatar = v4;
  }
  else
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[NCAvatarView isAvatarPossibleWithNotificationRequest:](NCAvatarView, "isAvatarPossibleWithNotificationRequest:", v5))
    {
      v6 = -[NCNotificationRequestContentProvider _newAvatarView](self, "_newAvatarView");
    }
    else
    {
      v6 = 0;
    }
    v7 = self->_communicationAvatar;
    self->_communicationAvatar = v6;

  }
  return self->_communicationAvatar;
}

- (NSArray)interfaceActions
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showsTextInputOnAppearance") & 1) != 0)
  {
    -[NCNotificationRequestContentProvider overriddenActions](self, "overriddenActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

    if (v5)
      goto LABEL_18;
  }
  else
  {

  }
  -[NCNotificationRequestContentProvider currentActions](self, "currentActions");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = objc_msgSend(v10, "isDestructiveAction");
          v13 = (void *)MEMORY[0x1E0DC38B8];
          if (v12)
            v14 = 2;
          else
            v14 = 0;
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __56__NCNotificationRequestContentProvider_interfaceActions__block_invoke;
          v19[3] = &unk_1E8D1DE90;
          objc_copyWeak(&v20, &location);
          v19[4] = v10;
          objc_msgSend(v13, "actionWithTitle:type:handler:", v11, v14, v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v15);

          objc_destroyWeak(&v20);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

LABEL_18:
  v16 = (void *)objc_msgSend(v18, "copy");
  objc_destroyWeak(&location);

  return (NSArray *)v16;
}

void __56__NCNotificationRequestContentProvider_interfaceActions__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentProvider:performAction:animated:", WeakRetained, *(_QWORD *)(a1 + 32), 1);

}

- (NSArray)menuActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  id v21;
  NCNotificationRequestContentProvider *val;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id location;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  val = self;
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showsTextInputOnAppearance") & 1) != 0)
  {
    -[NCNotificationRequestContentProvider overriddenActions](self, "overriddenActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return (NSArray *)v21;
  }
  else
  {

  }
  -[NCNotificationRequestContentProvider currentActions](val, "currentActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NCNotificationRequestContentProvider notificationRequest](val, "notificationRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "notificationIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "un_logDigest");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathExtension:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0DC3428];
          -[NCNotificationRequestContentProvider _iconImageForNotificationAction:](val, "_iconImageForNotificationAction:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __51__NCNotificationRequestContentProvider_menuActions__block_invoke;
          v23[3] = &unk_1E8D1DC08;
          objc_copyWeak(&v24, &location);
          v23[4] = v9;
          objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v10, v16, v14, v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "isDestructiveAction"))
            v18 = 10;
          else
            v18 = 8;
          objc_msgSend(v17, "setAttributes:", v18);
          objc_msgSend(v21, "addObject:", v17);

          objc_destroyWeak(&v24);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  objc_destroyWeak(&location);
  return (NSArray *)v21;
}

void __51__NCNotificationRequestContentProvider_menuActions__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentProvider:performAction:animated:", WeakRetained, *(_QWORD *)(a1 + 32), 1);

}

- (id)_actionForNotificationAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__NCNotificationRequestContentProvider__actionForNotificationAction___block_invoke;
  aBlock[3] = &unk_1E8D1D568;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = _Block_copy(aBlock);
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __69__NCNotificationRequestContentProvider__actionForNotificationAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentProvider:performAction:animated:", WeakRetained, *(_QWORD *)(a1 + 32), a2);

}

- (id)defaultAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NCNotificationRequestContentProvider _actionForNotificationAction:](self, "_actionForNotificationAction:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = _Block_copy(v5);

  return v6;
}

- (id)cancelAction
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequestContentProvider _actionForNotificationAction:](self, "_actionForNotificationAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clearAction
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequestContentProvider _actionForNotificationAction:](self, "_actionForNotificationAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)closeAction
{
  void *v3;
  void *v4;
  void *v5;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequestContentProvider _actionForNotificationAction:](self, "_actionForNotificationAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nilAction
{
  return -[NCNotificationRequestContentProvider _actionForNotificationAction:](self, "_actionForNotificationAction:", 0);
}

- (BOOL)showsTextInputOnAppearance
{
  void *v2;
  char v3;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsTextInputOnAppearance");

  return v3;
}

- (NCNotificationAction)inlineAction
{
  void *v2;
  void *v3;

  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NCNotificationAction *)v3;
}

- (NSArray)currentActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NCNotificationRequestContentProvider overriddenActions](self, "overriddenActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NCNotificationRequestContentProvider overriddenActions](self, "overriddenActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultEnvironmentActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inlineAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v4);
  }
  else
  {
    v8 = v4;
  }

  return (NSArray *)v8;
}

- (unint64_t)coalesceCount
{
  return 1;
}

- (BOOL)isHidingContent
{
  return 0;
}

- (id)copyWithContentHidingEnforcement:(int64_t)a3
{
  id result;

  result = (id)-[NCNotificationRequestContentProvider copy](self, "copy");
  *((_QWORD *)result + 6) = a3;
  return result;
}

- (id)_applicationImages
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "sectionIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  NCIconImageForApplicationIdentifierWithFormat(v6, 33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NCIconImageForApplicationIdentifierWithFormat(v6, 33, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v9;
  v10 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    if (v7)
      goto LABEL_10;
LABEL_12:

    goto LABEL_10;
  }
  if (!v7)
    goto LABEL_12;
LABEL_10:

  return v11;
}

- (id)_iconImageForNotificationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "iconImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "iconImageBundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {
      -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "un_isFirstPartyIdentifier");

      if (v11)
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v5);
      else
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_4;
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topLevelSectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CA5870];
      -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topLevelSectionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v17, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleWithURL:", v19);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
LABEL_4:
          objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", v5, v7, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
      }
      else
      {
        v20 = (void *)*MEMORY[0x1E0DC5F88];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
          -[NCNotificationRequestContentProvider _iconImageForNotificationAction:].cold.1(v20, self);
      }
    }
    v8 = 0;
    goto LABEL_17;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (id)_newBadgedIconView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NCBadgedIconView *v15;
  void *v16;
  void *v17;
  void *v18;
  NCBadgedIconView *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[NCNotificationRequestContentProvider icons](self, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRequestContentProvider communicationAvatar](self, "communicationAvatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationRequestContentProvider isThreadSummary](self, "isThreadSummary"))
  {
    -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCommunicationType");

    if ((v7 & 1) == 0)
    {
      -[NCNotificationRequestContentProvider _applicationImages](self, "_applicationImages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectsAtIndexes:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v3, "count") >= 3)
    {
      v10 = (void *)MEMORY[0x1E0CB36B8];
      v11 = 2;
      goto LABEL_7;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB36B8];
  v11 = 0;
LABEL_7:
  objc_msgSend(v10, "indexSetWithIndexesInRange:", v11, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v15 = [NCBadgedIconView alloc];
  -[NCNotificationRequestContentProvider badgeText](self, "badgeText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NCBadgedIconView initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:](v15, "initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:", v9, v14, v16, v18);

  return v19;
}

- (id)badgeText
{
  void *v2;
  void *v3;
  void *v4;

  v2 = -[NCNotificationRequestContentProvider summarizedNotificationsCount](self, "summarizedNotificationsCount");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "sbf_cachedDecimalNumberFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromNumber:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_invalidateCachedData
{
  UIView *communicationAvatar;
  NCBadgedIconView *badgedIconView;

  communicationAvatar = self->_communicationAvatar;
  self->_communicationAvatar = 0;

  badgedIconView = self->_badgedIconView;
  self->_badgedIconView = 0;

}

- (NCNotificationStaticContentProvidingDelegate)delegate
{
  return (NCNotificationStaticContentProvidingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)overriddenActions
{
  return self->_overriddenActions;
}

- (void)setOverriddenActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)contentHidingEnforcement
{
  return self->_contentHidingEnforcement;
}

- (NCNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setPrimarySubtitleTextDisplayingRecipientsSummary:(BOOL)a3
{
  self->_primarySubtitleTextDisplayingRecipientsSummary = a3;
}

- (void)setPrimarySubtitleTextDisplayingRequestTitle:(BOOL)a3
{
  self->_primarySubtitleTextDisplayingRequestTitle = a3;
}

- (unint64_t)summarizedNotificationsCount
{
  return self->_summarizedNotificationsCount;
}

- (BOOL)summarizedNotificationsAllHaveMatchingPrimaryText
{
  return self->_summarizedNotificationsAllHaveMatchingPrimaryText;
}

- (void)setSummarizedNotificationsAllHaveMatchingPrimaryText:(BOOL)a3
{
  self->_summarizedNotificationsAllHaveMatchingPrimaryText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_communicationAvatar, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_overriddenActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_newAvatarView
{
  id WeakRetained;
  void *v4;
  NCAvatarView *v5;
  void *v6;
  NCAvatarView *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "contentProviderTraitCollection:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = [NCAvatarView alloc];
  -[NCNotificationRequestContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NCAvatarView initWithNotificationRequest:compatibleWithInitialTraitCollection:](v5, "initWithNotificationRequest:compatibleWithInitialTraitCollection:", v6, v4);

  return v7;
}

- (id)_criticalAlertIconAttributedStringWithImageConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_intelligentManagementIconAttributedStringWithImageConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("_gm"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_iconImageForNotificationAction:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelSectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_ERROR, "Failed to load bundle for '%@'.", (uint8_t *)&v6, 0xCu);

}

@end
