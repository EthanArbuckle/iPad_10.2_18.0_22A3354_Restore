@implementation NCNotificationListCache

- (NCNotificationListCache)init
{
  NCNotificationListCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *contentRevealedCellHeightCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *contentHiddenCellHeightCache;
  NSMutableSet *v7;
  NSMutableSet *notificationListCellCache;
  NSMutableSet *v9;
  NSMutableSet *notificationListCoalescingHeaderCache;
  NSMutableSet *v11;
  NSMutableSet *notificationListCoalescingControlsCache;
  NSMutableDictionary *v13;
  NSMutableDictionary *notificationListCellsForRequests;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NCNotificationListCache;
  v2 = -[NCNotificationListCache init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentRevealedCellHeightCache = v2->_contentRevealedCellHeightCache;
    v2->_contentRevealedCellHeightCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentHiddenCellHeightCache = v2->_contentHiddenCellHeightCache;
    v2->_contentHiddenCellHeightCache = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    notificationListCellCache = v2->_notificationListCellCache;
    v2->_notificationListCellCache = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    notificationListCoalescingHeaderCache = v2->_notificationListCoalescingHeaderCache;
    v2->_notificationListCoalescingHeaderCache = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    notificationListCoalescingControlsCache = v2->_notificationListCoalescingControlsCache;
    v2->_notificationListCoalescingControlsCache = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    notificationListCellsForRequests = v2->_notificationListCellsForRequests;
    v2->_notificationListCellsForRequests = v13;

  }
  return v2;
}

- (void)clearCacheForNotificationRequest:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[NCNotificationListCache clearCachedHeightsForNotificationRequest:](self, "clearCachedHeightsForNotificationRequest:", v4);
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (void)clearCachedHeightsForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[NCNotificationListCache contentRevealedCellHeightCache](self, "contentRevealedCellHeightCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    -[NCNotificationListCache contentHiddenCellHeightCache](self, "contentHiddenCellHeightCache");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

  }
}

- (void)removeNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NCNotificationListCache _cachedRequestMatchingRequest:](self, "_cachedRequestMatchingRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    -[NCNotificationListCache clearCacheForNotificationRequest:](self, "clearCacheForNotificationRequest:", v4);
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

    -[NCNotificationListCache recycleNotificationListCell:](self, "recycleNotificationListCell:", v6);
    v4 = v8;
  }

}

- (void)updateNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NCNotificationListCache _cachedRequestMatchingRequest:](self, "_cachedRequestMatchingRequest:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NCNotificationListCache clearCachedHeightsForNotificationRequest:](self, "clearCachedHeightsForNotificationRequest:", v4);
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v9);

  }
}

- (double)heightForNotificationRequest:(id)a3 withFrameWidth:(double)a4 isContentRevealed:(BOOL)a5 shouldCalculateHeight:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  int v27;
  double v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v6 = a6;
  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v7)
    -[NCNotificationListCache contentRevealedCellHeightCache](self, "contentRevealedCellHeightCache");
  else
    -[NCNotificationListCache contentHiddenCellHeightCache](self, "contentHiddenCellHeightCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[NCNotificationListCache listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:](self, "listCellForNotificationRequest:viewControllerDelegate:createNewIfNecessary:shouldConfigure:", v10, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notificationViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v12 = &unk_1E8D5FEC0;
    if (v13)
    {
      if (v6)
      {
        if (v14)
        {
          objc_msgSend(v14, "notificationRequest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "matchesRequest:", v10);

          v12 = &unk_1E8D5FEC0;
          if (a4 > 0.0)
          {
            if (v17)
            {
              objc_msgSend(v15, "setHasUpdatedContent");
              objc_msgSend(v15, "updateContent");
              objc_msgSend(v13, "sizeThatFits:", a4, 1.79769313e308);
              v19 = v18;
              v20 = (void *)*MEMORY[0x1E0DC5F90];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
              {
                v21 = v20;
                objc_msgSend(v10, "notificationIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "un_logDigest");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = 134218754;
                v28 = v19;
                v29 = 2114;
                v30 = v23;
                v31 = 2048;
                v32 = a4;
                v33 = 1024;
                v34 = v7;
                _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "Notification list setting cached height=%.2f for request %{public}@ with width=%.2f [contentRevealed=%{BOOL}d]", (uint8_t *)&v27, 0x26u);

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v12, v10);
            }
          }
        }
      }
    }

  }
  objc_msgSend(v12, "floatValue");
  v25 = v24;

  return v25;
}

