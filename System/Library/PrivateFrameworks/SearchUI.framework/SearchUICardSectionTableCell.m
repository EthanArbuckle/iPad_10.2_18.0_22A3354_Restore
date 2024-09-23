@implementation SearchUICardSectionTableCell

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionTableCell;
  v4 = a3;
  -[SearchUITableViewCell setDelegate:](&v6, sel_setDelegate_, v4);
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchUICardSectionTableCell;
  -[SearchUITableViewCell updateWithRowModel:](&v11, sel_updateWithRowModel_, v4);
  if (+[SearchUIContentConfigurator supportsConfigurationFor:](SearchUIContentConfigurator, "supportsConfigurationFor:", v4))
  {
    +[SearchUIContentConfigurator applyConfigurationTo:rowModel:interactionDelegate:](SearchUIContentConfigurator, "applyConfigurationTo:rowModel:interactionDelegate:", self, v4, self);
    -[SearchUICardSectionTableCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClipsToBounds:", 1);
  }
  else
  {
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SearchUITableViewCell delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICardSectionCreator cardSectionViewForModel:feedbackDelegate:](SearchUICardSectionCreator, "cardSectionViewForModel:feedbackDelegate:", v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUITableViewCell setSizingContainer:](self, "setSizingContainer:", v8);

      -[SearchUICardSectionTableCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);

    }
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithRowModel:", v4);
  }

}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateChevronVisible:leaveSpaceForChevron:", v5, v4);

}

- (void)tabKeyPressed
{
  id v2;

  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabKeyPressed");

}

- (id)leadingView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionTableCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leadingTextView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionTableCell cardSectionView](self, "cardSectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)createStyledButtons:(id)a3 buttonFont:(id)a4 isCompact:(BOOL)a5 :(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUITableViewCell delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:](SnippetUIUtilities, "createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:", v12, v11, v6, self, v14, v13, v10);

}

- (void)performSFCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUITableViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities performSFCommand:rowModel:delegate:](SnippetUIUtilities, "performSFCommand:rowModel:delegate:", v4, v6, v5);

}

- (void)reportSFFeedback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SearchUITableViewCell rowModel](self, "rowModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "queryId");
  -[SearchUITableViewCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities reportFeedback:queryId:delegate:](SnippetUIUtilities, "reportFeedback:queryId:delegate:", v4, v5, v6);

}

- (id)presentingViewController
{
  void *v3;
  void *v4;

  -[SearchUITableViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities presentingViewController:delegate:](SnippetUIUtilities, "presentingViewController:delegate:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
