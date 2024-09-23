@implementation TIKeyboardSecureCandidateTextRendering

+ (CGColor)_newCgColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (_newCgColorWithRed_green_blue_alpha__onceToken != -1)
    dispatch_once(&_newCgColorWithRed_green_blue_alpha__onceToken, &__block_literal_global_3358);
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  return CGColorCreate((CGColorSpaceRef)_newCgColorWithRed_green_blue_alpha__colorSpace, components);
}

+ (id)truncatedWidthsForItemWidths:(id)a3 availableWidth:(double)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  double v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[4];
  id v33;
  double v34;
  _QWORD v35[4];
  id v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v8 = v5;
LABEL_5:
    v7 = v8;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(v7, "addObject:", &unk_1EA1408D0);
        ++v17;
      }
      while (v17 < objc_msgSend(v5, "count"));
    }
    goto LABEL_6;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "doubleValue");
        v14 = v14 + v16;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }

  if (v14 <= a4)
  {
    v8 = v10;
    goto LABEL_5;
  }
  v18 = (void *)objc_msgSend(v10, "mutableCopy");
  v19 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v20 = (void *)objc_opt_new();
    if (objc_msgSend(v18, "count"))
    {
      v21 = 0;
      v22 = 0.0;
      v23 = 0.0;
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        if (v26 <= v23)
        {
          v27 = v23;
          v23 = v22;
        }
        else
        {
          objc_msgSend(v20, "removeAllIndexes");
          v27 = v26;
        }
        if (v26 == v27)
        {
          objc_msgSend(v20, "addIndex:", v21);
        }
        else if (v26 > v23)
        {
          v23 = v26;
        }
        ++v21;
        v28 = v23;
        v22 = v23;
        v23 = v27;
      }
      while (v21 < objc_msgSend(v18, "count"));
    }
    else
    {
      v27 = 0.0;
      v28 = 0.0;
    }
    v29 = v14 - (double)(unint64_t)objc_msgSend(v20, "count") * (v27 - v28);
    if (v29 < a4)
      break;
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke_2;
    v32[3] = &unk_1EA0FBE30;
    v7 = v18;
    v33 = v7;
    v34 = v28;
    objc_msgSend(v20, "enumerateIndexesUsingBlock:", v32);

    v14 = v29;
    if (v29 <= a4)
      goto LABEL_6;
  }
  v30 = a4 - (v14 - (double)(unint64_t)objc_msgSend(v20, "count") * v27);
  v31 = v30 / (double)(unint64_t)objc_msgSend(v20, "count");
  v35[0] = v19;
  v35[1] = 3221225472;
  v35[2] = __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke;
  v35[3] = &unk_1EA0FBE30;
  v7 = v18;
  v36 = v7;
  v37 = v31;
  objc_msgSend(v20, "enumerateIndexesUsingBlock:", v35);

LABEL_6:
  return v7;
}

+ (BOOL)_textRunsHaveFixedFontSize:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "minFontSize", (_QWORD)v14);
        v10 = v9;
        objc_msgSend(v8, "maxFontSize");
        if (v10 != v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (__CFAttributedString)_newAttributedStringWithText:(id)a3 font:(__CTFont *)a4 color:(CGColor *)a5
{
  __CFString *v7;
  __CFDictionary *Mutable;
  __CFAttributedString *v9;

  v7 = (__CFString *)a3;
  Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8550], a5);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8188], a4);
  v9 = CFAttributedStringCreate(0, v7, Mutable);

  CFRelease(Mutable);
  return v9;
}

+ (void)_handleEllipsisTruncationForTextRuns:(id)a3 textRunResponses:(id)a4 inAvailableWidth:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  v11 = v9;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v57 != v13)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "allowTruncation") & 1) != 0)
        {
          v44 = a1;

          objc_msgSend(v9, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "strings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v19 = v17;
            do
            {
              objc_msgSend(v11, "addObject:", &unk_1EA1408D0, v44);
              objc_msgSend(v18, "addObject:", &unk_1EA1408D0);
              --v19;
            }
            while (v19);
          }
          v49 = v18;
          if (objc_msgSend(v9, "count", v44))
          {
            v20 = 0;
            v46 = v9;
            do
            {
              objc_msgSend(v9, "objectAtIndexedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v20;
              objc_msgSend(v47, "objectAtIndexedSubscript:", v20);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                for (j = 0; j != v17; ++j)
                {
                  v23 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v11, "objectAtIndexedSubscript:", j);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "doubleValue");
                  v26 = v25;
                  objc_msgSend(v50, "widths");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "objectAtIndexedSubscript:", j);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "doubleValue");
                  objc_msgSend(v23, "numberWithDouble:", v26 + v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "setObject:atIndexedSubscript:", v30, j);

                  if ((objc_msgSend(v21, "allowTruncation") & 1) == 0)
                  {
                    v31 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v49, "objectAtIndexedSubscript:", j);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "doubleValue");
                    v34 = v33;
                    objc_msgSend(v50, "widths");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "objectAtIndexedSubscript:", j);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "doubleValue");
                    objc_msgSend(v31, "numberWithDouble:", v34 + v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "setObject:atIndexedSubscript:", v38, j);

                  }
                }
              }

              v20 = v48 + 1;
              v9 = v46;
            }
            while (v48 + 1 < (unint64_t)objc_msgSend(v46, "count"));
          }
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count"))
          {
            v40 = 0;
            do
            {
              objc_msgSend(v11, "objectAtIndexedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              v43 = v42;

              if (v43 > a5)
                objc_msgSend(v39, "addIndex:", v40);
              ++v40;
            }
            while (v40 < objc_msgSend(v11, "count"));
          }
          if (objc_msgSend(v39, "count"))
          {
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke;
            v51[3] = &unk_1EA0FBE80;
            v52 = v9;
            v53 = v47;
            v54 = v45;
            v55 = a5;
            objc_msgSend(v39, "enumerateIndexesUsingBlock:", v51);

          }
          goto LABEL_29;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v12)
        continue;
      break;
    }
    v11 = v9;
  }
