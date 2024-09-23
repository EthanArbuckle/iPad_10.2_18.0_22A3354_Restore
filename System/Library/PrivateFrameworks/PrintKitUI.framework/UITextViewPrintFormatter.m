@implementation UITextViewPrintFormatter

- (double)adjustedPageBottom:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;

  -[UIViewPrintFormatter view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContainerOrigin");
  v8 = v7;
  v9 = a3 - v7;
  objc_msgSend(v6, "textLayoutFragmentForPosition:", 0.0, a3 - v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "layoutFragmentFrame");
    if (v12 + v13 > v9)
    {
      v14 = v12;
      objc_msgSend(v11, "textLineFragmentForVerticalOffset:requiresExactMatch:", 1, v9 - v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "typographicBounds");
        a3 = v8 + v14 + v17;
      }

    }
  }

  return a3;
}

- (NSArray)pageData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double y;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double width;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  NSArray *pageData;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect rect2;
  void (*v54)(uint64_t, void *);
  void *v55;
  id v56;
  id v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  _QWORD v66[6];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  if (!-[UITextViewPrintFormatter initializedUsedRects](self, "initializedUsedRects")
    && !-[UITextViewPrintFormatter calculatingUsedRects](self, "calculatingUsedRects"))
  {
    -[UITextViewPrintFormatter setCalculatingUsedRects:](self, "setCalculatingUsedRects:", 1);
    -[UIViewPrintFormatter view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "textLayoutManager");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4 && v5 | v6 && v7)
    {
      -[UIPrintFormatter _pageContentRect:](self, "_pageContentRect:", 1);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      y = v15;
      -[UIPrintFormatter _pageContentRect:](self, "_pageContentRect:", 0);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v71.size.height = v23;
      v67.origin.x = v10;
      v67.origin.y = v12;
      v67.size.width = v14;
      v67.size.height = y;
      v71.origin.x = v18;
      v71.origin.y = v20;
      v71.size.width = v22;
      rect2.origin.y = v71.size.height;
      v68 = CGRectIntersection(v67, v71);
      width = v68.size.width;
      v25 = objc_msgSend(v4, "widthTracksTextView", v68.origin.x, v68.origin.y);
      v26 = objc_msgSend(v4, "heightTracksTextView");
      objc_msgSend(v4, "setTextView:", 0);
      objc_msgSend(v4, "setWidthTracksTextView:", 0);
      objc_msgSend(v4, "setHeightTracksTextView:", 0);
      objc_msgSend(v4, "size");
      v48 = v28;
      v49 = v27;
      objc_msgSend(v4, "setSize:", width, 3.40282347e38);
      if (v5)
      {
        v50 = v22;
        v51 = v20;
        v52 = v18;
        v45 = v26;
        v46 = v25;
        v47 = v6;
        objc_msgSend((id)v5, "textContentManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "documentRange");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v5, "ensureLayoutForRange:", v30);
        objc_msgSend((id)v5, "usageBoundsForTextContainer");
        rect2.origin.x = v31;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v38 = 0.0;
        v39 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          -[UITextViewPrintFormatter adjustedPageBottom:](self, "adjustedPageBottom:", v38 + y);
          v41 = v40 - v38;
          v69.origin.x = 0.0;
          v69.origin.y = v38;
          v69.size.width = v14;
          v69.size.height = v41;
          v72.origin.x = rect2.origin.x;
          v72.origin.y = v33;
          v72.size.width = v35;
          v72.size.height = v37;
          if (!CGRectIntersectsRect(v69, v72))
            break;
          *(CGFloat *)v66 = v10;
          *(CGFloat *)&v66[1] = v12;
          *(CGFloat *)&v66[2] = v14;
          *(double *)&v66[3] = v41;
          *(double *)&v66[4] = v38;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v66, "{?={CGRect={CGPoint=dd}{CGSize=dd}}d}");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v42);

          v70.origin.x = 0.0;
          v70.origin.y = v38;
          v70.size.width = v14;
          v70.size.height = v41;
          y = rect2.origin.y;
          v38 = v38 + CGRectGetHeight(v70);
          v14 = v50;
          v12 = v51;
          v10 = v52;
          --v39;
        }
        while (v39);

        v6 = v47;
        v26 = v45;
        v25 = v46;
      }
      else
      {
        *(_QWORD *)&rect2.size.width = MEMORY[0x1E0C809B0];
        *(_QWORD *)&rect2.size.height = 3221225472;
        v54 = __36__UITextViewPrintFormatter_pageData__block_invoke;
        v55 = &unk_1E9D97860;
        v56 = v4;
        v58 = v10;
        v59 = v12;
        v60 = v14;
        v61 = y;
        v57 = v8;
        v62 = v18;
        v63 = v20;
        v64 = v22;
        v65 = rect2.origin.y;
        objc_msgSend((id)v6, "coordinateAccess:", &rect2.size);

      }
      objc_storeStrong((id *)&self->_pageData, v8);
      objc_msgSend(v4, "setSize:", v49, v48);
      objc_msgSend(v4, "setWidthTracksTextView:", v25);
      objc_msgSend(v4, "setHeightTracksTextView:", v26);
      objc_msgSend(v4, "setTextView:", v7);
    }
    else
    {
      pageData = self->_pageData;
      self->_pageData = 0;

    }
    -[UITextViewPrintFormatter setInitializedUsedRects:](self, "setInitializedUsedRects:", 1);
    -[UITextViewPrintFormatter setCalculatingUsedRects:](self, "setCalculatingUsedRects:", 0);

  }
  return self->_pageData;
}

