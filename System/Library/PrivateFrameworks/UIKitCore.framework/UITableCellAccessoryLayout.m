@implementation UITableCellAccessoryLayout

uint64_t __96__UITableCellAccessoryLayout__frameForAccessoryAtIndex_inAccessories_containerSize_withXOrigin___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __84__UITableCellAccessoryLayout__framesForAccessories_withContainerSize_outTotalFrame___block_invoke(double *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)*((_QWORD *)a1 + 4);
  v6 = *((_QWORD *)a1 + 5);
  v7 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8) + 24;
  v8 = a1[8];
  v9 = a1[9];
  v10 = a2;
  objc_msgSend(v5, "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, v6, v7, v8, v9);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)a1 + 6);
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v12);
}

- (void)setStandardLayoutWidthProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSafeAreaInset:(double)a3
{
  self->_safeAreaInset = a3;
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (void)setDisclosureLayoutWidthProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)prepareLayoutForAccessories:(id)a3 previousAccessories:(id)a4 configurationIdentifier:(id)a5 animated:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  double MinX;
  void *v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  char v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __CFString *v53;
  __CFString *v54;
  char v55;
  id v56;
  id v57;
  NSDictionary *v58;
  NSDictionary *v59;
  id v60;
  id v61;
  NSDictionary *initialFrames;
  NSDictionary *v63;
  NSDictionary *finalFrames;
  NSDictionary *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v71;
  id obj;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  id v79;
  NSDictionary *v80;
  UITableCellAccessoryLayout *v81;
  NSDictionary *v82;
  id v83;
  id v84;
  _QWORD *v85;
  uint64_t *v86;
  _QWORD *v87;
  double v88;
  double v89;
  char v90;
  _QWORD v91[4];
  id v92;
  id v93;
  UITableCellAccessoryLayout *v94;
  id v95;
  id v96;
  id v97;
  _QWORD *v98;
  uint64_t *v99;
  double v100;
  double v101;
  _QWORD *v102;
  char v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  _QWORD v107[4];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;
  CGRect v128;
  CGRect v129;

  v127 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v68 = a5;
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v121 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addObject:", v15);

        objc_msgSend(v14, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
    }
    while (v11);
  }

  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v9;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v117 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "addObject:", v22);

        objc_msgSend(v21, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
    }
    while (v18);
  }

  v24 = (void *)objc_msgSend(v75, "mutableCopy");
  objc_msgSend(v24, "intersectSet:", v73);
  objc_msgSend(v75, "minusSet:", v24);
  objc_msgSend(v73, "minusSet:", v24);
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "containerSize");
  v27 = v26;
  v29 = v28;

  v112 = 0;
  v113 = (double *)&v112;
  v114 = 0x2020000000;
  v115 = 0x7FF0000000000000;
  -[UITableCellAccessoryLayout _framesForAccessories:withContainerSize:outTotalFrame:](self, "_framesForAccessories:withContainerSize:outTotalFrame:", obj, 0, v27, v29);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  -[UITableCellAccessoryLayout _framesForAccessories:withContainerSize:outTotalFrame:](self, "_framesForAccessories:withContainerSize:outTotalFrame:", v10, &self->_totalFrame, v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "mutableCopy");

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v32 = v10;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v109;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v109 != v34)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * k), "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "containsObject:", v36))
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "CGRectValue");
          MinX = CGRectGetMinX(v128);
          objc_msgSend(v71, "objectForKeyedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "CGRectValue");
          v40 = CGRectGetMinX(v129);

          v41 = MinX - v40;
          v42 = v113[3];
          if (v42 == INFINITY || (v43 = v42 == v41, v41 = 0.0, !v43))
            v113[3] = v41;
        }

      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
    }
    while (v33);
  }

  if (v113[3] == INFINITY)
    v113[3] = 0.0;
  v107[0] = 0;
  v107[1] = v107;
  v44 = 0.0;
  if (self->_edge == 8)
    v44 = v27;
  v107[2] = 0x2020000000;
  *(double *)&v107[3] = v44;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x2020000000;
  *(double *)&v106[3] = v44;
  v45 = MEMORY[0x1E0C809B0];
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke;
  v104[3] = &unk_1E16E38F8;
  v105 = v24;
  v46 = (__CFString *)v68;
  v47 = v46;
  v66 = v105;
  if (v46 == CFSTR("editing"))
  {
    v48 = 1;
  }
  else if (v46)
  {
    v48 = -[__CFString isEqual:](v46, "isEqual:", CFSTR("editing"));
  }
  else
  {
    v48 = 0;
  }

  v91[0] = v45;
  v91[1] = 3221225472;
  v91[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_2;
  v91[3] = &unk_1E16E3920;
  v100 = v27;
  v101 = v29;
  v103 = v48;
  v69 = v75;
  v92 = v69;
  v102 = v104;
  v49 = v32;
  v93 = v49;
  v94 = self;
  v98 = v107;
  v50 = v67;
  v95 = v50;
  v51 = v31;
  v96 = v51;
  v99 = &v112;
  v52 = v17;
  v97 = v52;
  objc_msgSend(v49, "enumerateObjectsUsingBlock:", v91);
  v53 = v47;
  v54 = v53;
  v76 = v52;
  if (v53 == CFSTR("normal"))
  {
    v55 = 1;
  }
  else if (v53)
  {
    v55 = -[__CFString isEqual:](v53, "isEqual:", CFSTR("normal"));
  }
  else
  {
    v55 = 0;
  }

  v77[0] = v45;
  v77[1] = 3221225472;
  v77[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_10;
  v77[3] = &unk_1E16E3948;
  v56 = v73;
  v90 = v55;
  v78 = v56;
  v87 = v104;
  v57 = obj;
  v79 = v57;
  v58 = (NSDictionary *)v50;
  v80 = v58;
  v81 = self;
  v88 = v27;
  v89 = v29;
  v85 = v106;
  v59 = (NSDictionary *)v51;
  v82 = v59;
  v60 = v71;
  v83 = v60;
  v86 = &v112;
  v61 = v74;
  v84 = v61;
  objc_msgSend(v57, "enumerateObjectsUsingBlock:", v77);
  initialFrames = self->_initialFrames;
  self->_initialFrames = v58;
  v63 = v58;

  finalFrames = self->_finalFrames;
  self->_finalFrames = v59;
  v65 = v59;

  _Block_object_dispose(v106, 8);
  _Block_object_dispose(v107, 8);

  _Block_object_dispose(&v112, 8);
}

- (id)_framesForAccessories:(id)a3 withContainerSize:(CGSize)a4 outTotalFrame:(CGRect *)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  double v11;
  double v12;
  double (**spacingBlock)(id, _QWORD, void *);
  void *v14;
  void *v15;
  double v16;
  double (**v17)(id, void *, _QWORD);
  void *v18;
  void *v19;
  double v20;
  double v21;
  double safeAreaInset;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD *v27;
  double v28;
  double v29;
  _QWORD v30[4];
  CGRect v31;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  -[UITableCellAccessoryLayout _totalWidthForAccessories:withContainerSize:](self, "_totalWidthForAccessories:withContainerSize:", v9, width, height);
  if (v11 <= 0.0)
  {
    safeAreaInset = self->_safeAreaInset;
    if (!a5)
      goto LABEL_11;
    goto LABEL_9;
  }
  v12 = v11;
  spacingBlock = (double (**)(id, _QWORD, void *))self->_spacingBlock;
  objc_msgSend(v9, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = spacingBlock[2](spacingBlock, 0, v15);

  v17 = (double (**)(id, void *, _QWORD))self->_spacingBlock;
  objc_msgSend(v9, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17[2](v17, v19, 0);

  if (v20 < self->_safeAreaInset)
    v20 = self->_safeAreaInset;
  v30[0] = 0;
  v30[1] = v30;
  v21 = v12 + v20;
  if (self->_edge == 8)
    v21 = width - (v12 + v20);
  v30[2] = 0x2020000000;
  *(double *)&v30[3] = v21;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__UITableCellAccessoryLayout__framesForAccessories_withContainerSize_outTotalFrame___block_invoke;
  v24[3] = &unk_1E16E38D0;
  v24[4] = self;
  v28 = width;
  v29 = height;
  v25 = v9;
  v27 = v30;
  v26 = v10;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v24);
  safeAreaInset = v12 + v16 + v20;

  _Block_object_dispose(v30, 8);
  if (a5)
  {
LABEL_9:
    a5->origin.x = 0.0;
    a5->origin.y = 0.0;
    a5->size.width = safeAreaInset;
    a5->size.height = height;
    if (self->_edge == 8)
    {
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.width = safeAreaInset;
      v31.size.height = height;
      a5->origin.x = width - CGRectGetWidth(v31);
    }
  }
LABEL_11:

  return v10;
}

- (double)_totalWidthForAccessories:(id)a3 withContainerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  double v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v15 = 0;
    v16 = (double *)&v15;
    v17 = 0x2020000000;
    v18 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__UITableCellAccessoryLayout__totalWidthForAccessories_withContainerSize___block_invoke;
    v10[3] = &unk_1E16E38A8;
    v13 = width;
    v14 = height;
    v10[4] = self;
    v12 = &v15;
    v11 = v7;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v10);
    v8 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (CGRect)endLayout
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGSize v7;
  NSDictionary *initialFrames;
  NSDictionary *finalFrames;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  x = self->_totalFrame.origin.x;
  y = self->_totalFrame.origin.y;
  width = self->_totalFrame.size.width;
  height = self->_totalFrame.size.height;
  v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_totalFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_totalFrame.size = v7;
  initialFrames = self->_initialFrames;
  self->_initialFrames = 0;

  finalFrames = self->_finalFrames;
  self->_finalFrames = 0;

  -[NSMutableDictionary removeAllObjects](self->_initialAlphas, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_finalAlphas, "removeAllObjects");
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UITableCellAccessoryLayout)init
{
  char *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITableCellAccessoryLayout;
  v2 = -[UITableCellAccessoryLayout init](&v9, sel_init);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v2 + 88) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v2 + 104) = v3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)*((_QWORD *)v2 + 9);
  *((_QWORD *)v2 + 9) = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = v6;

  return (UITableCellAccessoryLayout *)v2;
}

