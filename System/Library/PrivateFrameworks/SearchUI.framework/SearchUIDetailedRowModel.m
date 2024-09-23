@implementation SearchUIDetailedRowModel

- (NSArray)details
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DA9CC0]) & 1) == 0)
  {

    return self->_details;
  }
  -[NSArray firstObject](self->_details, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return self->_details;
  v6 = (void *)-[NSArray mutableCopy](self->_details, "mutableCopy");
  -[NSArray firstObject](self->_details, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  +[SearchUICalendarStore colorForDefaultCalendarForNewEvents](SearchUICalendarStore, "colorForDefaultCalendarForNewEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v27 = (void *)MEMORY[0x1E0D8C3D0];
    objc_msgSend(v8, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "textWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFormattedTextPieces:", v22);
    goto LABEL_13;
  }
  objc_msgSend(v8, "formattedTextPieces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v8, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
      goto LABEL_8;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(" %@"), v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setText:", 0);
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFormattedTextPieces:", v16);

  }
LABEL_8:
  objc_msgSend(v8, "formattedTextPieces");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 == 1)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setSymbolName:", CFSTR("circle.fill"));
    +[SearchUIImage imageWithSFImage:](SearchUISymbolImage, "imageWithSFImage:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICalendarStore colorForDefaultCalendarForNewEvents](SearchUICalendarStore, "colorForDefaultCalendarForNewEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCustomForegroundColor:", v21);

    objc_msgSend(v20, "setSymbolScale:", 1);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setGlyph:", v20);
    v29 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedTextPieces");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFormattedTextPieces:", v25);

LABEL_13:
  }
  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, v8);

  return (NSArray *)v6;
}

- (SearchUIDetailedRowModel)initWithResult:(id)a3 suggestion:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v10;
  SearchUIDetailedRowModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SearchUIDetailedRowModel;
  v11 = -[SearchUICardSectionRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](&v21, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a3, v10, 1, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "suggestionText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTitle:](v11, "setTitle:", v12);

    objc_msgSend(v10, "detailText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "detailText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDetailedRowModel setDetails:](v11, "setDetails:", v15);

    }
    else
    {
      -[SearchUIDetailedRowModel setDetails:](v11, "setDetails:", 0);
    }

    -[SearchUIDetailedRowModel populatedMapsCardSectionIfApplicable](v11, "populatedMapsCardSectionIfApplicable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thumbnail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[SearchUIDetailedRowModel setLeadingImage:](v11, "setLeadingImage:", v17);
    }
    else
    {
      objc_msgSend(v10, "thumbnail");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDetailedRowModel setLeadingImage:](v11, "setLeadingImage:", v18);

    }
    -[SearchUIDetailedRowModel setTruncateTitleMiddle:](v11, "setTruncateTitleMiddle:", v10 != 0);
    if (objc_msgSend(v10, "suggestionType") == 4)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "setSymbolName:", CFSTR("arrow.up.forward"));
      objc_msgSend(v19, "setIsTemplate:", 1);
      -[SearchUIDetailedRowModel setTrailingThumbnail:](v11, "setTrailingThumbnail:", v19);

    }
  }

  return v11;
}

