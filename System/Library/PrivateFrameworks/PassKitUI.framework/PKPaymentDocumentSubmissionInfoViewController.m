@implementation PKPaymentDocumentSubmissionInfoViewController

- (PKPaymentDocumentSubmissionInfoViewController)initWithController:(id)a3 context:(int64_t)a4 featureIdentifier:(unint64_t)a5
{
  id v9;
  PKPaymentDocumentSubmissionInfoViewController *v10;
  PKPaymentDocumentSubmissionInfoViewController *v11;
  id *p_controller;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  v10 = -[PKExplanationViewController initWithContext:](&v14, sel_initWithContext_, a4);
  v11 = v10;
  if (v10)
  {
    v10->_featureIdentifier = a5;
    p_controller = (id *)&v10->_controller;
    objc_storeStrong((id *)&v10->_controller, a3);
    v11->_context = a4;
    v11->_currentState = objc_msgSend(*p_controller, "state");
    v11->_currentSide = objc_msgSend(*p_controller, "side");
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
  v6.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  -[PKExplanationViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setManualEntryButton:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  -[PKPaymentDocumentSubmissionInfoViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentDocumentSubmissionController setState:](self->_controller, "setState:", self->_currentState);
  -[PKPaymentDocumentSubmissionController setSide:](self->_controller, "setSide:", self->_currentSide);
  -[PKPaymentDocumentSubmissionController setDelegate:](self->_controller, "setDelegate:", self);
  -[PKPaymentDocumentSubmissionInfoViewController updateUIWithState:](self, "updateUIWithState:", self->_currentState);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  -[PKPaymentDocumentSubmissionInfoViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPaymentDocumentSubmissionInfoViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentDocumentSubmissionInfoViewController;
  -[PKPaymentDocumentSubmissionInfoViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKPaymentDocumentSubmissionInfoViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 0);
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  _QWORD *v6;
  id v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v5;
  v6 = (_QWORD *)MEMORY[0x1E0D68C50];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0D68C58];
  objc_msgSend(v5, "setObject:forKey:", *v6, *MEMORY[0x1E0D68AA0]);
  -[PKPaymentDocumentSubmissionController reportAnalyticsEvent:pageTag:](self->_controller, "reportAnalyticsEvent:pageTag:", v7, *MEMORY[0x1E0D68638]);

}

- (void)_cancelPressed
{
  -[PKPaymentDocumentSubmissionController userWantsToCancel](self->_controller, "userWantsToCancel");
}

- (id)_secondaryButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusiveTouch:", 1);
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", 1);

  objc_msgSend(v3, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_didSelectSetupLater, 64);
  return v3;
}

- (void)updateUIWithState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t featureIdentifier;
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
  int64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PKPaymentDocumentSubmissionInfoViewController *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int64_t v53;
  PKPaymentDocumentSubmissionController *controller;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  dispatch_time_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double height;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int64_t v80;
  void *v81;
  void *v82;
  _QWORD block[5];
  CGSize v84;

  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDocumentSubmissionInfoViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);
  objc_msgSend(v5, "setShowPrivacyView:", 0);
  objc_msgSend(v6, "setButtonExplanationText:", 0);
  -[PKPaymentDocumentSubmissionController preferredLanguage](self->_controller, "preferredLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
      PKLocalizedApplyFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v21);

      PKLocalizedApplyFeatureString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v22);

      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v23, 0);

      featureIdentifier = self->_featureIdentifier;
      if (featureIdentifier == 3)
      {
        v76 = v5;
        v77 = 0;
      }
      else
      {
        if (featureIdentifier == 2)
        {
          -[PKPaymentDocumentSubmissionInfoViewController _secondaryButton](self, "_secondaryButton");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSetupLaterButton:", v25);

          objc_msgSend(v5, "setShowPrivacyView:", 0);
          PKLocalizedApplyFeatureString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setButtonExplanationText:", v26);

          objc_msgSend(v6, "buttonExplanationTextView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTextAlignment:", 0);

LABEL_31:
          objc_msgSend(v8, "setSetupLaterButton:", 0);
          objc_msgSend(v5, "setTopMargin:", 30.0);
          PKUIImageNamed(CFSTR("PhotoID"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setImage:", v78);

          v41 = self;
          v42 = 1;
          goto LABEL_32;
        }
        objc_msgSend(v6, "setButtonExplanationText:", 0);
        v76 = v5;
        v77 = 1;
      }
      objc_msgSend(v76, "setShowPrivacyView:", v77);
      goto LABEL_31;
    case 1:
      PKLocalizedApplyFeatureString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v43);

      PKLocalizedApplyFeatureString();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v44);

      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v45, 0);

      -[PKPaymentDocumentSubmissionInfoViewController _secondaryButton](self, "_secondaryButton");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSetupLaterButton:", v46);

      objc_msgSend(v8, "setupLaterButton");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v48 = a3;
      v49 = v7;
      v50 = v8;
      v51 = v9;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTitle:forState:", v52, 0);

      v9 = v51;
      v8 = v50;
      v7 = v49;
      a3 = v48;

      goto LABEL_18;
    case 3:
      v82 = v9;
      v53 = -[PKPaymentDocumentSubmissionController side](self->_controller, "side");
      controller = self->_controller;
      if (v53)
        -[PKPaymentDocumentSubmissionController backID](controller, "backID");
      else
        -[PKPaymentDocumentSubmissionController frontID](controller, "frontID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v63);

      PKLocalizedApplyFeatureString();
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v64);

      objc_msgSend(v55, "size");
      if (v65 > 0.0)
      {
        objc_msgSend(v55, "size");
        if (v66 > 0.0)
        {
          objc_msgSend(v55, "size");
          v68 = v67;
          objc_msgSend(v55, "size");
          height = v84.height;
          v84.width = v68;
          UIGraphicsBeginImageContextWithOptions(v84, 0, 1.0);
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v68, height, 30.0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addClip");

          objc_msgSend(v55, "drawInRect:", 0.0, 0.0, v68, height);
          UIGraphicsGetImageFromCurrentImageContext();
          v71 = objc_claimAutoreleasedReturnValue();

          UIGraphicsEndImageContext();
          v55 = (void *)v71;
        }
      }
      objc_msgSend(v5, "setImage:", v55, v55);
      if ((unint64_t)PKUIGetMinScreenWidthType() >= 4)
        objc_msgSend(v5, "setTopMargin:", 30.0);
      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v72, 0);

      -[PKPaymentDocumentSubmissionInfoViewController _secondaryButton](self, "_secondaryButton");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSetupLaterButton:", v73);

      objc_msgSend(v8, "setupLaterButton");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setTitle:forState:", v75, 0);

      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", self->_featureIdentifier == 1);
      -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);

      v9 = v82;
      goto LABEL_33;
    case 4:
    case 8:
    case 10:
      PKLocalizedApplyFeatureString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v31);

      PKLocalizedApplyFeatureString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v32);

      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v33, 0);

      if (self->_featureIdentifier == 1)
      {
        -[PKPaymentDocumentSubmissionInfoViewController _secondaryButton](self, "_secondaryButton");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSetupLaterButton:", v34);

        objc_msgSend(v8, "setupLaterButton");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedApplyFeatureString();
        v36 = a3;
        v37 = v7;
        v38 = v8;
        v39 = v9;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setTitle:forState:", v40, 0);

        v9 = v39;
        v8 = v38;
        v7 = v37;
        a3 = v36;

      }
      else
      {
        objc_msgSend(v8, "setSetupLaterButton:", 0);
      }
      v41 = self;
      v42 = 0;
