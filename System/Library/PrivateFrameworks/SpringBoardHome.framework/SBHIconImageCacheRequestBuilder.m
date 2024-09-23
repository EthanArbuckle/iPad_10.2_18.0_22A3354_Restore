@implementation SBHIconImageCacheRequestBuilder

- (id)initWithIconImageCache:(void *)a3 sharedCancellation:(void *)a4 reason:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  dispatch_group_t v15;
  id v16;
  objc_super v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)SBHIconImageCacheRequestBuilder;
    v10 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 3, v7);
      objc_storeStrong(a1 + 4, a3);
      v11 = objc_msgSend(v9, "copy");
      v12 = a1[5];
      a1[5] = (id)v11;

      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = a1[1];
      a1[1] = v13;

      v15 = dispatch_group_create();
      v16 = a1[6];
      a1[6] = v15;

    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[SBHIconImageCacheRequestBuilder isFinalized](self, "isFinalized"))
    NSLog(CFSTR("Request builder deallocated without finalizing"));
  v3.receiver = self;
  v3.super_class = (Class)SBHIconImageCacheRequestBuilder;
  -[SBHIconImageCacheRequestBuilder dealloc](&v3, sel_dealloc);
}

- (void)addIcon:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *WeakRetained;
  NSString *v13;
  SBHIconImageCacheCancellation *v14;
  OS_dispatch_group *completionGroup;
  NSObject *v16;
  uint64_t v17;
  id *v18;
  SBHIconImageCacheRequest *v19;
  uint64_t v20;
  id *p_isa;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  SBHIconImageCacheRequest *v30;
  void *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  NSObject *v38;

  v10 = a3;
  v11 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "hasIconImage") & 1) != 0)
  {
    if (self)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
      v13 = self->_reason;
      v14 = self->_sharedCancellation;
      completionGroup = self->_completionGroup;
    }
    else
    {
      v14 = 0;
      WeakRetained = 0;
      v13 = 0;
      completionGroup = 0;
    }
    v16 = completionGroup;
    v31 = (void *)-[NSObject currentImageGenerationForIcon:](WeakRetained, "currentImageGenerationForIcon:", v10);
    v17 = MEMORY[0x1E0C809B0];
    if ((a6 & 2) == 0)
    {
      dispatch_group_enter(v16);
      v30 = [SBHIconImageCacheRequest alloc];
      v34[0] = v17;
      v34[1] = 3221225472;
      v34[2] = __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke;
      v34[3] = &unk_1E8D84FF8;
      v35 = WeakRetained;
      v36 = v10;
      v37 = v11;
      v38 = v16;
      v18 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:masked:options:sharedCancellation:completionHandler:]((id *)&v30->super.isa, v36, v37, (void *)a5, v13, v31, 1, (void *)a6, v14, v34);
      -[NSMutableArray addObject:](self->_requests, "addObject:", v18);

      v17 = MEMORY[0x1E0C809B0];
    }
    if ((a6 & 1) != 0)
    {
      dispatch_group_enter(v16);
      v19 = [SBHIconImageCacheRequest alloc];
      v20 = v17;
      p_isa = (id *)&v19->super.isa;
      v32[0] = v20;
      v32[1] = 3221225472;
      v32[2] = __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke_2;
      v32[3] = &unk_1E8D85020;
      v33 = v16;
      v22 = -[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:masked:options:sharedCancellation:completionHandler:](p_isa, v10, v11, (void *)a5, v13, v31, 0, (void *)a6, v14, v32);
      -[NSMutableArray addObject:](self->_requests, "addObject:", v22);

    }
  }
  else
  {
    SBLogIconImageCache();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      -[SBHIconImageCacheRequestBuilder addIcon:imageAppearance:priority:options:].cold.1(WeakRetained, v23, v24, v25, v26, v27, v28, v29);
  }

}

void __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2)
    objc_msgSend(*(id *)(a1 + 32), "finishedAsynchronousLoadOfIcon:imageAppearance:requestStartTimestamp:elapsedTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __76__SBHIconImageCacheRequestBuilder_addIcon_imageAppearance_priority_options___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)addIcon:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SBHIconImageCacheRequestBuilder_addIcon_prioritizedImageAppearances_options___block_invoke;
  v10[3] = &unk_1E8D84D50;
  v10[4] = self;
  v11 = v8;
  v12 = a5;
  v9 = v8;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __79__SBHIconImageCacheRequestBuilder_addIcon_prioritizedImageAppearances_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcon:imageAppearance:priority:options:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(_QWORD *)(a1 + 48));

}

- (void)addIcons:(id)a3 imageAppearance:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v10);
        -[SBHIconImageCacheRequestBuilder addIcon:imageAppearance:priority:options:](self, "addIcon:imageAppearance:priority:options:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v11, a5, a6);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)addIcons:(id)a3 prioritizedImageAppearances:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBHIconImageCacheRequestBuilder_addIcons_prioritizedImageAppearances_options___block_invoke;
  v10[3] = &unk_1E8D84D50;
  v10[4] = self;
  v11 = v8;
  v12 = a5;
  v9 = v8;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __80__SBHIconImageCacheRequestBuilder_addIcons_prioritizedImageAppearances_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIcons:imageAppearance:priority:options:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(a3, "integerValue"), *(_QWORD *)(a1 + 48));

}

- (id)finalizeRequestWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  -[SBHIconImageCacheRequestBuilder setFinalized:](self, "setFinalized:", 1);
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageCache);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "finalizeRequestBuilder:completionHandler:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBHIconImageCacheRequestBuilder *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBHIconImageCacheRequestBuilder_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __61__SBHIconImageCacheRequestBuilder_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = *(_QWORD *)(v3 + 40);
  else
    v4 = 0;
  return (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("reason"));
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_sharedCancellation, 0);
  objc_destroyWeak((id *)&self->_iconImageCache);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)addIcon:(uint64_t)a3 imageAppearance:(uint64_t)a4 priority:(uint64_t)a5 options:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1CFEF3000, a1, a3, "skipping icon from cache builder because it doesn't have an icon image", a5, a6, a7, a8, 0);
}

@end
