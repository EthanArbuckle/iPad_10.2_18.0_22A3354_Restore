@implementation ICTTTextController

- (void)styleFontInAttributedString:(id)a3 inRange:(_NSRange)a4 contentSizeCategory:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v15 = 0;
  v16 = 0;
  if (location < location + length)
  {
    v11 = location;
    do
    {
      v12 = (void *)MEMORY[0x1AF445E78]();
      objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", v11, &v15, location, length);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTTTextController styleForModelAttributes:contentSizeCategory:](self, "styleForModelAttributes:contentSizeCategory:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributes:range:", v14, v15, v16);

      v11 = v16 + v15;
      objc_autoreleasePoolPop(v12);
    }
    while (v11 < location + length);
  }

}

- (id)styleForModelAttributes:(id)a3 contentSizeCategory:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  ICTTTextController *v27;
  uint64_t v28;
  ICTTTextController *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  _QWORD *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  _QWORD *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  _QWORD *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  ICTTTextController *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  _QWORD *v119;
  void *v120;
  void *v121;
  ICTTTextController *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D63C70], "allowedAttributesForStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v128 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsObject:", v15))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v127, v131, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v7, -[ICTTTextController isForPrint](self, "isForPrint"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0DC1138]);

  v19 = (_QWORD *)MEMORY[0x1E0D63928];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (uint64_t *)MEMORY[0x1E0DC1178];
  if (v20)
  {
    v126 = v20;
    v22 = objc_msgSend(v20, "style");
    switch(v22)
    {
      case 0:
        -[ICTTTextController titleAttributesWithContentSizeCategory:](self, "titleAttributesWithContentSizeCategory:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 1:
        -[ICTTTextController headingAttributesWithContentSizeCategory:](self, "headingAttributesWithContentSizeCategory:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 2:
        -[ICTTTextController subheadingAttributesWithContentSizeCategory:](self, "subheadingAttributesWithContentSizeCategory:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 3:
        -[ICTTTextController bodyAttributesWithContentSizeCategory:](self, "bodyAttributesWithContentSizeCategory:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 4:
        -[ICTTTextController fixedWidthAttributesWithContentSizeCategory:](self, "fixedWidthAttributesWithContentSizeCategory:", v7);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 5:
        -[ICTTTextController captionAttributes](self, "captionAttributes");
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      default:
        if ((v22 - 100) >= 3)
        {
          if (v22 != 103)
            goto LABEL_24;
          -[ICTTTextController checklistAttributesWithContentSizeCategory:](self, "checklistAttributesWithContentSizeCategory:", v7);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[ICTTTextController defaultListAttributesWithContentSizeCategory:](self, "defaultListAttributesWithContentSizeCategory:", v7);
          v23 = objc_claimAutoreleasedReturnValue();
        }
LABEL_23:
        v26 = (void *)v23;
        objc_msgSend(v8, "addEntriesFromDictionary:", v23);

LABEL_24:
        v27 = self;
        v28 = v18;
        v29 = v27;
        -[ICTTTextController addBIToStyle:](v27, "addBIToStyle:", v8);
        v30 = *v21;
        objc_msgSend(v8, "objectForKeyedSubscript:", *v21);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "mutableCopy");

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v33, "setAlignment:", objc_msgSend(v126, "alignment"));
        objc_msgSend(v33, "setBaseWritingDirection:", objc_msgSend(v126, "writingDirection"));
        v34 = (void *)objc_msgSend(v33, "copy");
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, v30);

        v124 = objc_msgSend(v126, "writingDirection");
        v123 = objc_msgSend(v126, "alignment");

        v18 = v28;
        self = v29;
        break;
    }
  }
  else
  {
    -[ICTTTextController bodyAttributes](self, "bodyAttributes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v24);

    -[ICTTTextController addBIToStyle:](self, "addBIToStyle:", v8);
    objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, *v19);

    objc_msgSend(v8, "objectForKeyedSubscript:", *v19);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 4;
    v124 = -1;
  }
  v125 = v7;
  if (-[ICTTTextController keepNSTextTableAttributes](self, "keepNSTextTableAttributes"))
  {
    v122 = self;
    v35 = v18;
    v36 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textBlocks");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_23_0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "filteredArrayUsingPredicate:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v40, "count"))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v36);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v36);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v43, "setTextBlocks:", v40);
      v44 = (void *)objc_msgSend(v43, "copy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v44, v36);

    }
    v18 = v35;
    self = v122;
  }
  v45 = (_QWORD *)MEMORY[0x1E0D63948];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63948]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (_QWORD *)MEMORY[0x1E0DC1248];
  if (v46)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, *v47);

  }
  else
  {
    v49 = *MEMORY[0x1E0DC1248];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
      objc_msgSend(v8, "removeObjectForKey:", v49);
  }
  v51 = (_QWORD *)MEMORY[0x1E0D63930];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63930]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (_QWORD *)MEMORY[0x1E0DC11A8];
  if (v52)
  {
    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "BOOLValue"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v56, *v53);

  }
  else
  {
    v57 = *MEMORY[0x1E0DC11A8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      objc_msgSend(v8, "removeObjectForKey:", v57);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1160]);
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = (_QWORD *)MEMORY[0x1E0DC1140];
  if (v59)
  {
    v61 = (void *)v59;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v62)
    {
      v66 = *MEMORY[0x1E0D1CC00];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
        goto LABEL_51;
      objc_opt_class();
      objc_msgSend(v8, "objectForKeyedSubscript:", v66);
      v68 = objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v69, "coreResult");
      LOBYTE(v68) = DDShouldUseLightLinksForResult();

      if ((v68 & 1) == 0)
      {
LABEL_51:
        objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
        v64 = objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      }
    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D38]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICHashtagUnconfirmedColor");
    v64 = objc_claimAutoreleasedReturnValue();
LABEL_54:
    v71 = (void *)v64;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v64, *v60);

    goto LABEL_55;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D48]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICMentionUnconfirmedColor");
    v64 = objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D00]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICLinkAcceleratorUnconfirmedColor");
    v64 = objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  v113 = (_QWORD *)MEMORY[0x1E0D63908];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v114)
  {
    v119 = (_QWORD *)MEMORY[0x1E0D63920];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63920]);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

    if (v120)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *v119);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v121);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    }
    v64 = objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  if (ICInternalSettingsIsEmphasisEnabled())
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0DC1218], *MEMORY[0x1E0DC1210]);
    objc_msgSend(v10, "objectForKeyedSubscript:", *v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (int)objc_msgSend(v115, "intValue");

    v117 = (void *)ICEmphasisColorTypeForTag(v116);
    ICNSTextHighlightColorSchemeForEmphasisColorType((uint64_t)v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v118, *MEMORY[0x1E0DC11E0]);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ICColorForEmphasisColorType(v117);
      v64 = objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
  }
