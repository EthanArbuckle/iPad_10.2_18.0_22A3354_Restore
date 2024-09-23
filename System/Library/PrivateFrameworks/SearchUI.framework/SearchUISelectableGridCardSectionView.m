@implementation SearchUISelectableGridCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SearchUISelectableGridCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v14, sel_updateWithRowModel_, v4);

  objc_msgSend(v5, "entries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISelectableGridCardSectionView convertSFTitleSubtitleData:](self, "convertSFTitleSubtitleData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__SearchUISelectableGridCardSectionView_updateWithRowModel___block_invoke;
  v11[3] = &unk_1EA1F6518;
  v11[4] = self;
  v12 = v7;
  v13 = v5;
  v9 = v5;
  v10 = v7;
  objc_msgSend(v8, "performBatchUpdates:", v11);

}

void __60__SearchUISelectableGridCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTuples:", v2);

  objc_msgSend(*(id *)(a1 + 48), "initialSelectedIndex");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedIndex:", v4);

}

- (id)convertSFTitleSubtitleData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
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
        v11 = (void *)MEMORY[0x1E0DBD9E8];
        objc_msgSend(v10, "title", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "subtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tupleWithTitle:subtitle:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)selectableGridView:(id)a3 didChangeSelectedIndex:(int64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionViewDidSelectPreferredPunchoutIndex:", a4);

  }
}

@end
