@implementation SearchUIVerticalLayoutCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
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
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  -[SearchUIVerticalLayoutCardSectionView setUseAppIconMetrics:](self, "setUseAppIconMetrics:", 0);
  v3 = (void *)objc_opt_new();
  -[SearchUIVerticalLayoutCardSectionView setThumbnailView:](self, "setThumbnailView:", v3);

  -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumLayoutSize:", 60.0, 60.0);

  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  -[SearchUIVerticalLayoutCardSectionView setTitleLabel:](self, "setTitleLabel:", v6);

  -[SearchUIVerticalLayoutCardSectionView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v5);

  -[SearchUIVerticalLayoutCardSectionView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSupportsColorGlyphs:", 1);

  +[TLKLabel secondaryLabel](SearchUILabel, "secondaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIVerticalLayoutCardSectionView setFootnoteLabel:](self, "setFootnoteLabel:", v9);

  -[SearchUIVerticalLayoutCardSectionView footnoteLabel](self, "footnoteLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v5);

  -[SearchUIVerticalLayoutCardSectionView footnoteLabel](self, "footnoteLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSupportsColorGlyphs:", 1);

  v12 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIVerticalLayoutCardSectionView titleLabel](self, "titleLabel", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  -[SearchUIVerticalLayoutCardSectionView footnoteLabel](self, "footnoteLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v16);

  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, 5.5);
  objc_msgSend(v17, "setSpacing:");
  objc_msgSend(v17, "setAxis:", 1);
  objc_msgSend(v17, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v17);

  return v17;
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

  -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIVerticalLayoutCardSectionView convertRect:fromView:](self, "convertRect:fromView:", v13, v5, v7, v9, v11);
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

  -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightReferenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  v4 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v10, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIVerticalLayoutCardSectionView setUseAppIconMetrics:](self, "setUseAppIconMetrics:", objc_msgSend(v5, "useAppIconMetrics"));
  -[SearchUICardSectionView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SearchUIVerticalLayoutCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1EA1F6210;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBatchUpdates:", v8);

}

uint64_t __60__SearchUIVerticalLayoutCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
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
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;

  if (objc_msgSend(*(id *)(a1 + 32), "useAppIconMetrics"))
  {
    v2 = objc_alloc(MEMORY[0x1E0DAA438]);
    v3 = (void *)objc_msgSend(v2, "initWithScreenType:", objc_msgSend(MEMORY[0x1E0DAA438], "currentDeviceScreenType"));
    objc_msgSend(v3, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
      v5 = 4;
    else
      v5 = 5;
    +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", v5);
    v7 = v6;
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "thumbnail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = 0.0;
    else
      v11 = 4.0;

    v12 = v7 - v11;
    v13 = v9 - v11;
    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProminence:", 0);

    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredContentSizeCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelVisualConfigurationForContentSizeCategory:options:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4A98], 0, *MEMORY[0x1E0DC1438]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontSize");
    objc_msgSend(v18, "fontWithSize:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v19);

    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProminence:", 1);

    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTextAlignment:", 1);

    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProminence:", 2);

    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextAlignment:", 1);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlignment:", 3);

    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMinimumLayoutSize:", v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMaximumLayoutSize:", v12, v13);

    +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell](SearchUIAppIconUtilities, "distanceToTopOfAppIconsForMultiResultCell");
    v29 = v11 * 0.5;
    v31 = v29 + v30;
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLayoutMarginsRelativeArrangement:", 1);

    if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
      v33 = 16.0;
    else
      v33 = 10.0;
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDirectionalLayoutMargins:", v31, 4.0, v33, 4.0);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "baselineOffsetFromImage");
    v37 = v29 + v36;
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "effectiveFirstBaselineOffsetFromTop");
    v40 = v37 - v39;
    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCustomSpacing:afterView:", v41, v40);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCustomSpacing:afterView:", v43, 0.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setProminence:", 1);

    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFont:", v4);

    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFont:", v4);

    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setProminence:", 0);

    if (objc_msgSend(*(id *)(a1 + 40), "contentsLeading"))
      v48 = 4;
    else
      v48 = 1;
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTextAlignment:", v48);

    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setProminence:", 1);

    if (objc_msgSend(*(id *)(a1 + 40), "contentsLeading"))
      v51 = 4;
    else
      v51 = 1;
    objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTextAlignment:", v51);

    objc_msgSend(*(id *)(a1 + 40), "thumbnailOverlayText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
      objc_msgSend(*(id *)(a1 + 32), "buildThumbnailOverlayContainerIfNecessary");
    if (objc_msgSend(*(id *)(a1 + 40), "contentsLeading"))
      v54 = 1;
    else
      v54 = 3;
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAlignment:", v54);

    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setMinimumLayoutSize:", 60.0, 60.0);

    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setMaximumLayoutSize:", 1.79769313e308, 1.79769313e308);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = TLKSnippetModernizationEnabled();
    v60 = *MEMORY[0x1E0CFAA78];
    if (v59)
      v61 = 8.0;
    else
      v61 = *MEMORY[0x1E0CFAA78];
    objc_msgSend(*(id *)(a1 + 32), "thumbnailView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCustomSpacing:afterView:", v62, v61);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (TLKSnippetModernizationEnabled())
      v64 = 2.0;
    else
      v64 = v60;
    objc_msgSend(*(id *)(a1 + 32), "titleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setCustomSpacing:afterView:", v65, v64);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setLayoutMarginsRelativeArrangement:", 0);

    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }

  v67 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "thumbnailOverlayText");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "updateThumbnailOverlayContainerWithText:", v68);

  objc_msgSend(*(id *)(a1 + 40), "title");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSfText:", v69);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "richText");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "hasContent") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setHidden:", v73);

  objc_msgSend(*(id *)(a1 + 40), "footnote");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setSfText:", v75);

  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "richText");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "hasContent") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "footnoteLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setHidden:", v79);

  return objc_msgSend(*(id *)(a1 + 32), "tlk_updateWithCurrentAppearance");
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
  v9.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUIVerticalLayoutCardSectionView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIVerticalLayoutCardSectionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIVerticalLayoutCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIVerticalLayoutCardSectionView traitCollection](self, "traitCollection");
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
  v3.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUIVerticalLayoutCardSectionView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIVerticalLayoutCardSectionView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUIVerticalLayoutCardSectionView tlk_updateForAppearance:](&v27, sel_tlk_updateForAppearance_, v4);
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SearchUIVerticalLayoutCardSectionView useAppIconMetrics](self, "useAppIconMetrics"))
    {
      -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minimumLayoutSize");
      v10 = v9;
      v12 = v11;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[SearchUIImage imageWithSFImage:](SearchUISymbolImage, "imageWithSFImage:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v10 >= v12)
          v15 = v12;
        else
          v15 = v10;
        objc_msgSend(v13, "setPreferredSymbolFontSize:", v15 * 0.5);
        if ((objc_msgSend(v4, "isDark") & 1) != 0)
          objc_msgSend(v4, "quaternaryColor");
        else
          objc_msgSend(v4, "quinaryColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCustomBackgroundColor:", v19);

        v20 = objc_msgSend(v4, "isDark");
        objc_msgSend(v4, "primaryColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if ((v20 & 1) != 0)
        {
          objc_msgSend(v14, "setCustomForegroundColor:", v21);
        }
        else
        {
          objc_msgSend(v21, "colorWithAlphaComponent:", 0.75);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCustomForegroundColor:", v23);

        }
        objc_msgSend(v14, "setSize:", v10, v12);

      }
      else
      {
        v14 = v7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v24 = 0;
LABEL_23:
        -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAlignment:", v24);

        -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "updateWithImage:", v14);

        goto LABEL_24;
      }
      v7 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "photoIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("photoIdentifier: %@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIVerticalLayoutCardSectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v18);

      }
      else
      {
        -[SearchUIVerticalLayoutCardSectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", 0);
      }
    }
    v24 = 2;
    v14 = v7;
    goto LABEL_23;
  }
