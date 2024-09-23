@implementation PXAssetsTilingLayout

- (PXAssetsTilingLayout)initWithDataSource:(id)a3
{
  id v5;
  PXAssetsTilingLayout *v6;
  PXAssetsTilingLayout *v7;
  PXSelectionBadgeTileUserData *v8;
  PXSelectionBadgeTileUserData *unselectedUserData;
  PXSelectionBadgeTileUserData *v10;
  PXSelectionBadgeTileUserData *selectedUserData;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PXBasicTileUserData *selectedDimmingUserData;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PXBasicTileUserData *highlightedDimmingUserData;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  PXBasicTileUserData *draggingDimmingUserData;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PXAssetsTilingLayout;
  v6 = -[PXTilingLayout init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(PXSelectionBadgeTileUserData);
    unselectedUserData = v7->__unselectedUserData;
    v7->__unselectedUserData = v8;

    v10 = objc_alloc_init(PXSelectionBadgeTileUserData);
    selectedUserData = v7->__selectedUserData;
    v7->__selectedUserData = v10;

    -[PXSelectionBadgeTileUserData setSelected:](v7->__selectedUserData, "setSelected:", 1);
    v12 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorWithAlphaComponent:", 0.25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v14);

    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    selectedDimmingUserData = v7->__selectedDimmingUserData;
    v7->__selectedDimmingUserData = (PXBasicTileUserData *)v15;

    v17 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v19);

    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    highlightedDimmingUserData = v7->__highlightedDimmingUserData;
    v7->__highlightedDimmingUserData = (PXBasicTileUserData *)v20;

    v22 = objc_alloc_init((Class)off_1E50B5EE8);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v24);

    +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v22);
    v25 = objc_claimAutoreleasedReturnValue();
    draggingDimmingUserData = v7->__draggingDimmingUserData;
    v7->__draggingDimmingUserData = (PXBasicTileUserData *)v25;

    v7->_animatedOverlayBehavior = 0;
  }

  return v7;
}

- (PXAssetsTilingLayout)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsTilingLayout.m"), 88, CFSTR("%@ is not available"), v5);

  abort();
}

- (void)setBadgeOptions:(unint64_t)a3
{
  PXOverlayBadgeTileUserData *v4;
  PXOverlayBadgeTileUserData *overlayBadgeTileUserData;
  PXTilingLayoutInvalidationContext *v6;

  if (self->_badgeOptions != a3)
  {
    self->_badgeOptions = a3;
    v4 = objc_alloc_init(PXOverlayBadgeTileUserData);
    overlayBadgeTileUserData = self->_overlayBadgeTileUserData;
    self->_overlayBadgeTileUserData = v4;

    -[PXOverlayBadgeTileUserData setBadgeOptions:](self->_overlayBadgeTileUserData, "setBadgeOptions:", -[PXAssetsTilingLayout badgeOptions](self, "badgeOptions"));
    v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v6, "invalidateAllTiles");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v6);

  }
}

- (CGSize)_preferredSelectionBadgeSize
{
  double v2;
  double v3;
  CGSize result;

  +[PXSelectionBadgeUIViewTile preferredSize](PXSelectionBadgeUIViewTile, "preferredSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHiddenIndexPaths:(id)a3
{
  PXIndexPathSet *v6;
  PXIndexPathSet *hiddenIndexPaths;
  char v8;
  PXTilingLayoutInvalidationContext *v9;
  PXIndexPathSet *v10;
  uint64_t v11;
  PXTilingLayoutInvalidationContext *v12;
  PXTilingLayoutInvalidationContext *v13;
  PXIndexPathSet *v14;
  _QWORD v15[5];
  PXTilingLayoutInvalidationContext *v16;
  SEL v17;
  _QWORD v18[4];
  PXTilingLayoutInvalidationContext *v19;

  v6 = (PXIndexPathSet *)a3;
  hiddenIndexPaths = self->_hiddenIndexPaths;
  if (hiddenIndexPaths != v6)
  {
    v14 = v6;
    v8 = -[PXIndexPathSet isEqual:](hiddenIndexPaths, "isEqual:", v6);
    v6 = v14;
    if ((v8 & 1) == 0)
    {
      v9 = objc_alloc_init(PXTilingLayoutInvalidationContext);
      v10 = self->_hiddenIndexPaths;
      v11 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke;
      v18[3] = &unk_1E513F500;
      v12 = v9;
      v19 = v12;
      -[PXIndexPathSet enumerateAllIndexPathsUsingBlock:](v10, "enumerateAllIndexPathsUsingBlock:", v18);
      objc_storeStrong((id *)&self->_hiddenIndexPaths, a3);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke_2;
      v15[3] = &unk_1E513F528;
      v16 = v12;
      v17 = a2;
      v15[4] = self;
      v13 = v12;
      -[PXIndexPathSet enumerateAllIndexPathsUsingBlock:](v14, "enumerateAllIndexPathsUsingBlock:", v15);
      -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v13);

      v6 = v14;
    }
  }

}

- (void)setSelectionBadgeOptions:(unint64_t)a3
{
  if (self->_selectionBadgeOptions != a3)
  {
    self->_selectionBadgeOptions = a3;
    -[PXAssetsTilingLayout _invalidateAllSelectionTiles](self, "_invalidateAllSelectionTiles");
  }
}

- (void)setSelectedIndexPaths:(id)a3
{
  PXIndexPathSet *v5;
  PXIndexPathSet *v6;

  v5 = (PXIndexPathSet *)a3;
  if (self->_selectedIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedIndexPaths, a3);
    -[PXAssetsTilingLayout _invalidateAllSelectionTiles](self, "_invalidateAllSelectionTiles");
    v5 = v6;
  }

}

- (void)setDraggingIndexPaths:(id)a3
{
  PXIndexPathSet *v5;
  PXIndexPathSet *v6;

  v5 = (PXIndexPathSet *)a3;
  if (self->_draggingIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_draggingIndexPaths, a3);
    -[PXAssetsTilingLayout _invalidateAllSelectionTiles](self, "_invalidateAllSelectionTiles");
    v5 = v6;
  }

}

