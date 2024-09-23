@implementation PXPeopleNamePickerContactCell

- (PXPeopleNamePickerContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXPeopleNamePickerContactCell *v4;
  id v5;
  id v6;
  id v7;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PXPeopleNamePickerContactCell;
  v4 = -[PXPeopleNamePickerCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97468]);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[PXPeopleNamePickerCell titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerContactCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v6);
    objc_msgSend(v9, "addSubview:", v5);
    objc_msgSend(v6, "addSubview:", v8);
    objc_msgSend(v6, "addSubview:", v7);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "smallSystemFontSize");
    objc_msgSend(v10, "systemFontOfSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v11);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleNamePickerCell baseConstraints](v4, "baseConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeConstraints:", v12);

    -[PXPeopleNamePickerCell setBaseConstraints:](v4, "setBaseConstraints:", 0);
    _NSDictionaryOfVariableBindings(CFSTR("avatarView, labelsContainer"), v5, v6, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatarView]-20-[labelsContainer]-|"), 1024, 0, v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v13);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[avatarView]-|"), 0, 0, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v14);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, v5, 8, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraint:", v15);

    _NSDictionaryOfVariableBindings(CFSTR("titleLabel, subtitleLabel"), v8, v7, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[titleLabel]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[subtitleLabel]|"), 0, 0, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v18);

    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[titleLabel]|"), 0, 0, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v8, 10, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v22);

    objc_msgSend(v6, "addConstraints:", v21);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v21);
    -[PXPeopleNamePickerContactCell setConstraintsForHiddenSubtitle:](v4, "setConstraintsForHiddenSubtitle:", v21);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[titleLabel]-[subtitleLabel]|"), 0, 0, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConstraints:", v23);
    -[PXPeopleNamePickerContactCell setConstraintsForVisibleSubtitle:](v4, "setConstraintsForVisibleSubtitle:", v23);
    objc_storeWeak((id *)&v4->_contactAvatarView, v5);
    objc_storeWeak((id *)&v4->_subtitleLabel, v7);
    objc_storeWeak((id *)&v4->_labelsContainer, v6);

  }
  return v4;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[PXPeopleNamePickerContactCell subtitleLabel](self, "subtitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerContactCell constraintsForHiddenSubtitle](self, "constraintsForHiddenSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleNamePickerContactCell constraintsForVisibleSubtitle](self, "constraintsForVisibleSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = v7 == 0;
  if (v7)
    v9 = v4;
  else
    v9 = v5;
  if (v7)
    v10 = v5;
  else
    v10 = v4;
  objc_msgSend(v3, "setHidden:", v8);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleNamePickerContactCell;
  -[PXPeopleNamePickerContactCell updateConstraints](&v11, sel_updateConstraints);

}

- (CNAvatarView)contactAvatarView
{
  return (CNAvatarView *)objc_loadWeakRetained((id *)&self->_contactAvatarView);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (UIView)labelsContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_labelsContainer);
}

- (void)setLabelsContainer:(id)a3
{
  objc_storeWeak((id *)&self->_labelsContainer, a3);
}

- (NSArray)constraintsForVisibleSubtitle
{
  return self->_constraintsForVisibleSubtitle;
}

- (void)setConstraintsForVisibleSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForVisibleSubtitle, a3);
}

- (NSArray)constraintsForHiddenSubtitle
{
  return self->_constraintsForHiddenSubtitle;
}

- (void)setConstraintsForHiddenSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForHiddenSubtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsForHiddenSubtitle, 0);
  objc_storeStrong((id *)&self->_constraintsForVisibleSubtitle, 0);
  objc_destroyWeak((id *)&self->_labelsContainer);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_contactAvatarView);
}

@end