LABEL_55:
  objc_msgSend(v8, "objectForKeyedSubscript:", *v60);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0D63D50]);

  v73 = *MEMORY[0x1E0DC1100];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1100]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v75, v73);

  }
  v76 = *MEMORY[0x1E0D63D18];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D18]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v78, v76);

  }
  v79 = (_QWORD *)MEMORY[0x1E0D63D10];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D10]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v81, *v79);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63910]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
  {
    objc_msgSend(v82, "pointSize");
    if (v84 != INFINITY)
    {
      objc_msgSend(v83, "nativeFontForStyle:contentSizeCategory:isForPrint:", objc_msgSend(v126, "style"), v125, -[ICTTTextController isForPrint](self, "isForPrint"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v85, v18);

      -[ICTTTextController addBIToStyle:](self, "addBIToStyle:", v8);
    }
  }
  v86 = (_QWORD *)MEMORY[0x1E0D63938];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D63938]);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "integerValue");

  }
  else
  {
    v89 = 0;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", v18);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "pointSize");
  v92 = v91;

  if (v83 || !v89)
  {
    if (!v89)
      goto LABEL_72;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v18);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "pointSize");
    v95 = v94;
    +[ICTTTextController superscriptScaleFactor](ICTTTextController, "superscriptScaleFactor");
    objc_msgSend(v93, "fontWithSize:", v95 * v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v97, v18);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round((double)v89 * 0.2 * (double)(uint64_t)v92));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v98, *MEMORY[0x1E0DC1108]);

LABEL_72:
  v99 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v99);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "conformsToProtocol:", &unk_1EECADDB0)
      && (objc_msgSend(MEMORY[0x1E0D63C60], "isInlineAttachment:", v101) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
      v102 = self;
      v103 = v18;
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "attachmentParagraphSpacing");
      objc_msgSend(v104, "setParagraphSpacing:");
      objc_msgSend((id)objc_opt_class(), "attachmentParagraphSpacingBefore");
      objc_msgSend(v104, "setParagraphSpacingBefore:");
      objc_msgSend(v104, "setBaseWritingDirection:", v124);
      objc_msgSend(v104, "setAlignment:", v123);
      v105 = (void *)objc_msgSend(v104, "copy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v105, *MEMORY[0x1E0DC1178]);

      v18 = v103;
      self = v102;
    }

  }
  -[ICTTTextController zoomController](self, "zoomController");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v106)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.zoomController) != nil)", "-[ICTTTextController styleForModelAttributes:contentSizeCategory:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.zoomController");
  -[ICTTTextController zoomController](self, "zoomController");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "zoomFontInAttributes:", v8);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ICTTTextController disableSingleLineA](self, "disableSingleLineA"))
  {
    objc_msgSend(v108, "objectForKey:", v18);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      objc_msgSend(v108, "objectForKeyedSubscript:", v18);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "ic_fontWithoutSingleLineA");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setObject:forKeyedSubscript:", v111, v18);

    }
  }

  return v108;
}

- (ICTTZoomController)zoomController
{
  return self->_zoomController;
}

- (BOOL)keepNSTextTableAttributes
{
  return self->_keepNSTextTableAttributes;
}

- (BOOL)disableSingleLineA
{
  return self->_disableSingleLineA;
}

- (void)addBIToStyle:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "intValue");
    v6 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63C68], "convertFont:toBold:toItalic:", v7, v5 & 1, (v5 >> 1) & 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = v8 == (_QWORD)v7;
    else
      v10 = 1;
    if (!v10)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v6);

  }
}

- (id)bodyAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bodyParagraphSpacing");
  objc_msgSend(v6, "setParagraphSpacing:");
  objc_msgSend((id)objc_opt_class(), "bodyParagraphSpacingBefore");
  objc_msgSend(v6, "setParagraphSpacingBefore:");
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  objc_msgSend(v6, "setLineSpacing:", 4.0);
  v11[0] = *MEMORY[0x1E0DC1178];
  v7 = (void *)objc_msgSend(v6, "copy");
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (double)bodyParagraphSpacing
{
  return 0.0;
}

+ (double)bodyParagraphSpacingBefore
{
  return 0.0;
}

void __64__ICTTTextController_styleText_inExactRange_fixModelAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "highlightsAttributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *MEMORY[0x1E0DC1160];
  if (v11)
    objc_msgSend(v8, "addAttribute:value:range:", v10, v11, a3, a4);
  else
    objc_msgSend(v8, "removeAttribute:range:", v10, a3, a4);

}

- (id)titleAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParagraphSpacing:", 3.0);
  objc_msgSend(v6, "setParagraphSpacingBefore:", 0.0);
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  objc_msgSend(v6, "setLineSpacing:", 1.0);
  v11[0] = *MEMORY[0x1E0DC1178];
  v7 = (void *)objc_msgSend(v6, "copy");
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTitleTextWithContentSizeCategory:isForPrint:isReducedSize:", v5, -[ICTTTextController isForPrint](self, "isForPrint"), -[ICTTTextController isForSiri](self, "isForSiri"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)styleText:(id)a3 inRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  id v19;
  NSRange v20;
  NSRange v21;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v19 = a3;
  if (objc_msgSend(v19, "length"))
  {
    if (location >= objc_msgSend(v19, "length"))
    {
      length = 0;
      location = objc_msgSend(v19, "length") - 1;
    }
    objc_msgSend(v19, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, length);
    v12 = v11;

    v13 = length + location;
    if (v13 == v10 + v12 && v13 < objc_msgSend(v19, "length"))
    {
      objc_msgSend(v19, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "paragraphRangeForRange:", v13, 0);
      v17 = v16;

      v20.location = v10;
      v20.length = v12;
      v21.location = v15;
      v21.length = v17;
      v18 = NSUnionRange(v20, v21);
      v10 = v18.location;
      v12 = v18.length;
    }
    -[ICTTTextController styleText:inExactRange:fixModelAttributes:](self, "styleText:inExactRange:fixModelAttributes:", v19, v10, v12, v5);
  }

}

