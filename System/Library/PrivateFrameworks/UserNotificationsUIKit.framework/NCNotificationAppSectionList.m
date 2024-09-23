@implementation NCNotificationAppSectionList

- (NCNotificationAppSectionList)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  NCNotificationAppSectionList *v4;
  NSMutableArray *v5;
  NSMutableArray *featuredGroupLists;
  NSMutableDictionary *v7;
  NSMutableDictionary *richContentProviders;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NCNotificationAppSectionList;
  v4 = -[NCNotificationStructuredSectionList initWithTitle:sectionType:](&v12, sel_initWithTitle_sectionType_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    featuredGroupLists = v4->_featuredGroupLists;
    v4->_featuredGroupLists = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    richContentProviders = v4->_richContentProviders;
    v4->_richContentProviders = v7;

    v4->_expanded = 0;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredContentSizeCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionList setPreferredContentSizeCategory:](v4, "setPreferredContentSizeCategory:", v10);

  }
  return v4;
}

- (NSArray)groupListsForSmartOrdering
{
  void *v3;
  void *v4;

  -[NCNotificationAppSectionList _mergeFeaturedGroupLists](self, "_mergeFeaturedGroupLists");
  -[NCNotificationAppSectionList setMerged:](self, "setMerged:", 1);
  -[NCNotificationStructuredSectionList notificationGroups](self, "notificationGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)setGroupListsForSmartOrdering:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2048;
      v17 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting group lists for smart ordering with count %lu", (uint8_t *)&v14, 0x16u);

    }
    -[NCNotificationAppSectionList _extractFeaturedNotificationRequestsFromGroupLists:](self, "_extractFeaturedNotificationRequestsFromGroupLists:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionList _updateFeaturedGroupListsForFeaturedNotificationRequests:](self, "_updateFeaturedGroupListsForFeaturedNotificationRequests:", v8);
    objc_msgSend(v4, "bs_filter:", &__block_literal_global_5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

    objc_msgSend(v12, "addObjectsFromArray:", v9);
    -[NCNotificationStructuredSectionList setNotificationGroups:](self, "setNotificationGroups:", v12);
    -[NCNotificationAppSectionList setMerged:](self, "setMerged:", 0);
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateData");

  }
}

BOOL __62__NCNotificationAppSectionList_setGroupListsForSmartOrdering___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notificationCount") != 0;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_expanded != a3)
  {
    v3 = a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v7;
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting expanded = %{BOOL}d", (uint8_t *)&v18, 0x12u);

    }
    self->_expanded = v3;
    if (v3)
    {
      -[NCNotificationStructuredSectionList listView](self, "listView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadFooterViewAnimated:", 1);

      v9 = -[NSMutableArray count](self->_featuredGroupLists, "count");
      -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
      {
        for (i = 0; i != v11; ++i)
        {
          -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndex:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "listView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setNeedsLayout");

          -[NCNotificationStructuredSectionList listView](self, "listView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "insertViewAtIndex:animated:", v9 + i, 1);

        }
      }
    }
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsLayout");

  }
}

- (void)unmergeNotificationGroupListsIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationAppSectionList isMerged](self, "isMerged"))
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ unmerging group lists", (uint8_t *)&v7, 0xCu);

    }
    -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionList setGroupListsForSmartOrdering:](self, "setGroupListsForSmartOrdering:", v6);

  }
}

- (void)insertNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  NCNotificationAppSectionList *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  -[NCNotificationAppSectionList _clearContentProviderForRequest:](self, "_clearContentProviderForRequest:", v4);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__NCNotificationAppSectionList_insertNotificationRequest___block_invoke;
  v8[3] = &unk_1E8D1CA00;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  if (!*((_BYTE *)v13 + 24))
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationAppSectionList;
    -[NCNotificationStructuredSectionList insertNotificationRequest:](&v7, sel_insertNotificationRequest_, v6);
  }
  -[NCNotificationAppSectionList _updateSummarizedFooterViewContent](self, "_updateSummarizedFooterViewContent");

  _Block_object_dispose(&v12, 8);
}