LABEL_29:

}

+ (id)_requestLayoutForSimplifiedTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  CFIndex v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  const void *ValueAtIndex;
  void *v30;
  void *v31;
  void *v32;
  const __CFDictionary *v33;
  const __CTFontDescriptor *v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  const __CTFont *UIFontForLanguage;
  const __CTFont *v40;
  const __CFAttributedString *v41;
  const __CTLine *v42;
  double TypographicBounds;
  double v44;
  BOOL v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  double v54;
  double v55;
  id v56;
  id v57;
  unint64_t v58;
  void *v59;
  void *v61;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  double (**v67)(void *, _QWORD, double, double);
  id v68;
  unint64_t v69;
  __CFArray *theArray;
  _QWORD *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  _QWORD aBlock[5];
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "strings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v13, "count");

  v68 = a1;
  if (objc_msgSend(a1, "_textRunsHaveFixedFontSize:", v8))
    v14 = 1;
  else
    v14 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke;
  aBlock[3] = &__block_descriptor_40_e14_d32__0d8d16Q24l;
  v69 = v14 - 1;
  aBlock[4] = v14 - 1;
  v67 = (double (**)(void *, _QWORD, double, double))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v75 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "count");
  theArray = CFArrayCreateMutable(0, v15, MEMORY[0x1E0C9B378]);
  v16 = malloc_type_malloc(8 * objc_msgSend(v11, "count"), 0x100004000313F17uLL);
  v17 = v16;
  v72 = v11;
  v63 = v14;
  if (v14)
  {
    v74 = 0;
    v65 = *MEMORY[0x1E0CA81D8];
    v66 = *MEMORY[0x1E0CA8380];
    v73 = v10;
    v71 = v16;
LABEL_6:
    while (2)
    {
      objc_msgSend(v75, "removeAllObjects");
      CFArrayRemoveAllValues(theArray);
      if (v64)
      {
        v18 = 0;
        v19 = 1;
        while (1)
        {
          if (objc_msgSend(v11, "count"))
          {
            v20 = 0;
            do
              v17[v20++] = 0;
            while (v20 < objc_msgSend(v11, "count"));
          }
          if (objc_msgSend(v10, "count"))
            break;
LABEL_30:
          ++v18;
          v17 = v71;
          v11 = v72;
          if (v18 == v64)
          {
            if (!(v19 & 1 | (++v74 == v63)))
              goto LABEL_6;
            goto LABEL_34;
          }
        }
        v21 = 0;
        while (1)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "strings");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v22, "widthGroup");
          objc_msgSend(v72, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;

          if (v18)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(theArray, v21);
          }
          else
          {
            v80 = v66;
            v81[0] = CFSTR(".SFUISymbols-Regular");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

            v79 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v77 = v65;
            v78 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
            v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            v34 = CTFontDescriptorCreateWithAttributes(v33);

            objc_msgSend(v22, "minFontSize");
            v36 = v35;
            objc_msgSend(v22, "maxFontSize");
            v38 = v67[2](v67, v74, v36, v37);
            UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, v38, 0);
            ValueAtIndex = CTFontCreateCopyWithAttributes(UIFontForLanguage, 0.0, 0, v34);
            CFRelease(v34);
            v40 = UIFontForLanguage;
            v10 = v73;
            CFRelease(v40);
            CFArrayAppendValue(theArray, ValueAtIndex);
            CFRelease(ValueAtIndex);

          }
          if (objc_msgSend(v24, "length"))
          {
            v41 = (const __CFAttributedString *)objc_msgSend(v68, "_newAttributedStringWithText:font:color:", v24, ValueAtIndex, objc_msgSend(v22, "color"));
            v42 = CTLineCreateWithAttributedString(v41);
            CFRelease(v41);
            TypographicBounds = CTLineGetTypographicBounds(v42, 0, 0, 0);
          }
          else
          {
            if (_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__onceToken != -1)
              dispatch_once(&_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__onceToken, &__block_literal_global_58);
            v42 = (const __CTLine *)CFRetain((CFTypeRef)_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__emptyCtLine);
            TypographicBounds = 0.0;
          }
          v44 = TypographicBounds + *(double *)&v71[v25];
          *(double *)&v71[v25] = v44;
          v45 = v44 <= v28;
          if (v44 > v28 && v74 != v69)
            break;
          v47 = (void *)MEMORY[0x1DF0A2708]();
          if (v18)
          {
            objc_msgSend(v75, "objectAtIndexedSubscript:", v21);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[TISCTextRunResponse textRunResponseWithFont:](TISCTextRunResponse, "textRunResponseWithFont:", ValueAtIndex);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObject:", v48);
          }
          v19 &= v45;
          CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(v48, "ctLines"), v42);
          CFRelease(v42);
          objc_msgSend(v48, "widths");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", TypographicBounds);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v50);

          objc_autoreleasePoolPop(v47);
          ++v21;
          v10 = v73;
          if (v21 >= objc_msgSend(v73, "count"))
            goto LABEL_30;
        }
        CFRelease(v42);

        ++v74;
        v17 = v71;
        v11 = v72;
        if (v74 != v63)
          continue;
      }
      break;
    }
  }
LABEL_34:
  CFRelease(theArray);
  free(v17);
  v51 = objc_msgSend(v75, "count");
  if (objc_msgSend(v11, "count"))
  {
    v52 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "doubleValue");
      v55 = v54;

      v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v10, "count"))
      {
        v58 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v59, "widthGroup") == v52 && v58 < v51)
          {
            objc_msgSend(v56, "addObject:", v59);
            objc_msgSend(v75, "objectAtIndexedSubscript:", v58);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addObject:", v61);

          }
          ++v58;
        }
        while (v58 < objc_msgSend(v10, "count"));
      }
      objc_msgSend(v68, "_handleEllipsisTruncationForTextRuns:textRunResponses:inAvailableWidth:", v56, v57, v55);

      ++v52;
      v11 = v72;
    }
    while (v52 < objc_msgSend(v72, "count"));
  }

  return v75;
}