- (BOOL)invalidateCachedHeightIfNecessaryForNotificationRequest:(id)a3 updatedHeight:(double)a4 isContentRevealed:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  float v17;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v5)
    -[NCNotificationListCache contentRevealedCellHeightCache](self, "contentRevealedCellHeightCache");
  else
    -[NCNotificationListCache contentHiddenCellHeightCache](self, "contentHiddenCellHeightCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "floatValue"), (BSFloatApproximatelyEqualToFloat() & 1) == 0))
  {
    v13 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v8, "notificationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "un_logDigest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v19 = 138544130;
      v20 = v16;
      v21 = 2048;
      v22 = v17;
      v23 = 2048;
      v24 = a4;
      v25 = 1024;
      v26 = v5;
      _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "Notification list invalidating cached height for request %{public}@ [cachedHeight=%.2f, updatedHeight=%.2f, contentRevealed=%{BOOL}d]", (uint8_t *)&v19, 0x26u);

    }
    objc_msgSend(v9, "removeObjectForKey:", v8);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)listCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4 createNewIfNecessary:(BOOL)a5 shouldConfigure:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  __int128 v14;
  void *v15;
  _OWORD v17[3];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13 && v7)
  {
    -[NCNotificationListCache _cachedNotificationListCellForRequest:viewControllerDelegate:shouldConfigure:](self, "_cachedNotificationListCellForRequest:viewControllerDelegate:shouldConfigure:", v10, v11, v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
      v13 = -[NCNotificationListCache _newCellForNotificationRequest:viewControllerDelegate:](self, "_newCellForNotificationRequest:viewControllerDelegate:", v10, v11);
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17[0] = *MEMORY[0x1E0C9BAA8];
    v17[1] = v14;
    v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v13, "setTransform:", v17);
    objc_msgSend(v13, "setAlpha:", 1.0);
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v13, v10);

  }
  return v13;
}