- (SearchUIDetailedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v11;
  id v12;
  SearchUIDetailedRowModel *v13;
  SearchUIDetailedRowModel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
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
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  SearchUIAppClipImage *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  SearchUIAppClipImage *v66;
  void *v67;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char isKindOfClass;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  objc_super v80;

  v11 = a3;
  v12 = a4;
  v80.receiver = self;
  v80.super_class = (Class)SearchUIDetailedRowModel;
  v13 = -[SearchUICardSectionRowModel initWithResult:cardSection:isInline:queryId:itemIdentifier:](&v80, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, v11, v12, 1, a6, a7);
  v14 = v13;
  if (!v13)
    goto LABEL_32;
  -[SearchUIRowModel applicationBundleIdentifier](v13, "applicationBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel populatedMapsCardSectionIfApplicable](v14, "populatedMapsCardSectionIfApplicable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRowModel cardSection](v14, "cardSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIRowModel cardSection](v14, "cardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapsData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
      v21 = v12;
    else
      v21 = 0;
  }
  else
  {

    v21 = v12;
  }
  if (v16)
    v21 = v16;
  v22 = v21;

  +[SearchUIImageView thumbnailForRowModel:](SearchUIImageView, "thumbnailForRowModel:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "contactIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "length"))
    {
      v75 = v16;
      objc_msgSend(v24, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v77 = v24;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v24, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "leadingCardSections");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = v15;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v15 = v29;
        v24 = v77;

        v16 = v75;
        if ((isKindOfClass & 1) != 0)
        {
          if (v23)
            goto LABEL_14;
LABEL_42:
          -[SearchUIDetailedRowModel fallbackImage](v14, "fallbackImage");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      else
      {

      }
      if (-[SearchUIDetailedRowModel useCompactVersionOfUI](v14, "useCompactVersionOfUI"))
      {
        +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
        v69 = +[SearchUIAppIconImage bestVariantForSize:](SearchUIAppIconImage, "bestVariantForSize:");
      }
      else
      {
        v69 = 4;
      }
      -[SearchUIRowModel identifyingResult](v14, "identifyingResult");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "applicationBundleIdentifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v15;
      if (v70)
      {
        -[SearchUIRowModel identifyingResult](v14, "identifyingResult");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUIAppIconImage appIconForResult:variant:](SearchUIAppIconImage, "appIconForResult:variant:", v72, v69);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIDetailedRowModel setFallbackImage:](v14, "setFallbackImage:", v73);

      }
      else
      {
        +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v15, v69);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIDetailedRowModel setFallbackImage:](v14, "setFallbackImage:", v72);
      }
      v24 = v77;

      v15 = v71;
      v16 = v75;
    }

    if (v23)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_14:
  v79 = v22;
  if (v22)
  {
    if (v23 && !v16)
      objc_msgSend(v22, "setThumbnail:", v23);
    -[SearchUIDetailedRowModel fillOutPropertiesForCardSection:](v14, "fillOutPropertiesForCardSection:", v22);
  }
  else
  {
    -[SearchUIDetailedRowModel setLeadingImage:](v14, "setLeadingImage:", v23);
    objc_msgSend(v11, "action");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setAction:](v14, "setAction:", v31);

    -[SearchUIDetailedRowModel setPreventThumbnailImageScaling:](v14, "setPreventThumbnailImageScaling:", objc_msgSend(v11, "preventThumbnailImageScaling"));
    objc_msgSend(v11, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel richTextFromText:](v14, "richTextFromText:", v32);
    v33 = v24;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTitle:](v14, "setTitle:", v34);

    objc_msgSend(v11, "title");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "maxLines");
    -[SearchUIDetailedRowModel title](v14, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMaxLines:", v36);

    v38 = (void *)MEMORY[0x1E0D8C3D0];
    objc_msgSend(v11, "secondaryTitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textWithString:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setSecondaryTitle:](v14, "setSecondaryTitle:", v40);

    -[SearchUIDetailedRowModel setSecondaryTitleIsDetached:](v14, "setSecondaryTitleIsDetached:", objc_msgSend(v11, "isSecondaryTitleDetached"));
    objc_msgSend(v11, "secondaryTitleImage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setSecondaryTitleImage:](v14, "setSecondaryTitleImage:", v41);

    objc_msgSend(v11, "descriptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setDetails:](v14, "setDetails:", v42);

    v43 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v11, "footnote");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "textWithString:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setFootnote:](v14, "setFootnote:", v45);

    v46 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v11, "auxiliaryTopText");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "textWithString:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingTopText:](v14, "setTrailingTopText:", v48);

    v49 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v11, "auxiliaryMiddleText");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "textWithString:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingMiddleText:](v14, "setTrailingMiddleText:", v51);

    v52 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v11, "auxiliaryBottomText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "textWithString:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingBottomText:](v14, "setTrailingBottomText:", v54);

    v24 = v33;
  }
  objc_msgSend(v11, "nearbyBusinessesString");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setNearbyBusinessesString:](v14, "setNearbyBusinessesString:", v55);

  -[SearchUIDetailedRowModel setIsLocalApplicationResult:](v14, "setIsLocalApplicationResult:", objc_msgSend(v11, "isLocalApplicationResult"));
  -[SearchUIDetailedRowModel leadingImage](v14, "leadingImage");
  v56 = objc_claimAutoreleasedReturnValue();
  if (!v56)
    goto LABEL_28;
  v57 = (void *)v56;
  v58 = v16;
  -[SearchUIDetailedRowModel nearbyBusinessesString](v14, "nearbyBusinessesString");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (SearchUIAppClipImage *)v59;
    v76 = v23;
    v78 = v24;
    v61 = v15;
    -[SearchUIRowModel identifyingResult](v14, "identifyingResult");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "identifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "hasPrefix:", *MEMORY[0x1E0DC55F8]))
    {
      -[SearchUIDetailedRowModel leadingImage](v14, "leadingImage");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v65 = objc_opt_isKindOfClass();

      v15 = v61;
      v16 = v58;
      v23 = v76;
      v24 = v78;
      if ((v65 & 1) != 0)
        goto LABEL_28;
      v66 = [SearchUIAppClipImage alloc];
      -[SearchUIDetailedRowModel leadingImage](v14, "leadingImage");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[SearchUIAppClipImage initWithSFImage:](v66, "initWithSFImage:", v57);
      -[SearchUIDetailedRowModel setLeadingImage:](v14, "setLeadingImage:", v60);
    }
    else
    {

      v15 = v61;
      v23 = v76;
      v24 = v78;
    }

  }
  v16 = v58;
