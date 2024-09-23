@implementation PUPhotoSmilesCommentCell

- (PUPhotoSmilesCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUPhotoSmilesCommentCell *v4;
  PUPhotoSmilesCommentCell *v5;
  id v6;
  uint64_t v7;
  UILabel *smileContentLabel;
  UILabel *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *styledSeparatorView;
  UIView *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUPhotoSmilesCommentCell;
  v4 = -[PUPhotoSmilesCommentCell initWithStyle:reuseIdentifier:](&v17, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUPhotoSmilesCommentCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[PUPhotoSmilesCommentCell setAccessoryType:](v5, "setAccessoryType:", 0);
    -[PUPhotoSmilesCommentCell setEditingAccessoryType:](v5, "setEditingAccessoryType:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    smileContentLabel = v5->_smileContentLabel;
    v5->_smileContentLabel = (UILabel *)v7;

    -[UILabel setNumberOfLines:](v5->_smileContentLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v5->_smileContentLabel, "setLineBreakMode:", 0);
    v9 = v5->_smileContentLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[PUPhotoSmilesCommentCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5->_smileContentLabel);

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    styledSeparatorView = v5->_styledSeparatorView;
    v5->_styledSeparatorView = v12;

    v14 = v5->_styledSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[PUPhotoSmilesCommentCell addSubview:](v5, "addSubview:", v5->_styledSeparatorView);
  }
  return v5;
}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    -[PUPhotoSmilesCommentCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoSmilesCommentCell;
  -[PUPhotoSmilesCommentCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUPhotoSmilesCommentCell setUserLikes:](self, "setUserLikes:", 0);
}

- (void)_updateContent
{
  void *v3;
  PXFastEnumeration *userLikes;
  void *v5;
  BOOL v6;
  _BOOL8 v7;
  id v8;
  id v9;

  v3 = (void *)objc_opt_class();
  userLikes = self->_userLikes;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_attributedStringForComments:color:isVideo:", userLikes, v5, self->_isVideo);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[PXFastEnumeration count](self->_userLikes, "count") == 0;
  v7 = v6;
  if (v6)
    v8 = 0;
  else
    v8 = v9;
  -[UILabel setAttributedText:](self->_smileContentLabel, "setAttributedText:", v8);
  -[UIView setHidden:](self->_styledSeparatorView, "setHidden:", v7);

}

- (void)setUserLikes:(id)a3
{
  PXFastEnumeration *v5;
  PXFastEnumeration *v6;

  v5 = (PXFastEnumeration *)a3;
  if (self->_userLikes != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userLikes, a3);
    -[PUPhotoSmilesCommentCell _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
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
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  CGRect rect;
  CGRect v24;
  CGRect v25;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = PUPhotoSmilesCommentCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  v3 = -[PUPhotoSmilesCommentCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[PUPhotoSmilesCommentCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  rect.origin.x = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v9 + -15.0;
  -[UILabel sizeThatFits:](self->_smileContentLabel, "sizeThatFits:", v9 + -15.0 + -10.0, v11 + -12.0 + -12.0);
  v14 = v13;
  v15 = 15.0;
  v16 = 15.0;
  if (v3 == 1)
  {
    v24.origin.x = rect.origin.x;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    v16 = CGRectGetMaxX(v24) - v14 + -15.0;
  }
  -[UILabel setFrame:](self->_smileContentLabel, "setFrame:", v16, 12.0, v14, v11 + -12.0 + -12.0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;

  if (-[PUPhotoSmilesCommentCell usesCompactSeparators](self, "usesCompactSeparators"))
    v12 = v12 * 0.5;
  if (v3 == 1)
  {
    v25.origin.x = rect.origin.x;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    v15 = CGRectGetMaxX(v25) - v12 + -15.0;
  }
  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v15, v11 - 1.0 / v19, v12, 1.0 / v22);
}

- (UILabel)smileContentLabel
{
  return self->_smileContentLabel;
}

- (PXFastEnumeration)userLikes
{
  return self->_userLikes;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_userLikes, 0);
  objc_storeStrong((id *)&self->_smileContentLabel, 0);
}

+ (id)_smileStringForComments:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isMyComment") & 1) == 0)
        {
          objc_msgSend(v10, "commenterDisplayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "count");
  v13 = v12 - 1;
  if (v12 == 1)
  {
    PLLocalizedFrameworkString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  if (v12)
  {
    PLLocalizedFrameworkString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subarrayWithRange:", 0, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PUStringWithValidatedFormat();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  PLLocalizedFrameworkString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v17;
}

+ (id)_attributedStringForComments:(id)a3 color:(id)a4 isVideo:(BOOL)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v32;
  _BOOL4 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v33 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = *MEMORY[0x1E0DC1138];
  v40[0] = *MEMORY[0x1E0DC1140];
  v8 = v40[0];
  v40[1] = v9;
  v41[0] = v7;
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "likeFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v38[1] = v9;
  v39[0] = v7;
  v38[0] = v8;
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "youLikeFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    PLLocalizedFrameworkString();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)MEMORY[0x1E0CB3498];
LABEL_20:
    v28 = objc_msgSend([v27 alloc], "initWithString:attributes:", v26, v12);
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_smileStringForComments:", v6);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)MEMORY[0x1E0CB3498];
    goto LABEL_20;
  }
  v32 = v15;
  v16 = v6;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v24, "isMyComment", v32) & 1) != 0)
        {
          v21 = 1;
        }
        else
        {
          objc_msgSend(v24, "commenterDisplayName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "length"))
            objc_msgSend(v17, "addObject:", v25);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  v29 = objc_retainAutorelease(v17);
  v26 = v29;
  v15 = v32;
  objc_msgSend(MEMORY[0x1E0CB3498], "px_localizedAttributedStringForLikesFromUser:otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:", v21 & 1, v26, v33, v12, v32);
  v28 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v30 = (void *)v28;

  return v30;
}

+ (double)heightOfSmileCellWithComments:(id)a3 forWidth:(double)a4 isVideo:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  double v12;
  CGRect v14;
  CGRect v15;

  v6 = a5;
  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(a1, "_attributedStringForComments:color:isVideo:", v9, 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoCommentCell _synthesizedAttributedString:withWordWrapping:](PUPhotoCommentCell, "_synthesizedAttributedString:withWordWrapping:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "boundingRectWithSize:options:context:", 1, 0, a4 + -25.0, 1.79769313e308);
    v15 = CGRectIntegral(v14);
    if (v15.size.height + 12.0 + 12.0 >= 25.0)
      v12 = v15.size.height + 12.0 + 12.0;
    else
      v12 = 25.0;

  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

@end