- (BOOL)recycleNotificationListCell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __55__NCNotificationListCache_recycleNotificationListCell___block_invoke;
  v19 = &unk_1E8D1E8E8;
  v6 = v4;
  v20 = v6;
  v21 = &v22;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v16);

  if (v23[5])
  {
    -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests", v16, v17, v18, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v23[5]);

  }
  -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache", v16, v17, v18, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v6)
    v10 = v9 >= 0x14;
  else
    v10 = 1;
  v11 = !v10;

  if (v11)
  {
    objc_msgSend(v6, "hideActionButtonsAnimated:fastAnimation:completion:", 0, 0, 0);
    objc_msgSend(v6, "notificationViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNotificationContentViewHidden:", 0);

    objc_msgSend(v6, "notificationViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setNotificationRequest:", 0);

    -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v6);

  }
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __55__NCNotificationListCache_recycleNotificationListCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (id)coalescingHeaderCellWithTitle:(id)a3 clearAllText:(id)a4 width:(double)a5
{
  id v8;
  id v9;
  NCNotificationListCoalescingHeaderCell *v10;
  NCNotificationListCoalescingHeaderCell *v11;
  double v12;

  v8 = a4;
  v9 = a3;
  -[NCNotificationListCache _cachedHeaderCellWithTitle:](self, "_cachedHeaderCellWithTitle:", v9);
  v10 = (NCNotificationListCoalescingHeaderCell *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = [NCNotificationListCoalescingHeaderCell alloc];
    v10 = -[NCNotificationListCoalescingHeaderCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  +[NCNotificationListCoalescingHeaderCell coalescingHeaderCellHeightForWidth:title:](NCNotificationListCoalescingHeaderCell, "coalescingHeaderCellHeightForWidth:title:", v9, a5);
  -[NCNotificationListCoalescingHeaderCell setFrame:](v10, "setFrame:", 0.0, 0.0, a5, v12);
  -[NCNotificationListCoalescingHeaderCell setTitle:](v10, "setTitle:", v9);

  -[NCNotificationListCoalescingHeaderCell setClearAllText:](v10, "setClearAllText:", v8);
  -[NCNotificationListCoalescingHeaderCell resetClearButtonStateAnimated:](v10, "resetClearButtonStateAnimated:", 0);
  -[NCNotificationListCoalescingHeaderCell setAdjustsFontForContentSizeCategory:](v10, "setAdjustsFontForContentSizeCategory:", 1);
  -[NCNotificationListCoalescingHeaderCell setNeedsLayout](v10, "setNeedsLayout");
  return v10;
}

- (void)recycleNotificationListCoalescingHeaderCell:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 0x13)
  {
    -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (id)coalescingControlsCellWithWidth:(double)a3
{
  void *v5;
  NCNotificationListCoalescingControlsCell *v6;
  void *v7;
  NCNotificationListCoalescingControlsCell *v8;
  double v9;

  -[NCNotificationListCache notificationListCoalescingControlsCache](self, "notificationListCoalescingControlsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (NCNotificationListCoalescingControlsCell *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NCNotificationListCache notificationListCoalescingControlsCache](self, "notificationListCoalescingControlsCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

  }
  else
  {
    v8 = [NCNotificationListCoalescingControlsCell alloc];
    v6 = -[NCNotificationListCoalescingControlsCell initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  +[NCNotificationListCoalescingControlsCell coalescingControlsCellHeightShowingCoalescingControls:](NCNotificationListCoalescingControlsCell, "coalescingControlsCellHeightShowingCoalescingControls:", 1);
  -[NCNotificationListCoalescingControlsCell setFrame:](v6, "setFrame:", 0.0, 0.0, a3, v9);
  -[NCNotificationListCoalescingControlsCell setAdjustsFontForContentSizeCategory:](v6, "setAdjustsFontForContentSizeCategory:", 1);
  return v6;
}

- (void)recycleNotificationListCoalescingControlsCell:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NCNotificationListCache notificationListCoalescingControlsCache](self, "notificationListCoalescingControlsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 0x13)
  {
    -[NCNotificationListCache notificationListCoalescingControlsCache](self, "notificationListCoalescingControlsCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (unint64_t)currentCacheSizeCount
{
  return -[NSMutableSet count](self->_notificationListCellCache, "count");
}

- (unint64_t)activeNotificationCellCount
{
  return -[NSMutableDictionary count](self->_notificationListCellsForRequests, "count");
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NCNotificationListCache _clearAllHeightCaches](self, "_clearAllHeightCaches");
  -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_31);

  -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_7);

  -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_9);

  -[NCNotificationListCache notificationListCoalescingControlsCache](self, "notificationListCoalescingControlsCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_11);

  return 1;
}

void __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "notificationViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustForContentSizeCategoryChange");

}

void __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "notificationViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustForContentSizeCategoryChange");

}

uint64_t __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

uint64_t __61__NCNotificationListCache_adjustForContentSizeCategoryChange__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (id)_newCellForNotificationRequest:(id)a3 viewControllerDelegate:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  NCNotificationListCell *v12;
  NCNotificationListCell *v13;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = objc_msgSend(WeakRetained, "notificationListCacheNotificationViewControllerClass:", self);
    if (v10)
      v8 = (objc_class *)v10;
  }
  v11 = (void *)objc_msgSend([v8 alloc], "initWithNotificationRequest:", v7);

  objc_msgSend(v11, "setDelegate:", v6);
  v12 = [NCNotificationListCell alloc];
  v13 = -[NCNotificationListCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NCNotificationListCell setContentViewController:](v13, "setContentViewController:", v11);
  objc_msgSend(v11, "setAssociatedView:", v13);

  return v13;
}

- (id)_cachedHeaderCellWithTitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__NCNotificationListCache__cachedHeaderCellWithTitle___block_invoke;
    v14[3] = &unk_1E8D1EA10;
    v15 = v4;
    objc_msgSend(v7, "objectsPassingTest:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObject:", v9);

    }
    -[NCNotificationListCache notificationListCoalescingHeaderCache](self, "notificationListCoalescingHeaderCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v9);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __54__NCNotificationListCache__cachedHeaderCellWithTitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_cachedNotificationListCellForRequest:(id)a3 viewControllerDelegate:(id)a4 shouldConfigure:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v30;
  _BOOL4 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "count");

  if (v11)
  {
    -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __104__NCNotificationListCache__cachedNotificationListCellForRequest_viewControllerDelegate_shouldConfigure___block_invoke;
    v36[3] = &unk_1E8D1EA38;
    v13 = v8;
    v37 = v13;
    objc_msgSend(v12, "objectsPassingTest:", v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anyObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObject:", v11);

      objc_msgSend(v11, "notificationViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v5)
      {
        objc_msgSend(v16, "delegate");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18 == v9)
          objc_msgSend(v17, "invalidateContentProviders");
        else
          objc_msgSend(v17, "setDelegate:", v9);
      }
    }
    else
    {
      v30 = v13;
      v31 = v5;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v20)
      {
LABEL_14:

        v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v21 = v20;
      v22 = *(_QWORD *)v33;
LABEL_8:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v23);
        objc_msgSend(v24, "notificationViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "hasCommittedToPresentingCustomContentProvidingViewController");

        if (!v26)
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          if (v21)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      v11 = v24;

      if (!v11)
        goto LABEL_21;
      -[NCNotificationListCache notificationListCellCache](self, "notificationListCellCache");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeObject:", v11);

      objc_msgSend(v11, "notificationViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v28;
      if (v31)
      {
        objc_msgSend(v28, "setDelegate:", v9);
        objc_msgSend(v17, "setNotificationContentViewHidden:", 0);
        objc_msgSend(v17, "setNotificationRequest:", v30);
      }
      else
      {
        objc_msgSend(v28, "setNotificationContentViewHidden:", 1);
      }
    }

    goto LABEL_21;
  }
LABEL_22:

  return v11;
}

BOOL __104__NCNotificationListCache__cachedNotificationListCellForRequest_viewControllerDelegate_shouldConfigure___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "notificationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == *(void **)(a1 + 32);

  return v5;
}

- (void)_clearAllHeightCaches
{
  void *v3;
  id v4;

  -[NCNotificationListCache contentRevealedCellHeightCache](self, "contentRevealedCellHeightCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[NCNotificationListCache contentHiddenCellHeightCache](self, "contentHiddenCellHeightCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (id)_cachedRequestMatchingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  -[NCNotificationListCache notificationListCellsForRequests](self, "notificationListCellsForRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NCNotificationListCache__cachedRequestMatchingRequest___block_invoke;
  v10[3] = &unk_1E8D1EA60;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __57__NCNotificationListCache__cachedRequestMatchingRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "matchesRequest:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationListCacheDelegate)delegate
{
  return (NCNotificationListCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)contentRevealedCellHeightCache
{
  return self->_contentRevealedCellHeightCache;
}

- (void)setContentRevealedCellHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentRevealedCellHeightCache, a3);
}

- (NSMutableDictionary)contentHiddenCellHeightCache
{
  return self->_contentHiddenCellHeightCache;
}

- (void)setContentHiddenCellHeightCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentHiddenCellHeightCache, a3);
}

- (NSMutableSet)notificationListCellCache
{
  return self->_notificationListCellCache;
}

- (void)setNotificationListCellCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCellCache, a3);
}

- (NSMutableSet)notificationListCoalescingHeaderCache
{
  return self->_notificationListCoalescingHeaderCache;
}

- (void)setNotificationListCoalescingHeaderCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCoalescingHeaderCache, a3);
}

- (NSMutableSet)notificationListCoalescingControlsCache
{
  return self->_notificationListCoalescingControlsCache;
}

- (void)setNotificationListCoalescingControlsCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCoalescingControlsCache, a3);
}

- (NSMutableDictionary)notificationListCellsForRequests
{
  return self->_notificationListCellsForRequests;
}

- (void)setNotificationListCellsForRequests:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCellsForRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationListCellsForRequests, 0);
  objc_storeStrong((id *)&self->_notificationListCoalescingControlsCache, 0);
  objc_storeStrong((id *)&self->_notificationListCoalescingHeaderCache, 0);
  objc_storeStrong((id *)&self->_notificationListCellCache, 0);
  objc_storeStrong((id *)&self->_contentHiddenCellHeightCache, 0);
  objc_storeStrong((id *)&self->_contentRevealedCellHeightCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
