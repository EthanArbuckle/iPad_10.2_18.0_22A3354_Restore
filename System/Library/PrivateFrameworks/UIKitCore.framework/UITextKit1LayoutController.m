@implementation UITextKit1LayoutController

uint64_t __49___UITextKit1LayoutController__textStorageLength__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __83___UITextKit1LayoutController_textRangeForLineEnclosingPosition_effectiveAffinity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v3 = a2;
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "offset");
    if (v6 == v5)
      v7 = v5 - 1;
    else
      v7 = v6;
    v8 = objc_msgSend(v3, "glyphIndexForCharacterAtIndex:", v7);
    v33 = 0;
    v34 = 0;
    objc_msgSend(v3, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v8, &v33);
    v9 = objc_msgSend(v3, "characterRangeForGlyphRange:actualGlyphRange:", v33, v34, 0);
    v11 = v10;
    if (v7 == v9)
    {
      if (v8)
        v12 = *(_QWORD *)(a1 + 56) == 1;
      else
        v12 = 0;
      v13 = v7;
      if (v12)
      {
        objc_msgSend(v3, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v8 - 1, &v33);
        v13 = objc_msgSend(v3, "characterRangeForGlyphRange:actualGlyphRange:", v33, v34, 0);
        v11 = v14;
      }
    }
    else
    {
      v13 = v9;
    }
    objc_msgSend(v3, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "substringWithRange:", v13, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "rangeOfCharacterFromSet:options:", v23, 4);
    v26 = v25;

    if (v24 + v13 + v26 == v13 + v11)
      v27 = v26;
    else
      v27 = 0;
    v28 = v11 - v27;
    if (v24 + v13 == 0x7FFFFFFFFFFFFFFFLL)
      v29 = v11;
    else
      v29 = v28;
    objc_msgSend(*(id *)(a1 + 32), "textRangeForCharacterRange:", v13, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

  }
  else
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "beginningOfDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "emptyTextRangeAtPosition:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

void __109___UITextKit1LayoutController_insertionRectForPosition_typingAttributes_placeholderAttachment_textContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  size_t v56;
  double *v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  double *v62;
  unint64_t v64;
  double *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  double *v72;
  double v73;
  double v74;
  void *v75;
  id v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v76 = a2;
  objc_msgSend(v76, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v4 < objc_msgSend(v3, "length") && objc_msgSend(v3, "length"))
  {
    v5 = *(void **)(a1 + 32);
    if (v5
      && (objc_msgSend(v5, "bounds"), CGRectIsEmpty(v77))
      && (objc_msgSend(v3, "string"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "characterAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)),
          v6,
          v7 == 65532))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(_QWORD *)(v8 + 24);
      if (v9)
        *(_QWORD *)(v8 + 24) = v9 - 1;
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    v21 = objc_msgSend(v76, "glyphIndexForCharacterAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    objc_msgSend(v76, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v21, 0);
    x = v22;
    y = v23;
    width = v24;
    height = v25;
    objc_msgSend(v76, "textContainerForGlyphAtIndex:effectiveRange:", v21, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    goto LABEL_27;
  }
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v15 != objc_msgSend(v3, "length"))
  {
LABEL_26:
    v10 = 0;
    goto LABEL_27;
  }
  if (objc_msgSend(v3, "length"))
  {
    v16 = objc_msgSend(v76, "glyphIndexForCharacterAtIndex:", objc_msgSend(v3, "length") - 1);
    objc_msgSend(v76, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v16, 0);
    x = v17;
    y = v18;
    width = v19;
    height = v20;
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v76, "extraLineFragmentRect");
    if (CGRectIsEmpty(v78))
    {
      objc_msgSend(v76, "textContainerForGlyphAtIndex:effectiveRange:", v16, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

    }
    else
    {
      objc_msgSend(v76, "extraLineFragmentTextContainer");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v50 = *(void **)(v49 + 40);
      *(_QWORD *)(v49 + 40) = v48;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAttributesForExtraLineFragment:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v76, "extraLineFragmentRect");
      x = v51;
      y = v52;
      width = v53;
      height = v54;
    }
    goto LABEL_26;
  }
  objc_msgSend(v76, "textContainers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "boundingRectForGlyphRange:inTextContainer:", 0, 0, v33);

  objc_msgSend(v76, "extraLineFragmentTextContainer");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v36 = *(void **)(v35 + 40);
  *(_QWORD *)(v35 + 40) = v34;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAttributesForExtraLineFragment:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v76, "extraLineFragmentRect");
  x = v79.origin.x;
  y = v79.origin.y;
  width = v79.size.width;
  height = v79.size.height;
  if (!CGRectIsEmpty(v79) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    goto LABEL_26;
  objc_msgSend(v76, "textContainers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstObject");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v40 = *(void **)(v39 + 40);
  *(_QWORD *)(v39 + 40) = v38;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "textView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  x = v42;
  y = v43;

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)off_1E1678D90);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    objc_msgSend(off_1E167A828, "defaultFontSize");
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)off_1E1678F98);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "_ui_resolvedTextAlignment");

  if (v46 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "size");
    x = v73 * 0.5;
  }
  else if (v46 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "size");
    x = v47;
  }
  objc_msgSend(v44, "lineHeight");
  height = v74;

  v10 = 0;
  width = height;
