@implementation SiriUILegacyStocksChartCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken != -1)
    dispatch_once(&cardSectionClasses_onceToken, &__block_literal_global_10);
  return (id)cardSectionClasses_cardSectionClasses;
}

void __70__SiriUILegacyStocksChartCardSectionViewController_cardSectionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cardSectionClasses_cardSectionClasses;
  cardSectionClasses_cardSectionClasses = v0;

}

- (void)_loadCardSectionView
{
  SiriUICardSectionView *v3;
  SiriUICardSectionView *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  SiriUISnippetViewController *v14;
  SiriUISnippetViewController *snippetViewController;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = [SiriUICardSectionView alloc];
  v4 = -[SiriUICardSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SiriUILegacyStocksChartCardSectionViewController setView:](self, "setView:", v4);

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BE817C0]);
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v6, "chartData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);
  objc_msgSend(v7, "setChartData:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BE817C8]);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStocks:", v12);

  +[SiriUISnippetManager sharedInstance](SiriUISnippetManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "snippetViewControllerForSnippet:", v11);
  v14 = (SiriUISnippetViewController *)objc_claimAutoreleasedReturnValue();
  snippetViewController = self->_snippetViewController;
  self->_snippetViewController = v14;

  -[SiriUILegacyStocksChartCardSectionViewController _updateContentSize](self, "_updateContentSize");
  -[SiriUILegacyStocksChartCardSectionViewController addChildViewController:](self, "addChildViewController:", self->_snippetViewController);
  -[SiriUILegacyStocksChartCardSectionViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISnippetViewController view](self->_snippetViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentView:", v17);

  -[SiriUISnippetViewController didMoveToParentViewController:](self->_snippetViewController, "didMoveToParentViewController:", self);
}

- (BOOL)_shouldRenderButtonOverlay
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUILegacyStocksChartCardSectionViewController;
  -[CRKCardSectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SiriUILegacyStocksChartCardSectionViewController _updateContentSize](self, "_updateContentSize");
}

- (void)_updateContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[CRKCardSectionViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingSizeForCardSectionViewController:", self);
  v5 = v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SiriUILegacyStocksChartCardSectionViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriUISnippetViewController desiredHeightForWidth:](self->_snippetViewController, "desiredHeightForWidth:", v5);
  }
  else
  {
    -[SiriUILegacyStocksChartCardSectionViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriUIBaseSnippetViewController desiredHeight](self->_snippetViewController, "desiredHeight");
  }
  objc_msgSend(v7, "setContentSize:", v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetViewController, 0);
}

@end
