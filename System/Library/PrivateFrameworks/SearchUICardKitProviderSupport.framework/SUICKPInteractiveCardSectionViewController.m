@implementation SUICKPInteractiveCardSectionViewController

+ (id)cardSectionClasses
{
  if (cardSectionClasses_onceToken != -1)
    dispatch_once(&cardSectionClasses_onceToken, &__block_literal_global);
  return (id)cardSectionClasses_cardSectionClasses;
}

void __64__SUICKPInteractiveCardSectionViewController_cardSectionClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)cardSectionClasses_cardSectionClasses;
  cardSectionClasses_cardSectionClasses = v3;

}

- (BOOL)_shouldRenderButtonOverlay
{
  void *v2;
  void *v3;
  char v4;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_expectsSearchUIView
{
  return 1;
}

- (void)didEngageCardSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v17, "cardSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionWithSFCardSection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionView:willProcessEngagementFeedback:", v9, v17);

  }
  if (objc_msgSend(v17, "actionTarget") != 4)
  {
    objc_msgSend(v17, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[CRKCardSectionViewController _performAllCommands](self, "_performAllCommands");
  }
  -[CRKCardSectionViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v17, "cardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cardSectionWithSFCardSection:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userDidEngageCardSection:withEngagementFeedback:", v16, v17);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SUICKPInteractiveCardSectionViewController;
  -[SUICKPInteractiveCardSectionViewController touchesBegan:withEvent:](&v20, sel_touchesBegan_withEvent_, v6, v7);
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backingCardSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICKPInteractiveCardSectionViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[SUICKPInteractiveCardSectionViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hitTest:withEvent:", v7, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && objc_msgSend(v9, "_SUICKPInteractiveCardSectionViewController_shouldHandlePunchout"))
    {
      -[SUICKPInteractiveCardSectionViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBackgroundColor:", v19);

      -[CRKCardSectionViewController _cardSectionTapped](self, "_cardSectionTapped");
    }

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUICKPInteractiveCardSectionViewController;
  -[SUICKPInteractiveCardSectionViewController touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  -[SUICKPInteractiveCardSectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUICKPInteractiveCardSectionViewController;
  -[SUICKPInteractiveCardSectionViewController touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, a3, a4);
  -[SUICKPInteractiveCardSectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

@end
