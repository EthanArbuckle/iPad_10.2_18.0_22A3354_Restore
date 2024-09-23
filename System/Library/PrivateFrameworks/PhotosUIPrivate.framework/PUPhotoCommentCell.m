@implementation PUPhotoCommentCell

- (PUPhotoCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PUPhotoCommentCell *v4;
  PUPhotoCommentCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *commentBylineLabel;
  UIView *v13;
  UIView *styledSeparatorView;
  UIView *v15;
  void *v16;
  uint64_t v17;
  UITextView *commentContentTextView;
  void *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PUPhotoCommentCell;
  v4 = -[PUPhotoCommentCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PUPhotoCommentCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    commentBylineLabel = v5->_commentBylineLabel;
    v5->_commentBylineLabel = (UILabel *)v11;

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    styledSeparatorView = v5->_styledSeparatorView;
    v5->_styledSeparatorView = v13;

    v15 = v5->_styledSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", v7, v8, v9, v10);
    commentContentTextView = v5->_commentContentTextView;
    v5->_commentContentTextView = (UITextView *)v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v5->_commentContentTextView, "setBackgroundColor:", v19);

    -[UITextView setDataDetectorTypes:](v5->_commentContentTextView, "setDataDetectorTypes:", 2);
    -[UITextView setEditable:](v5->_commentContentTextView, "setEditable:", 0);
    -[UITextView setSelectable:](v5->_commentContentTextView, "setSelectable:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v5->_commentContentTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v5->_commentContentTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView textContainer](v5->_commentContentTextView, "textContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLineFragmentPadding:", 0.0);

    v21 = v5->_commentBylineLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UILabel setNumberOfLines:](v5->_commentBylineLabel, "setNumberOfLines:", 0);
    -[PUPhotoCommentCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_commentContentTextView);

    -[PUPhotoCommentCell contentView](v5, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v5->_commentBylineLabel);

    -[PUPhotoCommentCell addSubview:](v5, "addSubview:", v5->_styledSeparatorView);
  }
  return v5;
}

- (void)prepareForReuse
{
  PHAssetComment *comment;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoCommentCell;
  -[PUPhotoCommentCell prepareForReuse](&v4, sel_prepareForReuse);
  comment = self->_comment;
  self->_comment = 0;

}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    -[PUPhotoCommentCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (sel_delete_ == a3)
    return -[PHAssetComment canBeDeletedByUser](self->_comment, "canBeDeletedByUser");
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoCommentCell;
  return -[PUPhotoCommentCell canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (void)delete:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  PUPhotoCommentCell *v12;

  -[PUPhotoCommentCell asset](self, "asset", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__PUPhotoCommentCell_delete___block_invoke;
  v10[3] = &unk_1E58ABCA8;
  v11 = v4;
  v12 = self;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __29__PUPhotoCommentCell_delete___block_invoke_2;
  v8[3] = &unk_1E58AB060;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performChanges:completionHandler:", v10, v8);

}

- (void)_updateContent
{
  UITextView *commentContentTextView;
  void *v4;
  UILabel *commentBylineLabel;
  void *v6;
  PHAssetComment *comment;
  void *v8;
  void *v9;
  UIView *styledSeparatorView;
  id v11;

  commentContentTextView = self->_commentContentTextView;
  objc_msgSend((id)objc_opt_class(), "_commentStringForComment:", self->_comment);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](commentContentTextView, "setAttributedText:", v4);

  commentBylineLabel = self->_commentBylineLabel;
  v6 = (void *)objc_opt_class();
  comment = self->_comment;
  -[PUPhotoCommentCell asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_attributionStringForComment:ofAsset:", comment, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](commentBylineLabel, "setAttributedText:", v9);

  styledSeparatorView = self->_styledSeparatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](styledSeparatorView, "setBackgroundColor:", v11);

}

- (void)setComment:(id)a3
{
  id *p_comment;
  unint64_t v5;

  p_comment = (id *)&self->_comment;
  v5 = (unint64_t)a3 | (unint64_t)*p_comment;
  objc_storeStrong(p_comment, a3);
  if (v5)
    -[PUPhotoCommentCell _updateContent](self, "_updateContent");
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double MaxX;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v33.receiver = self;
  v33.super_class = (Class)PUPhotoCommentCell;
  -[PUPhotoCommentCell layoutSubviews](&v33, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoCommentCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[PUPhotoCommentCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = v6 + -15.0;
  if (-[PUPhotoCommentCell usesCompactSeparators](self, "usesCompactSeparators"))
    v10 = (v6 + -15.0) * 0.5;
  else
    v10 = v6 + -15.0;
  v11 = 15.0;
  v12 = 15.0;
  if (v3)
  {
    -[PUPhotoCommentCell bounds](self, "bounds");
    v12 = CGRectGetMaxX(v34) - v10 + -15.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v8 - 1.0 / v14;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = 1.0 / v17;

  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v12, v15, v10, v18);
  -[UITextView sizeThatFits:](self->_commentContentTextView, "sizeThatFits:", v9 + -15.0, 1.79769313e308);
  v20 = v19;
  v22 = v21;
  if (v3)
  {
    -[PUPhotoCommentCell contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = 15.0;
    v36.origin.y = 6.0;
    v36.size.width = v20;
    v36.size.height = v22;
    v11 = MaxX - CGRectGetWidth(v36) + -15.0;

  }
  -[UITextView setFrame:](self->_commentContentTextView, "setFrame:", v11, 6.0, v20, v22);
  v37.origin.y = 6.0;
  v37.origin.x = v11;
  v37.size.width = v20;
  v37.size.height = v22;
  v25 = CGRectGetMaxY(v37) + 1.0;
  -[UILabel sizeThatFits:](self->_commentBylineLabel, "sizeThatFits:", v9 + -15.0, 1.79769313e308);
  v27 = v26;
  v29 = v28;
  if (v3)
  {
    -[PUPhotoCommentCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v31 = CGRectGetMaxX(v38);
    v39.origin.x = 15.0;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    v32 = v31 - CGRectGetWidth(v39) + -15.0;

  }
  else
  {
    v32 = 15.0;
  }
  -[UILabel setFrame:](self->_commentBylineLabel, "setFrame:", v32, v25, v27, v29);
}

- (UITextView)commentContentTextView
{
  return self->_commentContentTextView;
}

- (UILabel)commentBylineLabel
{
  return self->_commentBylineLabel;
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (PHAssetComment)comment
{
  return self->_comment;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_commentBylineLabel, 0);
  objc_storeStrong((id *)&self->_commentContentTextView, 0);
}

void __29__PUPhotoCommentCell_delete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeComments:", v3);

}

void __29__PUPhotoCommentCell_delete___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    PLSharedAlbumsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      v8 = "Succesfully deleted comment from shared asset %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      v12 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    PLSharedAlbumsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v7;
        v15 = 2112;
        v16 = v5;
        v8 = "Failed to delete comment from shared asset %{public}@, with error: %@";
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v12 = 22;
LABEL_10:
        _os_log_impl(&dword_1AAB61000, v9, v10, v8, (uint8_t *)&v13, v12);

      }
    }
    else if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v7;
      v8 = "Failed to delete comment from shared asset %{public}@";
      v9 = v6;
      v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }

}