void __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 96), *(double *)(a1 + 104));

  v7 = *(unsigned __int8 *)(a1 + 120);
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v24))
  {
    if (v7 && ((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 112) + 16))() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24, *(double *)(a1 + 96), *(double *)(a1 + 104));
      v12 = v20;
      v14 = v21;
      v16 = v22;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGRectValue");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      v17 = v10 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v17, v12, v14, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v23, v24);

    if (objc_msgSend(*(id *)(a1 + 72), "containsObject:", v6))
      v19 = &unk_1E1A96110;
    else
      v19 = &unk_1E1A96100;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v18, v24);

    v19 = &unk_1E1A96110;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "setObject:forKeyedSubscript:", v19, v24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "setObject:forKeyedSubscript:", &unk_1E1A96110, v24);

}

void __74__UITableCellAccessoryLayout__totalWidthForAccessories_withContainerSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_layoutWidthForAccessory:withItemWidth:", v10);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(double (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9)+ *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 24);

  }
}

- (CGRect)_frameForAccessoryAtIndex:(unint64_t)a3 inAccessories:(id)a4 containerSize:(CGSize)a5 withXOrigin:(double *)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double (**spacingBlock)(id, void *, void *);
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  double v42;
  double v43;
  char v44;
  CGRect result;

  height = a5.height;
  width = a5.width;
  v11 = a4;
  objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", width, height);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  _AccessoryFontForLineHeightAlignment(v17, &v44);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __96__UITableCellAccessoryLayout__frameForAccessoryAtIndex_inAccessories_containerSize_withXOrigin___block_invoke;
    v40 = &unk_1E16B4E70;
    v19 = v17;
    v41 = v19;
    v42 = v14;
    v43 = v16;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v37);
    _UITableCellLineHeightCenteredViewInRect(v19, v18, 0.0, 0.0, width, height);
    v21 = v20;

  }
  else
  {
    UIRoundToViewScale(v17);
    v21 = v22;
  }
  -[UITableCellAccessoryLayout _layoutWidthForAccessory:withItemWidth:](self, "_layoutWidthForAccessory:withItemWidth:", v12, v14, v37, v38, v39, v40);
  v24 = v23;
  v25 = 0.0;
  if (objc_msgSend(v11, "count") - 1 > a3)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3 + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    spacingBlock = (double (**)(id, void *, void *))self->_spacingBlock;
    objc_msgSend(v12, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = spacingBlock[2](spacingBlock, v28, v29);

  }
  v30 = *a6;
  v31 = v24 + v25 + *a6;
  if (self->_edge != 8)
  {
    v31 = *a6 - (v24 + v25);
    v30 = *a6 - v24;
  }
  v32 = (v24 - v14) * 0.5 + v30;
  *a6 = v31;

  v33 = v32;
  v34 = v21;
  v35 = v14;
  v36 = v16;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (double)_layoutWidthForAccessory:(id)a3 withItemWidth:(double)a4
{
  id v6;
  double v7;
  double v8;
  void *v10;
  id v11;
  char v12;

  v6 = a3;
  objc_msgSend(v6, "reservedLayoutWidth");
  if (v7 == 1.79769313e308)
    goto LABEL_8;
  if (v7 == -1.79769313e308)
    goto LABEL_3;
  if (v7 != -1000.0)
  {
    if (v7 != 0.0)
    {
      a4 = v7;
      goto LABEL_8;
    }
    v12 = 0;
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _AccessoryFontForLineHeightAlignment(v10, &v12);

    if (!v12)
      goto LABEL_8;
LABEL_3:
    -[UITableCellAccessoryLayout _standardLayoutWidth](self, "_standardLayoutWidth");
    goto LABEL_6;
  }
  -[UITableCellAccessoryLayout _disclosureLayoutWidth](self, "_disclosureLayoutWidth");
LABEL_6:
  if (v8 > 0.0)
    a4 = v8;
LABEL_8:

  return a4;
}