- (void)styleText:(id)a3 inExactRange:(_NSRange)a4 fixModelAttributes:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSUInteger v10;
  NSRange v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];
  NSRange v23;
  NSRange v24;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v22[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24.location = objc_msgSend(v9, "ic_range");
  v24.length = v10;
  v23.location = location;
  v23.length = length;
  v11 = NSIntersectionRange(v23, v24);
  if (v11.length)
  {
    if (v5)
    {
      objc_msgSend(v9, "setDisableUndoCoalesceBreaking:", 1);
      -[ICTTTextController fixModelAttributesInTextStorage:inRange:](self, "fixModelAttributesInTextStorage:inRange:", v9, v11.location, v11.length);
      objc_msgSend(v9, "setDisableUndoCoalesceBreaking:", 0);
    }
    objc_msgSend(v9, "beginTemporaryAttributeEditing");
    v21 = *MEMORY[0x1E0DC1178];
    -[ICTTTextController defaultParagraphStyle](self, "defaultParagraphStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v13, v11.location, v11.length);

    -[ICTTTextController styleFontInTextStorage:inRange:](self, "styleFontInTextStorage:inRange:", v9, v11.location, v11.length);
    -[ICTTTextController styleListsAndIndentsInAttributedString:inRange:](self, "styleListsAndIndentsInAttributedString:inRange:", v9, v11.location, v11.length);
    v14 = *MEMORY[0x1E0DC1160];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __64__ICTTTextController_styleText_inExactRange_fixModelAttributes___block_invoke;
    v19 = &unk_1E5C24560;
    v15 = v9;
    v20 = v15;
    objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v14, v11.location, v11.length, 0, &v16);
    objc_msgSend(v15, "invalidateAttributesInRange:", v11.location, v11.length, v16, v17, v18, v19);
    objc_msgSend(v15, "endTemporaryAttributeEditing");

  }
}

- (void)styleFontInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  objc_msgSend(v7, "beginEditing");
  -[ICTTTextController styleFontInAttributedString:inRange:contentSizeCategory:](self, "styleFontInAttributedString:inRange:contentSizeCategory:", v7, location, length, 0);
  objc_msgSend(v7, "endEditing");

}

- (void)setHeadingStyleFontSizeThreshold:(double)a3
{
  self->_headingStyleFontSizeThreshold = a3;
}

- (void)setBodyStyleFontSizeThreshold:(double)a3
{
  self->_bodyStyleFontSizeThreshold = a3;
}

- (void)resetGuessedFontSizes
{
  -[ICTTTextController setBodyStyleFontSizeThreshold:](self, "setBodyStyleFontSizeThreshold:", 16.0);
  -[ICTTTextController setHeadingStyleFontSizeThreshold:](self, "setHeadingStyleFontSizeThreshold:", 19.0);
}

