@implementation NCNotificationRequestCoalescingContentProvider

- (NCNotificationRequestCoalescingContentProvider)initWithNotificationRequest:(id)a3
{
  id v4;
  NCNotificationRequestCoalescingContentProvider *v5;
  uint64_t v6;
  NSMutableArray *coalescedNotificationRequests;
  uint64_t v8;
  NCNotificationSummaryBuilder *summaryBuilder;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  v5 = -[NCNotificationRequestContentProvider initWithNotificationRequest:](&v11, sel_initWithNotificationRequest_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    coalescedNotificationRequests = v5->_coalescedNotificationRequests;
    v5->_coalescedNotificationRequests = (NSMutableArray *)v6;

    if (v4)
      -[NSMutableArray addObject:](v5->_coalescedNotificationRequests, "addObject:", v4);
    v8 = objc_opt_new();
    summaryBuilder = v5->_summaryBuilder;
    v5->_summaryBuilder = (NCNotificationSummaryBuilder *)v8;

    -[NCNotificationRequestCoalescingContentProvider _updateSummaryText](v5, "_updateSummaryText");
  }

  return v5;
}

- (NCNotificationRequestCoalescingContentProvider)init
{
  -[NCNotificationRequestCoalescingContentProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  v4 = -[NCNotificationRequestContentProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSMutableArray copy](self->_coalescedNotificationRequests, "copy");
  v6 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v5;

  *((_BYTE *)v4 + 88) = self->_deviceAuthenticated;
  objc_storeStrong((id *)v4 + 13, self->_overridenSummaryBuilder);
  *((_BYTE *)v4 + 92) = self->_summarizationEnabled;
  return v4;
}

- (unint64_t)coalesceCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationRequestCoalescingContentProvider coalescedNotificationRequests](self, "coalescedNotificationRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)coalesceNotificationRequest:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_coalescedNotificationRequests, "removeObjectAtIndex:", v4);
  -[NSMutableArray _insertOrderedNotificationRequest:](self->_coalescedNotificationRequests, "_insertOrderedNotificationRequest:", v5);
  -[NCNotificationRequestCoalescingContentProvider _updateSummaryText](self, "_updateSummaryText");

}

- (void)removeCoalescedNotificationRequest:(id)a3
{
  unint64_t v4;

  v4 = -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_coalescedNotificationRequests, "removeObjectAtIndex:", v4);
    -[NCNotificationRequestCoalescingContentProvider _updateSummaryText](self, "_updateSummaryText");
  }
}

- (void)updateCoalescedNotificationRequest:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_coalescedNotificationRequests, "removeObjectAtIndex:", v4);
    -[NSMutableArray _insertOrderedNotificationRequest:](self->_coalescedNotificationRequests, "_insertOrderedNotificationRequest:", v5);
    -[NCNotificationRequestCoalescingContentProvider _updateSummaryText](self, "_updateSummaryText");
  }

}

- (id)notificationRequest
{
  return (id)-[NSMutableArray firstObject](self->_coalescedNotificationRequests, "firstObject");
}

- (BOOL)containsMatchingCoalescedNotificationRequest:(id)a3
{
  return -[NCNotificationRequestCoalescingContentProvider _indexOfMatchingNotificationRequest:](self, "_indexOfMatchingNotificationRequest:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)primaryText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent"))
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "options");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "suppressesTitleWhenLocked");

      if (v7)
      {
        -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "defaultHeader");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider primaryText](&v15, sel_primaryText);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v4;
LABEL_8:
  if (-[NCNotificationRequestCoalescingContentProvider showSummaryTextAsContent](self, "showSummaryTextAsContent"))
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "content");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultHeader");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  return v10;
}

- (id)primarySubtitleText
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (-[NCNotificationRequestContentProvider isPrimarySubtitleTextDisplayingRequestTitle](self, "isPrimarySubtitleTextDisplayingRequestTitle")|| -[NCNotificationRequestContentProvider isPrimarySubtitleTextDisplayingRecipientsSummary](self, "isPrimarySubtitleTextDisplayingRecipientsSummary"))
  {
    if (-[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent"))
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "options");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "suppressesTitleWhenLocked") ^ 1;

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "suppressesSubtitleWhenLocked"))
  {
    v8 = !-[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent");

    if (((v8 | v5) & 1) == 0)
    {
      v9 = 0;
      goto LABEL_12;
    }
  }
  else
  {

  }
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  -[NCNotificationRequestContentProvider primarySubtitleText](&v12, sel_primarySubtitleText);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_15:
    v9 = 0;
    return v9;
  }
  if (-[NCNotificationRequestCoalescingContentProvider showSummaryTextAsContent](self, "showSummaryTextAsContent"))
    goto LABEL_15;
  return v9;
}

