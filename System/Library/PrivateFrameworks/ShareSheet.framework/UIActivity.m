@implementation UIActivity

- (UIActivity)init
{
  UIActivity *v2;
  uint64_t v3;
  NSUUID *activityUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivity;
  v2 = -[UIActivity init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    activityUUID = v2->_activityUUID;
    v2->_activityUUID = (NSUUID *)v3;

    v2->_indexInApplicationDefinedActivities = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  if (self->_isInsideDescription)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v12.receiver = self;
    v12.super_class = (Class)UIActivity;
    -[UIActivity description](&v12, sel_description);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ UIActivity-recursiveDescription>"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->_isInsideDescription = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
    }
    else
    {
      -[UIActivity activityTitle](self, "activityTitle");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    v11.receiver = self;
    v11.super_class = (Class)UIActivity;
    -[UIActivity description](&v11, sel_description);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivity activityType](self, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ activityType:%@ activityTitle:%@"), v8, v9, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_isInsideDescription = 0;
  return (NSString *)v5;
}

+ (UIActivityCategory)activityCategory
{
  return 0;
}

- (UIActivityType)activityType
{
  return 0;
}

- (NSString)activityTitle
{
  return 0;
}

- (UIImage)activityImage
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
  return 0;
}

- (UIViewController)activityViewController
{
  return 0;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void)activityDidFinish:(BOOL)completed
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__UIActivity_activityDidFinish___block_invoke;
  v3[3] = &unk_1E4001A38;
  v3[4] = self;
  v4 = completed;
  sh_dispatch_on_main_queue(v3);
}

uint64_t __32__UIActivity_activityDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:items:error:", *(unsigned __int8 *)(a1 + 40), 0, 0);
}

- (BOOL)_isBuiltinDerived
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[_UIActivityHelper builtinActivityClasses](_UIActivityHelper, "builtinActivityClasses", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 1;
}

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

+ (BOOL)_isCapabilityBasedActivity
{
  return 0;
}

- (id)_activityTypeUsingFallbackActivityTypeIfNecessary
{
  void *v2;
  id v3;
  void *v4;

  -[UIActivity activityType](self, "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultFallbackActivityType");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (id)_defaultFallbackActivityType
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_defaultSortGroup
{
  if ((objc_msgSend((id)objc_opt_class(), "_xpcAttributes") & 1) != 0)
    return 2;
  if (-[UIActivity indexInApplicationDefinedActivities](self, "indexInApplicationDefinedActivities") == 0x7FFFFFFFFFFFFFFFLL)
    return 7;
  return 3;
}

- (BOOL)_appIsDocumentTypeOwner
{
  return 0;
}

- (BOOL)_supportsOpenInPlace
{
  return 0;
}

- (id)_subjectForActivityItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIActivity activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemMapping _subjectForActivityItem:activityType:](_UIActivityItemMapping, "_subjectForActivityItem:activityType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dataTypeIdentifierForActivityItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIActivity activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:activityType:](_UIActivityItemMapping, "_dataTypeIdentifierForActivityItem:activityType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_thumbnailImageForActivityItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[UIActivity _thumbnailSize](self, "_thumbnailSize");
  v6 = v5;
  v8 = v7;
  -[UIActivity activityType](self, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v4, v9, v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_attachmentNameForActivityItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIActivity activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityItemMapping _attachmentNameForActivityItem:activityType:](_UIActivityItemMapping, "_attachmentNameForActivityItem:activityType:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  id didFinishPerformingActivityHandler;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    v15 = 138412802;
    if (v6)
      v11 = CFSTR("YES");
    v16 = v11;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Called activityDidFinish:%@ items:%@ error:%@", (uint8_t *)&v15, 0x20u);
  }

  if (self->_representationCacheURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeItemAtURL:error:", self->_representationCacheURL, 0);

  }
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AE9514](self->_didFinishPerformingActivityHandler);
  didFinishPerformingActivityHandler = self->_didFinishPerformingActivityHandler;
  self->_didFinishPerformingActivityHandler = 0;

  if (v13)
    ((void (**)(_QWORD, _BOOL8, id, id))v13)[2](v13, v6, v8, v9);

}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  return 1;
}

- (BOOL)_activitySupportsPromiseURLs
{
  return 0;
}

- (BOOL)_wantsThumbnailItemData
{
  return 0;
}

- (BOOL)_wantsAttachmentURLItemData
{
  return 0;
}

- (BOOL)_wantsInitialSocialText
{
  return 0;
}

