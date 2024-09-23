@implementation _UIFlowLayoutInfo

- (void)invalidate:(uint64_t)a1
{
  id WeakRetained;
  int v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  if (a1)
  {
    *(_OWORD *)(a1 + 72) = *MEMORY[0x1E0C9D820];
    *(_QWORD *)(a1 + 88) = 0;
    *(_BYTE *)(a1 + 64) = 0;
    if (!a2
      || (WeakRetained = objc_loadWeakRetained((id *)(a1 + 120)),
          v4 = objc_msgSend(WeakRetained, "_estimatesSizes"),
          WeakRetained,
          v4))
    {
      v5 = *(id *)(a1 + 104);
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v6;

      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __32___UIFlowLayoutInfo_invalidate___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v5;
      dispatch_async(v8, block);

    }
  }
}

- (_UIFlowLayoutSection)addSection
{
  _UIFlowLayoutSection *v2;
  _UIFlowLayoutSection *v3;

  if (a1)
  {
    v2 = objc_alloc_init(_UIFlowLayoutSection);
    v3 = v2;
    if (v2)
      objc_storeWeak((id *)&v2->_layoutInfo, a1);
    objc_msgSend(a1[13], "addObject:", v3);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)didUpdateSizeForSection:(double)a3 withDelta:
{
  unint64_t i;
  double *v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;

  if (a1)
  {
    for (i = a2 + 1; i < objc_msgSend(*(id *)(a1 + 104), "count"); ++i)
    {
      objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", i);
      v6 = (double *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -0.0;
        if (*(_BYTE *)(a1 + 97))
          v8 = a3;
        else
          v8 = -0.0;
        if (!*(_BYTE *)(a1 + 97))
          v7 = a3;
        v9 = v6[40] + v7;
        v6[39] = v6[39] + v8;
        v6[40] = v9;
      }

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "_updateContentSizeScrollingDimensionWithDelta:", a3);

  }
}

- (_UIFlowLayoutInfo)init
{
  char *v2;
  _UIFlowLayoutInfo *v3;
  NSMutableArray *v4;
  NSMutableArray *sections;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFlowLayoutInfo;
  v2 = -[_UIFlowLayoutInfo init](&v7, sel_init);
  v3 = (_UIFlowLayoutInfo *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 97) = 256;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sections = v3->_sections;
    v3->_sections = v4;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (id)copy
{
  _UIFlowLayoutInfo *v3;
  id *p_isa;
  CGSize size;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  _UIFlowLayoutSection *v10;
  _UIFlowLayoutSection *v11;
  __int128 v12;
  CGSize v13;
  CGSize v14;
  CGSize v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UIFlowLayoutSection *v20;
  _UIFlowLayoutRow *v21;
  _UIFlowLayoutRow *v22;
  CGSize v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id *v29;
  NSMutableArray *items;
  NSMutableArray *v31;
  uint64_t v32;
  NSMutableArray *obj;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  id *location;
  id *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_UIFlowLayoutInfo);
  p_isa = (id *)&v3->super.isa;
  if (v3)
  {
    v3->_usesFloatingHeaderFooter = self->_useFloatingHeaderFooter;
    v3->_horizontal = self->_horizontal;
    v3->_leftToRight = self->_leftToRight;
    size = self->_visibleBounds.size;
    v3->_visibleBounds.origin = self->_visibleBounds.origin;
    v3->_visibleBounds.size = size;
    v3->_layoutSize = self->_layoutSize;
    v3->_dimension = self->_dimension;
    v3->_isValid = self->_isValid;
    v6 = *(_QWORD *)&self->_rowAlignmentOptions.commonRowHorizontalAlignment;
    v3->_rowAlignmentOptions.rowVerticalAlignment = self->_rowAlignmentOptions.rowVerticalAlignment;
    *(_QWORD *)&v3->_rowAlignmentOptions.commonRowHorizontalAlignment = v6;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = self->_sections;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v37)
    {
      v35 = p_isa;
      v36 = *(_QWORD *)v44;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v7);
          v9 = p_isa;
          if (v8 && (v10 = objc_alloc_init(_UIFlowLayoutSection)) != 0)
          {
            v11 = v10;
            v40 = v7;
            v12 = *(_OWORD *)(v8 + 296);
            *(_OWORD *)&v10->_sectionMargins.top = *(_OWORD *)(v8 + 280);
            *(_OWORD *)&v10->_sectionMargins.bottom = v12;
            v10->_lineSpacing = *(double *)(v8 + 112);
            v10->_interItemSpacing = *(double *)(v8 + 120);
            v13 = *(CGSize *)(v8 + 328);
            v10->_frame.origin = *(CGPoint *)(v8 + 312);
            v10->_frame.size = v13;
            v10->_isValid = *(_BYTE *)(v8 + 8);
            v14 = *(CGSize *)(v8 + 360);
            v10->_headerFrame.origin = *(CGPoint *)(v8 + 344);
            v10->_headerFrame.size = v14;
            v15 = *(CGSize *)(v8 + 392);
            v10->_footerFrame.origin = *(CGPoint *)(v8 + 376);
            v10->_footerFrame.size = v15;
            v10->_headerDimension = *(double *)(v8 + 128);
            v10->_footerDimension = *(double *)(v8 + 136);
            location = (id *)&v10->_layoutInfo;
            v39 = v9;
            objc_storeWeak((id *)&v10->_layoutInfo, v9);
            v11->_fixedItemSize = *(_BYTE *)(v8 + 88);
            v11->_itemSize = *(CGSize *)(v8 + 248);
            v11->_itemsCount = *(_QWORD *)(v8 + 208);
            v11->_itemsByRowCount = *(_QWORD *)(v8 + 216);
            v11->_indexOfIncompleteRow = *(_QWORD *)(v8 + 224);
            v11->_beginMargin = *(double *)(v8 + 160);
            v11->_endMargin = *(double *)(v8 + 168);
            v11->_actualGap = *(double *)(v8 + 176);
            v11->_lastRowIncomplete = *(_BYTE *)(v8 + 89);
            v11->_lastRowBeginMargin = *(double *)(v8 + 184);
            v11->_lastRowEndMargin = *(double *)(v8 + 192);
            v11->_lastRowActualGap = *(double *)(v8 + 200);
            v11->_otherMargin = *(double *)(v8 + 152);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v41 = *(id *)(v8 + 104);
            v16 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            if (v16)
            {
              v17 = v16;
              v42 = *(_QWORD *)v48;
              do
              {
                v18 = 0;
                do
                {
                  if (*(_QWORD *)v48 != v42)
                    objc_enumerationMutation(v41);
                  v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v18);
                  v20 = v11;
                  if (v19)
                  {
                    v21 = objc_alloc_init(_UIFlowLayoutRow);
                    v22 = v21;
                    if (v21)
                    {
                      objc_storeWeak((id *)&v21->_section, v20);
                      v22->_rowSize = *(CGSize *)(v19 + 56);
                      v23 = *(CGSize *)(v19 + 88);
                      v22->_rowFrame.origin = *(CGPoint *)(v19 + 72);
                      v22->_rowFrame.size = v23;
                      v22->_index = *(_QWORD *)(v19 + 32);
                      v22->_isValid = *(_BYTE *)(v19 + 8);
                      v22->_complete = *(_BYTE *)(v19 + 9);
                      v22->_verticalAlignement = *(_DWORD *)(v19 + 12);
                      v22->_horizontalAlignement = *(_DWORD *)(v19 + 16);
                      v53 = 0u;
                      v54 = 0u;
                      v51 = 0u;
                      v52 = 0u;
                      v24 = *(id *)(v19 + 40);
                      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
                      if (v25)
                      {
                        v26 = v25;
                        v27 = *(_QWORD *)v52;
                        do
                        {
                          v28 = 0;
                          do
                          {
                            if (*(_QWORD *)v52 != v27)
                              objc_enumerationMutation(v24);
                            v29 = (id *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v28), "copy");
                            -[NSMutableArray addObject:](v22->_items, "addObject:", v29);
                            if (v29)
                            {
                              objc_storeWeak(v29 + 2, v20);
                              objc_storeWeak(v29 + 3, v22);
                            }

                            ++v28;
                          }
                          while (v26 != v28);
                          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
                        }
                        while (v26);
                      }

                    }
                  }
                  else
                  {
                    v22 = 0;
                  }

                  -[NSMutableArray addObject:](v11->_rows, "addObject:", v22);
                  if (v22)
                    items = v22->_items;
                  else
                    items = 0;
                  v31 = v11->_items;
                  -[NSMutableArray addObjectsFromArray:](v31, "addObjectsFromArray:", items);

                  ++v18;
                }
                while (v18 != v17);
                v32 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
                v17 = v32;
              }
              while (v32);
            }

            objc_storeWeak(location, v39);
            p_isa = v35;
            v7 = v40;
          }
          else
          {

            v11 = 0;
          }
          objc_msgSend(p_isa[13], "addObject:", v11);

          ++v7;
        }
        while (v7 != v37);
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v37);
    }

  }
  return p_isa;
}

