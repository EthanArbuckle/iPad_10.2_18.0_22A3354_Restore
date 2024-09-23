@implementation PKApplyProgramConsentViewController

- (PKApplyProgramConsentViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10;
  PKApplyProgramConsentViewController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *pathTermsIdentifier;
  uint64_t v16;
  NSString *pathIdentifier;
  objc_super v19;

  v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKApplyProgramConsentViewController;
  v11 = -[PKApplyExplanationViewController initWithController:setupDelegate:context:applyPage:](&v19, sel_initWithController_setupDelegate_context_applyPage_, v10, a4, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "featureApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "declineDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "pathTermsIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    pathTermsIdentifier = v11->_pathTermsIdentifier;
    v11->_pathTermsIdentifier = (NSString *)v14;

    objc_msgSend(v13, "pathIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    pathIdentifier = v11->_pathIdentifier;
    v11->_pathIdentifier = (NSString *)v16;

  }
  return v11;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyProgramConsentViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIImageNamed(CFSTR("PTACAppleCardTitanium"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  PKUIImageNamed(CFSTR("PTACTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleImage:", v5);

  objc_msgSend(v3, "setBodyButtonNumberOfLines:", 2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyProgramConsentViewController;
  -[PKApplyProgramConsentViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v5 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
}

- (void)dealloc
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v4;
  objc_super v5;

  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    -[CLInUseAssertion invalidate](inUseAssertion, "invalidate");
    v4 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKApplyProgramConsentViewController;
  -[PKApplyProgramConsentViewController dealloc](&v5, sel_dealloc);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Program terms accepted", v7, 2u);
  }

  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyProgramConsentViewController _termsAccepted:actionIdentifier:](self, "_termsAccepted:actionIdentifier:", 1, v6);

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Program terms declined", v7, 2u);
  }

  -[PKApplyExplanationViewController currentPage](self, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyProgramConsentViewController _termsAccepted:actionIdentifier:](self, "_termsAccepted:actionIdentifier:", 0, v6);

}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v4;
  PKApplyTermsAndConditionsViewController *v5;
  void *v6;
  void *v7;
  PKApplyTermsAndConditionsViewController *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  v5 = [PKApplyTermsAndConditionsViewController alloc];
  -[PKApplyExplanationViewController controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyExplanationViewController setupDelegate](self, "setupDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v5, "initWithController:setupDelegate:context:termsIdentifier:", v6, v7, -[PKExplanationViewController context](self, "context"), self->_pathTermsIdentifier);

  -[PKApplyTermsAndConditionsViewController setPreflightPDFTerms:](v8, "setPreflightPDFTerms:", 1);
  -[PKFeatureTermsAndConditionsViewController setUseModalPresentation:](v8, "setUseModalPresentation:", 1);
  objc_initWeak(&location, self);
  -[PKApplyProgramConsentViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKApplyProgramConsentViewController_explanationViewDidSelectBodyButton___block_invoke;
  v10[3] = &unk_1E3E61C58;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v8, 1, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __74__PKApplyProgramConsentViewController_explanationViewDidSelectBodyButton___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    WeakRetained = v2;
  }

}

- (void)_termsAccepted:(BOOL)a3 actionIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  CLInUseAssertion *v9;
  CLInUseAssertion *inUseAssertion;
  void *v11;
  NSString *pathTermsIdentifier;
  NSString *pathIdentifier;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  v6 = a4;
  if (!self->_inUseAssertion)
  {
    v7 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CLInUseAssertion *)objc_msgSend(v7, "newAssertionForBundle:withReason:", v8, CFSTR("Accepting program terms"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v9;

  }
  -[PKApplyExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKApplyExplanationViewController controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pathTermsIdentifier = self->_pathTermsIdentifier;
  pathIdentifier = self->_pathIdentifier;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PKApplyProgramConsentViewController__termsAccepted_actionIdentifier___block_invoke;
  v14[3] = &unk_1E3E62598;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "termsAccepted:termsIdentifier:secondaryIdentifier:actionIdentifier:completion:", v4, pathTermsIdentifier, pathIdentifier, v6, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __71__PKApplyProgramConsentViewController__termsAccepted_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNextViewController:displayableError:", v8, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathIdentifier, 0);
  objc_storeStrong((id *)&self->_pathTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
}

@end