+ (void)_performAfterActivityImageLoadingCompletes:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = a3;
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Waiting on image loading queue", buf, 2u);
  }

  imageLoadingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, &__block_literal_global_8);

  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Finished waiting on image loading queue", v7, 2u);
  }

  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

+ (double)imageWidthForContentSizeCategory:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;
  uint64_t v6;

  v3 = (NSString *)a3;
  v4 = v3;
  if ((NSString *)*MEMORY[0x1E0DC4918] == v3)
  {
    v6 = 0x4040000000000000;
LABEL_12:
    v5 = *(double *)&v6;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E0DC4908] == v3)
  {
    v5 = 26.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E0DC4930] == v3)
  {
    v5 = 28.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E0DC4920] == v3)
  {
    v5 = 30.0;
    goto LABEL_16;
  }
  if ((NSString *)*MEMORY[0x1E0DC4900] == v3)
  {
    v6 = 0x4041000000000000;
    goto LABEL_12;
  }
  if ((NSString *)*MEMORY[0x1E0DC48F8] == v3)
  {
    v6 = 0x4042000000000000;
    goto LABEL_12;
  }
  if ((NSString *)*MEMORY[0x1E0DC48F0] == v3)
  {
    v6 = 0x4043000000000000;
    goto LABEL_12;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    v5 = 46.0;
  else
    v5 = 32.0;
LABEL_16:

  return v5;
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 completion:(id)a4
{
  -[UIActivity _loadItemProvidersFromActivityItems:wantsSendCopyRepresentation:completion:](self, "_loadItemProvidersFromActivityItems:wantsSendCopyRepresentation:completion:", a3, 1, a4);
}

- (void)_loadItemProvidersFromActivityItems:(id)a3 wantsSendCopyRepresentation:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  UIActivity *v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _itemLoaderQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke;
  block[3] = &unk_1E4001AD8;
  v16 = v8;
  v17 = self;
  v20 = a4;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, block);

}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v2[5];
  v5 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(v2, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_2;
  v14[3] = &unk_1E4001A60;
  v15 = *(id *)(a1 + 48);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_3;
  v10[3] = &unk_1E4001AB0;
  v9 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  _loadItemProvidersFromActivityItemsStartingAtIndex(v3, 0, v4, v5, v6, v14, v10);

}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  _itemLoaderQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setOriginalItem:", v6);

  objc_msgSend(v8, "setResolvedItem:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_4;
  block[3] = &unk_1E4001A88;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__UIActivity__loadItemProvidersFromActivityItems_wantsSendCopyRepresentation_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "originalItem", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resolvedItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _updateActivityItemMappingWithResolvedActivityItem(v9, v10);

        objc_msgSend(v8, "resolvedItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = *(_QWORD *)(a1 + 48);
  v13 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

+ (void)_loadItemProvidersFromActivityItems:(id)a3 withCacheURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _itemLoaderQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke;
  v16[3] = &unk_1E4001B50;
  v17 = v7;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  v15 = v7;
  dispatch_async(v11, v16);

}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_2;
  v9[3] = &unk_1E4001A60;
  v10 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_3;
  v5[3] = &unk_1E4001B28;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  _loadItemProvidersFromActivityItemsStartingAtIndex(v3, 0, v4, 1, 0, v9, v5);

}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  _itemLoaderQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setOriginalItem:", v6);

  objc_msgSend(v8, "setResolvedItem:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_4;
  v6[3] = &unk_1E4001B00;
  v7 = a1[4];
  v8 = a1[5];
  v4 = a1[6];
  v9 = v3;
  v10 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __74__UIActivity__loadItemProvidersFromActivityItems_withCacheURL_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "originalItem", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resolvedItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _updateActivityItemMappingWithResolvedActivityItem(v9, v10);

        objc_msgSend(v8, "resolvedItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = *(_QWORD *)(a1 + 56);
  v13 = (void *)objc_msgSend(v2, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, *(_QWORD *)(a1 + 48));

}

+ (id)_stringFromActivityCategory:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (!a3)
    v3 = CFSTR("UIActivityCategoryAction");
  if (a3 == 1)
    return CFSTR("UIActivityCategoryShare");
  else
    return (id)v3;
}