- (void)setSizes:(void *)a3 forItemsAtIndexPaths:
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id *location;
  id v39;
  _QWORD v40[5];

  v39 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(v39, "count");
    if (v6 != objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel_setSizes_forItemsAtIndexPaths_, a1, CFSTR("UIFlowLayoutSupport.m"), 2011, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sizes.count == indexPaths.count"));

    }
    location = (id *)(a1 + 120);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    v8 = objc_msgSend(WeakRetained, "_estimatesSizes");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setSizes_forItemsAtIndexPaths_);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel_setSizes_forItemsAtIndexPaths_, a1, CFSTR("UIFlowLayoutSupport.m"), 2012, CFSTR("This method %@ should only be called for layouts with estimated item sizes."), v37, location);

    }
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10 = (void *)objc_opt_new();
    if (objc_msgSend(v39, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(v39, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CGSizeValue");
        v14 = v13;
        v16 = v15;

        v17 = v5;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addIndex:", objc_msgSend(v18, "section"));
        v19 = v16 + *(double *)(a1 + 80);
        *(double *)(a1 + 72) = v14 + *(double *)(a1 + 72);
        *(double *)(a1 + 80) = v19;
        ++*(_QWORD *)(a1 + 88);
        v20 = *(void **)(a1 + 104);
        v21 = objc_loadWeakRetained(location);
        objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v21, "_sectionArrayIndexForIndexPath:", v18));
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "section"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24 || (v25 = objc_msgSend(v24, "integerValue"), v25 > objc_msgSend(v18, "item")))
        {
          if (v22)
          {
            v27 = *(_QWORD *)(v22 + 264);
            v26 = *(_QWORD *)(v22 + 272);
          }
          else
          {
            v26 = 0;
            v27 = 0;
          }
          v28 = objc_msgSend(v18, "item");
          if (v28 >= v27 && v28 - v27 < v26)
          {
            v29 = -[_UIFlowLayoutSection frameForItemAtIndexPath:](v22, v18);
            if (v31 != v14 || v30 != v16)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "item", v29));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "section"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, v33);

            }
          }
        }
        if (v22)
        {
          objc_msgSend(*(id *)(v22 + 96), "objectAtIndexedSubscript:", objc_msgSend(v18, "item"));
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            *(double *)(v34 + 48) = v14;
            *(double *)(v34 + 56) = v16;
            *(_BYTE *)(v34 + 8) |= 6u;
          }

        }
        ++v11;
        v5 = v17;
      }
      while (v11 < objc_msgSend(v39, "count"));
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __51___UIFlowLayoutInfo_setSizes_forItemsAtIndexPaths___block_invoke;
    v40[3] = &unk_1E16BE348;
    v40[4] = a1;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v40);

  }
}

