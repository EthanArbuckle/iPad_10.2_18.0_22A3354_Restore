@implementation PKPaymentSetupMoreInfoViewController

- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7
{
  return -[PKPaymentSetupMoreInfoViewController initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:reportingSource:](self, "initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:reportingSource:", a3, a4, a5, a6, a7, 0);
}

- (PKPaymentSetupMoreInfoViewController)initWithMoreInfoItems:(id)a3 paymentPass:(id)a4 targetDevice:(id)a5 context:(int64_t)a6 dismissalHandler:(id)a7 reportingSource:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PKPaymentSetupMoreInfoViewController *v18;
  PKPaymentSetupMoreInfoViewController *v19;
  uint64_t v20;
  NSArray *moreInfoItems;
  uint64_t v22;
  id dismissalHandler;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  v18 = -[PKExplanationViewController initWithContext:](&v25, sel_initWithContext_, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a4);
    v20 = objc_msgSend(v14, "copy");
    moreInfoItems = v19->_moreInfoItems;
    v19->_moreInfoItems = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_targetDevice, a5);
    v22 = objc_msgSend(v17, "copy");
    dismissalHandler = v19->_dismissalHandler;
    v19->_dismissalHandler = (id)v22;

    v19->_isFinalViewController = 1;
    v19->_reportingSource = a8;
    -[PKSecureElementPass loadImageSetSync:preheat:](v19->_pass, "loadImageSetSync:preheat:", 0, 1);
  }

  return v19;
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)loadView
{
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPassView *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  -[PKExplanationViewController loadView](&v21, sel_loadView);
  -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v7);

  objc_msgSend(v3, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v8);

  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0 || !self->_isFinalViewController)
  {
    objc_msgSend(v3, "nextAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentSetupMoreInfoViewController _nextItems](self, "_nextItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v3, "nextAction");
    else
      objc_msgSend(v3, "doneAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "primaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v10, 0);

  if (objc_msgSend(v3, "hasAlternativeAction"))
  {
    objc_msgSend(v4, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v6, "setupLaterButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alternativeAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

  }
  else
  {
    objc_msgSend(v6, "setSetupLaterButton:", 0);
  }
  objc_msgSend(v6, "setManualEntryButton:", 0);
  objc_msgSend(v5, "setRequiresAdditionalPrimaryButtonPadding:", 1);
  -[PKExplanationViewController context](self, "context");
  if ((PKPaymentSetupContextIsiOSSetupAssistant() & 1) == 0)
  {
    objc_msgSend(v3, "linkText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBodyButtonText:", v14);

    objc_msgSend(v4, "setBodyButtonNumberOfLines:", 0);
  }
  objc_msgSend(v3, "imageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (v16 = (void *)MEMORY[0x1E0DC3870],
        objc_msgSend(v3, "imageData"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "imageWithData:scale:", v17, PKUIScreenScale()),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        !v18))
  {
    v19 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", self->_pass, 5, 1911);
    -[PKPaymentSetupMoreInfoViewController _snapshotSize](self, "_snapshotSize");
    -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v19, "snapshotOfFrontFaceWithRequestedSize:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "setImage:", v18);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setNeedsLayout");
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 0);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKPaymentSetupMoreInfoViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidesBackButton:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  -[PKPaymentSetupMoreInfoViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPaymentSetupMoreInfoViewController _beginReportingIfNecessary](self, "_beginReportingIfNecessary");
  -[PKPaymentSetupMoreInfoViewController _reportExpressModeEnable](self, "_reportExpressModeEnable");
  -[PKPaymentSetupMoreInfoViewController _reportViewDidAppear](self, "_reportViewDidAppear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupMoreInfoViewController;
  -[PKPaymentSetupMoreInfoViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKPaymentSetupMoreInfoViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
}

- (id)_currentItem
{
  return -[NSArray firstObject](self->_moreInfoItems, "firstObject");
}

- (id)_nextItems
{
  NSArray *moreInfoItems;
  void *v3;
  void *v4;

  moreInfoItems = self->_moreInfoItems;
  -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray pk_arrayByRemovingObject:](moreInfoItems, "pk_arrayByRemovingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_next
{
  void *v3;
  uint64_t v4;

  -[PKPaymentSetupMoreInfoViewController _nextItems](self, "_nextItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[PKPaymentSetupMoreInfoViewController _handlePush](self, "_handlePush");
  else
    -[PKPaymentSetupMoreInfoViewController _handleDismissal](self, "_handleDismissal");
}

- (void)_handlePush
{
  id v3;
  void *v4;
  void *v5;
  _BYTE *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[PKPaymentSetupMoreInfoViewController _nextItems](self, "_nextItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_BYTE *)objc_msgSend(v3, "initWithMoreInfoItems:paymentPass:targetDevice:context:dismissalHandler:", v4, self->_pass, self->_targetDevice, -[PKExplanationViewController context](self, "context"), self->_dismissalHandler);

  v6[1048] = self->_isFinalViewController;
  -[PKPaymentSetupMoreInfoViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_handleDismissal
{
  void *v3;
  void *v4;
  void (**dismissalHandler)(id, PKPaymentSetupMoreInfoViewController *);
  id v6;

  -[PKPaymentSetupMoreInfoViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  dismissalHandler = (void (**)(id, PKPaymentSetupMoreInfoViewController *))self->_dismissalHandler;
  if (dismissalHandler)
  {
    dismissalHandler[2](dismissalHandler, self);
  }
  else
  {
    -[PKPaymentSetupMoreInfoViewController presentingViewController](self, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (int64_t)preferredStatusBarStyle
{
  -[PKExplanationViewController context](self, "context");
  return PKPaymentSetupContextIsBridge();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v4;

  objc_msgSend(a3, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonsEnabled:", 0);

  -[PKPaymentSetupMoreInfoViewController _reportDoneButtonTapped](self, "_reportDoneButtonTapped");
  -[PKPaymentSetupMoreInfoViewController _next](self, "_next");
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  -[PKExplanationViewController showSpinner:](self, "showSpinner:", 1);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke;
  v5[3] = &unk_1E3E61C58;
  objc_copyWeak(&v6, &location);
  -[PKPaymentSetupMoreInfoViewController _alternateActionWithCompletion:](self, "_alternateActionWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke_2;
  v3[3] = &unk_1E3E61C08;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __75__PKPaymentSetupMoreInfoViewController_explanationViewDidSelectSetupLater___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "showSpinner:", 0);
    WeakRetained = v3;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v3, "_next");
      WeakRetained = v3;
    }
  }

}

- (void)_alternateActionWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, uint64_t);
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  PKPaymentWebServiceTargetDeviceProtocol *targetDevice;
  void *v13;
  void (**v14)(void *, uint64_t);
  PKPaymentWebServiceTargetDeviceProtocol *v15;
  void *v16;
  PKPaymentWebServiceTargetDeviceProtocol *v17;
  _QWORD v18[5];
  void (**v19)(void *, uint64_t);
  _QWORD v20[5];
  void (**v21)(void *, uint64_t);
  _QWORD aBlock[4];
  id v23;
  uint8_t buf[4];
  PKPaymentWebServiceTargetDeviceProtocol *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E614F0;
  v6 = v4;
  v23 = v6;
  v7 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if ((unint64_t)(v9 - 1) >= 2)
  {
    if (!v9)
      v7[2](v7, 1);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: User requested to disable Express mode from Express Education", buf, 2u);
    }

    -[PKPaymentSetupMoreInfoViewController _reportTurnOffExpressButtonTapped](self, "_reportTurnOffExpressButtonTapped");
    v11 = objc_opt_respondsToSelector();
    targetDevice = self->_targetDevice;
    if ((v11 & 1) != 0)
    {
      -[PKSecureElementPass uniqueID](self->_pass, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      v20[1] = 3221225472;
      v20[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_26;
      v20[3] = &unk_1E3E67818;
      v20[4] = self;
      v21 = v7;
      -[PKPaymentWebServiceTargetDeviceProtocol removeExpressPassWithUniqueIdentifierV2:completion:](targetDevice, "removeExpressPassWithUniqueIdentifierV2:completion:", v13, v20);

      v14 = v21;
LABEL_10:

      goto LABEL_14;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = self->_targetDevice;
      -[PKSecureElementPass uniqueID](self->_pass, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_30;
      v18[3] = &unk_1E3E67818;
      v18[4] = self;
      v19 = v7;
      -[PKPaymentWebServiceTargetDeviceProtocol removeExpressPassWithUniqueIdentifier:completion:](v15, "removeExpressPassWithUniqueIdentifier:completion:", v16, v18);

      v14 = v19;
      goto LABEL_10;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_targetDevice;
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Failed to disable express mode due to respondsToSelector of TargetDevice:%@", buf, 0xCu);
    }

    v7[2](v7, 0);
  }
LABEL_14:

}

uint64_t __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_26(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Disabled express mode with success:%d from Express Education", (uint8_t *)v7, 8u);
  }

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_reportExpressModeDisable");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__PKPaymentSetupMoreInfoViewController__alternateActionWithCompletion___block_invoke_30(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupMoreInfoViewController: Disabled express mode with success:%d from Express Education", (uint8_t *)v7, 8u);
  }

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_reportExpressModeDisable");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_linkTapped
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v4, 0, 0);

}

- (CGSize)_snapshotSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 220.0;
  v3 = 134.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_beginReportingIfNecessary
{
  void *v3;
  id v4;

  if (-[PKPaymentSetupMoreInfoViewController _isExpressEducation](self, "_isExpressEducation"))
  {
    -[PKPaymentSetupMoreInfoViewController _reportingSubject](self, "_reportingSubject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      self->_didBeginReportingSubject = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v4);
    }

  }
}

- (void)_endReportingIfNecessary
{
  void *v2;
  id v3;

  if (self->_didBeginReportingSubject)
  {
    v2 = (void *)MEMORY[0x1E0D66A58];
    -[PKPaymentSetupMoreInfoViewController _reportingSubject](self, "_reportingSubject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endSubjectReporting:", v3);

  }
}

- (void)_reportViewDidAppear
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __CFString *v11;
  PKSecureElementPass *pass;
  id v13;
  PKSecureElementPass *v14;
  PKSecureElementPass *v15;
  uint64_t v16;
  id *v17;
  __CFString *v18;
  unint64_t v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  PKSecureElementPass *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D69760], *MEMORY[0x1E0D68F50]);
  -[PKSecureElementPass devicePaymentApplications](self->_pass, "devicePaymentApplications");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (v7 && v7 != objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "paymentType", (_QWORD)v38))
        {

          v11 = CFSTR("multiple");
          goto LABEL_13;
        }
        v7 = objc_msgSend(v10, "paymentType", (_QWORD)v38);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v6)
        continue;
      break;
    }
  }

  PKPaymentMethodTypeToString();
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  objc_msgSend(v3, "safelySetObject:forKey:", v11, *MEMORY[0x1E0D690D8]);
  pass = self->_pass;
  v13 = v3;
  v14 = pass;
  v15 = v14;
  if (v13 && v14)
  {
    v16 = -[PKSecureElementPass passType](v14, "passType");
    v17 = (id *)MEMORY[0x1E0D69618];
    if ((unint64_t)(v16 + 1) >= 3)
      v18 = (__CFString *)(id)*MEMORY[0x1E0D69618];
    else
      v18 = off_1E3E67888[v16 + 1];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D69040], (_QWORD)v38);

    v19 = -[PKSecureElementPass style](v15, "style");
    if (v19 < 0xD && ((0x13FFu >> v19) & 1) != 0)
      v20 = off_1E3E678A0[v19];
    else
      v20 = (__CFString *)*v17;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D69038]);

    -[PKSecureElementPass nfcPayload](v15, "nfcPayload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKAnalyticsReportSwitchToggleResultValue();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D69000]);

    v23 = v15;
    if (-[PKSecureElementPass passType](v23, "passType") == 1)
    {
      -[PKSecureElementPass secureElementPass](v23, "secureElementPass");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "cardType");
      if (v25 <= 4)
        v22 = (__CFString *)**((id **)&unk_1E3E67908 + v25);

    }
    else
    {
      v22 = CFSTR("other");
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D69028]);
    -[PKSecureElementPass secureElementPass](v23, "secureElementPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isIdentityPass"))
    {
      v27 = objc_msgSend(v26, "identityType");
      if ((unint64_t)(v27 - 1) < 3)
      {
        v28 = off_1E3E67930[v27 - 1];
        goto LABEL_34;
      }
    }
    else if (objc_msgSend(v26, "isAccessPass"))
    {
      v29 = objc_msgSend(v26, "accessType");
      if (v29 < 7)
      {
        v28 = off_1E3E67948[v29];
        goto LABEL_34;
      }
    }
    v28 = (__CFString *)*v17;
