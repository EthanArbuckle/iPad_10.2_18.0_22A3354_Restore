@implementation SBHLibraryCategoryMapProviderDefaultSource

- (SBHLibraryCategoryMapProviderDefaultSource)initWithIconModel:(id)a3
{
  id v5;
  SBHLibraryCategoryMapProviderDefaultSource *v6;
  SBHLibraryCategoryMapProviderDefaultSource *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryMapProviderDefaultSource;
  v6 = -[SBHLibraryCategoryMapProviderDefaultSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconModel, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__requestRefresh_, CFSTR("SBIconModelDidAddIconNotification"), v7->_iconModel);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__requestRefresh_, CFSTR("SBIconModelDidReloadIconsNotification"), v7->_iconModel);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__requestRefresh_, CFSTR("SBIconModelWillRemoveIconNotification"), v7->_iconModel);

  }
  return v7;
}

- (NSString)sourceName
{
  return (NSString *)CFSTR("default");
}

- (void)requestLibraryCategoryMapWithOptions:(unint64_t)a3 existingLibraryCategoryMap:(id)a4 forbiddenApplicationIdentifiers:(id)a5 sessionId:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  NSObject *v11;
  SBHIconModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  SBHLibraryCategoryIdentifier *v33;
  SBHLibraryCategoryIdentifier *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  NSObject *queue;
  id v44;
  uint64_t v45;
  id v46;
  SBHIconModel *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD block[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v44 = a5;
  v11 = a7;
  v41 = a8;
  queue = v11;
  BSDispatchQueueAssert();
  v12 = self->_iconModel;
  -[SBHIconModel leafIcons](v12, "leafIcons");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v59;
    v21 = 3000;
    v46 = v17;
    v47 = v12;
    v45 = *(_QWORD *)v59;
    do
    {
      v22 = 0;
      v48 = v19;
      do
      {
        if (*(_QWORD *)v59 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v22);
        objc_msgSend(v23, "applicationBundleID", v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBHIconModel isIconVisible:](v12, "isIconVisible:", v23)
          && (objc_msgSend(v23, "isFolderIcon") & 1) == 0
          && (objc_msgSend(v23, "isWidgetIcon") & 1) == 0
          && (!v24 || (objc_msgSend(v44, "containsObject:", v24) & 1) == 0))
        {
          v49 = v22;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v23, "iTunesCategoriesOrderedByRelevancy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (!v26)
          {
            v29 = v21;
            goto LABEL_27;
          }
          v27 = v26;
          v50 = v23;
          v28 = *(_QWORD *)v55;
          v29 = v21;
          while (1)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v55 != v28)
                objc_enumerationMutation(v25);
              v31 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
              if ((objc_msgSend(v15, "categoriesContainApplicationIdentifier:", v31) & 1) == 0)
              {
                objc_msgSend(v16, "objectForKey:", v31);
                v32 = objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v33 = (SBHLibraryCategoryIdentifier *)v32;
                  if (v24)
                    goto LABEL_19;
LABEL_21:
                  objc_msgSend(v50, "leafIdentifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addApplicationIdentifier:forCategoryIdentifier:", v36, v33);

                }
                else
                {
                  v34 = [SBHLibraryCategoryIdentifier alloc];
                  v35 = v29++;
                  v33 = -[SBHLibraryCategoryIdentifier initWithPredictionCategoryID:localizedDisplayNameKey:](v34, "initWithPredictionCategoryID:localizedDisplayNameKey:", v35, v31);
                  objc_msgSend(v16, "setObject:forKey:", v33, v31);
                  if (!v24)
                    goto LABEL_21;
LABEL_19:
                  objc_msgSend(v15, "addApplicationIdentifier:forCategoryIdentifier:", v24, v33);
                }

                continue;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            if (!v27)
            {
LABEL_27:
              v21 = v29;

              v17 = v46;
              v12 = v47;
              v20 = v45;
              v19 = v48;
              v22 = v49;
              break;
            }
          }
        }

        ++v22;
      }
      while (v22 != v19);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v19);
  }

  objc_msgSend(v15, "categoryIdentifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCategoryIdentifiers:", v38);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_3;
  block[3] = &unk_1E8D85C70;
  v52 = v15;
  v53 = v41;
  v39 = v15;
  v40 = v41;
  dispatch_async(queue, block);

}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "leafIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leafIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 64);
  return v7;
}

uint64_t __169__SBHLibraryCategoryMapProviderDefaultSource_requestLibraryCategoryMapWithOptions_existingLibraryCategoryMap_forbiddenApplicationIdentifiers_sessionId_queue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_requestRefresh:(id)a3
{
  id v4;

  -[SBHLibraryCategoryMapProviderDefaultSource delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestLibraryCategoryMapUpdateWithRefreshOptions:source:", 6, self);

}

- (SBHLibraryCategoryMapProviderSourceDelegate)delegate
{
  return (SBHLibraryCategoryMapProviderSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

@end