LABEL_24:

}

- (void)buildThumbnailOverlayContainerIfNecessary
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[SearchUIVerticalLayoutCardSectionView setGradientImageView:](self, "setGradientImageView:", v4);

    -[SearchUIVerticalLayoutCardSectionView gradientImageView](self, "gradientImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.4);

    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("PXBadgeGradientRight"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionView gradientImageView](self, "gradientImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    -[SearchUIVerticalLayoutCardSectionView setThumbnailOverlayLabel:](self, "setThumbnailOverlayLabel:", v11);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v10);

    if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
      v13 = 2;
    else
      v13 = 0;
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextAlignment:", v13);

    v15 = (void *)objc_opt_new();
    -[SearchUIVerticalLayoutCardSectionView setThumbnailOverlayImageView:](self, "setThumbnailOverlayImageView:", v15);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSymbolFont:", v10);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProminence:", 0);

    v18 = objc_alloc(MEMORY[0x1E0CFAA98]);
    -[SearchUIVerticalLayoutCardSectionView gradientImageView](self, "gradientImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v20;
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithArrangedSubviews:", v22);
    -[SearchUIVerticalLayoutCardSectionView setThumbnailOverlayContainer:](self, "setThumbnailOverlayContainer:", v23);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHorizontalAlignment:", 4);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setVerticalAlignment:", 4);

    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "overrideAppearanceForView:", v27);

    -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "imageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v31);

  }
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUICardSectionView updateChevronVisible:leaveSpaceForChevron:](&v4, sel_updateChevronVisible_leaveSpaceForChevron_, 0, 0);
}