+ (id)requestLayoutForTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v14), "truncationSentinel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x1DF0A2708]();
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = MEMORY[0x1E0C809B0];
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke;
            v31[3] = &unk_1EA0FBEE8;
            v32 = v20;
            v33 = v19;
            v22 = v19;
            v23 = v20;
            objc_msgSend(v10, "enumerateObjectsUsingBlock:", v31);
            objc_msgSend(a1, "_requestLayoutForSimplifiedTextRuns:inWidthGroups:steps:", v23, v9, a5);
            v30[0] = 0;
            v30[1] = v30;
            v30[2] = 0x2020000000;
            v30[3] = 0;
            v26[0] = v21;
            v26[1] = 3221225472;
            v26[2] = __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke_2;
            v26[3] = &unk_1EA0FBF10;
            v27 = (id)objc_claimAutoreleasedReturnValue();
            v29 = v30;
            v16 = v17;
            v28 = v16;
            v24 = v27;
            objc_msgSend(v22, "enumerateIndexesUsingBlock:", v26);

            _Block_object_dispose(v30, 8);
            objc_autoreleasePoolPop(v18);
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(a1, "_requestLayoutForSimplifiedTextRuns:inWidthGroups:steps:", v10, v9, a5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_13:

  return v16;
}

+ (double)_totalWidthForCell:(unint64_t)a3 fromTextRunResponses:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "widths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v9 = v9 + v13;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

+ (id)_defaultLayoutTraitsForTraits:(id)a3
{
  id v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double (**v23)(_QWORD, double, double);
  __n128 v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[7];
  char v68;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DBDC48]);
  v5 = objc_msgSend(v3, "isCandidateUI");
  objc_msgSend(v3, "headerTextTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDC50], "lightGrayColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v3, "inputTextTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDC50], "whiteColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v3, "singleCellHeight");
  v17 = v16;
  objc_msgSend(v3, "screenScale");
  v19 = 1.0 / v18;
  objc_msgSend(v3, "screenScale");
  v21 = 2.0 / v20;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __72__TIKeyboardSecureCandidateTextRendering__defaultLayoutTraitsForTraits___block_invoke;
  v67[3] = &__block_descriptor_57_e11_d24__0d8d16l;
  v68 = v5;
  v22 = 55.0 - 2.0 / v20;
  *(double *)&v67[4] = v19;
  *(double *)&v67[5] = 2.0 / v20;
  *(double *)&v67[6] = v17;
  v23 = (double (**)(_QWORD, double, double))_Block_copy(v67);
  if (v17 >= v22 + -0.1)
  {
    objc_msgSend(v4, "setHeaderInliningBehavior:", 2);
    v30 = (void *)MEMORY[0x1E0DBDC60];
    v31 = v23[2](v23, 33.0, 55.0);
    if (v5)
      v32 = 15.0;
    else
      v32 = 11.0;
    if (v5)
      v33 = 15.0;
    else
      v33 = 14.0;
    objc_msgSend(v30, "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, 18.0, v32, v31, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInOnlyLine:", v34);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 18.0, v32, v23[2](v23, 33.0, 55.0), 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInOnlyLine:", v35);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 15.0, v32, v23[2](v23, 24.0, 55.0), 17.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInFirstAndSecondLines:", v36);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v33, v32, v23[2](v23, 24.0, 55.0), 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInFirstLine:", v37);

    v38 = (void *)MEMORY[0x1E0DBDC60];
    v39 = v23[2](v23, 41.0, 55.0);
    v40 = 15.0;
    goto LABEL_36;
  }
  if (v17 >= 45.0 - v21 + -0.1)
  {
    objc_msgSend(v4, "setHeaderInliningBehavior:", 3);
    v41 = (void *)MEMORY[0x1E0DBDC60];
    v42 = v23[2](v23, 31.0, 45.0);
    if (v5)
      v32 = 15.0;
    else
      v32 = 11.0;
    if (v5)
      v43 = 17.0;
    else
      v43 = 14.0;
    objc_msgSend(v41, "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 18.0, v32, v42, 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInOnlyLine:", v44);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 17.0, v32, v23[2](v23, 18.0, 45.0), 19.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInFirstAndSecondLines:", v45);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v43, v32, v23[2](v23, 18.0, 45.0), 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInFirstLine:", v46);

    v38 = (void *)MEMORY[0x1E0DBDC60];
    v39 = v23[2](v23, 37.0, 45.0);
    v40 = 17.0;
LABEL_36:
    v47 = v38;
    v48 = v32;
LABEL_37:
    objc_msgSend(v47, "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, v40, v48, v39, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInSecondLine:", v29);
LABEL_38:

    goto LABEL_39;
  }
  if (v17 >= 44.0 - v21 + -0.1)
  {
    objc_msgSend(v4, "setHeaderInliningBehavior:", 3);
    v50 = (void *)MEMORY[0x1E0DBDC60];
    v51 = v23[2](v23, 30.0, 44.0);
    if (v5)
      v52 = 15.0;
    else
      v52 = 11.0;
    if (v5)
      v53 = 18.0;
    else
      v53 = 17.0;
    if (v5)
      v54 = 17.0;
    else
      v54 = 14.0;
    objc_msgSend(v50, "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 18.0, v52, v51, 0.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInOnlyLine:", v55);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 17.0, v52, v23[2](v23, v53, 44.0), 19.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInFirstAndSecondLines:", v56);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v54, v52, v23[2](v23, 20.0, 44.0), 0.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInFirstLine:", v57);

    v58 = (void *)MEMORY[0x1E0DBDC60];
    v39 = v23[2](v23, 36.0, 44.0);
    v40 = 17.0;
    goto LABEL_63;
  }
  if (v17 >= 38.0 - v21 + -0.1)
  {
    objc_msgSend(v4, "setHeaderInliningBehavior:", 3);
    v59 = (void *)MEMORY[0x1E0DBDC60];
    v60 = v23[2](v23, 27.0, 38.0);
    if (v5)
      v52 = 15.0;
    else
      v52 = 11.0;
    if (v5)
      v61 = 13.0;
    else
      v61 = 11.0;
    if (v5)
      v62 = 15.0;
    else
      v62 = 16.0;
    if (v5)
      v63 = 32.0;
    else
      v63 = 34.0;
    objc_msgSend(v59, "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 18.0, v52, v60, 0.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInOnlyLine:", v64);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 16.0, v52, v23[2](v23, 17.0, 38.0), 17.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInFirstAndSecondLines:", v65);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, 13.0, v61, v23[2](v23, v62, 38.0), 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInFirstLine:", v66);

    v58 = (void *)MEMORY[0x1E0DBDC60];
    v39 = v23[2](v23, v63, 38.0);
    v40 = 16.0;
