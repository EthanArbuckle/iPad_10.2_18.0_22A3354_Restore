@implementation SearchUIWatchListCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIWatchListCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v5, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "setDelegate:", self, v5.receiver, v5.super_class);
  -[SearchUIWatchListCardSectionView didUpdateRowModel:animate:](self, "didUpdateRowModel:animate:", v4, 0);

}

- (void)didUpdateRowModel:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a4;
  v6 = a3;
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (objc_msgSend(v6, "hasError"))
    {
      -[SearchUICardSectionView requestRemovalFromEnclosingView](self, "requestRemovalFromEnclosingView");
    }
    else if (objc_msgSend(v6, "hasLoaded"))
    {
      objc_msgSend(v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subtitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIWatchListCardSectionView updateTitle:subtitle:image:](self, "updateTitle:subtitle:image:", v8, v9, v10);

      -[SearchUIWatchListCardSectionView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__SearchUIWatchListCardSectionView_didUpdateRowModel_animate___block_invoke;
      v13[3] = &unk_1EA1F62F0;
      v13[4] = self;
      +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v13, v4);
    }
    else
    {
      -[SearchUIWatchListCardSectionView setAlpha:](self, "setAlpha:", 0.0);
      v12 = (void *)objc_opt_new();
      +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", 2);
      objc_msgSend(v12, "setSize:");
      -[SearchUIWatchListCardSectionView updateTitle:subtitle:image:](self, "updateTitle:subtitle:image:", &stru_1EA1FB118, &stru_1EA1FB118, v12);

    }
  }

}

uint64_t __62__SearchUIWatchListCardSectionView_didUpdateRowModel_animate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SearchUICardSectionView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__SearchUIWatchListCardSectionView_updateTitle_subtitle_image___block_invoke;
  v15[3] = &unk_1EA1F79A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBatchUpdates:", v15);

}

void __63__SearchUIWatchListCardSectionView_updateTitle_subtitle_image___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DBD9D8], "textWithString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeadingTitle:", v2);

  objc_msgSend(MEMORY[0x1E0DBD9D8], "textWithString:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeadingSubtitle:", v4);

  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v6, 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeadingImage:", v7);

  }
}

@end