- (id)preferredAttributesForICTTTextStyle:(unsigned int)a3
{
  void *v3;
  id result;

  switch(a3)
  {
    case 0u:
      -[ICTTTextController titleAttributes](self, "titleAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1u:
      -[ICTTTextController headingAttributes](self, "headingAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2u:
      -[ICTTTextController subheadingAttributes](self, "subheadingAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3u:
      -[ICTTTextController bodyAttributes](self, "bodyAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4u:
      -[ICTTTextController fixedWidthAttributes](self, "fixedWidthAttributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      result = v3;
      break;
    default:
      switch(a3)
      {
        case 'd':
        case 'e':
        case 'f':
          -[ICTTTextController defaultListAttributes](self, "defaultListAttributes");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 'g':
          -[ICTTTextController checklistAttributes](self, "checklistAttributes");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (BOOL)isInPreviewMode
{
  return self->_inPreviewMode;
}

- (ICTTTextController)init
{
  ICTTTextController *v2;
  ICZoomController *v3;
  ICTTZoomController *zoomController;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTTTextController;
  v2 = -[ICTTTextController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICZoomController);
    zoomController = v2->_zoomController;
    v2->_zoomController = &v3->super;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_showsEditorDebugTooltips = objc_msgSend(v5, "BOOLForKey:", kICShowEditorDebugTooltips);

    -[ICTTTextController resetGuessedFontSizes](v2, "resetGuessedFontSizes");
  }
  return v2;
}

- (id)headingAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParagraphSpacing:", 4.0);
  objc_msgSend(v6, "setParagraphSpacingBefore:", 0.0);
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  v11[0] = *MEMORY[0x1E0DC1178];
  v7 = (void *)objc_msgSend(v6, "copy");
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForHeadingTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)defaultParagraphStyle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLineHeightMultiple:", 1.2);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)defaultListAttributes
{
  return -[ICTTTextController defaultListAttributesWithContentSizeCategory:](self, "defaultListAttributesWithContentSizeCategory:", 0);
}

- (id)defaultListAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int IsTextKit2Enabled;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParagraphSpacing:", 0.0);
  objc_msgSend(v6, "setParagraphSpacingBefore:", 0.0);
  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v8 = 4.0;
  if (IsTextKit2Enabled)
    v8 = 2.0;
  objc_msgSend(v6, "setLineSpacing:", v8);
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  v13[0] = *MEMORY[0x1E0DC1178];
  v9 = (void *)objc_msgSend(v6, "copy");
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)bodyAttributes
{
  return -[ICTTTextController bodyAttributesWithContentSizeCategory:](self, "bodyAttributesWithContentSizeCategory:", 0);
}

+ (double)attachmentParagraphSpacing
{
  return 8.0;
}

+ (double)attachmentParagraphSpacingBefore
{
  return 9.0;
}

- (id)titleAttributes
{
  return -[ICTTTextController titleAttributesWithContentSizeCategory:](self, "titleAttributesWithContentSizeCategory:", 0);
}

- (id)headingAttributes
{
  return -[ICTTTextController headingAttributesWithContentSizeCategory:](self, "headingAttributesWithContentSizeCategory:", 0);
}

- (id)subheadingAttributes
{
  return -[ICTTTextController subheadingAttributesWithContentSizeCategory:](self, "subheadingAttributesWithContentSizeCategory:", 0);
}

- (id)subheadingAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  objc_msgSend(v6, "setLineSpacing:", 4.0);
  v11[0] = *MEMORY[0x1E0DC1178];
  v7 = (void *)objc_msgSend(v6, "copy");
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForSubheadingTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)captionAttributes
{
  return -[ICTTTextController captionAttributesWithContentSizeCategory:](self, "captionAttributesWithContentSizeCategory:", 0);
}

- (id)captionAttributesWithContentSizeCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlignment:", 1);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AA0], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_fontWithSingleLineA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_fontWithSingleLineA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11[0] = *MEMORY[0x1E0DC1178];
  v8 = (void *)objc_msgSend(v4, "copy");
  v11[1] = *MEMORY[0x1E0DC1138];
  v12[0] = v8;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)checklistAttributes
{
  return -[ICTTTextController checklistAttributesWithContentSizeCategory:](self, "checklistAttributesWithContentSizeCategory:", 0);
}

- (id)checklistAttributesWithContentSizeCategory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0DC1290];
  v5 = a3;
  objc_msgSend(v4, "ic_mutableDefaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParagraphSpacing:", 5.0);
  objc_msgSend(v6, "setParagraphSpacingBefore:", 5.0);
  objc_msgSend(v6, "setLineHeightMultiple:", 1.0);
  v11[0] = *MEMORY[0x1E0DC1178];
  v7 = (void *)objc_msgSend(v6, "copy");
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:isForPrint:", v5, -[ICTTTextController isForPrint](self, "isForPrint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fixedWidthAttributes
{
  return -[ICTTTextController fixedWidthAttributesWithContentSizeCategory:](self, "fixedWidthAttributesWithContentSizeCategory:", 0);
}

- (id)fixedWidthAttributesWithContentSizeCategory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC1290];
  v4 = a3;
  objc_msgSend(v3, "ic_mutableDefaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineSpacing:", 2.0);
  v10[0] = *MEMORY[0x1E0DC1178];
  v6 = (void *)objc_msgSend(v5, "copy");
  v11[0] = v6;
  v10[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)superscriptScaleFactor
{
  return 0.83;
}

- (id)typingAttributesForSettingTextStyleForRange:(_NSRange)a3 currentTypingAttributes:(id)a4 inTextStorage:(id)a5
{
  return -[ICTTTextController typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:", a3.location, a3.length, 0, 1, a4, a5);
}

- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 currentTypingAttributes:(id)a5 inTextStorage:(id)a6
{
  return -[ICTTTextController typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:forSettingTextStyle:currentTypingAttributes:inTextStorage:", a3.location, a3.length, a4, 0, a5, a6);
}

- (id)typingAttributesForRange:(_NSRange)a3 forSelectionChange:(BOOL)a4 forSettingTextStyle:(BOOL)a5 currentTypingAttributes:(id)a6 inTextStorage:(id)a7
{
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  NSUInteger v15;
  NSRange v16;
  NSRange v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BOOL4 v24;
  ICTTTextController *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSUInteger v30;
  NSUInteger v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  id v56;
  uint64_t v57;
  id v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  NSUInteger v66;
  NSRange v67;

  v8 = a5;
  length = a3.length;
  location = a3.location;
  v13 = a6;
  v14 = a7;
  v15 = objc_msgSend(v14, "length");
  if (length)
    v16.length = v15;
  else
    v16.length = v15 + 1;
  v67.location = location;
  v67.length = length;
  v16.location = 0;
  v17 = NSIntersectionRange(v67, v16);
  v18 = v17.location;
  v19 = v17.length;
  v20 = objc_msgSend(v14, "logicalRangeForLocation:", v17.location);
  v22 = v21;
  if (objc_msgSend(v14, "convertAttributes"))
  {
    -[ICTTTextController modelForStyleAttributes:filterAttributes:](self, "modelForStyleAttributes:filterAttributes:", v13, 0);
    v23 = v14;
    v24 = v8;
    v25 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextController styleForModelAttributes:](v25, "styleForModelAttributes:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    self = v25;
    v8 = v24;
    v14 = v23;
    v18 = v17.location;
    v19 = v17.length;
    v13 = (id)v27;
  }
  v65 = 0;
  v66 = 0;
  objc_msgSend(v14, "string");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "getParagraphStart:end:contentsEnd:forRange:", 0, &v66, 0, 0, 0);

  objc_msgSend(v14, "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "getParagraphStart:end:contentsEnd:forRange:", &v65, 0, 0, v18, v19);

  v30 = v66;
  v31 = v20 + v22;
  if (v66 >= v31)
    v30 = v31;
  v66 = v30;
  if (!a4 && !v8)
  {
    if (!v22)
    {
      objc_opt_class();
      v32 = (_QWORD *)MEMORY[0x1E0D63928];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isList");

      if (v35)
      {
        v36 = (id)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v36, "removeObjectForKey:", *v32);
        v37 = v13;
        goto LABEL_21;
      }
    }
    goto LABEL_23;
  }
  if (!v18 && !v19 && !v30)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      goto LABEL_23;
    -[ICTTTextController defaultTypingAttributesForEmptyDocument](self, "defaultTypingAttributesForEmptyDocument");
    v37 = v13;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v19)
  {
    objc_msgSend(v14, "attributesAtIndex:effectiveRange:", v18, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextController styleForModelAttributes:](self, "styleForModelAttributes:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "mutableCopy");

    -[ICTTTextController removeAttribute:ifInconsistentAtLocation:inTextStorage:forNewTypingAttributes:](self, "removeAttribute:ifInconsistentAtLocation:inTextStorage:forNewTypingAttributes:", *MEMORY[0x1E0DC1160], v18, v14, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v41)
    {
LABEL_22:

      goto LABEL_23;
    }
    v42 = -[ICTTTextController copyNSParagraphStylefromAttributes:toAttributes:](self, "copyNSParagraphStylefromAttributes:toAttributes:", v37, v41);

    v36 = v42;
LABEL_21:
    v13 = v36;
    goto LABEL_22;
  }
  v50 = v65;
  if (!v8 && v18 == v65)
  {
    objc_opt_class();
    ICDynamicCast();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextController strippedTypingAttributesAtStartOfParagraph:atTheEndOfDocument:isTyping:](self, "strippedTypingAttributesAtStartOfParagraph:atTheEndOfDocument:isTyping:", v13, v18 == v31, objc_msgSend(v51, "isTypingOrMarkingText"));
    v52 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v52;
  }
  if (v18 <= v31)
  {
    objc_opt_class();
    ICDynamicCast();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isTypingOrMarkingText");

    if (v54)
    {
      if (v18 >= v31)
      {
        v37 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v14, "attributesAtIndex:effectiveRange:", v18, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v13, "mutableCopy");
      v56 = -[ICTTTextController copyAttribute:fromAttributes:toAttributes:](self, "copyAttribute:fromAttributes:toAttributes:", *MEMORY[0x1E0D63928], v37, v55);
      goto LABEL_44;
    }
    -[ICTTTextController referenceAttributesForLocation:textStorage:currentParagraphStart:](self, "referenceAttributesForLocation:textStorage:currentParagraphStart:", v18, v14, v65);
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (id)v57;
    if (v18 == v50)
    {
      if (v8)
      {
        v59 = (_QWORD *)MEMORY[0x1E0D63928];
        objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)objc_msgSend(v58, "mutableCopy");
        v37 = v61;
        if (v60)
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, *v59);

        goto LABEL_42;
      }
      if (v18 == v31)
      {
        v37 = 0;
        goto LABEL_46;
      }
    }
    v37 = (void *)v57;
LABEL_42:
    if (!v37)
      goto LABEL_22;
    -[ICTTTextController styleForModelAttributes:](self, "styleForModelAttributes:", v37);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v62, "mutableCopy");

    -[ICTTTextController removeAttribute:ifInconsistentAtLocation:inTextStorage:forNewTypingAttributes:](self, "removeAttribute:ifInconsistentAtLocation:inTextStorage:forNewTypingAttributes:", *MEMORY[0x1E0DC1160], v18, v14, v55);
    v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
    v63 = v56;

    if (!v63)
      goto LABEL_22;
    v64 = -[ICTTTextController copyNSParagraphStylefromAttributes:toAttributes:](self, "copyNSParagraphStylefromAttributes:toAttributes:", v37, v63);

    v58 = v64;
    v13 = v58;