LABEL_63:
    v47 = v58;
    v48 = v52;
    goto LABEL_37;
  }
  if (v17 >= 32.0 - v21 + -0.1)
  {
    objc_msgSend(v4, "setHeaderInliningBehavior:", 1);
    objc_msgSend(v4, "setForceSingleLineLayout:", 1);
    if (v5)
      v25 = 18.0;
    else
      v25 = 14.0;
    if (v5)
      v26 = 15.0;
    else
      v26 = 11.0;
    v24.n128_u64[0] = 21.0;
    if (v5)
    {
      v24.n128_f64[0] = 22.0;
      v27 = 18.0;
    }
    else
    {
      v27 = 17.0;
    }
    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v25, v26, ((double (*)(double (**)(_QWORD, double, double), __n128, double))v23[2])(v23, v24, 32.0), 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHeaderTraitsInOnlyLine:", v28);

    objc_msgSend(MEMORY[0x1E0DBDC60], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, v27, v26, v23[2](v23, 22.0, 32.0), 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputTraitsInOnlyLine:", v29);
    goto LABEL_38;
  }
LABEL_39:

  return v4;
}

+ (BOOL)_isAllSingleLineStrings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsString:", CFSTR("\n"), (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

+ (CGColor)_newCgColorWithTraitsColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "colorR");
  v6 = v5;
  objc_msgSend(v4, "colorG");
  v8 = v7;
  objc_msgSend(v4, "colorB");
  v10 = v9;
  objc_msgSend(v4, "colorA");
  v12 = v11;

  return (CGColor *)objc_msgSend(a1, "_newCgColorWithRed:green:blue:alpha:", v6, v8, v10, v12);
}

+ (void)_drawLineFromCellAtIndex:(unint64_t)a3 ofResponse:(id)a4 atYCoordinate:(double)a5 inContext:(CGContext *)a6 withAvailableWidth:(double)a7
{
  id v11;
  const __CTLine *ValueAtIndex;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v17;
  CGAffineTransform v18;

  v11 = a4;
  ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v11, "ctLines"), a3);
  objc_msgSend(v11, "widths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  CGContextSaveGState(a6);
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v18.c = v17;
  *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGContextSetTextMatrix(a6, &v18);
  CGContextSetTextPosition(a6, a7 * 0.5 - v16 * 0.5, a5);
  CTLineDraw(ValueAtIndex, a6);
  CGContextRestoreGState(a6);
}

+ (void)_drawTwoLineCellsWithSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 outWidths:(id)a10
{
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGColor *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  CGColor *v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  CFIndex j;
  const void *ValueAtIndex;
  id v65;
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  float v79;
  float v80;
  void *v81;
  void *v82;
  float v83;
  void *v84;
  void *v85;
  void *v86;
  CGColor *color;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  _QWORD v110[2];
  _QWORD v111[3];
  void *v112;
  _QWORD v113[3];

  v113[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v104 = a4;
  v92 = a5;
  v103 = a6;
  v91 = a9;
  v107 = a10;
  v105 = v15;
  v16 = objc_msgSend(v15, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v16;
  v93 = v19;
  if (v16)
  {
    for (i = 0; i != v16; ++i)
    {
      objc_msgSend(v105, "objectAtIndexedSubscript:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length")
        || (v23 = objc_msgSend(v22, "rangeOfString:", CFSTR("\n")), v23 == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(v108, "addIndex:", i);
        objc_msgSend(v17, "addObject:", v21);
        objc_msgSend(v18, "addObject:", v22);
        objc_msgSend(v19, "addObject:", &stru_1EA1081D0);
        objc_msgSend(v106, "addObject:", &stru_1EA1081D0);
      }
      else
      {
        v25 = v23;
        v26 = v24;
        objc_msgSend(v17, "addObject:", &stru_1EA1081D0);
        objc_msgSend(v18, "addObject:", &stru_1EA1081D0);
        objc_msgSend(v22, "substringToIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "addObject:", v27);

        objc_msgSend(v22, "substringFromIndex:", v25 + v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "addObject:", v28);

        v19 = v93;
      }

    }
  }
  objc_msgSend(v92, "headerTraitsInFirstLine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "textColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (CGColor *)objc_msgSend(a1, "_newCgColorWithTraitsColor:", v30);

  objc_msgSend(v29, "maxFontSize");
  v33 = v32;
  v100 = v29;
  objc_msgSend(v29, "minFontSize");
  v90 = v17;
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v17, v31, 1, v91, 0, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestLayoutForTextRuns:inWidthGroups:steps:", v36, v38, 10);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "objectAtIndexedSubscript:", 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(v31);
  objc_msgSend(v92, "inputTraitsInSecondLine");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "inputTraitsInFirstAndSecondLines");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "textColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  color = (CGColor *)objc_msgSend(a1, "_newCgColorWithTraitsColor:", v41);

  objc_msgSend(v40, "textColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(a1, "_newCgColorWithTraitsColor:", v42);

  objc_msgSend(v39, "maxFontSize");
  v45 = v44;
  objc_msgSend(v39, "minFontSize");
  v89 = v18;
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v18, color, 1, v91, 1, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v111[0] = v47;
  objc_msgSend(v40, "maxFontSize");
  v49 = v48;
  objc_msgSend(v40, "minFontSize");
  v50 = (CGColor *)v43;
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v93, v43, 1, v91, 0, v49, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v111[1] = v52;
  objc_msgSend(v39, "maxFontSize");
  v54 = v53;
  v98 = v39;
  objc_msgSend(v39, "minFontSize");
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v106, v43, 1, v91, 1, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v111[2] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestLayoutForTextRuns:inWidthGroups:steps:", v57, v60, 10);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectAtIndexedSubscript:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v61;
  objc_msgSend(v61, "objectAtIndexedSubscript:", 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  CGColorRelease(color);
  CGColorRelease(v50);
  v62 = v107;
  if (v109)
  {
    for (j = 0; j != v109; ++j)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a7, j);
      if (objc_msgSend(v108, "containsIndex:", j))
      {
        v65 = v99;
        v66 = v97;
        objc_msgSend(v100, "yCoordinate");
        v68 = v67;
        objc_msgSend(v98, "yCoordinate");
        v70 = v69;
      }
      else
      {
        v65 = v95;
        v66 = v94;
        objc_msgSend(v40, "yCoordinate");
        v68 = v71;
        objc_msgSend(v40, "yCoordinate");
        v73 = v72;
        objc_msgSend(v40, "baselineOffset");
        v70 = v73 + v74;
      }
      objc_msgSend(v103, "singleCellVerticalPadding");
      v76 = v75;
      objc_msgSend(a1, "_drawLineFromCellAtIndex:ofResponse:atYCoordinate:inContext:withAvailableWidth:", j, v65, ValueAtIndex, v75 - v68, a8);
      objc_msgSend(a1, "_drawLineFromCellAtIndex:ofResponse:atYCoordinate:inContext:withAvailableWidth:", j, v66, ValueAtIndex, v76 - v70, a8);
      if (v62)
      {
        objc_msgSend(v65, "widths");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectAtIndexedSubscript:", j);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "floatValue");
        v80 = v79;
        objc_msgSend(v66, "widths");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "objectAtIndexedSubscript:", j);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "floatValue");
        if (v80 > v83)
          v84 = v65;
        else
          v84 = v66;
        objc_msgSend(v84, "widths");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectAtIndexedSubscript:", j);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:atIndexedSubscript:", v86, j);

        v62 = v107;
      }

    }
  }

}