- (void)setAnimatedOverlayBehavior:(unint64_t)a3
{
  if (self->_animatedOverlayBehavior != a3)
  {
    self->_animatedOverlayBehavior = a3;
    -[PXAssetsTilingLayout _invalidateAllAnimatedOverlayTiles](self, "_invalidateAllAnimatedOverlayTiles");
  }
}

- (void)setHighlightedIndexPath:(PXSimpleIndexPath *)a3
{
  int64x2_t v3;
  int64x2_t v4;
  __int128 v7;
  PXTilingLayoutInvalidationContext *v8;
  PXTilingLayoutInvalidationContext *v9;
  uint64_t v10;
  int64_t dataSourceIdentifier;
  int64_t item;
  int64_t section;
  int64x2_t v18;
  int64x2_t v19;
  __int128 v20;
  int64x2_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v3 = *(int64x2_t *)&self->_highlightedIndexPath.dataSourceIdentifier;
  v4 = *(int64x2_t *)&self->_highlightedIndexPath.item;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, v3), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, v4))), 0xFuLL))) & 1) == 0)
  {
    v7 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_highlightedIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_highlightedIndexPath.item = v7;
    v18 = v4;
    v19 = v3;
    v8 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    v9 = v8;
    v10 = *(_QWORD *)off_1E50B7E98;
    if (v19.i64[0] != *(_QWORD *)off_1E50B7E98
      && v18.i64[0] != 0x7FFFFFFFFFFFFFFFLL
      && v18.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = xmmword_1A7C0C200;
      v21 = v19;
      v22 = v18.i64[0];
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v8, "invalidateTileWithIdentifier:", &v20);
    }
    dataSourceIdentifier = a3->dataSourceIdentifier;
    item = a3->item;
    if (a3->dataSourceIdentifier != v10 && item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = a3->section;
      v20 = xmmword_1A7C0C200;
      v21.i64[0] = dataSourceIdentifier;
      v21.i64[1] = section;
      v22 = item;
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v9, "invalidateTileWithIdentifier:", &v20);
    }
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v9, v18.i64[0]);

  }
}

- (void)setFocusedIndexPath:(PXSimpleIndexPath *)a3
{
  int64x2_t v3;
  int64x2_t v4;
  __int128 v7;
  PXTilingLayoutInvalidationContext *v8;
  PXTilingLayoutInvalidationContext *v9;
  uint64_t v10;
  int64_t dataSourceIdentifier;
  int64_t item;
  int64_t section;
  int64x2_t v18;
  int64x2_t v19;
  __int128 v20;
  int64x2_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v3 = *(int64x2_t *)&self->_focusedIndexPath.dataSourceIdentifier;
  v4 = *(int64x2_t *)&self->_focusedIndexPath.item;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, v3), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, v4))), 0xFuLL))) & 1) == 0)
  {
    v7 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_focusedIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_focusedIndexPath.item = v7;
    v18 = v4;
    v19 = v3;
    v8 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    v9 = v8;
    v10 = *(_QWORD *)off_1E50B7E98;
    if (v19.i64[0] != *(_QWORD *)off_1E50B7E98
      && v18.i64[0] != 0x7FFFFFFFFFFFFFFFLL
      && v18.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = xmmword_1A7C0C200;
      v21 = v19;
      v22 = v18.i64[0];
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v8, "invalidateTileWithIdentifier:", &v20);
    }
    dataSourceIdentifier = a3->dataSourceIdentifier;
    item = a3->item;
    if (a3->dataSourceIdentifier != v10 && item != 0x7FFFFFFFFFFFFFFFLL && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = a3->section;
      v20 = xmmword_1A7C0C200;
      v21.i64[0] = dataSourceIdentifier;
      v21.i64[1] = section;
      v22 = item;
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 0u;
      v25 = 0u;
      v26 = 0;
      -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v9, "invalidateTileWithIdentifier:", &v20);
    }
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v9, v18.i64[0]);

  }
}

