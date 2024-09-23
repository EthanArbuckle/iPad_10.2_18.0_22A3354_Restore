@implementation SearchUIMovieCardSectionView

- (SearchUIMovieCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  SearchUIMovieCardSectionView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SearchUIButtonsView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  objc_super v32;

  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SearchUIMovieCardSectionView;
  v7 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v32, sel_initWithRowModel_feedbackDelegate_, v6, a4);
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v6, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumbnail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_5:
    v12 = (void *)objc_opt_new();
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __66__SearchUIMovieCardSectionView_initWithRowModel_feedbackDelegate___block_invoke;
    v29 = &unk_1EA1F6210;
    v30 = v8;
    v31 = v12;
    v14 = v12;
    objc_msgSend(v14, "performBatchUpdates:", &v26);
    -[SearchUICardSectionView contentView](v7, "contentView", v26, v27, v28, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addArrangedSubview:", v14);

    goto LABEL_6;
  }
  objc_msgSend(v8, "details");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v8, "watchListIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    v18 = -[SearchUIButtonsView initWithCardSectionView:]([SearchUIButtonsView alloc], "initWithCardSectionView:", v7);
    -[SearchUIButtonsView setLayoutMarginsRelativeArrangement:](v18, "setLayoutMarginsRelativeArrangement:", 1);
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", v7, 11.5);
    v22 = v21;
    +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
    -[SearchUIButtonsView setLayoutMargins:](v18, "setLayoutMargins:", 0.0, v20, v22, v23);
    -[SearchUICardSectionView contentView](v7, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addArrangedSubview:", v18);

  }
LABEL_9:

  return v7;
}

void __66__SearchUIMovieCardSectionView_initWithRowModel_feedbackDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setImage:", v6);

  }
  v7 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "details");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v13 = (void *)objc_opt_new();
        objc_msgSend(v12, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUITLKMultilineTextConverter textForSearchUIString:](SearchUITLKMultilineTextConverter, "textForSearchUIString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitle:", v15);

        v16 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v12, "content");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUITLKMultilineTextConverter textForSearchUIText:](SearchUITLKMultilineTextConverter, "textForSearchUIText:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "arrayWithObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDetails:", v19);

        objc_msgSend(v7, "addObject:", v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "setContents:", v7);
}

- (id)setupContentView
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setSpacing:", 4.0);
  return v2;
}

+ (id)dragTitleForCardSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n%@\n\n"), v11, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

@end
