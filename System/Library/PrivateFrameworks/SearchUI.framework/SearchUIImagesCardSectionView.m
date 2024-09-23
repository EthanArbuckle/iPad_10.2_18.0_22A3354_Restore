@implementation SearchUIImagesCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "borderless") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SearchUIImagesCardSectionView;
    v6 = objc_msgSendSuper2(&v8, sel_fillsBackgroundWithContentForRowModel_, v4);
  }

  return v6;
}

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIImagesCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v10, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SearchUIImagesCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1EA1F6210;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBatchUpdates:", v8);

}

void __52__SearchUIImagesCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "images");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imagesForSFImages:](SearchUITLKImageConverter, "imagesForSFImages:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImages:", v3);

  v5 = objc_msgSend(*(id *)(a1 + 40), "borderless");
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPaddingDisabled:", v5);

}

@end
