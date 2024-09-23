@implementation PRSPosterGalleryItem

- (PRSPosterGalleryItem)initWithIdentifier:(id)a3 descriptorIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 displayNameLocalizationKey:(id)a6 spokenNameLocalizationKey:(id)a7 descriptiveTextLocalizationKey:(id)a8 localizedDisplayName:(id)a9 localizedSubtitle:(id)a10 titleFontName:(id)a11 titleColor:(id)a12 subtitleComplication:(id)a13 layoutType:(int64_t)a14 modeSemanticType:(id)a15 modeUUID:(id)a16 complications:(id)a17 landscapeComplications:(id)a18 blankTemplate:(BOOL)a19 shouldShowAsShuffleStack:(BOOL)a20 source:(int64_t)a21
{
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  PRSPosterGalleryItem *v36;
  uint64_t v37;
  NSString *identifier;
  uint64_t v39;
  NSString *descriptorIdentifier;
  uint64_t v41;
  NSString *extensionBundleIdentifier;
  uint64_t v43;
  NSString *displayNameLocalizationKey;
  uint64_t v45;
  NSString *spokenNameLocalizationKey;
  uint64_t v47;
  NSString *descriptiveTextLocalizationKey;
  uint64_t v49;
  NSString *localizedDisplayName;
  uint64_t v51;
  NSString *localizedSubtitle;
  uint64_t v53;
  NSString *titleFontName;
  uint64_t v55;
  BSColor *titleColor;
  uint64_t v57;
  PRSPosterGallerySuggestedComplication *subtitleComplication;
  uint64_t v59;
  NSString *modeUUID;
  uint64_t v61;
  NSArray *complications;
  uint64_t v63;
  NSArray *landscapeComplications;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;

  v26 = a3;
  v27 = a4;
  v68 = a5;
  v28 = a6;
  v73 = a7;
  v72 = a8;
  v71 = a9;
  v29 = v27;
  v70 = a10;
  v30 = v28;
  v69 = a11;
  v31 = a12;
  v32 = a13;
  v67 = a15;
  v33 = a16;
  v34 = a17;
  v35 = a18;
  v74.receiver = self;
  v74.super_class = (Class)PRSPosterGalleryItem;
  v36 = -[PRSPosterGalleryItem init](&v74, sel_init);
  if (v36)
  {
    v37 = objc_msgSend(v26, "copy");
    identifier = v36->_identifier;
    v36->_identifier = (NSString *)v37;

    v39 = objc_msgSend(v29, "copy");
    descriptorIdentifier = v36->_descriptorIdentifier;
    v36->_descriptorIdentifier = (NSString *)v39;

    v41 = objc_msgSend(v68, "copy");
    extensionBundleIdentifier = v36->_extensionBundleIdentifier;
    v36->_extensionBundleIdentifier = (NSString *)v41;

    v43 = objc_msgSend(v30, "copy");
    displayNameLocalizationKey = v36->_displayNameLocalizationKey;
    v36->_displayNameLocalizationKey = (NSString *)v43;

    v45 = objc_msgSend(v73, "copy");
    spokenNameLocalizationKey = v36->_spokenNameLocalizationKey;
    v36->_spokenNameLocalizationKey = (NSString *)v45;

    v47 = objc_msgSend(v72, "copy");
    descriptiveTextLocalizationKey = v36->_descriptiveTextLocalizationKey;
    v36->_descriptiveTextLocalizationKey = (NSString *)v47;

    v49 = objc_msgSend(v71, "copy");
    localizedDisplayName = v36->_localizedDisplayName;
    v36->_localizedDisplayName = (NSString *)v49;

    v51 = objc_msgSend(v70, "copy");
    localizedSubtitle = v36->_localizedSubtitle;
    v36->_localizedSubtitle = (NSString *)v51;

    v53 = objc_msgSend(v69, "copy");
    titleFontName = v36->_titleFontName;
    v36->_titleFontName = (NSString *)v53;

    v55 = objc_msgSend(v31, "copy");
    titleColor = v36->_titleColor;
    v36->_titleColor = (BSColor *)v55;

    v57 = objc_msgSend(v32, "copy");
    subtitleComplication = v36->_subtitleComplication;
    v36->_subtitleComplication = (PRSPosterGallerySuggestedComplication *)v57;

    v36->_layoutType = a14;
    objc_storeStrong((id *)&v36->_modeSemanticType, a15);
    v59 = objc_msgSend(v33, "copy");
    modeUUID = v36->_modeUUID;
    v36->_modeUUID = (NSString *)v59;

    v61 = objc_msgSend(v34, "copy");
    complications = v36->_complications;
    v36->_complications = (NSArray *)v61;

    v63 = objc_msgSend(v35, "copy");
    landscapeComplications = v36->_landscapeComplications;
    v36->_landscapeComplications = (NSArray *)v63;

    v36->_blankTemplate = a19;
    v36->_shouldShowAsShuffleStack = a20;
    v36->_source = a21;
  }

  return v36;
}

