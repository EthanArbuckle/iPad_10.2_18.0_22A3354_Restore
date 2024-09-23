@implementation SearchUINewsCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (double)providerImageVerticalSizeDelta
{
  double result;

  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, -4.0);
  return result;
}

- (double)providerImageVerticalOffset
{
  double result;

  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, -1.0);
  return result;
}

- (double)minThumbnailBottomSpacing
{
  void *v3;
  int v4;
  double v5;
  double result;

  v3 = (void *)MEMORY[0x1E0DBD9B0];
  v4 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v5 = 8.0;
  if (v4)
    v5 = 6.0;
  objc_msgSend(v3, "deviceScaledRoundedValue:forView:", self, v5);
  return result;
}

- (double)stackViewVerticalSpacing
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 2.0;
  if (v2)
    return 1.0;
  return result;
}

- (UIEdgeInsets)textContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -8.0;
  v3 = -8.0;
  v4 = -8.0;
  v5 = -8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)smallThumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 155.0;
  v3 = 114.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)largeThumbnailSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SearchUINewsCardSectionView smallThumbnailSize](self, "smallThumbnailSize");
  v4 = v3;
  -[SearchUINewsCardSectionView smallThumbnailSize](self, "smallThumbnailSize");
  v6 = v5 * 1.8;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGRect)highlightFrame
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView convertRect:fromView:](self, "convertRect:fromView:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)highlightReferenceView
{
  void *v2;
  void *v3;

  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightReferenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SearchUINewsCardSectionView setThumbnailImageView:](self, "setThumbnailImageView:", v3);

  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView smallThumbnailSize](self, "smallThumbnailSize");
  objc_msgSend(v4, "setLayoutSize:withContentPriority:");

  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:", 2);

  v6 = (void *)objc_opt_new();
  -[SearchUINewsCardSectionView setProviderImageView:](self, "setProviderImageView:", v6);

  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProminence:", 1);

  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", 4);

  +[TLKLabel primaryLabel](SearchUILabel, "primaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v9;
  -[SearchUINewsCardSectionView setTitleLabel:](self, "setTitleLabel:", v9);
  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DBD940];
  v12 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v13 = *MEMORY[0x1E0DC4B10];
  if (v12)
    v14 = *MEMORY[0x1E0DC4B10];
  else
    v14 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(v11, "cachedFontForTextStyle:isBold:isMacStyle:", v14, 0, objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v10;
  objc_msgSend(v10, "setFont:", v15);

  -[SearchUINewsCardSectionView setSubtitleLabel:](self, "setSubtitleLabel:", v10);
  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isBold:isMacStyle:", *MEMORY[0x1E0DC4AA0], 1, objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  -[SearchUINewsCardSectionView setProviderLabel:](self, "setProviderLabel:", v16);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v13, 32834, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0DC1468] + 0.1;
  v62 = *MEMORY[0x1E0DC13C0];
  v60 = *MEMORY[0x1E0DC1478];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "fontDescriptorByAddingAttributes:", v56);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v54, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v22);

  v23 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v24;
  -[SearchUINewsCardSectionView providerLabel](self, "providerLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v25;
  -[SearchUINewsCardSectionView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v26;
  -[SearchUINewsCardSectionView subtitleLabel](self, "subtitleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v28);

  objc_msgSend(v29, "setAxis:", 1);
  objc_msgSend(v29, "setAlignment:", 1);
  objc_msgSend(v29, "setDistribution:", 2);
  -[SearchUINewsCardSectionView stackViewVerticalSpacing](self, "stackViewVerticalSpacing");
  objc_msgSend(v29, "setSpacing:");
  LODWORD(v30) = 1144750080;
  objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  -[SearchUINewsCardSectionView setTextContentStackView:](self, "setTextContentStackView:", v29);
  v31 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v32;
  v58[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v31, "initWithArrangedSubviews:", v33);

  objc_msgSend(v34, "setAxis:", 1);
  objc_msgSend(v34, "setAlignment:", 0);
  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAlignment:forView:inAxis:", 0, v35, 0);

  -[SearchUINewsCardSectionView stackViewVerticalSpacing](self, "stackViewVerticalSpacing");
  objc_msgSend(v34, "setSpacing:");
  -[SearchUINewsCardSectionView stackViewVerticalSpacing](self, "stackViewVerticalSpacing");
  v37 = v36;
  objc_msgSend(v16, "effectiveBaselineOffsetFromContentBottom");
  v39 = v37 + v38;
  -[SearchUINewsCardSectionView providerImageVerticalOffset](self, "providerImageVerticalOffset");
  v41 = v39 + v40;
  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCustomSpacing:afterView:", v42, v41);

  objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v34);
  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CFAA78];
  -[SearchUINewsCardSectionView providerLabel](self, "providerLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "intrinsicContentSize");
  v47 = v46;
  -[SearchUINewsCardSectionView providerImageVerticalSizeDelta](self, "providerImageVerticalSizeDelta");
  LODWORD(v49) = 1148846080;
  objc_msgSend(v43, "setLayoutSize:withContentPriority:", v44, v47 + v48, v49);

  v50 = (void *)objc_opt_new();
  objc_msgSend(v50, "setVerticalAlignment:", 0);
  objc_msgSend(v50, "setHorizontalAlignment:", 0);
  -[SearchUINewsCardSectionView setBaseBoxView:](self, "setBaseBoxView:", v50);
  v51 = (void *)objc_opt_new();
  objc_msgSend(v51, "setVerticalAlignment:", 4);
  objc_msgSend(v51, "setHorizontalAlignment:", 0);
  -[SearchUINewsCardSectionView setTextContentBoxView:](self, "setTextContentBoxView:", v51);
  v52 = (void *)objc_opt_new();
  -[SearchUINewsCardSectionView setGradientView:](self, "setGradientView:", v52);

  return v34;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
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
  _BOOL8 v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SearchUINewsCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v37, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection", v37.receiver, v37.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUINewsCardSectionView updateLayoutForCardSection:](self, "updateLayoutForCardSection:", v5);
  -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithImage:", v7);

  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithImage:", v9);

  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSfText:", v10);

  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v12 == 0);

  objc_msgSend(v5, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSfText:", v14);

  objc_msgSend(v5, "subtitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView subtitleLabel](self, "subtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", v16 == 0);

  objc_msgSend(v5, "providerTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUINewsCardSectionView providerLabel](self, "providerLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSfText:", v18);

  objc_msgSend(v5, "providerImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;
  v22 = v20 != 0;

  -[SearchUINewsCardSectionView providerLabel](self, "providerLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", v22);

  -[SearchUINewsCardSectionView providerImageView](self, "providerImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", v21);

  if (!-[SearchUINewsCardSectionView overlaysTextInImage](self, "overlaysTextInImage"))
  {
    objc_msgSend(v5, "providerImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUINewsCardSectionView providerImageVerticalSizeDelta](self, "providerImageVerticalSizeDelta");
    if (v25)
    {
      v27 = fmax(-v26, 0.0);
    }
    else
    {
      v28 = fmax(v26, 0.0);
      -[SearchUINewsCardSectionView providerLabel](self, "providerLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "effectiveBaselineOffsetFromContentBottom");
      v31 = v28 + v30;
      -[SearchUINewsCardSectionView providerImageVerticalOffset](self, "providerImageVerticalOffset");
      v27 = v31 + v32;

    }
    -[SearchUICardSectionView contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUINewsCardSectionView minThumbnailBottomSpacing](self, "minThumbnailBottomSpacing");
    v35 = v27 + v34;
    -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCustomSpacing:afterView:", v36, v35);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUINewsCardSectionView;
  -[SearchUINewsCardSectionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUINewsCardSectionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUINewsCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUINewsCardSectionView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUINewsCardSectionView;
  -[SearchUINewsCardSectionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUINewsCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUINewsCardSectionView;
  -[SearchUINewsCardSectionView tlk_updateForAppearance:](&v10, sel_tlk_updateForAppearance_, v4);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "overlayTextInImage") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;
  -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overrideAppearanceForView:", v9);

}

- (void)updateLayoutForCardSection:(id)a3
{
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
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
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v43 = a3;
  v4 = objc_msgSend(v43, "overlayTextInImage");
  v5 = v4 == -[SearchUINewsCardSectionView overlaysTextInImage](self, "overlaysTextInImage");
  v6 = v43;
  if (!v5)
  {
    -[SearchUINewsCardSectionView setOverlaysTextInImage:](self, "setOverlaysTextInImage:", objc_msgSend(v43, "overlayTextInImage"));
    -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SearchUINewsCardSectionView textContentBoxView](self, "textContentBoxView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SearchUINewsCardSectionView baseBoxView](self, "baseBoxView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[SearchUINewsCardSectionView gradientView](self, "gradientView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    if (objc_msgSend(v43, "overlayTextInImage"))
    {
      -[SearchUINewsCardSectionView textContentInset](self, "textContentInset");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCustomAlignmentRectInsets:", v13, v15, v17, v19);

      -[SearchUINewsCardSectionView textContentBoxView](self, "textContentBoxView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addArrangedSubview:", v22);

      -[SearchUINewsCardSectionView baseBoxView](self, "baseBoxView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView gradientView](self, "gradientView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addArrangedSubview:", v24);

      -[SearchUINewsCardSectionView baseBoxView](self, "baseBoxView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView textContentBoxView](self, "textContentBoxView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addArrangedSubview:", v26);

      -[SearchUICardSectionView contentView](self, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addArrangedSubview:", v28);

      -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "imageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView baseBoxView](self, "baseBoxView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addSubview:", v31);

      -[SearchUINewsCardSectionView baseBoxView](self, "baseBoxView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v32);

      -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView largeThumbnailSize](self, "largeThumbnailSize");
      objc_msgSend(v33, "setLayoutSize:withHorizontalContentPriority:verticalContentPriority:");
    }
    else
    {
      v34 = *MEMORY[0x1E0DC49E8];
      v35 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v36 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v37 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setCustomAlignmentRectInsets:", v34, v35, v36, v37);

      -[SearchUICardSectionView contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addArrangedSubview:", v40);

      -[SearchUICardSectionView contentView](self, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView textContentStackView](self, "textContentStackView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addArrangedSubview:", v42);

      -[SearchUINewsCardSectionView thumbnailImageView](self, "thumbnailImageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUINewsCardSectionView smallThumbnailSize](self, "smallThumbnailSize");
      objc_msgSend(v33, "setLayoutSize:withContentPriority:");
    }

    v6 = v43;
  }

}

- (NUIContainerBoxView)baseBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setBaseBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (NUIContainerBoxView)textContentBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 808, 1);
}

- (void)setTextContentBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NUIContainerStackView)textContentStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setTextContentStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (SearchUINewsCardGradientView)gradientView
{
  return (SearchUINewsCardGradientView *)objc_getProperty(self, a2, 824, 1);
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (SearchUIImageView)thumbnailImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 832, 1);
}

- (void)setThumbnailImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (SearchUIImageView)providerImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 840, 1);
}

- (void)setProviderImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (SearchUILabel)providerLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 848, 1);
}

- (void)setProviderLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 856, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 864, 1);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (BOOL)overlaysTextInImage
{
  return self->_overlaysTextInImage;
}

- (void)setOverlaysTextInImage:(BOOL)a3
{
  self->_overlaysTextInImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_providerLabel, 0);
  objc_storeStrong((id *)&self->_providerImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_textContentStackView, 0);
  objc_storeStrong((id *)&self->_textContentBoxView, 0);
  objc_storeStrong((id *)&self->_baseBoxView, 0);
}

@end