LABEL_28:
  if (-[SearchUIDetailedRowModel useCompactVersionOfUI](v14, "useCompactVersionOfUI"))
  {
    -[SearchUIDetailedRowModel title](v14, "title");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setMaxLines:", 1);

    -[SearchUIDetailedRowModel setTrailingTopText:](v14, "setTrailingTopText:", 0);
    -[SearchUIDetailedRowModel setSecondaryTitle:](v14, "setSecondaryTitle:", 0);
    -[SearchUIDetailedRowModel setSecondaryTitleImage:](v14, "setSecondaryTitleImage:", 0);
    -[SearchUIDetailedRowModel setFootnoteButtonText:](v14, "setFootnoteButtonText:", 0);
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    {
      -[SearchUIDetailedRowModel setTrailingMiddleText:](v14, "setTrailingMiddleText:", 0);
      -[SearchUIDetailedRowModel setTrailingBottomText:](v14, "setTrailingBottomText:", 0);
      -[SearchUIDetailedRowModel setFootnote:](v14, "setFootnote:", 0);
    }
  }

  v12 = v79;
LABEL_32:

  return v14;
}

- (BOOL)useCompactVersionOfUI
{
  void *v3;
  int v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldUseCompactDisplay");
  else
    v4 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "usesCompactDisplay"))
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "compactCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") == 0;

  }
  else
  {
    v10 = 0;
  }

  if (v4 | isKindOfClass & 1)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

- (id)populatedMapsCardSectionIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRowModel cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mapsData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pinText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setPinText:](self, "setPinText:", v9);

    if (v8)
    {
LABEL_3:
      v10 = objc_alloc(MEMORY[0x1E0CC1948]);
      if (-[SearchUIDetailedRowModel useCompactVersionOfUI](self, "useCompactVersionOfUI"))
        v11 = 3;
      else
        v11 = 4;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v10, "initWithMapsData:iconSize:bundleID:", v8, v11, v13);
      -[SearchUIDetailedRowModel setMapsResult:](self, "setMapsResult:", v14);

      -[SearchUIDetailedRowModel mapsResult](self, "mapsResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inlineCard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cardSections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(v3, "mapsData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = 0;
      v20 = 0;
LABEL_13:

      goto LABEL_17;
    }

    if (v4)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v3, "mapsData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_3;
    }
  }
  v20 = 0;
