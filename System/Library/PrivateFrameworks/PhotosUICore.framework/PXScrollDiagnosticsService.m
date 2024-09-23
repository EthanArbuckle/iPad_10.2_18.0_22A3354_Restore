@implementation PXScrollDiagnosticsService

- (id)title
{
  return CFSTR("Scroll Stress");
}

- (BOOL)canProvideContextualViewController
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  +[PXScrollViewStresser sharedInstance](PXScrollViewStresser, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScrolling");

  if ((v4 & 1) != 0)
    return 1;
  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "enableScrollService"))
  {
    v5 = 1;
    -[PXScrollDiagnosticsService scrollViewWithScrollAxis:](self, "scrollViewWithScrollAxis:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[PXScrollDiagnosticsService scrollViewWithScrollAxis:](self, "scrollViewWithScrollAxis:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8 != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contextualViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  +[PXScrollViewStresser sharedInstance](PXScrollViewStresser, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isScrolling") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scroll Stress"), CFSTR("Stop scrolling?"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Continue"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v5);

    v6 = (void *)MEMORY[0x1E0DC3448];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_3;
    v17[3] = &unk_1E5144530;
    v18 = v3;
    objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Stop"), 2, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v7);

    v8 = v18;
  }
  else
  {
    -[PXScrollDiagnosticsService scrollViewWithScrollAxis:](self, "scrollViewWithScrollAxis:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXScrollDiagnosticsService scrollViewWithScrollAxis:](self, "scrollViewWithScrollAxis:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Scroll Stress"), CFSTR("Ready?"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAction:", v10);

    v11 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v12 = (void *)MEMORY[0x1E0DC3448];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke;
      v22[3] = &unk_1E51458F8;
      v23 = v3;
      v24 = v8;
      objc_msgSend(v12, "actionWithTitle:style:handler:", CFSTR("Scroll Horizontally"), 0, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAction:", v13);

    }
    if (v9)
    {
      v14 = (void *)MEMORY[0x1E0DC3448];
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_2;
      v19[3] = &unk_1E51458F8;
      v20 = v3;
      v21 = v9;
      objc_msgSend(v14, "actionWithTitle:style:handler:", CFSTR("Scroll Vertically"), 0, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addAction:", v15);

    }
  }

  return v4;
}

- (id)scrollViewWithScrollAxis:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if (objc_msgSend(v9, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierScrollView")))
      {
        objc_msgSend(v9, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierScrollView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (a3 == 1)
        {
          if (objc_msgSend(v10, "px_isScrolledAtEdge:", 1)
            && objc_msgSend(v11, "px_isScrolledAtEdge:", 3))
          {
LABEL_14:

            continue;
          }
        }
        else if (a3 != 2
               || objc_msgSend(v10, "px_isScrolledAtEdge:", 0)
               && (objc_msgSend(v11, "px_isScrolledAtEdge:", 2) & 1) != 0)
        {
          goto LABEL_14;
        }
        if (v11)
          goto LABEL_19;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
LABEL_18:
  v11 = 0;
LABEL_19:

  return v11;
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startScrollingScrollView:axis:", *(_QWORD *)(a1 + 40), 2);
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startScrollingScrollView:axis:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopScrolling");
}

@end