LABEL_46:

    goto LABEL_22;
  }
LABEL_23:
  if (typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__onceToken != -1)
    dispatch_once(&typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__onceToken, &__block_literal_global_95);
  v43 = (void *)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys;
  v44 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "allKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setWithArray:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = objc_msgSend(v43, "intersectsSet:", v46);

  if ((_DWORD)v43)
  {
    v47 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend((id)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectsForKeys:", v48);

    v13 = v47;
  }

  return v13;
}

void __124__ICTTTextController_typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0DC10F0];
  v8[0] = *MEMORY[0x1E0DC10F8];
  v8[1] = v1;
  v2 = *MEMORY[0x1E0DC11C8];
  v8[2] = *MEMORY[0x1E0DC1100];
  v8[3] = v2;
  v3 = *MEMORY[0x1E0D63D18];
  v8[4] = *MEMORY[0x1E0D63D10];
  v8[5] = v3;
  v4 = *MEMORY[0x1E0D63D48];
  v8[6] = *MEMORY[0x1E0D63D38];
  v8[7] = v4;
  v8[8] = *MEMORY[0x1E0D63D00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys;
  typingAttributesForRange_forSelectionChange_forSettingTextStyle_currentTypingAttributes_inTextStorage__stripTypingAttributeKeys = v6;

}

- (id)defaultTypingAttributesForEmptyDocument
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle");
  objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3 == 1)
  {
    -[ICTTTextController headingAttributes](self, "headingAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_DWORD)v3)
      -[ICTTTextController bodyAttributes](self, "bodyAttributes");
    else
      -[ICTTTextController titleAttributes](self, "titleAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "setObject:forKey:", v4, *MEMORY[0x1E0D63928]);
  -[ICTTTextController zoomController](self, "zoomController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoomFontInAttributes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC1160]);
  if (v6)
  {
    v10 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63C98], "paragraphStyleNamed:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setIndent:", objc_msgSend(v11, "indent"));
    objc_msgSend(v9, "setObject:forKey:", v13, *v10);
    objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC1178]);
    if (!a5)
    {
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63910]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC1138]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63918]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC11A8]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0DC1248]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63930]);
      objc_msgSend(v9, "removeObjectForKey:", *MEMORY[0x1E0D63948]);
    }

  }
  -[ICTTTextController styleForModelAttributes:](self, "styleForModelAttributes:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)copyAttribute:(id)a3 fromAttributes:(id)a4 toAttributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v7);

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", v7);
  }

  return v9;
}

- (id)copyNSParagraphStylefromAttributes:(id)a3 toAttributes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_4;
    v13 = (void *)v12;
    objc_opt_class();
    objc_msgSend(v5, "objectForKeyedSubscript:", *v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "style");

    if (v16 == 3)
    {
LABEL_4:
      objc_msgSend(v10, "paragraphSpacing");
      v18 = v17;
      objc_msgSend((id)objc_opt_class(), "attachmentParagraphSpacing");
      if (v18 == v19)
      {
        objc_msgSend(v10, "paragraphSpacingBefore");
        v21 = v20;
        objc_msgSend((id)objc_opt_class(), "attachmentParagraphSpacingBefore");
        if (v21 == v22)
        {
          objc_msgSend((id)objc_opt_class(), "bodyParagraphSpacing");
          objc_msgSend(v10, "setParagraphSpacing:");
          objc_msgSend((id)objc_opt_class(), "bodyParagraphSpacingBefore");
          objc_msgSend(v10, "setParagraphSpacingBefore:");
        }
      }
    }
    v23 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, v7);

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", v7);
  }

  return v6;
}

- (id)referenceAttributesForLocation:(unint64_t)a3 textStorage:(id)a4 currentParagraphStart:(unint64_t)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v7 = a4;
  v8 = v7;
  if (a3 != a5 || objc_msgSend(v7, "length") <= a3)
  {
    if ((uint64_t)a3 <= 1)
      v9 = 1;
    else
      v9 = a3;
    a3 = v9 - 1;
  }
  objc_msgSend(v8, "attributesAtIndex:effectiveRange:", a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)removeAttribute:(id)a3 ifInconsistentAtLocation:(unint64_t)a4 inTextStorage:(id)a5 forNewTypingAttributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "length") <= a4
    || ((uint64_t)a4 <= 1 ? (v12 = 1) : (v12 = a4),
        objc_msgSend(v10, "attribute:atIndex:effectiveRange:", v9, v12 - 1, 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "attribute:atIndex:effectiveRange:", v9, a4, 0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14 != v13))
  {
    objc_msgSend(v11, "removeObjectForKey:", v9);
  }

  return v11;
}

