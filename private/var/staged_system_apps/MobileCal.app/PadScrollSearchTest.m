@implementation PadScrollSearchTest

- (id)scrollView
{
  return -[ListViewController tableView](self->_searchResultsController, "tableView");
}

- (void)navigateToScrollView
{
  void *v3;
  id v4;
  SearchResultsViewController *v5;
  SearchResultsViewController *searchResultsController;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest application](self, "application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));
  v4 = objc_msgSend(v3, "resetToDayView");
  v5 = (SearchResultsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "showSearchAnimated:becomeFirstResponder:completion:", 0, 0, 0));
  searchResultsController = self->_searchResultsController;
  self->_searchResultsController = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsController, 0);
}

@end
