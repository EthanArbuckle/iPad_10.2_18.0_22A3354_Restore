@implementation NCNotificationSummaryContentProvider

+ (id)summaryContentProviderOfType:(unint64_t)a3 notificationRequests:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (a3 > 3)
    v6 = 0;
  else
    v6 = objc_alloc_init(*off_1E8D1EB30[a3]);
  objc_msgSend(v6, "setNotificationRequests:", v5);

  return v6;
}

- (void)setNotificationRequests:(id)a3
{
  NSArray *v5;
  NSString *summaryTitle;
  NSString *summary;
  NSArray *summaryIconViews;
  NSDate *summaryDate;
  NSString *summaryTitleFontName;
  NSArray *v11;

  v5 = (NSArray *)a3;
  if (self->_notificationRequests != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_notificationRequests, a3);
    summaryTitle = self->_summaryTitle;
    self->_summaryTitle = 0;

    summary = self->_summary;
    self->_summary = 0;

    summaryIconViews = self->_summaryIconViews;
    self->_summaryIconViews = 0;

    summaryDate = self->_summaryDate;
    self->_summaryDate = 0;

    summaryTitleFontName = self->_summaryTitleFontName;
    self->_summaryTitleFontName = 0;

    v5 = v11;
  }

}

- (void)setTitlesForSectionListsInSummary:(id)a3
{
  NSArray *v4;
  NSArray *titlesForSectionListsInSummary;
  NSString *summary;
  id v7;

  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_titlesForSectionListsInSummary, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    titlesForSectionListsInSummary = self->_titlesForSectionListsInSummary;
    self->_titlesForSectionListsInSummary = v4;

    summary = self->_summary;
    self->_summary = 0;

  }
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  NSString *summary;

  if (self->_deviceAuthenticated != a3)
  {
    self->_deviceAuthenticated = a3;
    summary = self->_summary;
    self->_summary = 0;

  }
}

- (NSString)summary
{
  NSString **p_summary;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *notificationRequests;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  __CFString *v32;
  _QWORD v33[5];
  id v34;

  p_summary = &self->_summary;
  if (!self->_summary
    && (-[NSArray count](self->_notificationRequests, "count")
     || -[NSArray count](self->_titlesForSectionListsInSummary, "count")))
  {
    v4 = -[NCNotificationSummaryContentProvider maxNumberOfSummaryItems](self, "maxNumberOfSummaryItems");
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)-[NSArray copy](self->_titlesForSectionListsInSummary, "copy");
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
      objc_msgSend(v5, "addObjectsFromArray:", v7);
    v8 = MEMORY[0x1E0C809B0];
    notificationRequests = self->_notificationRequests;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__NCNotificationSummaryContentProvider_summary__block_invoke;
    v33[3] = &unk_1E8D1C600;
    v33[4] = self;
    v10 = v5;
    v34 = v10;
    -[NSArray enumerateObjectsUsingBlock:](notificationRequests, "enumerateObjectsUsingBlock:", v33);
    v11 = objc_msgSend(v10, "count");
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__13;
    v31 = __Block_byref_object_dispose__13;
    v32 = &stru_1E8D21F60;
    v12 = v11 - v4;
    if (v11 <= v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v28[5];
      v28[5] = v13;

    }
    else
    {
      v26[0] = v8;
      v26[1] = 3221225472;
      v26[2] = __47__NCNotificationSummaryContentProvider_summary__block_invoke_6;
      v26[3] = &unk_1E8D1EA88;
      v26[4] = &v27;
      v26[5] = v11;
      v26[6] = v4;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v26);
    }
    if (v12 >= 1)
    {
      v15 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)v28[5];
      v19 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_COUNT"), &stru_1E8D21F60, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v21, v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" %@"), v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v28[5];
      v28[5] = v23;

    }
    objc_storeStrong((id *)p_summary, (id)v28[5]);
    _Block_object_dispose(&v27, 8);

  }
  return *p_summary;
}

void __47__NCNotificationSummaryContentProvider_summary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_summaryStringForNotificationRequest:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v3 = v5;
    }
  }

}

void __47__NCNotificationSummaryContentProvider_summary__block_invoke_6(_QWORD *a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v4;
  void *v5;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "stringByAppendingString:", a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = a1[5];
  if (v12 - 1 <= a3)
  {
    v14 = a3 + 1;
  }
  else
  {
    v13 = a1[6];
    v14 = a3 + 1;
    if (v13 > a3 && v14 != v13)
    {
      v16 = v12 - 2;
      v17 = *(_QWORD *)(a1[4] + 8);
      v18 = *(void **)(v17 + 40);
      if (v16 == a3)
      {
        objc_msgSend(*(id *)(v17 + 40), "stringByAppendingString:", CFSTR(" "));
      }
      else
      {
        NCUserNotificationsUIKitFrameworkBundle();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_CONNECTOR_COMMA"), &stru_1E8D21F60, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingString:", v5);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), v19);

      if (v16 != a3)
      {

      }
    }
  }
  if (v14 == a1[6])
    *a4 = 1;
}