- (id)setSize:(double)a3 forItemAtIndexPath:(double)a4
{
  id *v8;
  id WeakRetained;
  int v10;
  double v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  double Width;
  double Height;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  unsigned __int8 *v35;
  int v36;
  _QWORD *v37;
  uint64_t v38;
  double MaxX;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  int64_t v53;
  void *v54;
  CGFloat v55;
  CGFloat MinY;
  CGFloat v57;
  uint64_t v58;
  uint64_t v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  uint64_t v65;
  double MaxY;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  int64_t v80;
  void *v81;
  CGFloat MinX;
  CGFloat v83;
  CGFloat v84;
  void *v85;
  id v86;
  objc_class *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD block[6];
  _QWORD v94[7];
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  if (!a1)
  {
    v13 = 0;
    return v13;
  }
  v8 = (id *)(a1 + 120);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v10 = objc_msgSend(WeakRetained, "_estimatesSizes");

  if (v10)
  {
    v11 = a4 + *(double *)(a1 + 80);
    *(double *)(a1 + 72) = a3 + *(double *)(a1 + 72);
    *(double *)(a1 + 80) = v11;
    ++*(_QWORD *)(a1 + 88);
  }
  v12 = objc_loadWeakRetained(v8);
  v13 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_loadWeakRetained(v8);
    v87 = (objc_class *)objc_msgSend((id)objc_opt_class(), "invalidationContextClass");
    NSStringFromClass(v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", sel_setSize_forItemAtIndexPath_, a1, CFSTR("UIFlowLayoutSupport.m"), 2063, CFSTR("Invalidation context class (%@) must be a subclass of UICollectionViewFlowLayoutInvalidationContext."), v88);

  }
  objc_msgSend(v13, "setInvalidateFlowLayoutAttributes:", 0);
  objc_msgSend(v13, "setInvalidateFlowLayoutDelegateMetrics:", 0);
  v14 = objc_loadWeakRetained(v8);
  v15 = objc_msgSend(v14, "_sectionArrayIndexForIndexPath:", a2);

  if ((v15 & 0x8000000000000000) == 0 && v15 < objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v16 = *(void **)(a1 + 104);
    if (v16)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_62:

        return v13;
      }
      v18 = objc_msgSend(a2, "item");
      if (v18 >= objc_msgSend(*(id *)(v17 + 96), "count"))
      {
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __71___UIFlowLayoutSection_setSize_forItemAtIndexPath_invalidationContext___block_invoke;
        v94[3] = &unk_1E16B1888;
        v94[4] = v17;
        v94[5] = v18;
        if (_MergedGlobals_993 != -1)
          dispatch_once(&_MergedGlobals_993, v94);
        goto LABEL_62;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v17 + 96), "objectAtIndexedSubscript:", objc_msgSend(a2, "item"));
      v20 = objc_claimAutoreleasedReturnValue();
      v22 = v20;
      if (v20)
      {
        v24 = *(double *)(v20 + 32);
        v23 = *(double *)(v20 + 40);
        v25 = *(double *)(v20 + 48);
        v26 = *(double *)(v20 + 56);
      }
      else
      {
        v23 = 0.0;
        v25 = 0.0;
        v26 = 0.0;
        v24 = 0.0;
      }
      if (v25 != a3 || v26 != a4)
      {
        v27 = *(_QWORD *)(v17 + 264);
        v28 = v18 >= v27;
        v29 = v18 - v27;
        if (!v28 || v29 >= *(_QWORD *)(v17 + 272))
        {
          if (v20)
          {
            *(CGFloat *)(v20 + 32) = v24;
            *(CGFloat *)(v20 + 40) = v23;
            *(double *)(v20 + 48) = v25;
            *(double *)(v20 + 56) = v26;
            *(_BYTE *)(v20 + 8) |= 4u;
          }
          goto LABEL_59;
        }
        v95.origin.x = v24;
        v95.origin.y = v23;
        v95.size.width = v25;
        v95.size.height = v26;
        Width = CGRectGetWidth(v95);
        v96.origin.x = v24;
        v96.origin.y = v23;
        v96.size.width = v25;
        v96.size.height = v26;
        Height = CGRectGetHeight(v96);
        if (v22)
        {
          *(CGFloat *)(v22 + 32) = v24;
          *(CGFloat *)(v22 + 40) = v23;
          *(double *)(v22 + 48) = a3;
          *(double *)(v22 + 56) = a4;
          *(_BYTE *)(v22 + 8) |= 4u;
        }
        v32 = objc_msgSend(a2, "section");
        if (v18 < *(_QWORD *)(v17 + 272) + *(_QWORD *)(v17 + 264))
        {
          v33 = v18;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v33, v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v34);
            objc_msgSend(v19, "addObject:", v34);

            ++v33;
          }
          while (v33 < *(_QWORD *)(v17 + 272) + *(_QWORD *)(v17 + 264));
        }
        v35 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v17 + 144));
        if (v35 && (v36 = v35[97], v35, v36))
        {
          v21 = a4 - Height;
          if (a4 - Height < 0.0)
          {
            if (v22)
              v37 = objc_loadWeakRetained((id *)(v22 + 24));
            else
              v37 = 0;
            v38 = objc_msgSend(*(id *)(v17 + 104), "indexOfObject:", v37);
            MaxX = CGRectGetMaxX(*(CGRect *)(v17 + 16));
            if (v37)
            {
              v40 = v37[9];
              v41 = v37[10];
              v42 = v37[11];
              v43 = v37[12];
            }
            else
            {
              v41 = 0;
              v42 = 0;
              v43 = 0;
              v40 = 0;
            }
            v44 = MaxX - CGRectGetMinX(*(CGRect *)&v40);
            if (v38 >= 1)
            {
              objc_msgSend(*(id *)(v17 + 104), "objectAtIndexedSubscript:", v38 - 1);
              v45 = objc_claimAutoreleasedReturnValue();
              v89 = (void *)v45;
              v91 = v37;
              if (v45)
              {
                v46 = (_QWORD *)v45;
                v47 = objc_msgSend(*(id *)(v45 + 40), "count");
                v48 = v46[9];
                v49 = v46[10];
                v50 = v46[11];
                v51 = v46[12];
              }
              else
              {
                v47 = objc_msgSend(0, "count");
                v49 = 0;
                v50 = 0;
                v51 = 0;
                v48 = 0;
              }
              v52 = CGRectGetWidth(*(CGRect *)&v48);
              if (v47 >= 1)
              {
                v53 = v18 - v47;
                do
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v53, v32);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v54);
                  objc_msgSend(v19, "addObject:", v54);

                  ++v53;
                }
                while (v53 < (uint64_t)v18);
              }
              v44 = v44 + v52;

              v37 = v91;
            }
            v97.size.width = fmax(CGRectGetWidth(*(CGRect *)(v17 + 16)) - v44, 0.0);
            *(CGFloat *)(v17 + 32) = v97.size.width;
            v97.origin.x = *(CGFloat *)(v17 + 16);
            v97.origin.y = *(CGFloat *)(v17 + 24);
            v97.size.height = *(CGFloat *)(v17 + 40);
            v55 = CGRectGetMaxX(v97);
            MinY = CGRectGetMinY(*(CGRect *)(v17 + 16));
            v57 = CGRectGetHeight(*(CGRect *)(v17 + 16));
            v58 = objc_msgSend(a2, "section");
            v59 = v17;
            v60 = v55;
            v61 = MinY;
            v62 = v44;
            v63 = v57;
