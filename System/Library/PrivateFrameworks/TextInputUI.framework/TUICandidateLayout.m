@implementation TUICandidateLayout

- (TUICandidateLayout)init
{
  TUICandidateLayout *v2;
  uint64_t v3;
  NSMutableArray *candidateAttributes;
  uint64_t v5;
  NSMutableDictionary *dummyCandidateAttributes;
  uint64_t v7;
  NSMutableArray *lineAttributes;
  uint64_t v9;
  NSMutableArray *slottedCellSeparatorAttributes;
  uint64_t v11;
  NSMutableArray *groupHeaderAttributes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUICandidateLayout;
  v2 = -[TUICandidateLayout init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    candidateAttributes = v2->_candidateAttributes;
    v2->_candidateAttributes = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    dummyCandidateAttributes = v2->_dummyCandidateAttributes;
    v2->_dummyCandidateAttributes = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    lineAttributes = v2->_lineAttributes;
    v2->_lineAttributes = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    slottedCellSeparatorAttributes = v2->_slottedCellSeparatorAttributes;
    v2->_slottedCellSeparatorAttributes = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    groupHeaderAttributes = v2->_groupHeaderAttributes;
    v2->_groupHeaderAttributes = (NSMutableArray *)v11;

    v2->_dirty = 1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[41] = self->_rowType;
  v4[42] = self->_transitionState;
  v5 = -[NSIndexPath copy](self->_oldFirstVisibleIndexPath, "copy");
  v6 = (void *)v4[44];
  v4[44] = v5;

  v4[45] = *(_QWORD *)&self->_oldFirstVisibleOffset;
  v4[46] = *(_QWORD *)&self->_customHeaderHeight;
  *((_BYTE *)v4 + 321) = self->_candidateNumberEnabled;
  v4[47] = self->_columnsCount;
  v4[48] = *(_QWORD *)&self->_singleSlottedCellMargin;
  v7 = *(_OWORD *)&self->_gridPadding.bottom;
  *((_OWORD *)v4 + 27) = *(_OWORD *)&self->_gridPadding.top;
  *((_OWORD *)v4 + 28) = v7;
  v8 = *(_OWORD *)&self->_gridLinePadding.bottom;
  *((_OWORD *)v4 + 29) = *(_OWORD *)&self->_gridLinePadding.top;
  *((_OWORD *)v4 + 30) = v8;
  v4[50] = *(_QWORD *)&self->_interRowSpacing;
  v4[51] = *(_QWORD *)&self->_slottedCandidatesIterItemSpacing;
  *((_BYTE *)v4 + 323) = self->_hideSlottedCellSeparators;
  *((_OWORD *)v4 + 26) = self->_gridLineOffset;
  *((_BYTE *)v4 + 325) = self->_fillGridWithLines;
  v4[49] = *(_QWORD *)&self->_minimumInterItemSpacing;
  *((_BYTE *)v4 + 322) = self->_shouldJustifyRow;
  return v4;
}

- (void)clearLayoutAttributes
{
  TUICandidateLayoutAttributes *customHeaderAttributes;

  -[NSMutableArray removeAllObjects](self->_candidateAttributes, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_dummyCandidateAttributes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_lineAttributes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_slottedCellSeparatorAttributes, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_groupHeaderAttributes, "removeAllObjects");
  customHeaderAttributes = self->_customHeaderAttributes;
  self->_customHeaderAttributes = 0;

}

- (void)invalidateLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayout;
  -[TUICandidateLayout invalidateLayout](&v3, sel_invalidateLayout);
  -[TUICandidateLayout clearLayoutAttributes](self, "clearLayoutAttributes");
  self->_dirty = 1;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  BOOL v9;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUICandidateLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = v8 != CGRectGetWidth(v12);

  return v9;
}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayout;
  -[TUICandidateLayout prepareLayout](&v3, sel_prepareLayout);
  if (self->_dirty)
  {
    -[TUICandidateLayout clearLayoutAttributes](self, "clearLayoutAttributes");
    if (-[TUICandidateLayout rowType](self, "rowType"))
      -[TUICandidateLayout prepareLayoutForMultiRow](self, "prepareLayoutForMultiRow");
    else
      -[TUICandidateLayout prepareLayoutForSingleRow](self, "prepareLayoutForSingleRow");
    self->_dirty = 0;
  }
}

