@implementation NCNotificationDigestDetailedSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationDigestDetailedSummaryOrderProvider;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](&v15, sel_setDeviceAuthenticated_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_featuredNotificationContentProviders;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setDeviceAuthenticated:", v3, (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  -[NCNotificationSummaryContentProvider setDeviceAuthenticated:](self->_communicationsSummaryContentProvider, "setDeviceAuthenticated:", v3);
  -[NCNotificationSummaryContentProvider setDeviceAuthenticated:](self->_appsSummaryContentProvider, "setDeviceAuthenticated:", v3);
  -[NCDigestSummaryPlatterView updateContent](self->_digestSummaryPlatterView, "updateContent");
  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:", self);

}

- (BOOL)adjustForContentSizeCategoryChange
{
  -[NCDigestSummaryPlatterView adjustForContentSizeCategoryChange](self->_digestSummaryPlatterView, "adjustForContentSizeCategoryChange");
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  NCDigestSummaryPlatterView *digestSummaryPlatterView;
  NCDigestSummaryPlatterView *v4;
  NCDigestSummaryPlatterView *v5;
  NCDigestSummaryPlatterView *v6;
  void *v7;
  NCDigestSummaryPlatterView *v8;
  void *v9;

  digestSummaryPlatterView = self->_digestSummaryPlatterView;
  if (!digestSummaryPlatterView)
  {
    v4 = objc_alloc_init(NCDigestSummaryPlatterView);
    v5 = self->_digestSummaryPlatterView;
    self->_digestSummaryPlatterView = v4;

    -[NCDigestSummaryPlatterView setFrame:](self->_digestSummaryPlatterView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_digestSummaryPlatterView;
    -[NCNotificationSummaryOrderProvider materialGroupNameBase](self, "materialGroupNameBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView setMaterialGroupNameBase:](v6, "setMaterialGroupNameBase:", v7);

    v8 = self->_digestSummaryPlatterView;
    -[NCNotificationSummaryOrderProvider summaryPlatterViewTapGestureRecognizer](self, "summaryPlatterViewTapGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView addGestureRecognizer:](v8, "addGestureRecognizer:", v9);

    -[NCDigestSummaryPlatterView setAlpha:](self->_digestSummaryPlatterView, "setAlpha:", 1.0);
    -[NCNotificationDigestDetailedSummaryOrderProvider _updateDigestSummaryPlatterView](self, "_updateDigestSummaryPlatterView");
    digestSummaryPlatterView = self->_digestSummaryPlatterView;
  }
  return digestSummaryPlatterView;
}

- (void)_updateDigestSummaryPlatterView
{
  id v3;
  _BOOL4 v4;
  NCDigestSummaryPlatterView *digestSummaryPlatterView;
  NCDigestSummaryPlatterView *v6;
  void *v7;
  void *v8;
  NCDigestSummaryPlatterView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NCDigestSummaryPlatterView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NCDigestSummaryPlatterView *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = -[NCNotificationDigestDetailedSummaryOrderProvider leadingSummaryPlatterViewConfigureIfNecessary](self, "leadingSummaryPlatterViewConfigureIfNecessary");
  v4 = -[NCNotificationSummaryOrderProvider isOnboardingSummary](self, "isOnboardingSummary");
  digestSummaryPlatterView = self->_digestSummaryPlatterView;
  if (v4)
  {
    -[NCDigestSummaryPlatterView setDate:](self->_digestSummaryPlatterView, "setDate:", 0);
    v6 = self->_digestSummaryPlatterView;
    NCUserNotificationsUIKitFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_TITLE"), &stru_1E8D21F60, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView setHeading:](v6, "setHeading:", v8);

    v9 = self->_digestSummaryPlatterView;
    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_MESSAGE"), &stru_1E8D21F60, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView setSubheading:](v9, "setSubheading:", v11);

  }
  else
  {
    -[NCNotificationSummaryOrderProvider summaryDate](self, "summaryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NCDigestSummaryPlatterView setDate:](digestSummaryPlatterView, "setDate:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCDigestSummaryPlatterView setDate:](digestSummaryPlatterView, "setDate:", v13);

    }
    v14 = self->_digestSummaryPlatterView;
    -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView setHeading:](v14, "setHeading:", v10);
  }

  -[NCNotificationDigestDetailedSummaryOrderProvider _atxHighlightedGroups](self, "_atxHighlightedGroups");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDigestDetailedSummaryOrderProvider _updateFeaturedNotificationContentProvidersWithHighlightedGroups:](self, "_updateFeaturedNotificationContentProvidersWithHighlightedGroups:", v25);
  -[NCNotificationDigestDetailedSummaryOrderProvider _updateCommunicationsSummaryContentProvider](self, "_updateCommunicationsSummaryContentProvider");
  v15 = (void *)MEMORY[0x1E0C99DE8];
  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rankedGroups");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "removeObjectsInArray:", v25);
  -[NCNotificationDigestDetailedSummaryOrderProvider _updateAppsSummaryContentProvidersWithRankedGroups:](self, "_updateAppsSummaryContentProvidersWithRankedGroups:", v18);
  if (-[NCNotificationSummaryOrderProvider isOnboardingSummary](self, "isOnboardingSummary"))
  {
    -[NCDigestSummaryPlatterView setCount:](self->_digestSummaryPlatterView, "setCount:", 0);
  }
  else if (-[NCNotificationDigestDetailedSummaryOrderProvider _shouldAllowTapOnLeadingSummaryPlatterView](self, "_shouldAllowTapOnLeadingSummaryPlatterView"))
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NCNotificationSummaryOrderProvider notificationCountForNotificationGroupLists:](self, "notificationCountForNotificationGroupLists:", v19);

    if (v20 >= 0x63)
      v21 = 99;
    else
      v21 = v20;
    -[NCDigestSummaryPlatterView setCount:](self->_digestSummaryPlatterView, "setCount:", v21);
    -[NCDigestSummaryPlatterView setClearControlView:](self->_digestSummaryPlatterView, "setClearControlView:", 0);
  }
  else
  {
    -[NCDigestSummaryPlatterView setCount:](self->_digestSummaryPlatterView, "setCount:", 0);
    v22 = self->_digestSummaryPlatterView;
    -[NCNotificationSummaryOrderProvider clearControlViewForLeadingSummaryPlatterView](self, "clearControlViewForLeadingSummaryPlatterView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCDigestSummaryPlatterView setClearControlView:](v22, "setClearControlView:", v23);

  }
  -[NCNotificationSummaryOrderProvider delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:", self);

  -[NCDigestSummaryPlatterView updateContent](self->_digestSummaryPlatterView, "updateContent");
}

- (id)_atxHighlightedGroups
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highlightedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOrderProvider filterPresentNotificationGroupsInDigestNotificationGroups:](self, "filterPresentNotificationGroupsInDigestNotificationGroups:", v4);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend((id)v37[5], "count") <= 2)
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    LODWORD(v6) = v6 > objc_msgSend((id)v37[5], "count");

    if ((_DWORD)v6)
    {
      v7 = (id)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend((id)v37[5], "count");
        -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 138543874;
        v43 = v23;
        v44 = 2048;
        v45 = v24;
        v46 = 2048;
        v47 = v26;
        _os_log_error_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_ERROR, "Notification digest for \"%{public}@\" returned %lu highlighted groups while total count is %lu", buf, 0x20u);

      }
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v9 = (void *)objc_msgSend(v8, "initWithArray:", v37[5]);
      -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rankedGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummaryOrderProvider filterPresentNotificationGroupsInDigestNotificationGroups:](self, "filterPresentNotificationGroupsInDigestNotificationGroups:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageGroups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummaryOrderProvider filterPresentNotificationGroupsInDigestNotificationGroups:](self, "filterPresentNotificationGroupsInDigestNotificationGroups:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "indexesOfObjectsPassingTest:", &__block_literal_global_228);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_2;
      v31[3] = &unk_1E8D1CCB8;
      v18 = v12;
      v32 = v18;
      v19 = v9;
      v33 = v19;
      v20 = v15;
      v34 = v20;
      v35 = &v36;
      objc_msgSend(v16, "enumerateIndexesUsingBlock:", v31);
      if ((unint64_t)objc_msgSend((id)v37[5], "count") <= 2)
      {
        v27[0] = v17;
        v27[1] = 3221225472;
        v27[2] = __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_3;
        v27[3] = &unk_1E8D1CCE0;
        v28 = v19;
        v29 = v20;
        v30 = &v36;
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v27);

      }
    }
  }
  v21 = (id)v37[5];
  _Block_object_dispose(&v36, 8);

  return v21;
}