+ (BOOL)_drawSingleLineSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 abortInsteadOfTruncating:(BOOL)a10 outWidths:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t i;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  const __CTFont *v71;
  const __CTFont *v72;
  double Size;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  unint64_t v80;
  CFIndex v81;
  double v82;
  int v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  CGContext *ValueAtIndex;
  const __CTLine *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  BOOL v99;
  double v100;
  CGColorRef v101;
  const __CTLine *v102;
  void *v103;
  int v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  void *v115;
  __int128 v116;
  void *v117;
  __int128 v118;
  CGColor *v120;
  void *v121;
  CGColor *color;
  CGColorRef colora;
  void *v125;
  CGAffineTransform v126;
  void *v127;
  _QWORD v128[2];
  void *v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[5];

  v132[3] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v108 = a6;
  v110 = a9;
  v19 = a11;
  objc_msgSend(v18, "headerTraitsInOnlyLine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v18, "inputTraitsInOnlyLine");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;
  v113 = v19;
  v24 = a8 + -7.0;

  v107 = v18;
  objc_msgSend(v18, "inputTraitsInOnlyLine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v23;
  objc_msgSend(v23, "textColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  color = (CGColor *)objc_msgSend(a1, "_newCgColorWithTraitsColor:", v26);

  v111 = v25;
  objc_msgSend(v25, "textColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (CGColor *)objc_msgSend(a1, "_newCgColorWithTraitsColor:", v27);

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v30 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "length");

      if (v32)
      {
        objc_msgSend(v28, "addIndex:", v30);
        objc_msgSend(v17, "objectAtIndexedSubscript:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addObject:", v33);

        objc_msgSend(v29, "addObject:", &stru_1EA1081D0);
      }
      else
      {
        objc_msgSend(v125, "addObject:", &stru_1EA1081D0);
        objc_msgSend(v17, "objectAtIndexedSubscript:", v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v34);

      }
      ++v30;
    }
    while (v30 < objc_msgSend(v16, "count"));
  }
  v109 = v17;
  objc_msgSend(v112, "maxFontSize");
  v36 = v35;
  objc_msgSend(v112, "minFontSize");
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v16, color, !a10, v110, 0, v36, v37);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v117;
  objc_msgSend(v111, "maxFontSize");
  v39 = v38;
  objc_msgSend(v111, "minFontSize");
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v125, v120, !a10, v110, 0, v39, v40);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v115;
  objc_msgSend(v111, "maxFontSize");
  v42 = v41;
  objc_msgSend(v111, "minFontSize");
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v29, v120, !a10, v110, 1, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v46;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestLayoutForTextRuns:inWidthGroups:steps:", v45, v48, 10);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorRelease(color);
  CGColorRelease(v120);
  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectAtIndexedSubscript:", 1);
    colora = (CGColorRef)objc_claimAutoreleasedReturnValue();
    v106 = v49;
    objc_msgSend(v49, "objectAtIndexedSubscript:", 2);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v108;
    v51 = v109;
    if (a10 && objc_msgSend(v16, "count"))
    {
      for (i = 0; i < objc_msgSend(v16, "count"); ++i)
      {
        if (objc_msgSend(v28, "containsIndex:", i))
        {
          v130[0] = v50;
          v130[1] = colora;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_totalWidthForCell:fromTextRunResponses:", i, v54);
          v56 = v55;

          if (v56 > v24)
          {
            v105 = 1;
            goto LABEL_45;
          }
        }
        else
        {
          v129 = v121;
          v105 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_totalWidthForCell:fromTextRunResponses:", i, v57);
          v59 = v58;

          if (v59 > a8)
            goto LABEL_45;
        }
      }
    }
    objc_msgSend(v108, "singleCellVerticalPadding");
    v61 = v60;
    objc_msgSend(v112, "yCoordinate");
    v63 = v61 - v62;
    objc_msgSend(v111, "yCoordinate");
    v65 = v61 - v64;
    objc_msgSend(v112, "maxFontSize");
    v67 = v66;
    objc_msgSend(v111, "maxFontSize");
    v69 = v67 - v68;
    if (v67 - v68 != 0.0)
    {
      v70 = v63 - v65;
      if (v63 - v65 != 0.0)
      {
        v71 = (const __CTFont *)objc_msgSend(v50, "font");
        v72 = (const __CTFont *)-[CGColor font](colora, "font");
        Size = CTFontGetSize(v71);
        v74 = round(v70 * ((Size - CTFontGetSize(v72)) / v69));
        if (v74 > fabs(v70))
          v74 = v63 - v65;
        v75 = (v63 + v65) * 0.5;
        v76 = v74 * 0.5;
        v63 = v75 + v76;
        v65 = v75 - v76;
      }
    }
    v77 = objc_msgSend(v108, "maxCellCount");
    v78 = objc_msgSend(v16, "count");
    v79 = v113;
    if (v77 >= 1)
    {
      v80 = objc_msgSend(v108, "maxCellCount");
      if (v78 >= v80)
        v78 = v80;
    }
    if (v78)
    {
      v81 = 0;
      v82 = a8 * 0.5;
      v116 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v118 = *MEMORY[0x1E0C9BAA8];
      v114 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      do
      {
        v83 = objc_msgSend(v28, "containsIndex:", v81);
        if (v83)
        {
          v128[0] = v50;
          v128[1] = colora;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_totalWidthForCell:fromTextRunResponses:", v81, v84);
          v86 = v85;

          v87 = v86 + 7.0;
        }
        else
        {
          v127 = v121;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_totalWidthForCell:fromTextRunResponses:", v81, v88);
          v87 = v89;

        }
        v90 = v82 + v87 * -0.5;
        ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a7, v81);
        CGContextSaveGState(ValueAtIndex);
        *(_OWORD *)&v126.a = v118;
        *(_OWORD *)&v126.c = v116;
        *(_OWORD *)&v126.tx = v114;
        CGContextSetTextMatrix(ValueAtIndex, &v126);
        if (v83)
        {
          v92 = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v50, "ctLines"), v81);
          objc_msgSend(v50, "widths");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "objectAtIndexedSubscript:", v81);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "doubleValue");
          v96 = v95;

          objc_msgSend(v16, "firstObject");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v93) = objc_msgSend(v97, "_isNaturallyRTL");

          v98 = v87 + v90 - v96;
          v99 = (_DWORD)v93 == 0;
          v79 = v113;
          if (v99)
            v100 = v90 + v96 + 7.0;
          else
            v100 = v82 + v87 * -0.5;
          if (v99)
            v98 = v82 + v87 * -0.5;
          CGContextSetTextPosition(ValueAtIndex, v98, v63);
          CTLineDraw(v92, ValueAtIndex);
          v101 = colora;
          v90 = v100;
        }
        else
        {
          v101 = (CGColorRef)v121;
        }
        v102 = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)-[CGColor ctLines](v101, "ctLines"), v81);
        CGContextSetTextPosition(ValueAtIndex, v90, v65);
        CTLineDraw(v102, ValueAtIndex);
        CGContextRestoreGState(ValueAtIndex);
        if (v79)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:atIndexedSubscript:", v103, v81);

        }
        ++v81;
      }
      while (v78 != v81);
    }
    v105 = 0;
    v52 = v108;
    v51 = v109;
