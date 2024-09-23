@implementation SBTraitsOrientedResizableContentViewController

- (SBTraitsOrientedResizableContentViewController)initWithContentViewController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SBTraitsOrientedResizableContentViewController *v9;
  SBTraitsOrientedResizableContentViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTraitsOrientedResizableContentViewController;
  v9 = -[SBTraitsOrientedResizableContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delegate, a4);
    objc_storeStrong((id *)&v10->_contentViewController, a3);
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTraitsOrientedResizableContentViewController;
  -[SBTraitsOrientedResizableContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBTraitsOrientedResizableContentViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_contentViewController);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBTraitsOrientedResizableContentViewController;
  -[SBTraitsOrientedResizableContentViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[SBTraitsOrientedResizableContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "adjustedBoundsForContentViewBounds:", v5, v7, v9, v11);
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;
  }
  -[SBResizableContentViewControllerDelegate resizableContentViewController:didUpdateToBounds:](self->_delegate, "resizableContentViewController:didUpdateToBounds:", self, v5, v7, v9, v11);

}

- (id)contentViewController
{
  return self->_contentViewController;
}

- (SBResizableContentViewControllerGeometryDelegate)geometryDelegate
{
  return (SBResizableContentViewControllerGeometryDelegate *)objc_loadWeakRetained((id *)&self->_geometryDelegate);
}

- (void)setGeometryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_geometryDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