void __58__NCNotificationAppSectionList_insertNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "containsNotificationRequest:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting request %{public}@ in existing featured group list %{public}@", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(v6, "insertNotificationRequest:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  NCNotificationAppSectionList *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[NCNotificationAppSectionList _clearContentProviderForRequest:](self, "_clearContentProviderForRequest:", v4);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__NCNotificationAppSectionList_modifyNotificationRequest___block_invoke;
  v9[3] = &unk_1E8D1CA00;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  if (!*((_BYTE *)v14 + 24))
  {
    v8.receiver = self;
    v8.super_class = (Class)NCNotificationAppSectionList;
    -[NCNotificationStructuredSectionList modifyNotificationRequest:](&v8, sel_modifyNotificationRequest_, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList modifyNotificationRequest:](&v7, sel_modifyNotificationRequest_, v6);
  -[NCNotificationAppSectionList _updateSummarizedFooterViewContent](self, "_updateSummarizedFooterViewContent");

  _Block_object_dispose(&v13, 8);
}

void __58__NCNotificationAppSectionList_modifyNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "containsNotificationRequest:", *(_QWORD *)(a1 + 32)))
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "notificationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "un_logDigest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying request %{public}@ in existing featured group list %{public}@", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(v6, "modifyNotificationRequest:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke;
  v9[3] = &unk_1E8D1B718;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList removeNotificationRequest:](&v8, sel_removeNotificationRequest_, v6);
  -[NCNotificationAppSectionList _updateSummarizedFooterViewContent](self, "_updateSummarizedFooterViewContent");
  -[NCNotificationAppSectionList _clearContentProviderForRequest:](self, "_clearContentProviderForRequest:", v6);
  if (*((_BYTE *)v13 + 24))
  {
    -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_10);

  }
  _Block_object_dispose(&v12, 8);

}

uint64_t __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsNotificationRequest:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __58__NCNotificationAppSectionList_removeNotificationRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "leadingNotificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadNotificationRequest:", v3);

}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList setDeviceAuthenticated:](&v9, sel_setDeviceAuthenticated_);
  -[NCNotificationAppSectionList richContentProviders](self, "richContentProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__NCNotificationAppSectionList_setDeviceAuthenticated___block_invoke;
  v7[3] = &__block_descriptor_33_e57_v32__0__NCNotificationRequestRichContentProvider_8Q16_B24l;
  v8 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __55__NCNotificationAppSectionList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

- (void)clearAll
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList clearAll](&v4, sel_clearAll);
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationListBaseComponentDidRemoveAll:", self);

}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  v4 = a3;
  if (-[NCNotificationAppSectionList _showSummarizedFooterView](self, "_showSummarizedFooterView"))
  {
    v5 = (id)-[NSMutableArray count](self->_featuredGroupLists, "count");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NCNotificationAppSectionList;
    v5 = -[NCNotificationStructuredSectionList notificationListViewNumberOfItems:](&v8, sel_notificationListViewNumberOfItems_, v4);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (id)headerViewForNotificationList:(id)a3
{
  -[NCNotificationAppSectionList _configureHeaderViewIfNecessary](self, "_configureHeaderViewIfNecessary", a3);
  return self->_headerView;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  BOOL v6;
  double result;
  double v8;

  -[NCNotificationAppSectionList _configureHeaderViewIfNecessary](self, "_configureHeaderViewIfNecessary", a3);
  v6 = -[NCNotificationAppSectionList isCombinedAppSectionList](self, "isCombinedAppSectionList");
  result = 10.0;
  if (!v6)
  {
    -[NCNotificationAppSectionListHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", a4, 0.0);
    return v8;
  }
  return result;
}

- (id)footerViewForNotificationList:(id)a3
{
  NCNotificationAppSectionListSummarizedContentView *footerView;
  void *v5;

  if (-[NCNotificationAppSectionList _showSummarizedFooterView](self, "_showSummarizedFooterView", a3))
  {
    -[NCNotificationAppSectionList _configureFooterViewIfNecessary](self, "_configureFooterViewIfNecessary");
  }
  else
  {
    footerView = self->_footerView;
    if (footerView)
    {
      self->_footerView = 0;

      -[NCNotificationStructuredSectionList listView](self, "listView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadFooterViewAnimated:", 1);

    }
  }
  return self->_footerView;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  _BOOL4 v6;
  double result;
  double v8;

  -[NCNotificationAppSectionList _configureFooterViewIfNecessary](self, "_configureFooterViewIfNecessary", a3);
  v6 = -[NCNotificationAppSectionList _showSummarizedFooterView](self, "_showSummarizedFooterView");
  result = 0.0;
  if (v6)
  {
    -[NCNotificationAppSectionListSummarizedContentView sizeThatFits:](self->_footerView, "sizeThatFits:", a4, 0.0);
    return v8;
  }
  return result;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 1;
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 0;
}

- (BOOL)isAttachmentImageFeaturedForNotificationGroupList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6 != 0x7FFFFFFFFFFFFFFFLL
      && -[NCNotificationAppSectionList _isViewFeaturedAtIndex:](self, "_isViewFeaturedAtIndex:", v6);
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationAppSectionList;
  v4 = a3;
  -[NCNotificationStructuredSectionList notificationListBaseComponentDidRemoveAll:](&v6, sel_notificationListBaseComponentDidRemoveAll_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  -[NCNotificationAppSectionList _removeFeaturedGroupListIfNecessary:](self, "_removeFeaturedGroupListIfNecessary:", v5, v6.receiver, v6.super_class);

}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  v6 = a3;
  -[NCNotificationStructuredSectionList notificationListComponent:didRemoveNotificationRequest:](&v8, sel_notificationListComponent_didRemoveNotificationRequest_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  -[NCNotificationAppSectionList _removeFeaturedGroupListIfNecessary:](self, "_removeFeaturedGroupListIfNecessary:", v7, v8.receiver, v8.super_class);

}

- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4
{
  id v5;
  NCNotificationRequestRichContentProvider *v6;

  v5 = a4;
  -[NSMutableDictionary objectForKey:](self->_richContentProviders, "objectForKey:", v5);
  v6 = (NCNotificationRequestRichContentProvider *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:]([NCNotificationRequestRichContentProvider alloc], "initWithNotificationRequest:", v5);
    -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v6, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
    -[NCNotificationRequestRichContentProvider setIconVisible:](v6, "setIconVisible:", -[NCNotificationAppSectionList isCombinedAppSectionList](self, "isCombinedAppSectionList"));
    -[NSMutableDictionary bs_setSafeObject:forKey:](self->_richContentProviders, "bs_setSafeObject:forKey:", v6, v5);
  }

  return v6;
}

- (void)notificationListPresentableGroup:(id)a3 didReceivedHorizontalTranslation:(double)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[NCNotificationAppSectionList _shouldFeatureLeadingViews](self, "_shouldFeatureLeadingViews"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexOfObject:", v9);

      if (v7 == 1)
      {
        -[NCNotificationStructuredSectionList listView](self, "listView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFeaturedLeadingViewOcclusionTranslation:", a4);

      }
    }
  }

}

