@implementation PKPassShareIntroductionExplanationViewController

- (PKPassShareIntroductionExplanationViewController)init
{

  return 0;
}

- (PKPassShareIntroductionExplanationViewController)initWithSharesController:(id)a3 context:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPassShareIntroductionExplanationViewController *v12;
  PKPassShareIntroductionExplanationViewController *v13;
  PKPassSnapshotter *v14;
  PKPassSnapshotter *passSnapshotter;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareIntroductionExplanationViewController;
  v12 = -[PKExplanationViewController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sharesController, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = objc_alloc_init(PKPassSnapshotter);
    passSnapshotter = v13->_passSnapshotter;
    v13->_passSnapshotter = v14;

  }
  return v13;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassShareIntroductionExplanationViewController;
  -[PKExplanationViewController loadView](&v3, sel_loadView);
  -[PKExplanationViewController setExplanationViewControllerDelegate:](self, "setExplanationViewControllerDelegate:", self);
  -[PKPassShareIntroductionExplanationViewController _showShareUI](self, "_showShareUI");
  -[PKPassShareIntroductionExplanationViewController _loadCardArt](self, "_loadCardArt");
}

- (void)_showShareUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKHeroCardExplanationHeaderView *v7;
  PKHeroCardExplanationHeaderView *heroView;
  PKHeroCardExplanationHeaderView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SHARE_ONE_SHAREABLE_PASS"), CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setTitleText:", v5);
  PKLocalizedShareableCredentialString(CFSTR("SHARE_CREDENTIAL_EXPLANATION"), CFSTR("%lu"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBodyText:", v6);
  objc_msgSend(v16, "setShowPrivacyView:", 1);
  objc_msgSend(v16, "setTopMargin:", 12.0);
  objc_msgSend(v16, "setBodyDataDetectorTypes:", 0);
  objc_msgSend(v16, "setTitleAccessoriesEnabled:", 0);
  v7 = -[PKHeroCardExplanationHeaderView initWithImage:]([PKHeroCardExplanationHeaderView alloc], "initWithImage:", 0);
  heroView = self->_heroView;
  self->_heroView = v7;

  -[PKHeroCardExplanationHeaderView setSize:](self->_heroView, "setSize:", 4);
  -[PKHeroCardExplanationHeaderView setPadding:](self->_heroView, "setPadding:", 1);
  v9 = self->_heroView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKHeroCardExplanationHeaderView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[PKHeroCardExplanationHeaderView showLoadingContent](self->_heroView, "showLoadingContent");
  objc_msgSend(v16, "setTopLogoPadding:", 0.0);
  objc_msgSend(v16, "setHeroView:", self->_heroView);
  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController setPrivacyLinkController:](self, "setPrivacyLinkController:", v11);
  objc_msgSend(v16, "dockView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SHARE_SHAREABLE_CREDENTIAL_PASS_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v13, 0);

  objc_msgSend(v16, "setShowSpinner:", 0);
  objc_msgSend(v12, "setHidden:", 0);
  objc_msgSend(v12, "footerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSkipCardButton:", 0);
  objc_msgSend(v15, "setSetupLaterButton:", 0);
  objc_msgSend(v15, "setManualEntryButton:", 0);

}

- (void)_loadCardArt
{
  PKPassSnapshotter *passSnapshotter;
  void *v4;
  _QWORD v5[5];

  passSnapshotter = self->_passSnapshotter;
  -[PKSharedPassSharesController pass](self->_sharesController, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPassShareIntroductionExplanationViewController__loadCardArt__block_invoke;
  v5[3] = &unk_1E3E613B0;
  v5[4] = self;
  -[PKPassSnapshotter snapshotWithPass:size:completion:](passSnapshotter, "snapshotWithPass:size:completion:", v4, v5, 142.0, 90.0);

}

void __64__PKPassShareIntroductionExplanationViewController__loadCardArt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKPassShareIntroductionExplanationViewController__loadCardArt__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __64__PKPassShareIntroductionExplanationViewController__loadCardArt__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "setCardImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "hideLoadingContent");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passShareIntroductionExplanationViewControllerDidContinue:", self);

}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passShareIntroductionExplanationViewControllerDidCancel:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroView, 0);
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end
