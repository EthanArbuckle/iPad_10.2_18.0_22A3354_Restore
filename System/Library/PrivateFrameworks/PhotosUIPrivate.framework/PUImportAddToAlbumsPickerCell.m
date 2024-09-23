@implementation PUImportAddToAlbumsPickerCell

- (PUImportAddToAlbumsPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUImportAddToAlbumsPickerCell *v4;
  PUImportAddToAlbumsPickerCell *v5;
  PXDisplayCollection *collection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUImportAddToAlbumsPickerCell;
  v4 = -[PUImportAddToAlbumsPickerCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
  {
    collection = v4->_collection;
    v4->_collection = 0;

    v5->_type = 2;
    -[PUImportAddToAlbumsPickerCell _configureCell](v5, "_configureCell");
  }
  return v5;
}

- (void)_configureCell
{
  id v3;
  void *v4;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[10];

  v65[8] = *MEMORY[0x1E0C80C00];
  -[PUImportAddToAlbumsPickerCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[PUImportAddToAlbumsPickerCell setThumbnailView:](self, "setThumbnailView:", v3);

  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 5.0);

  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PUImportAddToAlbumsPickerCell setTitleLabel:](self, "setTitleLabel:", v11);

  PXFontWithTextStyle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineBreakMode:", 0);

  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerYAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "centerYAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v60;
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 20.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v55;
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", 29.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v52;
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToConstant:", 29.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v49;
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v44;
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v39;
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v65[6] = v24;
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v65[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell setConstraints:](self, "setConstraints:", v28);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32, 20.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell setLabelLeadingConstraintNoImage:](self, "setLabelLeadingConstraintNoImage:", v33);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsPickerCell setLabelLeadingConstraintWithImage:](self, "setLabelLeadingConstraintWithImage:", v38);

  -[PUImportAddToAlbumsPickerCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, 69.0, 0.0, 0.0);
  -[PUImportAddToAlbumsPickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  PXDisplayCollection *collection;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUImportAddToAlbumsPickerCell;
  -[PUImportAddToAlbumsPickerCell prepareForReuse](&v9, sel_prepareForReuse);
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  collection = self->_collection;
  self->_collection = 0;

  self->_type = 2;
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PUImportAddToAlbumsPickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[PUImportAddToAlbumsPickerCell constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v4);

  v5 = (void *)MEMORY[0x1E0CB3718];
  if (self->_type)
  {
    -[PUImportAddToAlbumsPickerCell labelLeadingConstraintNoImage](self, "labelLeadingConstraintNoImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[PUImportAddToAlbumsPickerCell labelLeadingConstraintWithImage](self, "labelLeadingConstraintWithImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v16;
  }
  else
  {
    -[PUImportAddToAlbumsPickerCell labelLeadingConstraintWithImage](self, "labelLeadingConstraintWithImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivateConstraints:", v13);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[PUImportAddToAlbumsPickerCell labelLeadingConstraintNoImage](self, "labelLeadingConstraintNoImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v18;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v14);

  v15.receiver = self;
  v15.super_class = (Class)PUImportAddToAlbumsPickerCell;
  -[PUImportAddToAlbumsPickerCell updateConstraints](&v15, sel_updateConstraints);
}

- (void)performChanges:(id)a3
{
  id v5;
  void *v6;

  if (a3)
  {
    self->_isPerformingUpdate = 1;
    v5 = a3;
    -[PUImportAddToAlbumsPickerCell mutableChangeObject](self, "mutableChangeObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v6);

    -[PUImportAddToAlbumsPickerCell setNeedsLayout](self, "setNeedsLayout");
    self->_isPerformingUpdate = 0;
  }
}

- (void)setCollection:(id)a3
{
  PXDisplayCollection *v5;
  PXDisplayCollection *v6;

  v5 = (PXDisplayCollection *)a3;
  v6 = v5;
  if (!self->_isPerformingUpdate)
  {
    _PFAssertContinueHandler();
    v5 = v6;
  }
  if (self->_collection != v5)
  {
    objc_storeStrong((id *)&self->_collection, a3);
    self->_type = 2;
    -[PUImportAddToAlbumsPickerCell updateTitle](self, "updateTitle");
    v5 = v6;
  }

}

- (void)setType:(unint64_t)a3
{
  PXDisplayCollection *collection;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  if (!self->_isPerformingUpdate)
    _PFAssertContinueHandler();
  if (self->_type != a3)
  {
    self->_type = a3;
    if (a3 == 2
      || (collection = self->_collection, self->_collection = 0, collection, self->_type != 1))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PUImportAddToAlbumsPickerCell tintColor](self, "tintColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = self->_type == 0;
    -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", v9);

    -[PUImportAddToAlbumsPickerCell updateTitle](self, "updateTitle");
    -[PUImportAddToAlbumsPickerCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setThumbnail:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!self->_isPerformingUpdate)
    _PFAssertContinueHandler();
  -[PUImportAddToAlbumsPickerCell thumbnailView](self, "thumbnailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  if (-[PUImportAddToAlbumsPickerCell isSelectable](self, "isSelectable"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PUImportAddToAlbumsPickerCell;
    -[PUImportAddToAlbumsPickerCell setSelected:](&v6, sel_setSelected_, v3);
    if (v3)
      v5 = 3;
    else
      v5 = 0;
    -[PUImportAddToAlbumsPickerCell setAccessoryType:](self, "setAccessoryType:", v5);
  }
}

- (void)updateTitle
{
  void *v3;
  char isKindOfClass;
  void *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;

  -[PUImportAddToAlbumsPickerCell collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PUImportAddToAlbumsPickerCell collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedTitle");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[PUImportAddToAlbumsPickerCell type](self, "type")
         && -[PUImportAddToAlbumsPickerCell type](self, "type") != 1)
  {
    v8 = 0;
  }
  else
  {
    PLLocalizedFrameworkString();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
    v6 = v8;
  else
    v6 = &stru_1E58AD278;
  -[PUImportAddToAlbumsPickerCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[PUImportAddToAlbumsPickerCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)isSelectable
{
  return -[PUImportAddToAlbumsPickerCell type](self, "type") != 1;
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (PXDisplayCollection)collection
{
  return self->_collection;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSLayoutConstraint)labelLeadingConstraintNoImage
{
  return self->_labelLeadingConstraintNoImage;
}

- (void)setLabelLeadingConstraintNoImage:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingConstraintNoImage, a3);
}

- (NSLayoutConstraint)labelLeadingConstraintWithImage
{
  return self->_labelLeadingConstraintWithImage;
}

- (void)setLabelLeadingConstraintWithImage:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingConstraintWithImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeadingConstraintWithImage, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraintNoImage, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