LABEL_27:
  v55 = objc_msgSend(v76, "getLineFragmentInsertionPointsForCharacterAtIndex:alternatePositions:inDisplayOrder:positions:characterIndexes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0, 0, 0, 0);
  if (v55)
  {
    v56 = 8 * v55;
    v57 = (double *)malloc_type_malloc(8 * v55, 0x100004000313F17uLL);
    v58 = malloc_type_malloc(v56, 0x100004000313F17uLL);
    v59 = objc_msgSend(v76, "getLineFragmentInsertionPointsForCharacterAtIndex:alternatePositions:inDisplayOrder:positions:characterIndexes:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0, 0, v57, v58);
    v60 = 0;
    if (v59)
    {
      while (1)
      {
        v61 = v58[v60];
        if (v61 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          break;
        if (v60 && v58[v60 - 1] > v61)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), CFSTR("_UITextKit1LayoutController.m"), 331, CFSTR("Insertion points aren't ordered by character position"));

        }
        if (v59 == ++v60)
        {
          v60 = v59;
          break;
        }
      }
    }
    if (v59 - 1 <= v60 || *(_BYTE *)(a1 + 88) == 0)
      v64 = v60;
    else
      v64 = (v60 + 1);
    if (v59 > v64)
    {
      v65 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
      v65[4] = x;
      v65[5] = y;
      v65[6] = width;
      v65[7] = height;
      v66 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "layoutOrientation");
      v67 = v57[v64];
      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v66)
        *(double *)(v68 + 40) = y + v67;
      else
        *(double *)(v68 + 32) = x + v67;
    }
    free(v57);
    free(v58);
  }
  else
  {
    v62 = *(double **)(*(_QWORD *)(a1 + 72) + 8);
    v62[4] = x;
    v62[5] = y;
    v62[6] = width;
    v62[7] = height;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v69 = 0;
  else
    v69 = v10;
  v70 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "layoutOrientation");
  v71 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (v70)
  {
    *(_QWORD *)(v71 + 56) = 0x4000000000000000;
    if ((v69 & 1) == 0)
    {
      v72 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
LABEL_55:
      *v72 = *v72 + -1.0;
    }
  }
  else
  {
    *(_QWORD *)(v71 + 48) = 0x4000000000000000;
    if ((v69 & 1) == 0)
    {
      v72 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
      goto LABEL_55;
    }
  }

}

void __81___UITextKit1LayoutController_textRangeForBounds_inTextContainer_layoutIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(unsigned __int8 *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v7 = *(double *)(a1 + 72);
  v9 = a2;
  v10 = v9;
  if (v3)
  {
    objc_msgSend(v9, "ensureLayoutForBoundingRect:inTextContainer:", v4, v6, v5, v8, v7);
    v11 = objc_msgSend(v10, "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    v11 = objc_msgSend(v9, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", v4, v6, v5, v8, v7);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v13 + 32) = v11;
  *(_QWORD *)(v13 + 40) = v12;
  v14 = objc_msgSend(v10, "characterRangeForGlyphRange:actualGlyphRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
  v16 = v15;

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v17 + 32) = v14;
  *(_QWORD *)(v17 + 40) = v16;
}

void __64___UITextKit1LayoutController_attributesAtPosition_inDirection___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a1[4];
  v4 = a2;
  _UITextAttributesAtIndexWithDirection(v4, objc_msgSend(v3, "offset"), a1[6]);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v34 = 0;
  v35 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 32), "asRange");
  v6 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:", v4, v5, &v34);
  objc_msgSend(v3, "textStorage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v34;
  v8 = v35;
  if (v8 + v7 > (unint64_t)objc_msgSend(v22, "length") || (v9 = v34, v9 == objc_msgSend(v22, "length")))
  {
    objc_msgSend(v3, "extraLineFragmentTextContainer");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "textContainerForGlyphAtIndex:effectiveRange:", v6, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(v3, "textContainers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v23, "indexOfObjectIdenticalTo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v23, "subarrayWithRange:", v13, objc_msgSend(v23, "count") - v13);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v31;
      v17 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          {
            objc_msgSend(v19, "textContainerOrigin");
            v24[0] = v17;
            v24[1] = 3221225472;
            v24[2] = __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2;
            v24[3] = &unk_1E16B74E0;
            v28 = v20;
            v29 = v21;
            v25 = *(id *)(a1 + 40);
            v26 = v19;
            v27 = *(id *)(a1 + 48);
            objc_msgSend(v3, "enumerateEnclosingRectsForCharacterRange:withinSelectedCharacterRange:inTextContainer:usingBlock:", v34, v35, v34, v35, v19, v24);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v15);
    }

  }
}

