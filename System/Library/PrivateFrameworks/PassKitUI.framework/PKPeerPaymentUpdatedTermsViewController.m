@implementation PKPeerPaymentUpdatedTermsViewController

- (PKPeerPaymentUpdatedTermsViewController)initWithPassUniqueID:(id)a3
{
  id v5;
  PKPeerPaymentUpdatedTermsViewController *v6;
  PKPeerPaymentUpdatedTermsViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v10, sel_initWithContext_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueID, a3);
    -[PKExplanationViewController setShowCancelButton:](v7, "setShowCancelButton:", 1);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v7, "setExplanationViewControllerDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v7, "setPrivacyLinkController:", v8);

  }
  return v7;
}

- (void)loadView
{
  id v3;
  PKPassSnapshotter *v4;
  NSString *uniqueID;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPeerPaymentUpdatedTermsViewController *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  -[PKExplanationViewController loadView](&v10, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", 1);
  v4 = objc_alloc_init(PKPassSnapshotter);
  uniqueID = self->_uniqueID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke;
  v7[3] = &unk_1E3E61428;
  v8 = v3;
  v9 = self;
  v6 = v3;
  -[PKPassSnapshotter snapshotWithUniqueID:size:suppressedContent:completion:](v4, "snapshotWithUniqueID:size:suppressedContent:completion:", uniqueID, 4087, v7, 257.0, 157.0);

}

void __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__PKPeerPaymentUpdatedTermsViewController_loadView__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 48), "explanationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeroView:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 48), "viewIfLoaded");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentUpdatedTermsViewController;
  -[PKExplanationViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TERMS_UPDATE_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setTopMargin:", 12.0);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSetupLaterButton:", 0);
  objc_msgSend(v7, "setManualEntryButton:", 0);

}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentUpdatedTermsViewController:didSelectContinue:", self, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentUpdatedTermsViewController:didSelectContinue:", self, 1);

}

- (void)showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowSpinner:", v3);

  v7 = v3 ^ 1;
  objc_msgSend(v12, "setButtonsEnabled:", v7);
  -[PKPeerPaymentUpdatedTermsViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  -[PKPeerPaymentUpdatedTermsViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v7);

}

- (PKPeerPaymentUpdatedTermsViewControllerDelegate)delegate
{
  return (PKPeerPaymentUpdatedTermsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
