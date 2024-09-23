@implementation PXPeopleNamePickerPersonCell

- (PXPeopleNamePickerPersonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXPeopleNamePickerPersonCell *v4;
  PXPeopleScalableAvatarView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXPeopleNamePickerPersonCell;
  v4 = -[PXPeopleNamePickerCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PXPeopleScalableAvatarView);
    -[PXPeopleNamePickerCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleNamePickerPersonCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v5);
    -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXPeopleScalableAvatarView setAccessibilityIgnoresInvertColors:](v5, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXPeopleNamePickerCell baseConstraints](v4, "baseConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeConstraints:", v8);

    -[PXPeopleNamePickerCell setBaseConstraints:](v4, "setBaseConstraints:", 0);
    _NSDictionaryOfVariableBindings(CFSTR("avatarView, titleLabel"), v5, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatarView]-20-[titleLabel]-|"), 1024, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v10);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[avatarView]-|"), 0, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraints:", v11);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, v5, 8, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addConstraint:", v12);

    objc_storeWeak((id *)&v4->_personAvatarView, v5);
  }
  return v4;
}

- (void)setPerson:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleNamePickerPersonCell personAvatarView](self, "personAvatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerson:", v4);

}

- (PHPerson)person
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  -[PXPeopleNamePickerPersonCell personAvatarView](self, "personAvatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerCell.m"), 89, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.personAvatarView.person"), v9);
LABEL_6:

    return (PHPerson *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleNamePickerCell.m"), 89, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.personAvatarView.person"), v9, v11);

    goto LABEL_6;
  }
  return (PHPerson *)v5;
}

- (PXPeopleScalableAvatarView)personAvatarView
{
  return (PXPeopleScalableAvatarView *)objc_loadWeakRetained((id *)&self->_personAvatarView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personAvatarView);
}

@end