LABEL_17:
  -[SearchUIRowModel cardSection](self, "cardSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInternalDetailedRowCardSection:", v20);

  }
  objc_msgSend(v4, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "backgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v25);

  v26 = v20;
  return v26;
}

- (id)richTextFromText:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v3, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textWithString:", v6);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setMaxLines:", objc_msgSend(v3, "maxLines"));
  }

  return v4;
}

- (id)backgroundColor
{
  objc_super v4;

  if (-[SearchUIDetailedRowModel useCompactVersionOfUI](self, "useCompactVersionOfUI"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SearchUIDetailedRowModel;
  -[SearchUICardSectionRowModel backgroundColor](&v4, sel_backgroundColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)fillOutPropertiesForCardSection:(id)a3
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
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
  SearchUISymbolImage *v62;
  uint64_t v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[2];

  v82[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setLeadingImage:](self, "setLeadingImage:", v5);

  objc_msgSend(v4, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setLeadingButton:](self, "setLeadingButton:", v6);

  -[SearchUIDetailedRowModel setPreventThumbnailImageScaling:](self, "setPreventThumbnailImageScaling:", objc_msgSend(v4, "preventThumbnailImageScaling"));
  objc_msgSend(v4, "topText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setTopText:](self, "setTopText:", v7);

  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setTitle:](self, "setTitle:", v8);

  objc_msgSend(v4, "secondaryTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setSecondaryTitle:](self, "setSecondaryTitle:", v9);

  -[SearchUIDetailedRowModel setSecondaryTitleIsDetached:](self, "setSecondaryTitleIsDetached:", objc_msgSend(v4, "isSecondaryTitleDetached"));
  objc_msgSend(v4, "secondaryTitleImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setSecondaryTitleImage:](self, "setSecondaryTitleImage:", v10);

  objc_msgSend(v4, "descriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setDetails:](self, "setDetails:", v11);

  objc_msgSend(v4, "footnote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setFootnote:](self, "setFootnote:", v12);

  objc_msgSend(v4, "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setAction:](self, "setAction:", v13);
  objc_msgSend(v4, "richTrailingTopText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SearchUIDetailedRowModel setTrailingTopText:](self, "setTrailingTopText:", v14);
  }
  else
  {
    v15 = (void *)objc_opt_class();
    objc_msgSend(v4, "trailingTopText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "richTextWithFormattedText:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingTopText:](self, "setTrailingTopText:", v17);

  }
  objc_msgSend(v4, "richTrailingMiddleText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SearchUIDetailedRowModel setTrailingMiddleText:](self, "setTrailingMiddleText:", v18);
  }
  else
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend(v4, "trailingMiddleText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "richTextWithFormattedText:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingMiddleText:](self, "setTrailingMiddleText:", v21);

  }
  objc_msgSend(v4, "richTrailingBottomText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[SearchUIDetailedRowModel setTrailingBottomText:](self, "setTrailingBottomText:", v22);
  }
  else
  {
    v23 = (void *)objc_opt_class();
    objc_msgSend(v4, "trailingBottomText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "richTextWithFormattedText:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedRowModel setTrailingBottomText:](self, "setTrailingBottomText:", v25);

  }
  -[SearchUIDetailedRowModel setButtonItemsAreTrailing:](self, "setButtonItemsAreTrailing:", objc_msgSend(v4, "buttonItemsAreTrailing"));
  objc_msgSend(v4, "trailingThumbnail");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedRowModel setTrailingThumbnail:](self, "setTrailingThumbnail:", v26);

  objc_msgSend(v4, "buttonItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    v27 = (void *)MEMORY[0x1E0C9AA60];
  v29 = (void *)objc_msgSend(v27, "mutableCopy");

  if (!objc_msgSend(v29, "count"))
  {
    objc_msgSend(v13, "contactIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 || (objc_msgSend(v13, "phoneNumber"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v13, "email");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
        goto LABEL_27;
    }
    v31 = (void *)objc_opt_new();
    objc_msgSend(v13, "contactIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setContactIdentifier:", v32);

    objc_msgSend(v13, "phoneNumber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v13, "phoneNumber");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setPhoneNumbers:", v35);

    }
    else
    {
      objc_msgSend(v31, "setPhoneNumbers:", 0);
    }

    objc_msgSend(v13, "email");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      objc_msgSend(v13, "email");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setEmailAddresses:", v38);

    }
    else
    {
      objc_msgSend(v31, "setEmailAddresses:", 0);
    }

    v39 = (void *)objc_opt_new();
    objc_msgSend(v13, "phoneNumber");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");

    if (v41)
      objc_msgSend(v39, "addObject:", &unk_1EA228D80);
    objc_msgSend(v13, "email");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "length");

    if (v43)
      objc_msgSend(v39, "addObject:", &unk_1EA228D98);
    v44 = (void *)objc_opt_new();
    objc_msgSend(v44, "setPerson:", v31);
    objc_msgSend(v44, "setActionTypesToShow:", v39);
    objc_msgSend(v29, "addObject:", v44);

LABEL_27:
    objc_msgSend(v13, "mapsData");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 || (objc_msgSend(v13, "location"), (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v13, "customDirectionsPunchout");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
LABEL_41:
        objc_msgSend(v13, "messageURL");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          v57 = (void *)objc_opt_new();
          v58 = (void *)MEMORY[0x1E0D8C5E0];
          objc_msgSend(v13, "messageURL");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "punchoutWithURL:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setPunchout:", v60);

          v61 = (void *)objc_opt_new();
          objc_msgSend(v61, "setCommand:", v57);
          v62 = -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", CFSTR("message"));
          objc_msgSend(v61, "setImage:", v62);

          objc_msgSend(v29, "addObject:", v61);
        }
        if (!-[SearchUIDetailedRowModel useCompactVersionOfUI](self, "useCompactVersionOfUI"))
        {
          objc_msgSend(v13, "applicationBundleIdentifier");
          v63 = objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            v64 = (void *)v63;
            v65 = objc_msgSend(v13, "isOverlay");

            if ((v65 & 1) == 0)
            {
              objc_msgSend(v13, "storeIdentifiers");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "firstObject");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v67;
              if (v67)
              {
                v69 = v67;
              }
              else
              {
                -[SearchUIRowModel identifyingResult](self, "identifyingResult");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "storeIdentifier");
                v69 = (id)objc_claimAutoreleasedReturnValue();

              }
              v71 = (void *)objc_opt_new();
              objc_msgSend(v71, "setIdentifier:", v69);
              objc_msgSend(v29, "addObject:", v71);

            }
          }
        }
        if (!objc_msgSend(v29, "count"))
        {
          objc_msgSend(v13, "label");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "length");

          if (v73)
          {
            v74 = (void *)objc_opt_new();
            objc_msgSend(v13, "label");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setTitle:", v75);

            objc_msgSend(v29, "addObject:", v74);
          }
        }
        objc_msgSend(v13, "localMediaIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          v77 = (void *)objc_opt_new();
          objc_msgSend(v13, "localMediaIdentifier");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setMediaIdentifier:", v78);

          v79 = (void *)objc_opt_new();
          objc_msgSend(v79, "setMediaMetadata:", v77);
          objc_msgSend(v29, "addObject:", v79);

        }
        -[SearchUIDetailedRowModel setButtonItemsAreTrailing:](self, "setButtonItemsAreTrailing:", 1);
        goto LABEL_56;
      }
    }
    objc_msgSend(v13, "customDirectionsPunchout");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = (void *)objc_opt_new();
      objc_msgSend(v13, "customDirectionsPunchout");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setPunchout:", v48);
    }
    else
    {
      v47 = (void *)objc_opt_new();
      objc_msgSend(v13, "mapsData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setMapsData:", v49);

      objc_msgSend(v13, "label");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        objc_msgSend(v47, "setName:", v50);
      }
      else
      {
        -[SearchUIDetailedRowModel title](self, "title");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "text");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setName:", v54);

      }
      objc_msgSend(v47, "setDirectionsMode:", objc_msgSend(v13, "directionsMode"));
      objc_msgSend(v47, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v13, "shouldSearchDirectionsAlongCurrentRoute"));
      objc_msgSend(v13, "location");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setLocation:", v48);
    }

    v55 = (void *)objc_opt_new();
    objc_msgSend(v55, "setCommand:", v47);
    objc_msgSend(v29, "addObject:", v55);

    goto LABEL_41;
  }