- (void)prepareLayoutForSingleRow
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  unint64_t v24;

  -[TUICandidateLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[TUICandidateLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "numberOfSectionsInCollectionView:", v4);

  if (v5)
  {
    -[TUICandidateLayout gridPadding](self, "gridPadding");
    v7 = v6;
    v8 = objc_msgSend(v23, "slottedCandidatesCount");
    if (v8 + objc_msgSend(v23, "autofillExtraCandidatesCount"))
    {
      -[TUICandidateLayout layoutSlottedCandidates](self, "layoutSlottedCandidates");
    }
    else
    {
      v9 = 0;
      v24 = 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_candidateAttributes, "addObject:", v10);
        -[TUICandidateLayout collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v23, "collectionView:numberOfItemsInSection:", v11, v9);

        if (v12 >= 1)
        {
          for (i = 0; i != v12; ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUICandidateLayout collectionView](self, "collectionView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "collectionView:layout:sizeForItemAtIndexPath:", v15, self, v14);
            v17 = v16;
            v19 = v18;

            +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setFrame:", v7, 0.0, v17, v19);
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            v22 = v21;
            objc_msgSend(v10, "addObject:", v20);
            if (-[TUICandidateLayout candidateNumberEnabled](self, "candidateNumberEnabled") && v24 <= 9)
            {
              objc_msgSend(v20, "setCandidateNumber:");
              ++v24;
            }
            v7 = v7 + v17 + v22;

          }
        }

        ++v9;
      }
      while (v9 != v5);
    }
  }

}

- (void)layoutSlottedCandidates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  _BOOL8 v11;
  void *v12;
  double Width;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, double);
  void *v32;
  CGFloat MinX;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  CGFloat MaxX;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[9];
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49 = *MEMORY[0x1E0C80C00];
  -[TUICandidateLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUICandidateLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numberOfSectionsInCollectionView:", v5);

  if (v6 == 1)
  {
    v7 = objc_msgSend(v4, "slottedCandidatesCount");
    v8 = objc_msgSend(v4, "autofillExtraCandidatesCount");
    -[TUICandidateLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v9, 0);

    if (v7)
      v10 = v7;
    else
      v10 = 1;
    if (v8)
      v11 = v7 != 0;
    else
      v11 = 0;
    -[TUICandidateLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    Width = CGRectGetWidth(v50);

    -[TUICandidateLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView:layout:sizeForItemAtIndexPath:", v14, self, v15);
    v17 = v16;

    -[TUICandidateLayout collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TUIScreenScaleForView(v18);

    if (v11 || v10 != 1)
    {
      v20 = 0.0;
      if (v11)
        v22 = 50.0;
      else
        v22 = 0.0;
      if (v10 == 1 && v11)
      {
        -[TUICandidateLayout singleSlottedCellMargin](self, "singleSlottedCellMargin");
        v22 = 50.0;
        if (v23 > 0.0)
          v20 = 50.0;
        else
          v20 = 0.0;
      }
    }
    else
    {
      -[TUICandidateLayout singleSlottedCellMargin](self, "singleSlottedCellMargin");
      v20 = v19;
      -[TUICandidateLayout singleSlottedCellMargin](self, "singleSlottedCellMargin");
      v22 = v21;
    }
    -[TUICandidateLayout slottedCandidatesIterItemSpacing](self, "slottedCandidatesIterItemSpacing");
    if ((Width - v20 - v22 - v24 * (double)(v10 + v11 - 1)) / (double)v10 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_candidateAttributes, "addObject:", v25);
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUICandidateLayout slottedCandidatesIterItemSpacing](self, "slottedCandidatesIterItemSpacing");
        UIRectIntegralWithScale();
        objc_msgSend(v28, "setFrame:");
        objc_msgSend(v25, "addObject:", v28);

      }
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        UIRectIntegralWithScale();
        objc_msgSend(v30, "setFrame:");
        objc_msgSend(v25, "addObject:", v30);

      }
      if (-[NSMutableArray count](self->_candidateAttributes, "count")
        && !-[TUICandidateLayout hideSlottedCellSeparators](self, "hideSlottedCellSeparators"))
      {
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2020000000;
        v47[3] = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__TUICandidateLayout_layoutSlottedCandidates__block_invoke;
        aBlock[3] = &unk_1E24FAB50;
        *(double *)&aBlock[6] = Width;
        aBlock[7] = 0x3FF0000000000000;
        aBlock[8] = v17;
        aBlock[4] = self;
        aBlock[5] = v47;
        v31 = (void (**)(_QWORD, double))_Block_copy(aBlock);
        if (objc_msgSend(v25, "count"))
        {
          objc_msgSend(v25, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "frame");
          MinX = CGRectGetMinX(v51);
          v31[2](v31, MinX);

        }
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v34 = v25;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
        if (v35)
        {
          v36 = v35;
          v37 = 0;
          v38 = *(_QWORD *)v43;
          do
          {
            v39 = 0;
            v40 = v37;
            do
            {
              if (*(_QWORD *)v43 != v38)
                objc_enumerationMutation(v34);
              v37 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * v39);

              objc_msgSend(v37, "frame");
              MaxX = CGRectGetMaxX(v52);
              v31[2](v31, MaxX);
              ++v39;
              v40 = v37;
            }
            while (v36 != v39);
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
          }
          while (v36);

        }
        _Block_object_dispose(v47, 8);
      }

    }
  }

}

