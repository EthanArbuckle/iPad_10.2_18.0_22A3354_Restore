@implementation TLKFontUtilities

+ (void)cacheInlineImagesForRichText:(id)a3 inView:(id)a4 updateHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "effectiveScreenScale");
  v11 = v10;
  v23 = v8;
  +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDark");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "formattedTextItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "tlkImage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "cachedImageForScale:isDarkStyle:", v13, v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __70__TLKFontUtilities_cacheInlineImagesForRichText_inView_updateHandler___block_invoke;
            v24[3] = &unk_1E5C07218;
            v22 = v20;
            v25 = v22;
            v27 = v11;
            v28 = v13;
            v26 = v9;
            objc_msgSend(v22, "loadImageWithScale:isDarkStyle:completionHandler:", v13, v24, v11);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

}

+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 coloredRanges:(id)a7 nonColoredRanges:(id)a8 rangesForNonTemplateImageAttachments:(id)a9 rangesForTemplateImageAttachments:(id)a10 font:(id)a11 isButton:(BOOL)a12 scale:(double)a13 isDark:(BOOL)a14
{
  id v18;
  void *v19;
  _UNKNOWN **v20;
  void *v21;
  char isKindOfClass;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  _UNKNOWN **v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  BOOL v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id obj;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v63 = a4;
  v58 = a7;
  v57 = a8;
  v54 = a9;
  v55 = a10;
  v64 = a11;
  if (v18)
    v65 = (void *)objc_opt_new();
  else
    v65 = 0;
  objc_msgSend(v18, "formattedTextItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = &off_1E5C06000;
  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v18, "formattedTextItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E5C07958);
    objc_msgSend(v65, "appendAttributedString:", v19);
  }

LABEL_8:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v53 = v18;
  objc_msgSend(v18, "formattedTextItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  v24 = v65;
  if (v23)
  {
    v25 = v23;
    v66 = *(_QWORD *)v68;
    v56 = *MEMORY[0x1E0DC3288];
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v68 != v66)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;
        objc_opt_class();
        v30 = objc_opt_isKindOfClass();
        if ((v30 & 1) != 0)
        {
          objc_msgSend(v27, "string");
          a4 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a4, "length"))
          {

LABEL_22:
            v32 = v20;
            LOBYTE(v52) = a14;
            objc_msgSend(a1, "attributedStringForFormattedText:appearance:prominence:alignment:font:isButton:scale:isDark:", v27, v63, a5, a6, v64, a12, a13, v52);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", objc_msgSend(v24, "length"), objc_msgSend(v33, "length"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(a1, "formattedTextItemIsColoredImage:", v27);
            if ((v35 & 1) == 0)
            {
              if (objc_msgSend(v27, "color"))
                v36 = v58;
              else
                v36 = v57;
              objc_msgSend(v36, "addObject:", v34);
            }
            if (!objc_msgSend(v33, "length") || !v29)
              goto LABEL_47;
            objc_msgSend(v33, "attribute:atIndex:effectiveRange:", v56, 0, 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37)
              goto LABEL_46;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = objc_msgSend(v37, "isPlaceholder");
              v39 = v38;
              if ((v35 & 1) != 0)
              {
                if (v38)
                {
                  v40 = v55;
                  goto LABEL_36;
                }
LABEL_35:
                v40 = v54;
LABEL_36:
                v41 = v40;
LABEL_45:
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v37, v34);

                v20 = v32;
LABEL_46:

LABEL_47:
                v24 = v65;
                if (v33)
                {
                  objc_msgSend(v65, "appendAttributedString:", v33);

                }
                goto LABEL_49;
              }
            }
            else
            {
              if ((v35 & 1) != 0)
                goto LABEL_35;
              v39 = 0;
            }
            objc_msgSend(v29, "tlkImage");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "isTemplate");
            v44 = v55;
            if (v43)
            {
              v45 = objc_msgSend(v29, "color") ? v39 : 1;
              v46 = v45 == 0;
              v44 = v54;
              if (!v46)
                v44 = v55;
            }
            v41 = v44;

            goto LABEL_45;
          }
        }
        objc_msgSend(v29, "tlkImage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v30 & 1) != 0)
        if (v31)
          goto LABEL_22;
LABEL_49:

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v25);
  }

  if (objc_msgSend(v24, "length")
    || (objc_msgSend(v53, "text"), v48 = (void *)objc_claimAutoreleasedReturnValue(), v48, !v48))
  {
    v47 = v24;
  }
  else
  {
    objc_msgSend(v53, "text");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKFormattedText formattedTextWithString:](TLKFormattedText, "formattedTextWithString:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = a14;
    objc_msgSend(a1, "attributedStringForFormattedText:appearance:prominence:alignment:font:isButton:scale:isDark:", v50, v63, a5, a6, v64, a12, a13, v52);
    v47 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v47;
}