- (void)adjustGeometry:(PXTileGeometry *)a3 forContentTileWithIndexPath:(PXSimpleIndexPath *)a4
{
  void *v6;
  __int128 v7;
  _OWORD v8[2];

  -[PXAssetsTilingLayout hiddenIndexPaths](self, "hiddenIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v7;
  if (objc_msgSend(v6, "containsIndexPath:", v8))
    a3->hidden = 1;

}

- (void)enumerateAccessoryTilesForContentTileWithIndexPath:(PXSimpleIndexPath *)a3 geometry:(const PXTileGeometry *)a4 withOptions:(id)a5 usingBlock:(id)a6
{
  id v10;
  _QWORD *v11;
  __int128 v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  void (*v16)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t *v25;
  id *v26;
  __int128 v27;
  _BOOL4 v28;
  uint64_t v29;
  id v30;
  void (*v31)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id *v40;
  __int128 v41;
  _BOOL4 v42;
  uint64_t v43;
  id v44;
  void (*v45)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id *v54;
  __int128 v55;
  _BOOL4 v56;
  uint64_t v57;
  id v58;
  void (*v59)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id *v68;
  __int128 v69;
  _BOOL4 v70;
  uint64_t v71;
  id v72;
  void (*v73)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id *v82;
  __int128 v83;
  _BOOL4 v84;
  uint64_t v85;
  id v86;
  void (*v87)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id *v96;
  __int128 v97;
  _BOOL4 v98;
  uint64_t v99;
  id v100;
  void (*v101)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id *v110;
  __int128 v111;
  _BOOL4 v112;
  uint64_t v113;
  id v114;
  void (*v115)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *);
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  void *v124;
  __int128 v125;
  _QWORD *v126;
  _QWORD v127[5];
  id v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t *v133;
  const PXTileGeometry *v134;
  __int128 v135;
  __int128 v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  id obj;
  uint64_t v163;
  id *v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  id v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  void *v176;
  _BYTE v177[192];
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  void *v181;
  _OWORD v182[5];
  uint64_t v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  char v187;

  v10 = a5;
  v11 = a6;
  v184 = 0;
  v185 = &v184;
  v186 = 0x2020000000;
  v187 = 0;
  v178 = 0;
  v179 = &v178;
  v180 = 0x7810000000;
  v181 = &unk_1A7E74EE7;
  memset(v182, 0, sizeof(v182));
  v183 = 0;
  v173 = 0;
  v174 = &v173;
  v175 = 0xE010000000;
  v176 = &unk_1A7E74EE7;
  memset(v177, 0, sizeof(v177));
  v169 = 0;
  v170 = &v169;
  v171 = 0x2020000000;
  v172 = 0;
  v163 = 0;
  v164 = (id *)&v163;
  v165 = 0x3032000000;
  v166 = __Block_byref_object_copy__254543;
  v167 = __Block_byref_object_dispose__254544;
  v168 = 0;
  obj = 0;
  v12 = *(_OWORD *)&a3->item;
  v144 = *(_OWORD *)&a3->dataSourceIdentifier;
  v145 = v12;
  v13 = -[PXAssetsTilingLayout _getSelectionBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getSelectionBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v182, v177, &v172, &obj, a4, &v144);
  objc_storeStrong(&v168, obj);
  if (v13)
  {
    v14 = v170[3];
    v15 = v164[5];
    v16 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
    v17 = *((_OWORD *)v179 + 5);
    v158 = *((_OWORD *)v179 + 4);
    v159 = v17;
    v160 = *((_OWORD *)v179 + 6);
    v161 = v179[14];
    v18 = *((_OWORD *)v179 + 3);
    v156 = *((_OWORD *)v179 + 2);
    v157 = v18;
    v19 = *((_OWORD *)v174 + 11);
    v152 = *((_OWORD *)v174 + 10);
    v153 = v19;
    v20 = *((_OWORD *)v174 + 13);
    v154 = *((_OWORD *)v174 + 12);
    v155 = v20;
    v21 = *((_OWORD *)v174 + 7);
    v148 = *((_OWORD *)v174 + 6);
    v149 = v21;
    v22 = *((_OWORD *)v174 + 9);
    v150 = *((_OWORD *)v174 + 8);
    v151 = v22;
    v23 = *((_OWORD *)v174 + 3);
    v144 = *((_OWORD *)v174 + 2);
    v145 = v23;
    v24 = *((_OWORD *)v174 + 5);
    v146 = *((_OWORD *)v174 + 4);
    v147 = v24;
    v16(v11, &v156, &v144, v14, v15, v185 + 3);
  }
  v25 = v185;
  if (!*((_BYTE *)v185 + 24))
  {
    v26 = v164;
    v143 = 0;
    v27 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v27;
    v28 = -[PXAssetsTilingLayout _getDimmingTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getDimmingTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v143, a4, &v144);
    objc_storeStrong(v26 + 5, v143);
    v25 = v185;
    if (v28)
    {
      v29 = v170[3];
      v30 = v164[5];
      v31 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v32 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v32;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v33 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v33;
      v34 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v34;
      v35 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v35;
      v36 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v36;
      v37 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v37;
      v38 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v38;
      v39 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v39;
      v31(v11, &v156, &v144, v29, v30, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v40 = v164;
    v142 = 0;
    v41 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v41;
    v42 = -[PXAssetsTilingLayout _getOverlayBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getOverlayBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v142, a4, &v144);
    objc_storeStrong(v40 + 5, v142);
    v25 = v185;
    if (v42)
    {
      v43 = v170[3];
      v44 = v164[5];
      v45 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v46 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v46;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v47 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v47;
      v48 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v48;
      v49 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v49;
      v50 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v50;
      v51 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v51;
      v52 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v52;
      v53 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v53;
      v45(v11, &v156, &v144, v43, v44, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v54 = v164;
    v141 = 0;
    v55 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v55;
    v56 = -[PXAssetsTilingLayout _getPlayButtonTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getPlayButtonTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v141, a4, &v144);
    objc_storeStrong(v54 + 5, v141);
    v25 = v185;
    if (v56)
    {
      v57 = v170[3];
      v58 = v164[5];
      v59 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v60 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v60;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v61 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v61;
      v62 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v62;
      v63 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v63;
      v64 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v64;
      v65 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v65;
      v66 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v66;
      v67 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v67;
      v59(v11, &v156, &v144, v57, v58, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v68 = v164;
    v140 = 0;
    v69 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v69;
    v70 = -[PXAssetsTilingLayout _getVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v140, a4, &v144);
    objc_storeStrong(v68 + 5, v140);
    v25 = v185;
    if (v70)
    {
      v71 = v170[3];
      v72 = v164[5];
      v73 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v74 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v74;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v75 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v75;
      v76 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v76;
      v77 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v77;
      v78 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v78;
      v79 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v79;
      v80 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v80;
      v81 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v81;
      v73(v11, &v156, &v144, v71, v72, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v82 = v164;
    v139 = 0;
    v83 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v83;
    v84 = -[PXAssetsTilingLayout _getLoopingVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getLoopingVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v139, a4, &v144);
    objc_storeStrong(v82 + 5, v139);
    v25 = v185;
    if (v84)
    {
      v85 = v170[3];
      v86 = v164[5];
      v87 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v88 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v88;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v89 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v89;
      v90 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v90;
      v91 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v91;
      v92 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v92;
      v93 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v93;
      v94 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v94;
      v95 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v95;
      v87(v11, &v156, &v144, v85, v86, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v96 = v164;
    v138 = 0;
    v97 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v97;
    v98 = -[PXAssetsTilingLayout _getAnimatedImageOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getAnimatedImageOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v138, a4, &v144);
    objc_storeStrong(v96 + 5, v138);
    v25 = v185;
    if (v98)
    {
      v99 = v170[3];
      v100 = v164[5];
      v101 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v102 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v102;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v103 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v103;
      v104 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v104;
      v105 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v105;
      v106 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v106;
      v107 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v107;
      v108 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v108;
      v109 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v109;
      v101(v11, &v156, &v144, v99, v100, v185 + 3);
      v25 = v185;
    }
  }
  if (!*((_BYTE *)v25 + 24))
  {
    v110 = v164;
    v137 = 0;
    v111 = *(_OWORD *)&a3->item;
    v144 = *(_OWORD *)&a3->dataSourceIdentifier;
    v145 = v111;
    v112 = -[PXAssetsTilingLayout _getLivePhotoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getLivePhotoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v179 + 4, v174 + 4, v170 + 3, &v137, a4, &v144);
    objc_storeStrong(v110 + 5, v137);
    if (v112)
    {
      v113 = v170[3];
      v114 = v164[5];
      v115 = (void (*)(_QWORD *, __int128 *, __int128 *, uint64_t, id, uint64_t *))v11[2];
      v116 = *((_OWORD *)v179 + 5);
      v158 = *((_OWORD *)v179 + 4);
      v159 = v116;
      v160 = *((_OWORD *)v179 + 6);
      v161 = v179[14];
      v117 = *((_OWORD *)v179 + 3);
      v156 = *((_OWORD *)v179 + 2);
      v157 = v117;
      v118 = *((_OWORD *)v174 + 11);
      v152 = *((_OWORD *)v174 + 10);
      v153 = v118;
      v119 = *((_OWORD *)v174 + 13);
      v154 = *((_OWORD *)v174 + 12);
      v155 = v119;
      v120 = *((_OWORD *)v174 + 7);
      v148 = *((_OWORD *)v174 + 6);
      v149 = v120;
      v121 = *((_OWORD *)v174 + 9);
      v150 = *((_OWORD *)v174 + 8);
      v151 = v121;
      v122 = *((_OWORD *)v174 + 3);
      v144 = *((_OWORD *)v174 + 2);
      v145 = v122;
      v123 = *((_OWORD *)v174 + 5);
      v146 = *((_OWORD *)v174 + 4);
      v147 = v123;
      v115(v11, &v156, &v144, v113, v114, v185 + 3);
    }
  }
  -[PXAssetsTilingLayout additionalAccessoryTileKinds](self, "additionalAccessoryTileKinds");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __107__PXAssetsTilingLayout_enumerateAccessoryTilesForContentTileWithIndexPath_geometry_withOptions_usingBlock___block_invoke;
  v127[3] = &unk_1E513F550;
  v129 = &v184;
  v127[4] = self;
  v130 = &v178;
  v131 = &v173;
  v132 = &v169;
  v133 = &v163;
  v134 = a4;
  v125 = *(_OWORD *)&a3->item;
  v135 = *(_OWORD *)&a3->dataSourceIdentifier;
  v136 = v125;
  v126 = v11;
  v128 = v126;
  objc_msgSend(v124, "enumerateIndexesUsingBlock:", v127);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  unint64_t v7;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *index;
  _BOOL4 v20;
  void *v21;
  int v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _OWORD v28[5];
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[13];

  if (a6->length - 3 > 2
    || (v7 = a6->index[1], v7 == 0x7FFFFFFFFFFFFFFFLL)
    || (-[PXAssetsTilingLayout dataSource](self, "dataSource"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "identifier"),
        v12,
        v7 != v13))
  {
LABEL_16:
    LOBYTE(v20) = 0;
  }
  else
  {
    v15 = a6->index[2];
    v14 = a6->index[3];
    v16 = a6->index[4];
    index = a6->index;
    v17 = a6->index[0];
    v18 = index[1];
    memset(v38, 0, 192);
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v30 = xmmword_1A7C0C200;
    v31 = v18;
    v32 = v15;
    v33 = v14;
    v34 = v16;
    v20 = -[PXAssetsTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", v38, 0, 0, &v30);
    if (v20)
    {
      v29 = 0;
      memset(v28, 0, sizeof(v28));
      switch(v17)
      {
        case 0x60A012uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getSelectionBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getSelectionBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A013uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getOverlayBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getOverlayBadgeTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A014uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getDimmingTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getDimmingTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A015uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getPlayButtonTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getPlayButtonTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A016uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getAnimatedImageOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getAnimatedImageOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A017uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A018uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getLoopingVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getLoopingVideoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        case 0x60A019uLL:
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout _getLivePhotoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:](self, "_getLivePhotoOverlayTileIdentifier:outGeometry:group:userData:forContentTileGeometry:indexPath:", v28, a3, a4, a5, v38, &v24);
          break;
        default:
          -[PXAssetsTilingLayout additionalAccessoryTileKinds](self, "additionalAccessoryTileKinds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "containsIndex:", v17);

          if (!v23)
            goto LABEL_16;
          v24 = v18;
          v25 = v15;
          v26 = v14;
          v27 = v16;
          LOBYTE(v20) = -[PXAssetsTilingLayout getAdditionalAccessoryTileIdentifier:outGeometry:group:userData:forTileKind:contentTileGeometry:indexPath:](self, "getAdditionalAccessoryTileIdentifier:outGeometry:group:userData:forTileKind:contentTileGeometry:indexPath:", v28, a3, a4, a5, v17, v38, &v24);
          break;
      }
    }
  }
  return v20;
}

- (CGSize)playButtonSizeForItemAtIndexPath:(PXSimpleIndexPath *)a3 contentTileSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)_getSelectionBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  char v15;
  void *v17;
  __int128 v18;
  int v19;
  __int128 v20;
  __int128 v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  __int128 v32;
  CGPoint v33;
  double zPosition;
  double v35;
  void *v36;
  __int128 v37;
  char v38;
  id v39;
  __int128 v40;
  __int128 v41;

  v15 = -[PXAssetsTilingLayout selectionBadgeOptions](self, "selectionBadgeOptions");
  if (a7->hidden)
    return 0;
  if ((v15 & 2) == 0)
  {
    if ((v15 & 1) == 0)
      return 0;
    -[PXAssetsTilingLayout selectedIndexPaths](self, "selectedIndexPaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_OWORD *)&a8->item;
    v40 = *(_OWORD *)&a8->dataSourceIdentifier;
    v41 = v18;
    v19 = objc_msgSend(v17, "containsIndexPath:", &v40);

    if (!v19)
      return 0;
  }
  if (a3)
  {
    v20 = *(_OWORD *)&a8->dataSourceIdentifier;
    v21 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C840;
    *(_OWORD *)&a3->index[1] = v20;
    *(_OWORD *)&a3->index[3] = v21;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    -[PXAssetsTilingLayout _preferredSelectionBadgeSize](self, "_preferredSelectionBadgeSize");
    v23 = v22;
    v25 = v24;
    v26 = CGRectGetMaxX(a7->frame) - v22;
    v27 = CGRectGetMaxY(a7->frame) - v25;
    v28 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectGetCenter();
    a4->frame.origin.x = v26;
    a4->frame.origin.y = v27;
    a4->frame.size.width = v23;
    a4->frame.size.height = v25;
    a4->center.x = v29;
    a4->center.y = v30;
    a4->size.width = v23;
    a4->size.height = v25;
    v31 = MEMORY[0x1E0C9BAA8];
    v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a4->transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a4->transform.c = v32;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)(v31 + 32);
    a4->zPosition = 0.0;
    *(_QWORD *)&a4->hidden = 0;
    a4->alpha = 1.0;
    a4->contentSize.width = v23;
    a4->contentSize.height = v25;
    v33 = *(CGPoint *)off_1E50B86D0;
    a4->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    a4->contentsRect.origin = v33;
    a4->coordinateSpaceIdentifier = v28;
    zPosition = a7->zPosition;
    -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332434);
    a4->zPosition = zPosition + v35;
  }
  if (a5)
    *a5 = 450000;
  if (a6)
  {
    -[PXAssetsTilingLayout selectedIndexPaths](self, "selectedIndexPaths");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(_OWORD *)&a8->item;
    v40 = *(_OWORD *)&a8->dataSourceIdentifier;
    v41 = v37;
    v38 = objc_msgSend(v36, "containsIndexPath:", &v40);

    if ((v38 & 1) != 0)
      -[PXAssetsTilingLayout _selectedUserData](self, "_selectedUserData");
    else
      -[PXAssetsTilingLayout _unselectedUserData](self, "_unselectedUserData");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v39;

  }
  return 1;
}

- (BOOL)_getPlayButtonTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  __int128 v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  uint64_t v32;
  __int128 v33;
  CGPoint v34;
  double zPosition;
  double v36;
  _OWORD v38[2];

  v15 = *(_OWORD *)&a8->item;
  v38[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v38[1] = v15;
  -[PXAssetsTilingLayout playButtonSizeForItemAtIndexPath:contentTileSize:](self, "playButtonSizeForItemAtIndexPath:contentTileSize:", v38, a7->size.width, a7->size.height);
  if (a7->hidden)
    return 0;
  if (v16 == *MEMORY[0x1E0C9D820] && v17 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 0;
  if (a3)
  {
    v19 = *(_OWORD *)&a8->dataSourceIdentifier;
    v20 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C850;
    *(_OWORD *)&a3->index[1] = v19;
    *(_OWORD *)&a3->index[3] = v20;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    PXRectWithCenterAndSize();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
    PXRectGetCenter();
    a4->frame.origin.x = v22;
    a4->frame.origin.y = v24;
    a4->frame.size.width = v26;
    a4->frame.size.height = v28;
    a4->center.x = v30;
    a4->center.y = v31;
    a4->size.width = v26;
    a4->size.height = v28;
    v32 = MEMORY[0x1E0C9BAA8];
    v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a4->transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a4->transform.c = v33;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)(v32 + 32);
    a4->zPosition = 0.0;
    *(_QWORD *)&a4->hidden = 0;
    a4->alpha = 1.0;
    a4->contentSize.width = v26;
    a4->contentSize.height = v28;
    v34 = *(CGPoint *)off_1E50B86D0;
    a4->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    a4->contentsRect.origin = v34;
    a4->coordinateSpaceIdentifier = v29;
    zPosition = a7->zPosition;
    -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332437);
    a4->zPosition = zPosition + v36;
  }
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  return 1;
}

- (BOOL)_getLivePhotoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  void *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  CGPoint origin;
  CGSize size;
  CGSize v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  double zPosition;
  double v31;
  _OWORD v33[2];

  if ((-[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior") & 8) == 0)
    return 0;
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v33[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v33[1] = v16;
  objc_msgSend(v15, "assetAtItemIndexPath:", v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "playbackStyle");

  if (v18 != 3 || (-[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior") & 0x10) != 0)
    return 0;
  if (a3)
  {
    v19 = *(_OWORD *)&a8->dataSourceIdentifier;
    v20 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C860;
    *(_OWORD *)&a3->index[1] = v19;
    *(_OWORD *)&a3->index[3] = v20;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    origin = a7->frame.origin;
    size = a7->frame.size;
    v23 = a7->size;
    a4->center = a7->center;
    a4->size = v23;
    a4->frame.origin = origin;
    a4->frame.size = size;
    v24 = *(_OWORD *)&a7->transform.a;
    v25 = *(_OWORD *)&a7->transform.c;
    v26 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v26;
    *(_OWORD *)&a4->transform.a = v24;
    *(_OWORD *)&a4->transform.c = v25;
    v27 = *(_OWORD *)&a7->hidden;
    v28 = *(_OWORD *)&a7->contentSize.height;
    v29 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v29;
    *(_OWORD *)&a4->hidden = v27;
    *(_OWORD *)&a4->contentSize.height = v28;
    zPosition = a7->zPosition;
    -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332441);
    a4->zPosition = zPosition + v31;
  }
  if (a5)
    *a5 = 450001;
  if (a6)
    *a6 = 0;
  return 1;
}

- (BOOL)_getVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v14;
  void *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  CGPoint origin;
  CGSize size;
  CGSize v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double zPosition;
  double v32;
  _OWORD v35[2];

  v14 = -[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior");
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  objc_msgSend(v15, "assetAtItemIndexPath:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "playbackStyle");

  v19 = (v18 == 4) & (v14 >> 2);
  if (v19)
  {
    if (a3)
    {
      v20 = *(_OWORD *)&a8->dataSourceIdentifier;
      v21 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1A7C0C870;
      *(_OWORD *)&a3->index[1] = v20;
      *(_OWORD *)&a3->index[3] = v21;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      origin = a7->frame.origin;
      size = a7->frame.size;
      v24 = a7->size;
      a4->center = a7->center;
      a4->size = v24;
      a4->frame.origin = origin;
      a4->frame.size = size;
      v25 = *(_OWORD *)&a7->transform.a;
      v26 = *(_OWORD *)&a7->transform.c;
      v27 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v27;
      *(_OWORD *)&a4->transform.a = v25;
      *(_OWORD *)&a4->transform.c = v26;
      v28 = *(_OWORD *)&a7->hidden;
      v29 = *(_OWORD *)&a7->contentSize.height;
      v30 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v30;
      *(_OWORD *)&a4->hidden = v28;
      *(_OWORD *)&a4->contentSize.height = v29;
      zPosition = a7->zPosition;
      -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332439);
      a4->zPosition = zPosition + v32;
    }
    if (a5)
      *a5 = 450001;
    if (a6)
      *a6 = 0;
  }
  return v19;
}

- (BOOL)_getLoopingVideoOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  char v14;
  void *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  CGPoint origin;
  CGSize size;
  CGSize v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double zPosition;
  double v33;
  _OWORD v35[2];

  v14 = -[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior");
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  objc_msgSend(v15, "assetAtItemIndexPath:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "playbackStyle");

  v19 = -[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior");
  if ((v14 & 1) == 0 || v18 != 5 && ((v18 == 3) & (v19 >> 4)) == 0)
    return 0;
  if (a3)
  {
    v21 = *(_OWORD *)&a8->dataSourceIdentifier;
    v22 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C880;
    *(_OWORD *)&a3->index[1] = v21;
    *(_OWORD *)&a3->index[3] = v22;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    origin = a7->frame.origin;
    size = a7->frame.size;
    v25 = a7->size;
    a4->center = a7->center;
    a4->size = v25;
    a4->frame.origin = origin;
    a4->frame.size = size;
    v26 = *(_OWORD *)&a7->transform.a;
    v27 = *(_OWORD *)&a7->transform.c;
    v28 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v28;
    *(_OWORD *)&a4->transform.a = v26;
    *(_OWORD *)&a4->transform.c = v27;
    v29 = *(_OWORD *)&a7->hidden;
    v30 = *(_OWORD *)&a7->contentSize.height;
    v31 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v31;
    *(_OWORD *)&a4->hidden = v29;
    *(_OWORD *)&a4->contentSize.height = v30;
    zPosition = a7->zPosition;
    -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332440);
    a4->zPosition = zPosition + v33;
  }
  if (a5)
    *a5 = 450001;
  if (a6)
    *a6 = 0;
  return 1;
}

- (BOOL)_getAnimatedImageOverlayTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v14;
  void *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  CGPoint origin;
  CGSize size;
  CGSize v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  double zPosition;
  double v32;
  _OWORD v35[2];

  v14 = -[PXAssetsTilingLayout animatedOverlayBehavior](self, "animatedOverlayBehavior");
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a8->item;
  v35[0] = *(_OWORD *)&a8->dataSourceIdentifier;
  v35[1] = v16;
  objc_msgSend(v15, "assetAtItemIndexPath:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "playbackStyle");

  v19 = (v18 == 2) & (v14 >> 1);
  if (v19)
  {
    if (a3)
    {
      v20 = *(_OWORD *)&a8->dataSourceIdentifier;
      v21 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1A7C0C890;
      *(_OWORD *)&a3->index[1] = v20;
      *(_OWORD *)&a3->index[3] = v21;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      origin = a7->frame.origin;
      size = a7->frame.size;
      v24 = a7->size;
      a4->center = a7->center;
      a4->size = v24;
      a4->frame.origin = origin;
      a4->frame.size = size;
      v25 = *(_OWORD *)&a7->transform.a;
      v26 = *(_OWORD *)&a7->transform.c;
      v27 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v27;
      *(_OWORD *)&a4->transform.a = v25;
      *(_OWORD *)&a4->transform.c = v26;
      v28 = *(_OWORD *)&a7->hidden;
      v29 = *(_OWORD *)&a7->contentSize.height;
      v30 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v30;
      *(_OWORD *)&a4->hidden = v28;
      *(_OWORD *)&a4->contentSize.height = v29;
      zPosition = a7->zPosition;
      -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332438);
      a4->zPosition = zPosition + v32;
    }
    if (a5)
      *a5 = 450001;
    if (a6)
      *a6 = 0;
  }
  return v19;
}

- (BOOL)_getDimmingTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unint64_t v14;
  BOOL v16;
  _BOOL4 v17;
  void *v18;
  __int128 v19;
  int v20;
  void *v21;
  __int128 v22;
  int v23;
  void *v24;
  int v25;
  __int128 v27;
  __int128 v28;
  CGPoint origin;
  CGSize size;
  CGSize v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double zPosition;
  double v39;
  void *v41;
  id *v42;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v14 = -[PXAssetsTilingLayout selectionBadgeOptions](self, "selectionBadgeOptions");
  -[PXAssetsTilingLayout highlightedIndexPath](self, "highlightedIndexPath");
  v16 = a8->dataSourceIdentifier == v47 && a8->section == v48 && a8->item == v49;
  v42 = a6;
  v44 = v14;
  v17 = v16 && a8->subitem == v50;
  -[PXAssetsTilingLayout draggingIndexPaths](self, "draggingIndexPaths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a8->item;
  v45 = *(_OWORD *)&a8->dataSourceIdentifier;
  v46 = v19;
  v20 = objc_msgSend(v18, "containsIndexPath:", &v45);

  -[PXAssetsTilingLayout selectedIndexPaths](self, "selectedIndexPaths");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_OWORD *)&a8->item;
  v45 = *(_OWORD *)&a8->dataSourceIdentifier;
  v46 = v22;
  v23 = objc_msgSend(v21, "containsIndexPath:", &v45);

  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "disableSelectionOverlayView");

  if (a7->hidden
    || ((v23 & ~v25) != 1 || (v44 & 0x400) == 0)
    && ((v44 >> 11) & 1 & ~v23 | v20 & ((v44 & 0x400) != 0) | v17) != 1)
  {
    return 0;
  }
  if (a3)
  {
    v27 = *(_OWORD *)&a8->dataSourceIdentifier;
    v28 = *(_OWORD *)&a8->item;
    *(_OWORD *)&a3->length = xmmword_1A7C0C8A0;
    *(_OWORD *)&a3->index[1] = v27;
    *(_OWORD *)&a3->index[3] = v28;
    *(_OWORD *)&a3->index[5] = 0u;
    *(_OWORD *)&a3->index[7] = 0u;
    a3->index[9] = 0;
  }
  if (a4)
  {
    origin = a7->frame.origin;
    size = a7->frame.size;
    v31 = a7->size;
    a4->center = a7->center;
    a4->size = v31;
    a4->frame.origin = origin;
    a4->frame.size = size;
    v32 = *(_OWORD *)&a7->transform.a;
    v33 = *(_OWORD *)&a7->transform.c;
    v34 = *(_OWORD *)&a7->alpha;
    *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
    *(_OWORD *)&a4->alpha = v34;
    *(_OWORD *)&a4->transform.a = v32;
    *(_OWORD *)&a4->transform.c = v33;
    v35 = *(_OWORD *)&a7->hidden;
    v36 = *(_OWORD *)&a7->contentSize.height;
    v37 = *(_OWORD *)&a7->contentsRect.size.height;
    *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
    *(_OWORD *)&a4->contentsRect.size.height = v37;
    *(_OWORD *)&a4->hidden = v35;
    *(_OWORD *)&a4->contentSize.height = v36;
    zPosition = a7->zPosition;
    -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332436);
    a4->zPosition = zPosition + v39;
    if ((v44 & 0xC00) == 0 && !v17)
      a4->alpha = 0.0;
  }
  if (a5)
    *a5 = 450000;
  if (v42)
  {
    if (v20)
    {
      -[PXAssetsTilingLayout _draggingDimmingUserData](self, "_draggingDimmingUserData");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17)
        -[PXAssetsTilingLayout _highlightedDimmingUserData](self, "_highlightedDimmingUserData");
      else
        -[PXAssetsTilingLayout _selectedDimmingUserData](self, "_selectedDimmingUserData");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *v42 = v41;
  }
  return 1;
}

- (BOOL)_getOverlayBadgeTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forContentTileGeometry:(const PXTileGeometry *)a7 indexPath:(PXSimpleIndexPath *)a8
{
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  CGPoint origin;
  CGSize size;
  CGSize v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double zPosition;
  double v28;

  v15 = !a7->hidden & -[PXAssetsTilingLayout badgeOptions](self, "badgeOptions");
  if (v15 == 1)
  {
    if (a3)
    {
      v16 = *(_OWORD *)&a8->dataSourceIdentifier;
      v17 = *(_OWORD *)&a8->item;
      *(_OWORD *)&a3->length = xmmword_1A7C0C8B0;
      *(_OWORD *)&a3->index[1] = v16;
      *(_OWORD *)&a3->index[3] = v17;
      *(_OWORD *)&a3->index[5] = 0u;
      *(_OWORD *)&a3->index[7] = 0u;
      a3->index[9] = 0;
    }
    if (a4)
    {
      origin = a7->frame.origin;
      size = a7->frame.size;
      v20 = a7->size;
      a4->center = a7->center;
      a4->size = v20;
      a4->frame.origin = origin;
      a4->frame.size = size;
      v21 = *(_OWORD *)&a7->transform.a;
      v22 = *(_OWORD *)&a7->transform.c;
      v23 = *(_OWORD *)&a7->alpha;
      *(_OWORD *)&a4->transform.tx = *(_OWORD *)&a7->transform.tx;
      *(_OWORD *)&a4->alpha = v23;
      *(_OWORD *)&a4->transform.a = v21;
      *(_OWORD *)&a4->transform.c = v22;
      v24 = *(_OWORD *)&a7->hidden;
      v25 = *(_OWORD *)&a7->contentSize.height;
      v26 = *(_OWORD *)&a7->contentsRect.size.height;
      *(_OWORD *)&a4->contentsRect.origin.y = *(_OWORD *)&a7->contentsRect.origin.y;
      *(_OWORD *)&a4->contentsRect.size.height = v26;
      *(_OWORD *)&a4->hidden = v24;
      *(_OWORD *)&a4->contentSize.height = v25;
      zPosition = a7->zPosition;
      -[PXAssetsTilingLayout zPositionOffsetForKind:](self, "zPositionOffsetForKind:", 6332435);
      a4->zPosition = zPosition + v28;
    }
    if (a5)
      *a5 = 450000;
    if (a6)
    {
      -[PXAssetsTilingLayout _overlayBadgeTileUserData](self, "_overlayBadgeTileUserData");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v15;
}

- (BOOL)getAdditionalAccessoryTileIdentifier:(PXTileIdentifier *)a3 outGeometry:(PXTileGeometry *)a4 group:(unint64_t *)a5 userData:(id *)a6 forTileKind:(unint64_t)a7 contentTileGeometry:(const PXTileGeometry *)a8 indexPath:(PXSimpleIndexPath *)a9
{
  return 0;
}

- (void)_invalidateAllSelectionTiles
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateTilesInGroup:](v3, "invalidateTilesInGroup:", 450000);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)_invalidateAllAnimatedOverlayTiles
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext invalidateTilesInGroup:](v3, "invalidateTilesInGroup:", 450001);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PXAssetsTilingLayout;
  -[PXAssetsTilingLayout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ dataSource:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)zPositionOffsetForKind:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 6332434 <= 7)
    return dbl_1A7C0B598[a3 - 6332434];
  return result;
}

- (PXOverlayBadgeTileUserData)_overlayBadgeTileUserData
{
  return self->_overlayBadgeTileUserData;
}

- (void)_setContentTileUserData:(id)a3
{
  objc_storeStrong((id *)&self->_overlayBadgeTileUserData, a3);
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (PXIndexPathSet)hiddenIndexPaths
{
  return self->_hiddenIndexPaths;
}

- (PXSimpleIndexPath)highlightedIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[7].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)focusedIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[8].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (PXIndexPathSet)draggingIndexPaths
{
  return self->_draggingIndexPaths;
}

- (unint64_t)selectionBadgeOptions
{
  return self->_selectionBadgeOptions;
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

- (unint64_t)animatedOverlayBehavior
{
  return self->_animatedOverlayBehavior;
}

- (PXSelectionBadgeTileUserData)_selectedUserData
{
  return self->__selectedUserData;
}

- (PXSelectionBadgeTileUserData)_unselectedUserData
{
  return self->__unselectedUserData;
}

- (PXBasicTileUserData)_highlightedDimmingUserData
{
  return self->__highlightedDimmingUserData;
}

- (PXBasicTileUserData)_selectedDimmingUserData
{
  return self->__selectedDimmingUserData;
}

- (PXBasicTileUserData)_draggingDimmingUserData
{
  return self->__draggingDimmingUserData;
}

- (NSIndexSet)additionalAccessoryTileKinds
{
  return self->_additionalAccessoryTileKinds;
}

- (void)setAdditionalAccessoryTileKinds:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAccessoryTileKinds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalAccessoryTileKinds, 0);
  objc_storeStrong((id *)&self->__draggingDimmingUserData, 0);
  objc_storeStrong((id *)&self->__selectedDimmingUserData, 0);
  objc_storeStrong((id *)&self->__highlightedDimmingUserData, 0);
  objc_storeStrong((id *)&self->__unselectedUserData, 0);
  objc_storeStrong((id *)&self->__selectedUserData, 0);
  objc_storeStrong((id *)&self->_draggingIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_hiddenIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_overlayBadgeTileUserData, 0);
}

void __107__PXAssetsTilingLayout_enumerateAccessoryTilesForContentTileWithIndexPath_geometry_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  _OWORD *v15;
  void (*v16)(void);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
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
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  id v43;

  v4 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24;
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v43 = 0;
    v11 = *(_QWORD *)(a1 + 88);
    v12 = *(_OWORD *)(a1 + 112);
    v25 = *(_OWORD *)(a1 + 96);
    v26 = v12;
    v13 = objc_msgSend(v6, "getAdditionalAccessoryTileIdentifier:outGeometry:group:userData:forTileKind:contentTileGeometry:indexPath:", v7, v8, v9, &v43, a2, v11, &v25);
    objc_storeStrong(v10, v43);
    v4 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(_OWORD **)(*(_QWORD *)(a1 + 64) + 8);
      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      v17 = *(_OWORD *)(v14 + 80);
      v39 = *(_OWORD *)(v14 + 64);
      v40 = v17;
      v41 = *(_OWORD *)(v14 + 96);
      v42 = *(_QWORD *)(v14 + 112);
      v18 = *(_OWORD *)(v14 + 48);
      v37 = *(_OWORD *)(v14 + 32);
      v38 = v18;
      v19 = v15[11];
      v33 = v15[10];
      v34 = v19;
      v20 = v15[13];
      v35 = v15[12];
      v36 = v20;
      v21 = v15[7];
      v29 = v15[6];
      v30 = v21;
      v22 = v15[9];
      v31 = v15[8];
      v32 = v22;
      v23 = v15[3];
      v25 = v15[2];
      v26 = v23;
      v24 = v15[5];
      v27 = v15[4];
      v28 = v24;
      v16();
      v4 = *(_QWORD *)(a1 + 48);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
    *a3 = 1;
}

uint64_t __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = *(void **)(a1 + 32);
  v5 = *a2;
  v6 = a2[1];
  v17 = xmmword_1A7C0C200;
  v18 = v5;
  v19 = v6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v4, "invalidateTileWithIdentifier:", &v17);
  v7 = *(void **)(a1 + 32);
  v8 = *a2;
  v9 = a2[1];
  v17 = xmmword_1A7C0C870;
  v18 = v8;
  v19 = v9;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v7, "invalidateTileWithIdentifier:", &v17);
  v10 = *(void **)(a1 + 32);
  v11 = *a2;
  v12 = a2[1];
  v17 = xmmword_1A7C0C880;
  v18 = v11;
  v19 = v12;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v10, "invalidateTileWithIdentifier:", &v17);
  v13 = *(void **)(a1 + 32);
  v14 = *a2;
  v15 = a2[1];
  v17 = xmmword_1A7C0C890;
  v18 = v14;
  v19 = v15;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  return objc_msgSend(v13, "invalidateTileWithIdentifier:", &v17);
}

