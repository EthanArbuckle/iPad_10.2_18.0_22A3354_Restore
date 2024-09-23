@implementation NCModalNavigationController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCModalNavigationController;
  -[NCModalNavigationController viewDidLoad](&v4, sel_viewDidLoad);
  -[NCModalNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[NCModalNavigationController sheetPresentationController](self, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v3, "setPrefersGrabberVisible:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[NCModalNavigationController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[NCModalNavigationController presenterDelegate](self, "presenterDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "modalNavigationControllerDidDismiss:", self);

  }
  v6.receiver = self;
  v6.super_class = (Class)NCModalNavigationController;
  -[NCModalNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (NCModalNavigationControllerDelegate)presenterDelegate
{
  return (NCModalNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterDelegate);
}

@end