LABEL_45:

    v49 = v106;
  }
  else
  {
    v52 = v108;
    v51 = v109;
    v105 = 1;
  }

  return v105 == 0;
}

+ (void)drawSecureHeaders:(id)a3 secureContents:(id)a4 inContexts:(__CFArray *)a5 traits:(id)a6 truncationSentinel:(id)a7 outWidths:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  double v29;
  double v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  CFIndex i;
  CGContext *ValueAtIndex;
  CGFloat v41;
  NSObject *v42;
  double v43;
  void *v44;
  char v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  CFIndex v59;
  CFMutableArrayRef Mutable;
  void *v61;
  CFIndex v62;
  void *v63;
  void *v64;
  CFMutableArrayRef v65;
  CFMutableArrayRef v66;
  CFIndex j;
  CGContext *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  _QWORD v82[6];
  _QWORD v83[6];
  uint8_t buf[4];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v81 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v15, "layoutTraits");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = a1;
  if (!objc_msgSend(v18, "headerInliningBehavior"))
  {
    objc_msgSend(a1, "_defaultLayoutTraitsForTraits:", v15);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_msgSend(v15, "resultCountToSingleCellWidth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v15, "maxCellCount");
  v22 = objc_msgSend(v14, "count");
  if (v21 >= 1)
  {
    v23 = objc_msgSend(v15, "maxCellCount");
    if (v22 >= v23)
      v22 = v23;
  }
  v24 = v22;
  if (objc_msgSend(v15, "sharedCellCount"))
    v24 = objc_msgSend(v15, "sharedCellCount") + v22;
  if (!objc_msgSend(v20, "count"))
  {
    if ((objc_msgSend(v15, "cellRenderingStyle") & 1) != 0)
    {
      if (v24 == 1)
      {
        objc_msgSend(v15, "cellWidthOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v31;
        v32 = (_QWORD *)MEMORY[0x1E0DBE398];
      }
      else
      {
        if (v24 != 2)
        {
          v76 = v20;
          objc_msgSend(v15, "cellWidthOptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v24 == 3)
            v28 = (_QWORD *)MEMORY[0x1E0DBE3B0];
          else
            v28 = (_QWORD *)MEMORY[0x1E0DBE3D0];
          goto LABEL_27;
        }
        objc_msgSend(v15, "cellWidthOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v31;
        v32 = (_QWORD *)MEMORY[0x1E0DBE3C0];
      }
    }
    else
    {
      if (v24 != 1)
      {
        v76 = v20;
        objc_msgSend(v15, "cellWidthOptions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v24 == 2)
          v28 = (_QWORD *)MEMORY[0x1E0DBE3C8];
        else
          v28 = (_QWORD *)MEMORY[0x1E0DBE3B8];
LABEL_27:
        objc_msgSend(v26, "objectForKey:", *v28);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "doubleValue");
        v30 = v37;

        v20 = v76;
        goto LABEL_28;
      }
      objc_msgSend(v15, "cellWidthOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v31;
      v32 = (_QWORD *)MEMORY[0x1E0DBE3A0];
    }
    objc_msgSend(v31, "objectForKey:", *v32);
    v33 = v20;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v30 = v35;

    v20 = v33;
    goto LABEL_28;
  }
  v25 = objc_msgSend(v14, "count");
  if (v25 >= objc_msgSend(v20, "count"))
    objc_msgSend(v20, "lastObject");
  else
    objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v14, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v30 = v29;
LABEL_28:

  if (v30 >= 20.0)
  {
    objc_msgSend(v15, "singleCellHeight");
    if (v38 > 0.0)
    {
      v77 = v20;
      for (i = 0; CFArrayGetCount(a5) > i; ++i)
      {
        ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a5, i);
        CGContextSaveGState(ValueAtIndex);
        objc_msgSend(v15, "singleCellHeight");
        CGContextTranslateCTM(ValueAtIndex, 10.0, v41);
      }
      v43 = v30 + -20.0;
      if (objc_msgSend(v18, "headerInliningBehavior") == 2
        && (objc_msgSend(v18, "inputTraitsInOnlyLine"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v44,
            v44)
        && objc_msgSend(v78, "_isAllSingleLineStrings:", v81))
      {
        v45 = objc_msgSend(v15, "shouldForceDoubleLineCandidateForCellularAutofill");
        objc_msgSend(v15, "setShouldForceDoubleLineCandidateForCellularAutofill:", 0);
        v20 = v77;
        if ((v45 & 1) == 0)
        {
          LOBYTE(v73) = 1;
          if ((objc_msgSend(v78, "_drawSingleLineSecureHeaders:secureContents:layoutTraits:renderTraits:contexts:availableWidth:truncationSentinel:abortInsteadOfTruncating:outWidths:", v14, v81, v18, v15, a5, v16, v43, v73, v17) & 1) != 0)
          {
LABEL_70:
            for (j = 0; CFArrayGetCount(a5) > j; ++j)
            {
              v68 = (CGContext *)CFArrayGetValueAtIndex(a5, j);
              CGContextRestoreGState(v68);
            }
            goto LABEL_39;
          }
        }
      }
      else
      {
        objc_msgSend(v15, "setShouldForceDoubleLineCandidateForCellularAutofill:", 0);
      }
      v74 = v17;
      v75 = v16;
      v46 = v14;
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v48 = -1;
LABEL_60:
        v56 = v80;
        if ((objc_msgSend(v18, "forceSingleLineLayout") & 1) == 0 && objc_msgSend(v79, "count"))
          objc_msgSend(v80, "removeAllIndexes");
        v14 = v46;
        if ((v48 & 0x8000000000000000) == 0)
          objc_msgSend(v80, "addIndex:", v48);
        if (objc_msgSend(v80, "count"))
        {
          objc_msgSend(v46, "objectsAtIndexes:", v80);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectsAtIndexes:", v80);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v80, "count");
          Mutable = CFArrayCreateMutable(0, v59, MEMORY[0x1E0C9B378]);
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke;
          v83[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
          v83[4] = Mutable;
          v83[5] = a5;
          objc_msgSend(v80, "enumerateIndexesUsingBlock:", v83);
          LOBYTE(v73) = 0;
          objc_msgSend(v78, "_drawSingleLineSecureHeaders:secureContents:layoutTraits:renderTraits:contexts:availableWidth:truncationSentinel:abortInsteadOfTruncating:outWidths:", v57, v58, v18, v15, Mutable, v75, v43, v73, v74);
          CFRelease(Mutable);

          v56 = v80;
        }
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, v22);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "removeIndexes:", v56);
        if (objc_msgSend(v61, "count"))
        {
          v62 = objc_msgSend(v61, "count");
          objc_msgSend(v46, "objectsAtIndexes:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectsAtIndexes:", v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = CFArrayCreateMutable(0, v62, MEMORY[0x1E0C9B378]);
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke_2;
          v82[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
          v82[4] = v65;
          v82[5] = a5;
          objc_msgSend(v61, "enumerateIndexesUsingBlock:", v82);
          objc_msgSend(v78, "_drawTwoLineCellsWithSecureHeaders:secureContents:layoutTraits:renderTraits:contexts:availableWidth:truncationSentinel:outWidths:", v63, v64, v18, v15, v65, v75, v43, v74);
          v66 = v65;
          v56 = v80;
          CFRelease(v66);

          v14 = v46;
        }

        v17 = v74;
        v16 = v75;
        v20 = v77;
        goto LABEL_70;
      }
      v47 = 0;
      v48 = -1;
      while (1)
      {
        objc_msgSend(v46, "objectAtIndexedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "length");

        if (v50)
        {
          objc_msgSend(v79, "addIndex:", v47);
          if ((objc_msgSend(v18, "forceSingleLineLayout") & 1) == 0)
            goto LABEL_55;
        }
        else if ((objc_msgSend(v18, "forceSingleLineLayout") & 1) == 0)
        {
          objc_msgSend(v81, "objectAtIndexedSubscript:", v47);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "containsString:", CFSTR("\n"));

          if ((v52 & 1) != 0)
            goto LABEL_55;
        }
        objc_msgSend(v80, "addIndex:", v47);
LABEL_55:
        objc_msgSend(v81, "objectAtIndexedSubscript:", v47);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hideMyEmailLocalizedText");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqualToString:", v54);

        if (v55)
          v48 = v47;
        if (v22 == ++v47)
          goto LABEL_60;
      }
    }
  }
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v69 = v20;
      v70 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "singleCellHeight");
      objc_msgSend(v70, "stringWithFormat:", CFSTR("%s TISecureCandidateLogging: failed to draw secure candidate - cell too small, width(%f), height(%f)"), "+[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:]", *(_QWORD *)&v30, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v85 = v72;
      _os_log_debug_impl(&dword_1DA6F2000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      v20 = v69;
    }

  }
LABEL_39:

}

void __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke(uint64_t a1, CFIndex a2)
{
  __CFArray *v2;
  const void *ValueAtIndex;

  v2 = *(__CFArray **)(a1 + 32);
  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);
  CFArrayAppendValue(v2, ValueAtIndex);
}

void __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke_2(uint64_t a1, CFIndex a2)
{
  __CFArray *v2;
  const void *ValueAtIndex;

  v2 = *(__CFArray **)(a1 + 32);
  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);
  CFArrayAppendValue(v2, ValueAtIndex);
}

double __72__TIKeyboardSecureCandidateTextRendering__defaultLayoutTraitsForTraits___block_invoke(uint64_t a1, double a2, double a3)
{
  double result;

  if (!*(_BYTE *)(a1 + 56))
    a2 = a2 - *(double *)(a1 + 32);
  result = a2 + (*(double *)(a1 + 48) - (a3 - *(double *)(a1 + 40))) * 0.5;
  if (!*(_BYTE *)(a1 + 56))
    return result + 1.0;
  return result;
}

void __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v30 = a1;
  v39 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v2, "strings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v2, "strings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v2, "strings");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v2, "truncationSentinel", v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (v14 = objc_msgSend(v12, "rangeOfString:", v13), (v16 = v15) != 0))
        {
          v17 = v2;
          objc_msgSend(v12, "substringToIndex:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "substringFromIndex:", v14 + v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v18);
          objc_msgSend(v32, "addObject:", v19);
          v9 = v9 || objc_msgSend(v19, "length") != 0;

          v2 = v17;
        }
        else
        {
          objc_msgSend(v33, "addObject:", v12);
          objc_msgSend(v32, "addObject:", &stru_1EA1081D0);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v20 = objc_msgSend(v2, "color");
  objc_msgSend(v2, "maxFontSize");
  v22 = v21;
  objc_msgSend(v2, "minFontSize");
  +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v33, v20, objc_msgSend(v2, "allowTruncation"), 0, objc_msgSend(v2, "widthGroup"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v30 + 32), "addObject:", v24);
  if (v9)
  {
    v25 = objc_msgSend(v2, "color");
    objc_msgSend(v2, "maxFontSize");
    v27 = v26;
    objc_msgSend(v2, "minFontSize");
    +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v32, v25, 0, 0, objc_msgSend(v2, "widthGroup"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v30 + 32), "addObject:", v29);

  }
  objc_msgSend(*(id *)(v30 + 40), "addIndex:", objc_msgSend(*(id *)(v30 + 32), "count", v30));

}