- (id)secondaryText
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  if (-[NCNotificationRequestCoalescingContentProvider _shouldShowNotificationBody](self, "_shouldShowNotificationBody"))
  {
    v14.receiver = self;
    v14.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider secondaryText](&v14, sel_secondaryText);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NCNotificationRequestCoalescingContentProvider _placeholderSecondaryText](self, "_placeholderSecondaryText");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
  if (-[NCNotificationRequestCoalescingContentProvider showSummaryTextAsContent](self, "showSummaryTextAsContent"))
  {
    v8 = -[NCNotificationRequestCoalescingContentProvider _notificationCount](self, "_notificationCount");
    if (!v8)
      return v4;
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_STACK_APP_CONTENT_SUMMARY"), &stru_1E8D21F60, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v13);
    v4 = (void *)v13;
    goto LABEL_6;
  }
  if (-[NCNotificationRequestCoalescingContentProvider _shouldShowNotificationBody](self, "_shouldShowNotificationBody")&& -[NCNotificationRequestCoalescingContentProvider shouldShowThreadSummary](self, "shouldShowThreadSummary"))
  {
LABEL_5:
    v6 = 0;
LABEL_6:

    v4 = (void *)v6;
  }
  return v4;
}

- (id)contentSummaryText
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  if (!-[NCNotificationRequestCoalescingContentProvider _shouldShowNotificationBody](self, "_shouldShowNotificationBody")|| !-[NCNotificationRequestCoalescingContentProvider isSummarizationEnabled](self, "isSummarizationEnabled"))
  {
    goto LABEL_5;
  }
  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_5:
    v4 = 0;
    return v4;
  }
  if (-[NCNotificationRequestCoalescingContentProvider isDisplayingInStack](self, "isDisplayingInStack"))
  {
    if (!-[NCNotificationRequestCoalescingContentProvider shouldShowThreadSummary](self, "shouldShowThreadSummary"))
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isCommunicationType");

      if ((v8 & 1) != 0)
        goto LABEL_5;
    }
  }
  if (-[NCNotificationRequestCoalescingContentProvider shouldShowThreadSummary](self, "shouldShowThreadSummary"))
  {
    -[NCNotificationRequestCoalescingContentProvider threadContentSummaryText](self, "threadContentSummaryText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider contentSummaryText](&v9, sel_contentSummaryText);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)importantText
{
  objc_super v4;

  if (-[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  -[NCNotificationRequestContentProvider importantText](&v4, sel_importantText);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  id v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v6 = a3;
  if (-[NCNotificationRequestCoalescingContentProvider shouldShowThreadSummary](self, "shouldShowThreadSummary"))
  {
    v7 = -[NCNotificationRequestCoalescingContentProvider _isThreadContainsCriticalNotificationRequest](self, "_isThreadContainsCriticalNotificationRequest");
    v8 = -[NCNotificationRequestCoalescingContentProvider _isThreadContainsMaybeImportantNotificationRequest](self, "_isThreadContainsMaybeImportantNotificationRequest");
    if ((a4 & 1) != 0 && v7)
    {
      -[NCNotificationRequestContentProvider _criticalAlertIconAttributedStringWithImageConfiguration:](self, "_criticalAlertIconAttributedStringWithImageConfiguration:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      v11 = objc_alloc(MEMORY[0x1E0CB3498]);
      v12 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("CRITICAL_TEXT");
    }
    else
    {
      v16 = !v8;
      if ((a4 & 2) == 0)
        v16 = 1;
      if ((v16 & 1) != 0)
      {
        v10 = 0;
        goto LABEL_12;
      }
      -[NCNotificationRequestContentProvider _intelligentManagementIconAttributedStringWithImageConfiguration:](self, "_intelligentManagementIconAttributedStringWithImageConfiguration:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v17, "mutableCopy");

      v11 = objc_alloc(MEMORY[0x1E0CB3498]);
      v12 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("INTELLIGENCE_MAYBE_IMPORTANT");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E8D21F60, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedUppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v11, "initWithString:", v20);
    objc_msgSend(v10, "appendAttributedString:", v21);

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider importantAttributedTextWithImageConfiguration:importantAdornmentEligibleOptions:](&v23, sel_importantAttributedTextWithImageConfiguration_importantAdornmentEligibleOptions_, v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v10;
}

- (BOOL)_isThreadContainsCriticalNotificationRequest
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NCNotificationRequestCoalescingContentProvider _activeSummaryBuilder](self, "_activeSummaryBuilder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "interruptionLevel") == 3)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_isThreadContainsMaybeImportantNotificationRequest
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NCNotificationRequestCoalescingContentProvider _activeSummaryBuilder](self, "_activeSummaryBuilder", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "alertOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "intelligentBehavior");

        if (v8 == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)date
{
  void *v3;
  void *v4;
  objc_super v6;

  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider date](&v6, sel_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)icons
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider icons](&v7, sel_icons);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)communicationAvatar
{
  void *v3;
  void *v4;
  objc_super v6;

  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider communicationAvatar](&v6, sel_communicationAvatar);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)footerText
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
  -[NCNotificationRequestContentProvider footerText](&v15, sel_footerText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqualToString:", &stru_1E8D21F60))
  {
    if (-[NCNotificationRequestCoalescingContentProvider showSummaryFooterText](self, "showSummaryFooterText"))
    {
      if (-[NCNotificationRequestCoalescingContentProvider _shouldShowNotificationBody](self, "_shouldShowNotificationBody"))
      {
        v5 = -[NCNotificationRequestCoalescingContentProvider _notificationCount](self, "_notificationCount");
        v6 = v5 - 1;
        if (v5 != 1
          && !-[NCNotificationRequestContentProvider summarizedNotificationsCount](self, "summarizedNotificationsCount"))
        {
          v7 = (void *)MEMORY[0x1E0CB37F0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedStringFromNumber:numberStyle:", v8, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = (void *)MEMORY[0x1E0CB3940];
          NCUserNotificationsUIKitFrameworkBundle();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_STACK_APP_FOOTER_SUMMARY"), &stru_1E8D21F60, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", v12, v9);
          v13 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v13;
        }
      }
    }
  }
  return v4;
}

- (id)inlineAction
{
  void *v3;
  objc_super v5;

  if (-[NCNotificationRequestCoalescingContentProvider _shouldShowNotificationBody](self, "_shouldShowNotificationBody"))
  {
    v5.receiver = self;
    v5.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider inlineAction](&v5, sel_inlineAction);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldShowNotificationBody
{
  void *v2;
  void *v3;
  int64_t v5;
  char v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v5 = -[NCNotificationRequestContentProvider contentHidingEnforcement](self, "contentHidingEnforcement");
  v6 = v5 == -1;
  if (!v5)
  {
    v7 = -[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent");
    if (v7)
    {
      -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "options");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "suppressesBodyWhenLocked") & 1) != 0)
      {
        v6 = 1;
LABEL_6:

        return v6 ^ 1;
      }
    }
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "coalescesWhenLocked");

    if (v7)
      goto LABEL_6;
  }
  return v6 ^ 1;
}

- (id)_placeholderSecondaryText
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v46;
  id v47;
  _QWORD v48[4];
  id v49;
  NCNotificationRequestCoalescingContentProvider *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NCNotificationRequestCoalescingContentProvider overridenSummaryBuilder](self, "overridenSummaryBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCNotificationRequestCoalescingContentProvider overridenSummaryBuilder](self, "overridenSummaryBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationRequests");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_coalescedNotificationRequests;
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v6;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hiddenPreviewsBodyPlaceholder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v13, "length"))
        {
          NCUserNotificationsUIKitFrameworkBundle();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER"), &stru_1E8D21F60, 0);
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v15;
        }
        objc_msgSend(v3, "objectForKey:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = (void *)MEMORY[0x1E0CB37E8];
        if (v16)
          v19 = objc_msgSend(v16, "integerValue") + 1;
        else
          v19 = 1;
        objc_msgSend(v18, "numberWithInteger:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v20, v13);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke;
  v48[3] = &unk_1E8D1E158;
  v22 = v3;
  v49 = v22;
  v50 = self;
  objc_msgSend(v21, "bs_map:", v48);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_48_0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "count");
  if (v25 == 2)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("COALESCED_NOTIFICATION_END_FORMAT"), &stru_1E8D21F60, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = v25;
    if (v25 == 1)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v25 < 3)
    {
      v27 = 0;
    }
    else
    {
      v46 = v25 - 1;
      v47 = v22;
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 2; j != v26; ++j)
      {
        v35 = v33;
        v36 = (void *)MEMORY[0x1E0CB3940];
        NCUserNotificationsUIKitFrameworkBundle();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("COALESCED_NOTIFICATION_MIDDLE_FORMAT"), &stru_1E8D21F60, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", j - 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", v38, v35, v39);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v40 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("COALESCED_NOTIFICATION_END_FORMAT"), &stru_1E8D21F60, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v46);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", v42, v33, v43);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v47;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "nc_safeAttributedStringWithString:", v27);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

