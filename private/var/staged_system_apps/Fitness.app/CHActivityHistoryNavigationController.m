@implementation CHActivityHistoryNavigationController

- (void)detachPalette
{
  _UINavigationControllerPalette *palette;

  -[CHActivityHistoryNavigationController detachPalette:](self, "detachPalette:", self->_palette);
  palette = self->_palette;
  self->_palette = 0;

}

- (CHActivityHistoryNavigationController)initWithDateCache:(id)a3 pauseRingsCoordinator:(id)a4
{
  id v7;
  id v8;
  CHActivityHistoryNavigationController *v9;
  CHActivityHistoryNavigationController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHActivityHistoryNavigationController;
  v9 = -[CHActivityHistoryNavigationController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a3);
    objc_storeStrong((id *)&v10->_pauseRingsCoordinator, a4);
  }

  return v10;
}

- (void)attachPaletteWithHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  _UINavigationControllerPalette *v8;
  _UINavigationControllerPalette *palette;
  PaletteViewController *paletteVC;
  CHPaletteViewControllerSizingDelegate *v11;
  PaletteViewController *v12;
  PaletteViewController *v13;
  _UINavigationControllerPalette *v14;
  void *v15;
  void *v16;

  if (!self->_palette)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivityHistoryNavigationController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;

    v8 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue(-[CHActivityHistoryNavigationController paletteForEdge:size:](self, "paletteForEdge:size:", 2, v7, a3));
    palette = self->_palette;
    self->_palette = v8;

    paletteVC = self->_paletteVC;
    if (!paletteVC)
    {
      v11 = objc_alloc_init(CHPaletteViewControllerSizingDelegate);
      -[CHPaletteViewControllerSizingDelegate setView:](v11, "setView:", self->_palette);
      v12 = -[PaletteViewController initWithSizingDelegate:dateProvider:pauseRingsCoordinator:]([PaletteViewController alloc], "initWithSizingDelegate:dateProvider:pauseRingsCoordinator:", v11, self->_dateCache, self->_pauseRingsCoordinator);
      v13 = self->_paletteVC;
      self->_paletteVC = v12;

      paletteVC = self->_paletteVC;
    }
    v14 = self->_palette;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteViewController view](paletteVC, "view"));
    -[_UINavigationControllerPalette addSubview:](v14, "addSubview:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PaletteViewController view](self->_paletteVC, "view"));
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, v7, a3);

    -[CHActivityHistoryNavigationController attachPalette:isPinned:](self, "attachPalette:isPinned:", self->_palette, 1);
  }
}

- (void)reattachPaletteIfNeededExpanded:(BOOL)a3
{
  _BOOL8 v3;
  _UINavigationControllerPalette *palette;
  double v6;

  v3 = a3;
  if (self->_palette)
  {
    -[CHActivityHistoryNavigationController detachPalette:](self, "detachPalette:");
    palette = self->_palette;
    self->_palette = 0;

  }
  v6 = 70.0;
  if (!v3)
    v6 = 20.0;
  -[CHActivityHistoryNavigationController attachPaletteWithHeight:](self, "attachPaletteWithHeight:", v6);
  -[CHActivityHistoryNavigationController setPaletteExpanded:](self, "setPaletteExpanded:", v3);
}

- (void)setPaletteExpanded:(BOOL)a3
{
  -[PaletteViewController setIsExpanded:collapseDayMarkers:](self->_paletteVC, "setIsExpanded:collapseDayMarkers:", a3, 0);
}

- (void)scrollToTop
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivityHistoryNavigationController topViewController](self, "topViewController"));
  v4 = objc_opt_respondsToSelector(v3, "scrollToTop");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CHActivityHistoryNavigationController topViewController](self, "topViewController"));
    objc_msgSend(v5, "performSelector:", "scrollToTop");

  }
}

- (PaletteViewController)paletteVC
{
  return self->_paletteVC;
}

- (void)setPaletteVC:(id)a3
{
  objc_storeStrong((id *)&self->_paletteVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteVC, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end
