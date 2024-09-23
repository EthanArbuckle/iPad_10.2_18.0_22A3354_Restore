@implementation PRSPosterGalleryItemOptions

- (PRSPosterGalleryItemOptions)init
{
  uint64_t v3;
  uint64_t v4;

  LOBYTE(v4) = 0;
  LOWORD(v3) = 0;
  return -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", 0, 0, 0, 0, 0, 1, 0, 0, 0, v3, 0, 0, v4);
}

- (PRSPosterGalleryItemOptions)initWithModularComplications:(id)a3 modularLandscapeComplications:(id)a4 inlineComplication:(id)a5 allowsSystemSuggestedComplications:(BOOL)a6 allowsSystemSuggestedComplicationsInLandscape:(BOOL)a7 featuredConfidenceLevel:(int64_t)a8 displayNameLocalizationKey:(id)a9 spokenNameLocalizationKey:(id)a10 descriptiveTextLocalizationKey:(id)a11 hero:(BOOL)a12 shouldShowAsShuffleStack:(BOOL)a13 photoSubtype:(int64_t)a14 focus:(int64_t)a15 onlyEligibleForMadeForFocusSection:(BOOL)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  PRSPosterGalleryItemOptions *v27;
  uint64_t v28;
  NSArray *modularComplications;
  uint64_t v30;
  NSArray *modularLandscapeComplications;
  uint64_t v32;
  PRSPosterGallerySuggestedComplication *inlineComplication;
  uint64_t v34;
  NSString *displayNameLocalizationKey;
  uint64_t v36;
  NSString *spokenNameLocalizationKey;
  uint64_t v38;
  NSString *descriptiveTextLocalizationKey;
  objc_super v42;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v42.receiver = self;
  v42.super_class = (Class)PRSPosterGalleryItemOptions;
  v27 = -[PRSPosterGalleryItemOptions init](&v42, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v21, "copy");
    modularComplications = v27->_modularComplications;
    v27->_modularComplications = (NSArray *)v28;

    v30 = objc_msgSend(v22, "copy");
    modularLandscapeComplications = v27->_modularLandscapeComplications;
    v27->_modularLandscapeComplications = (NSArray *)v30;

    v32 = objc_msgSend(v23, "copy");
    inlineComplication = v27->_inlineComplication;
    v27->_inlineComplication = (PRSPosterGallerySuggestedComplication *)v32;

    v27->_allowsSystemSuggestedComplications = a6;
    v27->_allowsSystemSuggestedComplicationsInLandscape = a7;
    v27->_featuredConfidenceLevel = a8;
    v34 = objc_msgSend(v24, "copy");
    displayNameLocalizationKey = v27->_displayNameLocalizationKey;
    v27->_displayNameLocalizationKey = (NSString *)v34;

    v36 = objc_msgSend(v25, "copy");
    spokenNameLocalizationKey = v27->_spokenNameLocalizationKey;
    v27->_spokenNameLocalizationKey = (NSString *)v36;

    v38 = objc_msgSend(v26, "copy");
    descriptiveTextLocalizationKey = v27->_descriptiveTextLocalizationKey;
    v27->_descriptiveTextLocalizationKey = (NSString *)v38;

    v27->_hero = a12;
    v27->_shouldShowAsShuffleStack = a13;
    v27->_photoSubtype = a14;
    v27->_focus = a15;
    v27->_onlyEligibleForMadeForFocusSection = a16;
  }

  return v27;
}

- (PRSPosterGalleryItemOptions)initWithProactiveRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PRSPosterGalleryItemOptions *v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "modularComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "modularLandscapeComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "inlineComplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "posterBoardRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "allowsSystemSuggestedComplications");
  v21 = objc_msgSend(v3, "allowsSystemSuggestedComplicationsInLandscape");
  v7 = objc_msgSend(v3, "featuredConfidenceLevel");
  objc_msgSend(v3, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spokenNameLocalizationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptiveTextLocalizationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "isHero");
  v12 = objc_msgSend(v3, "shouldShowAsShuffleStack");
  v13 = objc_msgSend(v3, "photoSubtype");
  if ((unint64_t)(v13 - 1) >= 8)
    v14 = 0;
  else
    v14 = v13;
  v15 = objc_msgSend(v3, "focus");
  if ((unint64_t)(v15 - 1) >= 9)
    v16 = 0;
  else
    v16 = v15;
  if (v7 != 2)
    v7 = v7 == 1;
  LOBYTE(v20) = objc_msgSend(v3, "isOnlyEligibleForMadeForFocusSection");
  BYTE1(v19) = v12;
  LOBYTE(v19) = v11;
  v17 = -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v25, v23, v6, v22, v21, v7, v8, v9, v10, v19, v14, v16, v20);

  return v17;
}