- (_UIActivityResourceLoader)_activityImageLoader
{
  _UIActivityResourceLoader *activityImageLoader;
  _UIActivityResourceLoader *v4;
  void *v5;
  _UIActivityResourceLoader *v6;
  _UIActivityResourceLoader *v7;
  _QWORD v9[4];
  id v10;
  id location;

  activityImageLoader = self->_activityImageLoader;
  if (!activityImageLoader)
  {
    location = 0;
    objc_initWeak(&location, self);
    v4 = [_UIActivityResourceLoader alloc];
    imageLoadingQueue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__UIActivity__activityImageLoader__block_invoke;
    v9[3] = &unk_1E4001B78;
    objc_copyWeak(&v10, &location);
    v6 = -[_UIActivityResourceLoader initWithQueue:loadBlock:](v4, "initWithQueue:loadBlock:", v5, v9);
    v7 = self->_activityImageLoader;
    self->_activityImageLoader = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    activityImageLoader = self->_activityImageLoader;
  }
  return activityImageLoader;
}

id __34__UIActivity__activityImageLoader__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activityImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (_UIActivityResourceLoader)_activitySettingsImageLoader
{
  _UIActivityResourceLoader *activitySettingsImageLoader;
  _UIActivityResourceLoader *v4;
  void *v5;
  _UIActivityResourceLoader *v6;
  _UIActivityResourceLoader *v7;
  _QWORD v9[4];
  id v10;
  id location;

  activitySettingsImageLoader = self->_activitySettingsImageLoader;
  if (!activitySettingsImageLoader)
  {
    location = 0;
    objc_initWeak(&location, self);
    v4 = [_UIActivityResourceLoader alloc];
    imageLoadingQueue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__UIActivity__activitySettingsImageLoader__block_invoke;
    v9[3] = &unk_1E4001B78;
    objc_copyWeak(&v10, &location);
    v6 = -[_UIActivityResourceLoader initWithQueue:loadBlock:](v4, "initWithQueue:loadBlock:", v5, v9);
    v7 = self->_activitySettingsImageLoader;
    self->_activitySettingsImageLoader = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    activitySettingsImageLoader = self->_activitySettingsImageLoader;
  }
  return activitySettingsImageLoader;
}

id __42__UIActivity__activitySettingsImageLoader__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activitySettingsImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_backgroundPreheatBlock
{
  return 0;
}

- (id)applicationProxy
{
  return 0;
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIActivity _activityBundleImageConfiguration](self, "_activityBundleImageConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIActivity _actionImageForBundleImageConfiguration:](UIActivity, "_actionImageForBundleImageConfiguration:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIActivity activityImage](self, "activityImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivity contentSizeCategory](self, "contentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIActivity _actionImageForActionRepresentationImage:contentSizeCategory:](UIActivity, "_actionImageForActionRepresentationImage:contentSizeCategory:", v5, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4
{
  return (id)objc_msgSend(a1, "_actionImageForActionRepresentationImage:contentSizeCategory:monochrome:", a3, a4, 1);
}

+ (id)_actionImageForActionRepresentationImage:(id)a3 contentSizeCategory:(id)a4 monochrome:(BOOL)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGContext *CurrentContext;
  id v26;
  CGImage *v27;
  void *v28;
  CGAffineTransform v30;
  CGSize v31;
  CGRect v32;
  CGRect v33;

  v7 = a3;
  v8 = a4;
  if (!v7
    || ((objc_msgSend(v7, "size"), v10 == *MEMORY[0x1E0C9D820])
      ? (v11 = v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v11 = 0),
        v11))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = v13;

    +[UIActivity imageWidthForContentSizeCategory:](UIActivity, "imageWidthForContentSizeCategory:", v8);
    v16 = v15;
    objc_msgSend(v7, "size");
    UIRectCenteredAboutPointScale();
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v31.width = v16;
    v31.height = v16;
    UIGraphicsBeginImageContextWithOptions(v31, 0, v14);
    CurrentContext = UIGraphicsGetCurrentContext();
    v30.b = 0.0;
    v30.c = 0.0;
    v30.a = 1.0;
    *(_OWORD *)&v30.d = xmmword_19E4D34D0;
    v30.ty = v16;
    CGContextConcatCTM(CurrentContext, &v30);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v26, "CGColor"));

      v32.origin.x = v18;
      v32.origin.y = v20;
      v32.size.width = v22;
      v32.size.height = v24;
      CGContextFillRect(CurrentContext, v32);
      CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
    }
    v27 = (CGImage *)objc_msgSend(objc_retainAutorelease(v7), "CGImage");
    v33.origin.x = v18;
    v33.origin.y = v20;
    v33.size.width = v22;
    v33.size.height = v24;
    CGContextDrawImage(CurrentContext, v33, v27);
    UIGraphicsGetImageFromCurrentImageContext();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v28;
}