void __36__UITextViewPrintFormatter_pageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  uint64_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGRect rect;
  double v24;
  double v25;
  __int128 v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = a2;
  if (objc_msgSend(v3, "allowsNonContiguousLayout"))
    objc_msgSend(v3, "ensureLayoutForTextContainer:", *(_QWORD *)(a1 + 32));
  v26 = *(_OWORD *)(a1 + 48);
  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  v6 = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 32), 0.0, 0.0, v4, v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = v6 + v7;
      if ((unint64_t)(v6 + v7) <= 1)
        v11 = 1;
      objc_msgSend(v3, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v11 - 1, 0, *(_QWORD *)&v9);
      x = v27.origin.x;
      y = v27.origin.y;
      width = v27.size.width;
      height = v27.size.height;
      MaxY = CGRectGetMaxY(v27);
      v28.origin.x = 0.0;
      v28.origin.y = v10;
      v28.size.width = v4;
      v28.size.height = v5;
      if (MaxY > CGRectGetMaxY(v28))
      {
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v17 = CGRectGetMaxY(v29);
        v30.origin.x = 0.0;
        v30.origin.y = v10;
        v30.size.width = v4;
        v30.size.height = v5;
        v18 = CGRectGetMaxY(v30) - v17;
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v19 = v5 - (v18 + CGRectGetHeight(v31));
        if (v19 > 0.00000011920929)
          v5 = v19;
      }
      *(_OWORD *)&rect.origin.y = v26;
      rect.size.height = v4;
      v24 = v5;
      v25 = v22;
      v20 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &rect.origin.y, "{?={CGRect={CGPoint=dd}{CGSize=dd}}d}");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

      v26 = *(_OWORD *)(a1 + 80);
      v32.origin.x = 0.0;
      v32.origin.y = v10;
      v32.size.width = v4;
      v32.size.height = v5;
      v10 = v22 + CGRectGetHeight(v32);
      v4 = *(double *)(a1 + 96);
      v5 = *(double *)(a1 + 104);
      v6 = objc_msgSend(v3, "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 32), 0.0, v10, v4, v5);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v9 = v10;
    }
    while (v7);
  }

}

