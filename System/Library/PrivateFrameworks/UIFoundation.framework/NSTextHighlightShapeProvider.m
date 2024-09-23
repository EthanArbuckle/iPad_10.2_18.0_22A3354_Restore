@implementation NSTextHighlightShapeProvider

- (NSTextHighlightShapeProvider)initWithTextLayoutManager:(id)a3
{
  id v4;
  NSTextHighlightShapeProvider *v5;
  NSTextHighlightShapeProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSTextHighlightShapeProvider;
  v5 = -[NSTextHighlightShapeProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_textLayoutManager, v4);

  return v6;
}

- (void)fillCornerArray:(CGSize *)a3 topLeft:(double)a4 bottomLeft:(double)a5 topRight:(double)a6 bottomRight:(double)a7
{
  a3->width = a5;
  a3->height = a5;
  a3[1].width = a7;
  a3[1].height = a7;
  a3[2].width = a6;
  a3[2].height = a6;
  a3[3].width = a4;
  a3[3].height = a4;
}

- (id)textSegmentRectsForRange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NSTextHighlightShapeProvider_textSegmentRectsForRange___block_invoke;
  v10[3] = &unk_1E2604B98;
  v8 = v6;
  v11 = v8;
  objc_msgSend(WeakRetained, "enumerateTextSegmentsInRange:type:options:usingBlock:", v5, 0, 0, v10);

  return v8;
}

uint64_t __57__NSTextHighlightShapeProvider_textSegmentRectsForRange___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

- (unint64_t)_modifyOptions:(unint64_t)a3 forLineBoundariesInRange:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  objc_msgSend(WeakRetained, "_rangeForAllLinesContainingTextInRange:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

    if ((unint64_t)(v11 + 1) >= 2)
      v12 = a3;
    else
      v12 = a3 | 4;
    objc_msgSend(v6, "endLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 >= 2)
      a3 = v12;
    else
      a3 = v12 | 8;
  }

  return a3;
}

- (void)enumerateHighlightPathsForRanges:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSTextHighlightShapeProvider_enumerateHighlightPathsForRanges_usingBlock___block_invoke;
  v8[3] = &unk_1E2604BC0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __76__NSTextHighlightShapeProvider_enumerateHighlightPathsForRanges_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "enumerateHighlightPathsForRange:options:usingBlock:", a2, 0, *(_QWORD *)(a1 + 40));
  *a4 = result;
  return result;
}

- (BOOL)enumerateHighlightPathsForRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double MinY;
  _BOOL4 v34;
  double Height;
  id v36;
  id v37;
  const CGPath *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  CGPathRef CopyByUnioningPath;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  const CGPath *v50;
  uint64_t v51;
  BOOL v52;
  void *v54;
  void (**v56)(id, const CGPath *, const CGPath *, id, uint64_t, uint64_t);
  _QWORD v57[4];
  id v58;
  id v59;
  void (**v60)(id, const CGPath *, const CGPath *, id, uint64_t, uint64_t);
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  _QWORD v66[4];
  id v67;
  NSTextHighlightShapeProvider *v68;
  id v69;
  id v70;
  unint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  BOOL v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  double v80[19];
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v80[16] = *(double *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v56 = (void (**)(id, const CGPath *, const CGPath *, id, uint64_t, uint64_t))a5;
  v9 = -[NSTextHighlightShapeProvider _modifyOptions:forLineBoundariesInRange:](self, "_modifyOptions:forLineBoundariesInRange:", a4, v8);
  -[NSTextHighlightShapeProvider textSegmentRectsForRange:](self, "textSegmentRectsForRange:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "count");
  if (v13 < 2 || (v14 = v13, (unint64_t)objc_msgSend(v10, "count") <= 1))
  {
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "rectValue");
      v45 = v44;
      v47 = v46;

      *(_QWORD *)&v76 = 0;
      v62 = 0;
      __NSTextHighlightShapeProviderGetMetrics((double *)&v76, (double *)&v62, v45, v47);
      v48 = 0.0;
      if ((v9 & 4) != 0)
        v49 = *(double *)&v76;
      else
        v49 = 0.0;
      if ((v9 & 8) != 0)
        v48 = *(double *)&v76;
      -[NSTextHighlightShapeProvider fillCornerArray:topLeft:bottomLeft:topRight:bottomRight:](self, "fillCornerArray:topLeft:bottomLeft:topRight:bottomRight:", v80, v49, v49, v48, v48);
      v50 = (const CGPath *)CGPathCreateWithUnevenCornersRoundedRect();
      objc_msgSend(v12, "addObject:", v50);
      objc_msgSend(v11, "addObject:", v50);
      CGPathRelease(v50);
    }
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rectValue");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rectValue");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v81.origin.x = v26;
    v81.origin.y = v28;
    v81.size.width = v30;
    v81.size.height = v32;
    MinY = CGRectGetMinY(v81);
    v82.origin.x = v17;
    v82.origin.y = v19;
    v82.size.width = v21;
    v82.size.height = v23;
    v34 = MinY - CGRectGetMaxY(v82) <= 0.0;
    v80[0] = 0.0;
    *(_QWORD *)&v76 = 0;
    v83.origin.x = v17;
    v83.origin.y = v19;
    v83.size.width = v21;
    v83.size.height = v23;
    Height = CGRectGetHeight(v83);
    __NSTextHighlightShapeProviderGetMetrics(v80, (double *)&v76, -1.0, Height);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke;
    v66[3] = &unk_1E2604BE8;
    v71 = v9;
    v67 = v10;
    v68 = self;
    v72 = v76;
    v73 = v80[0];
    v75 = v34;
    v36 = v12;
    v69 = v36;
    v70 = v11;
    v74 = v14;
    objc_msgSend(v67, "enumerateObjectsWithOptions:usingBlock:", 0, v66);

    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    if (v34)
    {
      v37 = v36;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v38 = 0;
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      if (v39)
      {
        v40 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v77 != v40)
              objc_enumerationMutation(v37);
            if (v38)
            {
              CopyByUnioningPath = CGPathCreateCopyByUnioningPath(v38, *(CGPathRef *)(*((_QWORD *)&v76 + 1) + 8 * i), 1);
              CFRelease(v38);
              v38 = CopyByUnioningPath;
            }
            else
            {
              v38 = (const CGPath *)CFRetain(*(CFTypeRef *)(*((_QWORD *)&v76 + 1) + 8 * i));
            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        }
        while (v39);
      }

      v56[2](v56, v38, v38, v8, 1, (uint64_t)(v63 + 3));
      goto LABEL_26;
    }
  }
  v51 = objc_msgSend(v12, "count");
  if (v51 != objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextHighlightShapeProvider.m"), 229, CFSTR("Fill paths and Stroke paths should have the same count !"));

  }
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke_2;
  v57[3] = &unk_1E2604C10;
  v60 = v56;
  v58 = v11;
  v59 = v8;
  v61 = &v62;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v57);