LABEL_56:
  v80 = (void *)objc_msgSend(v29, "copy");
  -[SearchUIDetailedRowModel setButtonItems:](self, "setButtonItems:", v80);

}

+ (id)richTextWithFormattedText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFormattedTextPieces:", v5);
  return v4;
}

- (id)contactIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t isKindOfClass;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUIDetailedRowModel leadingImage](self, "leadingImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return 0;
    -[SearchUIDetailedRowModel leadingImage](self, "leadingImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactIdentifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v10;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v10)
      v11 = (void *)v10;
    v7 = v11;
  }
  v12 = v7;

  return v12;
}

- (BOOL)isContact
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)dragAppBundleID
{
  void *v3;

  if (-[SearchUIDetailedRowModel isLocalApplicationResult](self, "isLocalApplicationResult"))
  {
    -[SearchUIRowModel applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)dragTitle
{
  void *v2;
  void *v3;

  -[SearchUIDetailedRowModel title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities stringForSFRichText:](SearchUIUtilities, "stringForSFRichText:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dragSubtitle
{
  void *v3;
  void *v5;

  if (-[SearchUIDetailedRowModel isContact](self, "isContact")
    || -[SearchUICardSectionRowModel isQuerySuggestion](self, "isQuerySuggestion"))
  {
    v3 = 0;
  }
  else
  {
    -[SearchUIDetailedRowModel dragURL](self, "dragURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[SearchUIDetailedRowModel descriptionText](self, "descriptionText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)descriptionText
{
  void *v2;
  void *v3;

  -[SearchUIDetailedRowModel details](self, "details");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities stringForSFRichTextArray:](SearchUIUtilities, "stringForSFRichTextArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dragText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[SearchUIDetailedRowModel dragTitle](self, "dragTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "appendString:", v4);
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[SearchUIDetailedRowModel descriptionText](self, "descriptionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[SearchUIDetailedRowModel descriptionText](self, "descriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

  }
  return v3;
}

+ (BOOL)urlIsDraggable:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("https")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "scheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("file"));

    }
  }

  return v5;
}

- (id)dragURL
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SearchUIDetailedRowModel dragAppBundleID](self, "dragAppBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SearchUIDetailedRowModel punchouts](self, "punchouts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        if (+[SearchUIDetailedRowModel urlIsDraggable:](SearchUIDetailedRowModel, "urlIsDraggable:", v12))
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v4 = v12;

      if (v4)
        goto LABEL_17;
    }
    else
    {
LABEL_11:

    }
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SearchUIDetailedRowModel urlIsDraggable:](SearchUIDetailedRowModel, "urlIsDraggable:", v14))
    {
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "url");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
LABEL_17:
  -[SearchUIDetailedRowModel dragTitle](self, "dragTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[SearchUIDetailedRowModel dragTitle](self, "dragTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setTitle:", v18);

  }
  return v4;
}