- (void)prepareLayoutForMultiRow
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  double Height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  BOOL v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void (**v38)(void *, _QWORD, uint64_t);
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t i;
  void *v48;
  int64_t v49;
  void *v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  unint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  int v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  void *v81;
  TUICandidateLayoutAttributes *v82;
  TUICandidateLayoutAttributes *customHeaderAttributes;
  double v84;
  double v85;
  double v86;
  double v87;
  double j;
  void *v89;
  double v90;
  double v91;
  BOOL v92;
  uint64_t v93;
  __int128 v94;
  void (**v95)(_QWORD, _QWORD, _QWORD);
  BOOL v96;
  _QWORD aBlock[16];
  BOOL v98;
  BOOL v99;
  _QWORD v100[5];
  id v101;
  uint64_t v102;
  double *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  void *v117;
  __int128 v118;
  uint64_t v119;
  double *v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  double *v124;
  uint64_t v125;
  double v126;

  -[TUICandidateLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[TUICandidateLayout layoutOrientation](self, "layoutOrientation");
  -[TUICandidateLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  if (v5 == 1)
    Height = CGRectGetHeight(*(CGRect *)&v7);
  else
    Height = CGRectGetWidth(*(CGRect *)&v7);
  v12 = Height;

  -[TUICandidateLayout gridPadding](self, "gridPadding");
  v14 = v13;
  -[TUICandidateLayout gridLinePadding](self, "gridLinePadding");
  v16 = v15;
  -[TUICandidateLayout collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "numberOfSectionsInCollectionView:", v17);

  if (v18)
  {
    v19 = 0;
    v20 = 0.0;
    do
    {
      -[TUICandidateLayout collectionView](self, "collectionView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "collectionView:layout:widthForGroupHeaderInSection:", v21, self, v19);
      v23 = v22;

      if (v20 < v23)
        v20 = v23;
      ++v19;
    }
    while (v18 != v19);
    v24 = 0;
    v25 = v20 > 0.0;
    if (v18 == 1 && v20 <= 0.0)
    {
      v24 = -[TUICandidateLayout shouldJustifyRow](self, "shouldJustifyRow");
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    v24 = 0;
    v20 = 0.0;
  }
  v26 = v12 - v14;
  v96 = v24;
  if (!v24 && v26 > 15.0 && -[TUICandidateLayout showsIndex](self, "showsIndex"))
    v26 = v26 + -15.0;
  -[TUICandidateLayout collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = TUIScreenScaleForView(v27);

  if (v25)
    v29 = v20;
  else
    v29 = 0.0;
  -[TUICandidateLayout gridPadding](self, "gridPadding");
  v31 = v29 + v30;
  v123 = 0;
  v124 = (double *)&v123;
  v125 = 0x2020000000;
  v126 = v29 + v30;
  v119 = 0;
  v120 = (double *)&v119;
  v121 = 0x2020000000;
  v122 = 0.0;
  -[TUICandidateLayout gridPadding](self, "gridPadding");
  v33 = v32;
  -[TUICandidateLayout gridLinePadding](self, "gridLinePadding");
  v122 = v33 + v34;
  v114 = 0;
  v115 = &v114;
  v116 = 0x3010000000;
  v117 = &unk_18C81310E;
  v94 = *MEMORY[0x1E0C9D820];
  v118 = *MEMORY[0x1E0C9D820];
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v113 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  -[TUICandidateLayout oldFirstVisibleIndexPath](self, "oldFirstVisibleIndexPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "row"))
    v36 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v36 = 0;

  v109 = v36;
  v102 = 0;
  v103 = (double *)&v102;
  v104 = 0x2020000000;
  v105 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy_;
  v100[4] = __Block_byref_object_dispose_;
  v101 = 0;
  if (v31 < v26 && v18 >= 1)
  {
    v93 = v18;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__TUICandidateLayout_prepareLayoutForMultiRow__block_invoke;
    aBlock[3] = &unk_1E24FAB78;
    v92 = v25;
    v98 = v25;
    aBlock[4] = self;
    aBlock[5] = &v110;
    aBlock[6] = &v106;
    aBlock[7] = &v102;
    aBlock[8] = v100;
    aBlock[9] = &v114;
    v99 = v96;
    *(double *)&aBlock[12] = v31;
    *(double *)&aBlock[13] = v26;
    aBlock[10] = &v123;
    aBlock[11] = &v119;
    *(double *)&aBlock[14] = v28;
    *(double *)&aBlock[15] = v12 - v16;
    v38 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
    if (-[TUICandidateLayout showExtraLineBeforeFirstRow](self, "showExtraLineBeforeFirstRow"))
      v38[2](v38, 0, 1);
    v39 = 0;
    v40 = v26 - v31;
    v95 = (void (**)(_QWORD, _QWORD, _QWORD))v38;
    do
    {
      -[TUICandidateLayout collectionView](self, "collectionView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v4;
      v43 = objc_msgSend(v4, "collectionView:numberOfItemsInSection:", v41, v39);

      *((_OWORD *)v115 + 2) = v94;
      v44 = v120[3];
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_candidateAttributes, "addObject:", v45);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43 >= 1)
      {
        for (i = 0; i != v43; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[TUICandidateLayout layoutOrientation](self, "layoutOrientation");
          -[TUICandidateLayout collectionView](self, "collectionView");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
            v51 = 0;
          else
            v51 = v48;
          objc_msgSend(v42, "collectionView:layout:sizeForItemAtIndexPath:", v50, self, v51);
          v52 = v115;
          v115[4] = v53;
          v52[5] = v54;

          v55 = v124[3];
          -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
          if (v124[3] > v31)
          {
            if (v55 + v56 + *((double *)v115 + 4) > v26
              || -[TUICandidateLayout columnsCount](self, "columnsCount")
              && (v57 = objc_msgSend(v46, "count"), v57 >= -[TUICandidateLayout columnsCount](self, "columnsCount")))
            {
              ((void (**)(_QWORD, void *, _QWORD))v95)[2](v95, v46, 0);
            }
          }
          if (v107[3] != v111[3] || -[TUICandidateLayout transitionState](self, "transitionState") != 1)
          {
            v58 = *((double *)v115 + 4);
            if (v58 >= v40)
              v58 = v26 - v31;
            *((double *)v115 + 4) = v58;
          }
          if (!v96 && -[TUICandidateLayout columnsCount](self, "columnsCount"))
          {
            v59 = *((double *)v115 + 4);
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            v61 = v40 - v60 * (double)-[TUICandidateLayout columnsCount](self, "columnsCount");
            v62 = v61 / (double)-[TUICandidateLayout columnsCount](self, "columnsCount");
            if (v59 >= v62)
              v62 = v59;
            *((double *)v115 + 4) = v62;
          }
          if (-[TUICandidateLayout transitionState](self, "transitionState"))
          {
            -[TUICandidateLayout oldFirstVisibleIndexPath](self, "oldFirstVisibleIndexPath");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v48, "isEqual:", v63);

            if (v64)
            {
              v107[3] = v111[3];
              if (-[TUICandidateLayout transitionState](self, "transitionState") != 1
                || objc_msgSend(v48, "item")
                || objc_msgSend(v48, "section")
                || (-[TUICandidateLayout oldFirstVisibleOffset](self, "oldFirstVisibleOffset"), v65 < 0.0))
              {
                v66 = v124[3];
                -[TUICandidateLayout oldFirstVisibleOffset](self, "oldFirstVisibleOffset");
                v68 = v66 - v67;
              }
              else
              {
                v68 = fmax(*((double *)v115 + 4) - v40, 0.0);
              }
              v103[3] = v68;
            }
          }
          +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v48);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v46, "count"))
          {
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            v71 = v70 + v124[3];
            v124[3] = v71;
          }
          else
          {
            v71 = v124[3];
          }
          objc_msgSend(v69, "setFrame:", v71, v120[3], *((double *)v115 + 4), *((double *)v115 + 5));
          objc_msgSend(v69, "setRow:", v111[3]);
          objc_msgSend(v45, "addObject:", v69);
          objc_msgSend(v46, "addObject:", v69);
          v124[3] = *((double *)v115 + 4) + v124[3];

        }
      }
      ((void (**)(_QWORD, void *, uint64_t))v95)[2](v95, v46, 1);
      if (v92)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v39);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("GroupHeader"), v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUICandidateLayout gridPadding](self, "gridPadding");
        objc_msgSend(v73, "setFrame:", v74, v44, v20, v120[3] - v44);
        -[NSMutableArray addObject:](self->_groupHeaderAttributes, "addObject:", v73);

      }
      ++v39;
      v4 = v42;
    }
    while (v39 != v93);
    if (*((double *)v115 + 5) < 1.0)
    {
      -[TUICandidateLayout collectionView](self, "collectionView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "collectionView:layout:sizeForItemAtIndexPath:", v75, self, 0);
      v76 = v115;
      v115[4] = v77;
      v76[5] = v78;

    }
    if (-[TUICandidateLayout fillGridWithLines](self, "fillGridWithLines"))
    {
      v79 = *((double *)v115 + 5);
      if (v79 >= 1.0)
      {
        v87 = v120[3];
        for (j = v87 + v79; ; j = v120[3] + *((double *)v115 + 5))
        {
          -[TUICandidateLayout collectionView](self, "collectionView");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "bounds");
          v91 = v87 + v90;

          if (j >= v91)
            break;
          v95[2](v95, 0, 1);
        }
      }
    }
    -[TUICandidateLayout customHeaderHeight](self, "customHeaderHeight");
    if (v80 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("CustomHeader"), v81);
      v82 = (TUICandidateLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      customHeaderAttributes = self->_customHeaderAttributes;
      self->_customHeaderAttributes = v82;

      -[TUICandidateLayout customHeaderHeight](self, "customHeaderHeight");
      v85 = -v84;
      -[TUICandidateLayout customHeaderHeight](self, "customHeaderHeight");
      -[UICollectionViewLayoutAttributes setFrame:](self->_customHeaderAttributes, "setFrame:", 0.0, v85, v26, v86);
    }
    if (-[TUICandidateLayout layoutOrientation](self, "layoutOrientation") == 1
      && -[TUICandidateLayout columnsCount](self, "columnsCount") == 1
      && !-[TUICandidateLayout fillGridWithLines](self, "fillGridWithLines"))
    {
      -[TUICandidateLayout rotateAttributesBy90Degrees](self, "rotateAttributesBy90Degrees");
    }

  }
  _Block_object_dispose(v100, 8);

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

}

