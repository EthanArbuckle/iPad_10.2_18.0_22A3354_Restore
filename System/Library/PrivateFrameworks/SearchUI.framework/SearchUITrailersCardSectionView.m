@implementation SearchUITrailersCardSectionView

- (SearchUITrailersCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  SearchUITrailersCardSectionView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  SearchUITrailerView *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SearchUITrailersCardSectionView;
  v7 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v30, sel_initWithRowModel_feedbackDelegate_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "cardSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    objc_msgSend(v8, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0DBD940], "boldBodyFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    -[SearchUICardSectionView contentView](v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addArrangedSubview:", v9);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setSpacing:", 14.0);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v15);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v13);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9C8]), "initWithDocumentView:", v13);
    objc_msgSend(v16, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v16, "setCanScrollDocumentViewVertically:", 0);
    objc_msgSend(v16, "setHorizontalAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v16);
    -[SearchUICardSectionView contentView](v7, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addArrangedSubview:", v16);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v8;
    objc_msgSend(v8, "mediaItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[SearchUITrailerView initWithMediaItem:cardSectionView:]([SearchUITrailerView alloc], "initWithMediaItem:cardSectionView:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v7);
          objc_msgSend(v13, "addArrangedSubview:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

    -[SearchUITrailersCardSectionView setClipsToBounds:](v7, "setClipsToBounds:", 1);
  }

  return v7;
}

- (id)setupContentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v2, "setSpacing:", 10.0);
  objc_msgSend(v2, "setBaselineRelativeArrangement:", 1);
  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  objc_msgSend(v2, "setLayoutMargins:");
  return v2;
}

@end