uint64_t __63__PRSPosterGalleryItemOptions_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

uint64_t __63__PRSPosterGalleryItemOptions_initWithProactiveRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "posterBoardRepresentation");
}

- (id)proactiveRepresentation
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9050]), "initWithPosterBoardRepresentation:", self);
}

+ (id)itemOptionsWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  id v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  char v108;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  unsigned int v115;
  unsigned int v116;
  void *v117;
  void *v118;
  char v119;
  id v120;
  void *v121;
  void *v122;
  id v124;
  void *v125;
  void *v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSStringFromSelector(sel_modularComplications);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = 0x1E0C99000uLL;
  v125 = v11;
  v126 = v5;
  if (v11)
  {
    v127 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v133;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v133 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
          v19 = objc_opt_class();
          v20 = v18;
          if (v19)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
          }
          else
          {
            v21 = 0;
          }
          v22 = v21;

          if (v22)
          {
            +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:error:](PRSPosterGallerySuggestedComplication, "suggestedComplicationWithDictionaryRepresentation:error:", v22, a4);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (id)v23;
            if (a4 && *a4)
            {
              v31 = 0;
              v32 = v126;
              v33 = v13;
              goto LABEL_143;
            }
            if (v23)
              objc_msgSend(v127, "addObject:", v23);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
        if (v15)
          continue;
        break;
      }
    }

    v25 = objc_msgSend(v127, "copy");
    v127 = (id)v25;
    v5 = v126;
    v12 = 0x1E0C99000;
  }
  else
  {
    v127 = 0;
  }
  NSStringFromSelector(sel_modularLandscapeComplications);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_class();
  v29 = v27;
  if (v28)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v33 = v30;

  v124 = v33;
  if (v33)
  {
    v22 = objc_alloc_init(*(Class *)(v12 + 3560));
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v24 = v33;
    v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v129;
      while (2)
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v129 != v36)
            objc_enumerationMutation(v24);
          v38 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * j);
          v39 = objc_opt_class();
          v40 = v38;
          if (v39)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v40;
            else
              v41 = 0;
          }
          else
          {
            v41 = 0;
          }
          v42 = v41;

          if (v42)
          {
            +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:error:](PRSPosterGallerySuggestedComplication, "suggestedComplicationWithDictionaryRepresentation:error:", v42, a4);
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = (id)v43;
            if (a4 && *a4)
            {
              v31 = 0;
              v32 = v126;
              v33 = v124;
              goto LABEL_141;
            }
            if (v43)
              objc_msgSend(v22, "addObject:", v43);

          }
        }
        v35 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
        if (v35)
          continue;
        break;
      }
    }

    v45 = objc_msgSend(v22, "copy");
    v22 = (id)v45;
    v33 = v124;
  }
  else
  {
    v22 = 0;
  }
  NSStringFromSelector(sel_inlineComplication);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v126;
  objc_msgSend(v126, "objectForKey:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_opt_class();
  v49 = v47;
  if (v48)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v49;
    else
      v50 = 0;
  }
  else
  {
    v50 = 0;
  }
  v42 = v50;

  if (!v42)
  {
    v24 = 0;
LABEL_65:
    NSStringFromSelector(sel_allowsSystemSuggestedComplications);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKey:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_opt_class();
    v54 = v52;
    if (v53)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
    }
    else
    {
      v55 = 0;
    }
    v44 = v55;

    if (v44)
      v116 = objc_msgSend(v44, "BOOLValue");
    else
      v116 = 0;
    NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKey:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_opt_class();
    v59 = v57;
    if (v58)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v60 = v59;
      else
        v60 = 0;
    }
    else
    {
      v60 = 0;
    }
    v61 = v60;

    v122 = v61;
    if (v61)
      v115 = objc_msgSend(v61, "BOOLValue");
    else
      v115 = 0;
    NSStringFromSelector(sel_featuredConfidenceLevel);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKey:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_opt_class();
    v65 = v63;
    if (v64)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v66 = v65;
      else
        v66 = 0;
    }
    else
    {
      v66 = 0;
    }
    v67 = v66;

    v121 = v67;
    if (v67)
      v114 = objc_msgSend(v67, "integerValue");
    else
      v114 = 0;
    NSStringFromSelector(sel_displayNameLocalizationKey);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectForKey:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_opt_class();
    v71 = v69;
    if (v70)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v72 = v71;
      else
        v72 = 0;
    }
    else
    {
      v72 = 0;
    }
    v120 = v72;

    objc_msgSend(v126, "objectForKey:", CFSTR("hero"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_opt_class();
    v75 = v73;
    if (v74)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v76 = v75;
      else
        v76 = 0;
    }
    else
    {
      v76 = 0;
    }
    v77 = v76;

    if (v77)
    {
      v78 = v77;

    }
    else
    {
      objc_msgSend(v126, "objectForKey:", CFSTR("blankTemplate"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_opt_class();
      v81 = v79;
      if (v80)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v82 = v81;
        else
          v82 = 0;
      }
      else
      {
        v82 = 0;
      }
      v83 = v82;

      v78 = v83;
      if (!v78)
      {
        v119 = 0;
LABEL_108:
        NSStringFromSelector(sel_shouldShowAsShuffleStack);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "objectForKey:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_opt_class();
        v87 = v85;
        if (v86)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v88 = v87;
          else
            v88 = 0;
        }
        else
        {
          v88 = 0;
        }
        v89 = v88;

        v118 = v89;
        if (v89)
          v113 = objc_msgSend(v89, "BOOLValue");
        else
          v113 = 0;
        NSStringFromSelector(sel_photoSubtype);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "objectForKey:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_opt_class();
        v93 = v91;
        if (v92)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v94 = v93;
          else
            v94 = 0;
        }
        else
        {
          v94 = 0;
        }
        v95 = v94;

        if (v95)
          v112 = objc_msgSend(v95, "integerValue");
        else
          v112 = 0;
        NSStringFromSelector(sel_focus);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "objectForKey:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_opt_class();
        v99 = v97;
        if (v98)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v100 = v99;
          else
            v100 = 0;
        }
        else
        {
          v100 = 0;
        }
        v101 = v100;

        v117 = v95;
        if (v101)
          v102 = objc_msgSend(v101, "integerValue");
        else
          v102 = 0;
        objc_msgSend(v126, "objectForKey:", CFSTR("onlyEligibleForMadeForFocusSection"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_opt_class();
        v105 = v103;
        if (v104)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v106 = v105;
          else
            v106 = 0;
        }
        else
        {
          v106 = 0;
        }
        v33 = v124;
        v107 = v106;

        if (v107)
          v108 = objc_msgSend(v107, "BOOLValue");
        else
          v108 = 0;
        LOBYTE(v111) = v108;
        BYTE1(v110) = v113;
        LOBYTE(v110) = v119;
        v31 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v127, v22, v24, v116, v115, v114, v120, 0, 0, v110, v112, v102, v111);

LABEL_141:
        goto LABEL_142;
      }
    }
    v119 = objc_msgSend(v78, "BOOLValue");

    goto LABEL_108;
  }
  +[PRSPosterGallerySuggestedComplication suggestedComplicationWithDictionaryRepresentation:error:](PRSPosterGallerySuggestedComplication, "suggestedComplicationWithDictionaryRepresentation:error:", v42, a4);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!a4 || !*a4)
    goto LABEL_65;
  v31 = 0;
