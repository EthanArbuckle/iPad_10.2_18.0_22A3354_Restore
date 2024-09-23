@implementation PXSearchDiagnosticsService

+ (id)viewControllerForDetailsOfAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  objc_msgSend(v3, "px_searchDebugString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Search Details"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAttributedMessage:", v4);
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke;
  v20[3] = &unk_1E5144530;
  v21 = v4;
  v8 = v4;
  objc_msgSend(v7, "actionWithTitle:style:handler:", CFSTR("Copy Text"), 0, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  v15 = v6;
  v16 = 3221225472;
  v17 = __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2;
  v18 = &unk_1E5144530;
  v19 = v3;
  v11 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", CFSTR("Copy UUID"), 0, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12, v15, v16, v17, v18);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  return v5;
}

void __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjects:", v4);

}

void __62__PXSearchDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjects:", v4);

}

- (id)title
{
  return CFSTR("Search Details");
}

- (BOOL)canProvideContextualViewController
{
  id v2;
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
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset"), (_QWORD)v9) & 1) != 0)
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

- (id)contextualViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (!v4)
  {

    v6 = 0;
LABEL_14:
    PLUIGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[PXDiagnosticsService itemProviders](self, "itemProviders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_INFO, "Search Diagnostics Service Error: No item providers can be used (%@)", buf, 0xCu);

    }
    v11 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v9, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset")))
      {
        objc_msgSend(v9, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset"));
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_14;
  objc_msgSend((id)objc_opt_class(), "viewControllerForDetailsOfAsset:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_14;
LABEL_17:

  return v11;
}

@end