- (void)rotateAttributesBy90Degrees
{
  void *v3;
  void *v4;
  double MaxY;
  void *v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v43 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_lineAttributes, "removeAllObjects");
  -[NSMutableArray lastObject](self->_candidateAttributes, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MaxY = CGRectGetMaxY(v44);

  -[TUICandidateLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (MaxY >= v8)
    v9 = MaxY;
  else
    v9 = v8;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = self->_candidateAttributes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_msgSend(v21, "frame");
              objc_msgSend(v21, "setFrame:", v9 - CGRectGetMaxY(v45), v45.origin.x, v45.size.height, v45.size.width);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          }
          while (v18);
        }

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v12);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self->_groupHeaderAttributes;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
        objc_msgSend(v27, "frame", (_QWORD)v28);
        objc_msgSend(v27, "setFrame:", v9 - CGRectGetMaxY(v46), v46.origin.x, v46.size.height, v46.size.width);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v24);
  }

}

- (void)justify:(id)a3 rowStartX:(double)a4 maxWidth:(double)a5 remainingWidth:(double)a6 endOfSection:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t i;
  double v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  void *v44;
  double y;
  double width;
  double height;
  double v48;
  CGFloat v49;
  double MaxX;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v7 = a7;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    v13 = a5 - a4;
    v14 = objc_msgSend(v12, "count");
    -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
    v16 = v15;
    v17 = objc_msgSend(v12, "count");
    v18 = -[TUICandidateLayout columnsCount](self, "columnsCount");
    v19 = objc_msgSend(v12, "count");
    if (v18 <= v19)
      v18 = v19;
    if (v13 > 0.0)
    {
      v20 = objc_msgSend(v12, "count");
      if (a6 > 0.0)
      {
        if (v20)
        {
          v21 = v13 - (double)(unint64_t)(v14 - 1) * v16;
          v22 = v21 / (double)v17;
          if (v7 && v21 * 0.5 < a6)
          {
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            v22 = (v13 - ((double)v18 + -1.0) * v23) / (double)v18;
            v24 = (double)(uint64_t)fmax((double)v18 - (double)(unint64_t)objc_msgSend(v12, "count"), 0.0);
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            v26 = floor((a6 - v24 * v25) / v22);
            if (v26 > v24)
              v26 = v24;
            v27 = (double)(uint64_t)v26;
            -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
            a6 = a6 - v22 * v27 - v27 * v28;
          }
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          v29 = v12;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
          if (!v30)
            goto LABEL_31;
          v31 = v30;
          v32 = *(_QWORD *)v58;
          v33 = 0.0;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v58 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "frame");
              v35 = v22 - CGRectGetWidth(v64);
              if (v35 < 1.0)
                v35 = 1.0;
              v33 = v33 + v35;
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
          }
          while (v31);

          if (v33 > 0.0)
          {
            -[TUICandidateLayout collectionView](self, "collectionView");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = TUIScreenScaleForView(v36);

            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v37 = v29;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v54;
              v41 = a6 / v33;
              do
              {
                v42 = 0;
                v43 = a4;
                do
                {
                  if (*(_QWORD *)v54 != v40)
                    objc_enumerationMutation(v37);
                  v44 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v42);
                  objc_msgSend(v44, "frame");
                  y = v65.origin.y;
                  width = v65.size.width;
                  height = v65.size.height;
                  v48 = v22 - CGRectGetWidth(v65);
                  if (v48 < 1.0)
                    v48 = 1.0;
                  v49 = width + v41 * v48;
                  v66.origin.x = v43;
                  v66.origin.y = y;
                  v66.size.width = v49;
                  v66.size.height = height;
                  MaxX = CGRectGetMaxX(v66);
                  -[TUICandidateLayout minimumInterItemSpacing](self, "minimumInterItemSpacing");
                  a4 = MaxX + v51;
                  objc_msgSend(v44, "setFrame:", TUIRectIntegralWithScale(v43, y, v49, height, v52));
                  ++v42;
                  v43 = a4;
                }
                while (v39 != v42);
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
              }
              while (v39);
            }