+ (id)attributedStringForFormattedText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v16;
    v20 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v19, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = 0;
      v22 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v16, "tlkImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uiImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v21, "cachedImageForScale:isDarkStyle:", a10, a9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v21, "isTemplate"))
    {
      +[TLKImage templateImageForImage:](TLKImage, "templateImageForImage:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v24;
    }
    objc_msgSend(v21, "size");
    objc_msgSend(a1, "textAttachmentForImage:size:cornerRoundingStyle:appearance:", v23, objc_msgSend(v21, "cornerRoundingStyle"), v17, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v28, "mutableCopy");

    v19 = 0;
  }

LABEL_11:
  v29 = objc_msgSend(v22, "length");
  v30 = objc_msgSend(v16, "isEmphasized");
  if (v17 && v30)
  {
    if (a5 == 3)
      v31 = 2;
    else
      v31 = a5 == 2;
    if (a8)
      objc_msgSend(v17, "buttonColorForProminence:", v31);
    else
      objc_msgSend(v17, "colorForProminence:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v32, 0, v29);

  }
  v33 = v18;
  v34 = v33;
  if (objc_msgSend(v16, "isBold"))
  {
    objc_msgSend(v33, "fontDescriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "fontDescriptorWithSymbolicTraits:mask:", 2, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v36, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC32A0], v34, 0, v29);
  if (objc_msgSend(v16, "color"))
  {
    objc_msgSend(v17, "textColorForColor:", objc_msgSend(v16, "color"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v37, 0, v29);

  }
  if (v19 && objc_msgSend(v19, "encapsulationStyle"))
  {
    v38 = (void *)objc_opt_new();
    objc_msgSend(v38, "setStyle:", objc_msgSend(v19, "encapsulationStyle") == 2);
    objc_msgSend(v22, "addAttribute:value:range:", *MEMORY[0x1E0CA80D0], v38, 0, v29);

  }
  v39 = v22;

  return v39;
}

+ (id)attributedStringForRichText:(id)a3 appearance:(id)a4 prominence:(unint64_t)a5 alignment:(int64_t)a6 font:(id)a7 isButton:(BOOL)a8 scale:(double)a9 isDark:(BOOL)a10
{
  uint64_t v11;

  BYTE1(v11) = a10;
  LOBYTE(v11) = a8;
  return +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:", a3, a4, a5, a6, 0, 0, a9, 0, 0, a7, v11);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:isMacStyle:", a3, a4, a5, 0);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 isMacStyle:(BOOL)a6
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMacStyle:", a3, a4, a5, 0, a6, *MEMORY[0x1E0DC4B90]);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMacStyle:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v26[4];
  id v27;
  id v28;
  double v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;

  v8 = a8;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@-%@"), v13, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__TLKFontUtilities_cachedFontForTextStyle_isShort_isBold_useCustomWeight_customFontWeight_isMacStyle___block_invoke;
  v26[3] = &unk_1E5C071A0;
  v27 = v13;
  v28 = a1;
  v30 = v12;
  v31 = v11;
  v32 = a6;
  v29 = a7;
  v33 = v8;
  v21 = v13;
  objc_msgSend(a1, "cachedFontForKey:creatorBlock:", v20, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)cachedFontForKey:(id)a3 creatorBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (cachedFontForKey_creatorBlock__onceToken != -1)
    dispatch_once(&cachedFontForKey_creatorBlock__onceToken, &__block_literal_global_3);
  objc_msgSend((id)cachedFontForKey_creatorBlock__fontCache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v6[2](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)cachedFontForKey_creatorBlock__fontCache, "setObject:forKey:", v7, v5);
  }

  return v7;
}

uint64_t __102__TLKFontUtilities_cachedFontForTextStyle_isShort_isBold_useCustomWeight_customFontWeight_isMacStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "preferredFontWithTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMonoSpaced:isMacStyle:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58), 0, *(unsigned __int8 *)(a1 + 59), *(double *)(a1 + 48));
}