uint64_t __44__PXAssetsTilingLayout_setHiddenIndexPaths___block_invoke_2(uint64_t a1, __int128 *a2)
{
  void *v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = *(void **)(a1 + 40);
  v5 = *a2;
  v6 = a2[1];
  v17 = xmmword_1A7C0C200;
  v18 = v5;
  v19 = v6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v4, "invalidateTileWithIdentifier:", &v17);
  v7 = *(void **)(a1 + 40);
  v8 = *a2;
  v9 = a2[1];
  v17 = xmmword_1A7C0C870;
  v18 = v8;
  v19 = v9;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v7, "invalidateTileWithIdentifier:", &v17);
  v10 = *(void **)(a1 + 40);
  v11 = *a2;
  v12 = a2[1];
  v17 = xmmword_1A7C0C880;
  v18 = v11;
  v19 = v12;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  objc_msgSend(v10, "invalidateTileWithIdentifier:", &v17);
  v13 = *(void **)(a1 + 40);
  v14 = *a2;
  v15 = a2[1];
  v17 = xmmword_1A7C0C890;
  v18 = v14;
  v19 = v15;
  v20 = 0u;
  v21 = 0u;
  v22 = 0;
  return objc_msgSend(v13, "invalidateTileWithIdentifier:", &v17);
}

@end