- (void)appSectionListHeaderView:(id)a3 didRequestPresentingOptionsMenuFromView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[NCNotificationStructuredSectionList allNotificationRequests](self, "allNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__NCNotificationAppSectionList_appSectionListHeaderView_didRequestPresentingOptionsMenuFromView___block_invoke;
  v10[3] = &unk_1E8D1CA68;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "notificationListComponent:requestsPresentingOptionsMenuForNotificationRequest:presentingViewProvider:optionsForSection:completion:", self, v7, v10, 1, 0);

}

uint64_t __97__NCNotificationAppSectionList_appSectionListHeaderView_didRequestPresentingOptionsMenuFromView___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, *(_QWORD *)(a1 + 32));
}

- (void)appSectionListSummarizedContentViewDidRecognizeTapGesture:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ is expanding on summarized view tap", (uint8_t *)&v11, 0xCu);

  }
  -[NCNotificationAppSectionList setExpanded:](self, "setExpanded:", 1);
  -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "listView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGrouped:", 0);

  }
}

- (id)backgroundGroupNameBaseForAppSectionListSummarizedContentView:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationStructuredSectionList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E8D5FD78;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider **p_strokeVisualStylingProvider;
  MTVisualStylingProvider *v8;

  v6 = (MTVisualStylingProvider *)a3;
  p_strokeVisualStylingProvider = &self->_strokeVisualStylingProvider;
  if (self->_strokeVisualStylingProvider != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](self->_headerView, "setVisualStylingProvider:forCategory:", *p_strokeVisualStylingProvider, 1);
    -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](self->_footerView, "setVisualStylingProvider:forCategory:", *p_strokeVisualStylingProvider, 1);
    v6 = v8;
  }

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  -[NCNotificationStructuredSectionList adjustForContentSizeCategoryChange](&v7, sel_adjustForContentSizeCategoryChange);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationAppSectionList setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);

  -[NCNotificationAppSectionListHeaderView adjustForContentSizeCategoryChange](self->_headerView, "adjustForContentSizeCategoryChange");
  -[NCNotificationListBaseContentView adjustForContentSizeCategoryChange](self->_footerView, "adjustForContentSizeCategoryChange");
  -[NCNotificationStructuredSectionList listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateData");

  return 1;
}

