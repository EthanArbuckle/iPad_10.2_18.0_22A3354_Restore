@implementation PXPeopleConfirmationLoadingView

- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3 person:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  PXPeopleConfirmationLoadingView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXPeopleScalableAvatarView *v17;
  UILabel *v18;
  UILabel *noneFoundLabel;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  PXPeopleScalableAvatarView *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  objc_super v81;
  _QWORD v82[15];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v82[13] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v81.receiver = self;
  v81.super_class = (Class)PXPeopleConfirmationLoadingView;
  v12 = -[PXPeopleConfirmationLoadingView initWithFrame:](&v81, sel_initWithFrame_, x, y, width, height);
  if (!v12)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmationLoadingMessageText"), CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  v79 = v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v14);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setHidden:", 1);
  objc_storeStrong((id *)&v12->_contentLoadingView, v16);
  -[PXPeopleConfirmationLoadingView addSubview:](v12, "addSubview:", v16);
  v12->_loadingState = 0;
  objc_storeStrong((id *)&v12->_person, a4);
  v17 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPeopleScalableAvatarView setPerson:](v17, "setPerson:", v11);
  objc_storeStrong((id *)&v12->_avatarView, v17);
  -[PXPeopleConfirmationLoadingView addSubview:](v12, "addSubview:", v17);
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  noneFoundLabel = v12->_noneFoundLabel;
  v12->_noneFoundLabel = v18;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_noneFoundLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](v12->_noneFoundLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](v12->_noneFoundLabel, "setTextAlignment:", 1);
  v20 = v11;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PXPeopleConfirmationLoadingView.m"), 104, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("person"), v38);
LABEL_11:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_descriptionForAssertionMessage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PXPeopleConfirmationLoadingView.m"), 104, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("person"), v38, v40);

    goto LABEL_11;
  }
LABEL_4:
  objc_msgSend(v20, "px_localizedName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v11;
  v77 = v21;
  v78 = v20;
  if (objc_msgSend(v21, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v20, 0, CFSTR("PXPeopleConfirmationNoneFoundNamedMessage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v21;
    PXStringWithValidatedFormat();
    v23 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility(v20, 0, CFSTR("PXPeopleConfirmationNoneFoundUnnamedMessage"));
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v23;
  -[UILabel setText:](v12->_noneFoundLabel, "setText:", v23, v41);
  -[UILabel setHidden:](v12->_noneFoundLabel, "setHidden:", 1);
  -[PXPeopleConfirmationLoadingView addSubview:](v12, "addSubview:", v12->_noneFoundLabel);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v12->_noneFoundLabel, "setFont:", v24);

  -[UILabel setAdjustsFontForContentSizeCategory:](v12->_noneFoundLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v25 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  -[PXPeopleConfirmationLoadingView addLayoutGuide:](v12, "addLayoutGuide:", v25);
  v60 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v25, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView topAnchor](v12, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v73 = v25;
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v74;
  objc_msgSend(v25, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView heightAnchor](v12, "heightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:multiplier:", v71, 0.27);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v70;
  -[PXPeopleScalableAvatarView topAnchor](v17, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v67;
  -[PXPeopleScalableAvatarView heightAnchor](v17, "heightAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView heightAnchor](v12, "heightAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:multiplier:", v65, 0.25);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v64;
  -[PXPeopleScalableAvatarView widthAnchor](v17, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleScalableAvatarView heightAnchor](v17, "heightAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v61;
  -[PXPeopleScalableAvatarView centerXAnchor](v17, "centerXAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView centerXAnchor](v12, "centerXAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v57;
  -[PXPeopleScalableAvatarView bottomAnchor](v17, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](v12->_noneFoundLabel, "firstBaselineAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v53, -28.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[6] = v51;
  -[UILabel centerXAnchor](v12->_noneFoundLabel, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView centerXAnchor](v12, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v82[7] = v48;
  -[UILabel widthAnchor](v12->_noneFoundLabel, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToConstant:", 325.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v82[8] = v46;
  objc_msgSend(v16, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView topAnchor](v12, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82[9] = v43;
  objc_msgSend(v16, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView trailingAnchor](v12, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82[10] = v27;
  objc_msgSend(v16, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView bottomAnchor](v12, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v82[11] = v30;
  objc_msgSend(v16, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView leadingAnchor](v12, "leadingAnchor");
  v54 = v16;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v52 = v17;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v82[12] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "activateConstraints:", v34);

  v11 = v80;
LABEL_8:

  return v12;
}

- (PXPeopleConfirmationLoadingView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleConfirmationLoadingView.m"), 166, CFSTR("%s is not available as initializer"), "-[PXPeopleConfirmationLoadingView init]");

  abort();
}

- (PXPeopleConfirmationLoadingView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleConfirmationLoadingView.m"), 170, CFSTR("%s is not available as initializer"), "-[PXPeopleConfirmationLoadingView initWithFrame:]");

  abort();
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleConfirmationLoadingView;
  -[PXPeopleConfirmationLoadingView layoutSubviews](&v5, sel_layoutSubviews);
  -[PXPeopleConfirmationLoadingView person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationLoadingView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerson:", v3);

}

- (void)setLoadingState:(int64_t)a3
{
  if (self->_loadingState != a3)
  {
    self->_loadingState = a3;
    if (a3)
    {
      if (a3 == 2)
      {
        -[PXPeopleConfirmationLoadingView _updateViewVisibilityForLoadingStateNoneFound](self, "_updateViewVisibilityForLoadingStateNoneFound");
      }
      else if (a3 == 1)
      {
        -[PXPeopleConfirmationLoadingView _updateViewVisibilityForLoadingStateLoading](self, "_updateViewVisibilityForLoadingStateLoading");
      }
    }
    else
    {
      -[PXPeopleConfirmationLoadingView _updateViewVisibilityForLoadingStateInitial](self, "_updateViewVisibilityForLoadingStateInitial");
    }
  }
}

- (void)_updateViewVisibilityForLoadingStateLoading
{
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleConfirmationLoadingView noneFoundLabel](self, "noneFoundLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXPeopleConfirmationLoadingView contentLoadingView](self, "contentLoadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[PXPeopleConfirmationLoadingView avatarView](self, "avatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)_updateViewVisibilityForLoadingStateNoneFound
{
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleConfirmationLoadingView avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PXPeopleConfirmationLoadingView noneFoundLabel](self, "noneFoundLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[PXPeopleConfirmationLoadingView contentLoadingView](self, "contentLoadingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)_updateViewVisibilityForLoadingStateInitial
{
  void *v3;
  void *v4;
  id v5;

  -[PXPeopleConfirmationLoadingView noneFoundLabel](self, "noneFoundLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXPeopleConfirmationLoadingView contentLoadingView](self, "contentLoadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  -[PXPeopleConfirmationLoadingView avatarView](self, "avatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (int64_t)loadingState
{
  return self->_loadingState;
}

- (UIContentUnavailableView)contentLoadingView
{
  return self->_contentLoadingView;
}

- (UILabel)noneFoundLabel
{
  return self->_noneFoundLabel;
}

- (PXPerson)person
{
  return self->_person;
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_noneFoundLabel, 0);
  objc_storeStrong((id *)&self->_contentLoadingView, 0);
}

@end
