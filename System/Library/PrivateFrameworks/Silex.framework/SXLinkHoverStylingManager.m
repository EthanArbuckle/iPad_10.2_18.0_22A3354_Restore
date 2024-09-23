@implementation SXLinkHoverStylingManager

- (SXLinkHoverStylingManager)initWithTangierController:(id)a3
{
  id v5;
  SXLinkHoverStylingManager *v6;
  SXLinkHoverStylingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLinkHoverStylingManager;
  v6 = -[SXLinkHoverStylingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tangierController, a3);

  return v7;
}

- (void)applyHoverStyling
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SXLinkHoverStylingManager hoverViews](self, "hoverViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "removeFromSuperview");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[SXLinkHoverStylingManager allHoverViews](self, "allHoverViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLinkHoverStylingManager setHoverViews:](self, "setHoverViews:", v9);

}

- (id)allHoverViews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  SXLinkHoverStylingManager *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v19 = (id)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SXLinkHoverStylingManager tangierController](self, "tangierController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelReps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        TSUDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "storage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "range");
          v16 = v15;
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __42__SXLinkHoverStylingManager_allHoverViews__block_invoke;
          v20[3] = &unk_24D689098;
          v21 = v12;
          v22 = v10;
          v23 = self;
          v24 = v19;
          objc_msgSend(v13, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v14, v16, v20);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  return v19;
}

void __42__SXLinkHoverStylingManager_allHoverViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  TSUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v28 = v3;
    objc_msgSend(*(id *)(a1 + 32), "columns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "range");
    v27 = v6;
    objc_msgSend(v6, "rectsForSelectionRange:selectionType:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "CGRectValue");
          objc_msgSend(v14, "convertNaturalRectToUnscaledCanvas:");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(*(id *)(a1 + 48), "createHoverView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
          objc_msgSend(*(id *)(a1 + 48), "tangierController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "icc");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "canvasView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addSubview:", v23);

          objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    v3 = v28;
  }

}

- (id)createHoverView
{
  SXHoverStyleView *v2;
  void *v3;

  v2 = objc_alloc_init(SXHoverStyleView);
  objc_msgSend(MEMORY[0x24BDF6AC0], "automaticStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXHoverStyleView setHoverStyle:](v2, "setHoverStyle:", v3);

  return v2;
}

- (SXTangierController)tangierController
{
  return self->_tangierController;
}

- (NSArray)hoverViews
{
  return self->_hoverViews;
}

- (void)setHoverViews:(id)a3
{
  objc_storeStrong((id *)&self->_hoverViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverViews, 0);
  objc_storeStrong((id *)&self->_tangierController, 0);
}

@end
