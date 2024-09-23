@implementation PXYearAssetsSkimmingSectionHeaderLayoutSpec

- (PXYearAssetsSkimmingSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  PXYearAssetsSkimmingSectionHeaderLayoutSpec *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PXYearAssetsSkimmingSectionHeaderLayoutSpec;
  v6 = -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](&v32, sel_initWithExtendedTraitCollection_options_padding_variant_, a3, a4, 0, a5.top, a5.left, a5.bottom, a5.right);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init((Class)off_1E50B31F8);
    PXCuratedLibraryHeaderTitleFontForZoomLevel(1, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:");
    objc_msgSend(v8, "setTextColor:", v7);
    objc_msgSend(v8, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](v6, "localizedLeadingTextAlignment"));
    objc_msgSend(v8, "setVerticalAlignment:", 2);
    objc_msgSend(v8, "setCapitalization:", 0);
    objc_msgSend(v8, "setFallbackCapitalization:", 0);
    objc_msgSend(v8, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setAlignment:", objc_msgSend(v8, "textAlignment"));
    v12 = *MEMORY[0x1E0DC1140];
    v35[0] = *MEMORY[0x1E0DC1138];
    v11 = v35[0];
    v35[1] = v12;
    v37[0] = v31;
    v37[1] = v7;
    v36 = *MEMORY[0x1E0DC1178];
    v13 = v36;
    v37[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v35, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAttributes:", v30);
    v14 = objc_alloc_init((Class)off_1E50B31F8);
    PXCuratedLibraryHeaderSubtitleFontForZoomLevel(1, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.800000012);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    objc_msgSend(v14, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](v6, "localizedLeadingTextAlignment"));
    objc_msgSend(v14, "setVerticalAlignment:", 2);
    objc_msgSend(v14, "setCapitalization:", 2);
    objc_msgSend(v14, "setNumberOfLines:", 2);
    v33[0] = v11;
    v33[1] = v12;
    v34[0] = v15;
    v34[1] = v7;
    v33[2] = v13;
    v34[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextAttributes:", v17);
    v18 = objc_alloc_init((Class)off_1E50B5C68);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v6, "setTitleSubtitleLabelSpec:", v18);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v6, "titleSubtitleLabelSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitleLabelSpec:", v8);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v6, "titleSubtitleLabelSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSubtitleLabelSpec:", v14);

    if (-[PXFeatureSpec sizeClass](v6, "sizeClass") == 1)
      v21 = 23.0;
    else
      v21 = 26.0;
    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v6, "titleSubtitleLabelSpec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:", v21);

    v23 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("yyyy"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDateFormat:", v25);

    v26 = (void *)objc_msgSend(v23, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleDateFormatter:](v6, "setTitleDateFormatter:", v26);

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMM"), 0, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDateFormat:", v27);

    v28 = (void *)objc_msgSend(v23, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setSubtitleDateFormatter:](v6, "setSubtitleDateFormatter:", v28);

  }
  return v6;
}

@end
