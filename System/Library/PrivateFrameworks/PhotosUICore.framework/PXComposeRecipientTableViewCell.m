@implementation PXComposeRecipientTableViewCell

- (PXComposeRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXComposeRecipientTableViewCell *v4;
  PXComposeRecipientTableCellModel *v5;
  PXComposeRecipientTableCellModel *cellModel;
  UILabel *v7;
  UILabel *localizedNameLabel;
  void *v9;
  UILabel *v10;
  UILabel *addressLabel;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *accessoryImageView;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXComposeRecipientTableViewCell;
  v4 = -[PXComposeRecipientTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PXComposeRecipientTableCellModel);
    cellModel = v4->_cellModel;
    v4->_cellModel = v5;

    -[PXComposeRecipientTableCellModel registerChangeObserver:context:](v4->_cellModel, "registerChangeObserver:context:", v4, PXComposeRecipientTableCellModelObservationContext);
    -[PXComposeRecipientTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    localizedNameLabel = v4->_localizedNameLabel;
    v4->_localizedNameLabel = v7;

    -[PXComposeRecipientTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_localizedNameLabel);

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    addressLabel = v4->_addressLabel;
    v4->_addressLabel = v10;

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_addressLabel, "setFont:", v12);

    -[PXComposeRecipientTableViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_addressLabel);

    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = v14;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setSymbolConfiguration:](v4->_accessoryImageView, "setSymbolConfiguration:", v16);

    -[PXComposeRecipientTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_accessoryImageView);
    -[PXComposeRecipientTableViewCell _updateAvatarView](v4, "_updateAvatarView");
    -[PXComposeRecipientTableViewCell _updateLocalizedNameLabel](v4, "_updateLocalizedNameLabel");
    -[PXComposeRecipientTableViewCell _updateAddressLabel](v4, "_updateAddressLabel");
    -[PXComposeRecipientTableViewCell _updateAccessoryImageView](v4, "_updateAccessoryImageView");
  }
  return v4;
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_localizedNameLabel;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UILabel **p_localizedNameLabel;
  double v17;
  double v18;
  double v19;
  UILabel **p_addressLabel;
  double v21;
  double v22;
  uint64_t v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double MaxX;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MidY;
  double v46;
  double MaxY;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v58.receiver = self;
  v58.super_class = (Class)PXComposeRecipientTableViewCell;
  -[PXComposeRecipientTableViewCell layoutSubviews](&v58, sel_layoutSubviews);
  -[PXComposeRecipientTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  +[PXComposeRecipientTableCellModel imageDiameter](PXComposeRecipientTableCellModel, "imageDiameter");
  v13 = v12;
  +[PXComposeRecipientTableCellModel imageInset](PXComposeRecipientTableCellModel, "imageInset");
  v15 = v14;
  p_localizedNameLabel = &self->_localizedNameLabel;
  -[UILabel sizeThatFits:](self->_localizedNameLabel, "sizeThatFits:", v9, v11);
  v54 = v17;
  v19 = v18;
  p_addressLabel = &self->_addressLabel;
  -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v9, v11);
  v55 = v21;
  v52 = v22;
  v23 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXComposeRecipientTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  v53 = v19;
  v56 = v7;
  v57 = v5;
  if (v23 == 1)
  {
    v24 = v9 - v13 - v15;
    v59.origin.x = v5;
    v59.origin.y = v7;
    v59.size.width = v9;
    v59.size.height = v11;
    v25 = CGRectGetMidY(v59) + v13 * -0.5;
    v60.origin.x = v24;
    v60.origin.y = v25;
    v60.size.width = v13;
    v60.size.height = v13;
    v26 = CGRectGetMinX(v60) - v15;
    v61.origin.x = v24;
    v61.origin.y = v25;
    v61.size.width = v13;
    v61.size.height = v13;
    v27 = CGRectGetMinX(v61) - v15;
    -[PXComposeRecipientTableViewCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    v30 = v27 - v29;

    v15 = v24;
    v31 = v54;
  }
  else
  {
    v62.origin.x = v5;
    v62.origin.y = v7;
    v62.size.width = v9;
    v62.size.height = v11;
    v51 = v11;
    v32 = v7;
    v25 = CGRectGetMidY(v62) + v13 * -0.5;
    v63.origin.x = v15;
    v63.origin.y = v25;
    v63.size.width = v13;
    v63.size.height = v13;
    v33 = v5;
    v26 = v15 + CGRectGetMaxX(v63);
    if ((-[UIImageView isHidden](self->_accessoryImageView, "isHidden") & 1) != 0)
    {
      v64.origin.x = v33;
      v64.origin.y = v32;
      v64.size.width = v9;
      v11 = v51;
      v64.size.height = v51;
      MaxX = CGRectGetMaxX(v64);
    }
    else
    {
      -[UIImageView frame](self->_accessoryImageView, "frame");
      MaxX = CGRectGetMinX(v65);
      v11 = v51;
    }
    v31 = v54;
    v30 = MaxX - v26;
  }
  -[UIView setFrame:](self->_avatarView, "setFrame:", v15, v25, v13, v13);
  -[UILabel text](*p_localizedNameLabel, "text");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  -[UILabel text](*p_addressLabel, "text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length") != 0;

  v39 = fmin(v31, v30);
  v40 = fmin(v55, v30);
  v41 = 0.0;
  if (v23 == 1)
    v42 = v39;
  else
    v42 = 0.0;
  v43 = v26 - v42;
  if (v23 == 1)
    v41 = v40;
  v44 = v26 - v41;
  v66.origin.y = v56;
  v66.origin.x = v57;
  v66.size.width = v9;
  v66.size.height = v11;
  MidY = CGRectGetMidY(v66);
  if ((v36 != 0) == v38)
  {
    -[UILabel intrinsicContentSize](*p_localizedNameLabel, "intrinsicContentSize");
    -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v43, MidY - v49, v39, v53);
    -[UILabel frame](*p_localizedNameLabel, "frame");
    MaxY = CGRectGetMaxY(v67);
LABEL_17:
    p_localizedNameLabel = p_addressLabel;
    v43 = v44;
    v39 = v40;
    v48 = v52;
    goto LABEL_18;
  }
  if (!v36)
  {
    -[UILabel intrinsicContentSize](*p_addressLabel, "intrinsicContentSize");
    MaxY = MidY + v50 * -0.5;
    goto LABEL_17;
  }
  -[UILabel intrinsicContentSize](*p_localizedNameLabel, "intrinsicContentSize");
  MaxY = MidY + v46 * -0.5;
  v48 = v53;