LABEL_26:
  v52 = *((_BYTE *)v63 + 24) != 0;
  _Block_object_dispose(&v62, 8);

  return v52;
}

void __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  const CGPath *v24;
  const CGPath *v25;
  _BYTE v26[64];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  if (!a3)
  {
    if ((*(_BYTE *)(a1 + 64) & 4) != 0)
    {
      v16 = *(double *)(a1 + 80);
      if (*(_BYTE *)(a1 + 96))
        v17 = 0.0;
      else
        v17 = *(double *)(a1 + 80);
      v18 = *(double *)(a1 + 80);
      v14 = v17;
    }
    else
    {
      v16 = *(double *)(a1 + 80);
      v18 = 0.0;
      if (*(_BYTE *)(a1 + 96))
        v17 = 0.0;
      else
        v17 = *(double *)(a1 + 80);
      v14 = 0.0;
    }
    v15 = *(void **)(a1 + 40);
    goto LABEL_24;
  }
  if (*(_QWORD *)(a1 + 88) - 1 == a3)
  {
    v14 = *(double *)(a1 + 80);
    v15 = *(void **)(a1 + 40);
    v16 = 0.0;
    if ((*(_QWORD *)(a1 + 64) & 8) != 0)
      v17 = *(double *)(a1 + 80);
    else
      v17 = 0.0;
    if (*(_BYTE *)(a1 + 96))
      v18 = 0.0;
    else
      v18 = *(double *)(a1 + 80);
    if (!*(_BYTE *)(a1 + 96))
      v16 = v17;
LABEL_24:
    objc_msgSend(v15, "fillCornerArray:topLeft:bottomLeft:topRight:bottomRight:", v26, v18, v14, v16, v17);
    v25 = (const CGPath *)CGPathCreateWithUnevenCornersRoundedRect();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
    if (!*(_BYTE *)(a1 + 96))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v25);
    CGPathRelease(v25);
    return;
  }
  v19 = *(double *)(a1 + 72);
  v20 = v7 - v19;
  v21 = v11 + v19 * 2.0;
  if (*(_BYTE *)(a1 + 96))
  {
    v22 = v9;
    v23 = v13;
    v24 = CGPathCreateWithRect(*(CGRect *)&v20, 0);
  }
  else
  {
    v24 = (const CGPath *)CGPathCreateWithContinuousRoundedRect();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v24);
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);
  CGPathRelease(v24);
}

void __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a1[6];
  v8 = (void *)a1[4];
  v9 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, _QWORD, _QWORD, uint64_t))(v7 + 16))(v7, v9, v10, a1[5], 0, *(_QWORD *)(a1[7] + 8) + 24);

  *a4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textLayoutManager);
}

@end
