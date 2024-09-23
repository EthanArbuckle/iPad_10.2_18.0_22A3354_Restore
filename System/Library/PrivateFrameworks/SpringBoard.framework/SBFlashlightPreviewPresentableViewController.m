@implementation SBFlashlightPreviewPresentableViewController

- (SBFlashlightPreviewPresentableViewController)initWithFlashlightOn:(BOOL)a3
{
  SBFlashlightPreviewPresentableViewController *v4;
  SBFlashlightPreviewPresentableViewController *v5;
  SBBannerCustomTransitioningDelegate *v6;
  SBBannerCustomTransitioningDelegate *customTransitioningDelegate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFlashlightPreviewPresentableViewController;
  v4 = -[SBFlashlightPreviewPresentableViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v4->_flashlightOn = a3;
    v6 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v5->_customTransitioningDelegate;
    v5->_customTransitioningDelegate = v6;

    -[SBFlashlightPreviewPresentableViewController setTransitioningDelegate:](v5, "setTransitioningDelegate:", v5->_customTransitioningDelegate);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLPillView *v12;
  PLPillView *pillView;
  PLPillView *v14;
  void *v15;
  void *v16;
  void *v17;
  PLPillView *v18;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)SBFlashlightPreviewPresentableViewController;
  -[SBFlashlightPreviewPresentableViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[SBFlashlightPreviewPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEA658]);
  v5 = (void *)MEMORY[0x1E0CEA638];
  if (self->_flashlightOn)
    v6 = CFSTR("flashlight.on.fill");
  else
    v6 = CFSTR("flashlight.off.fill");
  v7 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithHierarchicalColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemImageNamed:withConfiguration:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithImage:", v10);

  v12 = (PLPillView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3E0]), "initWithLeadingAccessoryView:trailingAccessoryView:", v11, 0);
  pillView = self->_pillView;
  self->_pillView = v12;

  v14 = self->_pillView;
  -[SBFlashlightPreviewPresentableViewController _pillTitleContentItem](self, "_pillTitleContentItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  -[SBFlashlightPreviewPresentableViewController _pillSubtitleContentItem](self, "_pillSubtitleContentItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPillView setCenterContentItems:](v14, "setCenterContentItems:", v17);

  v18 = self->_pillView;
  objc_msgSend(v3, "bounds");
  -[PLPillView setFrame:](v18, "setFrame:");
  -[PLPillView setAutoresizingMask:](self->_pillView, "setAutoresizingMask:", 18);
  -[PLPillView setMaterialGroupNameBase:](self->_pillView, "setMaterialGroupNameBase:", CFSTR("SBFlashlightPreviewPresentableViewControllerMaterialGroup"));
  objc_msgSend(v3, "addSubview:", self->_pillView);
  -[PLPillView intrinsicContentSize](self->_pillView, "intrinsicContentSize");
  -[SBFlashlightPreviewPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[SBFlashlightPreviewPresentableViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);

}

- (id)_pillTitleContentItem
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FLASHLIGHT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v10 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithString:attributes:", v3, v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithAttributedText:", v7);
  return v8;
}

- (id)_pillSubtitleContentItem
{
  _BOOL4 flashlightOn;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  flashlightOn = self->_flashlightOn;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (flashlightOn)
    v5 = CFSTR("FLASHLIGHT_ON");
  else
    v5 = CFSTR("FLASHLIGHT_OFF");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v13 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3D0]), "initWithAttributedText:", v10);
  return v11;
}

- (NSString)requestIdentifier
{
  return (NSString *)CFSTR("SBFlashlightPreviewPresentableViewControllerRequestIdentifier");
}

- (NSString)requesterIdentifier
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "requesterIdentifier");
}

+ (NSString)requesterIdentifier
{
  return (NSString *)CFSTR("SBFlashlightPreviewPresentableViewControllerRequesterIdentifier");
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  return 1;
}

- (BOOL)isFlashlightOn
{
  return self->_flashlightOn;
}

- (void)setFlashlightOn:(BOOL)a3
{
  self->_flashlightOn = a3;
}

- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate
{
  return self->_customTransitioningDelegate;
}

- (void)setCustomTransitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
