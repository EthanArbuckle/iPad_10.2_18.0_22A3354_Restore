@implementation NSAttributedString(PhotosUICore)

- (id)px_attributedStringByAddingAttributes:()PhotosUICore
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addAttributes:range:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (id)px_attributedStringByApplyingCapitalization:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a1;
  v5 = v4;
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      v15 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v5, "length");
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __80__NSAttributedString_PhotosUICore__px_attributedStringByApplyingCapitalization___block_invoke;
      v28[3] = &unk_1E51167B8;
      v18 = v15;
      v29 = v18;
      v30 = 2;
      objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 1027, v28);

      v19 = v18;
      return v19;
    }
    if (a3 == 1)
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      v31 = 0;
      v32 = 0;
      if (objc_msgSend(v5, "length"))
      {
        v7 = 0;
        do
        {
          v8 = v32;
          if (v32)
          {
            objc_msgSend(v5, "string");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "substringWithRange:", v31, v32);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "px_stringByApplyingCapitalization:", 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v7);
            objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v31, v32, v12);

            v8 = v32;
          }
          objc_msgSend(v5, "attributesAtIndex:effectiveRange:", v8 + v31, &v31);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v32 + v31;
          v7 = v13;
        }
        while (v14 < objc_msgSend(v5, "length"));

      }
      goto LABEL_14;
    }
    return v5;
  }
  objc_msgSend(v4, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "px_firstLetterRange");
  v24 = v23;

  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    return v5;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "substringWithRange:", v22, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "px_stringByApplyingCapitalization:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceCharactersInRange:withString:", v22, v24, v27);

LABEL_14:
  return v6;
}

- (id)px_attributedStringWithParagraphLineBreakMode:()PhotosUICore
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a1;
  v5 = objc_msgSend(v4, "length");
  v6 = (_QWORD *)MEMORY[0x1E0DC1178];
  if (v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], v5 - 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "lineBreakMode") != a3)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v11 = v10;

    objc_msgSend(v11, "setLineBreakMode:", a3);
    v12 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v12, "addAttribute:value:range:", *v6, v11, 0, v5);

    v4 = v12;
  }

  return v4;
}

- (id)px_attributedStringByDeletingCharactersInSet:()PhotosUICore
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSAttributedString+PhotosUICore.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characterSet"));

  }
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v5);
  v10 = v9;

  while (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "deleteCharactersInRange:", v8, v10);
    objc_msgSend(v6, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v5);
    v10 = v12;

  }
  v13 = (void *)objc_msgSend(v6, "copy");

  return v13;
}

- (id)px_stringByReplacingOccurrencesOfString:()PhotosUICore withString:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSAttributedString+PhotosUICore.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  }
  v9 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rangeOfString:", v7);
  v13 = v12;

  while (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v13, v8);
    objc_msgSend(v9, "string");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "rangeOfString:", v7);
    v13 = v15;

  }
  v16 = (void *)objc_msgSend(v9, "copy");

  return v16;
}

- (id)px_bulletPrefixAttributedStringWithBulletAttributes:()PhotosUICore isLeftToRight:
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "mutableCopy");
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (a4)
  {
    v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", CFSTR("● "), v6);

    objc_msgSend(v7, "insertAttributedString:atIndex:", v9, 0);
  }
  else
  {
    v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", CFSTR(" ●"), v6);

    objc_msgSend(v7, "appendAttributedString:", v9);
  }

  return v7;
}

- (BOOL)px_rangeExists:()PhotosUICore
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)objc_msgSend(a1, "length");
}

