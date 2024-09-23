@implementation PXCollectionSortOrderMenuBuilder

+ (id)sortOrderMenuActionsForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sortOrderMenuConfigurationsForCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "systemImageName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(v11, "systemImageName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "systemImageNamed:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = 0;
        }

        v16 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v11, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __70__PXCollectionSortOrderMenuBuilder_sortOrderMenuActionsForCollection___block_invoke;
        v21[3] = &unk_1E51286F8;
        v23 = a1;
        v21[4] = v11;
        v22 = v4;
        objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v15, 0, v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setState:", objc_msgSend(v11, "selected"));
        objc_msgSend(v6, "addObject:", v18);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v6;
}

+ (void)_updateSortOrderWithSortKey:(unsigned int)a3 ascending:(BOOL)a4 forCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unsigned int v15;
  BOOL v16;

  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke;
    v12[3] = &unk_1E5128720;
    v15 = a3;
    v13 = v9;
    v14 = a1;
    v16 = a4;
    v11 = v9;
    objc_msgSend(v10, "performChanges:completionHandler:", v12, &__block_literal_global_115791);

  }
}

+ (id)sortOrderMenuConfigurationsForCollection:(id)a3
{
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "customSortAscending");
    v7 = objc_msgSend(v5, "customSortKey");

  }
  else
  {
    v6 = 0;
    v7 = 1;
  }
  v8 = objc_msgSend(a1, "_sortOrderFromCollection:sortKey:", v4, v7);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PXCollectionSortOrderMenuBuilder_sortOrderMenuConfigurationsForCollection___block_invoke;
  v15[3] = &unk_1E5128768;
  v18 = a1;
  v19 = v8;
  v16 = v4;
  v20 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v4;
  objc_msgSend(a1, "_enumeratePossibleSortOrdersUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

+ (int64_t)_sortOrderFromCollection:(id)a3 sortKey:(unsigned int)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a3;
  v6 = v5;
  v7 = 3;
  switch(a4)
  {
    case 0u:
      if (objc_msgSend(v5, "px_isSharedAlbum"))
        v7 = 4;
      else
        v7 = 1;
      break;
    case 1u:
      break;
    case 2u:
    case 4u:
    case 5u:
      goto LABEL_2;
    case 3u:
      v7 = 2;
      break;
    default:
      if (a4 == 101)
LABEL_2:
        v7 = 0;
      break;
  }

  return v7;
}

+ (unsigned)_sortKeyFromSortOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 1;
  else
    return dword_1A7C0CA30[a3 - 1];
}

+ (BOOL)_supportsFetchSortOrder:(int64_t)a3 collection:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  char v8;

  v5 = a4;
  v6 = v5;
  if ((unint64_t)(a3 - 1) < 2)
  {
    v8 = objc_msgSend(v5, "px_isRegularAlbum");
LABEL_8:
    v7 = v8;
    goto LABEL_10;
  }
  if (a3 == 4)
    goto LABEL_7;
  if (a3 != 3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "px_isRegularAlbum") & 1) == 0)
  {
LABEL_7:
    v8 = objc_msgSend(v6, "px_isSharedAlbum");
    goto LABEL_8;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

+ (BOOL)_supportsAscendingDescending:(unsigned int)a3
{
  BOOL result;

  result = 1;
  if (a3 <= 5 && ((1 << a3) & 0x35) != 0 || a3 == 101)
    return 0;
  return result;
}

+ (id)_localizedTitleForSortOrder:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  PXLocalizedStringFromTable(off_1E5128788[a3 - 1], CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_enumeratePossibleSortOrdersUsingBlock:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 3);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 2);
  (*((void (**)(id, uint64_t))a3 + 2))(v5, 4);

}

void __77__PXCollectionSortOrderMenuBuilder_sortOrderMenuConfigurationsForCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BOOL8 v7;
  __CFString *v8;
  __CFString *v9;
  PXCollectionSortMenuItemConfiguration *v10;
  id v11;

  if (objc_msgSend(*(id *)(a1 + 48), "_supportsFetchSortOrder:collection:", a2, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 48), "_localizedTitleForSortOrder:", a2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v5 = objc_msgSend(*(id *)(a1 + 48), "_supportsAscendingDescending:", objc_msgSend(*(id *)(a1 + 48), "_sortKeyFromSortOrder:", a2));
    if ((_DWORD)v5)
      v6 = v4 == a2;
    else
      v6 = 0;
    if (v6)
    {
      if (*(_BYTE *)(a1 + 64))
        v9 = CFSTR("chevron.up");
      else
        v9 = CFSTR("chevron.down");
      v8 = v9;
      v7 = *(_BYTE *)(a1 + 64) == 0;
    }
    else
    {
      v7 = v5;
      v8 = 0;
    }
    v10 = -[PXCollectionSortMenuItemConfiguration initWithSortOrder:title:systemImageName:selected:actionAscending:]([PXCollectionSortMenuItemConfiguration alloc], "initWithSortOrder:title:systemImageName:selected:actionAscending:", a2, v11, v8, v4 == a2, v7);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

  }
}

void __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomSortKey:", *(unsigned int *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "_supportsAscendingDescending:", *(unsigned int *)(a1 + 48)))
    objc_msgSend(v2, "setCustomSortAscending:", *(unsigned __int8 *)(a1 + 52));

}

void __88__PXCollectionSortOrderMenuBuilder__updateSortOrderWithSortKey_ascending_forCollection___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v7 = "Sort Action: change request succeeded";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    v7 = "Sort Action: change request failed with error: %@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }

}

uint64_t __70__PXCollectionSortOrderMenuBuilder_sortOrderMenuActionsForCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "_updateSortOrderWithSortKey:ascending:forCollection:", objc_msgSend(*(id *)(a1 + 48), "_sortKeyFromSortOrder:", objc_msgSend(*(id *)(a1 + 32), "sortOrder")), objc_msgSend(*(id *)(a1 + 32), "actionAscending"), *(_QWORD *)(a1 + 40));
}

@end
