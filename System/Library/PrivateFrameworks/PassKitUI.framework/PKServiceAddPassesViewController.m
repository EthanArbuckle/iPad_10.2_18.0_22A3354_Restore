@implementation PKServiceAddPassesViewController

- (PKServiceAddPassesViewController)init
{
  PKServiceAddPassesViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPassesViewController;
  v2 = -[PKNavigationController init](&v5, sel_init);
  if (v2)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginAllowingBacklightRamping:", v2);

  }
  return v2;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PKServiceAddPassesViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)PKServiceAddPassesViewController;
  -[PKNavigationController dealloc](&v3, sel_dealloc);
}

- (void)addPassesCardStackViewController:(id)a3 didCancelAddingPasses:(id)a4
{
  -[PKServiceAddPassesViewController resetBrightness](self, "resetBrightness", a3, a4);
  -[PKServiceAddPassesViewController _ingestionDidFinishWithResult:](self, "_ingestionDidFinishWithResult:", 0);
}

- (void)issuerBindingViewController:(id)a3 didFinishWithPassesData:(id)a4
{
  -[PKServiceAddPassesViewController _setUpCardStackViewControllerWithPassDataArray:orPassesContainer:fromPresentationSource:shouldPushController:](self, "_setUpCardStackViewControllerWithPassDataArray:orPassesContainer:fromPresentationSource:shouldPushController:", a4, 0, 0, 1);
}

- (void)issuerBindingViewControllerDidCancel:(id)a3
{
  -[PKServiceAddPassesViewController resetBrightness](self, "resetBrightness", a3);
  -[PKServiceAddPassesViewController _ingestionDidFinishWithResult:](self, "_ingestionDidFinishWithResult:", 0);
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;
  CGSize v14;

  height = a3.height;
  width = a3.width;
  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.width = width;
    v14.height = height;
    NSStringFromCGSize(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);

  }
  PKSetDisplayProperties();
}

- (void)ingestPasses:(id)a3 orPassesContainer:(id)a4 orIssuerData:(id)a5 withSignature:(id)a6 fromPresentationSource:(unint64_t)a7
{
  unint64_t v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;

  v16 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v16 | v12)
  {
    -[PKServiceAddPassesViewController _setUpCardStackViewControllerWithPassDataArray:orPassesContainer:fromPresentationSource:shouldPushController:](self, "_setUpCardStackViewControllerWithPassDataArray:orPassesContainer:fromPresentationSource:shouldPushController:", v16, v12, a7, 0);
  }
  else if (v13 && v14)
  {
    -[PKServiceAddPassesViewController _setUpIssuerBindingViewControllerWithData:signature:fromPresentationSource:](self, "_setUpIssuerBindingViewControllerWithData:signature:fromPresentationSource:", v13, v14, a7);
  }
  else
  {
    -[PKServiceAddPassesViewController _ingestionDidFinishWithResult:](self, "_ingestionDidFinishWithResult:", 0);
  }

}

- (void)_dismissDelayed
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKServiceAddPassesViewController__dismissDelayed__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __51__PKServiceAddPassesViewController__dismissDelayed__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resetBrightness");
  return objc_msgSend(*(id *)(a1 + 32), "_ingestionDidFinishWithResult:", 1);
}

- (void)_setUpCardStackViewControllerWithPassDataArray:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5 shouldPushController:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  PKAddPassesCardStackViewController *v12;
  PKAddPassesCardStackViewController *cardStackViewController;
  PKAddPassesCardStackViewController *v14;
  void *v15;
  _QWORD v16[2];

  v6 = a6;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  v12 = -[PKAddPassesCardStackViewController initWithPasses:orPassesContainer:fromPresentationSource:]([PKAddPassesCardStackViewController alloc], "initWithPasses:orPassesContainer:fromPresentationSource:", v11, v10, a5);

  cardStackViewController = self->_cardStackViewController;
  self->_cardStackViewController = v12;

  v14 = self->_cardStackViewController;
  if (v14)
  {
    -[PKAddPassesCardStackViewController setDelegate:](v14, "setDelegate:", self);
    if (v6)
    {
      -[PKServiceAddPassesViewController pushViewController:animated:](self, "pushViewController:animated:", self->_cardStackViewController, 1);
    }
    else
    {
      v16[0] = self->_cardStackViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKServiceAddPassesViewController setViewControllers:animated:](self, "setViewControllers:animated:", v15, 0);

    }
  }
  else
  {
    -[PKServiceAddPassesViewController _ingestionDidFinishWithResult:](self, "_ingestionDidFinishWithResult:", 0);
  }
}

- (void)_setUpIssuerBindingViewControllerWithData:(id)a3 signature:(id)a4 fromPresentationSource:(unint64_t)a5
{
  id v8;
  id v9;
  PKIssuerBindingViewController *v10;
  PKIssuerBindingViewController *issuerBindingViewController;
  PKIssuerBindingViewController *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[PKServiceAddPassesViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  v10 = -[PKIssuerBindingViewController initWithIssuerData:signature:referralSource:]([PKIssuerBindingViewController alloc], "initWithIssuerData:signature:referralSource:", v9, v8, a5);

  issuerBindingViewController = self->_issuerBindingViewController;
  self->_issuerBindingViewController = v10;

  v12 = self->_issuerBindingViewController;
  if (v12)
  {
    -[PKIssuerBindingViewController setDelegate:](v12, "setDelegate:", self);
    v14[0] = self->_issuerBindingViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKServiceAddPassesViewController setViewControllers:animated:](self, "setViewControllers:animated:", v13, 0);

  }
  else
  {
    -[PKServiceAddPassesViewController _ingestionDidFinishWithResult:](self, "_ingestionDidFinishWithResult:", 0);
  }
}

- (void)_ingestionDidFinishWithResult:(unint64_t)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  -[PKServiceAddPassesViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
  -[PKServiceAddPassesViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ingestionDidFinishWithResult:", a3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);
    if (WeakRetained
      && (v8 = WeakRetained,
          v9 = objc_loadWeakRetained((id *)&self->_resultsDelegate),
          v10 = objc_opt_respondsToSelector(),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      v11 = objc_loadWeakRetained((id *)&self->_resultsDelegate);
      objc_msgSend(v11, "viewController:ingestionDidFinishWithResult:", self, a3);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Dismissing PKServiceAddPassesViewController remoteObjectProxy and resultsDelegate not set.", v13, 2u);
      }

      -[PKServiceAddPassesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }

}

- (void)evaluateBrightness
{
  -[PKAddPassesCardStackViewController evaluateBrightness](self->_cardStackViewController, "evaluateBrightness");
}

- (void)resetBrightness
{
  id v3;

  -[PKAddPassesCardStackViewController resetBrightness](self->_cardStackViewController, "resetBrightness");
  +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAllowingBacklightRamping:", self);

}

- (void)_beginReportingIfNecessary
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D69938];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69938]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v2);
}

- (void)_endReportingIfNecessary
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D69938];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69938]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", v2);
}

- (PKServiceAddPassesViewControllerResultsDelegate)resultsDelegate
{
  return (PKServiceAddPassesViewControllerResultsDelegate *)objc_loadWeakRetained((id *)&self->_resultsDelegate);
}

- (void)setResultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_storeStrong((id *)&self->_issuerBindingViewController, 0);
  objc_storeStrong((id *)&self->_cardStackViewController, 0);
}

@end
