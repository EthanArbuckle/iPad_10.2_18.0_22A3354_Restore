@implementation PXSharedLibraryParticipantTableViewCell

- (PXSharedLibraryParticipantTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXSharedLibraryParticipantTableViewCell *v4;
  PXSharedLibraryParticipantTableCellModel *v5;
  PXSharedLibraryParticipantTableCellModel *cellModel;
  void *v7;
  UILabel *v8;
  UILabel *localizedNameLabel;
  void *v10;
  UILabel *v11;
  UILabel *addressLabel;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryParticipantTableViewCell;
  v4 = -[PXSharedLibraryParticipantTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PXSharedLibraryParticipantTableCellModel);
    cellModel = v4->_cellModel;
    v4->_cellModel = v5;

    -[PXSharedLibraryParticipantTableCellModel registerChangeObserver:context:](v4->_cellModel, "registerChangeObserver:context:", v4, PXSharedLibraryParticipantTableCellModelObservationContext);
    -[PXSharedLibraryParticipantTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[PXSharedLibraryParticipantTableViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    localizedNameLabel = v4->_localizedNameLabel;
    v4->_localizedNameLabel = v8;

    PXFontWithTextStyleSymbolicTraits();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_localizedNameLabel, "setFont:", v10);

    -[UILabel setAccessibilityIdentifier:](v4->_localizedNameLabel, "setAccessibilityIdentifier:", CFSTR("PXSharedLibraryParticipantTableViewCell_LocalizedNameLabel"));
    objc_msgSend(v7, "addSubview:", v4->_localizedNameLabel);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    addressLabel = v4->_addressLabel;
    v4->_addressLabel = v11;

    objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_addressLabel, "setFont:", v13);
    -[UILabel setAccessibilityIdentifier:](v4->_addressLabel, "setAccessibilityIdentifier:", CFSTR("PXSharedLibraryParticipantTableViewCell_AddressLabel"));
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_addressLabel, "setTextColor:", v14);

    objc_msgSend(v7, "addSubview:", v4->_addressLabel);
    -[PXSharedLibraryParticipantTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PXSharedLibraryParticipantTableViewCell _updateAvatarView](v4, "_updateAvatarView");
    -[PXSharedLibraryParticipantTableViewCell _updateLocalizedNameLabel](v4, "_updateLocalizedNameLabel");
    -[PXSharedLibraryParticipantTableViewCell _updateAddressLabel](v4, "_updateAddressLabel");

  }
  return v4;
}