- (id)_actionBundleImageConfiguration
{
  return 0;
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  return _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(a3, a4);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6;
  id v7;
  UISUIActivityExtensionItemData *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(UISUIActivityExtensionItemData);
  objc_msgSend(a1, "_activityExtensionItemsForActivityItemValues:extensionItemDataRequest:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISUIActivityExtensionItemData setExtensionItems:](v8, "setExtensionItems:", v9);
  return v8;
}

- (id)activityCompletionWithItemsHandler
{
  return self->_activityCompletionWithItemsHandler;
}

- (void)setActivityCompletionWithItemsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)activitySectionIdentifier
{
  return self->_activitySectionIdentifier;
}

- (void)setActivitySectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)didFinishPerformingActivityHandler
{
  return self->_didFinishPerformingActivityHandler;
}

- (void)setDidFinishPerformingActivityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)maxPreviews
{
  return self->_maxPreviews;
}

- (void)setMaxPreviews:(int64_t)a3
{
  self->_maxPreviews = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeCategory, a3);
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (void)setPreferredLocalizations:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLocalizations, a3);
}

- (unint64_t)indexInApplicationDefinedActivities
{
  return self->_indexInApplicationDefinedActivities;
}

- (void)setIndexInApplicationDefinedActivities:(unint64_t)a3
{
  self->_indexInApplicationDefinedActivities = a3;
}

- (BOOL)_showsInSystemActionGroup
{
  return self->__showsInSystemActionGroup;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong(&self->_didFinishPerformingActivityHandler, 0);
  objc_storeStrong((id *)&self->_activitySectionIdentifier, 0);
  objc_storeStrong(&self->_activityCompletionWithItemsHandler, 0);
  objc_storeStrong((id *)&self->_representationCacheURL, 0);
  objc_storeStrong((id *)&self->_activitySettingsImageLoader, 0);
  objc_storeStrong((id *)&self->_activityImageLoader, 0);
}

+ (id)_activityImageForApplicationBundleIdentifier:(id)a3
{
  return _UIActivityImageForBundleIdentifier(a3, 10);
}

+ (id)_activitySettingsImageForApplicationBundleIdentifier:(id)a3
{
  return _UIActivityImageForBundleIdentifier(a3, 0);
}

