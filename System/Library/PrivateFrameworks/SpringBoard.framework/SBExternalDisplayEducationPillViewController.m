@implementation SBExternalDisplayEducationPillViewController

- (SBExternalDisplayEducationPillViewController)initWithExtendedDisplayEnabled:(BOOL)a3
{
  SBExternalDisplayEducationPillViewController *v4;
  SBExternalDisplayEducationPillViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBExternalDisplayEducationPillViewController;
  v4 = -[SBExternalDisplayEducationPillViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_extendedDisplayEnabled = a3;
    -[SBExternalDisplayEducationPillViewController loadViewIfNeeded](v4, "loadViewIfNeeded");
    -[PLPillView intrinsicContentSize](v5->_pillView, "intrinsicContentSize");
    -[SBExternalDisplayEducationPillViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PLPillView *v16;
  PLPillView *pillView;
  PLPillView *v18;
  void *v19;
  void *v20;
  void *v21;
  PLPillView *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SBExternalDisplayEducationPillViewController;
  -[SBExternalDisplayEducationPillViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[SBExternalDisplayEducationPillViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEA658]);
  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("display"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithImage:", v9);

  v11 = objc_alloc(MEMORY[0x1E0CEA658]);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.forward"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithImage:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("STAGE_MANAGER_EXTENDED_DISPLAY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (PLPillView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3E0]), "initWithLeadingAccessoryView:trailingAccessoryView:", v10, v13);
  pillView = self->_pillView;
  self->_pillView = v16;

  v18 = self->_pillView;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v15, 1);
  v25[0] = v19;
  -[SBExternalDisplayEducationPillViewController _pillSubtitleContentItem](self, "_pillSubtitleContentItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPillView setCenterContentItems:](v18, "setCenterContentItems:", v21);

  v22 = self->_pillView;
  objc_msgSend(v3, "bounds");
  -[PLPillView setFrame:](v22, "setFrame:");
  -[PLPillView setAutoresizingMask:](self->_pillView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_pillView);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleSingleTap_);
  objc_msgSend(v23, "setNumberOfTouchesRequired:", 1);
  objc_msgSend(v23, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v3, "addGestureRecognizer:", v23);

}

- (id)_pillSubtitleContentItem
{
  _BOOL4 extendedDisplayEnabled;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  extendedDisplayEnabled = self->_extendedDisplayEnabled;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (extendedDisplayEnabled)
    v5 = CFSTR("STAGE_MANAGER_EXTENDED_DISPLAY_ON");
  else
    v5 = CFSTR("STAGE_MANAGER_EXTENDED_DISPLAY_OFF");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithText:style:", v6, 2);
  return v7;
}

- (NSString)requestIdentifier
{
  return (NSString *)CFSTR("ExternalDisplayEducation");
}

- (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.ExternalDisplayEducation");
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return CFSTR("External Display Education");
}

- (void)_handleSingleTap:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pillViewControllerDidReceiveUserTap:", self);

}

- (SBExternalDisplayEducationPillViewControllerDelegate)delegate
{
  return (SBExternalDisplayEducationPillViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