void __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke_2(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "count") >= a2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v6, a2 - v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    +[TISCTextRunResponse textRunResponseByMergingResponses:](TISCTextRunResponse, "textRunResponseByMergingResponses:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  else
  {
    *a3 = 1;
  }
}

double __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  unint64_t v5;

  if (a3 != a4 && a2 != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5 == a2)
      return a3;
    else
      return ((double)(v5 - a2) * a4 + a3 * (double)a2) / (double)v5;
  }
  return a4;
}

void __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke_2()
{
  const __CFAttributedString *v0;

  v0 = CFAttributedStringCreate(0, &stru_1EA1081D0, MEMORY[0x1E0C9AA70]);
  _requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__emptyCtLine = (uint64_t)CTLineCreateWithAttributedString(v0);
  CFRelease(v0);
}

void __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  double v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v18 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = 0;
    v6 = 0.0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "allowTruncation");

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "widths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (v8 && v13 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        objc_msgSend(v18, "addIndex:", v5);
      }
      else
      {
        objc_msgSend(v4, "addObject:", &unk_1EA1408D0);
        v6 = v6 + v13;
      }
      ++v5;
    }
    while (v5 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  else
  {
    v6 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 48), "truncatedWidthsForItemWidths:availableWidth:", v4, *(double *)(a1 + 56) - v6, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke_2;
  v20[3] = &unk_1EA0FBE58;
  v21 = *(id *)(a1 + 40);
  v22 = v15;
  v16 = *(_QWORD *)(a1 + 48);
  v24 = a2;
  v25 = v16;
  v23 = *(id *)(a1 + 32);
  v17 = v15;
  objc_msgSend(v19, "enumerateIndexesUsingBlock:", v20);

}