LABEL_31:

          }
        }
      }
    }
  }

}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat MaxX;
  void *v8;
  double v9;
  double MaxY;
  void *v11;
  void *v12;
  double Height;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[NSMutableArray lastObject](self->_candidateAttributes, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TUICandidateLayout rowType](self, "rowType"))
  {
    if (-[TUICandidateLayout layoutOrientation](self, "layoutOrientation") == 1)
    {
      -[NSMutableArray firstObject](self->_candidateAttributes, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      MaxX = CGRectGetMaxX(v21);
      -[TUICandidateLayout collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      MaxY = v9;

    }
    else
    {
      if (-[TUICandidateLayout transitionState](self, "transitionState"))
      {
        -[TUICandidateLayout collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        Height = CGRectGetHeight(v23);

      }
      else
      {
        Height = 0.0;
      }
      -[TUICandidateLayout collectionView](self, "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      MaxX = CGRectGetWidth(v26);
      objc_msgSend(v4, "frame");
      MaxY = Height + CGRectGetMaxY(v27);

    }
  }
  else
  {
    if (-[NSMutableArray count](self->_slottedCellSeparatorAttributes, "count"))
    {
      -[TUICandidateLayout collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      MaxX = CGRectGetWidth(v22);

    }
    else
    {
      objc_msgSend(v4, "frame");
      MaxX = CGRectGetMaxX(v24);
    }
    objc_msgSend(v4, "frame");
    MaxY = CGRectGetMaxY(v25);
    -[TUICandidateLayout collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;

    if (MaxY >= v16)
      MaxY = v16;
  }

  v18 = MaxX;
  v19 = MaxY;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  void (**v10)(void *, _QWORD);
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  TUICandidateLayoutAttributes *customHeaderAttributes;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[4];
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  CGRectGetMaxY(a3);
  v8 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__TUICandidateLayout_layoutAttributesForElementsInRect___block_invoke;
  aBlock[3] = &unk_1E24FABA0;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  v9 = v8;
  v29 = v9;
  v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_candidateAttributes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v10[2](v10, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v13);
  }

  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_lineAttributes);
  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_slottedCellSeparatorAttributes);
  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_groupHeaderAttributes);
  customHeaderAttributes = self->_customHeaderAttributes;
  if (customHeaderAttributes)
  {
    -[UICollectionViewLayoutAttributes frame](customHeaderAttributes, "frame", (_QWORD)v24);
    v37.origin.x = v17;
    v37.origin.y = v18;
    v37.size.width = v19;
    v37.size.height = v20;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    if (CGRectIntersectsRect(v36, v37))
      objc_msgSend(v9, "addObject:", self->_customHeaderAttributes);
  }
  -[NSMutableDictionary allValues](self->_dummyCandidateAttributes, "allValues", (_QWORD)v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v21);

  v22 = v9;
  return v22;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 >= -[NSMutableArray count](self->_candidateAttributes, "count")
    || (v6 = objc_msgSend(v4, "row"),
        -[NSMutableArray objectAtIndexedSubscript:](self->_candidateAttributes, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "count"), v7, v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_candidateAttributes, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)keyForDummyCandidateIndexPath:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%lld,%lld"), v5, v6);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableArray *groupHeaderAttributes;
  uint64_t v11;
  TUICandidateLayoutAttributes *v12;
  void *v13;
  unint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Line")))
  {
    v8 = objc_msgSend(v7, "row");
    v9 = 288;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("SlottedCellSeparator")))
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("GroupHeader")))
      {
        v14 = objc_msgSend(v7, "section");
        if (v14 < -[NSMutableArray count](self->_groupHeaderAttributes, "count"))
        {
          groupHeaderAttributes = self->_groupHeaderAttributes;
          v11 = objc_msgSend(v7, "section");
          goto LABEL_7;
        }
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("CustomHeader")))
        {
          v12 = self->_customHeaderAttributes;
          goto LABEL_8;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("DummyCandidate")))
        {
          -[TUICandidateLayout keyForDummyCandidateIndexPath:](self, "keyForDummyCandidateIndexPath:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_dummyCandidateAttributes, "objectForKey:", v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
      }
LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
    v8 = objc_msgSend(v7, "row");
    v9 = 296;
  }
  if (v8 >= objc_msgSend(*(id *)((char *)&self->super.super.isa + v9), "count"))
    goto LABEL_16;
  groupHeaderAttributes = *(NSMutableArray **)((char *)&self->super.super.isa + v9);
  v11 = objc_msgSend(v7, "row");
