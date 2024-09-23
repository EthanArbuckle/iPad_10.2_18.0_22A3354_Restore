@implementation SearchUIHorizontalDetailedCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)supportsCustomUserReportRequestAfforance
{
  return 1;
}

- (id)setupContentView
{
  SearchUIDetailedView *v3;
  void *v4;
  SearchUIDetailedView *v5;

  v3 = [SearchUIDetailedView alloc];
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SearchUIDetailedView initWithFeedbackDelegate:](v3, "initWithFeedbackDelegate:", v4);

  -[SearchUIDetailedView setIsVerticalAlignment:](v5, "setIsVerticalAlignment:", 1);
  -[SearchUIDetailedView setButtonDelegate:](v5, "setButtonDelegate:", self);
  return v5;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontalDetailedCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v6, sel_updateWithRowModel_, v4);
  -[SearchUICardSectionView contentView](self, "contentView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

}

- (void)setFeedbackDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIHorizontalDetailedCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView setFeedbackDelegate:](&v6, sel_setFeedbackDelegate_, v4);
  -[SearchUICardSectionView contentView](self, "contentView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

@end
