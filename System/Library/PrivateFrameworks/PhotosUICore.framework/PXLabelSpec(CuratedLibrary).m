@implementation PXLabelSpec(CuratedLibrary)

+ (id)px_headerSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init((Class)off_1E50B31F8);
  PXCuratedLibraryHeaderSubtitleFontForZoomLevel(a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);
  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v5, "localizedLeadingTextAlignment"));
  objc_msgSend(v6, "setVerticalAlignment:", 2);
  objc_msgSend(v6, "setCapitalization:", 0);
  objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 0);
  v9 = objc_msgSend(v5, "userInterfaceIdiom");

  objc_msgSend(v6, "setNumberOfLines:", _PXHeaderSubtitleNumberOfLinesForZoomLevel(a3, v9));
  objc_msgSend(v6, "setAllowTruncation:", 1);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setAlignment:", objc_msgSend(v6, "textAlignment"));
  v12 = *MEMORY[0x1E0DC1140];
  v15[0] = *MEMORY[0x1E0DC1138];
  v15[1] = v12;
  v16[0] = v7;
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E0DC1178];
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAttributes:", v13);

  return v6;
}

+ (id)px_headerTitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init((Class)off_1E50B31F8);
  PXCuratedLibraryHeaderTitleFontForZoomLevel(a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);
  objc_msgSend(v6, "setTextAlignment:", objc_msgSend(v5, "localizedLeadingTextAlignment"));
  objc_msgSend(v6, "setVerticalAlignment:", 2);
  objc_msgSend(v6, "setCapitalization:", 0);
  objc_msgSend(v6, "setFallbackCapitalization:", 0);
  v9 = objc_msgSend(v5, "userInterfaceIdiom");
  objc_msgSend(v5, "extendedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNumberOfLines:", _PXHeaderTitleNumberOfLinesForZoomLevel(a3, v9, v10));
  objc_msgSend(v6, "setAllowTruncation:", 1);
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setAlignment:", objc_msgSend(v6, "textAlignment"));
  v13 = *MEMORY[0x1E0DC1140];
  v16[0] = *MEMORY[0x1E0DC1138];
  v16[1] = v13;
  v17[0] = v7;
  v17[1] = v8;
  v16[2] = *MEMORY[0x1E0DC1178];
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAttributes:", v14);

  return v6;
}

@end