- (id)_notificationGroupsForInsertion
{
  if (-[NCNotificationAppSectionList isMerged](self, "isMerged"))
    -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  else
    -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_insertionIndexForGroup:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationAppSectionList;
  v4 = -[NCNotificationStructuredSectionList _insertionIndexForGroup:](&v8, sel__insertionIndexForGroup_, a3);
  v5 = (uint64_t)v4;
  if (!-[NCNotificationAppSectionList isMerged](self, "isMerged"))
  {
    -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count");

  }
  return (unint64_t)v4 + v5;
}

- (void)_configureSectionListView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionList;
  v3 = a3;
  -[NCNotificationStructuredSectionList _configureSectionListView:](&v4, sel__configureSectionListView_, v3);
  objc_msgSend(v3, "setHorizontalInsetMargin:", 6.0, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setNumberOfFeaturedLeadingViews:", 2);
  objc_msgSend(v3, "setFooterViewVerticalMargin:", 12.0);
  objc_msgSend(v3, "setGroupingAnimationStyle:", 1);
  objc_msgSend(v3, "setSupportsBottomViewsRollUnder:", 0);

}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationAppSectionList;
  v3 = -[NCNotificationStructuredSectionList _newGroupListForNotificationRequest:](&v7, sel__newGroupListForNotificationRequest_, a3);
  objc_msgSend(v3, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingContentShouldFillList:", 1);

  objc_msgSend(v3, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupportsBottomViewsRollUnder:", 0);

  return v3;
}

- (BOOL)_isViewFeaturedAtIndex:(unint64_t)a3
{
  return a3 <= 1 && -[NCNotificationAppSectionList _shouldFeatureLeadingViews](self, "_shouldFeatureLeadingViews");
}

- (BOOL)_showSummarizedFooterView
{
  BOOL v3;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  BOOL v10;

  if (-[NCNotificationAppSectionList isExpanded](self, "isExpanded")
    || -[NCNotificationAppSectionList isMerged](self, "isMerged")
    || -[NCNotificationAppSectionList isCombinedAppSectionList](self, "isCombinedAppSectionList"))
  {
    return 0;
  }
  -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "notificationCount");

  v10 = v6 == 1 && v8 > 1;
  v3 = v6 > 1 || v10;

  return v3;
}

- (BOOL)_shouldFeatureLeadingViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;

  -[NCNotificationAppSectionList preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {

LABEL_12:
    LOBYTE(v13) = 0;
    return v13;
  }
  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 2)
    goto LABEL_12;
  v6 = 0;
  v7 = 1;
  do
  {
    -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "leadingNotificationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attachmentImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = objc_msgSend(v12, "isSymbolImage") ^ 1;
    else
      LOBYTE(v13) = 0;
    if (objc_msgSend(v9, "notificationCount") != 1)
      LOBYTE(v13) = 0;

    v14 = v7 & v13;
    v6 = 1;
    v7 = 0;
  }
  while ((v14 & 1) != 0);
  return v13;
}

- (void)_clearContentProviderForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[NSMutableDictionary allKeys](self->_richContentProviders, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__NCNotificationAppSectionList__clearContentProviderForRequest___block_invoke;
  v10[3] = &unk_1E8D1C198;
  v9 = v4;
  v11 = v9;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_richContentProviders, "removeObjectForKey:", v8);

  }
}

