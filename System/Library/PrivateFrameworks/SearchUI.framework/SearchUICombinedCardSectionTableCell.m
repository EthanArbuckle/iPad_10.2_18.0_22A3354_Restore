@implementation SearchUICombinedCardSectionTableCell

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUICombinedCardSectionTableCell;
  -[SearchUITableViewCell updateWithRowModel:](&v14, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "snippetUICardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "snippetUICardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIContentConfigurator applyConfigurationTo:rowModel:cardSections:interactionDelegate:](SearchUIContentConfigurator, "applyConfigurationTo:rowModel:cardSections:interactionDelegate:", self, v4, v7, self);
  }
  else
  {
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      -[SearchUITableViewCell setSizingContainer:](self, "setSizingContainer:", v9);

      -[SearchUICombinedCardSectionTableCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[SearchUITableViewCell delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFeedbackDelegate:", v12);

    }
    -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRowModel:", v4);
  }

}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleArrangedSubviews");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v11, "count") == 2;
  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v11, "count") - 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v10, "updateChevronVisible:leaveSpaceForChevron:", v5, v4);
    }

    v8 = v11;
  }

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
