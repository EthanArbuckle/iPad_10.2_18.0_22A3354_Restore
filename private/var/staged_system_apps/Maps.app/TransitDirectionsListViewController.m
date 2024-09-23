@implementation TransitDirectionsListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class(TransitDirectionsStepsListDataSource, a2);
}

- (TransitDirectionsListViewController)init
{
  TransitDirectionsListViewController *v2;
  TransitDirectionsListViewController *v3;
  TransitDirectionsStepsListDataSource *v4;
  TransitDirectionsStepsListDataSource *dataSource;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsListViewController;
  v2 = -[TransitDirectionsListViewController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (TransitDirectionsStepsListDataSource *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(v2), "dataSourceClass"));
    dataSource = v3->_dataSource;
    v3->_dataSource = v4;

  }
  return v3;
}

- (TransitDirectionsListViewController)initWithRoute:(id)a3
{
  return -[TransitDirectionsListViewController initWithRoute:forNavigation:](self, "initWithRoute:forNavigation:", a3, 0);
}

- (TransitDirectionsListViewController)initWithRoute:(id)a3 forNavigation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  TransitDirectionsListViewController *v7;
  TransitDirectionsListViewController *v8;
  TransitDirectionsStepsListDataSource *dataSource;

  v4 = a4;
  v6 = a3;
  v7 = -[TransitDirectionsListViewController init](self, "init");
  v8 = v7;
  if (v7)
  {
    dataSource = v7->_dataSource;
    if (v4)
    {
      -[TransitDirectionsStepsListDataSource setEnableNavigationUpdates:](dataSource, "setEnableNavigationUpdates:", 1);
      -[TransitDirectionsStepsListDataSource setAllowStepSelection:](v8->_dataSource, "setAllowStepSelection:", 1);
    }
    else
    {
      -[TransitDirectionsStepsListDataSource setRoute:](dataSource, "setRoute:", v6);
    }
  }

  return v8;
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));

  return (GEOComposedRoute *)v3;
}

- (void)setRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController route](self, "route"));

  v5 = v6;
  if (v4 != v6)
  {
    -[TransitDirectionsStepsListDataSource setRoute:](self->_dataSource, "setRoute:", v6);
    v5 = v6;
  }

}

- (UIScrollViewDelegate)scrollViewDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollViewDelegate"));

  return (UIScrollViewDelegate *)v3;
}

- (void)setScrollViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "setScrollViewDelegate:", v4);

}

- (BOOL)showsHairline
{
  return 0;
}

- (UIScrollView)scrollView
{
  -[TransitDirectionsListViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UIScrollView *)self->_listView;
}

- (void)loadView
{
  TransitDirectionsListView *v3;
  void *v4;
  TransitDirectionsListView *v5;
  void *v6;
  TransitDirectionsListView *listView;
  TransitDirectionsListView *v8;

  v3 = [TransitDirectionsListView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v5 = -[TransitDirectionsListView initWithFrame:](v3, "initWithFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TransitDirectionsListView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[TransitDirectionsListView setOpaque:](v5, "setOpaque:", 0);
  -[TransitDirectionsListView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[TransitDirectionsListView setLayoutMargins:](v5, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[TransitDirectionsListView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
  -[TransitDirectionsListView setClipsToBounds:](v5, "setClipsToBounds:", 1);
  listView = self->_listView;
  self->_listView = v5;
  v8 = v5;

  -[TransitDirectionsListViewController setView:](self, "setView:", self->_listView);
}

- (void)viewDidLoad
{
  TransitDirectionsListView *listView;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsListViewController;
  -[TransitDirectionsListViewController viewDidLoad](&v7, "viewDidLoad");
  -[TransitDirectionsListViewController setViewRespectsSystemMinimumLayoutMargins:](self, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  listView = self->_listView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "setListView:", listView);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  -[TransitDirectionsListView setListDelegate:](self->_listView, "setListDelegate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  -[TransitDirectionsListView setDataSource:](self->_listView, "setDataSource:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsListViewController;
  -[TransitDirectionsListViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TransitDirectionsListView becomeFirstResponder](self->_listView, "becomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[TransitDirectionsListView becomeFirstResponder](self->_listView, "becomeFirstResponder");
}

- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  NSDirectionalEdgeInsets result;

  *(_QWORD *)&v12 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((_QWORD *)&v12 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(_QWORD *)&v13 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((_QWORD *)&v13 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  v6 = objc_msgSend(v5, "shouldShowSeparatorForItemAtIndexPath:insets:", v4, &v12);

  if ((v6 & 1) == 0)
  {
    v7 = _UICollectionViewListSectionSeparatorInsetHidden[1];
    v12 = _UICollectionViewListSectionSeparatorInsetHidden[0];
    v13 = v7;
  }

  v9 = *((double *)&v12 + 1);
  v8 = *(double *)&v12;
  v11 = *((double *)&v13 + 1);
  v10 = *(double *)&v13;
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsListViewController;
  -[TransitDirectionsListViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = -[TransitDirectionsListViewController _shouldReloadForReferenceDateUpdates](self, "_shouldReloadForReferenceDateUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  objc_msgSend(v5, "setActive:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsListViewController;
  -[TransitDirectionsListViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "setActive:", 0);

}

- (BOOL)_shouldReloadForReferenceDateUpdates
{
  return 1;
}

- (void)_willBecomeCurrent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListViewController dataSource](self, "dataSource"));
  objc_msgSend(v2, "collapseAllItems");

}

- (void)_overrideListBackgroundAlpha:(double)a3
{
  -[TransitDirectionsListView setStepBackgroundAlpha:](self->_listView, "setStepBackgroundAlpha:", a3);
}

- (double)_heightOfFinalRow
{
  void *v2;
  void *v3;
  double Height;
  CGRect v6;
  CGRect v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView allStepViews](self->_listView, "allStepViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  objc_msgSend(v3, "bounds");
  Height = 0.0;
  if (CGRectGetHeight(v6) >= 0.0)
  {
    objc_msgSend(v3, "bounds");
    Height = CGRectGetHeight(v7);
  }

  return Height;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (TransitDirectionsStepsListDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end
