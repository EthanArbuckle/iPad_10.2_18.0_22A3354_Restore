@implementation PUPhotoOwnerCommentCell

- (PUPhotoOwnerCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUPhotoOwnerCommentCell *v4;
  PUPhotoOwnerCommentCell *v5;
  id v6;
  uint64_t v7;
  UILabel *ownerContentLabel;
  UIView *v9;
  UIView *styledSeparatorView;
  UIView *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUPhotoOwnerCommentCell;
  v4 = -[PUPhotoOwnerCommentCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUPhotoOwnerCommentCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PUPhotoOwnerCommentCell setAccessoryType:](v5, "setAccessoryType:", 0);
    -[PUPhotoOwnerCommentCell setEditingAccessoryType:](v5, "setEditingAccessoryType:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    ownerContentLabel = v5->_ownerContentLabel;
    v5->_ownerContentLabel = (UILabel *)v7;

    -[UILabel setNumberOfLines:](v5->_ownerContentLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_ownerContentLabel, "setLineBreakMode:", 0);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    styledSeparatorView = v5->_styledSeparatorView;
    v5->_styledSeparatorView = v9;

    v11 = v5->_styledSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = v5->_ownerContentLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[PUPhotoOwnerCommentCell contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5->_ownerContentLabel);

    -[PUPhotoOwnerCommentCell addSubview:](v5, "addSubview:", v5->_styledSeparatorView);
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoOwnerCommentCell;
  -[PUPhotoOwnerCommentCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUPhotoOwnerCommentCell setOwnerString:](self, "setOwnerString:", 0);
}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    -[PUPhotoOwnerCommentCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateContentFromAsset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_ownerStringForAsset:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PUPhotoOwnerCommentCell setOwnerString:](self, "setOwnerString:", v5);
}

- (void)setOwnerString:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *ownerString;

  if (self->_ownerString != a3)
  {
    v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
    ownerString = self->_ownerString;
    self->_ownerString = v4;

    -[UILabel setAttributedText:](self->_ownerContentLabel, "setAttributedText:", self->_ownerString);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  CGFloat v19;
  double v20;
  double Width;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v24.receiver = self;
  v24.super_class = (Class)PUPhotoOwnerCommentCell;
  -[PUPhotoOwnerCommentCell layoutSubviews](&v24, sel_layoutSubviews);
  -[PUPhotoOwnerCommentCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoOwnerCommentCell semanticContentAttribute](self, "semanticContentAttribute"));
  v9 = v5 + -15.0;
  if (-[PUPhotoOwnerCommentCell usesCompactSeparators](self, "usesCompactSeparators"))
    v10 = (v5 + -15.0) * 0.5;
  else
    v10 = v5 + -15.0;
  if (v8)
  {
    -[PUPhotoOwnerCommentCell bounds](self, "bounds");
    v11 = CGRectGetMaxX(v25) - v10 + -15.0;
  }
  else
  {
    v11 = 15.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v7 - 1.0 / v13;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v11, v14, v10, v17);
  if (v8)
  {
    -[PUPhotoOwnerCommentCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = CGRectGetMaxX(v26) - (v9 + -15.0) + -15.0;

    v20 = v7 + -10.0 + -8.0;
    -[UILabel sizeToFit](self->_ownerContentLabel, "sizeToFit");
    v27.origin.y = 10.0;
    v27.origin.x = v19;
    v27.size.width = v9 + -15.0;
    v27.size.height = v20;
    Width = CGRectGetWidth(v27);
    -[UILabel frame](self->_ownerContentLabel, "frame");
    v22 = CGRectGetWidth(v28);
    v23 = v19 + Width - v22;
  }
  else
  {
    v22 = v9 + -15.0;
    v20 = v7 + -10.0 + -8.0;
    v23 = 15.0;
  }
  -[UILabel setFrame:](self->_ownerContentLabel, "setFrame:", v23, 10.0, v22, v20);
  -[UILabel sizeToFit](self->_ownerContentLabel, "sizeToFit");
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (NSAttributedString)ownerString
{
  return self->_ownerString;
}

- (UILabel)ownerContentLabel
{
  return self->_ownerContentLabel;
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_ownerContentLabel, 0);
  objc_storeStrong((id *)&self->_ownerString, 0);
}

+ (id)_ownerStringForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = objc_msgSend(v3, "px_displayType");
  if ((objc_msgSend(v3, "cloudIsMyAsset") & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v3, "cloudOwnerDisplayName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "cloudBatchPublishDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0DC1140];
  v5 = v21;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v22 = *MEMORY[0x1E0DC1138];
  v7 = v22;
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commentAttributionNameFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commentAttributionDateFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:", v17, v18, v4, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (double)heightOfOwnerCellWithAsset:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a1, "_ownerStringForAsset:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoCommentCell _synthesizedAttributedString:withWordWrapping:](PUPhotoCommentCell, "_synthesizedAttributedString:withWordWrapping:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "boundingRectWithSize:options:context:", 1, 0, a4 + -30.0, 1.79769313e308);
  v11 = CGRectIntegral(v10);
  if (v11.size.height + 10.0 + 8.0 >= 23.0)
    v8 = v11.size.height + 10.0 + 8.0;
  else
    v8 = 23.0;

  return v8;
}

@end
