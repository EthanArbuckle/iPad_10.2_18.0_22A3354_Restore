@implementation PUFeedCaptionCell

- (PUFeedCaptionCell)initWithFrame:(CGRect)a3
{
  PUFeedCaptionCell *v3;
  PUFeedCaptionCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  UILabel *subtitleLabel;
  void *v10;
  void *v11;
  uint64_t v12;
  PXUIButton *likeButton;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUFeedCaptionCell;
  v3 = -[PUFeedCaptionCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUFeedCaptionCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v8;

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    -[PUFeedCaptionCell likedImage](v4, "likedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedCaptionCell notLikedImage](v4, "notLikedImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7BB48], "buttonWithType:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    likeButton = v4->_likeButton;
    v4->_likeButton = (PXUIButton *)v12;

    -[PXUIButton px_configuration](v4->_likeButton, "px_configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHitTestOutset:", 5.0, 5.0, 5.0, 5.0);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B60], 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIButton setPreferredSymbolConfiguration:forImageInState:](v4->_likeButton, "setPreferredSymbolConfiguration:forImageInState:", v15, 0);
    -[PXUIButton setPreferredSymbolConfiguration:forImageInState:](v4->_likeButton, "setPreferredSymbolConfiguration:forImageInState:", v15, 1);
    -[PXUIButton setPreferredSymbolConfiguration:forImageInState:](v4->_likeButton, "setPreferredSymbolConfiguration:forImageInState:", v15, 4);
    -[PXUIButton setImage:forState:](v4->_likeButton, "setImage:forState:", v11, 0);
    -[PXUIButton setImage:forState:](v4->_likeButton, "setImage:forState:", v10, 1);
    -[PXUIButton setImage:forState:](v4->_likeButton, "setImage:forState:", v10, 4);
    -[PXUIButton setAdjustsImageWhenHighlighted:](v4->_likeButton, "setAdjustsImageWhenHighlighted:", 0);
    -[PXUIButton addTarget:action:forControlEvents:](v4->_likeButton, "addTarget:action:forControlEvents:", v4, sel__handleLikeButtonTap_, 64);
    objc_msgSend(v5, "addSubview:", v4->_likeButton);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PUFeedCaptionCell;
  -[PUFeedCell dealloc](&v4, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedCaptionCell;
  -[PUFeedCaptionCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUFeedCaptionCell setContentInsets:](self, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[PUFeedCaptionCell setSectionInfo:](self, "setSectionInfo:", 0);
  -[PUFeedCaptionCell setCaptionItemIndex:](self, "setCaptionItemIndex:", 0);
  -[PUFeedCaptionCell setHideCaption:](self, "setHideCaption:", 0);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[PUFeedCaptionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSectionInfo:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_sectionInfo, a3);
  if (-[PXFeedSectionInfo isLoaded](self->_sectionInfo, "isLoaded"))
    -[PUFeedCaptionCell _updateUI](self, "_updateUI");

}

- (void)setCaptionItemIndex:(unint64_t)a3
{
  if (self->_captionItemIndex != a3)
  {
    self->_captionItemIndex = a3;
    -[PUFeedCaptionCell _updateUI](self, "_updateUI");
  }
}

- (void)setHideCaption:(BOOL)a3
{
  if (self->_hideCaption != a3)
  {
    self->_hideCaption = a3;
    -[PUFeedCaptionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isLiked
{
  void *v2;
  char v3;

  -[PUFeedCaptionCell likeButton](self, "likeButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (UIImage)likedImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsup.fill"));
}

- (UIImage)notLikedImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsup"));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUFeedCaptionCell;
  v4 = a3;
  -[PUFeedCaptionCell traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PUFeedCaptionCell traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    -[PUFeedCaptionCell likeButton](self, "likeButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedCaptionCell notLikedImage](self, "notLikedImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:forState:", v8, 0);

    -[PUFeedCaptionCell likeButton](self, "likeButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUFeedCaptionCell likedImage](self, "likedImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:forState:", v10, 4);

    -[PUFeedCaptionCell _updateLikeButton](self, "_updateLikeButton");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedCaptionCell;
  -[PUFeedCaptionCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PUFeedCaptionCell bounds](self, "bounds");
  -[PUFeedCaptionCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PUFeedCaptionCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateTitle
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
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
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[PUFeedCaptionCell sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUFeedCaptionCell captionItemIndex](self, "captionItemIndex");
  if (v3 && (v5 = v4, objc_msgSend(v3, "numberOfItems") > v4))
  {
    objc_msgSend(v3, "captionForItemAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "assetForItemAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (objc_msgSend(v7, "cloudIsMyAsset"))
          PXLocalizedString();
        else
          objc_msgSend(v8, "cloudOwnerDisplayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionTextEmphasizedAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);

        PXLocalizedString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3498];
        objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionTextAttributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v13;
        v19[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "px_stringWithFormat:defaultAttributes:arguments:", v14, v16, v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  -[PUFeedCaptionCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v9);

}

- (void)_updateSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUFeedCaptionCell sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D7B168];
    objc_msgSend(v3, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3498];
    objc_msgSend(MEMORY[0x1E0D7B160], "activityDateSubtitleTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_attributedStringWithHTMLString:defaultAttributes:", v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[PUFeedCaptionCell subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v11);

}

- (void)_setLikeButtonLiked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PUFeedCaptionCell likeButton](self, "likeButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v3);
  if (v3)
    -[PUFeedCaptionCell notLikedImage](self, "notLikedImage");
  else
    -[PUFeedCaptionCell likedImage](self, "likedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v5, 1);
  -[PUFeedCaptionCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (BOOL)_shouldHideLikeButton
{
  void *v3;
  uint64_t v4;

  -[PUFeedCaptionCell sectionInfo](self, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfFirstItemFromLastBatch");

  return -[PUFeedCaptionCell captionItemIndex](self, "captionItemIndex") != v4;
}

- (void)_updateLikeButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = -[PUFeedCaptionCell _shouldHideLikeButton](self, "_shouldHideLikeButton");
  -[PUFeedCaptionCell likeButton](self, "likeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  if (!v3)
  {
    -[PUFeedCaptionCell sectionInfo](self, "sectionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5 && objc_msgSend(v5, "numberOfItems") >= 1)
      v6 = objc_msgSend(v7, "areAllAssetsLiked");
    else
      v6 = 0;
    -[PUFeedCaptionCell _setLikeButtonLiked:](self, "_setLikeButtonLiked:", v6);

  }
}

- (void)_updateUI
{
  -[PUFeedCaptionCell _updateTitle](self, "_updateTitle");
  -[PUFeedCaptionCell _updateSubtitle](self, "_updateSubtitle");
  -[PUFeedCaptionCell _updateLikeButton](self, "_updateLikeButton");
  -[PUFeedCaptionCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double MaxY;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  void *v77;
  double width;
  double rect;
  CGSize result;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v4 = a4;
  width = a3.size.width;
  v6 = (double *)MEMORY[0x1E0C9D648];
  -[PUFeedCaptionCell contentInsets](self, "contentInsets", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  rect = v9;
  v71 = v10;
  v12 = v11;
  -[PUFeedCaptionCell likeButton](self, "likeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCaptionCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCaptionCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionTextAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B160], "activityDateSubtitleTextAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v21 = !-[PUFeedCaptionCell hideCaption](self, "hideCaption");
  else
    v21 = 0;
  v22 = *v6;
  v23 = v6[1];
  v25 = v6[2];
  v24 = v6[3];

  objc_msgSend(v15, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v8;
  v28 = width - rect + -10.0 + -44.0 - v12;
  v74 = v25;
  v75 = v24;
  v72 = v25;
  v73 = v23;
  v76 = v23;
  v29 = v22;
  if (v21)
  {
    objc_msgSend(v14, "sizeThatFits:", width - rect + -10.0 + -44.0 - v12, 1.79769313e308);
    v31 = v30;
    v69 = v22;
    v32 = v12;
    v33 = v8;
    v35 = v34;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionCellTopToTitleBaselineDynamicDistance");
    v37 = v33 + v36;
    objc_msgSend(v77, "ascender");
    v39 = v37 - v38;
    if (v28 >= v31)
      v40 = v31;
    else
      v40 = v28;
    v41 = rect;
    v73 = v39;
    v74 = v40;
    v75 = v35;
    v42 = v35;
    v8 = v33;
    v12 = v32;
    v22 = v69;
    MaxY = CGRectGetMaxY(*(CGRect *)(&v39 - 1));
    objc_msgSend(v77, "descender");
    v27 = MaxY + v44;
    v29 = rect;
  }
  v70 = v29;
  if (v26)
  {
    objc_msgSend(v15, "sizeThatFits:", v28, 1.79769313e308);
    v46 = v45;
    v24 = v47;
    objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionTitleBaselineToSubtitleBaselineDynamicDistance");
    v49 = v27 + v48;
    objc_msgSend(v19, "ascender");
    v51 = v49 - v50;
    if (v28 < v46)
      v46 = v28;
    if (v21)
      objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionSubtitleBaselineToCellBottomDynamicDistance");
    else
      objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionSubtitleBaselineToCellBottomDynamicDistance2");
    v53 = v52;
    v81.origin.x = rect;
    v76 = v51;
    v81.origin.y = v51;
    v81.size.width = v46;
    v81.size.height = v24;
    v54 = v53 + CGRectGetMaxY(v81);
    objc_msgSend(v19, "descender");
    v27 = v54 + v55;
  }
  else
  {
    rect = v22;
    v46 = v72;
  }
  v56 = width + -44.0 - v12;
  objc_msgSend(MEMORY[0x1E0D7B160], "activityCaptionCellTopToLikeButtonTopDynamicDistance");
  v58 = v8 + v57;
  v82.origin.x = v56;
  v82.origin.y = v58;
  v82.size.width = 44.0;
  v82.size.height = 44.0;
  v59 = CGRectGetMaxY(v82);
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUFeedCaptionCell semanticContentAttribute](self, "semanticContentAttribute")) == 1)
    {
      -[PUFeedCaptionCell bounds](self, "bounds");
      CGRectGetMaxX(v83);
      v84.origin.x = v56;
      v84.origin.y = v58;
      v84.size.width = 44.0;
      v84.size.height = 44.0;
      CGRectGetWidth(v84);
      v85.origin.x = v56;
      v85.origin.y = v58;
      v85.size.width = 44.0;
      v85.size.height = 44.0;
      CGRectGetMinX(v85);
      v68 = v59;
      v86.origin.x = v70;
      v86.origin.y = v73;
      v86.size.width = v74;
      v86.size.height = v75;
      CGRectGetWidth(v86);
      v87.origin.x = v70;
      v87.origin.y = v73;
      v87.size.width = v74;
      v87.size.height = v75;
      CGRectGetMinX(v87);
      v88.origin.x = rect;
      v88.origin.y = v76;
      v88.size.width = v46;
      v88.size.height = v24;
      CGRectGetWidth(v88);
      v89.origin.x = rect;
      v89.origin.y = v76;
      v89.size.width = v46;
      v89.size.height = v24;
      CGRectGetMinX(v89);
    }
    -[PUFeedCaptionCell traitCollection](self, "traitCollection", *(_QWORD *)&v68);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "displayScale");
    v62 = v61;

    if (v62 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "scale");

    }
    PXRectRoundToPixel();
    objc_msgSend(v14, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v15, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v13, "setFrame:");
  }
  if (v27 >= v59)
    v64 = v27;
  else
    v64 = v59;
  v65 = v71 + v64;

  v66 = width;
  v67 = v65;
  result.height = v67;
  result.width = v66;
  return result;
}

- (void)_handleLikeButtonTap:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  PUFeedCaptionCell *v10;

  -[PUFeedCaptionCell likeButton](self, "likeButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSelected") ^ 1;

  -[PUFeedCaptionCell _setLikeButtonLiked:](self, "_setLikeButtonLiked:", v5);
  -[PUFeedCell delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = dispatch_time(0, 100000000);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__PUFeedCaptionCell__handleLikeButtonTap___block_invoke;
    v8[3] = &unk_1E58ABCA8;
    v9 = v6;
    v10 = self;
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

  }
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXFeedSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (unint64_t)captionItemIndex
{
  return self->_captionItemIndex;
}

- (BOOL)hideCaption
{
  return self->_hideCaption;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (PXUIButton)likeButton
{
  return self->_likeButton;
}

- (void)setLikeButton:(id)a3
{
  objc_storeStrong((id *)&self->_likeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

uint64_t __42__PUFeedCaptionCell__handleLikeButtonTap___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapLikeButtonInFeedCaptionCell:", *(_QWORD *)(a1 + 40));
}

@end