- (BOOL)isTappable
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUIDetailedRowModel;
    v4 = -[SearchUICardSectionRowModel isTappable](&v6, sel_isTappable);
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)isDraggable
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  -[SearchUIRowModel cardSection](self, "cardSection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v10.receiver = self,
        v10.super_class = (Class)SearchUIDetailedRowModel,
        v5 = -[SearchUICardSectionRowModel isDraggable](&v10, sel_isDraggable),
        v4,
        !v5))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SearchUIUtilities resultIsSiriAction:](SearchUIUtilities, "resultIsSiriAction:", v6))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isLocalApplicationResult") ^ 1;

    }
  }
  return v7;
}

- (id)punchouts
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
    return 0;
  -[SearchUIRowModel cardSection](self, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)SearchUIDetailedRowModel;
    -[SearchUICardSectionRowModel punchouts](&v14, sel_punchouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "punchout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SearchUIRowModel identifyingResult](self, "identifyingResult");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "punchout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

    return v13;
  }
}

- (int)separatorStyle
{
  unsigned int v3;
  int v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedRowModel;
  v3 = -[SearchUICardSectionRowModel separatorStyle](&v7, sel_separatorStyle);
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS")
    && -[SearchUIDetailedRowModel useCompactVersionOfUI](self, "useCompactVersionOfUI"))
  {
    return 1;
  }
  if (-[SearchUIDetailedRowModel useCompactVersionOfUI](self, "useCompactVersionOfUI")
    && !v3
    && !objc_msgSend(MEMORY[0x1E0DBD9B0], "isSuperLargeAccessibilitySize"))
  {
    return 3;
  }
  -[SearchUIRowModel cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4 = v3;
  else
    v4 = 3;

  return v4;
}