LABEL_58:
            -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v59, v58, 1u, v13, v60, v61, v62, v63);

          }
        }
        else
        {
          v21 = a3 - Width;
          if (a3 - Width < 0.0)
          {
            if (v22)
              v37 = objc_loadWeakRetained((id *)(v22 + 24));
            else
              v37 = 0;
            v65 = objc_msgSend(*(id *)(v17 + 104), "indexOfObject:", v37);
            MaxY = CGRectGetMaxY(*(CGRect *)(v17 + 16));
            if (v37)
            {
              v67 = v37[9];
              v68 = v37[10];
              v69 = v37[11];
              v70 = v37[12];
            }
            else
            {
              v68 = 0;
              v69 = 0;
              v70 = 0;
              v67 = 0;
            }
            v71 = MaxY - CGRectGetMinY(*(CGRect *)&v67);
            if ((unint64_t)(v65 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
            {
              objc_msgSend(*(id *)(v17 + 104), "objectAtIndexedSubscript:");
              v72 = objc_claimAutoreleasedReturnValue();
              v90 = (void *)v72;
              v92 = v37;
              if (v72)
              {
                v73 = (_QWORD *)v72;
                v74 = objc_msgSend(*(id *)(v72 + 40), "count");
                v75 = v73[9];
                v76 = v73[10];
                v77 = v73[11];
                v78 = v73[12];
              }
              else
              {
                v74 = objc_msgSend(0, "count");
                v76 = 0;
                v77 = 0;
                v78 = 0;
                v75 = 0;
              }
              v79 = CGRectGetHeight(*(CGRect *)&v75);
              if (v74 >= 1)
              {
                v80 = v18 - v74;
                do
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v80, v32);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v81);
                  objc_msgSend(v19, "addObject:", v81);

                  ++v80;
                }
                while (v80 < (uint64_t)v18);
              }
              v71 = v71 + v79;

              v37 = v92;
            }
            v98.size.height = fmax(CGRectGetHeight(*(CGRect *)(v17 + 16)) - v71, 0.0);
            *(CGFloat *)(v17 + 40) = v98.size.height;
            v98.origin.x = *(CGFloat *)(v17 + 16);
            v98.origin.y = *(CGFloat *)(v17 + 24);
            v98.size.width = *(CGFloat *)(v17 + 32);
            MinX = CGRectGetMinX(v98);
            v83 = CGRectGetMaxY(*(CGRect *)(v17 + 16));
            v84 = CGRectGetWidth(*(CGRect *)(v17 + 16));
            v58 = objc_msgSend(a2, "section");
            v59 = v17;
            v60 = MinX;
            v61 = v83;
            v62 = v84;
            v63 = v71;
            goto LABEL_58;
          }
        }
      }
LABEL_59:
      if (objc_msgSend(v19, "count", v21))
        objc_msgSend(v13, "invalidateItemsAtIndexPaths:", v19);

      goto LABEL_62;
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___UIFlowLayoutInfo_setSize_forItemAtIndexPath___block_invoke;
  block[3] = &unk_1E16B1888;
  block[4] = a1;
  block[5] = v15;
  if (qword_1ECD7D328 != -1)
    dispatch_once(&qword_1ECD7D328, block);
  return v13;
}

- (id)specifiedItemSizes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 104);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v3 = 0;
    v17 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD **)(*((_QWORD *)&v24 + 1) + 8 * v4);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v19 = v4;
        if (v5)
          v5 = (_QWORD *)v5[12];
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = 0;
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v6);
              v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
              if (v12)
              {
                if ((*(_BYTE *)(v12 + 8) & 4) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9 + v11, v3);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", *(double *)(v12 + 48), *(double *)(v12 + 56));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, v13);

                }
              }
              ++v11;
            }
            while (v8 != v11);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            v9 += v11;
          }
          while (v8);
        }

        ++v3;
        v4 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }

  return v2;
}

@end
