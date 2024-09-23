@implementation CACElementNamesOverlayViewController

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setItemBackgroundViewCreationHandler:", &__block_literal_global_12);
  objc_msgSend(v5, "setStyleProvider:", v3);
  CACLogGeneral();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoggingFacility:", v4);

  -[CACElementNamesOverlayViewController setView:](self, "setView:", v5);
}

id __48__CACElementNamesOverlayViewController_loadView__block_invoke()
{
  return (id)objc_opt_new();
}

- (void)setItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACElementNamesOverlayViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v4);

}

- (NSArray)items
{
  void *v2;
  void *v3;

  -[CACElementNamesOverlayViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
