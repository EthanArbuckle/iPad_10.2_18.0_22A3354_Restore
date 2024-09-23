@implementation PXMemoriesInlineProblemReportViewController

- (PXMemoriesInlineProblemReportViewController)initWithMemory:(id)a3 features:(id)a4
{
  id v7;
  id v8;
  PXMemoriesInlineProblemReportViewController *v9;
  PXMemoriesInlineProblemReportViewController *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PXMemoriesInlineProblemReportViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXMemoriesInlineProblemReportViewController;
  -[PXMemoriesInlineProblemReportViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PXMemoriesInlineProblemReportViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(v6, "setNumberOfLines:", 2);
  PXLocalizedStringFromTable(CFSTR("Capturing Data.\nPlease wait…"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(v3, "addSubview:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v8);
  _NSDictionaryOfVariableBindings(CFSTR("progressLabel, activityIndicator"), v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[activityIndicator]-4-[progressLabel]"), 512, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 10, 0, v3, 10, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 9, 0, v3, 9, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v12);

  -[PXMemoriesInlineProblemReportViewController setReportCaptureInProgressLabel:](self, "setReportCaptureInProgressLabel:", v6);
  -[PXMemoriesInlineProblemReportViewController setReportCaptureInProgressActivityIndicator:](self, "setReportCaptureInProgressActivityIndicator:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXMemoriesInlineProblemReportViewController;
  -[PXMemoriesInlineProblemReportViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[PXMemoriesInlineProblemReportViewController didDismissMailWindow](self, "didDismissMailWindow"))
    -[PXMemoriesInlineProblemReportViewController _showMailComposeWindow](self, "_showMailComposeWindow");
}

- (void)_showMailComposeWindow
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[PXMemoriesInlineProblemReportViewController reportCaptureInProgressActivityIndicator](self, "reportCaptureInProgressActivityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v6;
  _QWORD v7[5];

  v6 = a3;
  -[PXMemoriesInlineProblemReportViewController setDidDismissMailWindow:](self, "setDidDismissMailWindow:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PXMemoriesInlineProblemReportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v7[3] = &unk_1E5149198;
  v7[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, v7);

}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setMemory:(id)a3
{
  objc_storeStrong((id *)&self->_memory, a3);
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (UILabel)reportCaptureInProgressLabel
{
  return self->_reportCaptureInProgressLabel;
}

- (void)setReportCaptureInProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_reportCaptureInProgressLabel, a3);
}

- (UIActivityIndicatorView)reportCaptureInProgressActivityIndicator
{
  return self->_reportCaptureInProgressActivityIndicator;
}

- (void)setReportCaptureInProgressActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_reportCaptureInProgressActivityIndicator, a3);
}

- (BOOL)didDismissMailWindow
{
  return self->_didDismissMailWindow;
}

- (void)setDidDismissMailWindow:(BOOL)a3
{
  self->_didDismissMailWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportCaptureInProgressActivityIndicator, 0);
  objc_storeStrong((id *)&self->_reportCaptureInProgressLabel, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

uint64_t __95__PXMemoriesInlineProblemReportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke(uint64_t a1)
{
  PXMemoriesInlineProblemReporter *v2;
  void *v3;
  void *v4;
  PXMemoriesInlineProblemReporter *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v2 = [PXMemoriesInlineProblemReporter alloc];
  objc_msgSend(*(id *)(a1 + 32), "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXMemoriesInlineProblemReporter initWithMemory:features:](v2, "initWithMemory:features:", v3, v4);

  -[PXMemoriesInlineProblemReporter feedbackMailViewController](v5, "feedbackMailViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_2;
  v9[3] = &unk_1E5148D08;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setMailComposeDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setModalTransitionStyle:", 2);
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_3;
    v11[3] = &unk_1E5149198;
    v11[4] = v3;
    objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Unable to create E-Mail"), CFSTR("You need to set up at least one account in Mail in order to report the issue."), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_4;
    v10[3] = &unk_1E5144530;
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v7);
    v8 = *(void **)(a1 + 40);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_5;
    v9[3] = &unk_1E5149198;
    v9[4] = v8;
    objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, v9);

  }
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reportCaptureInProgressActivityIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopAnimating");

}

uint64_t __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __69__PXMemoriesInlineProblemReportViewController__showMailComposeWindow__block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "reportCaptureInProgressActivityIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopAnimating");

}

@end