+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5 useCustomWeight:(BOOL)a6 customFontWeight:(double)a7 isMonoSpaced:(BOOL)a8 isMacStyle:(BOOL)a9
{
  _BOOL4 v9;
  unsigned int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v9 = a6;
  v24[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    v11 = 0x8000;
  else
    v11 = 0;
  v12 = v11 | 2;
  if (a6)
    v12 = v11;
  if (a5)
    v11 = v12;
  if (a8)
    v13 = v11 | 0x400;
  else
    v13 = v11;
  objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:isMacStyle:", a3, v13, a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v23 = *MEMORY[0x1E0DC4A40];
    v21 = *MEMORY[0x1E0DC4BA8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
  }
  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v14, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)preferredFontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4 isMacStyle:(BOOL)a5
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", a3, *(_QWORD *)&a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __50__TLKFontUtilities_cachedFontForKey_creatorBlock___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_opt_new();
  v1 = (void *)cachedFontForKey_creatorBlock__fontCache;
  cachedFontForKey_creatorBlock__fontCache = v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC48E8], 0, 0, &__block_literal_global_17);

}

void __50__TLKFontUtilities_cachedFontForKey_creatorBlock___block_invoke_2()
{
  id v0;

  objc_msgSend((id)cachedFontForKey_creatorBlock__fontCache, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("TLKContentSizeCategoryDidChangeNotification"), 0);

}

+ (id)cachedFontForTextStyle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", v4, TLKSnippetModernizationEnabled() ^ 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)cachedFontForMacTextStyle:(id)a3
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:isMacStyle:", a3, 0, 0, 1);
}

+ (id)cachedFontForTextStyle:(id)a3 isBold:(BOOL)a4 isMacStyle:(BOOL)a5
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:isMacStyle:", a3, 0, a4, a5);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMacStyle:", a3, a4, 0, 1, 0, a5);
}

+ (id)cachedFontForTextStyle:(id)a3 isShort:(BOOL)a4 fontWeight:(double)a5 isMacStyle:(BOOL)a6
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMacStyle:", a3, a4, 0, 1, a6, a5);
}

+ (id)shortSubheadBoldFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 1, 1);
}

+ (id)footnoteFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AB8], TLKSnippetModernizationEnabled() ^ 1, 0);
}

+ (id)shortFootnoteFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AB8], 1, 0);
}

+ (id)shortBodyFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A88], 1, 0);
}

+ (id)boldBodyFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A88], 0, 1);
}

+ (id)subheadFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 0, 0);
}

+ (id)subheadBoldFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 0, 1);
}

+ (id)shortSubheadFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4B10], 1, 0);
}

+ (id)captionFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], 0, 0);
}

+ (id)calloutFont
{
  return (id)objc_msgSend(a1, "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A90], 0, 0);
}

+ (id)thinFontOfSize:(double)a3 grade:(unint64_t)a4
{
  CTFontRef UIFontForLanguage;
  void *CopyOfSystemUIFontWithGrade;

  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, a3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);
  return CopyOfSystemUIFontWithGrade;
}

+ (id)preferredFontForTextStyle:(id)a3
{
  return (id)objc_msgSend(a1, "preferredFontForTextStyle:maximumContentSizeCategory:", a3, *MEMORY[0x1E0DC4938]);
}

+ (id)preferredFontForTextStyle:(id)a3 maximumContentSizeCategory:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", a3, a4);
}

+ (id)preferredFontWithTextStyle:(id)a3 isShort:(BOOL)a4 isBold:(BOOL)a5
{
  return (id)objc_msgSend(a1, "preferredFontWithTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMonoSpaced:isMacStyle:", a3, a4, a5, 0, 0, 0, *MEMORY[0x1E0DC4B90]);
}

+ (id)preferredMonospacedFontForTextStyle:(id)a3
{
  return (id)objc_msgSend(a1, "preferredFontWithTextStyle:isShort:isBold:useCustomWeight:customFontWeight:isMonoSpaced:isMacStyle:", a3, 0, 0, 0, 1, 0, *MEMORY[0x1E0DC4B90]);
}

+ (BOOL)formattedTextItemIsColoredImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "tlkImage"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isTemplate") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (id)textAttachmentForImage:(id)a3 size:(CGSize)a4 cornerRoundingStyle:(unint64_t)a5 appearance:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  double v26;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a6;
  if (+[TLKImage imageIsSymbol:](TLKImage, "imageIsSymbol:", v10)
    && (width == *MEMORY[0x1E0C9D820] ? (v12 = height == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v12 = 0),
        v12
     && (objc_msgSend(MEMORY[0x1E0DC33D0], "textAttachmentWithImage:", v10),
         (v13 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v14 = (void *)v13;
  }
  else
  {
    v14 = (void *)objc_opt_new();
    if (!v10)
    {
      if (a5)
      {
        objc_msgSend(v11, "colorForProminence:", 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TLKUtilities testImageWithSize:color:](TLKUtilities, "testImageWithSize:color:", v15, width, height);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uiImage");
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = (id)objc_opt_new();
      }
      objc_msgSend(v14, "setIsPlaceholder:", 1);
    }
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "cornerRadiusForSize:roundingStyle:", a5, width, height);
    v19 = v18;

    if (v19 != 0.0)
    {
      v20 = +[TLKImage isTemplateImage:](TLKImage, "isTemplateImage:", v10);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", width, height);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __79__TLKFontUtilities_textAttachmentForImage_size_cornerRoundingStyle_appearance___block_invoke;
      v24[3] = &unk_1E5C071C8;
      v26 = v19;
      v25 = v10;
      objc_msgSend(v21, "imageWithActions:", v24);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        +[TLKImage templateImageForImage:](TLKImage, "templateImageForImage:", v10);
        v22 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v22;
      }

    }
    objc_msgSend(v14, "setImage:", v10);
    objc_msgSend(v14, "setSize:", width, height);
  }

  return v14;
}

void __79__TLKFontUtilities_textAttachmentForImage_size_cornerRoundingStyle_appearance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC3508];
  v4 = a2;
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addClip");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "format");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "drawInRect:");

}

+ (id)clearTextAttachmentForTextAttachment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TLKImage applyTintColor:toImage:](TLKImage, "applyTintColor:toImage:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textAttachmentForImage:size:cornerRoundingStyle:appearance:", v11, 0, 0, v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)updateAttributedStringUnderlineStyle:(id)a3 isUnderlineVisible:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = *MEMORY[0x1E0DC3320];
  if (!a4)
  {
    objc_msgSend(v5, "removeAttribute:range:", v7, 0, v6);
    goto LABEL_5;
  }
  objc_msgSend(v5, "addAttribute:value:range:", v7, &unk_1E5C16518, 0, v6);
  if ((objc_msgSend(v5, "containsAttachmentsInRange:", 0, v6) & 1) == 0)
  {
LABEL_5:
    v13 = v5;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC3288];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__TLKFontUtilities_updateAttributedStringUnderlineStyle_isUnderlineVisible___block_invoke;
  v15[3] = &unk_1E5C071F0;
  v16 = v8;
  v10 = v5;
  v17 = v10;
  v11 = v8;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v6, 0, v15);
  v12 = v10;

LABEL_6:
  return v5;
}

void __76__TLKFontUtilities_updateAttributedStringUnderlineStyle_isUnderlineVisible___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;

  v7 = a2;
  if (v7)
  {
    v20 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v20;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = a3 + 1;
      v10 = 1 - a4;
      do
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v9 - 2));

        --v9;
        --v10;
      }
      while ((v13 & 1) != 0);
      v14 = v9 - v10;
      if (v9 - v10 >= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "length"))
      {
        v19 = -v10;
      }
      else
      {
        v15 = 0;
        do
        {
          v16 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", v14 + v15));

          if (!v18)
            break;
          ++v15;
        }
        while (v14 + v15 < (unint64_t)objc_msgSend(*(id *)(a1 + 40), "length"));
        v19 = v15 - v10;
      }
      objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC3320], v9, v19);
      v7 = v20;
    }
  }

}

uint64_t __70__TLKFontUtilities_cacheInlineImagesForRichText_inView_updateHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "cacheImage:forScale:isDarkStyle:", a2, *(unsigned __int8 *)(v2 + 56), *(double *)(v2 + 48));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

@end
