@implementation CACLabeledGridOverlayViewController

- (void)loadView
{
  CACLabeledGridOverlayView *v3;
  void *v4;
  CACLabeledGridOverlayView *v5;
  CACLabeledGridOverlayView *gridOverlayView;

  v3 = [CACLabeledGridOverlayView alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CACLabeledGridOverlayView initWithFrame:](v3, "initWithFrame:");
  gridOverlayView = self->_gridOverlayView;
  self->_gridOverlayView = v5;

  -[CACLabeledGridOverlayViewController setView:](self, "setView:", self->_gridOverlayView);
}

- (void)setShowsNumbersInTopLeft:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsNumbersInTopLeft:", v3);

}

- (BOOL)showsNumbersInTopLeft
{
  void *v2;
  char v3;

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsNumbersInTopLeft");

  return v3;
}

- (BOOL)isSmallEnoughForZooming
{
  void *v2;
  char v3;

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSmallEnoughForZooming");

  return v3;
}

- (void)show
{
  id v2;

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");

}

- (void)hide
{
  id v2;

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

- (void)setLabeledElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLabeledElements");

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowsElementsAsClickable:", -[CACLabeledGridOverlayViewController showsElementsAsClickable](self, "showsElementsAsClickable"));

  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLabeledElements:", v4);

}

- (void)zoomOverRegion:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CACLabeledGridOverlayViewController gridOverlayView](self, "gridOverlayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoomOverRect:", x, y, width, height);

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

- (BOOL)showsElementsAsClickable
{
  return self->_showsElementsAsClickable;
}

- (void)setShowsElementsAsClickable:(BOOL)a3
{
  self->_showsElementsAsClickable = a3;
}

- (CACLabeledGridOverlayView)gridOverlayView
{
  return self->_gridOverlayView;
}

- (void)setGridOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_gridOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridOverlayView, 0);
}

@end
