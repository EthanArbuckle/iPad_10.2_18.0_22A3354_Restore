@implementation ICNoteSearchViewControllerCollectionViewDelegate

- (ICNoteSearchViewControllerCollectionViewDelegate)initWithNoteSearchViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteSearchViewControllerCollectionViewDelegate;
  return -[ICNoteResultsViewControllerCollectionViewDelegate initWithNoteResultsViewController:](&v4, "initWithNoteResultsViewController:", a3);
}

- (ICNoteSearchViewController)noteSearchViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(ICNoteSearchViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewControllerCollectionViewDelegate noteResultsViewController](self, "noteResultsViewController"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (ICNoteSearchViewController *)v6;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v5));

  v10 = objc_opt_class(ICSearchResult);
  LOBYTE(v6) = objc_opt_isKindOfClass(v9, v10);

  return v6 & 1;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v5));

  v10 = objc_opt_class(ICSearchResult);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    v12 = objc_opt_class(ICSearchSuggestion);
    isKindOfClass = objc_opt_isKindOfClass(v9, v12);
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v5));

  v9 = objc_opt_class(ICSearchResult);
  if ((objc_opt_isKindOfClass(v12, v9) & 1) != 0)
  {
    -[ICNoteSearchViewControllerCollectionViewDelegate confirmSearchResultSelection:](self, "confirmSearchResultSelection:", v12);
  }
  else
  {
    v10 = objc_opt_class(ICSearchSuggestion);
    if ((objc_opt_isKindOfClass(v12, v10) & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
      objc_msgSend(v11, "processSelectedSearchSuggestion:", v12);

    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteSearchViewControllerCollectionViewDelegate collectionView:didSelectItemAtIndexPath:]", 1, 0, CFSTR("Unexpected item selected: %@"), v12);
    }
  }

}

- (void)confirmSearchResultSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerManager"));
  objc_msgSend(v6, "showSearchResult:animated:", v4, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewDiffableDataSource"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchViewControllerCollectionViewDelegate noteSearchViewController](self, "noteSearchViewController"));
  objc_msgSend(v10, "submitSearchResultSelectEventWithSearchResult:diffableDataSourceSnapshot:", v4, v11);

}

@end