- (uint64_t)px_containsAttribute:()PhotosUICore
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NSAttributedString_PhotosUICore__px_containsAttribute___block_invoke;
  v8[3] = &unk_1E51167E0;
  v8[4] = &v9;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v8);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (double)px_sizeWithProposedWidth:()PhotosUICore maximumLines:drawingOptions:
{
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attributesAtIndex:effectiveRange:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E5149688, "stringByPaddingToLength:withString:startingAtIndex:", a4 - 1, CFSTR("\n"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v9);
  objc_msgSend(v11, "boundingRectWithSize:options:context:", a5, 0, a2, INFINITY);
  objc_msgSend(a1, "boundingRectWithSize:options:context:", a5, 0, a2, v12);
  if (a1)
  {
    objc_msgSend(a1, "attributesAtIndex:effectiveRange:", 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _PXLanguageRequiringLineHeightAdjustmentsForString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v17 = v16 == 0;
    else
      v17 = 1;
    if (v17)
    {
      v22 = v14;
    }
    else
    {
      objc_msgSend(v14, "fontDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CA8248];
      v27[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fontDescriptorByAddingAttributes:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v14, "pointSize");
      objc_msgSend(v21, "fontWithDescriptor:size:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 && CTFontGetLanguageAwareOutsets())
      {
        PXEdgeInsetsMake();
        sub_1A7AE3F38();
      }

    }
  }
  PXEdgeInsetsInsetSize();
  v24 = v23;

  return v24;
}

+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:
{
  return objc_msgSend(a1, "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:", a3, a4, 0);
}

+ (uint64_t)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", a3, a4, a5, 0);
}

+ (id)px_attributedStringWithHTMLString:()PhotosUICore defaultAttributes:emphasizedAttributes:italicizedAttributes:
{
  id v9;
  id v10;
  id v11;
  id v12;
  PXAttributedStringHTMLParser *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PXAttributedStringHTMLParser initWithHTMLString:defaultAttributes:]([PXAttributedStringHTMLParser alloc], "initWithHTMLString:defaultAttributes:", v12, v11);

  -[PXAttributedStringHTMLParser setEmphasizedAttributes:](v13, "setEmphasizedAttributes:", v10);
  -[PXAttributedStringHTMLParser setItalicizedAttributes:](v13, "setItalicizedAttributes:", v9);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", &stru_1E5149688, v11);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __130__NSAttributedString_PhotosUICore__px_attributedStringWithHTMLString_defaultAttributes_emphasizedAttributes_italicizedAttributes___block_invoke;
  v23[3] = &unk_1E5141098;
  v15 = v14;
  v24 = v15;
  -[PXAttributedStringHTMLParser setParsedAttributedStringBlock:](v13, "setParsedAttributedStringBlock:", v23);
  -[PXAttributedStringHTMLParser parse](v13, "parse");
  +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "wantsPseudostringsWithSpecialCharacters");

  if (v17)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    +[PXApplicationSettings sharedInstance](PXApplicationSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithSpecialCharacters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithString:", v21);
    objc_msgSend(v15, "insertAttributedString:atIndex:", v22, 0);

  }
  return v15;
}

+ (id)px_stringWithFormat:()PhotosUICore defaultAttributes:arguments:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
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
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  id v110;
  id v111;
  id obj;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  v109 = a4;
  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v111 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v127 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<#$^|"));
          objc_msgSend(v15, "appendString:", v14);
          objc_msgSend(v15, "appendString:", CFSTR("|^$#>"));
          objc_msgSend(v111, "setObject:forKey:", v13, v15);
          objc_msgSend(v8, "addObject:", v15);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v130, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v8, "count"))
  {
    v16 = v110;
    v19 = v110;
    v20 = 0;
    goto LABEL_21;
  }
  v16 = v110;
  if (objc_msgSend(v8, "count") == 1)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v125 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@"), &v125, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v125;
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v8, "count") == 2)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v124 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@"), &v124, v18, v22);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v124;
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v8, "count") == 3)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v123 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@"), &v123, v18, v22, v24);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v123;

    goto LABEL_19;
  }
  if (objc_msgSend(v8, "count") == 4)
  {
    v50 = (void *)MEMORY[0x1E0CB3940];
    v122 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@"), &v122, v51, v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    v20 = v122;

    v19 = (id)v55;
LABEL_41:

    goto LABEL_21;
  }
  if (objc_msgSend(v8, "count") == 5)
  {
    v56 = (void *)MEMORY[0x1E0CB3940];
    v121 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@"), &v121, v51, v57, v58, v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    v20 = v121;
LABEL_40:

    v19 = (id)v61;
    goto LABEL_41;
  }
  if (objc_msgSend(v8, "count") == 6)
  {
    v62 = (void *)MEMORY[0x1E0CB3940];
    v120 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@ %@"), &v120, v51, v57, v58, v59, v60, v63);
    v61 = objc_claimAutoreleasedReturnValue();
    v64 = v120;

    v20 = v64;
    goto LABEL_40;
  }
  if (objc_msgSend(v8, "count") == 7)
  {
    v65 = (void *)MEMORY[0x1E0CB3940];
    v119 = 0;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v66 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v66;
    objc_msgSend(v65, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@ %@ %@"), &v119, v66, v67, v106, v68, v69, v70, v71);
    v73 = objc_claimAutoreleasedReturnValue();
    v20 = v119;

    v19 = (id)v73;
  }
  else
  {
    if (objc_msgSend(v8, "count") == 8)
    {
      v107 = (void *)MEMORY[0x1E0CB3940];
      v118 = 0;
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v99 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@ %@ %@ %@"), &v118, v99, v74, v102, v75, v76, v77, v78, v79);
      v80 = objc_claimAutoreleasedReturnValue();
      v20 = v118;

      v19 = (id)v80;
      v81 = (void *)v99;
    }
    else
    {
      if (objc_msgSend(v8, "count") == 9)
      {
        v103 = (void *)MEMORY[0x1E0CB3940];
        v117 = 0;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v108 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@"), &v117, v108, v82, v100, v97, v83, v84, v85, v86, v87);
        v88 = objc_claimAutoreleasedReturnValue();
        v20 = v117;

        v19 = (id)v88;
      }
      else
      {
        if (objc_msgSend(v8, "count") != 10)
        {
          v25 = *MEMORY[0x1E0C99750];
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("px_stringWithFormat cannot take more than 10 input args"));
          v20 = 0;
          goto LABEL_24;
        }
        v101 = (void *)MEMORY[0x1E0CB3940];
        v116 = 0;
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v108 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 6);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 7);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", 9);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v110, CFSTR("%@ %@ %@ %@ %@ %@ %@ %@ %@ %@"), &v116, v108, v104, v98, v96, v89, v90, v91, v92, v93, v94);
        v95 = objc_claimAutoreleasedReturnValue();
        v20 = v116;

        v19 = (id)v95;
      }
      v81 = (void *)v108;
    }

  }
