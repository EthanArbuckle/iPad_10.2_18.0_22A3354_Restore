@implementation SearchUIStrokeAnimationCardSectionView

- (id)setupContentView
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0DAFEB0]);
  objc_msgSend(v3, "strokeViewWithDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SearchUIStrokeAnimationCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v15, sel_updateWithRowModel_, a3);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0DAFEA8]);
  objc_msgSend(v5, "characters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokeAnimationRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokeNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pronunciations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithCharacter:strokeAnimationRepresention:strokeNames:pronunciation:", v8, v9, v10, v12);

  -[SearchUICardSectionView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateWithData:", v13);

}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (void)animationDidStart
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D8C220]);
    -[SearchUICardSectionView section](self, "section");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v7, "initWithCardSection:destination:triggerEvent:actionCardType:", v8, 0, 2, 1);

    objc_msgSend(v10, "setActionTarget:", 4);
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didEngageCardSection:", v10);

  }
}

@end