LABEL_18:
  -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v43, MaxY, v39, v48);
}

- (id)_textColor
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[PXComposeRecipientTableCellModel address](self->_cellModel, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (-[PXComposeRecipientTableCellModel isValidAddress](self->_cellModel, "isValidAddress"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void)_updateAvatarView
{
  void *v4;
  CNAvatarViewController *v5;
  CNAvatarViewController *contactAvatarViewController;
  UIView *v7;
  UIView *contactAvatarView;
  void *v9;
  void *v10;
  PXRoundImageView *v11;
  UIView *avatarView;
  PXRoundImageView *v13;
  void *v14;
  PXRoundImageView *customAvatarImageView;
  PXRoundImageView *v16;
  PXRoundImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[PXComposeRecipientTableCellModel contact](self->_cellModel, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!self->_contactAvatarViewController)
    {
      v5 = (CNAvatarViewController *)objc_alloc_init(MEMORY[0x1E0C97470]);
      contactAvatarViewController = self->_contactAvatarViewController;
      self->_contactAvatarViewController = v5;

      -[CNAvatarViewController view](self->_contactAvatarViewController, "view");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      contactAvatarView = self->_contactAvatarView;
      self->_contactAvatarView = v7;

      -[PXComposeRecipientTableViewCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_contactAvatarView);

    }
    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarViewController setContacts:](self->_contactAvatarViewController, "setContacts:", v10);

    v11 = self->_contactAvatarView;
    -[UIView setHidden:](self->_contactAvatarView, "setHidden:", 0);
    -[PXRoundImageView setHidden:](self->_customAvatarImageView, "setHidden:", 1);
    if (v11)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewCell+iOS.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avatarView"));

    goto LABEL_5;
  }
  -[PXComposeRecipientTableCellModel image](self->_cellModel, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  customAvatarImageView = self->_customAvatarImageView;
  if (!customAvatarImageView)
  {
    v16 = objc_alloc_init(PXRoundImageView);
    v17 = self->_customAvatarImageView;
    self->_customAvatarImageView = v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRoundImageView setBackgroundColor:](self->_customAvatarImageView, "setBackgroundColor:", v18);

    -[PXRoundImageView setAccessibilityIgnoresInvertColors:](self->_customAvatarImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXComposeRecipientTableViewCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", self->_customAvatarImageView);

    customAvatarImageView = self->_customAvatarImageView;
  }
  -[PXRoundImageView setImage:](customAvatarImageView, "setImage:", v14);
  v11 = self->_customAvatarImageView;
  -[PXRoundImageView setHidden:](self->_customAvatarImageView, "setHidden:", 0);
  -[UIView setHidden:](self->_contactAvatarView, "setHidden:", 1);

  if (!v11)
    goto LABEL_9;
LABEL_5:
  avatarView = self->_avatarView;
  self->_avatarView = &v11->super.super;
  v13 = v11;

  -[PXComposeRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLocalizedNameLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PXComposeRecipientTableCellModel name](self->_cellModel, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_localizedNameLabel, "setText:", v3);

  -[PXComposeRecipientTableViewCell _textColor](self, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_localizedNameLabel, "setTextColor:", v4);

  -[PXComposeRecipientTableCellModel address](self->_cellModel, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 32770;
  else
    v6 = 0x8000;
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], v6, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_localizedNameLabel, "setFont:", v7);
  -[PXComposeRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateAddressLabel
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXComposeRecipientTableCellModel address](self->_cellModel, "address");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_addressLabel, "setText:", v5);
  if (v5)
    v3 = 0;
  else
    v3 = 3;
  -[PXComposeRecipientTableViewCell setSelectionStyle:](self, "setSelectionStyle:", v3);
  -[PXComposeRecipientTableViewCell _textColor](self, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_addressLabel, "setTextColor:", v4);

  -[PXComposeRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateAccessoryImageView
{
  void *v3;
  void *v4;

  if (-[PXComposeRecipientTableCellModel showsCheckbox](self->_cellModel, "showsCheckbox"))
  {
    if (-[PXComposeRecipientTableCellModel checked](self->_cellModel, "checked"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_accessoryImageView, "setImage:", v3);
    -[UIImageView setTintColor:](self->_accessoryImageView, "setTintColor:", v4);
    -[UIImageView sizeToFit](self->_accessoryImageView, "sizeToFit");
    -[UIImageView setHidden:](self->_accessoryImageView, "setHidden:", 0);

  }
  else
  {
    -[UIImageView setHidden:](self->_accessoryImageView, "setHidden:", 1);
  }
  -[PXComposeRecipientTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v8 = a3;
  if ((void *)PXComposeRecipientTableCellModelObservationContext == a5)
  {
    v9 = v6 & 0x1C;
    v10 = v6 & 0x18;
    v12 = v8;
    if ((v6 & 0x81) != 0)
    {
      -[PXComposeRecipientTableViewCell _updateAvatarView](self, "_updateAvatarView");
      v8 = v12;
    }
    v11 = v6 & 0x60;
    if (v9)
    {
      -[PXComposeRecipientTableViewCell _updateLocalizedNameLabel](self, "_updateLocalizedNameLabel");
      v8 = v12;
    }
    if (v10)
    {
      -[PXComposeRecipientTableViewCell _updateAddressLabel](self, "_updateAddressLabel");
      v8 = v12;
    }
    if (v11)
    {
      -[PXComposeRecipientTableViewCell _updateAccessoryImageView](self, "_updateAccessoryImageView");
      v8 = v12;
    }
  }

}

- (PXComposeRecipientTableCellModel)cellModel
{
  return self->_cellModel;
}

- (void)setPopoverSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_popoverSourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverSourceView, 0);
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_localizedNameLabel, 0);
  objc_storeStrong((id *)&self->_customAvatarImageView, 0);
  objc_storeStrong((id *)&self->_contactAvatarViewController, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