- (double)_standardLayoutWidth
{
  void (**standardLayoutWidthProvider)(void);
  double result;

  standardLayoutWidthProvider = (void (**)(void))self->_standardLayoutWidthProvider;
  if (!standardLayoutWidthProvider)
    return 0.0;
  standardLayoutWidthProvider[2]();
  return result;
}

- (void)setSpacingBlock:(id)a3
{
  void *v4;
  id spacingBlock;
  id WeakRetained;

  if (self->_spacingBlock != a3)
  {
    v4 = _Block_copy(a3);
    spacingBlock = self->_spacingBlock;
    self->_spacingBlock = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (double)initialAlphaForAccessory:(id)a3
{
  NSMutableDictionary *initialAlphas;
  void *v4;
  void *v5;
  double v6;
  double v7;

  initialAlphas = self->_initialAlphas;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](initialAlphas, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (CGRect)finalFrameForAccessory:(id)a3
{
  NSDictionary *finalFrames;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  finalFrames = self->_finalFrames;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](finalFrames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)finalAlphaForAccessory:(id)a3
{
  NSMutableDictionary *finalAlphas;
  void *v4;
  void *v5;
  double v6;
  double v7;

  finalAlphas = self->_finalAlphas;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](finalAlphas, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (CGRect)initialFrameForAccessory:(id)a3
{
  NSDictionary *initialFrames;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  initialFrames = self->_initialFrames;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](initialFrames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAlphas, 0);
  objc_storeStrong((id *)&self->_initialAlphas, 0);
  objc_storeStrong((id *)&self->_finalFrames, 0);
  objc_storeStrong((id *)&self->_initialFrames, 0);
  objc_storeStrong(&self->_spacingBlock, 0);
  objc_storeStrong(&self->_disclosureLayoutWidthProvider, 0);
  objc_storeStrong(&self->_standardLayoutWidthProvider, 0);
  objc_destroyWeak((id *)&self->_manager);
}

uint64_t __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  if (objc_msgSend(v5, "count") <= a3)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if ((_DWORD)v9)
        break;
      ++a3;
    }
    while (a3 < objc_msgSend(v5, "count"));
  }

  return v9;
}