- (id)styleForModelAttributes:(id)a3
{
  return -[ICTTTextController styleForModelAttributes:contentSizeCategory:](self, "styleForModelAttributes:contentSizeCategory:", a3, 0);
}

uint64_t __66__ICTTTextController_styleForModelAttributes_contentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)guessFontSizeThresholdsForTTStylesInAttributedString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICTTTextController resetGuessedFontSizes](self, "resetGuessedFontSizes");
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__82;
  v45 = __Block_byref_object_dispose__82;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = *MEMORY[0x1E0DC1178];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke;
  v37[3] = &unk_1E5C1F428;
  v32 = v5;
  v38 = v32;
  v8 = v4;
  v39 = v8;
  v40 = &v41;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v37);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = (id)v42[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v34;
    v13 = 0.0;
    v14 = 1.79769313e308;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      v19 = 0;
      v20 = v17;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v19);
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        if (v23 > v11)
        {
          v11 = v23;
          v13 = v26;
        }
        if (v26 > v15)
          v27 = v26;
        else
          v27 = v15;
        if (v26 <= v16)
        {
          v28 = v16;
        }
        else
        {
          v27 = v16;
          v28 = v26;
        }
        if (v23 < 3)
        {
          v15 = v27;
          v16 = v28;
        }
        if (v26 <= v20)
          v17 = v20;
        else
          v17 = v26;
        if (v26 > v20)
          v18 = v20;
        if (v26 < v14)
          v14 = v26;
        ++v19;
        v20 = v17;
      }
      while (v10 != v19);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v10);
  }
  else
  {
    v13 = 0.0;
    v14 = 1.79769313e308;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
  }

  -[ICTTTextController bodyStyleFontSizeThreshold](self, "bodyStyleFontSizeThreshold");
  v30 = v13 <= v29;
  v31 = v13;
  if (!v30 || (v31 = v14, v13 == 0.0))
    -[ICTTTextController setBodyStyleFontSizeThreshold:](self, "setBodyStyleFontSizeThreshold:", v31);
  if (v15 > v13 || (v15 = v16, v16 > v13) || (v15 = v18, v18 > v13) || (v15 = v17, v17 >= v13))
    -[ICTTTextController setHeadingStyleFontSizeThreshold:](self, "setHeadingStyleFontSizeThreshold:", v15);

  _Block_object_dispose(&v41, 8);
}

void __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v7 = a3 + a4;
  if (a3 < a3 + a4)
  {
    v20 = *MEMORY[0x1E0CB2D28];
    v21 = *MEMORY[0x1E0DC1138];
    do
    {
      v8 = (void *)MEMORY[0x1AF445E78]();
      v10 = objc_msgSend(*(id *)(a1 + 32), "paragraphRangeForRange:", a3, 0);
      v11 = v9;
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v24 = 0;
      v25 = (double *)&v24;
      v26 = 0x2020000000;
      v27 = 0x4030000000000000;
      if (v9 >= 0x1A)
      {
        v12 = (unint64_t)((double)(v9 / 0x64) + 1.0);
        if (v9 >= 0x12C)
          v12 = 4;
        v31 = v12;
        v13 = *(void **)(a1 + 32);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_2;
        v23[3] = &unk_1E5C24510;
        v23[4] = &v28;
        objc_msgSend(v13, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v10, v9, v20, 0, 0, v23);
      }
      v14 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_3;
      v22[3] = &unk_1E5C24538;
      v22[4] = &v24;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v21, v10, v11, 0, v22);
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29[3]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25[3]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);
      objc_autoreleasePoolPop(v8);
      a3 = v10 + v11;
    }
    while (a3 < v7);
  }

}

uint64_t __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*MEMORY[0x1E0CB2CF0] == a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __75__ICTTTextController_guessFontSizeThresholdsForTTStylesInAttributedString___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "pointSize");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4
{
  return -[ICTTTextController modelForStyleAttributes:filterAttributes:pasteboardAttributedString:](self, "modelForStyleAttributes:filterAttributes:pasteboardAttributedString:", a3, a4, 0);
}

- (id)modelForStyleAttributes:(id)a3 filterAttributes:(BOOL)a4 pasteboardAttributedString:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  CGColor *CopyWithAlpha;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  int v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  unint64_t v80;
  _BOOL8 v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  int v112;
  double v113;
  double v114;
  double v115;
  int v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  uint64_t v123;
  id v124;
  void *v125;
  double v126;
  double v127;
  void *v128;
  id v129;
  char isKindOfClass;
  void *v132;
  void *v133;
  uint64_t v134;
  int v135;
  ICTTTextController *v136;
  void *v137;
  void *v138;
  __int16 v139;
  __int16 v140;
  __int16 v141;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[ICTTTextController zoomController](self, "zoomController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoomFactor");
  v12 = v11;

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v134 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v8, "objectForKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = MEMORY[0x1E0D63928];
  if (!v6 || !v14)
  {
    if (!v14)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_msgSend(v14, "pointSize");
  v18 = v17;
  -[ICTTTextController headingStyleFontSizeThreshold](self, "headingStyleFontSizeThreshold");
  if (v18 <= v12 * v19)
  {
    objc_msgSend(v15, "pointSize");
    v22 = v21;
    -[ICTTTextController bodyStyleFontSizeThreshold](self, "bodyStyleFontSizeThreshold");
    if (v22 <= v12 * v23)
      goto LABEL_10;
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsParagraphCleanup:", 1);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, *(_QWORD *)v16);

LABEL_10:
  v141 = 0;
  objc_msgSend(MEMORY[0x1E0D63C68], "font:isBold:isItalic:", v15, (char *)&v141 + 1, &v141);
  if (HIBYTE(v141) | (2 * v141))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D63918]);

  }