+ (id)_actionImageForBundleImageConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "fetchedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIActivity _actionImageForActionRepresentationImage:contentSizeCategory:](UIActivity, "_actionImageForActionRepresentationImage:contentSizeCategory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_activityImageForBundleImageConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "fetchedImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "activityCategory");

  +[UIActivity _imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:](UIActivity, "_imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:", v4, v5, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_activitySettingsImageForBundleImageConfiguration:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  objc_msgSend(a3, "fetchedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  objc_msgSend(v3, "_applicationIconImageForFormat:precomposed:scale:", 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_imageByApplyingDefaultEffectsToImage:(id)a3 activityCategory:(int64_t)a4 iconFormat:(int)a5
{
  id v6;
  char v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = dyld_program_sdk_at_least();
  if (a4 && (v7 & 1) != 0)
  {
    v8 = v6;
  }
  else
  {
    +[UIActivity _activityImageForActionRepresentationImage:](UIActivity, "_activityImageForActionRepresentationImage:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)_activityImageForActionRepresentationImage:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGContext *CurrentContext;
  CGImage *v23;
  CGImage *v24;
  id v25;
  CGAffineTransform v27;
  CGSize v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = a3;
  v4 = v3;
  if (_activityImageForActionRepresentationImage__once == -1)
  {
    if (v3)
      goto LABEL_3;
LABEL_9:
    v25 = (id)_activityImageForActionRepresentationImage____chickletImage;
    goto LABEL_10;
  }
  dispatch_once(&_activityImageForActionRepresentationImage__once, &__block_literal_global_309);
  if (!v4)
    goto LABEL_9;
LABEL_3:
  objc_msgSend(v4, "size");
  if (v6 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_9;
  objc_msgSend((id)_activityImageForActionRepresentationImage____chickletImage, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)_activityImageForActionRepresentationImage____chickletImage, "scale");
  v13 = v12;
  objc_msgSend(v4, "size");
  UIRectCenteredAboutPointScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v28.width = v9;
  v28.height = v11;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v27.b = 0.0;
  v27.c = 0.0;
  v27.a = 1.0;
  *(_OWORD *)&v27.d = xmmword_19E4D34D0;
  v27.ty = v11;
  CGContextConcatCTM(CurrentContext, &v27);
  objc_msgSend((id)_activityImageForActionRepresentationImage____chickletImage, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
  v23 = (CGImage *)objc_msgSend((id)_activityImageForActionRepresentationImage____chickletImage, "CGImage");
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v9;
  v29.size.height = v11;
  CGContextClipToMask(CurrentContext, v29, v23);
  v24 = (CGImage *)objc_msgSend(objc_retainAutorelease(v4), "CGImage");
  v30.origin.x = v15;
  v30.origin.y = v17;
  v30.size.width = v19;
  v30.size.height = v21;
  CGContextClipToMask(CurrentContext, v30, v24);
  objc_msgSend((id)_activityImageForActionRepresentationImage____imageTintColor, "set");
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v9;
  v31.size.height = v11;
  UIRectFill(v31);
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_10:

  return v25;
}

void __77__UIActivity_UIActivity_Private___activityImageForActionRepresentationImage___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v3 = (void *)MEMORY[0x1E0DC3E88];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollectionWithTraitsFromCollections:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UIActivityRoundedCornerButtonBackground"), v9, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_activityImageForActionRepresentationImage____chickletImage;
  _activityImageForActionRepresentationImage____chickletImage = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.40625, 0.40625, 0.44140625, 1.0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_activityImageForActionRepresentationImage____imageTintColor;
  _activityImageForActionRepresentationImage____imageTintColor = v12;

}

- (NSExtension)applicationExtension
{
  return 0;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return 0;
}

- (id)_activityBundleImageConfiguration
{
  return 0;
}

- (id)_activitySettingsBundleImageConfiguration
{
  return 0;
}

- (id)_systemImageName
{
  return 0;
}

- (id)_activityImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIActivity _bundleIdentifierForActivityImageCreation](self, "_bundleIdentifierForActivityImageCreation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    +[UIActivity _activityImageForApplicationBundleIdentifier:](UIActivity, "_activityImageForApplicationBundleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIActivity _activityBundleImageConfiguration](self, "_activityBundleImageConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[UIActivity _activityImageForBundleImageConfiguration:](UIActivity, "_activityImageForBundleImageConfiguration:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIActivity activityImage](self, "activityImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIActivity _imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:](UIActivity, "_imageByApplyingDefaultEffectsToImage:activityCategory:iconFormat:", v6, objc_msgSend((id)objc_opt_class(), "activityCategory"), 10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (id)_activitySettingsImage
{
  void *v3;
  void *v4;
  void *v5;

  -[UIActivity _bundleIdentifierForActivityImageCreation](self, "_bundleIdentifierForActivityImageCreation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIActivity _activitySettingsImageForApplicationBundleIdentifier:](UIActivity, "_activitySettingsImageForApplicationBundleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIActivity _activitySettingsBundleImageConfiguration](self, "_activitySettingsBundleImageConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[UIActivity _activitySettingsImageForBundleImageConfiguration:](UIActivity, "_activitySettingsImageForBundleImageConfiguration:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)_wantsOriginalImageColor
{
  return 0;
}

- (id)_beforeActivity
{
  return 0;
}

- (NSString)_activitySubtitle
{
  return 0;
}

- (BOOL)_isDisabled
{
  return 0;
}

- (NSString)_activityBadgeText
{
  return 0;
}

- (UIColor)_activityBadgeColor
{
  return 0;
}

- (UIColor)_activityBadgeTextColor
{
  return 0;
}

- (UIImage)_activityStatusImage
{
  return 0;
}

- (UIColor)_activityStatusTintColor
{
  return 0;
}

- (NSAttributedString)_activityFooterText
{
  return 0;
}

- (NSString)_heroActionTitle
{
  return 0;
}

- (id)_embeddedActivityViewController
{
  return 0;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (BOOL)_managesOwnPresentation
{
  return 0;
}

- (BOOL)_needsResolvedActivityItems
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__UIActivity_UIActivity_Private___prepareWithActivityItems_completion___block_invoke;
  v9[3] = &unk_1E4001BC0;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[UIActivity _loadItemProvidersFromActivityItems:completion:](self, "_loadItemProvidersFromActivityItems:completion:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

uint64_t __71__UIActivity_UIActivity_Private___prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "prepareWithActivityItems:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)_thumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (int64_t)_activityStyle
{
  return 0;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 0;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 1;
}

- (id)ss_activitySpecificExtensionItemDataRequestInfo
{
  return 0;
}

- (BOOL)_isExecutedInProcess
{
  return 1;
}

@end
