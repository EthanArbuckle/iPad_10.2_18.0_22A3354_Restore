@implementation PXPeopleBootstrapSummaryViewController

- (PXPeopleBootstrapSummaryViewController)initWithContext:(id)a3
{
  id v5;
  PXPeopleBootstrapSummaryViewController *v6;
  PXPeopleBootstrapSummaryViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  v6 = -[PXPeopleBootstrapSummaryViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bootstrapContext, a3);
    -[PXPeopleBootstrapSummaryViewController setTitle:](v7, "setTitle:", &stru_1E5149688);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PXPeopleScalableAvatarView *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PXPeopleBootstrapSummaryViewController *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[11];

  v50[9] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  -[PXPeopleBootstrapSummaryViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[PXPeopleBootstrapSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  -[PXPeopleScalableAvatarView setUseLowMemoryMode:](v5, "setUseLowMemoryMode:", -[PXPeopleBootstrapSummaryViewController useLowMemoryMode](self, "useLowMemoryMode"));
  -[PXPeopleBootstrapSummaryViewController bootstrapContext](self, "bootstrapContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "face");
  v7 = objc_claimAutoreleasedReturnValue();
  v47 = v6;
  v48 = (void *)v7;
  if (v7)
  {
    -[PXPeopleScalableAvatarView setFace:](v5, "setFace:", v7);
  }
  else
  {
    objc_msgSend(v6, "sourcePerson");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleScalableAvatarView setPerson:](v5, "setPerson:", v8);

  }
  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_storeWeak((id *)&self->_descriptionLabel, v9);
  objc_msgSend(v3, "addSubview:", v9);
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView centerYAnchor](v5, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = 1132068864;
  v42 = v14;
  objc_msgSend(v14, "setPriority:", v15);
  v35 = (void *)MEMORY[0x1E0CB3718];
  -[PXPeopleScalableAvatarView topAnchor](v5, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v45, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v44;
  -[PXPeopleScalableAvatarView centerXAnchor](v5, "centerXAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v3;
  objc_msgSend(v3, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v39;
  v50[2] = v14;
  -[PXPeopleScalableAvatarView heightAnchor](v5, "heightAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView widthAnchor](v5, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v36;
  -[PXPeopleScalableAvatarView heightAnchor](v5, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:multiplier:", v33, 0.35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v31;
  objc_msgSend(v9, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView bottomAnchor](v5, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 95.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v27;
  objc_msgSend(v9, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  objc_msgSend(v11, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v25, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v17;
  v30 = v11;
  objc_msgSend(v11, "trailingAnchor");
  v32 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v19, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v20;
  objc_msgSend(v16, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v22, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v24);

  -[PXPeopleBootstrapSummaryViewController updateUI](v32, "updateUI");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  -[PXPeopleBootstrapSummaryViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXPeopleBootstrapSummaryViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  -[PXPeopleBootstrapSummaryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXPeopleBootstrapSummaryViewController updateUI](self, "updateUI");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleBootstrapSummaryViewController;
  -[PXPeopleBootstrapSummaryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if ((-[PXPeopleBootstrapSummaryViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[PXPeopleBootstrapSummaryViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[PXPeopleBootstrapSummaryViewController configControllerDelegate](self, "configControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerWillBePopped:", self);

  }
}

- (void)updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPeopleBootstrapSummaryViewController _localizedPromptString](self, "_localizedPromptString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapSummaryViewController promptLabel](self, "promptLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[PXPeopleBootstrapSummaryViewController _localizedDescriptionString](self, "_localizedDescriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapSummaryViewController descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[PXPeopleBootstrapSummaryViewController _updateNavigationBarForCurrentTraitCollection](self, "_updateNavigationBarForCurrentTraitCollection");
}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__PXPeopleBootstrapSummaryViewController__updateNavigationBarForCurrentTraitCollection__block_invoke;
  v2[3] = &unk_1E5149198;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (id)_localizedPromptString
{
  return 0;
}

- (id)_localizedDescriptionString
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  -[PXPeopleBootstrapSummaryViewController bootstrapContext](self, "bootstrapContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapSummaryViewController.m"), 221, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("bootstrapContext.sourcePerson"), v15);
LABEL_20:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapSummaryViewController.m"), 221, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("bootstrapContext.sourcePerson"), v15, v17);

    goto LABEL_20;
  }
LABEL_3:
  switch(objc_msgSend(v4, "bootstrapType"))
  {
    case 0:
      v6 = CFSTR("PXPeopleBootstrapFavoriteFinalPrompt");
      goto LABEL_9;
    case 1:
      objc_msgSend(v4, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = CFSTR("PXPeopleBootstrapNameWithNameFinalPrompt");
        goto LABEL_12;
      }
      v11 = CFSTR("PXPeopleBootstrapNoNameFinalPrompt");
      goto LABEL_15;
    case 2:
      v6 = CFSTR("PXPeopleBootstrapAddFinalPrompt");
LABEL_9:
      PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3:
      objc_msgSend(v4, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = CFSTR("PXPeopleBootstrapOtherWithNameFinalPrompt");
LABEL_12:
        PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v10, CFSTR("%@"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = CFSTR("PXPeopleBootstrapOtherWithoutNameFinalPrompt");
LABEL_15:
        PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, v11);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

LABEL_17:
      return v7;
    default:
      v7 = &stru_1E5149688;
      goto LABEL_17;
  }
}

- (id)_localizedTitleString
{
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  -[PXPeopleBootstrapSummaryViewController bootstrapContext](self, "bootstrapContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
    goto LABEL_13;
  }
  v7 = objc_msgSend(v4, "bootstrapType");
  objc_msgSend(v4, "sourcePerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapSummaryViewController.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v14);
LABEL_16:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapSummaryViewController.m"), 258, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v14, v16);

    goto LABEL_16;
  }
LABEL_5:
  switch(v7)
  {
    case 0:
      v9 = CFSTR("PXPeopleBootstrapTypeFavoriteNamingTitle");
      goto LABEL_10;
    case 1:
      v9 = CFSTR("PXPeopleBootstrapTypeNameNamingTitle");
      goto LABEL_10;
    case 2:
      v9 = CFSTR("PXPeopleBootstrapTypeAddNamingTitle");
LABEL_10:
      PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v8, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPeoplePetsHomeTitle(objc_msgSend(v10, "px_peoplePetsHomeVisibility"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = &stru_1E5149688;
      break;
  }

LABEL_13:
  return v6;
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  +[PXPeopleBootstrap preferredBootstrapSize](PXPeopleBootstrap, "preferredBootstrapSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  return (PXPeoplePickerConfigurationControllerDelegate *)objc_loadWeakRetained((id *)&self->_configControllerDelegate);
}

- (void)setConfigControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configControllerDelegate, a3);
}

- (UILabel)promptLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_promptLabel);
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_descriptionLabel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_promptLabel);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

void __87__PXPeopleBootstrapSummaryViewController__updateNavigationBarForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_localizedTitleString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v2);

}

@end
