@implementation PKDynamicProvisioningPageViewController

- (PKDynamicProvisioningPageViewController)initWithPage:(id)a3 context:(int64_t)a4
{
  id v7;
  PKDynamicProvisioningPageViewController *v8;
  PKDynamicProvisioningPageViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDynamicProvisioningPageViewController;
  v8 = -[PKExplanationViewController initWithContext:](&v11, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_page, a3);
    -[PKExplanationViewController setShowCancelButton:](v9, "setShowCancelButton:", 0);
    -[PKExplanationViewController setShowDoneButton:](v9, "setShowDoneButton:", 0);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v9, "setExplanationViewControllerDelegate:", v9);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  PKTextRangeHyperlink *v18;
  void *v19;
  PKTextRangeHyperlink *v20;
  uint64_t v21;
  void *v22;
  PKMultiHyperlinkView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id location;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)PKDynamicProvisioningPageViewController;
  -[PKExplanationViewController viewDidLoad](&v43, sel_viewDidLoad);
  -[PKDynamicProvisioningPageViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidesBackButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "dockView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setShowPrivacyView:", 0);
  objc_msgSend(v32, "setManualEntryButton:", 0);
  if (self->_heroImage)
  {
    objc_msgSend(v35, "setImage:");
  }
  else
  {
    -[PKDynamicProvisioningPageContent identifier](self->_page, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("physicalCardQuote"));

    if (v5)
    {
      PKFeatureApplicationHeaderImageWithImage(2, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setImage:", v6);

    }
  }
  -[PKDynamicProvisioningPageContent title](self->_page, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTitleText:", v7);

  -[PKDynamicProvisioningPageContent subtitle](self->_page, "subtitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringCreateProvisioningBulletedParagraph(v24, (void *)*MEMORY[0x1E0DC4938]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v35, "setAttributedBodyText:", v31);
    objc_msgSend(v35, "bodyTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataDetectorTypes:", 0);

  }
  -[PKDynamicProvisioningPageContent disclosureTitle](self->_page, "disclosureTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v33, "setButtonExplanationText:", v30);
  -[PKDynamicProvisioningPageContent learnMore](self->_page, "learnMore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buttonTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    objc_msgSend(v35, "setBodyButtonText:", v29);
  -[PKDynamicProvisioningPageContent primaryActionTitle](self->_page, "primaryActionTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(v33, "primaryButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v28, 0);

  }
  else
  {
    objc_msgSend(v33, "setPrimaryButton:", 0);
  }
  -[PKDynamicProvisioningPageContent secondaryActionTitle](self->_page, "secondaryActionTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v35, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v32, "setupLaterButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v27, 0);

  }
  else
  {
    objc_msgSend(v32, "setForceShowSetupLaterButton:", 0);
  }
  if (-[PKDynamicProvisioningPageContent contentAlignment](self->_page, "contentAlignment") == 4)
  {
    objc_msgSend(v35, "setTitleTextAlignment:", 4);
    objc_msgSend(v35, "setBodyTextAlignment:", 4);
  }
  -[PKDynamicProvisioningPageContent footerContent](self->_page, "footerContent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "footerText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 && v26)
  {
    v23 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v23, "setText:", v26);
    -[PKMultiHyperlinkView setTextAlignment:](v23, "setTextAlignment:", 1);
    objc_initWeak(&location, self);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v34, "links");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v18 = [PKTextRangeHyperlink alloc];
          objc_msgSend(v17, "linkText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __54__PKDynamicProvisioningPageViewController_viewDidLoad__block_invoke;
          v36[3] = &unk_1E3E61B68;
          objc_copyWeak(&v37, &location);
          v36[4] = v17;
          v20 = -[PKTextRangeHyperlink initWithLinkText:action:](v18, "initWithLinkText:action:", v19, v36);

          objc_msgSend(v12, "safelyAddObject:", v20);
          objc_destroyWeak(&v37);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v14);
    }

    v21 = objc_msgSend(v12, "count");
    if (v21)
      v22 = (void *)objc_msgSend(v12, "copy");
    else
      v22 = 0;
    -[PKMultiHyperlinkView setSources:](v23, "setSources:", v22);
    if (v21)

    objc_msgSend(v33, "setAdditionalLinkView:", v23);
    objc_destroyWeak(&location);

  }
}

void __54__PKDynamicProvisioningPageViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 136);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32));
      v3 = v5;
    }
  }

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(void *, void *);
  _QWORD aBlock[5];
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[PKDynamicProvisioningPageContent heroImageURL](self->_page, "heroImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E757D8;
    aBlock[4] = self;
    v16 = v4;
    v9 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedDataForURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9[2](v9, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_3;
      v13[3] = &unk_1E3E65260;
      v14 = v9;
      objc_msgSend(v12, "downloadFromUrl:completionHandler:", v7, v13);

    }
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1032);
    *(_QWORD *)(v5 + 1032) = v4;

  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(self->_primaryButtonAction);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(self->_secondaryButtonAction);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = _Block_copy(self->_cancelButtonAction);
  v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    -[PKDynamicProvisioningPageViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)explanationViewControllerDidSelectDone:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = _Block_copy(self->_doneButtonAction);
  v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    -[PKDynamicProvisioningPageViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(self->_bodyButtonAction);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (id)secondaryButtonAction
{
  return self->_secondaryButtonAction;
}

- (void)setSecondaryButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (id)bodyButtonAction
{
  return self->_bodyButtonAction;
}

- (void)setBodyButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (id)cancelButtonAction
{
  return self->_cancelButtonAction;
}

- (void)setCancelButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (id)doneButtonAction
{
  return self->_doneButtonAction;
}

- (void)setDoneButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (id)linkAction
{
  return self->_linkAction;
}

- (void)setLinkAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong(&self->_doneButtonAction, 0);
  objc_storeStrong(&self->_cancelButtonAction, 0);
  objc_storeStrong(&self->_bodyButtonAction, 0);
  objc_storeStrong(&self->_secondaryButtonAction, 0);
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_heroImage, 0);
}

@end