- (PRSPosterGalleryItem)initWithProactiveRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  void *v21;
  PRSPosterGalleryItem *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  objc_msgSend(v3, "complications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "landscapeComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_4_1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameLocalizationKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spokenNameLocalizationKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptiveTextLocalizationKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDisplayName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleFontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtitleComplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "posterBoardRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "layoutType");
  if ((unint64_t)(v10 - 1) >= 4)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(v3, "modeSemanticType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "isBlankTemplate");
  v15 = objc_msgSend(v3, "shouldShowAsShuffleStack");
  v16 = objc_msgSend(v3, "source");
  if ((unint64_t)(v16 - 1) >= 6)
    v17 = 0;
  else
    v17 = v16;
  BYTE1(v19) = v15;
  LOBYTE(v19) = v14;
  v23 = -[PRSPosterGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v29, v27, v26, v25, v24, v21, v28, v6, v7, v8, v9, v11, v12, v13,
          v31,
          v30,
          v19,
          v17);

  return v23;
}

uint64_t __56__PRSPosterGalleryItem_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

uint64_t __56__PRSPosterGalleryItem_initWithProactiveRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E10]), "initWithPosterBoardRepresentation:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOWORD(v6) = *(_WORD *)&self->_blankTemplate;
  return (id)objc_msgSend(v4, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", self->_identifier, self->_descriptorIdentifier, self->_extensionBundleIdentifier, self->_displayNameLocalizationKey, self->_spokenNameLocalizationKey, self->_descriptiveTextLocalizationKey, self->_localizedDisplayName, self->_localizedSubtitle, self->_titleFontName, self->_titleColor, self->_subtitleComplication, self->_layoutType, self->_modeSemanticType, self->_modeUUID,
               self->_complications,
               self->_landscapeComplications,
               v6,
               self->_source);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGalleryItem *v4;
  uint64_t v5;
  PRSPosterGalleryItem *v6;
  PRSPosterGalleryItem *v7;
  char v8;
  PRSPosterGalleryItem *v9;
  void *v10;
  NSString *identifier;
  uint64_t v12;
  PRSPosterGalleryItem *v13;
  id v14;
  NSString *descriptorIdentifier;
  PRSPosterGalleryItem *v16;
  id v17;
  NSString *extensionBundleIdentifier;
  PRSPosterGalleryItem *v19;
  id v20;
  NSString *displayNameLocalizationKey;
  PRSPosterGalleryItem *v22;
  id v23;
  NSString *spokenNameLocalizationKey;
  PRSPosterGalleryItem *v25;
  id v26;
  NSString *descriptiveTextLocalizationKey;
  PRSPosterGalleryItem *v28;
  id v29;
  NSString *localizedDisplayName;
  id v31;
  id v32;
  NSString *localizedSubtitle;
  id v34;
  id v35;
  NSString *titleFontName;
  id v37;
  id v38;
  BSColor *titleColor;
  id v40;
  id v41;
  PRSPosterGallerySuggestedComplication *subtitleComplication;
  id v43;
  id v44;
  int64_t layoutType;
  id v46;
  id v47;
  NSNumber *modeSemanticType;
  id v49;
  id v50;
  NSString *modeUUID;
  id v52;
  id v53;
  NSArray *complications;
  id v55;
  id v56;
  NSArray *landscapeComplications;
  id v58;
  id v59;
  _BOOL8 blankTemplate;
  id v61;
  id v62;
  _BOOL8 shouldShowAsShuffleStack;
  id v64;
  id v65;
  int64_t source;
  id v67;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  PRSPosterGalleryItem *v98;
  _QWORD v99[4];
  PRSPosterGalleryItem *v100;
  _QWORD v101[4];
  PRSPosterGalleryItem *v102;
  _QWORD v103[4];
  PRSPosterGalleryItem *v104;
  _QWORD v105[4];
  PRSPosterGalleryItem *v106;

  v4 = (PRSPosterGalleryItem *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v12 = MEMORY[0x1E0C809B0];
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke;
      v105[3] = &unk_1E4D426A0;
      v13 = v9;
      v106 = v13;
      v14 = (id)objc_msgSend(v10, "appendObject:counterpart:", identifier, v105);
      descriptorIdentifier = self->_descriptorIdentifier;
      v103[0] = v12;
      v103[1] = 3221225472;
      v103[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_2;
      v103[3] = &unk_1E4D426A0;
      v16 = v13;
      v104 = v16;
      v17 = (id)objc_msgSend(v10, "appendObject:counterpart:", descriptorIdentifier, v103);
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v101[0] = v12;
      v101[1] = 3221225472;
      v101[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_3;
      v101[3] = &unk_1E4D426A0;
      v19 = v16;
      v102 = v19;
      v20 = (id)objc_msgSend(v10, "appendObject:counterpart:", extensionBundleIdentifier, v101);
      displayNameLocalizationKey = self->_displayNameLocalizationKey;
      v99[0] = v12;
      v99[1] = 3221225472;
      v99[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_4;
      v99[3] = &unk_1E4D426A0;
      v22 = v19;
      v100 = v22;
      v23 = (id)objc_msgSend(v10, "appendObject:counterpart:", displayNameLocalizationKey, v99);
      spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
      v97[0] = v12;
      v97[1] = 3221225472;
      v97[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_5;
      v97[3] = &unk_1E4D426A0;
      v25 = v22;
      v98 = v25;
      v26 = (id)objc_msgSend(v10, "appendObject:counterpart:", spokenNameLocalizationKey, v97);
      descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
      v95[0] = v12;
      v95[1] = 3221225472;
      v95[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_6;
      v95[3] = &unk_1E4D426A0;
      v28 = v25;
      v96 = v28;
      v29 = (id)objc_msgSend(v10, "appendObject:counterpart:", descriptiveTextLocalizationKey, v95);
      localizedDisplayName = self->_localizedDisplayName;
      v93[0] = v12;
      v93[1] = 3221225472;
      v93[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_7;
      v93[3] = &unk_1E4D426A0;
      v31 = v28;
      v94 = v31;
      v32 = (id)objc_msgSend(v10, "appendObject:counterpart:", localizedDisplayName, v93);
      localizedSubtitle = self->_localizedSubtitle;
      v91[0] = v12;
      v91[1] = 3221225472;
      v91[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_8;
      v91[3] = &unk_1E4D426A0;
      v34 = v31;
      v92 = v34;
      v35 = (id)objc_msgSend(v10, "appendObject:counterpart:", localizedSubtitle, v91);
      titleFontName = self->_titleFontName;
      v89[0] = v12;
      v89[1] = 3221225472;
      v89[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_9;
      v89[3] = &unk_1E4D426A0;
      v37 = v34;
      v90 = v37;
      v38 = (id)objc_msgSend(v10, "appendObject:counterpart:", titleFontName, v89);
      titleColor = self->_titleColor;
      v87[0] = v12;
      v87[1] = 3221225472;
      v87[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_10;
      v87[3] = &unk_1E4D426A0;
      v40 = v37;
      v88 = v40;
      v41 = (id)objc_msgSend(v10, "appendObject:counterpart:", titleColor, v87);
      subtitleComplication = self->_subtitleComplication;
      v85[0] = v12;
      v85[1] = 3221225472;
      v85[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_11;
      v85[3] = &unk_1E4D426A0;
      v43 = v40;
      v86 = v43;
      v44 = (id)objc_msgSend(v10, "appendObject:counterpart:", subtitleComplication, v85);
      layoutType = self->_layoutType;
      v83[0] = v12;
      v83[1] = 3221225472;
      v83[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_12;
      v83[3] = &unk_1E4D426F0;
      v46 = v43;
      v84 = v46;
      v47 = (id)objc_msgSend(v10, "appendInteger:counterpart:", layoutType, v83);
      modeSemanticType = self->_modeSemanticType;
      v81[0] = v12;
      v81[1] = 3221225472;
      v81[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_13;
      v81[3] = &unk_1E4D426A0;
      v49 = v46;
      v82 = v49;
      v50 = (id)objc_msgSend(v10, "appendObject:counterpart:", modeSemanticType, v81);
      modeUUID = self->_modeUUID;
      v79[0] = v12;
      v79[1] = 3221225472;
      v79[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_14;
      v79[3] = &unk_1E4D426A0;
      v52 = v49;
      v80 = v52;
      v53 = (id)objc_msgSend(v10, "appendObject:counterpart:", modeUUID, v79);
      complications = self->_complications;
      v77[0] = v12;
      v77[1] = 3221225472;
      v77[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_15;
      v77[3] = &unk_1E4D426A0;
      v55 = v52;
      v78 = v55;
      v56 = (id)objc_msgSend(v10, "appendObject:counterpart:", complications, v77);
      landscapeComplications = self->_landscapeComplications;
      v75[0] = v12;
      v75[1] = 3221225472;
      v75[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_16;
      v75[3] = &unk_1E4D426A0;
      v58 = v55;
      v76 = v58;
      v59 = (id)objc_msgSend(v10, "appendObject:counterpart:", landscapeComplications, v75);
      blankTemplate = self->_blankTemplate;
      v73[0] = v12;
      v73[1] = 3221225472;
      v73[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_17;
      v73[3] = &unk_1E4D426C8;
      v61 = v58;
      v74 = v61;
      v62 = (id)objc_msgSend(v10, "appendBool:counterpart:", blankTemplate, v73);
      shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
      v71[0] = v12;
      v71[1] = 3221225472;
      v71[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_18;
      v71[3] = &unk_1E4D426C8;
      v64 = v61;
      v72 = v64;
      v65 = (id)objc_msgSend(v10, "appendBool:counterpart:", shouldShowAsShuffleStack, v71);
      source = self->_source;
      v69[0] = v12;
      v69[1] = 3221225472;
      v69[2] = __32__PRSPosterGalleryItem_isEqual___block_invoke_19;
      v69[3] = &unk_1E4D426F0;
      v70 = v64;
      v67 = (id)objc_msgSend(v10, "appendInteger:counterpart:", source, v69);
      v8 = objc_msgSend(v10, "isEqual");

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 72);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 80);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_10(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_11(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 96);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_12(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_13(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 128);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_14(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 136);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_15(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 104);
}

id __32__PRSPosterGalleryItem_isEqual___block_invoke_16(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_17(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_18(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
}

uint64_t __32__PRSPosterGalleryItem_isEqual___block_invoke_19(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_identifier);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_descriptorIdentifier);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_extensionBundleIdentifier);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_displayNameLocalizationKey);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_spokenNameLocalizationKey);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_descriptiveTextLocalizationKey);
  v10 = (id)objc_msgSend(v3, "appendObject:", self->_localizedDisplayName);
  v11 = (id)objc_msgSend(v3, "appendObject:", self->_localizedSubtitle);
  v12 = (id)objc_msgSend(v3, "appendObject:", self->_titleFontName);
  v13 = (id)objc_msgSend(v3, "appendObject:", self->_titleColor);
  v14 = (id)objc_msgSend(v3, "appendObject:", self->_subtitleComplication);
  v15 = (id)objc_msgSend(v3, "appendInteger:", self->_layoutType);
  v16 = (id)objc_msgSend(v3, "appendObject:", self->_modeSemanticType);
  v17 = (id)objc_msgSend(v3, "appendObject:", self->_modeUUID);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = self->_complications;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v23 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v20);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v24 = self->_landscapeComplications;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        v29 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v28++), (_QWORD)v35);
      }
      while (v26 != v28);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v26);
  }

  v30 = (id)objc_msgSend(v3, "appendBool:", self->_blankTemplate);
  v31 = (id)objc_msgSend(v3, "appendBool:", self->_shouldShowAsShuffleStack);
  v32 = (id)objc_msgSend(v3, "appendInteger:", self->_source);
  v33 = objc_msgSend(v3, "hash");

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItem)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PRSPosterGalleryItem *v57;
  void *v58;
  void *v59;
  void *v60;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  NSStringFromSelector(sel_descriptorIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_displayNameLocalizationKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v10, v11);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  NSStringFromSelector(sel_spokenNameLocalizationKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, v13);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v14, v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_localizedDisplayName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v16, v17);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  NSStringFromSelector(sel_localizedSubtitle);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v18, v19);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  NSStringFromSelector(sel_titleFontName);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v20, v21);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_opt_class();
  NSStringFromSelector(sel_titleColor);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v22, v23);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_opt_class();
  NSStringFromSelector(sel_subtitleComplication);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_layoutType);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v3, "decodeIntegerForKey:", v27);

  v28 = objc_opt_class();
  NSStringFromSelector(sel_modeSemanticType);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v28, v29);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_opt_class();
  NSStringFromSelector(sel_modeUUID);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v30, v31);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_opt_class();
  NSStringFromSelector(sel_complications);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_opt_class();
  NSStringFromSelector(sel_landscapeComplications);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isBlankTemplate);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v3, "decodeBoolForKey:", v38);

  NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v3, "decodeBoolForKey:", v40);

  NSStringFromSelector(sel_source);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v3, "decodeIntegerForKey:", v42);

  BYTE1(v45) = v41;
  LOBYTE(v45) = v39;
  v57 = -[PRSPosterGalleryItem initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:](self, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:localizedDisplayName:localizedSubtitle:titleFontName:titleColor:subtitleComplication:layoutType:modeSemanticType:modeUUID:complications:landscapeComplications:blankTemplate:shouldShowAsShuffleStack:source:", v60, v59, v58, v55, v54, v53, v52, v51, v50, v49, v26, v48, v47, v46,
          v34,
          v37,
          v45,
          v43);

  return v57;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  NSString *descriptorIdentifier;
  void *v8;
  NSString *extensionBundleIdentifier;
  void *v10;
  NSString *displayNameLocalizationKey;
  void *v12;
  NSString *spokenNameLocalizationKey;
  void *v14;
  NSString *descriptiveTextLocalizationKey;
  void *v16;
  NSString *localizedDisplayName;
  void *v18;
  NSString *localizedSubtitle;
  void *v20;
  NSString *titleFontName;
  void *v22;
  BSColor *titleColor;
  void *v24;
  PRSPosterGallerySuggestedComplication *subtitleComplication;
  void *v26;
  int64_t layoutType;
  void *v28;
  NSNumber *modeSemanticType;
  void *v30;
  NSString *modeUUID;
  void *v32;
  NSArray *complications;
  void *v34;
  NSArray *landscapeComplications;
  void *v36;
  _BOOL8 blankTemplate;
  void *v38;
  _BOOL8 shouldShowAsShuffleStack;
  void *v40;
  int64_t source;
  id v42;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  descriptorIdentifier = self->_descriptorIdentifier;
  NSStringFromSelector(sel_descriptorIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", descriptorIdentifier, v8);

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  NSStringFromSelector(sel_extensionBundleIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleIdentifier, v10);

  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  NSStringFromSelector(sel_displayNameLocalizationKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", displayNameLocalizationKey, v12);

  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  NSStringFromSelector(sel_spokenNameLocalizationKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", spokenNameLocalizationKey, v14);

  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", descriptiveTextLocalizationKey, v16);

  localizedDisplayName = self->_localizedDisplayName;
  NSStringFromSelector(sel_localizedDisplayName);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedDisplayName, v18);

  localizedSubtitle = self->_localizedSubtitle;
  NSStringFromSelector(sel_localizedSubtitle);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedSubtitle, v20);

  titleFontName = self->_titleFontName;
  NSStringFromSelector(sel_titleFontName);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", titleFontName, v22);

  titleColor = self->_titleColor;
  NSStringFromSelector(sel_titleColor);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", titleColor, v24);

  subtitleComplication = self->_subtitleComplication;
  NSStringFromSelector(sel_subtitleComplication);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", subtitleComplication, v26);

  layoutType = self->_layoutType;
  NSStringFromSelector(sel_layoutType);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", layoutType, v28);

  modeSemanticType = self->_modeSemanticType;
  NSStringFromSelector(sel_modeSemanticType);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", modeSemanticType, v30);

  modeUUID = self->_modeUUID;
  NSStringFromSelector(sel_modeUUID);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", modeUUID, v32);

  complications = self->_complications;
  NSStringFromSelector(sel_complications);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", complications, v34);

  landscapeComplications = self->_landscapeComplications;
  NSStringFromSelector(sel_landscapeComplications);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", landscapeComplications, v36);

  blankTemplate = self->_blankTemplate;
  NSStringFromSelector(sel_isBlankTemplate);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", blankTemplate, v38);

  shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
  NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", shouldShowAsShuffleStack, v40);

  source = self->_source;
  NSStringFromSelector(sel_source);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", source, v42);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (BSColor)titleColor
{
  return self->_titleColor;
}

- (PRSPosterGallerySuggestedComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (NSNumber)modeSemanticType
{
  return self->_modeSemanticType;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (BOOL)isBlankTemplate
{
  return self->_blankTemplate;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
