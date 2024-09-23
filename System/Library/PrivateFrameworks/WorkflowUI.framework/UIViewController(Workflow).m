@implementation UIViewController(Workflow)

- (uint64_t)wf_showSearchBarAboveScrollView:()Workflow
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  CGRect v18;

  v4 = a3;
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeAreaInsets");
  v13 = v12;
  objc_msgSend(v11, "bounds");
  if (CGRectGetHeight(v18) != 0.0 || (v8 == -v13 ? (v14 = v13 <= 64.0) : (v14 = 1), v14))
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "wf_scrollToTopAnimated:", 0);
    objc_msgSend(v4, "adjustedContentInset");
    objc_msgSend(v4, "setContentOffset:", v6, -v15);
    v16 = 1;
  }

  return v16;
}

- (double)wf_contentLayoutMargins
{
  void *v2;
  double v3;
  double v4;
  void *v5;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;

  if (objc_msgSend(a1, "viewRespectsSystemMinimumLayoutMargins"))
  {
    objc_msgSend(a1, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");

  }
  return v4;
}

- (void)wf_applyContentLayoutMarginsToNavigationController
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a1, "wf_contentLayoutMargins");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreservesSuperviewLayoutMargins:", 0);

  objc_msgSend(a1, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLayoutMargins:", v3, v5, v7, v9);

  objc_msgSend(a1, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreservesSuperviewLayoutMargins:", 0);

  objc_msgSend(a1, "navigationItem");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "searchController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLayoutMargins:", v3, v5, v7, v9);

}

@end