LABEL_12:
  v136 = self;
  v26 = *MEMORY[0x1E0DC1248];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(v8, "objectForKeyedSubscript:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v29, "integerValue");

    if (v16)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D63948]);
  }
  v30 = *MEMORY[0x1E0DC11A8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    objc_msgSend(v8, "objectForKeyedSubscript:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v33, "integerValue");

    if (v16)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D63930]);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1210]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11E0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = ICEmphasisColorTypeForNSTextHighlightColorScheme(v35);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D63908]);

  }
  if (!v6)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v38, "isEqual:", v39);

      if ((v16 & 1) == 0)
      {
        CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(objc_retainAutorelease(v38), "CGColor"), 1.0);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", CopyWithAlpha, *MEMORY[0x1E0D63920]);
        CGColorRelease(CopyWithAlpha);
      }
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41
    || (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D60]),
        (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v42 = *MEMORY[0x1E0DC1160];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1160]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {

    }
    if (v43)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, v42);

      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v45, "CGColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v46, "CGColor");
      v47 = ICCGColorEquivalentToColor();

      if (v47)
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D63920]);
    }
  }
  else
  {

  }
  v48 = (_QWORD *)MEMORY[0x1E0D63938];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63938]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v50, *v48);

  }
  v51 = *MEMORY[0x1E0DC1258];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1258]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (_QWORD *)MEMORY[0x1E0D63928];
  if (v52)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v54, v51);

  }
  v55 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v57, v55);

  }
  v58 = *MEMORY[0x1E0DC10F0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F0]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v60, v58);

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *v53);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *v53);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v62, *v53);

  }
  v63 = *MEMORY[0x1E0DC1178];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v138 = v9;
  if (v64)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *v53);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "textLists");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "count"))
    {
      v68 = objc_msgSend(v66, "isList");

      if ((v68 & 1) == 0)
      {
        objc_msgSend(v65, "textLists");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "lastObject");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v133 = v70;
        objc_msgSend(v70, "markerFormat");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v71, "containsString:", CFSTR("{hyphen}")))
        {
          v72 = (void *)MEMORY[0x1E0D63C90];
          v73 = 101;
        }
        else
        {
          if (objc_msgSend(v71, "containsString:", CFSTR("{decimal}")))
          {
            objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 102);
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            v75 = v133;
            if (objc_msgSend(v133, "startingItemNumber") < 1)
              v86 = 0;
            else
              v86 = objc_msgSend(v133, "startingItemNumber");
            objc_msgSend(v74, "setStartingItemNumber:", v86);
            goto LABEL_70;
          }
          if ((objc_msgSend(v71, "containsString:", CFSTR("{check}")) & 1) != 0
            || (objc_msgSend(v70, "markerTextAttachment"),
                v132 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v132,
                (isKindOfClass & 1) != 0))
          {
            objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 103);
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "objectForKeyedSubscript:", v30);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v87)
              goto LABEL_50;
            objc_msgSend(v74, "todo");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "todoWithDone:", 1);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setTodo:", v88);

LABEL_49:
LABEL_50:
            v75 = v133;
LABEL_70:
            objc_msgSend(v65, "textLists");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setIndent:", objc_msgSend(v89, "count") - 1);

            objc_msgSend(v74, "setNeedsListCleanup:", 1);
            goto LABEL_71;
          }
          v72 = (void *)MEMORY[0x1E0D63C90];
          v73 = 100;
        }
        objc_msgSend(v72, "paragraphStyleNamed:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
    }
    else
    {

    }
    objc_msgSend(v65, "headIndent");
    if (v76 <= 0.0)
    {
      if (objc_msgSend(v138, "length"))
      {
        v81 = objc_msgSend(v138, "length") != 1;
        objc_msgSend(v138, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CB3040], v81, 0);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v82, "intentKind") == 6)
        {
          objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          v84 = 0;
          if (v82)
          {
            do
            {
              ++v84;
              objc_msgSend(v82, "parentIntent");
              v85 = objc_claimAutoreleasedReturnValue();

              v82 = (void *)v85;
            }
            while (v85);
          }
          objc_msgSend(v83, "setBlockQuoteLevel:", v84);
          v82 = 0;
          v66 = v83;
        }
        v53 = (_QWORD *)MEMORY[0x1E0D63928];

        if (!v66)
          goto LABEL_74;
        goto LABEL_73;
      }
LABEL_72:
      v53 = (_QWORD *)MEMORY[0x1E0D63928];
      if (!v66)
      {
LABEL_74:

        v9 = v138;
        goto LABEL_75;
      }
LABEL_73:
      objc_msgSend(v66, "setAlignment:", objc_msgSend(v65, "alignment"));
      objc_msgSend(v66, "setWritingDirection:", objc_msgSend(v65, "baseWritingDirection"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v66, *v53);
      goto LABEL_74;
    }
    objc_msgSend(v65, "headIndent");
    v78 = v77;
    objc_msgSend(v65, "defaultTabInterval");
    v80 = vcvtpd_u64_f64(fabs(v78 / v79));
    objc_msgSend(MEMORY[0x1E0D63C90], "paragraphStyleNamed:", 3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v74, "setIndent:", v80);
LABEL_71:
    v66 = v74;
    goto LABEL_72;
  }
LABEL_75:
  objc_msgSend(v8, "objectForKeyedSubscript:", v63);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *v53);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  if (v6 && v90)
  {
    if (v91)
    {
      v93 = objc_msgSend(v91, "alignment");
      if (v93 == *MEMORY[0x1E0D63968])
      {
LABEL_86:
        v98 = objc_msgSend(v92, "writingDirection");
        if (v98 == objc_msgSend(v90, "baseWritingDirection"))
          goto LABEL_94;
        v99 = (id)objc_msgSend(v92, "mutableCopy");
LABEL_90:
        v100 = v99;

        objc_msgSend(v100, "setWritingDirection:", objc_msgSend(v90, "baseWritingDirection"));
        v101 = objc_msgSend(v100, "alignment");
        if (v101 == *MEMORY[0x1E0D63970] || (v102 = objc_msgSend(v100, "alignment"), v102 == *MEMORY[0x1E0D63978]))
          objc_msgSend(v100, "setAlignment:", *MEMORY[0x1E0D63968]);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v100, *v53);

LABEL_94:
        if (v6)
          goto LABEL_131;
        goto LABEL_95;
      }
      v94 = (id)objc_msgSend(v92, "mutableCopy");
    }
    else
    {
      v95 = objc_msgSend(v90, "alignment");
      if (v95 == *MEMORY[0x1E0D63968])
        goto LABEL_88;
      v94 = objc_alloc_init(MEMORY[0x1E0D63C90]);
    }
    v96 = v94;

    objc_msgSend(v96, "setAlignment:", *MEMORY[0x1E0D63968]);
    v97 = v96;

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v97, *v53);
    v92 = v97;
    if (v97)
      goto LABEL_86;
  }
  else
  {
    if (!v90)
      goto LABEL_94;
    if (v91)
      goto LABEL_86;
  }