uint64_t __64__NCNotificationAppSectionList__clearContentProviderForRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_configureHeaderViewIfNecessary
{
  NCNotificationAppSectionListHeaderView *v3;
  NCNotificationAppSectionListHeaderView *headerView;
  NCNotificationAppSectionListHeaderView *v5;
  void *v6;
  NCNotificationAppSectionListHeaderView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_headerView && !-[NCNotificationAppSectionList isCombinedAppSectionList](self, "isCombinedAppSectionList"))
  {
    v3 = objc_alloc_init(NCNotificationAppSectionListHeaderView);
    headerView = self->_headerView;
    self->_headerView = v3;

    -[NCNotificationAppSectionListHeaderView setDelegate:](self->_headerView, "setDelegate:", self);
    v5 = self->_headerView;
    -[NCNotificationStructuredSectionList title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListHeaderView setTitle:](v5, "setTitle:", v6);

    v7 = self->_headerView;
    -[NCNotificationStructuredSectionList allNotificationRequests](self, "allNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListHeaderView setIcons:](v7, "setIcons:", v11);

    -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](self->_headerView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, 1);
  }
}

- (void)_configureFooterViewIfNecessary
{
  NCNotificationAppSectionListSummarizedContentView *v3;
  NCNotificationAppSectionListSummarizedContentView *footerView;

  if (-[NCNotificationAppSectionList _showSummarizedFooterView](self, "_showSummarizedFooterView"))
  {
    if (!self->_footerView)
    {
      v3 = objc_alloc_init(NCNotificationAppSectionListSummarizedContentView);
      footerView = self->_footerView;
      self->_footerView = v3;

      -[NCNotificationAppSectionListSummarizedContentView setDelegate:](self->_footerView, "setDelegate:", self);
      -[NCNotificationListBaseContentView setVisualStylingProvider:forCategory:](self->_footerView, "setVisualStylingProvider:forCategory:", self->_strokeVisualStylingProvider, 1);
      -[NCNotificationAppSectionList _updateSummarizedFooterViewContent](self, "_updateSummarizedFooterViewContent");
    }
  }
}

- (void)_removeFeaturedGroupListIfNecessary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v14;
    if (!v6)
    {
      -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v14);

      if (v8)
      {
        -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObject:", v14);

      }
      -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      v5 = v14;
      if (v11)
      {
        -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_37);

        -[NCNotificationStructuredSectionList listView](self, "listView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNeedsLayout");

        v5 = v14;
      }
    }
  }

}

void __68__NCNotificationAppSectionList__removeFeaturedGroupListIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "leadingNotificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadNotificationRequest:", v3);

}

- (id)_extractFeaturedNotificationRequestsFromGroupLists:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NCNotificationAppSectionList *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NCNotificationAppSectionList *v18;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "allNotificationRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke;
    v15[3] = &unk_1E8D1C968;
    v16 = v6;
    v17 = v7;
    v18 = self;
    v10 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke_2;
    v12[3] = &unk_1E8D1C678;
    v13 = v6;
    v14 = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

    v9 = v13;
  }

  return v6;
}

void __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  id v7;

  if (a3 > 1)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), "removeNotificationRequest:", v6);
    objc_msgSend(*(id *)(a1 + 48), "notificationListCache");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearCacheForNotificationRequest:", v6);

  }
}

void __83__NCNotificationAppSectionList__extractFeaturedNotificationRequestsFromGroupLists___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = v7;
  if (a3 <= 1 && (v12 = v7, v9 = objc_msgSend(v7, "notificationCount"), v8 = v12, v9))
  {
    objc_msgSend(v12, "leadingNotificationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    objc_msgSend(v12, "removeNotificationRequest:", v10);
    objc_msgSend(*(id *)(a1 + 40), "notificationListCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clearCacheForNotificationRequest:", v10);

    v8 = v12;
  }
  else
  {
    *a4 = 1;
  }

}

- (void)_updateFeaturedGroupListsForFeaturedNotificationRequests:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NCNotificationAppSectionList *v13;
  _QWORD v14[5];
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke;
  v14[3] = &unk_1E8D1C600;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_3;
  v11[3] = &unk_1E8D1C678;
  v12 = v8;
  v13 = self;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  -[NCNotificationAppSectionList setFeaturedGroupLists:](self, "setFeaturedGroupLists:", v10);
}

