@implementation SearchUIShowStoreSheetHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5
    && (!v6 || objc_msgSend(v6, "requiresLocalMedia"))
    && objc_msgSend(v4, "type") == 1)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setStoreIdentifier:", v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  SearchUIStoreViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  SearchUIStoreViewController *v12;

  v6 = a4;
  v7 = a3;
  v8 = [SearchUIStoreViewController alloc];
  objc_msgSend(v7, "storeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "feedbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICommandHandler rowModel](self, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SearchUIStoreViewController initWithIdentifier:feedbackListener:queryId:](v8, "initWithIdentifier:feedbackListener:queryId:", v9, v10, objc_msgSend(v11, "queryId"));

  return v12;
}

- (unint64_t)destination
{
  return 8;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

@end
