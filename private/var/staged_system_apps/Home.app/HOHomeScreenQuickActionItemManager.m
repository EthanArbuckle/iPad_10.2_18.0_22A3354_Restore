@implementation HOHomeScreenQuickActionItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)HFHomeItem), "initWithHome:", v4);
    -[HOHomeScreenQuickActionItemManager setSourceItem:](self, "setSourceItem:", v5);

  }
  if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) != 0)
  {
    v6 = &__NSArray0__struct;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)HUCCFavoriteActionSetItemProvider), "initWithHome:actionSetItemStyle:", v4, 0);
    objc_msgSend(v7, "setMaximumNumberOfItems:", 3);
    v9 = v7;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  }
  return v6;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionItemManager sourceItem](self, "sourceItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "latestResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", HFResultDisplayReorderableActionSetItemListKey));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedHomeKitItemComparator"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionItemManager sourceItem](self, "sourceItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latestResults"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeScreenQuickActionItemManager sourceItem](self, "sourceItem"));
      NSLog(CFSTR("No HFResultDisplayReorderableActionSetItemListKey in our sourceItem: %@"), v11);

    }
    v15.receiver = self;
    v15.super_class = (Class)HOHomeScreenQuickActionItemManager;
    v12 = -[HOHomeScreenQuickActionItemManager _comparatorForSectionIdentifier:](&v15, "_comparatorForSectionIdentifier:", v4);
    v8 = objc_claimAutoreleasedReturnValue(v12);
  }
  v13 = (void *)v8;

  return v13;
}

- (BOOL)_shouldPerformFastInitialUpdates
{
  return 0;
}

@end
