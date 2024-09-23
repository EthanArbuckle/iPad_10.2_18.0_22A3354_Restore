@implementation PKPaymentAuthorizationPresentationTarget

- (void)presentPendingViewControllerIfNecessary
{
  UIViewController **p_presentingViewController;
  id WeakRetained;
  UIViewController *viewControllerToPresent;
  id v6;
  UIViewController *v7;

  p_presentingViewController = &self->_presentingViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    viewControllerToPresent = self->_viewControllerToPresent;

    if (viewControllerToPresent)
    {
      v6 = objc_loadWeakRetained((id *)p_presentingViewController);
      objc_msgSend(v6, "presentViewController:animated:completion:", self->_viewControllerToPresent, self->_shouldAnimatePresentation, self->_presentationCompletion);

      v7 = self->_viewControllerToPresent;
      self->_viewControllerToPresent = 0;

    }
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id presentationCompletion;

  objc_storeStrong((id *)&self->_viewControllerToPresent, a3);
  v9 = a3;
  v10 = a5;
  self->_shouldAnimatePresentation = a4;
  v11 = _Block_copy(v10);

  presentationCompletion = self->_presentationCompletion;
  self->_presentationCompletion = v11;

  -[PKPaymentAuthorizationPresentationTarget presentPendingViewControllerIfNecessary](self, "presentPendingViewControllerIfNecessary");
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  void (**v8)(void);

  v4 = a3;
  v8 = (void (**)(void))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", v4, v8);
  }
  else if (v8)
  {
    v8[2]();
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIViewController)viewControllerToPresent
{
  return self->_viewControllerToPresent;
}

- (void)setViewControllerToPresent:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerToPresent, a3);
}

- (BOOL)shouldAnimatePresentation
{
  return self->_shouldAnimatePresentation;
}

- (void)setShouldAnimatePresentation:(BOOL)a3
{
  self->_shouldAnimatePresentation = a3;
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresent, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
