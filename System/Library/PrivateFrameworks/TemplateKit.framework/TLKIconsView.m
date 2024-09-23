@implementation TLKIconsView

- (TLKIconsView)init
{
  TLKIconsView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKIconsView;
  v2 = -[TLKIconsView init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKIconsView setImageViews:](v2, "setImageViews:", v3);

    -[TLKStackView setAlignment:](v2, "setAlignment:", 5);
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", v2, 2.5);
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:");
    -[TLKIconsView setProminence:](v2, "setProminence:", 1);
  }
  return v2;
}

- (void)setProminence:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_prominence = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TLKIconsView imageViews](self, "imageViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setProminence:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setSymbolFont:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_symbolFont, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TLKIconsView imageViews](self, "imageViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setSymbolFont:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updateIcons:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLKIconsView *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__TLKIconsView_updateIcons___block_invoke;
  v6[3] = &unk_1E5C06D50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLKIconsView performBatchUpdates:](self, "performBatchUpdates:", v6);

}

void __28__TLKIconsView_updateIcons___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "imageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 > v4)
  {
    do
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setProminence:", objc_msgSend(*(id *)(a1 + 40), "prominence"));
      objc_msgSend(*(id *)(a1 + 40), "symbolFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSymbolFont:", v6);

      objc_msgSend(v5, "setSymbolScale:", TLKSnippetModernizationEnabled());
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v5);
      objc_msgSend(*(id *)(a1 + 40), "imageViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v5);

      objc_msgSend(*(id *)(a1 + 40), "addArrangedSubview:", v5);
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "imageViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

    }
    while (v8 > v10);
  }
  objc_msgSend(*(id *)(a1 + 40), "imageViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(a1 + 40), "imageViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v13 >= v14)
      {
        objc_msgSend(v16, "setHidden:", 1);
      }
      else
      {
        objc_msgSend(v16, "setHidden:", 0);

        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "imageViews");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTlkImage:", v17);

      }
      ++v13;
      objc_msgSend(*(id *)(a1 + 40), "imageViews");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v13 < v21);
  }
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (UIFont)symbolFont
{
  return self->_symbolFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end
