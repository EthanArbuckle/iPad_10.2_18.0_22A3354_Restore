@implementation SBHBorrowedIconView

- (void)configureBorrowingIconImageViewFromIconView:(id)a3
{
  id v4;
  BSInvalidatable *v5;
  BSInvalidatable *borrowingAssertion;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "borrowIconImageViewWithOptions:", 1);
  v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  borrowingAssertion = self->_borrowingAssertion;
  self->_borrowingAssertion = v5;

  objc_msgSend(v4, "customIconImageViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_removeChildViewController:", v9);

  -[SBIconView setOverrideCustomIconImageViewController:](self, "setOverrideCustomIconImageViewController:", v9);
  objc_msgSend(v4, "configureMatchingIconView:", self);
  objc_msgSend(v4, "accessibilityTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconView setAccessibilityTintColor:](self, "setAccessibilityTintColor:", v8);
}

- (void)invalidate
{
  void *v3;

  -[SBIconView setIcon:](self, "setIcon:", 0);
  -[SBIconView setOverrideCustomIconImageViewController:](self, "setOverrideCustomIconImageViewController:", 0);
  -[SBHBorrowedIconView borrowingAssertion](self, "borrowingAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBHBorrowedIconView setBorrowingAssertion:](self, "setBorrowingAssertion:", 0);
}

- (BSInvalidatable)borrowingAssertion
{
  return self->_borrowingAssertion;
}

- (void)setBorrowingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_borrowingAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borrowingAssertion, 0);
}

@end
