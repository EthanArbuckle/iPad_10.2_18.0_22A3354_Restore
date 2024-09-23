@implementation PXSettingsHighlightEstimatesExportViewController

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  -[PXSettingsHighlightEstimatesExportViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PXSettingsHighlightEstimatesExportViewController setExportHighlightEstimatesOnViewDidAppear:](self, "setExportHighlightEstimatesOnViewDidAppear:", 1);
  -[PXSettingsHighlightEstimatesExportViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "setEditable:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  -[PXSettingsHighlightEstimatesExportViewController setTextView:](self, "setTextView:", v5);
  -[PXSettingsHighlightEstimatesExportViewController setTitle:](self, "setTitle:", CFSTR("Export Library Estimates"));
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  -[PXSettingsHighlightEstimatesExportViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[PXSettingsHighlightEstimatesExportViewController exportHighlightEstimatesOnViewDidAppear](self, "exportHighlightEstimatesOnViewDidAppear"))
  {
    -[PXSettingsHighlightEstimatesExportViewController setExportHighlightEstimatesOnViewDidAppear:](self, "setExportHighlightEstimatesOnViewDidAppear:", 0);
    -[PXSettingsHighlightEstimatesExportViewController _fetchHighlightEstimatesDictionary](self, "_fetchHighlightEstimatesDictionary");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXSettingsHighlightEstimatesExportViewController;
  -[PXSettingsHighlightEstimatesExportViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  -[PXSettingsHighlightEstimatesExportViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:animated:", 1, v3);

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__PXSettingsHighlightEstimatesExportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  -[PXSettingsHighlightEstimatesExportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

- (void)_fetchHighlightEstimatesDictionary
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXSettingsHighlightEstimatesExportViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", CFSTR("\nFetching library estimates.\nThis might take a while…"));

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke;
  v5[3] = &unk_1E5130E50;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "requestHighlightEstimatesWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_sendEmail:(id)a3
{
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = objc_msgSend(getMFMailComposeViewControllerClass_166567(), "canSendMail");
  v5 = MEMORY[0x1E0C809B0];
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Privacy Warning"), CFSTR("By sending this email, you agree on sharing your photos metadata."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke;
    v10[3] = &unk_1E5144530;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Agree"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Email"), CFSTR("Can't send email, do you have an account setup?"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke_181;
  v9[3] = &unk_1E5144530;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v8);
  -[PXSettingsHighlightEstimatesExportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)exportHighlightEstimatesOnViewDidAppear
{
  return self->_exportHighlightEstimatesOnViewDidAppear;
}

- (void)setExportHighlightEstimatesOnViewDidAppear:(BOOL)a3
{
  self->_exportHighlightEstimatesOnViewDidAppear = a3;
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setTextView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (NSDictionary)highlightEstimatesDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 984, 1);
}

- (void)setHighlightEstimatesDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightEstimatesDictionary, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

void __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_166567());
  objc_msgSend(v2, "setMailComposeDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PhotosGraph] Library Estimates Export"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubject:", v3);

  objc_msgSend(v2, "setToRecipients:", &unk_1E53E9E28);
  v4 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(*(id *)(a1 + 32), "highlightEstimatesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to archive highlightEstimatesDictionary, error: %@", buf, 0xCu);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v8, "setDateFormat:", CFSTR("YYYY-MM-dd"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("library-estimates-%@-%@.plist"), v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addAttachmentData:mimeType:fileName:", v6, CFSTR("application/octet-stream"), v14);
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot attach library estimates data."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("ERROR: %@"), v15);
  }
  objc_msgSend(v2, "setMessageBody:isHTML:", v15, 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v2, 1, 0);

}

void __63__PXSettingsHighlightEstimatesExportViewController__sendEmail___block_invoke_181(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v10 = v7;
  v11 = v9;
  v12 = v8;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v13);
}

void __86__PXSettingsHighlightEstimatesExportViewController__fetchHighlightEstimatesDictionary__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setHighlightEstimatesDictionary:", v5);

    objc_msgSend(v4, "setText:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Export"), 0, WeakRetained, sel__sendEmail_);
    objc_msgSend(WeakRetained, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToolbarHidden:animated:", 0, 1);

    v11[0] = v7;
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setToolbarItems:animated:", v10, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetching library estimates failed due to error:\n\n%@"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v7);
  }

}

void __100__PXSettingsHighlightEstimatesExportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

@end
