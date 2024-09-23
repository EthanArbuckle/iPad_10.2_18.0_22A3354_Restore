@implementation SearchUIShowCardHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "nextCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setCard:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "feedbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "card");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "presentViewControllerForCard:animate:", v11, 1);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SearchUIShowCardHandler;
    -[SearchUICommandHandler performCommand:triggerEvent:environment:](&v12, sel_performCommand_triggerEvent_environment_, v9, a4, v8);

  }
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  SearchUICardViewController *v8;
  void *v9;
  SearchUICardViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v5 = a4;
  objc_msgSend(a3, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "queryId");
  if (!v7)
    v7 = objc_msgSend(v5, "queryId");
  objc_msgSend(v6, "setQueryId:", v7);
  v8 = [SearchUICardViewController alloc];
  objc_msgSend(v5, "feedbackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SearchUICardViewController initWithCard:feedbackListener:](v8, "initWithCard:feedbackListener:", v6, v9);

  objc_msgSend(v5, "commandDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController setCommandDelegate:](v10, "setCommandDelegate:", v11);

  objc_msgSend(v5, "cardViewDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController setDelegate:](v10, "setDelegate:", v12);

  -[SearchUICardViewController title](v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SearchUICardViewController setTitle:](v10, "setTitle:", v13);
  }
  else
  {
    objc_msgSend(v5, "sectionTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardViewController setTitle:](v10, "setTitle:", v14);

  }
  objc_msgSend(v5, "resultsViewDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardViewController tableViewController](v10, "tableViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setResultsViewDelegate:", v15);

  -[SearchUICardViewController setThreeDTouchEnabled:](v10, "setThreeDTouchEnabled:", objc_msgSend(v5, "threeDTouchEnabled"));
  objc_msgSend(v5, "presentingViewController");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        -[SearchUICardViewController setLevel:](v10, "setLevel:", objc_msgSend(v19, "level") + 1);
        -[SearchUICardViewController delegate](v10, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[SearchUICardViewController setDelegate:](v10, "setDelegate:", v20);
        }
        else
        {
          objc_msgSend(v19, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUICardViewController setDelegate:](v10, "setDelegate:", v21);

        }
      }
      objc_msgSend(v18, "parentViewController");
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v22;
    }
    while (v22);
  }

  return v10;
}

- (void)prepareViewController:(id)a3 forTriggerEvent:(unint64_t)a4
{
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  -[SearchUICommandHandler environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldUseInsetRoundedSections");
  if (a4 == 5)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v18, "setShouldUseInsetRoundedSections:", v8);
  objc_msgSend(v18, "tableViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", a4 != 5);

  objc_msgSend(v18, "setInPreviewPlatter:", a4 == 5);
  if (a4 == 5)
  {
    objc_msgSend(v6, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v11 = objc_msgSend(v10, "preferredUserInterfaceStyle");
      if (v11)
        break;
      objc_msgSend(v10, "parentViewController");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    while (v12);
    objc_msgSend(v6, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_vibrancy");

  }
  else
  {
    v11 = 0;
    v16 = -1;
  }
  objc_msgSend(v18, "setOverrideUserInterfaceStyle:", v11);
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setOverrideVibrancyTrait:", v16);

}

- (unint64_t)destination
{
  return 1;
}

@end