void __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  const __CTLine *ValueAtIndex;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFAttributedString *v15;
  const __CTLine *v16;
  const void *TruncatedLine;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v20, "widths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v6 < v10)
  {
    ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v20, "ctLines"), *(_QWORD *)(a1 + 56));
    v12 = *(void **)(a1 + 64);
    v13 = objc_msgSend(v20, "font");
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (const __CFAttributedString *)objc_msgSend(v12, "_newAttributedStringWithText:font:color:", CFSTR("…"), v13, objc_msgSend(v14, "color"));

    v16 = CTLineCreateWithAttributedString(v15);
    CFRelease(v15);
    TruncatedLine = CTLineCreateTruncatedLine(ValueAtIndex, v6, kCTLineTruncationEnd, v16);
    if (!TruncatedLine)
      TruncatedLine = CFRetain(v16);
    CFRelease(v16);
    CFArraySetValueAtIndex((CFMutableArrayRef)objc_msgSend(v20, "ctLines"), *(_QWORD *)(a1 + 56), TruncatedLine);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CTLineGetTypographicBounds((CTLineRef)TruncatedLine, 0, 0, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "widths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, *(_QWORD *)(a1 + 56));

    CFRelease(TruncatedLine);
  }

}

void __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v4, a2);

}

void __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v4, a2);

}

CGColorSpaceRef __78__TIKeyboardSecureCandidateTextRendering__newCgColorWithRed_green_blue_alpha___block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  _newCgColorWithRed_green_blue_alpha__colorSpace = (uint64_t)result;
  return result;
}

@end