- (void)updateThumbnailOverlayContainerWithText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayContainer](self, "thumbnailOverlayContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v15 == 0);

  -[SearchUICardSectionView section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailOverlayText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithImage:", v8);

  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8 == 0);

  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSfText:", v15);

  if (v8)
  {
    v12 = 0;
    v13 = 1;
  }
  else
  {
    objc_msgSend(v15, "formattedTextPieces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = 0;
      v13 = 0;
    }
    else
    {
      objc_msgSend(v15, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10 == 0;
      v12 = 1;
    }
  }
  -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  if (v12)
  if (!v8)

}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  void *v5;
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
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[SearchUICardSectionView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v26)
  {
    -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView section](self, "section");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "thumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v8)
      goto LABEL_4;
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIVerticalLayoutCardSectionView thumbnailView](self, "thumbnailView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v10, "cornerRadiusForSize:roundingStyle:", 1, v12, v13);
    v15 = v14;

    v16 = v15 * 1.74 + -15.11;
    if (v16 < 3.0)
      v16 = 3.0;
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, v16);
    v18 = -v17;
    v19 = -1.0 - v17;
    v20 = (void *)MEMORY[0x1E0DBD9B0];
    objc_msgSend(v4, "descender");
    objc_msgSend(v20, "deviceScaledRoundedValue:forView:", self, v21 * 0.5);
    v23 = v18 - v22;
    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayLabel](self, "thumbnailOverlayLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCustomAlignmentRectInsets:", 0.0, 0.0, v23, v19);

    -[SearchUIVerticalLayoutCardSectionView thumbnailOverlayImageView](self, "thumbnailOverlayImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCustomAlignmentRectInsets:", 0.0, 0.0, v18, v19);

  }
LABEL_4:

}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height;
  double width;
  SearchUIVerticalLayoutCardSectionView *v9;
  SearchUIVerticalLayoutCardSectionView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  objc_super v22;

  height = a4.height;
  width = a4.width;
  v9 = (SearchUIVerticalLayoutCardSectionView *)a3;
  v10 = v9;
  if (v9 == self && !a5 && -[SearchUIVerticalLayoutCardSectionView useAppIconMetrics](v9, "useAppIconMetrics"))
  {
    -[SearchUIVerticalLayoutCardSectionView titleLabel](v10, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "richText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "hasContent") & 1) == 0)
    {

      goto LABEL_8;
    }
    -[SearchUIVerticalLayoutCardSectionView footnoteLabel](v10, "footnoteLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "richText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasContent");

    if (v15)
    {
      -[SearchUIVerticalLayoutCardSectionView titleLabel](v10, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textRectForBounds:limitedToNumberOfLines:", 1, 0.0, 0.0, width + -16.0, 1.79769313e308);
      v18 = v17;

      -[SearchUIVerticalLayoutCardSectionView titleLabel](v10, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, width + -16.0, 1.79769313e308);
      v21 = v20;

      -[SearchUIVerticalLayoutCardSectionView footnoteLabel](v10, "footnoteLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", v21 > ceil(v18));
LABEL_8:

    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v22, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, v10, a5, width, height);

}

- (SearchUIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (SearchUILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (NUIContainerBoxView)thumbnailOverlayContainer
{
  return self->_thumbnailOverlayContainer;
}

- (void)setThumbnailOverlayContainer:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailOverlayContainer, a3);
}

- (UIImageView)gradientImageView
{
  return self->_gradientImageView;
}

- (void)setGradientImageView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientImageView, a3);
}

- (SearchUILabel)thumbnailOverlayLabel
{
  return self->_thumbnailOverlayLabel;
}

- (void)setThumbnailOverlayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailOverlayLabel, a3);
}

- (SearchUIImageView)thumbnailOverlayImageView
{
  return self->_thumbnailOverlayImageView;
}

- (void)setThumbnailOverlayImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailOverlayImageView, a3);
}

- (BOOL)useAppIconMetrics
{
  return self->_useAppIconMetrics;
}

- (void)setUseAppIconMetrics:(BOOL)a3
{
  self->_useAppIconMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailOverlayImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailOverlayLabel, 0);
  objc_storeStrong((id *)&self->_gradientImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailOverlayContainer, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