uint64_t __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPreviewableAttachment");
}

void __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") == 3)
      *a3 = 1;
  }

}

void __73__NCNotificationDigestDetailedSummaryOrderProvider__atxHighlightedGroups__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") == 3)
    *a4 = 1;

}

- (void)_updateFeaturedNotificationContentProvidersWithHighlightedGroups:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSArray *featuredNotificationContentProviders;
  id v18;
  uint64_t v19;
  NCDigestFeaturedNotificationContentProvider *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  _QWORD v26[6];
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOrderProvider orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:](self, "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v4, v23, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 3)
      v9 = 3;
    else
      v9 = v8;
    objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "leadingNotificationRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke;
          v29[3] = &unk_1E8D1CD08;
          v18 = v15;
          v30 = v18;
          v19 = -[NSArray indexOfObjectPassingTest:](featuredNotificationContentProviders, "indexOfObjectPassingTest:", v29);
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = -[NCDigestFeaturedNotificationContentProvider initWithNotificationRequest:groupCount:]([NCDigestFeaturedNotificationContentProvider alloc], "initWithNotificationRequest:groupCount:", v18, objc_msgSend(v14, "notificationCount"));
            -[NCNotificationSummaryOrderProvider listComponentDelegate](self, "listComponentDelegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NCDigestFeaturedNotificationContentProvider setListComponentDelegate:](v20, "setListComponentDelegate:", v21);

            -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v20, "setDeviceAuthenticated:", -[NCNotificationSummaryOrderProvider isDeviceAuthenticated](self, "isDeviceAuthenticated"));
            objc_initWeak(&location, self);
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke_2;
            v26[3] = &unk_1E8D1CD30;
            objc_copyWeak(&v27, &location);
            v26[4] = self;
            v26[5] = v14;
            -[NCDigestFeaturedNotificationContentProvider setDefaultActionBlock:](v20, "setDefaultActionBlock:", v26);
            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
          }
          else
          {
            -[NSArray objectAtIndex:](self->_featuredNotificationContentProviders, "objectAtIndex:", v19);
            v20 = (NCDigestFeaturedNotificationContentProvider *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v18, "sectionIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCDigestFeaturedNotificationContentProvider setAppNotificationCount:](v20, "setAppNotificationCount:", -[NCNotificationDigestDetailedSummaryOrderProvider _totalNotificationCountForSectionIdentifier:](self, "_totalNotificationCountForSectionIdentifier:", v22));

          if (v20)
            objc_msgSend(v24, "addObject:", v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  if (!-[NSArray isEqualToArray:](self->_featuredNotificationContentProviders, "isEqualToArray:", v24))
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, v24);
    -[NCDigestSummaryPlatterView setFeaturedNotificationContentProviders:](self->_digestSummaryPlatterView, "setFeaturedNotificationContentProviders:", self->_featuredNotificationContentProviders);
  }
  -[NCDigestSummaryPlatterView setPresentFeaturedNotificationsInline:](self->_digestSummaryPlatterView, "setPresentFeaturedNotificationsInline:", -[NCNotificationDigestDetailedSummaryOrderProvider _presentFeaturedNotificationsInline](self, "_presentFeaturedNotificationsInline"));

}

