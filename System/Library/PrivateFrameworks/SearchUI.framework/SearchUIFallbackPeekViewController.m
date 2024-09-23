@implementation SearchUIFallbackPeekViewController

- (SearchUIFallbackPeekViewController)initWithDetailedRowModel:(id)a3
{
  id v4;
  SearchUIFallbackPeekViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double Width;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char isKindOfClass;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  float v47;
  float v48;
  float v49;
  float v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  SearchUIFallbackPeekViewController *v59;
  id v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  id v69;
  uint64_t v70;
  objc_super v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SearchUIFallbackPeekViewController;
  v5 = -[SearchUIFallbackPeekViewController init](&v71, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIFallbackPeekViewController view](v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[SearchUIFallbackPeekViewController view](v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tlks_screen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    Width = CGRectGetWidth(v75);

    v11 = Width / (Width + -32.0);
    v61 = (void *)objc_opt_new();
    objc_msgSend(v4, "identifyingResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v5;
    if (v12)
    {
      objc_msgSend(v4, "identifyingResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAppIconImage appIconForResult:variant:](SearchUIAppIconImage, "appIconForResult:variant:", v13, 3);
    }
    else
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v13, 3);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "size");
    v16 = ceil(v11 * v15);
    objc_msgSend(v14, "size");
    objc_msgSend(v14, "setSize:", v16, ceil(v11 * v17));
    v58 = v14;
    +[SearchUIImageView imageViewWithImage:](SearchUIImageView, "imageViewWithImage:", v14);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:");
    v18 = (void *)objc_opt_new();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __63__SearchUIFallbackPeekViewController_initWithDetailedRowModel___block_invoke;
    v67[3] = &unk_1EA1F7420;
    v19 = v18;
    v68 = v19;
    v70 = 0x4031000000000000;
    v60 = v4;
    v20 = v4;
    v69 = v20;
    objc_msgSend(v19, "performBatchUpdates:", v67);
    objc_msgSend(v61, "addObject:", v19);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v20, "details");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v64 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v26 = objc_alloc(MEMORY[0x1E0DBD9A8]);
          objc_msgSend(v20, "details");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v26, "initWithProminence:", v25 != v28);

          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setFont:", v30);

          +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v25);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "hasContent"))
          {
            objc_msgSend(v31, "setMaxLines:", 0);
            objc_msgSend(v29, "setRichText:", v31);
            objc_msgSend(v61, "addObject:", v29);
          }

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v22);
    }

    objc_msgSend(v61, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 1132068864;
    objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    objc_msgSend(v20, "leadingImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v34, "bundleIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v5 = v59;
    if ((objc_msgSend(v34, "isEqual:", v58) & 1) != 0)
      goto LABEL_28;
    objc_msgSend(v58, "bundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v34 || (v37 & 1) != 0)
      goto LABEL_28;
    objc_msgSend(v20, "fallbackImage");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v34;
    if (v34 != (void *)v38)
    {
      v40 = (void *)v38;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
LABEL_28:
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAAB0]), "initWithArrangedSubviews:", v61);
        v47 = v11 * 21.0;
        objc_msgSend(v46, "setSpacing:", ceilf(v47));
        objc_msgSend(v46, "setBaselineRelativeArrangement:", 1);
        v48 = v11 * 32.0;
        objc_msgSend(v46, "setCustomSpacing:afterView:", v57, ceilf(v48));
        v49 = v11 * 16.0;
        objc_msgSend(v46, "setCustomSpacing:afterView:", v32, ceilf(v49));
        objc_msgSend(v46, "setAxis:", 1);
        objc_msgSend(v46, "setAlignment:", 1);
        v50 = v11 * 23.0;
        v51 = ceilf(v50);
        v52 = objc_alloc(MEMORY[0x1E0CFAA98]);
        v72 = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v52, "initWithArrangedSubviews:", v53);

        objc_msgSend(v54, "setVerticalAlignment:", 1);
        objc_msgSend(v54, "setLayoutMarginsRelativeArrangement:", 1);
        objc_msgSend(v54, "setLayoutMargins:", v51, v51, v51, v51);
        -[SearchUIFallbackPeekViewController view](v59, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addSubview:", v54);

        +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v54);
        v4 = v60;
        goto LABEL_29;
      }
      +[SearchUIImageView imageViewWithImage:](SearchUIImageView, "imageViewWithImage:", v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "size");
      if (v43 == *MEMORY[0x1E0C9D820] && v42 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(MEMORY[0x1E0DBD9B0], "maxThumbnailSize");
        v45 = v11 * v44;
        objc_msgSend(v39, "setMinimumLayoutSize:", v45, v45);
        objc_msgSend(v39, "setMaximumLayoutSize:", v45, v45);
      }
      objc_msgSend(v39, "setMaximumLayoutSize:", 1.79769313e308, v11 * 120.0);
      objc_msgSend(v61, "addObject:", v39);
    }

    goto LABEL_28;
  }
LABEL_29:

  return v5;
}

void __63__SearchUIFallbackPeekViewController_initWithDetailedRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", *(double *)(a1 + 48), *MEMORY[0x1E0DC1448]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFont:", v2);

  objc_msgSend(*(id *)(a1 + 40), "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setMaxLines:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRichText:", v4);

}

@end
