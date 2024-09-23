@implementation UIPrinterSearchingView

- (UIPrinterSearchingView)initWithFrame:(CGRect)a3
{
  UIPrinterSearchingView *v3;
  UIPrinterSearchingView *v4;
  UIPrintMessageAndSpinnerView *v5;
  UIPrintMessageAndSpinnerView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSearchingView;
  v3 = -[UIPrinterSearchingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIPrinterSearchingView setHidden:](v3, "setHidden:", 1);
    v5 = [UIPrintMessageAndSpinnerView alloc];
    -[UIPrinterSearchingView bounds](v4, "bounds");
    v6 = -[UIPrintMessageAndSpinnerView initWithFrame:](v5, "initWithFrame:");
    -[UIPrintMessageAndSpinnerView setSpinnerHidden:](v6, "setSpinnerHidden:", 0);
    -[UIPrintMessageAndSpinnerView setSpinSpinner:](v6, "setSpinSpinner:", 1);
    objc_storeWeak((id *)&v4->_messageAndSpinner, v6);
    -[UIPrinterSearchingView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrinterSearchingView addSubview:](v4, "addSubview:", v6);
    -[UIPrinterSearchingView setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");

  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (!self->_constraintsSet)
  {
    -[UIPrinterSearchingView messageAndSpinner](self, "messageAndSpinner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, self, 9, 1.0, 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, self, 10, 1.0, -50.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 1, v3, 7, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 8, 1, v3, 8, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrinterSearchingView addConstraint:](self, "addConstraint:", v4);
    -[UIPrinterSearchingView addConstraint:](self, "addConstraint:", v5);
    -[UIPrinterSearchingView addConstraint:](self, "addConstraint:", v6);
    -[UIPrinterSearchingView addConstraint:](self, "addConstraint:", v7);
    self->_constraintsSet = 1;

  }
  v8.receiver = self;
  v8.super_class = (Class)UIPrinterSearchingView;
  -[UIPrinterSearchingView updateConstraints](&v8, sel_updateConstraints);
}

- (void)searchTimeout
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  -[UIPrinterSearchingView messageAndSpinner](self, "messageAndSpinner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np() == 1)
  {
    objc_msgSend(v2, "setSpinnerHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No AirPrint Printers Found"), CFSTR("No AirPrint Printers Found"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMessageText:", v4);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__UIPrinterSearchingView_searchTimeout__block_invoke;
    block[3] = &unk_1E9D96D90;
    v6 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __39__UIPrinterSearchingView_searchTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setSpinnerHidden:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No AirPrint Printers Found"), CFSTR("No AirPrint Printers Found"), CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMessageText:", v2);

}

- (void)setSearching:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[UIPrinterSearchingView isHidden](self, "isHidden") == a3)
  {
    if (v3)
    {
      -[UIPrinterSearchingView setHidden:](self, "setHidden:", 0);
      -[UIPrinterSearchingView messageAndSpinner](self, "messageAndSpinner");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Looking for Printers…"), CFSTR("Looking for Printers…"), CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMessageText:", v6);

      objc_msgSend(v7, "setSpinnerHidden:", 0);
      -[UIPrinterSearchingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_searchTimeout, 0, 5.0);

    }
    else
    {
      -[UIPrinterSearchingView setHidden:](self, "setHidden:", 1);
    }
  }
}

- (void)updateFont
{
  id v2;

  -[UIPrinterSearchingView messageAndSpinner](self, "messageAndSpinner");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFont");

}

- (UIPrintMessageAndSpinnerView)messageAndSpinner
{
  return (UIPrintMessageAndSpinnerView *)objc_loadWeakRetained((id *)&self->_messageAndSpinner);
}

- (void)setMessageAndSpinner:(id)a3
{
  objc_storeWeak((id *)&self->_messageAndSpinner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageAndSpinner);
}

@end
