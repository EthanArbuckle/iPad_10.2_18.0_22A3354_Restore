@implementation OBBaseWelcomeController

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[OBBaseWelcomeController updateDirectionalLayoutMargins](self, "updateDirectionalLayoutMargins");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[OBBaseWelcomeController updateDirectionalLayoutMargins](self, "updateDirectionalLayoutMargins");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[OBBaseWelcomeController updateDirectionalLayoutMargins](self, "updateDirectionalLayoutMargins");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  if (-[OBBaseWelcomeController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE395548))
    -[OBBaseWelcomeController setTemplateType:](self, "setTemplateType:", 2);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[OBBaseWelcomeController _presentationStyleValidationCheck](self, "_presentationStyleValidationCheck");
}

- (void)updateDirectionalLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[OBBaseWelcomeController directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[OBBaseWelcomeController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v4, v6, v8, v10);

}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSDirectionalEdgeInsets result;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController insetsForTemplateType:](self, "insetsForTemplateType:", objc_msgSend(v3, "templateType"));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.trailing = v15;
  result.bottom = v14;
  result.leading = v13;
  result.top = v12;
  return result;
}

- (NSDirectionalEdgeInsets)insetsForTemplateType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  NSDirectionalEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {

  }
  else
  {
    -[OBBaseWelcomeController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");

    if (v7 == 2)
    {
      v8 = 5.0;
      goto LABEL_5;
    }
  }
  v8 = 5.0;
  *(double *)&v10 = 0.0;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
    case 9uLL:
      v8 = 34.0;
      v9 = 44.0;
      goto LABEL_19;
    case 2uLL:
    case 4uLL:
    case 8uLL:
      v9 = 24.0;
      v11 = 24.0;
      goto LABEL_20;
    case 5uLL:
    case 7uLL:
      v9 = 16.0;
      v11 = 16.0;
      goto LABEL_20;
    case 6uLL:
      -[OBBaseWelcomeController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[OBDevice currentDevice](OBDevice, "currentDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBBaseWelcomeController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bounds");
        v18 = objc_msgSend(v14, "templateTypeForBoundsWidth:", v17);

        if (v18 != 6 && !-[OBBaseWelcomeController _isBuddyiPad](self))
        {
          -[OBBaseWelcomeController insetsForTemplateType:](self, "insetsForTemplateType:", v18);
          v10 = v24;
          v9 = v25;
          v8 = v26;
          goto LABEL_20;
        }
      }
      if (!self
        || !-[UIViewController ob_isFormSheet](self, "ob_isFormSheet") && !-[OBBaseWelcomeController _isBuddyiPad](self))
      {
        -[OBBaseWelcomeController view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v9 = (v20 + -624.0) * 0.5;

        goto LABEL_19;
      }
      break;
    case 0xAuLL:
      v9 = 68.0;
      v8 = 0.0;
      goto LABEL_19;
    default:
      v9 = 0.0;
      v11 = 0.0;
      goto LABEL_20;
  }
LABEL_5:
  v9 = 88.0;
  *(double *)&v10 = 56.0;
LABEL_19:
  v11 = v9;
LABEL_20:
  v21 = *(double *)&v10;
  v22 = v9;
  v23 = v8;
  result.trailing = v11;
  result.bottom = v23;
  result.leading = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isBuddyiPad
{
  void *v1;
  _BOOL8 v2;

  if (!a1 || !objc_msgSend(a1, "conformsToProtocol:", &unk_1EE395548))
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom") == 1;

  return v2;
}

- (uint64_t)_isInFormSheet
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    return (objc_msgSend((id)result, "ob_isFormSheet") & 1) != 0 || -[OBBaseWelcomeController _isBuddyiPad](v1);
  }
  return result;
}

+ (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "_preferredContentSizeInBuddy:", 0);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)preferredContentSizeInSetupAssistant
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "_preferredContentSizeInBuddy:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)navigationBarScrollToEdgeBehavior
{
  return 1;
}

- (double)autoScrollEdgeTransitionDistance
{
  return 16.0;
}

- (id)navigationItem
{
  int64_t v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (!-[OBBaseWelcomeController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[OBBaseWelcomeController navigationBarScrollToEdgeBehavior](self, "navigationBarScrollToEdgeBehavior");
    v7.receiver = self;
    v7.super_class = (Class)OBBaseWelcomeController;
    -[OBBaseWelcomeController navigationItem](&v7, sel_navigationItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBaseWelcomeController _applyChromelessToBar:navigationItem:](self, "_applyChromelessToBar:navigationItem:", v3, v4);

  }
  v6.receiver = self;
  v6.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController navigationItem](&v6, sel_navigationItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_applyChromelessToBar:(int64_t)a3 navigationItem:(id)a4
{
  double v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if ((objc_msgSend(v12, "_isManualScrollEdgeAppearanceEnabled") & 1) == 0)
  {
    if (a3 == 2)
    {
      objc_msgSend(v12, "_setManualScrollEdgeAppearanceEnabled:", 1);
      +[OBDevice currentDevice](OBDevice, "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "type") == 2;

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34E8]), "initWithIdiom:", v8);
      objc_msgSend(v9, "configureWithTransparentBackground");
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v10);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A30]), "initWithBarAppearance:", v9);
      objc_msgSend(v12, "setStandardAppearance:", v11);

      objc_msgSend(v12, "_setBackgroundHidden:", 1);
    }
    else if (a3 == 1)
    {
      -[OBBaseWelcomeController autoScrollEdgeTransitionDistance](self, "autoScrollEdgeTransitionDistance");
      *(float *)&v6 = v6;
      objc_msgSend(v12, "ob_applyAutomaticScrollToEdgeBehaviorWithDistance:", fmaxf(*(float *)&v6, 16.0));
    }
  }

}

- (void)_presentationStyleValidationCheck
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_199FE5000, a2, OS_LOG_TYPE_FAULT, "The modal presentation style %@ is not supported; you must use UIModalPresentationFullScreen or UIModalPresentationFormSheet",
    (uint8_t *)&v2,
    0xCu);
}

+ (CGSize)_preferredContentSizeInBuddy:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[OBDevice currentDevice](OBDevice, "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;

    if (v7 >= v10)
      v11 = v10;
    else
      v11 = v7;
    v12 = fmin(v11 + -88.0, 820.0);
    v13 = 624.0;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v12;
  result.width = v13;
  return result;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;

  objc_msgSend((id)objc_opt_class(), "_preferredContentSizeInBuddy:", -[OBBaseWelcomeController templateType](self, "templateType") == 2);
  v4 = v3;
  v6 = v5;
  -[OBBaseWelcomeController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[OBBaseWelcomeController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v6 = v6 - CGRectGetHeight(v13);

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

@end
