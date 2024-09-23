@implementation NCNotificationMissedSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationMissedSummaryOrderProvider;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](&v4, sel_setDeviceAuthenticated_, a3);
  -[NCNotificationMissedSummaryOrderProvider _updateSummaryPlatterView](self, "_updateSummaryPlatterView");
}

- (id)atxUUID
{
  void *v2;
  void *v3;

  -[NCNotificationMissedSummaryOrderProvider missedNotificationRanking](self, "missedNotificationRanking");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)atxLogSummaryPlatterShownIsUpcoming:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationMissedSummaryOrderProvider missedNotificationRanking](self, "missedNotificationRanking");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logCollapsedViewWithIsUpcoming:", v3);

}

- (void)atxLogSummaryPlatterExpandedIsUpcoming:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationMissedSummaryOrderProvider missedNotificationRanking](self, "missedNotificationRanking");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logExpandedViewWithIsUpcoming:", v3);

}

- (void)atxLogRemoval
{
  id v2;

  -[NCNotificationMissedSummaryOrderProvider missedNotificationRanking](self, "missedNotificationRanking");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logRemoval");

}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NCNotificationSummaryPlatterView adjustForContentSizeCategoryChange](self->_summaryPlatterView, "adjustForContentSizeCategoryChange");
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  NCNotificationSummaryPlatterView *summaryPlatterView;
  NCNotificationSummaryPlatterView *v4;
  NCNotificationSummaryPlatterView *v5;
  NCNotificationSummaryPlatterView *v6;
  void *v7;
  NCNotificationSummaryPlatterView *v8;
  void *v9;

  summaryPlatterView = self->_summaryPlatterView;
  if (!summaryPlatterView)
  {
    v4 = objc_alloc_init(NCNotificationSummaryPlatterView);
    v5 = self->_summaryPlatterView;
    self->_summaryPlatterView = v4;

    -[NCNotificationSummaryPlatterView setFrame:](self->_summaryPlatterView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_summaryPlatterView;
    -[NCNotificationSummaryOrderProvider materialGroupNameBase](self, "materialGroupNameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v7);

    v8 = self->_summaryPlatterView;
    -[NCNotificationSummaryOrderProvider summaryPlatterViewTapGestureRecognizer](self, "summaryPlatterViewTapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryPlatterView addGestureRecognizer:](v8, "addGestureRecognizer:", v9);

    -[NCNotificationMissedSummaryOrderProvider _updateSummaryPlatterView](self, "_updateSummaryPlatterView");
    summaryPlatterView = self->_summaryPlatterView;
  }
  return summaryPlatterView;
}

- (void)generateDigestForATXUserNotificationArrays:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "Generating new missed notification ranking for \"%{public}@\", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "atxDigestGeneratorClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke;
  v13[3] = &unk_1E8D1CD58;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "generateMissedNotificationRankingForNotificationArrays:modeUUID:reply:", v6, 0, v13);

}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(a1, v8);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E8D1CC28;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setMissedNotificationRanking:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "rankedGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)_updateSummaryPlatterView
{
  id v3;

  -[NCNotificationMissedSummaryOrderProvider _updateSummaryContentProvider](self, "_updateSummaryContentProvider");
  -[NCNotificationSummaryOrderProvider configureSummaryContentDisplaying:withSummaryContentProviding:](self, "configureSummaryContentDisplaying:withSummaryContentProviding:", self->_summaryPlatterView, self->_summaryContentProvider);
  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:", self);

}

- (void)_updateSummaryContentProvider
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NCNotificationSummaryContentProvider *v9;
  NCNotificationSummaryContentProvider *summaryContentProvider;
  NCNotificationSummaryContentProvider *v11;
  void *v12;
  NCNotificationSummaryContentProvider *v13;
  void *v14;
  void *v15;
  id v16;

  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationMissedSummaryOrderProvider missedNotificationRanking](self, "missedNotificationRanking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rankedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationSummaryOrderProvider orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:](self, "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v16, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[NCNotificationSummaryOrderProvider titlesForSectionListsInSummary](self, "titlesForSectionListsInSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v7, "count"))
  {
    -[NCNotificationSummaryOrderProvider representativeNotificationRequestsForNotificationGroupLists:](self, "representativeNotificationRequestsForNotificationGroupLists:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCNotificationSummaryContentProvider summaryContentProviderOfType:notificationRequests:](NCNotificationSummaryContentProvider, "summaryContentProviderOfType:notificationRequests:", 2, v8);
    v9 = (NCNotificationSummaryContentProvider *)objc_claimAutoreleasedReturnValue();
    summaryContentProvider = self->_summaryContentProvider;
    self->_summaryContentProvider = v9;

    -[NCNotificationSummaryContentProvider setDeviceAuthenticated:](self->_summaryContentProvider, "setDeviceAuthenticated:", -[NCNotificationSummaryOrderProvider isDeviceAuthenticated](self, "isDeviceAuthenticated"));
    v11 = self->_summaryContentProvider;
    -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryContentProvider setSummaryTitle:](v11, "setSummaryTitle:", v12);

    v13 = self->_summaryContentProvider;
    -[NCNotificationSummaryOrderProvider dndMode](self, "dndMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "symbolImageName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryContentProvider setSummaryIconSymbolName:](v13, "setSummaryIconSymbolName:", v15);

    -[NCNotificationSummaryContentProvider setTitlesForSectionListsInSummary:](self->_summaryContentProvider, "setTitlesForSectionListsInSummary:", v7);
  }
  else
  {
    v8 = self->_summaryContentProvider;
    self->_summaryContentProvider = 0;
  }

}

- (NCNotificationSummaryPlatterView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryPlatterView, a3);
}

- (NCNotificationSummaryContentProvider)summaryContentProvider
{
  return self->_summaryContentProvider;
}

- (void)setSummaryContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_summaryContentProvider, a3);
}

- (ATXMissedNotificationRanking)missedNotificationRanking
{
  return self->_missedNotificationRanking;
}

- (void)setMissedNotificationRanking:(id)a3
{
  objc_storeStrong((id *)&self->_missedNotificationRanking, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missedNotificationRanking, 0);
  objc_storeStrong((id *)&self->_summaryContentProvider, 0);
  objc_storeStrong((id *)&self->_summaryPlatterView, 0);
}

void __107__NCNotificationMissedSummaryOrderProvider_generateDigestForATXUserNotificationArrays_withCompletionBlock___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1, a2);
  objc_msgSend(v2, "summaryHeading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v5, v6, "Error creating missed notification ranking for \"%{public}@\"! [error=%@]", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_0();
}

@end