LABEL_32:
      -[PKExplanationViewController setShowCancelButton:](v41, "setShowCancelButton:", v42);
      -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
      goto LABEL_33;
    case 5:
      PKLocalizedApplyFeatureString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v28);

      objc_msgSend(v5, "setBodyText:", 0);
      objc_msgSend(v5, "setShowSpinner:", 1);
      objc_msgSend(v9, "setRightBarButtonItem:", 0);
      PKUIImageNamed(CFSTR("PhotoID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v29);

      objc_msgSend(v7, "setHidden:", 1);
      objc_msgSend(v8, "setSetupLaterButton:", 0);
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
      -[PKPaymentDocumentSubmissionInfoViewController navigationItem](self, "navigationItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidesBackButton:", 1);

      goto LABEL_33;
    case 6:
    case 11:
      PKLocalizedApplyFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v11);

      PKLocalizedApplyFeatureString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v12);

      objc_msgSend(v5, "showCheckmark:animated:", 0, 0);
      objc_msgSend(v5, "setShowSpinner:", 0);
      v81 = v9;
      objc_msgSend(v9, "setRightBarButtonItem:", 0);
      PKUIImageNamed(CFSTR("PhotoID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v13);

      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v14, 0);

      objc_msgSend(v8, "setSetupLaterButton:", 0);
      v15 = self->_featureIdentifier;
      v80 = a3;
      v16 = v7;
      if (v15 == 1)
      {
        -[PKPaymentDocumentSubmissionInfoViewController _secondaryButton](self, "_secondaryButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSetupLaterButton:", v17);

        v18 = v8;
        objc_msgSend(v8, "setupLaterButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedApplyFeatureString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTitle:forState:", v20, 0);

      }
      else
      {
        v18 = v8;
        objc_msgSend(v8, "setSetupLaterButton:", 0);
      }
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", v15 == 1);
      -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
      v8 = v18;
      v7 = v16;
      a3 = v80;
      v9 = v81;
      goto LABEL_33;
    case 7:
      PKLocalizedApplyFeatureString();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v56);

      objc_msgSend(v5, "setBodyText:", 0);
      objc_msgSend(v5, "showCheckmark:animated:", 1, 0);
      objc_msgSend(v5, "setShowSpinner:", 0);
      objc_msgSend(v9, "setRightBarButtonItem:", 0);
      PKUIImageNamed(CFSTR("PhotoID"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v57);

      objc_msgSend(v7, "setHidden:", 1);
      objc_msgSend(v8, "setSetupLaterButton:", 0);
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
      -[PKPaymentDocumentSubmissionInfoViewController navigationItem](self, "navigationItem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setHidesBackButton:", 1);

      v59 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke;
      block[3] = &unk_1E3E612E8;
      block[4] = self;
      dispatch_after(v59, MEMORY[0x1E0C80D38], block);
      goto LABEL_33;
    case 9:
      PKLocalizedApplyFeatureString();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitleText:", v60);

      PKLocalizedApplyFeatureString();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBodyText:", v61);

      objc_msgSend(v7, "setHidden:", 0);
      PKLocalizedApplyFeatureString();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v62, 0);

      objc_msgSend(v8, "setSetupLaterButton:", 0);
