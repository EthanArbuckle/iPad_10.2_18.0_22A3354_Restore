@implementation SearchUIButtonsView

- (SearchUIButtonsView)initWithCardSectionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SearchUIButtonsView *v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  SearchUIButtonsView *v17;
  char v18;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIButtonsView buttonWithTitle:subtitle:punchoutURL:](self, "buttonWithTitle:subtitle:punchoutURL:", &stru_1EA1FB118, CFSTR("\n"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)SearchUIButtonsView;
  v7 = -[NUIContainerBoxView initWithArrangedSubviews:](&v19, sel_initWithArrangedSubviews_, v6);

  if (v7)
  {
    -[SearchUIButtonsView setCardSectionView:](v7, "setCardSectionView:", v4);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v10 = objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize");
    v11 = v10;
    if (v9 == 1)
      v12 = 1;
    else
      v12 = v10;
    if (v12)
      v13 = 1;
    else
      v13 = 3;
    -[NUIContainerBoxView setHorizontalAlignment:](v7, "setHorizontalAlignment:", v13);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__SearchUIButtonsView_initWithCardSectionView___block_invoke;
    v15[3] = &unk_1EA1F7B98;
    v18 = v11;
    v16 = v5;
    v17 = v7;
    -[SearchUIButtonsView fetchButtonsWithCompletionHandler:](v17, "fetchButtonsWithCompletionHandler:", v15);

  }
  return v7;
}

void __47__SearchUIButtonsView_initWithCardSectionView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double Height;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDA08]), "initWithArrangedSubviews:", v3);
  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setDistribution:", 1);
  objc_msgSend(v4, "setSpacing:", 15.0);
  objc_msgSend(v4, "setAxis:", *(unsigned __int8 *)(a1 + 48));
  if (!*(_BYTE *)(a1 + 48))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "frame", v13);
          Height = CGRectGetHeight(v22);
          if (Height == 0.0)
            objc_msgSend(*(id *)(a1 + 32), "intrinsicContentSize");
          objc_msgSend(v10, "setMaximumLayoutSize:", 100.0, Height);
          objc_msgSend(v10, "setMinimumLayoutSize:", 100.0, 1.79769313e308);
          +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v3 = v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "addArrangedSubview:", v4, v13);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "cardSectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didInvalidateSizeAnimate:", 1);
  }
  else
  {
    objc_msgSend(v4, "setAlpha:", 0.0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__SearchUIButtonsView_initWithCardSectionView___block_invoke_2;
    v14[3] = &unk_1EA1F62F0;
    v15 = v4;
    +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v14);
    v12 = v15;
  }

}

uint64_t __47__SearchUIButtonsView_initWithCardSectionView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)fetchButtonsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SearchUIButtonsView cardSectionView](self, "cardSectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", objc_msgSend(v6, "watchListItemType"), objc_msgSend(v6, "isMediaContainer"));
  objc_msgSend(v6, "watchListIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1EA1F6CF0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  +[SearchUIWatchListUtilities fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:](SearchUIWatchListUtilities, "fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:", v8, v7, 0, v10);

}

void __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_1EA1F7BC0;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v17 = v7;
  v18 = v8;
  v19 = v9;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v16);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "cardSectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "feedbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C388]), "initWithError:", v6);
      objc_msgSend(*(id *)(a1 + 32), "cardSectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "feedbackDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didErrorOccur:", v13);

    }
  }

}

void __57__SearchUIButtonsView_fetchButtonsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  SearchUIMovieCardSectionUpNextButtonView *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "watchListState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = [SearchUIMovieCardSectionUpNextButtonView alloc];
          objc_msgSend(v7, "watchListState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isWatchListed");
          objc_msgSend(*(id *)(a1 + 40), "cardSectionView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SearchUIMovieCardSectionUpNextButtonView initIsInUpNext:cardSectionView:](v9, "initIsInUpNext:cardSectionView:", v11, v12);
        }
        else
        {
          v14 = *(void **)(a1 + 40);
          objc_msgSend(v7, "title");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "subtitle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "punchoutURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "buttonWithTitle:subtitle:punchoutURL:", v10, v12, v15);
          v13 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v2, "addObject:", v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  SearchUIMovieCardSectionBuyButtonView *v11;
  void *v12;
  void *v13;
  void *v14;
  SearchUIMovieCardSectionBuyButtonView *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [SearchUIMovieCardSectionBuyButtonView alloc];
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIButtonsView cardSectionView](self, "cardSectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SearchUIMovieCardSectionBuyButtonView initWithTitle:subtitle:punchout:cardSectionView:](v11, "initWithTitle:subtitle:punchout:cardSectionView:", v10, v12, v13, v14);

  return v15;
}

- (SearchUIMovieCardSectionView)cardSectionView
{
  return (SearchUIMovieCardSectionView *)objc_loadWeakRetained((id *)&self->_cardSectionView);
}

- (void)setCardSectionView:(id)a3
{
  objc_storeWeak((id *)&self->_cardSectionView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionView);
}

@end