- (BOOL)hasLeadingImage
{
  return +[SearchUILeadingViewController leadingViewClassForRowModel:](SearchUILeadingViewController, "leadingViewClassForRowModel:", self) != 0;
}

- (Class)cardSectionViewClass
{
  objc_class *v3;
  void *v5;
  objc_class *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedRowModel;
  v3 = -[SearchUICardSectionRowModel cardSectionViewClass](&v7, sel_cardSectionViewClass);
  if (v3)
    return v3;
  v5 = (void *)objc_opt_new();
  v6 = +[SearchUICardSectionCreator viewClassForCardSection:horizontal:](SearchUICardSectionCreator, "viewClassForCardSection:horizontal:", v5, -[SearchUICardSectionRowModel isHorizontalInLayout](self, "isHorizontalInLayout"));

  return v6;
}

- (id)requestAppClipObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SearchUIDetailedRowModel buttonItems](self, "buttonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = (void *)objc_opt_new();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[SearchUIDetailedRowModel buttonItems](self, "buttonItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_searchUI_requestAppClipCommand");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SearchUIDetailedRowModel;
  v4 = -[SearchUICardSectionRowModel copyWithZone:](&v24, sel_copyWithZone_, a3);
  -[SearchUIDetailedRowModel leadingImage](self, "leadingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingImage:", v5);

  -[SearchUIDetailedRowModel fallbackImage](self, "fallbackImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackImage:", v6);

  -[SearchUIDetailedRowModel leadingButton](self, "leadingButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingButton:", v7);

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SearchUIDetailedRowModel preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
  -[SearchUIDetailedRowModel buttonItems](self, "buttonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonItems:", v8);

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SearchUIDetailedRowModel buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  objc_msgSend(v4, "setIsLocalApplicationResult:", -[SearchUIDetailedRowModel isLocalApplicationResult](self, "isLocalApplicationResult"));
  -[SearchUIDetailedRowModel nearbyBusinessesString](self, "nearbyBusinessesString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNearbyBusinessesString:", v9);

  -[SearchUIDetailedRowModel topText](self, "topText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopText:", v10);

  -[SearchUIDetailedRowModel title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);

  objc_msgSend(v4, "setTruncateTitleMiddle:", -[SearchUIDetailedRowModel truncateTitleMiddle](self, "truncateTitleMiddle"));
  -[SearchUIDetailedRowModel secondaryTitle](self, "secondaryTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTitle:", v12);

  objc_msgSend(v4, "setSecondaryTitleIsDetached:", -[SearchUIDetailedRowModel secondaryTitleIsDetached](self, "secondaryTitleIsDetached"));
  -[SearchUIDetailedRowModel secondaryTitleImage](self, "secondaryTitleImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTitleImage:", v13);

  -[SearchUIDetailedRowModel details](self, "details");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetails:", v14);

  -[SearchUIDetailedRowModel footnote](self, "footnote");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFootnote:", v15);

  -[SearchUIDetailedRowModel footnoteButtonText](self, "footnoteButtonText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFootnoteButtonText:", v16);

  -[SearchUIDetailedRowModel action](self, "action");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAction:", v17);

  -[SearchUIDetailedRowModel trailingTopText](self, "trailingTopText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingTopText:", v18);

  -[SearchUIDetailedRowModel trailingMiddleText](self, "trailingMiddleText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingMiddleText:", v19);

  -[SearchUIDetailedRowModel trailingBottomText](self, "trailingBottomText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingBottomText:", v20);

  -[SearchUIDetailedRowModel trailingThumbnail](self, "trailingThumbnail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingThumbnail:", v21);

  -[SearchUIDetailedRowModel mapsResult](self, "mapsResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapsResult:", v22);

  return v4;
}