LABEL_34:

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D69020]);
    -[PKSecureElementPass secureElementPass](v23, "secureElementPass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "devicePaymentApplications");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "count");

    PKAnalyticsReportSwitchToggleResultValue();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D68940]);
    -[PKSecureElementPass secureElementPass](v23, "secureElementPass");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *v17;
    objc_msgSend(v33, "organizationName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "length"))
    {
      v36 = objc_msgSend(v33, "cardType");
      if (v36 == 4 || v36 == 2)
      {
        v37 = v35;

        v34 = v37;
      }
    }

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D68D88]);
  }

  -[PKPaymentSetupMoreInfoViewController _reportExpressEventIfNeeded:](self, "_reportExpressEventIfNeeded:", v13);
}

- (void)_reportExpressModeEnable
{
  void *v3;
  int v4;
  id v5;

  -[PKPaymentSetupMoreInfoViewController _reportingSubject](self, "_reportingSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D69950]);

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68B48], *MEMORY[0x1E0D68AA0]);
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68C60], *MEMORY[0x1E0D68F50]);
    -[PKPaymentSetupMoreInfoViewController _reportExpressEventIfNeeded:](self, "_reportExpressEventIfNeeded:", v5);

  }
}

- (void)_reportExpressModeDisable
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68B40], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68C60], *MEMORY[0x1E0D68F50]);
  -[PKPaymentSetupMoreInfoViewController _reportExpressEventIfNeeded:](self, "_reportExpressEventIfNeeded:", v3);

}