LABEL_7:
  -[NSMutableArray objectAtIndexedSubscript:](groupHeaderAttributes, "objectAtIndexedSubscript:", v11);
  v12 = (TUICandidateLayoutAttributes *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = v12;
LABEL_17:

  return v13;
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (void)setRowType:(int64_t)a3
{
  self->_rowType = a3;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (void)setTransitionState:(int64_t)a3
{
  self->_transitionState = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (NSIndexPath)oldFirstVisibleIndexPath
{
  return self->_oldFirstVisibleIndexPath;
}

- (void)setOldFirstVisibleIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_oldFirstVisibleIndexPath, a3);
}

- (double)oldFirstVisibleOffset
{
  return self->_oldFirstVisibleOffset;
}

- (void)setOldFirstVisibleOffset:(double)a3
{
  self->_oldFirstVisibleOffset = a3;
}

- (double)customHeaderHeight
{
  return self->_customHeaderHeight;
}

- (void)setCustomHeaderHeight:(double)a3
{
  self->_customHeaderHeight = a3;
}

- (BOOL)candidateNumberEnabled
{
  return self->_candidateNumberEnabled;
}

- (void)setCandidateNumberEnabled:(BOOL)a3
{
  self->_candidateNumberEnabled = a3;
}

- (unint64_t)columnsCount
{
  return self->_columnsCount;
}

- (void)setColumnsCount:(unint64_t)a3
{
  self->_columnsCount = a3;
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (double)minimumInterItemSpacing
{
  return self->_minimumInterItemSpacing;
}

- (void)setMinimumInterItemSpacing:(double)a3
{
  self->_minimumInterItemSpacing = a3;
}

- (BOOL)shouldJustifyRow
{
  return self->_shouldJustifyRow;
}

- (void)setShouldJustifyRow:(BOOL)a3
{
  self->_shouldJustifyRow = a3;
}

- (UIEdgeInsets)gridPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridPadding.top;
  left = self->_gridPadding.left;
  bottom = self->_gridPadding.bottom;
  right = self->_gridPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridPadding:(UIEdgeInsets)a3
{
  self->_gridPadding = a3;
}

- (UIEdgeInsets)gridLinePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_gridLinePadding.top;
  left = self->_gridLinePadding.left;
  bottom = self->_gridLinePadding.bottom;
  right = self->_gridLinePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGridLinePadding:(UIEdgeInsets)a3
{
  self->_gridLinePadding = a3;
}

- (double)interRowSpacing
{
  return self->_interRowSpacing;
}

- (void)setInterRowSpacing:(double)a3
{
  self->_interRowSpacing = a3;
}

- (double)slottedCandidatesIterItemSpacing
{
  return self->_slottedCandidatesIterItemSpacing;
}

- (void)setSlottedCandidatesIterItemSpacing:(double)a3
{
  self->_slottedCandidatesIterItemSpacing = a3;
}

- (BOOL)hideSlottedCellSeparators
{
  return self->_hideSlottedCellSeparators;
}

- (void)setHideSlottedCellSeparators:(BOOL)a3
{
  self->_hideSlottedCellSeparators = a3;
}

- (CGPoint)gridLineOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_gridLineOffset.x;
  y = self->_gridLineOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGridLineOffset:(CGPoint)a3
{
  self->_gridLineOffset = a3;
}

- (BOOL)showExtraLineBeforeFirstRow
{
  return self->_showExtraLineBeforeFirstRow;
}

- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3
{
  self->_showExtraLineBeforeFirstRow = a3;
}

- (BOOL)fillGridWithLines
{
  return self->_fillGridWithLines;
}

- (void)setFillGridWithLines:(BOOL)a3
{
  self->_fillGridWithLines = a3;
}

- (BOOL)showsIndex
{
  return self->_showsIndex;
}

- (void)setShowsIndex:(BOOL)a3
{
  self->_showsIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFirstVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_customHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_groupHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_slottedCellSeparatorAttributes, 0);
  objc_storeStrong((id *)&self->_lineAttributes, 0);
  objc_storeStrong((id *)&self->_dummyCandidateAttributes, 0);
  objc_storeStrong((id *)&self->_candidateAttributes, 0);
}

void __56__TUICandidateLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "frame");
        v19.origin.x = v9;
        v19.origin.y = v10;
        v19.size.width = v11;
        v19.size.height = v12;
        if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v19))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

