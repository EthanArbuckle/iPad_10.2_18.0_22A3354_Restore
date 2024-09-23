@implementation PXSharedLibraryInvitationView

- (PXSharedLibraryInvitationView)initWithFrame:(CGRect)a3
{
  PXSharedLibraryInvitationView *v3;
  void *v4;
  void *v5;
  PXSharedLibraryInvitationContentView *v6;
  PXSharedLibraryInvitationContentView *invitationContentView;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[6];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)PXSharedLibraryInvitationView;
  v3 = -[PXSharedLibraryInvitationView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXSharedLibraryInvitationView _setCornerRadius:](v3, "_setCornerRadius:", 10.0);
    -[PXSharedLibraryInvitationView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(PXSharedLibraryInvitationContentView);
    invitationContentView = v3->_invitationContentView;
    v3->_invitationContentView = v6;

    -[PXSharedLibraryInvitationContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_invitationContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v3->_invitationContentView);
    v8 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithPaletteColors:", v10);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "configurationByApplyingConfiguration:", v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationByApplyingConfiguration:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v37);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v12);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[PXSharedLibraryInvitationContentView topAnchor](v3->_invitationContentView, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v34;
    -[PXSharedLibraryInvitationContentView leadingAnchor](v3->_invitationContentView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    v13 = v5;
    objc_msgSend(v5, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v30;
    objc_msgSend(v12, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView trailingAnchor](v3->_invitationContentView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27, 12.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v26;
    objc_msgSend(v12, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v14;
    objc_msgSend(v5, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryInvitationContentView bottomAnchor](v3->_invitationContentView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v17;
    objc_msgSend(v13, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 16.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v3);
    -[PXSharedLibraryInvitationView addInteraction:](v3, "addInteraction:", v22);

  }
  return v3;
}

- (void)setOwner:(id)a3
{
  -[PXSharedLibraryInvitationContentView setOwner:](self->_invitationContentView, "setOwner:", a3);
}

- (PXSharedLibraryParticipant)owner
{
  return -[PXSharedLibraryInvitationContentView owner](self->_invitationContentView, "owner");
}

- (id)focusEffect
{
  void *v3;
  void *v4;

  +[PXFocusInfo focusInfoWithView:](PXFocusInfo, "focusInfoWithView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeHaloEffectForSourceView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)traitCollection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PXSharedLibraryInvitationView overrideTraitCollection](self, "overrideTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXSharedLibraryInvitationView;
    -[PXSharedLibraryInvitationView traitCollection](&v8, sel_traitCollection);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryInvitationView;
  v4 = a3;
  -[PXSharedLibraryInvitationView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryInvitationView traitCollection](self, "traitCollection", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryInvitationView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && v6 != v7)
    objc_msgSend(v8, "invitationViewSizeThatFitsDidChange:", self);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PXSharedLibraryInvitationView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E512B178;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PXSharedLibraryInvitationViewDelegate)delegate
{
  return (PXSharedLibraryInvitationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitationContentView, 0);
}

id __87__PXSharedLibraryInvitationView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "No delegate available to handle context menu in PXSharedLibraryInvitationView!", v7, 2u);
    }

  }
  objc_msgSend(v2, "contextMenuActionsForInvitationView:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