- (NSArray)summaryIconViews
{
  unint64_t v4;
  id v5;
  id v6;
  NSArray *notificationRequests;
  NSArray *v8;
  id v9;
  NSArray *summaryIconViews;
  NSArray *v11;
  _QWORD v12[4];
  NSArray *v13;
  id v14;
  NCNotificationSummaryContentProvider *v15;
  unint64_t v16;

  if (!self->_summaryIconViews
    && -[NSArray count](self->_notificationRequests, "count")
    && !-[NCNotificationSummaryContentProvider hideSummaryIconViews](self, "hideSummaryIconViews"))
  {
    v4 = -[NCNotificationSummaryContentProvider maxNumberOfSummaryItems](self, "maxNumberOfSummaryItems");
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    notificationRequests = self->_notificationRequests;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__NCNotificationSummaryContentProvider_summaryIconViews__block_invoke;
    v12[3] = &unk_1E8D1EAB0;
    v8 = (NSArray *)v5;
    v13 = v8;
    v14 = v6;
    v15 = self;
    v16 = v4;
    v9 = v6;
    -[NSArray enumerateObjectsUsingBlock:](notificationRequests, "enumerateObjectsUsingBlock:", v12);
    summaryIconViews = self->_summaryIconViews;
    self->_summaryIconViews = v8;
    v11 = v8;

  }
  return self->_summaryIconViews;
}

void __56__NCNotificationSummaryContentProvider_summaryIconViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 56))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "threadIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 40);
    objc_msgSend(v16, "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "containsObject:", v11) & 1) == 0)
    {
      v12 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9);

      if ((v12 & 1) != 0)
        goto LABEL_6;
      objc_msgSend(*(id *)(a1 + 48), "_summaryIconViewForNotificationRequest:", v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v14 = *(void **)(a1 + 40);
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "addObject:", v9);
        }
        else
        {
          objc_msgSend(v16, "sectionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

        }
      }
    }

LABEL_6:
    goto LABEL_7;
  }
  *a4 = 1;
LABEL_7:

}

- (BOOL)_shouldShowContentForNotificationRequest:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentPreviewSetting");

  if (!v5)
    return 1;
  if (v5 == 1)
    return -[NCNotificationSummaryContentProvider isDeviceAuthenticated](self, "isDeviceAuthenticated");
  return 0;
}

- (id)_summaryStringForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NCNotificationSummaryContentProvider _shouldShowContentForNotificationRequest:](self, "_shouldShowContentForNotificationRequest:", v4)&& v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultHeader");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_summaryIconViewForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NCNotificationSummaryContentProvider _communicationAvatarForNotificationRequest:](self, "_communicationAvatarForNotificationRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NCNotificationSummaryContentProvider _iconViewForNotificationRequest:](self, "_iconViewForNotificationRequest:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_iconViewForNotificationRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NCBadgedIconView *v7;
  void *v8;
  void *v9;
  NCBadgedIconView *v10;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [NCBadgedIconView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NCBadgedIconView initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:](v7, "initWithProminentIcons:subordinateIcons:badgeText:compatibleWithInitialTraitCollection:", v6, 0, 0, v9);

  return v10;
}

- (id)_communicationAvatarForNotificationRequest:(id)a3
{
  id v3;
  NCAvatarView *v4;

  v3 = a3;
  if (+[NCAvatarView isAvatarPossibleWithNotificationRequest:](NCAvatarView, "isAvatarPossibleWithNotificationRequest:", v3))
  {
    v4 = -[NCAvatarView initWithNotificationRequest:]([NCAvatarView alloc], "initWithNotificationRequest:", v3);
    -[NCAvatarView setMaterialBacked:](v4, "setMaterialBacked:", 1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_summaryStringForCommunicationNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[NCNotificationSummaryContentProvider _shouldShowContentForNotificationRequest:](self, "_shouldShowContentForNotificationRequest:", v4)&& (objc_msgSend(v4, "content"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isCommunicationType"), v5, v6))
  {
    objc_msgSend(v4, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "communicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "preferredSenderSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)maxNumberOfSummaryItems
{
  return 3;
}

- (BOOL)hideSummaryIconViews
{
  return 0;
}

- (NSString)summaryTitle
{
  return self->_summaryTitle;
}

- (void)setSummaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isIconViewLeading
{
  return self->_iconViewLeading;
}

- (NSString)summaryTitleFontName
{
  return self->_summaryTitleFontName;
}

- (void)setSummaryTitleFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)summaryDate
{
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)summaryIconSymbolName
{
  return self->_summaryIconSymbolName;
}

- (void)setSummaryIconSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isDeviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (NSArray)titlesForSectionListsInSummary
{
  return self->_titlesForSectionListsInSummary;
}

- (NSArray)notificationRequests
{
  return self->_notificationRequests;
}

- (void)setMaxNumberOfSummaryItems:(unint64_t)a3
{
  self->_maxNumberOfSummaryItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRequests, 0);
  objc_storeStrong((id *)&self->_titlesForSectionListsInSummary, 0);
  objc_storeStrong((id *)&self->_summaryIconSymbolName, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_storeStrong((id *)&self->_summaryTitleFontName, 0);
  objc_storeStrong((id *)&self->_summaryIconViews, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_summaryTitle, 0);
}

@end