void __46__TUICandidateLayout_prepareLayoutForMultiRow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  double MaxX;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  unsigned int v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + 1
    && !*(_BYTE *)(a1 + 128))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "transitionState") == 1
      || objc_msgSend(*(id *)(a1 + 32), "transitionState") == 2;
  }
  else
  {
    v6 = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "transitionState") == 1)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v70 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            objc_msgSend(v12, "frame");
            objc_msgSend(v12, "setFrame:", v13 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        }
        while (v9);
      }

    }
    v14 = objc_msgSend(v5, "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(id *)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
LABEL_24:

    goto LABEL_25;
  }
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    MaxX = CGRectGetMaxX(v78);

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v16 = v5;
    v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v19)
    {
      v20 = v19;
      v55 = a3;
      v56 = v5;
      v21 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v66 != v21)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          objc_msgSend(v23, "indexPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("DummyCandidate"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "frame");
          objc_msgSend(v25, "setFrame:", v27 + MaxX - *(double *)(*(_QWORD *)(a1 + 32) + 440), v26 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
          v28 = *(void **)(a1 + 32);
          objc_msgSend(v25, "indexPath");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "keyForDummyCandidateIndexPath:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setObject:forKey:", v25, v30);
        }
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v20);
      v5 = v56;
      a3 = v55;
    }
    goto LABEL_24;
  }