- (void)layoutSubviews
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
  double width;
  double v14;
  double v15;
  UILabel **p_localizedNameLabel;
  double v17;
  double v18;
  UILabel **p_addressLabel;
  double v20;
  double v21;
  uint64_t v22;
  double x;
  double y;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  double height;
  double v30;
  CGFloat v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MidY;
  double v43;
  double MaxY;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v55.receiver = self;
  v55.super_class = (Class)PXSharedLibraryParticipantTableViewCell;
  -[PXSharedLibraryParticipantTableViewCell layoutSubviews](&v55, sel_layoutSubviews);
  -[PXSharedLibraryParticipantTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  +[PXSharedLibraryParticipantTableCellModel imageDiameter](PXSharedLibraryParticipantTableCellModel, "imageDiameter");
  width = v12;
  +[PXSharedLibraryParticipantTableCellModel imageInset](PXSharedLibraryParticipantTableCellModel, "imageInset");
  v15 = v14;
  p_localizedNameLabel = &self->_localizedNameLabel;
  -[UILabel sizeThatFits:](self->_localizedNameLabel, "sizeThatFits:", v9, v11);
  rect_16 = v17;
  v49 = v18;
  p_addressLabel = &self->_addressLabel;
  -[UILabel sizeThatFits:](self->_addressLabel, "sizeThatFits:", v9, v11);
  rect_8 = v20;
  v48 = v21;
  v22 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXSharedLibraryParticipantTableViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  x = v9 - width - v15;
  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  y = CGRectGetMidY(v56) + width * -0.5;
  rect = v5;
  rect_24 = v7;
  if (v22 == 1)
  {
    v57.origin.x = v9 - width - v15;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = width;
    v50 = CGRectGetMinX(v57) - v15;
    v58.origin.x = v9 - width - v15;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = width;
    v25 = CGRectGetMinX(v58) - v15;
    -[PXSharedLibraryParticipantTableViewCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v25 - v27;

    height = width;
  }
  else
  {
    v59.origin.x = MEMORY[0x1A85CD2B8](v9 - width - v15, y, width, width, v5, v7, v9, v11);
    x = v59.origin.x;
    y = v59.origin.y;
    width = v59.size.width;
    height = v59.size.height;
    v30 = v15 + CGRectGetMaxX(v59);
    v60.origin.x = v5;
    v60.origin.y = rect_24;
    v60.size.width = v9;
    v60.size.height = v11;
    v50 = v30;
    v28 = CGRectGetMaxX(v60) - v30;
  }
  v31 = v11;
  -[PXRoundImageView setFrame:](self->_customAvatarImageView, "setFrame:", x, y, width, height);
  -[UILabel text](*p_localizedNameLabel, "text");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  -[UILabel text](*p_addressLabel, "text");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length") != 0;

  v36 = fmin(rect_16, v28);
  v37 = fmin(rect_8, v28);
  v38 = 0.0;
  if (v22 == 1)
    v39 = v36;
  else
    v39 = 0.0;
  v40 = v50 - v39;
  if (v22 == 1)
    v38 = v37;
  v41 = v50 - v38;
  v61.origin.x = rect;
  v61.origin.y = rect_24;
  v61.size.width = v9;
  v61.size.height = v31;
  MidY = CGRectGetMidY(v61);
  if ((v33 != 0) == v35)
  {
    -[UILabel intrinsicContentSize](*p_localizedNameLabel, "intrinsicContentSize");
    -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v40, MidY - v46, v36, v49);
    -[UILabel frame](*p_localizedNameLabel, "frame");
    MaxY = CGRectGetMaxY(v62);
LABEL_14:
    p_localizedNameLabel = p_addressLabel;
    v40 = v41;
    v36 = v37;
    v45 = v48;
    goto LABEL_15;
  }
  if (!v33)
  {
    -[UILabel intrinsicContentSize](*p_addressLabel, "intrinsicContentSize");
    MaxY = MidY + v47 * -0.5;
    goto LABEL_14;
  }
  -[UILabel intrinsicContentSize](*p_localizedNameLabel, "intrinsicContentSize");
  MaxY = MidY + v43 * -0.5;
  v45 = v49;
LABEL_15:
  -[UILabel setFrame:](*p_localizedNameLabel, "setFrame:", v40, MaxY, v36, v45);
}

- (void)_updateAvatarView
{
  PXRoundImageView *v3;
  PXRoundImageView *customAvatarImageView;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_customAvatarImageView)
  {
    v3 = objc_alloc_init(PXRoundImageView);
    customAvatarImageView = self->_customAvatarImageView;
    self->_customAvatarImageView = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRoundImageView setBackgroundColor:](self->_customAvatarImageView, "setBackgroundColor:", v5);

    -[PXRoundImageView setAccessibilityIgnoresInvertColors:](self->_customAvatarImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXSharedLibraryParticipantTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_customAvatarImageView);

  }
  -[PXSharedLibraryParticipantTableCellModel image](self->_cellModel, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRoundImageView setImage:](self->_customAvatarImageView, "setImage:", v7);

  -[PXSharedLibraryParticipantTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLocalizedNameLabel
{
  void *v3;

  -[PXSharedLibraryParticipantTableCellModel name](self->_cellModel, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_localizedNameLabel, "setText:", v3);

  -[PXSharedLibraryParticipantTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateAddressLabel
{
  void *v3;

  -[PXSharedLibraryParticipantTableCellModel address](self->_cellModel, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_addressLabel, "setText:", v3);

  -[PXSharedLibraryParticipantTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  id v9;

  v6 = a4;
  v8 = a3;
  if ((void *)PXSharedLibraryParticipantTableCellModelObservationContext == a5)
  {
    v9 = v8;
    if ((v6 & 1) != 0)
    {
      -[PXSharedLibraryParticipantTableViewCell _updateAvatarView](self, "_updateAvatarView");
      v8 = v9;
    }
    if ((v6 & 0xC) != 0)
    {
      -[PXSharedLibraryParticipantTableViewCell _updateLocalizedNameLabel](self, "_updateLocalizedNameLabel");
      v8 = v9;
    }
    if ((v6 & 8) != 0)
    {
      -[PXSharedLibraryParticipantTableViewCell _updateAddressLabel](self, "_updateAddressLabel");
      v8 = v9;
    }
  }

}

- (PXSharedLibraryParticipantTableCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_localizedNameLabel, 0);
  objc_storeStrong((id *)&self->_customAvatarImageView, 0);
}

@end