uint64_t __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "matchesRequest:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __117__NCNotificationDigestDetailedSummaryOrderProvider__updateFeaturedNotificationContentProvidersWithHighlightedGroups___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "leadingNotificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSummaryOrderProvider:requestsPerformingDefaultActionForNotificationRequest:inGroupList:", v3, v4, *(_QWORD *)(a1 + 40));

}

- (unint64_t)_totalNotificationCountForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__NCNotificationDigestDetailedSummaryOrderProvider__totalNotificationCountForSectionIdentifier___block_invoke;
  v9[3] = &unk_1E8D1B790;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __96__NCNotificationDigestDetailedSummaryOrderProvider__totalNotificationCountForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v5, "notificationCount");

}

- (void)_updateAppsSummaryContentProvidersWithRankedGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NCNotificationSummaryContentProvider *v7;
  NCNotificationSummaryContentProvider *appsSummaryContentProvider;
  id v9;

  v4 = a3;
  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOrderProvider orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:](self, "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v5, v4, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[NCNotificationSummaryOrderProvider representativeNotificationRequestsForNotificationGroupLists:](self, "representativeNotificationRequestsForNotificationGroupLists:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCNotificationSummaryContentProvider summaryContentProviderOfType:notificationRequests:](NCNotificationSummaryContentProvider, "summaryContentProviderOfType:notificationRequests:", 0, v6);
    v7 = (NCNotificationSummaryContentProvider *)objc_claimAutoreleasedReturnValue();
    appsSummaryContentProvider = self->_appsSummaryContentProvider;
    self->_appsSummaryContentProvider = v7;

  }
  else
  {
    v6 = self->_appsSummaryContentProvider;
    self->_appsSummaryContentProvider = 0;
  }

  -[NCDigestSummaryPlatterView setAppsSummaryContentProvider:](self->_digestSummaryPlatterView, "setAppsSummaryContentProvider:", self->_appsSummaryContentProvider);
}

- (void)_updateCommunicationsSummaryContentProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NCNotificationSummaryContentProvider *v7;
  NCNotificationSummaryContentProvider *communicationsSummaryContentProvider;
  id v9;

  -[NCNotificationSummaryOrderProvider cachedOrderedNotificationGroupLists](self, "cachedOrderedNotificationGroupLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDigestSummaryOrderProvider userNotificationDigest](self, "userNotificationDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationSummaryOrderProvider orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:](self, "orderedNotificationGroupLists:forATXUserNotificationDigestNotificationGroup:orderGroupNotifications:", v3, v5, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[NCNotificationSummaryOrderProvider representativeNotificationRequestsForNotificationGroupLists:](self, "representativeNotificationRequestsForNotificationGroupLists:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NCNotificationSummaryContentProvider summaryContentProviderOfType:notificationRequests:](NCNotificationSummaryContentProvider, "summaryContentProviderOfType:notificationRequests:", 1, v6);
    v7 = (NCNotificationSummaryContentProvider *)objc_claimAutoreleasedReturnValue();
    communicationsSummaryContentProvider = self->_communicationsSummaryContentProvider;
    self->_communicationsSummaryContentProvider = v7;

  }
  else
  {
    v6 = self->_communicationsSummaryContentProvider;
    self->_communicationsSummaryContentProvider = 0;
  }

  -[NCDigestSummaryPlatterView setCommunicationsSummaryContentProvider:](self->_digestSummaryPlatterView, "setCommunicationsSummaryContentProvider:", self->_communicationsSummaryContentProvider);
}

- (BOOL)_shouldAllowTapOnLeadingSummaryPlatterView
{
  _BOOL4 v2;
  unint64_t v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_communicationsSummaryContentProvider)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v4 = -[NSArray count](self->_featuredNotificationContentProviders, "count");
    v2 = v4 > 2 || -[NCNotificationSummaryOrderProvider currentNotificationCount](self, "currentNotificationCount") > v4;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      if (v2)
        v6 = CFSTR("Allowing");
      else
        v6 = CFSTR("Not allowing");
      v7 = v5;
      -[NCNotificationSummaryOrderProvider summaryHeading](self, "summaryHeading");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = v4;
      v16 = 2048;
      v17 = -[NCNotificationSummaryOrderProvider currentNotificationCount](self, "currentNotificationCount");
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ tap on leading summary platter for \"%{public}@\" with featured notification count = %lu and total notification count = %lu", (uint8_t *)&v10, 0x2Au);

    }
  }
  return v2;
}

- (BOOL)_presentFeaturedNotificationsInline
{
  unint64_t v3;

  v3 = -[NSArray count](self->_featuredNotificationContentProviders, "count");
  if (v3 == 2)
    v3 = -[NCNotificationSummaryOrderProvider currentNotificationCount](self, "currentNotificationCount");
  return v3 < 3;
}

- (NCDigestSummaryPlatterView)digestSummaryPlatterView
{
  return self->_digestSummaryPlatterView;
}

- (void)setDigestSummaryPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_digestSummaryPlatterView, a3);
}

- (NCNotificationSummaryContentProvider)communicationsSummaryContentProvider
{
  return self->_communicationsSummaryContentProvider;
}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_communicationsSummaryContentProvider, a3);
}

- (NCNotificationSummaryContentProvider)appsSummaryContentProvider
{
  return self->_appsSummaryContentProvider;
}

- (void)setAppsSummaryContentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appsSummaryContentProvider, a3);
}

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
  objc_storeStrong((id *)&self->_appsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_communicationsSummaryContentProvider, 0);
  objc_storeStrong((id *)&self->_digestSummaryPlatterView, 0);
}

@end
