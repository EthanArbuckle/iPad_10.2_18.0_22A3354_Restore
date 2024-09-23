@implementation OBSetupAssistantPasscodeViewController

- (void)loadView
{
  objc_super v3;

  -[OBWelcomeController setIncludePaddingAboveContentView:](self, "setIncludePaddingAboveContentView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantPasscodeViewController;
  -[OBWelcomeController loadView](&v3, sel_loadView);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantPasscodeViewController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[OBWelcomeController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  -[OBWelcomeController setShouldAdjustButtonTrayForKeyboard:](self, "setShouldAdjustButtonTrayForKeyboard:", 1);
}

- (void)animateDetailText:(id)a3 animationType:(unint64_t)a4 heightDifference:(id)a5
{
  void (**v8)(_QWORD, double);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD, double))a5;
  v9 = a3;
  -[OBWelcomeController headerView](self, "headerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDetailText:", v9);

  -[OBWelcomeController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  -[OBWelcomeController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController headerView](self, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  LODWORD(v18) = 1112014848;
  LODWORD(v20) = 1132068864;
  objc_msgSend(v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v19, 0.0, v18, v20);
  v22 = v21;

  if (v8 && !-[OBSetupAssistantPasscodeViewController shouldAnimateEntireView](self, "shouldAnimateEntireView"))
    v8[2](v8, v14 - v22);
  v23 = CFSTR("fade");
  if (!a4)
    v23 = CFSTR("fromLeft");
  if (a4 == 1)
    v24 = CFSTR("fromRight");
  else
    v24 = v23;
  -[OBWelcomeController headerView](self, "headerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "detailLabel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[OBWelcomeController contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[OBWelcomeController headerView](self, "headerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "detailLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBWelcomeController contentView](self, "contentView", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v32 = objc_claimAutoreleasedReturnValue();

      -[OBWelcomeController _animatePushTransitionForViews:transitionSubtype:](self, "_animatePushTransitionForViews:transitionSubtype:", v32, v24);
      goto LABEL_15;
    }
  }
  else
  {

  }
  _OBLoggingFacility();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[OBWelcomeController headerView](self, "headerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBWelcomeController contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v33;
    v38 = 2112;
    v39 = v34;
    _os_log_impl(&dword_199FE5000, v32, OS_LOG_TYPE_DEFAULT, "Animating DetailText failed as prerequisite headerView and contentView was not fulfilled headerView:%@, contentView:%@", buf, 0x16u);

  }
LABEL_15:

}

- (BOOL)shouldAnimateEntireView
{
  void *v3;
  double MaxY;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  -[OBWelcomeController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v11);

  v5 = MaxY + 22.0;
  -[OBSetupAssistantPasscodeViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = CGRectGetMaxY(v12);
  -[OBWelcomeController keyboardFrame](self, "keyboardFrame");
  v9 = v7 - v8;

  return v5 > v9;
}

@end