LABEL_18:
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
      -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
      goto LABEL_33;
    default:
      -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", self->_featureIdentifier == 1);
LABEL_33:
      self->_currentState = a3;
      self->_currentSide = -[PKPaymentDocumentSubmissionController side](self->_controller, "side");
      PKPaymentSetupApplyContextAppearance(self->_context, v5);

      return;
  }
}

void __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "nextViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke_2;
    v5[3] = &unk_1E3E62288;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", v2, 1, v5);

  }
  else
  {
    objc_msgSend(v3[129], "terminateSetupFlow");
  }

}

uint64_t __67__PKPaymentDocumentSubmissionInfoViewController_updateUIWithState___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v2 = result;
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error: Failed to present view controller terminating setup flow from: %@", (uint8_t *)&v6, 0xCu);

    }
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 1032), "terminateSetupFlow");
  }
  return result;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKPaymentDocumentSubmissionController *controller;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  controller = self->_controller;
  v6 = *MEMORY[0x1E0D68858];
  v7[0] = *MEMORY[0x1E0D68958];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDocumentSubmissionController reportAnalyticsEvent:pageTag:](controller, "reportAnalyticsEvent:pageTag:", v5, *MEMORY[0x1E0D68638]);

  switch(self->_currentState)
  {
    case 0:
      -[PKPaymentDocumentSubmissionController userWantsToContinue](self->_controller, "userWantsToContinue");
      break;
    case 1:
    case 0xALL:
      -[PKPaymentDocumentSubmissionController contactApplePressed](self->_controller, "contactApplePressed");
      break;
    case 3:
      -[PKPaymentDocumentSubmissionController userApprovedCapturedID](self->_controller, "userApprovedCapturedID");
      break;
    case 4:
    case 8:
      -[PKPaymentDocumentSubmissionController scanAgain](self->_controller, "scanAgain");
      break;
    case 6:
    case 0xBLL:
      -[PKPaymentDocumentSubmissionController tryUploadAgain](self->_controller, "tryUploadAgain");
      break;
    case 9:
      -[PKPaymentDocumentSubmissionController terminateSetupFlow](self->_controller, "terminateSetupFlow");
      break;
    default:
      return;
  }
}

- (void)didSelectSetupLater
{
  unint64_t currentState;

  currentState = self->_currentState;
  if (currentState > 0xB)
    goto LABEL_8;
  if (((1 << currentState) & 0x503) != 0)
  {
    PKAnalyticsSendEventForFeature();
    -[PKPaymentDocumentSubmissionController terminateSetupFlow](self->_controller, "terminateSetupFlow");
    return;
  }
  if (((1 << currentState) & 0x840) != 0)
  {
    -[PKPaymentDocumentSubmissionController userWantsToCancel](self->_controller, "userWantsToCancel");
    return;
  }
  if (currentState == 3)
    -[PKPaymentDocumentSubmissionController userRejectedCapturedID](self->_controller, "userRejectedCapturedID");
  else
LABEL_8:
    -[PKPaymentDocumentSubmissionController scanAgain](self->_controller, "scanAgain");
}

- (void)captureController:(id)a3 showLoading:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", a4);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonsEnabled:", !v4);

}

- (void)captureController:(id)a3 didChangeStateTo:(int64_t)a4
{
  int64_t currentState;
  void *v10;
  id v11;

  currentState = self->_currentState;
  if (currentState == 11 || currentState == 6)
  {
    if (a4 == 5)
    {
LABEL_7:
      -[PKPaymentDocumentSubmissionInfoViewController updateUIWithState:](self, "updateUIWithState:", a4);
      return;
    }
  }
  else if (currentState == 5 && (unint64_t)a4 <= 0xB && ((1 << a4) & 0x8C0) != 0)
  {
    goto LABEL_7;
  }
  -[PKPaymentDocumentSubmissionController nextViewController](self->_controller, "nextViewController", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PKPaymentDocumentSubmissionInfoViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_presentPaymentSetupViewController:animated:completion:", v11, 1, 0);

  }
  else
  {
    -[PKPaymentDocumentSubmissionInfoViewController updateUIWithState:](self, "updateUIWithState:", a4);
  }

}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  if (self->_currentState)
    return 4;
  if (self->_featureIdentifier == 2)
    return 3;
  return 0;
}

- (unint64_t)paymentSetupMarker
{
  return 4 * (self->_currentState == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