LABEL_25:
  if (*(_BYTE *)(a1 + 129)
    && (objc_msgSend(*(id *)(a1 + 32), "transitionState") != 1
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                 + 24)))
  {
    objc_msgSend(*(id *)(a1 + 32), "justify:rowStartX:maxWidth:remainingWidth:endOfSection:", v5, a3, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 104) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "columnsCount") == 1)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v31 = v5;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v62 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
          objc_msgSend(v36, "frame");
          objc_msgSend(v36, "setFrame:");
          if (objc_msgSend(*(id *)(a1 + 32), "candidateNumberEnabled"))
            objc_msgSend(v36, "setCandidateNumber:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      }
      while (v33);
    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "candidateNumberEnabled"))
      goto LABEL_49;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v37 = v5;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v58;
      v41 = 1;
      do
      {
        for (m = 0; m != v39; ++m)
        {
          if (*(_QWORD *)v58 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * m), "setCandidateNumber:", v41 + m);
        }
        v41 += m;
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
      }
      while (v39);
    }
  }

LABEL_49:
  objc_msgSend(v5, "removeAllObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(a1 + 96);
  v43 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "gridLinePadding");
  v45 = v43 + v44;
  objc_msgSend(*(id *)(a1 + 32), "interRowSpacing");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v45
                                                              + v46
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                          + 24);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("Line"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "gridPadding");
    v50 = v49;
  }
  else
  {
    v50 = *(double *)(a1 + 96);
  }
  objc_msgSend(*(id *)(a1 + 32), "gridLineOffset");
  v52 = v50 + v51;
  v53 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) - 1.0 / *(double *)(a1 + 112);
  objc_msgSend(*(id *)(a1 + 32), "gridLineOffset");
  objc_msgSend(v48, "setFrame:", v52, v53 + v54, *(double *)(a1 + 120) - v50, 1.0 / *(double *)(a1 + 112));
  objc_msgSend(v48, "setZIndex:", 10);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) == 0.0
    && (objc_msgSend(*(id *)(a1 + 32), "showExtraLineBeforeFirstRow") & 1) == 0)
  {
    objc_msgSend(v48, "setHidden:", 1);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "addObject:", v48);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __45__TUICandidateLayout_layoutSlottedCandidates__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  id v6;

  if (a2 > 0.0 && *(double *)(a1 + 48) > a2)
  {
    v4 = (void *)MEMORY[0x1E0CB36B0];
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v4, "indexPathForRow:inSection:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](TUICandidateLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("SlottedCellSeparator"), v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setFrame:", a2 - *(double *)(a1 + 56), 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_msgSend(v6, "setZIndex:", 10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "addObject:", v6);

  }
}

@end