LABEL_142:

LABEL_143:
  return v31;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t inlineComplication;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[12];
  _QWORD v35[14];

  v35[12] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_modularComplications);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v33;
  -[NSArray bs_map:](self->_modularComplications, "bs_map:", &__block_literal_global_38);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v35[0] = v3;
  NSStringFromSelector(sel_modularLandscapeComplications);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v31;
  -[NSArray bs_map:](self->_modularLandscapeComplications, "bs_map:", &__block_literal_global_40);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v6;
  v32 = v4;
  v20 = (void *)v5;
  v35[1] = v5;
  NSStringFromSelector(sel_inlineComplication);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v29;
  inlineComplication = (uint64_t)self->_inlineComplication;
  v28 = inlineComplication;
  if (!inlineComplication)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    inlineComplication = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)inlineComplication;
  v35[2] = inlineComplication;
  NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsSystemSuggestedComplications);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsSystemSuggestedComplicationsInLandscape);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v24;
  NSStringFromSelector(sel_featuredConfidenceLevel);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_featuredConfidenceLevel);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v22;
  NSStringFromSelector(sel_displayNameLocalizationKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = self->_displayNameLocalizationKey;
  v34[6] = v8;
  v34[7] = CFSTR("hero");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hero);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v9;
  NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldShowAsShuffleStack);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v11;
  NSStringFromSelector(sel_photoSubtype);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_photoSubtype);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v13;
  NSStringFromSelector(sel_focus);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_focus);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v15;
  v34[11] = CFSTR("onlyEligibleForMadeForFocusSection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onlyEligibleForMadeForFocusSection);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  if (!v30)

  if (!v32)
  return v17;
}

uint64_t __55__PRSPosterGalleryItemOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __55__PRSPosterGalleryItemOptions_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v7) = self->_onlyEligibleForMadeForFocusSection;
  LOWORD(v6) = *(_WORD *)&self->_hero;
  return (id)objc_msgSend(v4, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", self->_modularComplications, self->_modularLandscapeComplications, self->_inlineComplication, self->_allowsSystemSuggestedComplications, self->_allowsSystemSuggestedComplicationsInLandscape, self->_featuredConfidenceLevel, self->_displayNameLocalizationKey, self->_spokenNameLocalizationKey, self->_descriptiveTextLocalizationKey, v6, self->_photoSubtype, self->_focus, v7);
}

- (BOOL)isEqual:(id)a3
{
  PRSPosterGalleryItemOptions *v4;
  uint64_t v5;
  PRSPosterGalleryItemOptions *v6;
  PRSPosterGalleryItemOptions *v7;
  char v8;
  PRSPosterGalleryItemOptions *v9;
  void *v10;
  NSArray *modularComplications;
  uint64_t v12;
  PRSPosterGalleryItemOptions *v13;
  id v14;
  NSArray *modularLandscapeComplications;
  PRSPosterGalleryItemOptions *v16;
  id v17;
  PRSPosterGallerySuggestedComplication *inlineComplication;
  PRSPosterGalleryItemOptions *v19;
  id v20;
  _BOOL8 allowsSystemSuggestedComplications;
  PRSPosterGalleryItemOptions *v22;
  id v23;
  _BOOL8 allowsSystemSuggestedComplicationsInLandscape;
  PRSPosterGalleryItemOptions *v25;
  id v26;
  int64_t featuredConfidenceLevel;
  PRSPosterGalleryItemOptions *v28;
  id v29;
  NSString *displayNameLocalizationKey;
  id v31;
  id v32;
  NSString *spokenNameLocalizationKey;
  id v34;
  id v35;
  NSString *descriptiveTextLocalizationKey;
  id v37;
  id v38;
  _BOOL8 hero;
  id v40;
  id v41;
  _BOOL8 shouldShowAsShuffleStack;
  id v43;
  id v44;
  int64_t photoSubtype;
  id v46;
  id v47;
  int64_t focus;
  id v49;
  id v50;
  _BOOL8 onlyEligibleForMadeForFocusSection;
  id v52;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  PRSPosterGalleryItemOptions *v73;
  _QWORD v74[4];
  PRSPosterGalleryItemOptions *v75;
  _QWORD v76[4];
  PRSPosterGalleryItemOptions *v77;
  _QWORD v78[4];
  PRSPosterGalleryItemOptions *v79;
  _QWORD v80[4];
  PRSPosterGalleryItemOptions *v81;

  v4 = (PRSPosterGalleryItemOptions *)a3;
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
      modularComplications = self->_modularComplications;
      v12 = MEMORY[0x1E0C809B0];
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke;
      v80[3] = &unk_1E4D426A0;
      v13 = v9;
      v81 = v13;
      v14 = (id)objc_msgSend(v10, "appendObject:counterpart:", modularComplications, v80);
      modularLandscapeComplications = self->_modularLandscapeComplications;
      v78[0] = v12;
      v78[1] = 3221225472;
      v78[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_2;
      v78[3] = &unk_1E4D426A0;
      v16 = v13;
      v79 = v16;
      v17 = (id)objc_msgSend(v10, "appendObject:counterpart:", modularLandscapeComplications, v78);
      inlineComplication = self->_inlineComplication;
      v76[0] = v12;
      v76[1] = 3221225472;
      v76[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_3;
      v76[3] = &unk_1E4D426A0;
      v19 = v16;
      v77 = v19;
      v20 = (id)objc_msgSend(v10, "appendObject:counterpart:", inlineComplication, v76);
      allowsSystemSuggestedComplications = self->_allowsSystemSuggestedComplications;
      v74[0] = v12;
      v74[1] = 3221225472;
      v74[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_4;
      v74[3] = &unk_1E4D426C8;
      v22 = v19;
      v75 = v22;
      v23 = (id)objc_msgSend(v10, "appendBool:counterpart:", allowsSystemSuggestedComplications, v74);
      allowsSystemSuggestedComplicationsInLandscape = self->_allowsSystemSuggestedComplicationsInLandscape;
      v72[0] = v12;
      v72[1] = 3221225472;
      v72[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_5;
      v72[3] = &unk_1E4D426C8;
      v25 = v22;
      v73 = v25;
      v26 = (id)objc_msgSend(v10, "appendBool:counterpart:", allowsSystemSuggestedComplicationsInLandscape, v72);
      featuredConfidenceLevel = self->_featuredConfidenceLevel;
      v70[0] = v12;
      v70[1] = 3221225472;
      v70[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_6;
      v70[3] = &unk_1E4D426F0;
      v28 = v25;
      v71 = v28;
      v29 = (id)objc_msgSend(v10, "appendInteger:counterpart:", featuredConfidenceLevel, v70);
      displayNameLocalizationKey = self->_displayNameLocalizationKey;
      v68[0] = v12;
      v68[1] = 3221225472;
      v68[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_7;
      v68[3] = &unk_1E4D426A0;
      v31 = v28;
      v69 = v31;
      v32 = (id)objc_msgSend(v10, "appendObject:counterpart:", displayNameLocalizationKey, v68);
      spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
      v66[0] = v12;
      v66[1] = 3221225472;
      v66[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_8;
      v66[3] = &unk_1E4D426A0;
      v34 = v31;
      v67 = v34;
      v35 = (id)objc_msgSend(v10, "appendObject:counterpart:", spokenNameLocalizationKey, v66);
      descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
      v64[0] = v12;
      v64[1] = 3221225472;
      v64[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_9;
      v64[3] = &unk_1E4D426A0;
      v37 = v34;
      v65 = v37;
      v38 = (id)objc_msgSend(v10, "appendObject:counterpart:", descriptiveTextLocalizationKey, v64);
      hero = self->_hero;
      v62[0] = v12;
      v62[1] = 3221225472;
      v62[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_10;
      v62[3] = &unk_1E4D426C8;
      v40 = v37;
      v63 = v40;
      v41 = (id)objc_msgSend(v10, "appendBool:counterpart:", hero, v62);
      shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
      v60[0] = v12;
      v60[1] = 3221225472;
      v60[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_11;
      v60[3] = &unk_1E4D426C8;
      v43 = v40;
      v61 = v43;
      v44 = (id)objc_msgSend(v10, "appendBool:counterpart:", shouldShowAsShuffleStack, v60);
      photoSubtype = self->_photoSubtype;
      v58[0] = v12;
      v58[1] = 3221225472;
      v58[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_12;
      v58[3] = &unk_1E4D426F0;
      v46 = v43;
      v59 = v46;
      v47 = (id)objc_msgSend(v10, "appendInteger:counterpart:", photoSubtype, v58);
      focus = self->_focus;
      v56[0] = v12;
      v56[1] = 3221225472;
      v56[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_13;
      v56[3] = &unk_1E4D426F0;
      v49 = v46;
      v57 = v49;
      v50 = (id)objc_msgSend(v10, "appendInteger:counterpart:", focus, v56);
      onlyEligibleForMadeForFocusSection = self->_onlyEligibleForMadeForFocusSection;
      v54[0] = v12;
      v54[1] = 3221225472;
      v54[2] = __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_14;
      v54[3] = &unk_1E4D426C8;
      v55 = v49;
      v52 = (id)objc_msgSend(v10, "appendBool:counterpart:", onlyEligibleForMadeForFocusSection, v54);
      v8 = objc_msgSend(v10, "isEqual");

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

id __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_9(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_10(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 11);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_12(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_13(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
}

uint64_t __39__PRSPosterGalleryItemOptions_isEqual___block_invoke_14(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12);
}

- (unint64_t)hash
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = self->_modularComplications;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v6);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = self->_modularLandscapeComplications;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14++), (_QWORD)v30);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v12);
  }

  v16 = (id)objc_msgSend(v3, "appendObject:", self->_inlineComplication);
  v17 = (id)objc_msgSend(v3, "appendBool:", self->_allowsSystemSuggestedComplications);
  v18 = (id)objc_msgSend(v3, "appendBool:", self->_allowsSystemSuggestedComplicationsInLandscape);
  v19 = (id)objc_msgSend(v3, "appendInteger:", self->_featuredConfidenceLevel);
  v20 = (id)objc_msgSend(v3, "appendObject:", self->_displayNameLocalizationKey);
  v21 = (id)objc_msgSend(v3, "appendObject:", self->_spokenNameLocalizationKey);
  v22 = (id)objc_msgSend(v3, "appendObject:", self->_descriptiveTextLocalizationKey);
  v23 = (id)objc_msgSend(v3, "appendBool:", self->_hero);
  v24 = (id)objc_msgSend(v3, "appendBool:", self->_shouldShowAsShuffleStack);
  v25 = (id)objc_msgSend(v3, "appendInteger:", self->_photoSubtype);
  v26 = (id)objc_msgSend(v3, "appendInteger:", self->_focus);
  v27 = (id)objc_msgSend(v3, "appendBool:", self->_onlyEligibleForMadeForFocusSection);
  v28 = objc_msgSend(v3, "hash");

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItemOptions)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  PRSPosterGalleryItemOptions *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_modularComplications);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v4, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  NSStringFromSelector(sel_modularLandscapeComplications);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", v6, v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_inlineComplication);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v3, "decodeBoolForKey:", v10);

  NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v3, "decodeBoolForKey:", v11);

  NSStringFromSelector(sel_featuredConfidenceLevel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v3, "decodeIntegerForKey:", v12);

  v13 = objc_opt_class();
  NSStringFromSelector(sel_displayNameLocalizationKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_spokenNameLocalizationKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_isHero);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = objc_msgSend(v3, "decodeBoolForKey:", v22);

  NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = objc_msgSend(v3, "decodeBoolForKey:", v23);

  NSStringFromSelector(sel_photoSubtype);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "decodeIntegerForKey:", v24);

  NSStringFromSelector(sel_focus);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v3, "decodeIntegerForKey:", v26);

  NSStringFromSelector(sel_isOnlyEligibleForMadeForFocusSection);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v3, "decodeBoolForKey:", v28);

  LOBYTE(v32) = (_BYTE)v7;
  BYTE1(v31) = (_BYTE)v22;
  LOBYTE(v31) = (_BYTE)v20;
  v29 = -[PRSPosterGalleryItemOptions initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:](self, "initWithModularComplications:modularLandscapeComplications:inlineComplication:allowsSystemSuggestedComplications:allowsSystemSuggestedComplicationsInLandscape:featuredConfidenceLevel:displayNameLocalizationKey:spokenNameLocalizationKey:descriptiveTextLocalizationKey:hero:shouldShowAsShuffleStack:photoSubtype:focus:onlyEligibleForMadeForFocusSection:", v38, v37, v36, v35, v34, v33, v15, v18, v21, v31, v25, v27, v32);

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *modularComplications;
  id v5;
  void *v6;
  NSArray *modularLandscapeComplications;
  void *v8;
  PRSPosterGallerySuggestedComplication *inlineComplication;
  void *v10;
  _BOOL8 allowsSystemSuggestedComplications;
  void *v12;
  _BOOL8 allowsSystemSuggestedComplicationsInLandscape;
  void *v14;
  int64_t featuredConfidenceLevel;
  void *v16;
  NSString *displayNameLocalizationKey;
  void *v18;
  NSString *spokenNameLocalizationKey;
  void *v20;
  NSString *descriptiveTextLocalizationKey;
  void *v22;
  _BOOL8 hero;
  void *v24;
  _BOOL8 shouldShowAsShuffleStack;
  void *v26;
  int64_t photoSubtype;
  void *v28;
  int64_t focus;
  void *v30;
  _BOOL8 onlyEligibleForMadeForFocusSection;
  id v32;

  modularComplications = self->_modularComplications;
  v5 = a3;
  NSStringFromSelector(sel_modularComplications);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", modularComplications, v6);

  modularLandscapeComplications = self->_modularLandscapeComplications;
  NSStringFromSelector(sel_modularLandscapeComplications);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", modularLandscapeComplications, v8);

  inlineComplication = self->_inlineComplication;
  NSStringFromSelector(sel_inlineComplication);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", inlineComplication, v10);

  allowsSystemSuggestedComplications = self->_allowsSystemSuggestedComplications;
  NSStringFromSelector(sel_allowsSystemSuggestedComplications);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", allowsSystemSuggestedComplications, v12);

  allowsSystemSuggestedComplicationsInLandscape = self->_allowsSystemSuggestedComplicationsInLandscape;
  NSStringFromSelector(sel_allowsSystemSuggestedComplicationsInLandscape);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", allowsSystemSuggestedComplicationsInLandscape, v14);

  featuredConfidenceLevel = self->_featuredConfidenceLevel;
  NSStringFromSelector(sel_featuredConfidenceLevel);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", featuredConfidenceLevel, v16);

  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  NSStringFromSelector(sel_displayNameLocalizationKey);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", displayNameLocalizationKey, v18);

  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  NSStringFromSelector(sel_spokenNameLocalizationKey);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", spokenNameLocalizationKey, v20);

  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  NSStringFromSelector(sel_descriptiveTextLocalizationKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", descriptiveTextLocalizationKey, v22);

  hero = self->_hero;
  NSStringFromSelector(sel_isHero);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", hero, v24);

  shouldShowAsShuffleStack = self->_shouldShowAsShuffleStack;
  NSStringFromSelector(sel_shouldShowAsShuffleStack);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", shouldShowAsShuffleStack, v26);

  photoSubtype = self->_photoSubtype;
  NSStringFromSelector(sel_photoSubtype);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", photoSubtype, v28);

  focus = self->_focus;
  NSStringFromSelector(sel_focus);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", focus, v30);

  onlyEligibleForMadeForFocusSection = self->_onlyEligibleForMadeForFocusSection;
  NSStringFromSelector(sel_isOnlyEligibleForMadeForFocusSection);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", onlyEligibleForMadeForFocusSection, v32);

}

- (NSArray)modularComplications
{
  return self->_modularComplications;
}

- (NSArray)modularLandscapeComplications
{
  return self->_modularLandscapeComplications;
}

- (PRSPosterGallerySuggestedComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (BOOL)allowsSystemSuggestedComplications
{
  return self->_allowsSystemSuggestedComplications;
}

- (BOOL)allowsSystemSuggestedComplicationsInLandscape
{
  return self->_allowsSystemSuggestedComplicationsInLandscape;
}

- (int64_t)featuredConfidenceLevel
{
  return self->_featuredConfidenceLevel;
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

- (BOOL)isHero
{
  return self->_hero;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (int64_t)photoSubtype
{
  return self->_photoSubtype;
}

- (int64_t)focus
{
  return self->_focus;
}

- (BOOL)isOnlyEligibleForMadeForFocusSection
{
  return self->_onlyEligibleForMadeForFocusSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_modularLandscapeComplications, 0);
  objc_storeStrong((id *)&self->_modularComplications, 0);
}

@end
