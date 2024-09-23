@implementation PKSpendingHighlightsViewController

- (PKSpendingHighlightsViewController)init
{
  id v3;
  PKSpendingHighlightsViewController *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v6.receiver = self;
  v6.super_class = (Class)PKSpendingHighlightsViewController;
  v4 = -[PKSpendingHighlightsViewController initWithCollectionViewLayout:](&v6, sel_initWithCollectionViewLayout_, v3);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSpendingHighlightsViewController;
  -[PKSpendingHighlightsViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKSpendingHighlightsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("FINHEALTH_INSIGHTS_HIGHTLIGHTS_VIEW_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  -[PKSpendingHighlightsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v5, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v5, "setBounces:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingHighlightsViewController;
  -[PKSpendingHighlightsViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKSpendingHighlightsViewController;
  -[PKSpendingHighlightsViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKSpendingHighlightsViewController;
  -[PKSpendingHighlightsViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

@end