LABEL_88:
  if (objc_msgSend(v90, "baseWritingDirection") != -1)
  {
    v99 = objc_alloc_init(MEMORY[0x1E0D63C90]);
    v92 = 0;
    goto LABEL_90;
  }
  v92 = 0;
  if (v6)
    goto LABEL_131;
LABEL_95:
  if (v15)
  {
    -[ICTTTextController styleForModelAttributes:](v136, "styleForModelAttributes:", v13);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "objectForKeyedSubscript:", v134);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointSize");
    if (v105 <= 0.0 || (objc_msgSend(v15, "pointSize"), v106 == INFINITY))
      v107 = v104;
    else
      v107 = v15;
    objc_msgSend(v107, "pointSize");
    v109 = v108;
    objc_msgSend(v104, "fontName");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontName");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v110, "isEqualToString:", v111);

    objc_msgSend(v104, "pointSize");
    v114 = round(v113);
    v115 = round(v109);
    v137 = v103;
    if ((v112 & 1) != 0 || !v92)
    {
LABEL_121:
      if (v112 && v114 == v115)
      {
LABEL_130:

        v9 = v138;
        goto LABEL_131;
      }
LABEL_123:
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D63918]);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "integerValue");

      v124 = objc_alloc(MEMORY[0x1E0D63C68]);
      if ((v112 & 1) != 0)
      {
        v125 = 0;
      }
      else
      {
        objc_msgSend(v15, "fontName");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v126 = 0.0;
      if (v114 != v115)
      {
        objc_msgSend(v15, "pointSize", 0.0);
        v126 = v127 / v12;
      }
      v128 = (void *)objc_msgSend(v124, "initWithName:size:hints:", v125, v123, v126);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v128, *MEMORY[0x1E0D63910]);

      if ((v112 & 1) == 0)
      goto LABEL_130;
    }
    if (!objc_msgSend(v92, "isHeader"))
    {
      LOBYTE(v112) = 0;
      goto LABEL_123;
    }
    v116 = objc_msgSend(v92, "style");
    if (v116 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForSubheadingText");
      v117 = objc_claimAutoreleasedReturnValue();
    }
    else if (v116 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForHeadingText");
      v117 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v116)
        objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
      else
        objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTitleText");
      v117 = objc_claimAutoreleasedReturnValue();
    }
    v118 = (void *)v117;
    v140 = 0;
    v139 = 0;
    objc_msgSend(MEMORY[0x1E0D63C68], "font:isBold:isItalic:", v15, (char *)&v140 + 1, (char *)&v139 + 1);
    objc_msgSend(MEMORY[0x1E0D63C68], "font:isBold:isItalic:", v118, &v140, &v139);
    objc_msgSend(v15, "familyName");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "familyName");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "isEqualToString:", v120) && HIBYTE(v140) == v140)
    {
      v135 = HIBYTE(v139);
      v121 = v139;

      if (v135 == v121)
      {
        objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D63918]);
        v112 = 1;
LABEL_120:

        goto LABEL_121;
      }
    }
    else
    {

    }
    v112 = 0;
    goto LABEL_120;
  }
LABEL_131:
  v129 = v13;

  return v129;
}

- (id)filterStyleAttributes:(id)a3 range:(_NSRange)a4
{
  return a3;
}

- (id)writingToolsIgnoredRangesForTextStorage:(id)a3 inEnclosingRange:(_NSRange)a4 note:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calculateDocumentController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v9, "calculateDocumentController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "expressionsIndexSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v12;
      v27[1] = 3221225472;
      v27[2] = __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke;
      v27[3] = &unk_1E5C24588;
      v28 = v10;
      objc_msgSend(v16, "enumerateRangesInRange:options:usingBlock:", location, length, 0, v27);

    }
  }
  objc_msgSend(v9, "textStorage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D63928];
  v22 = v12;
  v23 = 3221225472;
  v24 = __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke_2;
  v25 = &unk_1E5C21618;
  v26 = v10;
  v19 = v10;
  objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v18, location, length, 0, &v22);

  v20 = (void *)objc_msgSend(v19, "copy", v22, v23, v24, v25);
  return v20;
}

void __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __84__ICTTTextController_writingToolsIgnoredRangesForTextStorage_inEnclosingRange_note___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  if (objc_msgSend(a2, "isBlockQuote"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
}

+ (id)preferredFontForICTTTextStyle:(unsigned int)a3
{
  void *v3;
  id result;

  switch(a3)
  {
    case 0u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTitleText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForHeadingText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForSubheadingText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3u:
LABEL_4:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 4u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForFixedWidthText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      result = v3;
      break;
    default:
      switch(a3)
      {
        case 'd':
        case 'e':
        case 'f':
        case 'g':
          goto LABEL_4;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

- (BOOL)isForPrint
{
  return self->_isForPrint;
}

- (void)setIsForPrint:(BOOL)a3
{
  self->_isForPrint = a3;
}

- (BOOL)isForSiri
{
  return self->_isForSiri;
}

- (void)setIsForSiri:(BOOL)a3
{
  self->_isForSiri = a3;
}

- (double)bodyStyleFontSizeThreshold
{
  return self->_bodyStyleFontSizeThreshold;
}

- (double)headingStyleFontSizeThreshold
{
  return self->_headingStyleFontSizeThreshold;
}

- (void)setZoomController:(id)a3
{
  objc_storeStrong((id *)&self->_zoomController, a3);
}

- (void)setKeepNSTextTableAttributes:(BOOL)a3
{
  self->_keepNSTextTableAttributes = a3;
}

- (void)setDisableSingleLineA:(BOOL)a3
{
  self->_disableSingleLineA = a3;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (BOOL)showsEditorDebugTooltips
{
  return self->_showsEditorDebugTooltips;
}

- (void)setShowsEditorDebugTooltips:(BOOL)a3
{
  self->_showsEditorDebugTooltips = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomController, 0);
}

@end
