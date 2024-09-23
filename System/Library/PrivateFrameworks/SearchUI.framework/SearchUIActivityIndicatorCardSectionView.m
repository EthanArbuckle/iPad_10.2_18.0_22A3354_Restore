@implementation SearchUIActivityIndicatorCardSectionView

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
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SearchUIActivityIndicatorCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v10, sel_updateWithRowModel_, v4);

  -[SearchUICardSectionView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SearchUIActivityIndicatorCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1EA1F6210;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBatchUpdates:", v8);

}

void __63__SearchUIActivityIndicatorCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DBD9C0];
  objc_msgSend(*(id *)(a1 + 40), "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v3);

}

@end