id __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "_localizedStringWithPlaceholderFormat:count:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__NCNotificationRequestCoalescingContentProvider__placeholderSecondaryText__block_invoke_2(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

- (id)thumbnail
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[NCNotificationRequestCoalescingContentProvider isHidingContent](self, "isHidingContent"))
    return 0;
  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || -[NCNotificationRequestCoalescingContentProvider shouldShowThreadSummary](self, "shouldShowThreadSummary"))
  {
    v5 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider thumbnail](&v6, sel_thumbnail);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)shouldShowThreadSummary
{
  return -[NCNotificationRequestContentProvider summarizedNotificationsCount](self, "summarizedNotificationsCount") != 0;
}

- (id)badgedIconView
{
  void *v3;
  void *v4;
  objc_super v6;

  -[NCNotificationRequestCoalescingContentProvider collapsedSectionSummaryString](self, "collapsedSectionSummaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationRequestCoalescingContentProvider;
    -[NCNotificationRequestContentProvider badgedIconView](&v6, sel_badgedIconView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)isHidingContent
{
  int64_t v3;
  BOOL result;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[NCNotificationRequestContentProvider contentHidingEnforcement](self, "contentHidingEnforcement");
  result = v3 == -1;
  if (!v3)
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contentPreviewSetting");

    if (v7)
    {
      if (v7 == 1)
        return !-[NCNotificationRequestCoalescingContentProvider isDeviceAuthenticated](self, "isDeviceAuthenticated");
      else
        return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)_indexOfMatchingNotificationRequest:(id)a3
{
  id v4;
  NSMutableArray *coalescedNotificationRequests;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  coalescedNotificationRequests = self->_coalescedNotificationRequests;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__NCNotificationRequestCoalescingContentProvider__indexOfMatchingNotificationRequest___block_invoke;
  v9[3] = &unk_1E8D1C198;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](coalescedNotificationRequests, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __86__NCNotificationRequestCoalescingContentProvider__indexOfMatchingNotificationRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

- (void)_updateSummaryText
{
  -[NCNotificationSummaryBuilder updateWithNotificationRequests:](self->_summaryBuilder, "updateWithNotificationRequests:", self->_coalescedNotificationRequests);
}

- (id)_activeSummaryBuilder
{
  NCNotificationSummaryBuilder *overridenSummaryBuilder;

  overridenSummaryBuilder = self->_overridenSummaryBuilder;
  if (!overridenSummaryBuilder)
    overridenSummaryBuilder = self->_summaryBuilder;
  return overridenSummaryBuilder;
}

- (unint64_t)_notificationCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NCNotificationRequestCoalescingContentProvider _activeSummaryBuilder](self, "_activeSummaryBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_localizedStringWithPlaceholderFormat:(id)a3 count:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a3, CFSTR("%u"), &v14, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v7)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationRequestCoalescingContentProvider _localizedStringWithPlaceholderFormat:count:].cold.1(v8, self);
    v9 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER"), &stru_1E8D21F60, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, a4, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }

  return v6;
}

- (NSMutableArray)coalescedNotificationRequests
{
  return self->_coalescedNotificationRequests;
}

- (void)setCoalescedNotificationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedNotificationRequests, a3);
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  self->_deviceAuthenticated = a3;
}

- (NCNotificationSummaryBuilder)overridenSummaryBuilder
{
  return self->_overridenSummaryBuilder;
}

- (void)setOverridenSummaryBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_overridenSummaryBuilder, a3);
}