+ (id)_synthesizedAttributedString:(id)a3 withWordWrapping:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DC1178]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (v4)
      v11 = 0;
    else
      v11 = 4;
    objc_msgSend(v10, "setLineBreakMode:", v11);
    objc_msgSend(v7, "setObject:forKey:", v10, v8);
    v12 = objc_msgSend(v5, "length");
    v13 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v5, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v7);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__PUPhotoCommentCell__synthesizedAttributedString_withWordWrapping___block_invoke;
    v18[3] = &unk_1E58A3EC0;
    v16 = v15;
    v19 = v16;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v18);

  }
  else
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E58AD278);
  }

  return v16;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)heightForComment:(id)a3 ofAsset:(id)a4 forWidth:(double)a5 forInterfaceOrientation:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_commentStringForComment:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPhotoCommentCell _synthesizedAttributedString:withWordWrapping:](PUPhotoCommentCell, "_synthesizedAttributedString:withWordWrapping:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = a5 + -30.0;
  objc_msgSend(v12, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  v20 = CGRectIntegral(v19);
  v14 = v20.size.height + 0.0;
  objc_msgSend(a1, "_attributionStringForComment:ofAsset:", v10, v9, v20.origin.x, v20.origin.y, v20.size.width);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPhotoCommentCell _synthesizedAttributedString:withWordWrapping:](PUPhotoCommentCell, "_synthesizedAttributedString:withWordWrapping:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  v22 = CGRectIntegral(v21);
  if (v14 + v22.size.height + 0.0 + 13.0 >= 41.0)
    v17 = v14 + v22.size.height + 0.0 + 13.0;
  else
    v17 = 41.0;

  return v17;
}

+ (id)_commentStringForComment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "commentText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commentTextFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v3, v7);
  return v8;
}

+ (id)_attributionStringForComment:(id)a3 ofAsset:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
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
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "isCaption");
  if (objc_msgSend(v5, "isMyComment"))
    PLLocalizedFrameworkString();
  else
    objc_msgSend(v5, "commenterDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length", v6);
  v10 = (_QWORD *)MEMORY[0x1E0DC1138];
  if (v9)
  {
    v29[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v29[1] = *v10;
    v30[0] = v11;
    objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commentAttributionNameFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v15);
    objc_msgSend(v7, "addObject:", v16);

  }
  else
  {
    v12 = (_QWORD *)MEMORY[0x1E0DC1138];
    objc_msgSend(v7, "addObject:", &stru_1E58AD278);
  }
  objc_msgSend(v5, "commentDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLRelativePrettyDateForDate();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v18);
  if ((objc_msgSend(v26, "isVideo") & 1) == 0)
    objc_msgSend(v26, "isStreamedVideo");
  PLLocalizedFrameworkString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = *v12;
  v28[0] = v20;
  objc_msgSend(MEMORY[0x1E0D714A8], "sharedCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commentAttributionDateFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "px_stringWithFormat:defaultAttributes:arguments:", v19, v23, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

uint64_t __68__PUPhotoCommentCell__synthesizedAttributedString_withWordWrapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

@end
