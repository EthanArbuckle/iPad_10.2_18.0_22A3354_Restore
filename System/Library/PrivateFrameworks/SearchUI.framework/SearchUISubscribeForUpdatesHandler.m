@implementation SearchUISubscribeForUpdatesHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "rowModelViewDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICommandHandler rowModel](self, "rowModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewForRowModel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "cardSectionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "toggleStateWithDetailedSectionView:", v10);

    }
  }

}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

@end
