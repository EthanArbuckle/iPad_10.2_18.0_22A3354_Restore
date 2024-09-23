@implementation PKDataReleaseViewController

- (PKDataReleaseViewController)initWithRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKDataReleaseContentViewController *v8;
  PKCompactNavigationContainedNavigationController *v9;
  PKDataReleaseViewController *v10;
  id *p_isa;
  PKDataReleaseViewController *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = -[PKDataReleaseContentViewController initWithRequest:delegate:]([PKDataReleaseContentViewController alloc], "initWithRequest:delegate:", v7, self);

  if (v8)
  {
    v9 = -[PKCompactNavigationContainedNavigationController initWithStyle:]([PKCompactNavigationContainedNavigationController alloc], "initWithStyle:", 2);
    -[PKCompactNavigationContainedNavigationController pushViewController:animated:](v9, "pushViewController:animated:", v8, 0);
    v14.receiver = self;
    v14.super_class = (Class)PKDataReleaseViewController;
    v10 = -[PKCompactNavigationContainerController initWithNavigationController:](&v14, sel_initWithNavigationController_, v9);
    p_isa = (id *)&v10->super.super.super.super.super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_vc, v8);
      objc_storeWeak(p_isa + 167, v6);
      objc_msgSend(p_isa, "setDelegate:", v6);
    }
    self = p_isa;

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseViewController;
  -[PKCompactNavigationContainerController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKDataReleaseViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  if (PKUserIntentIsAvailable())
  {
    v6 = objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle");
    if (v6 == 1)
    {
      -[PKPaymentAuthorizationServiceCompactNavigationContainerController physicalButtonView](self, "physicalButtonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("PRESENTMENT_PUSH_BUTTON_TWO_LINE"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInstruction:", v8);

    }
    -[PKDataReleaseViewController _updateExclustionRectWithButtonPresent:](self, "_updateExclustionRectWithButtonPresent:", v6 == 1);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseViewController;
  -[PKCompactNavigationContainerController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[PKDataReleaseViewController isBeingDismissed](self, "isBeingDismissed"))
    -[PKDataReleaseViewController _updatePhysicalButtonWithVC:](self, "_updatePhysicalButtonWithVC:", self->_vc);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dataReleaseContentViewController:(id)a3 didAuthorizeWithExternalAuthorizationData:(id)a4 dataToRelease:(id)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataReleaseViewController:didAuthorizeWithExternalAuthorizationData:dataToRelease:", self, v9, v7);

}

- (void)dataReleaseContentViewController:(id)a3 didFinishWithError:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "dataReleaseViewController:didFinishWithError:", self, v7);
  }
  else
  {
    -[PKDataReleaseViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)dataReleaseContentViewController:(id)a3 didResolveToMerchant:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataReleaseDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataReleaseViewController:didResolveToMerchant:", self, v6);

}

- (void)_updatePhysicalButtonWithVC:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (PKUserIntentIsAvailable())
  {
    if ((objc_msgSend(v5, "shouldShowPhysicalButton") & 1) != 0)
    {
      v4 = -[PKDataReleaseViewController isBeingDismissed](self, "isBeingDismissed") ^ 1;
      if (-[PKPaymentAuthorizationServiceCompactNavigationContainerController showPhysicalButtonIndicator](self, "showPhysicalButtonIndicator") == (_DWORD)v4)goto LABEL_8;
      goto LABEL_7;
    }
    if (-[PKPaymentAuthorizationServiceCompactNavigationContainerController showPhysicalButtonIndicator](self, "showPhysicalButtonIndicator"))
    {
      v4 = 0;
LABEL_7:
      -[PKPaymentAuthorizationServiceCompactNavigationContainerController setShowPhysicalButtonIndicator:](self, "setShowPhysicalButtonIndicator:", v4);
      -[PKDataReleaseViewController _updateExclustionRectWithButtonPresent:](self, "_updateExclustionRectWithButtonPresent:", v4);
    }
  }
LABEL_8:

}

- (void)_updateExclustionRectWithButtonPresent:(BOOL)a3
{
  void *v5;
  id v6;

  if (-[PKDataReleaseViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fixedCoordinateSpace");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "bounds");
      LAUIPhysicalButtonNormalizedFrame();
      PKRectRoundToPixel();
      -[PKCompactNavigationContainerController setExclusionRect:withCoordinateSpace:](self, "setExclusionRect:withCoordinateSpace:", v6);

    }
    else
    {
      -[PKCompactNavigationContainerController setExclusionRect:withCoordinateSpace:](self, "setExclusionRect:withCoordinateSpace:", 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }
  }
}

- (void)dataReleaseCompletedWithError:(id)a3
{
  -[PKDataReleaseContentViewController dataReleaseCompletedWithError:](self->_vc, "dataReleaseCompletedWithError:", a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
  objc_destroyWeak((id *)&self->_dataReleaseDelegate);
}

@end