LABEL_21:
  if (!v19)
  {
    v25 = *MEMORY[0x1E0C99750];
LABEL_24:
    v105 = v20;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v25, CFSTR("px_stringWithFormat failed to make validated localized string with %td arguments for format: %@: %@"), objc_msgSend(v8, "count"), v16, v20);
    v19 = 0;
    goto LABEL_25;
  }
  v105 = v20;
LABEL_25:
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = objc_msgSend(v19, "length");
  v28 = objc_msgSend(v19, "rangeOfString:options:range:", CFSTR("|^$#>"), 6, 0, v27);
  if (v29)
  {
    v30 = v28;
    v31 = v29;
    v32 = objc_msgSend(v19, "rangeOfString:options:range:", CFSTR("<#$^|"), 6, 0, v28);
    if (v33)
    {
      v34 = v32;
      do
      {
        v35 = v30 + v31;
        objc_msgSend(v19, "substringWithRange:", v30 + v31, v27 - (v30 + v31));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v36);
        v37 = v19;
        objc_msgSend(v19, "substringWithRange:", v34, v35 - v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v26, "addObject:", v39);
          v27 = v34;
        }
        else
        {
          objc_msgSend(v26, "addObject:", CFSTR("|^$#>"));
          v27 = v30;
        }

        v19 = v37;
        v40 = objc_msgSend(v37, "rangeOfString:options:range:", CFSTR("|^$#>"), 6, 0, v27);
        if (!v41)
          break;
        v30 = v40;
        v31 = v41;
        v34 = objc_msgSend(v37, "rangeOfString:options:range:", CFSTR("<#$^|"), 6, 0, v40);
      }
      while (v42);
    }
  }
  objc_msgSend(v19, "substringWithRange:", 0, v27);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v43);

  v44 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __84__NSAttributedString_PhotosUICore__px_stringWithFormat_defaultAttributes_arguments___block_invoke;
  v113[3] = &unk_1E5140938;
  v45 = v44;
  v114 = v45;
  v115 = v109;
  v46 = v109;
  objc_msgSend(v26, "enumerateObjectsWithOptions:usingBlock:", 2, v113);
  v47 = v115;
  v48 = v45;

  return v48;
}

+ (uint64_t)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:
{
  return objc_msgSend(a1, "px_thumbnailVideoDurationAttributedString:layoutDirection:sizeClass:", a3, a4, 0);
}

+ (uint64_t)px_thumbnailVideoDurationAttributedString:()PhotosUICore layoutDirection:sizeClass:
{
  return PXAttributedStringForBadgeText();
}

@end