void __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "featuredGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_2;
  v10[3] = &unk_1E8D1C650;
  v11 = v3;
  v9 = v3;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v10);

  v6 = *(void **)(a1 + 32);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(v6, "_newGroupListForNotificationRequest:", v9);
    objc_msgSend(v7, "insertNotificationRequest:", v9);
  }
  else
  {
    objc_msgSend(v6, "featuredGroupLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

BOOL __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "leadingNotificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __89__NCNotificationAppSectionList__updateFeaturedGroupListsForFeaturedNotificationRequests___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "notificationListCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingNotificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearCacheForNotificationRequest:", v4);

    objc_msgSend(v6, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recycleVisibleViews");

  }
}

- (void)_mergeFeaturedGroupLists
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *featuredGroupLists;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationStructuredSectionList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ merging featured group lists", buf, 0xCu);

    }
    -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    featuredGroupLists = self->_featuredGroupLists;
    self->_featuredGroupLists = v10;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke;
    v12[3] = &unk_1E8D1C3A0;
    v12[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
}

void __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_removeNotificationGroupList:animated:", v4, 0);
  objc_msgSend(*(id *)(a1 + 32), "notificationListCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingNotificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCacheForNotificationRequest:", v6);

  objc_msgSend(v4, "allNotificationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke_2;
  v8[3] = &unk_1E8D1B4B0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __56__NCNotificationAppSectionList__mergeFeaturedGroupLists__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertNotificationRequest:", a2);
}

- (id)_nonFeaturedGroupLists
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NCNotificationStructuredSectionList allNotificationGroups](self, "allNotificationGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[NCNotificationAppSectionList featuredGroupLists](self, "featuredGroupLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v6);

  return v5;
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
    return -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated");
  return 0;
}

- (void)_updateSummarizedFooterViewContent
{
  NCNotificationAppSectionListSummarizedContentView *footerView;
  NCNotificationAppSectionListSummarizedContentView *v4;
  void *v5;
  void *v6;
  NCNotificationAppSectionListSummarizedContentView *v7;
  void *v8;
  NCNotificationAppSectionListSummarizedContentView *v9;
  void *v10;
  id v11;

  footerView = self->_footerView;
  if (footerView)
  {
    -[NCNotificationAppSectionListSummarizedContentView setCount:](footerView, "setCount:", -[NCNotificationAppSectionList _summarizedCount](self, "_summarizedCount"));
    v4 = self->_footerView;
    NCUserNotificationsUIKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_APP_TITLE"), &stru_1E8D21F60, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListSummarizedContentView setTitle:](v4, "setTitle:", v6);

    v7 = self->_footerView;
    -[NCNotificationAppSectionList _summarizedContentStrings](self, "_summarizedContentStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListSummarizedContentView setTitleAndContentStrings:](v7, "setTitleAndContentStrings:", v8);

    v9 = self->_footerView;
    -[NCNotificationAppSectionList _summarizedAttachmentImageViews](self, "_summarizedAttachmentImageViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationAppSectionListSummarizedContentView setAttachmentImageViews:](v9, "setAttachmentImageViews:", v10);

    -[NCNotificationStructuredSectionList listView](self, "listView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

  }
}

- (unint64_t)_summarizedCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__NCNotificationAppSectionList__summarizedCount__block_invoke;
  v5[3] = &unk_1E8D1C728;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NCNotificationAppSectionList__summarizedCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "notificationCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)_summarizedStringsForNotificationRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NCNotificationAppSectionList _shouldShowContentForNotificationRequest:](self, "_shouldShowContentForNotificationRequest:", v4);
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultHeader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    NCUserNotificationsUIKitFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_APP_SECTION_TITLE_FORMAT"), &stru_1E8D21F60, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v8);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_6:
      objc_msgSend(v7, "message");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (__CFString *)objc_msgSend(v14, "copy");
      goto LABEL_12;
    }
  }
  else
  {
    v13 = &stru_1E8D21F60;
    if (v5)
      goto LABEL_6;
  }
  objc_msgSend(v4, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hiddenPreviewsBodyPlaceholder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[NCNotificationAppSectionList _localizedDefaultHiddenPreviewsBodyPlaceholder](self, "_localizedDefaultHiddenPreviewsBodyPlaceholder");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v18;

LABEL_12:
  if (v15)
    v19 = v15;
  else
    v19 = &stru_1E8D21F60;
  v24[0] = v13;
  v24[1] = v19;
  v20 = (void *)MEMORY[0x1E0C99D20];
  v21 = v19;
  objc_msgSend(v20, "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_summarizedContentStrings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allNotificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke;
    v11[3] = &unk_1E8D1C600;
    v11[4] = self;
    v12 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke_2;
    v9[3] = &unk_1E8D1C678;
    v9[4] = self;
    v10 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  }
  return v3;
}

void __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  id v5;

  if (a3 > 2)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_summarizedStringsForNotificationRequest:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
}