- (void)_reportDoneButtonTapped
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D69760], *MEMORY[0x1E0D68F50]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68A68], *MEMORY[0x1E0D68858]);
  -[PKPaymentSetupMoreInfoViewController _reportExpressEventIfNeeded:](self, "_reportExpressEventIfNeeded:", v3);

}

- (void)_reportTurnOffExpressButtonTapped
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D69760], *MEMORY[0x1E0D68F50]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D688C8], *MEMORY[0x1E0D68858]);
  -[PKPaymentSetupMoreInfoViewController _reportExpressEventIfNeeded:](self, "_reportExpressEventIfNeeded:", v3);

}

- (void)_reportExpressEventIfNeeded:(id)a3
{
  void *v4;
  int IsBridge;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  id v12;

  v12 = a3;
  -[PKPaymentSetupMoreInfoViewController _reportingSubject](self, "_reportingSubject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentSetupMoreInfoViewController _isExpressEducation](self, "_isExpressEducation") && v4)
  {
    -[PKExplanationViewController context](self, "context");
    IsBridge = PKPaymentSetupContextIsBridge();
    v6 = (_QWORD *)MEMORY[0x1E0D693A0];
    if (!IsBridge)
      v6 = (_QWORD *)MEMORY[0x1E0D693E0];
    objc_msgSend(v12, "setObject:forKey:", *v6, *MEMORY[0x1E0D693B0]);
    -[PKPaymentSetupMoreInfoViewController _paymentNetworkNamesForExpressReporting](self, "_paymentNetworkNamesForExpressReporting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", *MEMORY[0x1E0D68778]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v8, *MEMORY[0x1E0D690E0]);

    -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportingMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v12, "addEntriesFromDictionary:", v10);
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D69950])
      && PKAnalyticsSessionEnabled()
      && (reporter = self->_reporter) != 0)
    {
      -[PKProvisioningAnalyticsSessionUIReporter reportEvent:](reporter, "reportEvent:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D66A58], "subject:sendEvent:", v4, v12);
    }

  }
}

