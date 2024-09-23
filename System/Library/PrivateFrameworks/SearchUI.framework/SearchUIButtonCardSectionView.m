@implementation SearchUIButtonCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
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
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SearchUIButtonCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v9, sel_updateWithRowModel_, v4);

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

}

@end