void __57__NCNotificationAppSectionList__summarizedContentStrings__block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  id v7;

  if (a3 > 2)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(a2, "allNotificationRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_summarizedStringsForNotificationRequest:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

- (id)_localizedDefaultHiddenPreviewsBodyPlaceholder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  NCUserNotificationsUIKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEFAULT_HIDDEN_PREVIEW_PLACEHOLDER"), &stru_1E8D21F60, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_attachmentImageViewForSummaryForNotificationRequest:(id)a3
{
  id v4;
  NCNotificationRequestRichContentProvider *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_richContentProviders, "objectForKey:", v4);
  v5 = (NCNotificationRequestRichContentProvider *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:]([NCNotificationRequestRichContentProvider alloc], "initWithNotificationRequest:", v4);
    -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v5, "setDeviceAuthenticated:", -[NCNotificationStructuredSectionList deviceAuthenticated](self, "deviceAuthenticated"));
    -[NSMutableDictionary bs_setSafeObject:forKey:](self->_richContentProviders, "bs_setSafeObject:forKey:", v5, v4);
  }
  -[NCNotificationRequestCoalescingContentProvider communicationAvatar](v5, "communicationAvatar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[NCNotificationRequestRichContentProvider hasLoadedRichAttachmentImage](v5, "hasLoadedRichAttachmentImage"))
      {
        -[NCNotificationRequestRichContentProvider thumbnail](v5, "thumbnail");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      else
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __85__NCNotificationAppSectionList__attachmentImageViewForSummaryForNotificationRequest___block_invoke;
        v11[3] = &unk_1E8D1CAB0;
        v11[4] = self;
        -[NCNotificationRequestRichContentProvider fetchRichAttachmentImageIsFeatured:withCompletion:](v5, "fetchRichAttachmentImageIsFeatured:withCompletion:", 0, v11);
      }
      v6 = -[NCNotificationAppSectionList _newAttachmentImageViewForImage:](self, "_newAttachmentImageViewForImage:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __85__NCNotificationAppSectionList__attachmentImageViewForSummaryForNotificationRequest___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "_updateSummarizedFooterViewContent");
  return result;
}

- (id)_newAttachmentImageViewForImage:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0DC3F10];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v6, "setContentMode:", 2);
  objc_msgSend(v6, "_setContinuousCornerRadius:", 10.0);
  objc_msgSend(v6, "setClipsToBounds:", 1);
  objc_msgSend(v6, "setImage:", v4);

  objc_msgSend(v5, "addSubview:", v6);
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  return v5;
}

- (id)_summarizedAttachmentImageViews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  NCNotificationAppSectionList *v11;
  _QWORD v12[4];
  id v13;
  NCNotificationAppSectionList *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationAppSectionList _nonFeaturedGroupLists](self, "_nonFeaturedGroupLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allNotificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke;
    v12[3] = &unk_1E8D1C600;
    v13 = v3;
    v14 = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke_2;
    v9[3] = &unk_1E8D1C678;
    v10 = v3;
    v11 = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
    v5 = v10;
  }

  return v3;
}

void __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > 1)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_attachmentImageViewForSummaryForNotificationRequest:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
}

void __63__NCNotificationAppSectionList__summarizedAttachmentImageViews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > 1)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v9, "allNotificationRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_attachmentImageViewForSummaryForNotificationRequest:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

    }
  }

}

- (id)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCombinedAppSectionList
{
  return self->_combinedAppSectionList;
}

- (void)setCombinedAppSectionList:(BOOL)a3
{
  self->_combinedAppSectionList = a3;
}

- (NSMutableArray)featuredGroupLists
{
  return self->_featuredGroupLists;
}

- (void)setFeaturedGroupLists:(id)a3
{
  objc_storeStrong((id *)&self->_featuredGroupLists, a3);
}

- (NSMutableDictionary)richContentProviders
{
  return self->_richContentProviders;
}

- (void)setRichContentProviders:(id)a3
{
  objc_storeStrong((id *)&self->_richContentProviders, a3);
}

- (BOOL)isMerged
{
  return self->_merged;
}

- (void)setMerged:(BOOL)a3
{
  self->_merged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richContentProviders, 0);
  objc_storeStrong((id *)&self->_featuredGroupLists, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