- (id)_paymentNetworkNamesForExpressReporting
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _QWORD aBlock[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKSecureElementPass paymentPass](self->_pass, "paymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = MEMORY[0x1E0C809B0];
  v33 = v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke;
  aBlock[3] = &unk_1E3E67840;
  aBlock[4] = self;
  v21 = _Block_copy(aBlock);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D58]), "initForPaymentPass:withTechologyTest:", v4, v21);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke_2;
  v26[3] = &unk_1E3E67868;
  v26[4] = &v28;
  objc_msgSend(v7, "enumerateCredentialsWithHandler:", v26);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKPaymentWebServiceTargetDeviceProtocol upgradeRequestForPass:](self->_targetDevice, "upgradeRequestForPass:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paymentApplicationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend((id)v29[5], "addObjectsFromArray:", v9);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)v29[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    v13 = *MEMORY[0x1E0D69618];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "devicePaymentApplicationForAID:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "paymentNetworkIdentifier");
          PKPaymentNetworkNameForPaymentCredentialType();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = v17;
          else
            v19 = v13;
          objc_msgSend(v3, "addObject:", v19);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0D69618]);

  _Block_object_dispose(&v28, 8);
  return v3;
}

uint64_t __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "supportsExpressForAutomaticSelectionTechnologyType:", a2);
  else
    return 0;
}

void __79__PKPaymentSetupMoreInfoViewController__paymentNetworkNamesForExpressReporting__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x1E0D66D58], "extractApplicationIdentifier:subcredentialIdentifier:fromIdentifiers:", &v3, 0, a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pk_safelyAddObject:", v3);

}

- (id)_reportingSubject
{
  int64_t reportingSource;
  id *v3;

  reportingSource = self->_reportingSource;
  if (!reportingSource)
  {
    v3 = (id *)MEMORY[0x1E0D69950];
    return *v3;
  }
  if (reportingSource == 1)
  {
    v3 = (id *)MEMORY[0x1E0D69948];
    return *v3;
  }
  return 0;
}

- (BOOL)_isExpressEducation
{
  void *v2;
  uint64_t v3;

  -[PKPaymentSetupMoreInfoViewController _currentItem](self, "_currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return (unint64_t)(v3 - 1) < 2;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a3;
  -[PKPaymentSetupMoreInfoViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKExplanationViewController showSpinner:](self, "showSpinner:", v4);
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (PKPaymentWebServiceTargetDeviceProtocol)targetDevice
{
  return self->_targetDevice;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (BOOL)isFinalViewController
{
  return self->_isFinalViewController;
}

- (void)setIsFinalViewController:(BOOL)a3
{
  self->_isFinalViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