- (int64_t)_recalcPageCount
{
  void *v3;
  int64_t v4;

  -[UITextViewPrintFormatter setInitializedUsedRects:](self, "setInitializedUsedRects:", 0);
  -[UITextViewPrintFormatter pageData](self, "pageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  CGRect result;

  -[UIPrintFormatter _recalcIfNecessary](self, "_recalcIfNecessary");
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  -[UITextViewPrintFormatter pageData](self, "pageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3 - -[UIPrintFormatter startPage](self, "startPage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v11);

  v8 = *((double *)&v11 + 1);
  v7 = *(double *)&v11;
  v10 = *((double *)&v12 + 1);
  v9 = *(double *)&v12;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  __int128 v10;
  void *v11;
  void *v12;
  CGContext *CurrentContext;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  double v37;
  double v38;
  CGFloat v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  double v44;
  double v45;
  __int128 v46;
  CGContext *v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[3];
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  CGRect v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v53 = *MEMORY[0x1E0C9D648];
  v54 = v10;
  v55 = 0.0;
  -[UITextViewPrintFormatter pageData](self, "pageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a4 - -[UIPrintFormatter startPage](self, "startPage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getValue:", &v53);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  CGContextClipToRect(CurrentContext, v56);
  CGContextTranslateCTM(CurrentContext, x, y);
  v14 = v55;
  CGContextTranslateCTM(CurrentContext, 0.0, -v55);
  -[UIViewPrintFormatter view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "textLayoutManager");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (!v17)
  {
    objc_msgSend(v16, "layoutManager");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "textView");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v16 && v17 | v18 && v19)
  {
    v21 = objc_msgSend(v16, "widthTracksTextView");
    v22 = objc_msgSend(v16, "heightTracksTextView");
    objc_msgSend(v16, "setTextView:", 0);
    objc_msgSend(v16, "setWidthTracksTextView:", 0);
    objc_msgSend(v16, "setHeightTracksTextView:", 0);
    objc_msgSend(v16, "size");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v16, "setSize:", width, 3.40282347e38);
    if (v17)
    {
      v52 = v54;
      v27 = *(double *)&v53 - *(double *)&v53;
      v28 = *((double *)&v53 + 1) + v55 - *((double *)&v53 + 1);
      objc_msgSend((id)v17, "textContentManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "documentRange");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v17, "ensureLayoutForRange:", v30);
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      v51 = 0;
      objc_msgSend((id)v17, "textLayoutFragmentForPosition:", v27, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v49 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke;
      v40[3] = &unk_1E9D978B0;
      v32 = v31;
      v41 = v32;
      v42 = v48;
      v44 = v27;
      v45 = v28;
      v46 = v52;
      v47 = CurrentContext;
      v43 = v50;
      v33 = (id)objc_msgSend((id)v17, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", 0, 4, v40);

      _Block_object_dispose(v48, 8);
      _Block_object_dispose(v50, 8);

      v22 = v22;
      v21 = v21;
    }
    else if (v18)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_3;
      v34[3] = &unk_1E9D978D8;
      v35 = v16;
      v36 = 0;
      v37 = v14;
      v38 = width;
      v39 = height;
      objc_msgSend((id)v18, "coordinateAccess:", v34);

    }
    objc_msgSend(v16, "setSize:", v24, v26);
    objc_msgSend(v16, "setWidthTracksTextView:", v21);
    objc_msgSend(v16, "setHeightTracksTextView:", v22);
    objc_msgSend(v16, "setTextView:", v20);
  }
  CGContextRestoreGState(CurrentContext);

}

BOOL __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "layoutFragmentFrame");
    objc_msgSend(v4, "layoutFragmentFrame");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "textLineFragments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_2;
    v12[3] = &unk_1E9D97888;
    v12[5] = v6;
    v12[6] = v8;
    v13 = *(_OWORD *)(a1 + 56);
    v14 = *(_OWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 88);
    v12[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0;

  return v10;
}

void __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxY;
  double MinY;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16 = a2;
  objc_msgSend(v16, "typographicBounds");
  v7 = v6;
  v9 = v8;
  v11 = *(double *)(a1 + 40) + v10;
  v13 = v12 + *(double *)(a1 + 48);
  v19.origin.x = v11;
  v19.origin.y = v13;
  v19.size.width = v6;
  v19.size.height = v8;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v19))
  {
    v17.origin.x = v11;
    v17.origin.y = v13;
    v17.size.width = v7;
    v17.size.height = v9;
    MaxY = CGRectGetMaxY(v17);
    if (MaxY <= CGRectGetMaxY(*(CGRect *)(a1 + 56)))
      objc_msgSend(v16, "drawAtPoint:inContext:", *(_QWORD *)(a1 + 88), v11, v13);
  }
  else
  {
    v18.origin.x = v11;
    v18.origin.y = v13;
    v18.size.width = v7;
    v18.size.height = v9;
    MinY = CGRectGetMinY(v18);
    if (MinY > CGRectGetMaxY(*(CGRect *)(a1 + 56)))
    {
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

void __54__UITextViewPrintFormatter_drawInRect_forPageAtIndex___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "allowsNonContiguousLayout"))
    objc_msgSend(v9, "ensureLayoutForTextContainer:", *(_QWORD *)(a1 + 32));
  v3 = objc_msgSend(v9, "glyphRangeForBoundingRect:inTextContainer:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (v4)
  {
    v5 = v3;
    v6 = v4;
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v9, "drawBackgroundForGlyphRange:atPoint:", v3, v4, *MEMORY[0x1E0C9D538], v8);
    objc_msgSend(v9, "drawGlyphsForGlyphRange:atPoint:", v5, v6, v7, v8);
  }

}

- (void)setText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UITextViewPrintFormatter _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
}

- (id)text
{
  void *v2;
  void *v3;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UITextViewPrintFormatter _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

  -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
}

- (id)attributedText
{
  void *v2;
  void *v3;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UITextViewPrintFormatter _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
}

- (id)font
{
  void *v2;
  void *v3;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UITextViewPrintFormatter _textView](self, "_textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (id)color
{
  void *v2;
  void *v3;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  void *v5;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", a3);

  -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[UITextViewPrintFormatter _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (BOOL)initializedUsedRects
{
  return self->_initializedUsedRects;
}

- (void)setInitializedUsedRects:(BOOL)a3
{
  self->_initializedUsedRects = a3;
}

- (BOOL)calculatingUsedRects
{
  return self->_calculatingUsedRects;
}

- (void)setCalculatingUsedRects:(BOOL)a3
{
  self->_calculatingUsedRects = a3;
}

- (void)setPageData:(id)a3
{
  objc_storeStrong((id *)&self->_pageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageData, 0);
}

@end
