@implementation SearchUICombinedCollectionViewCell

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SearchUICombinedCardSectionsView *v9;
  void *v10;
  SearchUICombinedCardSectionsView *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUICombinedCollectionViewCell;
  -[SearchUICollectionViewCell updateWithRowModel:](&v14, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "snippetUICardSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SearchUICollectionViewCell setUseSystemSizing:](self, "setUseSystemSizing:", 1);
    objc_msgSend(v4, "snippetUICardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIContentConfigurator applyConfigurationTo:rowModel:cardSections:interactionDelegate:](SearchUIContentConfigurator, "applyConfigurationTo:rowModel:cardSections:interactionDelegate:", self, v4, v7, self);
  }
  else
  {
    -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRowModel:", v4);
    }
    else
    {
      v9 = [SearchUICombinedCardSectionsView alloc];
      -[SearchUICollectionViewCell delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SearchUICombinedCardSectionsView initWithRowModel:feedbackDelegate:](v9, "initWithRowModel:feedbackDelegate:", v4, v10);
      -[SearchUICombinedCollectionViewCell setCardSectionView:](self, "setCardSectionView:", v11);

      -[SearchUICombinedCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

      -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    }
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICombinedCollectionViewCell;
  v4 = a3;
  -[SearchUICollectionViewCell setDelegate:](&v6, sel_setDelegate_, v4);
  -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

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
  -[SearchUICombinedCollectionViewCell cardSectionView](self, "cardSectionView");
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
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:](SnippetUIUtilities, "createViewControllersForButtons:buttonFont:isCompact:sourceView:rowModel:delegate:completionHandler:", v12, v11, v6, self, v14, v13, v10);

}

- (void)performSFCommand:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities performSFCommand:rowModel:delegate:](SnippetUIUtilities, "performSFCommand:rowModel:delegate:", v4, v6, v5);

}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities emitInstrumentationEvent:delegate:](SnippetUIUtilities, "emitInstrumentationEvent:delegate:", v4, v5);

}

- (void)reportSFFeedback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SearchUICollectionViewCell rowModel](self, "rowModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "queryId");
  -[SearchUICollectionViewCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities reportFeedback:queryId:delegate:](SnippetUIUtilities, "reportFeedback:queryId:delegate:", v4, v5, v6);

}

- (id)presentingViewController
{
  void *v3;
  void *v4;

  -[SearchUICollectionViewCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SnippetUIUtilities presentingViewController:delegate:](SnippetUIUtilities, "presentingViewController:delegate:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SearchUICombinedCardSectionsView)cardSectionView
{
  return (SearchUICombinedCardSectionsView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCardSectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionView, 0);
}

@end