void __87___UITextKit1LayoutController_selectionRectsForRange_fromView_forContainerPassingTest___block_invoke_2(uint64_t a1, double a2, double a3)
{
  void *v4;
  void *v5;
  id v6;

  +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", *(_QWORD *)(a1 + 32), a2 + *(double *)(a1 + 56), a3 + *(double *)(a1 + 64));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsVertical:", objc_msgSend(*(id *)(a1 + 40), "layoutOrientation") == 1);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWritingDirection:", objc_msgSend(v5, "isDefaultRightToLeft"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
}

void __65___UITextKit1LayoutController_cursorPositionAtPoint_inContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  double v30;
  CGRect v31;

  v3 = a2;
  v30 = 0.0;
  v4 = objc_msgSend(v3, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", *(_QWORD *)(a1 + 32), &v30, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v29[0] = 0;
  v29[1] = 0;
  if (objc_msgSend(v3, "numberOfGlyphs"))
  {
    objc_msgSend(v3, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v4, v29);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(v3, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  v15 = objc_msgSend(v3, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", *(_QWORD *)(a1 + 32), &v30, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v16 = v30 <= 1.0 && v30 > 0.5;
  v27 = 0;
  v28 = 0;
  v17 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:", v15, 1, &v27, v30);
  v18 = v29[0];
  if (v30 == 1.0)
  {
    if (v28 + v27 == v14)
    {
      objc_msgSend(v3, "textStorage", v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "string");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "substringWithRange:", v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "_isNewlineOrReturn"))
      {
        v31.origin.x = v6;
        v31.origin.y = v8;
        v31.size.width = v10;
        v31.size.height = v12;
        v16 = !CGRectContainsPoint(v31, *(CGPoint *)(a1 + 56));
      }
      else
      {
        v16 = 1;
      }

      v22 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend(v3, "propertyForGlyphAtIndex:", v17, v30) == 2)
    {
      v16 = 0;
      v22 = v17 != v18;
LABEL_15:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v22;
    }
  }
  v23 = v30;
  if (v30 <= 0.5 && v17 == v18)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  if (v15 < v14)
  {
    v24 = objc_msgSend(v3, "rangeOfCharacterClusterAtIndex:type:", v15, 3, v23);
    if (v16)
      v26 = v25;
    else
      v26 = 0;
    v15 = v26 + v24;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15;

}

void __66___UITextKit1LayoutController_nearestPositionAtPoint_inContainer___block_invoke(double *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;

  v3 = *((_QWORD *)a1 + 4);
  v4 = a1[6];
  v5 = a1[7];
  v6 = a2;
  v7 = objc_msgSend(v6, "characterIndexForGlyphAtIndex:", objc_msgSend(v6, "glyphIndexForPoint:inTextContainer:", v3, v4, v5));

  *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 5) + 8) + 24) = v7;
}

void __76___UITextKit1LayoutController_enumerateTextLineFragmentsInRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v5 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  +[_UITextKitTextRange rangeWithRange:](_UITextKitTextRange, "rangeWithRange:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __45___UITextKit1LayoutController_textContainers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "textContainers");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __69___UITextKit1LayoutController_ensureLayoutForBounds_inTextContainer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ensureLayoutForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __67___UITextKit1LayoutController_rangeOfCharacterClusterAtIndex_type___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "rangeOfCharacterClusterAtIndex:type:", a1[5], a1[6]);
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_QWORD *)(v4 + 32) = result;
  *(_QWORD *)(v4 + 40) = v5;
  return result;
}

void __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v3 = a1[5];
  v4 = a1[6];
  v5 = a2;
  v6 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", v3, v4, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2;
  v8[3] = &unk_1E16B7620;
  v8[4] = a1[4];
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", v6, v7, v8);

}

void __70___UITextKit1LayoutController_unionRectForCharacterRange_bottomInset___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), *(CGRect *)&a6);
}

@end