- (NSString)collapsedSectionSummaryString
{
  return self->_collapsedSectionSummaryString;
}

- (void)setCollapsedSectionSummaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)showSummaryFooterText
{
  return self->_showSummaryFooterText;
}

- (void)setShowSummaryFooterText:(BOOL)a3
{
  self->_showSummaryFooterText = a3;
}

- (BOOL)showSummaryTextAsContent
{
  return self->_showSummaryTextAsContent;
}

- (void)setShowSummaryTextAsContent:(BOOL)a3
{
  self->_showSummaryTextAsContent = a3;
}

- (NSAttributedString)threadContentSummaryText
{
  return self->_threadContentSummaryText;
}

- (void)setThreadContentSummaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isDisplayingInStack
{
  return self->_displayingInStack;
}

- (void)setDisplayingInStack:(BOOL)a3
{
  self->_displayingInStack = a3;
}

- (BOOL)isSummarizationEnabled
{
  return self->_summarizationEnabled;
}

- (void)setSummarizationEnabled:(BOOL)a3
{
  self->_summarizationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadContentSummaryText, 0);
  objc_storeStrong((id *)&self->_collapsedSectionSummaryString, 0);
  objc_storeStrong((id *)&self->_overridenSummaryBuilder, 0);
  objc_storeStrong((id *)&self->_coalescedNotificationRequests, 0);
  objc_storeStrong((id *)&self->_summaryBuilder, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
}

- (void)_localizedStringWithPlaceholderFormat:(void *)a1 count:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "un_logDigest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "notificationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_ERROR, "Error formatting hidden preview placeholder. Notification: %{public}@, Category: %{public}@.", (uint8_t *)&v9, 0x16u);

}

@end
