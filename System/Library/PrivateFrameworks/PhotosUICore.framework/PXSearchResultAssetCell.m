@implementation PXSearchResultAssetCell

- (PXSearchResultAssetCell)initWithFrame:(CGRect)a3
{
  PXSearchResultAssetCell *v3;
  PXSearchResultAssetCell *v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;
  id v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *v20;
  UIImageView *v21;
  UIImageView *v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *thumbnailImageView;
  UIImageView *v34;
  UIImageView *leadingBadgeImageView;
  UIImageView *v36;
  UIImageView *leadingBackgroundGradientView;
  UIImageView *v38;
  UIImageView *trailingBadgeImageView;
  UIImageView *v40;
  UILabel *trailingVideoDurationLabel;
  UILabel *v42;
  UIImageView *trailingBackgroundGradientView;
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
  UILabel *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  UIImageView *v68;
  void *v69;
  UIImageView *v70;
  void *v71;
  void *v72;
  UIImageView *v73;
  void *v74;
  void *v75;
  void *v76;
  UIImageView *v77;
  void *v78;
  void *v79;
  UIImageView *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  PXSearchResultAssetCell *v85;
  objc_super v86;
  _QWORD v87[16];

  v87[14] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)PXSearchResultAssetCell;
  v3 = -[PXSearchResultAssetCell initWithFrame:](&v86, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSearchResultAssetCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v6, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIImageView setAccessibilityIgnoresInvertColors:](v6, "setAccessibilityIgnoresInvertColors:", 1);
    v8 = v6;
    objc_msgSend(v5, "addSubview:", v6);
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    v85 = v4;
    -[PXSearchResultAssetCell traitCollection](v4, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXBadgeHelper leadingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "leadingCornerGradientBackgroundImageForLayoutDirection:", objc_msgSend(v10, "layoutDirection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIImageView *)objc_msgSend(v9, "initWithImage:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v12, "setTintColor:", v13);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v12);
    v14 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PXSearchResultAssetCell traitCollection](v4, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXBadgeHelper trailingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "trailingCornerGradientBackgroundImageForLayoutDirection:", objc_msgSend(v15, "layoutDirection"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (UIImageView *)objc_msgSend(v14, "initWithImage:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v17, "setTintColor:", v18);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v17);
    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = v19;
    objc_msgSend(v5, "addSubview:", v19);
    v21 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = v21;
    objc_msgSend(v5, "addSubview:", v21);
    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setHidden:](v23, "setHidden:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v23);
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v82;
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v78;
    v80 = v8;
    -[UIImageView topAnchor](v8, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v74;
    -[UIImageView bottomAnchor](v8, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v69;
    v77 = v20;
    -[UIImageView bottomAnchor](v20, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, -5.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v65;
    -[UIImageView leadingAnchor](v20, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v62, 5.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v61;
    v73 = v12;
    -[UIImageView bottomAnchor](v12, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v58;
    -[UIImageView leadingAnchor](v12, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v55;
    v70 = v22;
    -[UIImageView bottomAnchor](v22, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v52, -5.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v87[8] = v51;
    -[UIImageView trailingAnchor](v22, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -5.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v87[9] = v48;
    v68 = v17;
    -[UIImageView bottomAnchor](v17, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v87[10] = v45;
    -[UIImageView trailingAnchor](v17, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v87[11] = v26;
    v63 = v23;
    -[UILabel bottomAnchor](v23, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v87[12] = v29;
    -[UILabel trailingAnchor](v23, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -5.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v87[13] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 14);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v53);
    thumbnailImageView = v85->_thumbnailImageView;
    v85->_thumbnailImageView = v80;
    v34 = v80;

    leadingBadgeImageView = v85->_leadingBadgeImageView;
    v85->_leadingBadgeImageView = v77;
    v36 = v77;

    leadingBackgroundGradientView = v85->_leadingBackgroundGradientView;
    v85->_leadingBackgroundGradientView = v73;
    v38 = v73;

    trailingBadgeImageView = v85->_trailingBadgeImageView;
    v85->_trailingBadgeImageView = v70;
    v40 = v70;

    trailingVideoDurationLabel = v85->_trailingVideoDurationLabel;
    v85->_trailingVideoDurationLabel = v63;
    v42 = v63;

    v4 = v85;
    trailingBackgroundGradientView = v85->_trailingBackgroundGradientView;
    v85->_trailingBackgroundGradientView = v68;

  }
  return v4;
}

- (void)setAssetThumbnailBadgeTypes:(unint64_t)a3 forAsset:(id)a4
{
  char v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  v22 = a4;
  if ((v4 & 1) != 0)
  {
    +[PXBadgeHelper contentSyndicationGuestAssetBadgeImage](PXBadgeHelper, "contentSyndicationGuestAssetBadgeImage");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((v4 & 0x10) != 0)
  {
    +[PXBadgeHelper favoriteBadgeImage](PXBadgeHelper, "favoriteBadgeImage");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v8;
    if ((v4 & 2) != 0)
      goto LABEL_4;
    goto LABEL_8;
  }
  v6 = 0;
  if ((v4 & 2) != 0)
  {
LABEL_4:
    +[PXBadgeHelper ocrAssetBadgeImage](PXBadgeHelper, "ocrAssetBadgeImage");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v10 = (void *)v7;
    v9 = 0;
    goto LABEL_14;
  }
LABEL_8:
  if ((v4 & 4) != 0)
  {
    +[PXSearchResultAssetCell _videoDurationFormatter](PXSearchResultAssetCell, "_videoDurationFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "duration");
    PXLocalizedVideoDuration();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXSearchResultAssetCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
    objc_msgSend(MEMORY[0x1E0CB3498], "px_thumbnailVideoDurationAttributedString:layoutDirection:", v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  if ((v4 & 8) != 0)
  {
    +[PXBadgeHelper panoramaBadgeImage](PXBadgeHelper, "panoramaBadgeImage");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = 0;
  v10 = 0;
LABEL_14:
  v14 = 1;
LABEL_15:
  -[PXSearchResultAssetCell leadingBadgeImageView](self, "leadingBadgeImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v6);

  -[PXSearchResultAssetCell leadingBackgroundGradientView](self, "leadingBackgroundGradientView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v6 == 0);

  -[PXSearchResultAssetCell trailingBadgeImageView](self, "trailingBadgeImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v10);

  if (v10)
    v18 = 0;
  else
    v18 = v14;
  -[PXSearchResultAssetCell trailingBackgroundGradientView](self, "trailingBackgroundGradientView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

  -[PXSearchResultAssetCell trailingVideoDurationLabel](self, "trailingVideoDurationLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v14);

  -[PXSearchResultAssetCell trailingVideoDurationLabel](self, "trailingVideoDurationLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedText:", v9);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSearchResultAssetCell;
  -[PXSearchResultAssetCell prepareForReuse](&v9, sel_prepareForReuse);
  -[PXSearchResultAssetCell thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXSearchResultAssetCell leadingBadgeImageView](self, "leadingBadgeImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[PXSearchResultAssetCell leadingBackgroundGradientView](self, "leadingBackgroundGradientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[PXSearchResultAssetCell trailingBadgeImageView](self, "trailingBadgeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

  -[PXSearchResultAssetCell trailingBackgroundGradientView](self, "trailingBackgroundGradientView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[PXSearchResultAssetCell trailingVideoDurationLabel](self, "trailingVideoDurationLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXSearchResultAssetCell *v7;
  PXSearchResultAssetCell *v8;
  PXSearchResultAssetCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultAssetCell;
  -[PXSearchResultAssetCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXSearchResultAssetCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    +[PXFocusRing updateView:infoProviderBlock:](PXFocusRing, "updateView:infoProviderBlock:", self, 0);
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (PXSearchResultAssetCell *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (id)focusEffect
{
  return 0;
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchResultAssetCell thumbnailImageView](self, "thumbnailImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (CGSize)thumbnailImageViewPixelSize
{
  void *v3;
  double v4;
  double v5;
  CGSize result;

  -[PXSearchResultAssetCell thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");

  -[PXSearchResultAssetCell px_screenScale](self, "px_screenScale");
  PXSizeScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (UIImageView)leadingBadgeImageView
{
  return self->_leadingBadgeImageView;
}

- (void)setLeadingBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBadgeImageView, a3);
}

- (UIImageView)trailingBadgeImageView
{
  return self->_trailingBadgeImageView;
}

- (void)setTrailingBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBadgeImageView, a3);
}

- (UILabel)trailingVideoDurationLabel
{
  return self->_trailingVideoDurationLabel;
}

- (void)setTrailingVideoDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingVideoDurationLabel, a3);
}

- (UIImageView)leadingBackgroundGradientView
{
  return self->_leadingBackgroundGradientView;
}

- (void)setLeadingBackgroundGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBackgroundGradientView, a3);
}

- (UIImageView)trailingBackgroundGradientView
{
  return self->_trailingBackgroundGradientView;
}

- (void)setTrailingBackgroundGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBackgroundGradientView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_leadingBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_trailingVideoDurationLabel, 0);
  objc_storeStrong((id *)&self->_trailingBadgeImageView, 0);
  objc_storeStrong((id *)&self->_leadingBadgeImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
}

+ (id)_videoDurationFormatter
{
  if (_videoDurationFormatter_onceToken != -1)
    dispatch_once(&_videoDurationFormatter_onceToken, &__block_literal_global_127726);
  return (id)_videoDurationFormatter_videoDurationFormatter;
}

void __50__PXSearchResultAssetCell__videoDurationFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_videoDurationFormatter_videoDurationFormatter;
  _videoDurationFormatter_videoDurationFormatter = (uint64_t)v0;

}

@end
