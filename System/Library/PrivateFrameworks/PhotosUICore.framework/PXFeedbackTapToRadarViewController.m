@implementation PXFeedbackTapToRadarViewController

void __54___PXFeedbackTapToRadarViewController_fileRadarButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didSelectFileRadarButton");

}

- (PXFeedbackTapToRadarViewController)init
{
  PXFeedbackTapToRadarViewController *v2;
  _PXFeedbackTapToRadarViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedbackTapToRadarViewController;
  v2 = -[PXFeedbackTapToRadarViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PXFeedbackTapToRadarViewController);
    -[_PXFeedbackTapToRadarViewController setDelegate:](v3, "setDelegate:", v2);
    -[PXFeedbackTapToRadarViewController pushViewController:animated:](v2, "pushViewController:animated:", v3, 0);

  }
  return v2;
}

- (void)didSelectFileRadarButtonWithScreenshotAllowed:(BOOL)a3 attachDiagnose:(BOOL)a4 selectedRoute:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _BOOL8, _BOOL8, id);

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[PXFeedbackTapToRadarViewController fileRadarHandler](self, "fileRadarHandler");
  v9 = (void (**)(id, _BOOL8, _BOOL8, id))objc_claimAutoreleasedReturnValue();
  v9[2](v9, v6, v5, v8);

}

- (id)fileRadarHandler
{
  return self->_fileRadarHandler;
}

- (void)setFileRadarHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (BOOL)requestScreenshotPermission
{
  return self->_requestScreenshotPermission;
}

- (void)setRequestScreenshotPermission:(BOOL)a3
{
  self->_requestScreenshotPermission = a3;
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (NSString)routesDescription
{
  return self->_routesDescription;
}

- (void)setRoutesDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (_PXFeedbackTapToRadarViewController)feedbackViewController
{
  return self->_feedbackViewController;
}

- (void)setFeedbackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackViewController, 0);
  objc_storeStrong((id *)&self->_routesDescription, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong(&self->_fileRadarHandler, 0);
}

@end
