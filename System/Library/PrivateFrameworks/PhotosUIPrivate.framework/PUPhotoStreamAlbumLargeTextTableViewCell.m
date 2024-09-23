@implementation PUPhotoStreamAlbumLargeTextTableViewCell

- (id)text
{
  void *v2;
  void *v3;

  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)detailText
{
  void *v2;
  void *v3;

  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDetailText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (PUPhotoStreamAlbumLargeTextTableViewCell)init
{
  PUPhotoStreamAlbumLargeTextTableViewCell *v2;
  PUPhotoStreamAlbumLargeTextTableViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  v2 = -[PUPhotoStreamAlbumLargeTextTableViewCell init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PUPhotoStreamAlbumLargeTextTableViewCell _commonPhotoStreamAlbumLargeTextTableViewCellInit](v2, "_commonPhotoStreamAlbumLargeTextTableViewCellInit");
  return v3;
}

- (PUPhotoStreamAlbumLargeTextTableViewCell)initWithCoder:(id)a3
{
  PUPhotoStreamAlbumLargeTextTableViewCell *v3;
  PUPhotoStreamAlbumLargeTextTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  v3 = -[PUPhotoStreamAlbumLargeTextTableViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PUPhotoStreamAlbumLargeTextTableViewCell _commonPhotoStreamAlbumLargeTextTableViewCellInit](v3, "_commonPhotoStreamAlbumLargeTextTableViewCellInit");
  return v4;
}

- (PUPhotoStreamAlbumLargeTextTableViewCell)initWithFrame:(CGRect)a3
{
  PUPhotoStreamAlbumLargeTextTableViewCell *v3;
  PUPhotoStreamAlbumLargeTextTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  v3 = -[PUPhotoStreamAlbumLargeTextTableViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PUPhotoStreamAlbumLargeTextTableViewCell _commonPhotoStreamAlbumLargeTextTableViewCellInit](v3, "_commonPhotoStreamAlbumLargeTextTableViewCellInit");
  return v4;
}

- (PUPhotoStreamAlbumLargeTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUPhotoStreamAlbumLargeTextTableViewCell *v4;
  PUPhotoStreamAlbumLargeTextTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  v4 = -[PUPhotoStreamAlbumLargeTextTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[PUPhotoStreamAlbumLargeTextTableViewCell _commonPhotoStreamAlbumLargeTextTableViewCellInit](v4, "_commonPhotoStreamAlbumLargeTextTableViewCellInit");
  return v5;
}

- (void)_commonPhotoStreamAlbumLargeTextTableViewCellInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PUPhotoStreamAlbumLargeTextTableViewCell setTitleLabel:](self, "setTitleLabel:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PUPhotoStreamAlbumLargeTextTableViewCell setDetailLabel:](self, "setDetailLabel:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[PUPhotoStreamAlbumLargeTextTableViewCell setAlbumImageView:](self, "setAlbumImageView:", v15);

  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

}

- (void)updateConstraints
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v23;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[13];

  v62[11] = *MEMORY[0x1E0C80C00];
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 8.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v56;
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 16.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v51;
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 50.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v48;
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "heightAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToConstant:", 50.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v45;
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 8.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v40;
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstBaselineAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell albumImageView](self, "albumImageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "font");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "capHeight");
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v35, v3 * 0.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v32;
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -8.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v27;
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v22;
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 8.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v17;
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v7;
  -[PUPhotoStreamAlbumLargeTextTableViewCell detailLabel](self, "detailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumLargeTextTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -16.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoStreamAlbumLargeTextTableViewCell currentConstraints](self, "currentConstraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3718];
    -[PUPhotoStreamAlbumLargeTextTableViewCell currentConstraints](self, "currentConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deactivateConstraints:", v15);

  }
  -[PUPhotoStreamAlbumLargeTextTableViewCell setCurrentConstraints:](self, "setCurrentConstraints:", v33);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
  v61.receiver = self;
  v61.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  -[PUPhotoStreamAlbumLargeTextTableViewCell updateConstraints](&v61, sel_updateConstraints);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  -[PUPhotoStreamAlbumLargeTextTableViewCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUPhotoStreamAlbumLargeTextTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoStreamAlbumLargeTextTableViewCell;
  -[PUPhotoStreamAlbumLargeTextTableViewCell didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PUPhotoStreamAlbumLargeTextTableViewCell window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PUPhotoStreamAlbumLargeTextTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UIImageView)albumImageView
{
  return self->_albumImageView;
}

- (void)setAlbumImageView:(id)a3
{
  objc_storeStrong((id *)&self->_albumImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_albumImageView, 0);
}

@end