- (double)_disclosureLayoutWidth
{
  void (**disclosureLayoutWidthProvider)(void);
  double result;

  disclosureLayoutWidthProvider = (void (**)(void))self->_disclosureLayoutWidthProvider;
  if (!disclosureLayoutWidthProvider)
    return 0.0;
  disclosureLayoutWidthProvider[2]();
  return result;
}

void __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v24))
  {
    if (*(_BYTE *)(a1 + 128))
      v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 104) + 16))() ^ 1;
    else
      v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v24);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 56), "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24, *(double *)(a1 + 112), *(double *)(a1 + 120));
      v11 = v10;
      v13 = v12;
      v15 = v14;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "CGRectValue");
      v18 = v17;
      v11 = v19;
      v13 = v20;
      v15 = v21;

      v9 = v18 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v9, v11, v13, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v22, v24);

    LODWORD(v22) = objc_msgSend(*(id *)(a1 + 80), "containsObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 72), "setObject:forKeyedSubscript:", &unk_1E1A96110, v24);
    if ((_DWORD)v22)
      v23 = &unk_1E1A96110;
    else
      v23 = &unk_1E1A96100;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 80), "setObject:forKeyedSubscript:", v23, v24);
  }

}

- (UICellAccessoryManager)manager
{
  return (UICellAccessoryManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (unint64_t)edge
{
  return self->_edge;
}

- (double)safeAreaInset
{
  return self->_safeAreaInset;
}

- (id)standardLayoutWidthProvider
{
  return self->_standardLayoutWidthProvider;
}

- (id)disclosureLayoutWidthProvider
{
  return self->_disclosureLayoutWidthProvider;
}

- (id)spacingBlock
{
  return self->_spacingBlock;
}

- (CGRect)totalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_totalFrame.origin.x;
  y = self->_totalFrame.origin.y;
  width = self->_totalFrame.size.width;
  height = self->_totalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTotalFrame:(CGRect)a3
{
  self->_totalFrame = a3;
}

- (NSDictionary)initialFrames
{
  return self->_initialFrames;
}

- (void)setInitialFrames:(id)a3
{
  objc_storeStrong((id *)&self->_initialFrames, a3);
}

- (NSDictionary)finalFrames
{
  return self->_finalFrames;
}

- (void)setFinalFrames:(id)a3
{
  objc_storeStrong((id *)&self->_finalFrames, a3);
}

- (NSMutableDictionary)initialAlphas
{
  return self->_initialAlphas;
}

- (void)setInitialAlphas:(id)a3
{
  objc_storeStrong((id *)&self->_initialAlphas, a3);
}

- (NSMutableDictionary)finalAlphas
{
  return self->_finalAlphas;
}

- (void)setFinalAlphas:(id)a3
{
  objc_storeStrong((id *)&self->_finalAlphas, a3);
}

@end
