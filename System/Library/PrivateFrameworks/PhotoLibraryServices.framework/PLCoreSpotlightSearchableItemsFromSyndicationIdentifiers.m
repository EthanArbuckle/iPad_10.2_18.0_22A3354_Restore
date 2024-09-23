@implementation PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers

void __PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers_block_invoke_137(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    PLSyndicationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      PLPublicDescriptionForSyndicationIdentifiers(*(void **)(a1 + 32), *(_QWORD *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "CSSearchableIndex attributes fetch return an unexpected value (%@) for syndication identifiers: %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers_block_invoke_138(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PLSyndicationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      PLPublicDescriptionForSyndicationIdentifiers(*(void **)(a1 + 40), *(_QWORD *)(a1 + 64));
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "CSSearchableIndex attributes fetch return an unexpected value (%@) for syndication identifier: %{public}@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CA6B50]);
    v9 = *(void **)(a1 + 32);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers_block_invoke_2;
    v21 = &unk_1E36701C0;
    v22 = v6;
    v10 = v8;
    v23 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v18);
    v11 = objc_alloc(MEMORY[0x1E0CA6B48]);
    v12 = (void *)objc_msgSend(v11, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v5, CFSTR("attachmentDomain"), v10, v18, v19, v20, v21);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    }
    else
    {
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        PLPublicDescriptionForSyndicationIdentifiers(*(void **)(a1 + 40), *(_QWORD *)(a1 + 64));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v10;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "CSSearchableItem init failed with syndication identifier: %{public}@ and attribute set: %{public}@", buf, 0x16u);

      }
      v16 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
LABEL_11:

  }
}

void __PLCoreSpotlightSearchableItemsFromSyndicationIdentifiers_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("com_")))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", v8);
      objc_msgSend(*(id *)(a1 + 40), "setValue:forCustomKey:", v5, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setAttribute:forKey:", v5, v8);
    }
  }

}

@end