- (SFImage)leadingImage
{
  return self->_leadingImage;
}

- (void)setLeadingImage:(id)a3
{
  objc_storeStrong((id *)&self->_leadingImage, a3);
}

- (SFImage)fallbackImage
{
  return (SFImage *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFallbackImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (SFButton)leadingButton
{
  return (SFButton *)objc_getProperty(self, a2, 264, 1);
}

- (void)setLeadingButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  self->_preventThumbnailImageScaling = a3;
}

- (BOOL)isLocalApplicationResult
{
  return self->_isLocalApplicationResult;
}

- (void)setIsLocalApplicationResult:(BOOL)a3
{
  self->_isLocalApplicationResult = a3;
}

- (NSString)nearbyBusinessesString
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setNearbyBusinessesString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (SFRichText)topText
{
  return (SFRichText *)objc_getProperty(self, a2, 280, 1);
}

- (void)setTopText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (SFRichText)title
{
  return (SFRichText *)objc_getProperty(self, a2, 288, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (BOOL)truncateTitleMiddle
{
  return self->_truncateTitleMiddle;
}

- (void)setTruncateTitleMiddle:(BOOL)a3
{
  self->_truncateTitleMiddle = a3;
}

- (SFFormattedText)secondaryTitle
{
  return (SFFormattedText *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (BOOL)secondaryTitleIsDetached
{
  return self->_secondaryTitleIsDetached;
}

- (void)setSecondaryTitleIsDetached:(BOOL)a3
{
  self->_secondaryTitleIsDetached = a3;
}

- (SFImage)secondaryTitleImage
{
  return (SFImage *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSecondaryTitleImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (SFRichText)footnote
{
  return (SFRichText *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)footnoteButtonText
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setFootnoteButtonText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (SFActionItem)action
{
  return (SFActionItem *)objc_getProperty(self, a2, 336, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (SFRichText)trailingTopText
{
  return (SFRichText *)objc_getProperty(self, a2, 344, 1);
}

- (void)setTrailingTopText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (SFRichText)trailingMiddleText
{
  return (SFRichText *)objc_getProperty(self, a2, 352, 1);
}

- (void)setTrailingMiddleText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (SFRichText)trailingBottomText
{
  return (SFRichText *)objc_getProperty(self, a2, 360, 1);
}

- (void)setTrailingBottomText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSArray)buttonItems
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  self->_buttonItemsAreTrailing = a3;
}

- (SFImage)trailingThumbnail
{
  return (SFImage *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTrailingThumbnail:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSString)pinText
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setPinText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (MKSearchFoundationResult)mapsResult
{
  return (MKSearchFoundationResult *)objc_getProperty(self, a2, 392, 1);
}

- (void)setMapsResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsResult, 0);
  objc_storeStrong((id *)&self->_pinText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_footnoteButtonText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_nearbyBusinessesString, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_leadingImage, 0);
}

@end
