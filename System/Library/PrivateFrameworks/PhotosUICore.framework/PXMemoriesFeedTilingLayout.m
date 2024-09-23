@implementation PXMemoriesFeedTilingLayout

- (PXMemoriesFeedTilingLayout)initWithSpec:(id)a3 layoutSnapshot:(id)a4
{
  id v7;
  id v8;
  PXMemoriesFeedTilingLayout *v9;
  PXMemoriesFeedTilingLayout *v10;
  __int128 v11;
  PXIndexPathSet *selectedMemoryIndexPaths;
  PXCollectionTileLayoutTemplate *v13;
  PXCollectionTileLayoutTemplate *tileLayoutTemplate;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXMemoriesFeedTilingLayout;
  v9 = -[PXTilingLayout init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    v11 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&v10->_highlightedMemoryIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&v10->_highlightedMemoryIndexPath.item = v11;
    selectedMemoryIndexPaths = v10->_selectedMemoryIndexPaths;
    v10->_selectedMemoryIndexPaths = 0;

    objc_storeStrong((id *)&v10->_layoutSnapshot, a4);
    v13 = objc_alloc_init(PXCollectionTileLayoutTemplate);
    tileLayoutTemplate = v10->__tileLayoutTemplate;
    v10->__tileLayoutTemplate = v13;

  }
  return v10;
}

- (PXMemoriesFeedTilingLayout)init
{
  return -[PXMemoriesFeedTilingLayout initWithSpec:layoutSnapshot:](self, "initWithSpec:layoutSnapshot:", 0, 0);
}

- (CGRect)contentBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXMemoriesFeedTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $9AFD5A8CE4914E9A9DD435EA2D87B20E *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->contentsRectForItemAtIndexPathForAspectRatio = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->titleFontNameForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)PXMemoriesFeedTilingLayout;
  -[PXTilingLayout setReferenceSize:](&v11, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9)
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  -[PXMemoriesFeedTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PXMemoriesFeedTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E511E918;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateGeometriesForItemsInRect:usingBlock:", v13, x, y, width, height);

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  PXSectionedLayoutSnapshot *layoutSnapshot;
  double x;
  double y;
  double width;
  double height;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  PXIndexPathSet *selectedMemoryIndexPaths;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  _OWORD *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  id v54;
  BOOL v55;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v76 = 0u;
  v77 = 0u;
  v11 = *(_OWORD *)&a6->index[5];
  v68 = *(_OWORD *)&a6->index[3];
  v69 = v11;
  v70 = *(_OWORD *)&a6->index[7];
  *(_QWORD *)&v71 = a6->index[9];
  v12 = *(_OWORD *)&a6->index[1];
  v66 = *(_OWORD *)&a6->length;
  v67 = v12;
  -[PXMemoriesFeedTilingLayout indexPathForTileIdentifier:](self, "indexPathForTileIdentifier:", &v66, a4);
  v13 = *(_OWORD *)&a6->index[5];
  v68 = *(_OWORD *)&a6->index[3];
  v69 = v13;
  v70 = *(_OWORD *)&a6->index[7];
  *(_QWORD *)&v71 = a6->index[9];
  v14 = *(_OWORD *)&a6->index[1];
  v66 = *(_OWORD *)&a6->length;
  v67 = v14;
  v15 = -[PXMemoriesFeedTilingLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", &v66);
  -[PXMemoriesFeedTilingLayout _itemKindForTileKind:](self, "_itemKindForTileKind:", v15);
  if ((_QWORD)v76 == *(_QWORD *)off_1E50B7E98)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v76;
    v67 = v77;
    PXSimpleIndexPathDescription();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedTilingLayout.m"), 142, CFSTR("%@ unsupported indexPath:%@"), self, v59);

    abort();
  }
  v16 = v77;
  if (*((_QWORD *)&v76 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((_QWORD)v77 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_30;
    goto LABEL_7;
  }
  if ((_QWORD)v77 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    if (*((_QWORD *)&v77 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_30;
    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:withKind:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v66 = 0u;
  layoutSnapshot = self->_layoutSnapshot;
  if (layoutSnapshot)
    -[PXSectionedLayoutSnapshot geometryForItem:](layoutSnapshot, "geometryForItem:", v17);
  PXRectWithCenterAndSize();
  x = v78.origin.x;
  y = v78.origin.y;
  width = v78.size.width;
  height = v78.size.height;
  if (CGRectIsNull(v78))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedTilingLayout.m"), 147, CFSTR("%@ received a null rect from layout snapshot for item %@."), self, v17);

  }
  -[PXMemoriesFeedTilingLayout _tileLayoutTemplate](self, "_tileLayoutTemplate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBounds:", x, y, width, height);
  objc_msgSend(v23, "prepare");
  switch(v15)
  {
    case 0:
      if (*(_OWORD *)&self->_highlightedMemoryIndexPath.section != *((unint64_t *)&v76 + 1))
        goto LABEL_20;
      -[PXMemoriesSpec highlightedSectionHeaderOffset](self->_spec, "highlightedSectionHeaderOffset");
      v29 = v28;
      v31 = v30;
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      *(CGRect *)&v24 = CGRectOffset(v79, v29, v31);
      goto LABEL_19;
    case 1:
    case 3:
      objc_msgSend(v23, "imageRect");
      goto LABEL_19;
    case 2:
      objc_msgSend(v23, "titleSubtitleRect");
      goto LABEL_19;
    case 4:
      selectedMemoryIndexPaths = self->_selectedMemoryIndexPaths;
      v60 = v76;
      v61 = v77;
      if (!-[PXIndexPathSet containsIndexPath:](selectedMemoryIndexPaths, "containsIndexPath:", &v60))
      {
        v55 = 0;
        goto LABEL_26;
      }
      -[PXMemoriesSpec borderOffset](self->_spec, "borderOffset");
      v34 = v33;
      v36 = v35;
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      *(CGRect *)&v24 = CGRectInset(v80, v34, v36);
LABEL_19:
      x = v24;
      y = v25;
      width = v26;
      height = v27;
LABEL_20:
      v37 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      PXRectGetCenter();
      v39 = v38;
      v41 = v40;
      v42 = *(_OWORD *)&a6->index[5];
      v62 = *(_OWORD *)&a6->index[3];
      v63 = v42;
      v64 = *(_OWORD *)&a6->index[7];
      v65 = a6->index[9];
      v43 = *(_OWORD *)&a6->index[1];
      v60 = *(_OWORD *)&a6->length;
      v61 = v43;
      v44 = -[PXMemoriesFeedTilingLayout _zPositionForTileWithIdentifier:](self, "_zPositionForTileWithIdentifier:", &v60);
      if ((v15 | 2) == 3)
      {
        PXSizeGetAspectRatio();
        v60 = v76;
        v61 = v77;
        -[PXMemoriesFeedTilingLayout _contentsRectForItemAtIndexPath:forAspectRatio:](self, "_contentsRectForItemAtIndexPath:forAspectRatio:", &v60);
        if (!a3)
          goto LABEL_23;
        goto LABEL_22;
      }
      v45 = *(double *)off_1E50B86D0;
      v46 = *((double *)off_1E50B86D0 + 1);
      v47 = *((double *)off_1E50B86D0 + 2);
      v48 = *((double *)off_1E50B86D0 + 3);
      if (a3)
      {
LABEL_22:
        a3->frame.origin.x = x;
        a3->frame.origin.y = y;
        a3->frame.size.width = width;
        a3->frame.size.height = height;
        a3->center.x = v39;
        a3->center.y = v41;
        v49 = (_OWORD *)MEMORY[0x1E0C9BAA8];
        a3->size.width = width;
        a3->size.height = height;
        v50 = v49[1];
        *(_OWORD *)&a3->transform.a = *v49;
        *(_OWORD *)&a3->transform.c = v50;
        *(_OWORD *)&a3->transform.tx = v49[2];
        a3->alpha = 1.0;
        a3->zPosition = (double)v44;
        *(_QWORD *)&a3->hidden = 0;
        a3->contentSize.width = width;
        a3->contentSize.height = height;
        a3->contentsRect.origin.x = v45;
        a3->contentsRect.origin.y = v46;
        a3->contentsRect.size.width = v47;
        a3->contentsRect.size.height = v48;
        a3->coordinateSpaceIdentifier = v37;
      }
LABEL_23:
      if (a5)
      {
        v51 = *(_OWORD *)&a6->index[5];
        v62 = *(_OWORD *)&a6->index[3];
        v63 = v51;
        v64 = *(_OWORD *)&a6->index[7];
        v65 = a6->index[9];
        v52 = *(_OWORD *)&a6->index[1];
        v60 = *(_OWORD *)&a6->length;
        v61 = v52;
        -[PXMemoriesFeedTilingLayout _viewSpecForTileWithIdentifier:boundingSize:](self, "_viewSpecForTileWithIdentifier:boundingSize:", &v60, width, height);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXBasicTileUserData userDataWithViewSpec:](PXBasicTileUserData, "userDataWithViewSpec:", v53);
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v54;

      }
      v55 = 1;
LABEL_26:

      return v55;
    default:
      goto LABEL_20;
  }
}

- (PXMemoriesFeedDataSource)dataSource
{
  void *v2;
  void *v3;

  -[PXMemoriesFeedTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSourceSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXMemoriesFeedDataSource *)v3;
}

- (PXSimpleIndexPath)indexPathForMemoryAtPoint:(SEL)a3
{
  double y;
  double x;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  PXSimpleIndexPath *result;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;

  y = a4.y;
  x = a4.x;
  v15 = 0;
  v16 = &v15;
  v17 = 0x4010000000;
  v18 = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v19 = *(_OWORD *)off_1E50B8778;
  v20 = v8;
  -[PXMemoriesFeedTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__PXMemoriesFeedTilingLayout_indexPathForMemoryAtPoint___block_invoke;
  v14[3] = &unk_1E511E940;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v9, "enumerateGeometriesForItemsInRect:usingBlock:", v14, x, y, v10, v11);

  v12 = *((_OWORD *)v16 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v16 + 2);
  *(_OWORD *)&retstr->item = v12;
  _Block_object_dispose(&v15, 8);
  return result;
}

- (id)indexPathsForMemoriesInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__59381;
  v16 = __Block_byref_object_dispose__59382;
  objc_msgSend(off_1E50B3668, "indexPathSet");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesFeedTilingLayout layoutSnapshot](self, "layoutSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PXMemoriesFeedTilingLayout_indexPathsForMemoriesInRect___block_invoke;
  v11[3] = &unk_1E511E940;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateGeometriesForItemsInRect:usingBlock:", v11, x, y, width, height);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (PXSimpleIndexPath)indexPathForTileIdentifier:(SEL)a3
{
  unint64_t v8;
  void *v9;
  uint64_t v10;
  PXSimpleIndexPath *result;
  __int128 v12;
  void *v13;

  v8 = a4->index[1];
  -[PXMemoriesFeedTilingLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifier");

  if (v8 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXMemoriesFeedTilingLayout.m"), 233, CFSTR("Feed layout asked for index path for tile identifier from wrong datasource"));

  }
  v12 = *(_OWORD *)&a4->index[3];
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&a4->index[1];
  *(_OWORD *)&retstr->item = v12;
  return result;
}

- (int64_t)dataSourceIdentifierForTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[1];
}

- (int64_t)tileKindForTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->index[0];
}

- (PXTileIdentifier)tileIdentifierAtIndexPath:(SEL)a3 withTileKind:(PXSimpleIndexPath *)a4
{
  __int128 v5;

  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  retstr->length = 5;
  retstr->index[0] = a5;
  v5 = *(_OWORD *)&a4->item;
  *(_OWORD *)&retstr->index[1] = *(_OWORD *)&a4->dataSourceIdentifier;
  *(_OWORD *)&retstr->index[3] = v5;
  return self;
}

- (void)setHighlightedMemoryIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  PXTilingLayoutInvalidationContext *v6;
  int64_t dataSourceIdentifier;
  int64_t section;
  int64_t subitem;
  int64_t item;
  __int128 v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&a3->dataSourceIdentifier, *(int64x2_t *)&self->_highlightedMemoryIndexPath.dataSourceIdentifier), (int32x4_t)vceqq_s64(*(int64x2_t *)&a3->item, *(int64x2_t *)&self->_highlightedMemoryIndexPath.item))), 0xFuLL))) & 1) == 0)
  {
    v5 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_highlightedMemoryIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_highlightedMemoryIndexPath.item = v5;
    v6 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext setTag:](v6, "setTag:", CFSTR("Memory Tile Highlighting"));
    dataSourceIdentifier = a3->dataSourceIdentifier;
    section = a3->section;
    item = a3->item;
    subitem = a3->subitem;
    v11 = xmmword_1A7BE9010;
    v12 = dataSourceIdentifier;
    v13 = section;
    v14 = item;
    v15 = subitem;
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
    -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v6, "invalidateTileWithIdentifier:", &v11);
    v11 = xmmword_1A7C0C450;
    v12 = dataSourceIdentifier;
    v13 = section;
    v14 = item;
    v15 = subitem;
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
    -[PXTilingLayoutInvalidationContext invalidateTileWithIdentifier:](v6, "invalidateTileWithIdentifier:", &v11);
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v6);

  }
}

- (void)setSelectedMemoryIndexPaths:(id)a3
{
  PXIndexPathSet *v5;
  PXIndexPathSet *v6;

  v5 = (PXIndexPathSet *)a3;
  if (self->_selectedMemoryIndexPaths != v5)
  {
    v6 = v5;
    -[PXMemoriesFeedTilingLayout _invalidateSelectionTilesWithTag:](self, "_invalidateSelectionTilesWithTag:", CFSTR("Memory Tile Deselecting"));
    objc_storeStrong((id *)&self->_selectedMemoryIndexPaths, a3);
    -[PXMemoriesFeedTilingLayout _invalidateSelectionTilesWithTag:](self, "_invalidateSelectionTilesWithTag:", CFSTR("Memory Tile Selecting"));
    v5 = v6;
  }

}

- (void)setLayoutSnapshot:(id)a3
{
  PXSectionedLayoutSnapshot *v5;
  PXSectionedLayoutSnapshot *v6;

  v5 = (PXSectionedLayoutSnapshot *)a3;
  if (self->_layoutSnapshot != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_layoutSnapshot, a3);
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
    v5 = v6;
  }

}

- (void)_addTileWithKind:(int64_t)a3 entryIndex:(unint64_t)a4 memoryIndex:(unint64_t)a5 usingBlock:(id)a6
{
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void (*v20)(_QWORD *, _QWORD *, __int128 *, uint64_t, uint64_t, char *);
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
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v10 = a6;
  if ((unint64_t)(a3 - 1) < 4)
    goto LABEL_4;
  if (!a3)
  {
    a5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
    -[PXMemoriesFeedTilingLayout dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "identifier");

    v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_5;
  }
  v13 = 0;
  a5 = 0;
  a4 = 0;
  v12 = 0;
LABEL_5:
  v14 = *((_OWORD *)off_1E50B8940 + 9);
  v48 = *((_OWORD *)off_1E50B8940 + 8);
  v49 = v14;
  v15 = *((_OWORD *)off_1E50B8940 + 11);
  v50 = *((_OWORD *)off_1E50B8940 + 10);
  v51 = v15;
  v16 = *((_OWORD *)off_1E50B8940 + 5);
  v44 = *((_OWORD *)off_1E50B8940 + 4);
  v45 = v16;
  v17 = *((_OWORD *)off_1E50B8940 + 7);
  v46 = *((_OWORD *)off_1E50B8940 + 6);
  v47 = v17;
  v18 = *((_OWORD *)off_1E50B8940 + 1);
  v40 = *(_OWORD *)off_1E50B8940;
  v41 = v18;
  v19 = *((_OWORD *)off_1E50B8940 + 3);
  v42 = *((_OWORD *)off_1E50B8940 + 2);
  v43 = v19;
  v38 = 0;
  v39 = 0;
  *(_QWORD *)&v21 = 5;
  *((_QWORD *)&v21 + 1) = a3;
  *(_QWORD *)&v22 = v12;
  *((_QWORD *)&v22 + 1) = a4;
  *(_QWORD *)&v23 = a5;
  *((_QWORD *)&v23 + 1) = v13;
  v24 = 0u;
  v25 = 0u;
  *(_QWORD *)&v26 = 0;
  if (-[PXMemoriesFeedTilingLayout getGeometry:group:userData:forTileWithIdentifier:](self, "getGeometry:group:userData:forTileWithIdentifier:", &v40, &v39, &v38, &v21))
  {
    v37 = 0;
    v20 = (void (*)(_QWORD *, _QWORD *, __int128 *, uint64_t, uint64_t, char *))v10[2];
    v33[0] = 5;
    v33[1] = a3;
    v33[2] = v12;
    v33[3] = a4;
    v33[4] = a5;
    v33[5] = v13;
    v34 = 0u;
    v35 = 0u;
    v36 = 0;
    v29 = v48;
    v30 = v49;
    v31 = v50;
    v32 = v51;
    v25 = v44;
    v26 = v45;
    v27 = v46;
    v28 = v47;
    v21 = v40;
    v22 = v41;
    v23 = v42;
    v24 = v43;
    v20(v10, v33, &v21, v39, v38, &v37);
  }

}

- (id)_viewSpecForTileWithIdentifier:(PXTileIdentifier *)a3 boundingSize:(CGSize)a4
{
  CGFloat height;
  double width;
  __int128 v8;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  BOOL v15;
  char v17;
  uint64_t v18;
  PXIndexPathSet *selectedMemoryIndexPaths;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  CGRect v32;

  height = a4.height;
  width = a4.width;
  v8 = *(_OWORD *)&a3->index[5];
  v28 = *(_OWORD *)&a3->index[3];
  v29 = v8;
  v30 = *(_OWORD *)&a3->index[7];
  v31 = a3->index[9];
  v9 = *(_OWORD *)&a3->index[1];
  v26 = *(_OWORD *)&a3->length;
  v27 = v9;
  v10 = -[PXMemoriesFeedTilingLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", &v26);
  v11 = *(_OWORD *)&a3->index[5];
  v28 = *(_OWORD *)&a3->index[3];
  v29 = v11;
  v30 = *(_OWORD *)&a3->index[7];
  v31 = a3->index[9];
  v12 = *(_OWORD *)&a3->index[1];
  v26 = *(_OWORD *)&a3->length;
  v27 = v12;
  -[PXMemoriesFeedTilingLayout indexPathForTileIdentifier:](self, "indexPathForTileIdentifier:", &v26);
  v13 = *(_OWORD *)&a3->index[5];
  v28 = *(_OWORD *)&a3->index[3];
  v29 = v13;
  v30 = *(_OWORD *)&a3->index[7];
  v31 = a3->index[9];
  v14 = *(_OWORD *)&a3->index[1];
  v26 = *(_OWORD *)&a3->length;
  v27 = v14;
  -[PXMemoriesFeedTilingLayout indexPathForTileIdentifier:](self, "indexPathForTileIdentifier:", &v26);
  if (self->_highlightedMemoryIndexPath.dataSourceIdentifier)
    v15 = 0;
  else
    v15 = self->_highlightedMemoryIndexPath.section == 0;
  v17 = v15 && self->_highlightedMemoryIndexPath.item == 0;
  v18 = v17 & (self->_highlightedMemoryIndexPath.subitem == 0);
  selectedMemoryIndexPaths = self->_selectedMemoryIndexPaths;
  v26 = 0u;
  v27 = 0u;
  if (-[PXIndexPathSet containsIndexPath:](selectedMemoryIndexPaths, "containsIndexPath:", &v26))
    v18 |= 2uLL;
  -[PXMemoriesFeedTilingLayout contentBounds](self, "contentBounds");
  v20 = CGRectGetWidth(v32) * 0.5;
  switch(v10)
  {
    case 0:
      v21 = 2002;
      break;
    case 1:
      v21 = 2005;
      break;
    case 2:
      v26 = 0u;
      v27 = 0u;
      -[PXMemoriesFeedTilingLayout _titleFontNameForMemoryAtIndexPath:](self, "_titleFontNameForMemoryAtIndexPath:", &v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (width <= v20)
        v21 = 2004;
      else
        v21 = 2003;
      v18 = PXViewSpecOptionsWithTitleFontName(v18, v22);
      goto LABEL_23;
    case 3:
      v26 = 0u;
      v27 = 0u;
      -[PXMemoriesFeedTilingLayout _titleFontNameForMemoryAtIndexPath:](self, "_titleFontNameForMemoryAtIndexPath:", &v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = PXViewSpecOptionsWithTitleFontName(v18, v22);
      if (width <= v20)
        v21 = 2007;
      else
        v21 = 2006;
LABEL_23:

      break;
    case 4:
      v21 = 2001;
      break;
    default:
      v21 = 0;
      break;
  }
  -[PXMemoriesFeedTilingLayout spec](self, "spec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v26 = v21;
  *((_QWORD *)&v26 + 1) = v18;
  *(double *)&v27 = width;
  *((CGFloat *)&v27 + 1) = height;
  objc_msgSend(v23, "viewSpecWithDescriptor:", &v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_titleFontNameForMemoryAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v9[2];

  if (!self->_delegateRespondsTo.titleFontNameForItemAtIndexPath)
    return 0;
  -[PXMemoriesFeedTilingLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v6;
  objc_msgSend(v5, "memoriesFeedTilingLayout:titleFontNameForItemAtIndexPath:", self, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_zPositionForTileWithIdentifier:(PXTileIdentifier *)a3
{
  __int128 v5;
  __int128 v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  _BOOL4 v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;

  v5 = *(_OWORD *)&a3->index[5];
  v15 = *(_OWORD *)&a3->index[3];
  v16 = v5;
  v17 = *(_OWORD *)&a3->index[7];
  v18 = a3->index[9];
  v6 = *(_OWORD *)&a3->index[1];
  v13 = *(_OWORD *)&a3->length;
  v14 = v6;
  v7 = -[PXMemoriesFeedTilingLayout tileKindForTileIdentifier:](self, "tileKindForTileIdentifier:", &v13);
  v8 = *(_OWORD *)&a3->index[5];
  v15 = *(_OWORD *)&a3->index[3];
  v16 = v8;
  v17 = *(_OWORD *)&a3->index[7];
  v18 = a3->index[9];
  v9 = *(_OWORD *)&a3->index[1];
  v13 = *(_OWORD *)&a3->length;
  v14 = v9;
  -[PXMemoriesFeedTilingLayout indexPathForTileIdentifier:](self, "indexPathForTileIdentifier:", &v13);
  v10 = 0;
  if (0 == *(_OWORD *)&self->_highlightedMemoryIndexPath.dataSourceIdentifier
    && !self->_highlightedMemoryIndexPath.item)
  {
    v10 = self->_highlightedMemoryIndexPath.subitem == 0;
  }
  if (v7 > 4)
    v11 = 0;
  else
    v11 = qword_1A7C095C8[v7];
  if (v10)
    return v11 | 0x64;
  else
    return v11;
}

- (int64_t)_itemKindForTileKind:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 5)
    return qword_1A7C095F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesFeedTilingLayout.m"), 431, CFSTR("Asked for item kind for unknown tile kind: %ld"), a3);

  return 0;
}

- (CGRect)_contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a3 forAspectRatio:(double)a4
{
  void *v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[2];
  CGRect result;

  if (self->_delegateRespondsTo.contentsRectForItemAtIndexPathForAspectRatio)
  {
    -[PXMemoriesFeedTilingLayout delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)&a3->item;
    v21[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v21[1] = v8;
    objc_msgSend(v7, "memoriesFeedTilingLayout:contentsRectForItemAtIndexPath:forAspectRatio:", self, v21, a4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v10 = *(double *)off_1E50B86D0;
    v12 = *((double *)off_1E50B86D0 + 1);
    v14 = *((double *)off_1E50B86D0 + 2);
    v16 = *((double *)off_1E50B86D0 + 3);
  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_invalidateSelectionTilesWithTag:(id)a3
{
  id v4;
  PXTilingLayoutInvalidationContext *v5;
  PXIndexPathSet *selectedMemoryIndexPaths;
  PXTilingLayoutInvalidationContext *v7;
  _QWORD v8[4];
  PXTilingLayoutInvalidationContext *v9;

  v4 = a3;
  v5 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext setTag:](v5, "setTag:", v4);

  selectedMemoryIndexPaths = self->_selectedMemoryIndexPaths;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PXMemoriesFeedTilingLayout__invalidateSelectionTilesWithTag___block_invoke;
  v8[3] = &unk_1E513F500;
  v9 = v5;
  v7 = v5;
  -[PXIndexPathSet enumerateAllIndexPathsUsingBlock:](selectedMemoryIndexPaths, "enumerateAllIndexPathsUsingBlock:", v8);
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);

}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PXSimpleIndexPath)highlightedMemoryIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[5].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXIndexPathSet)selectedMemoryIndexPaths
{
  return self->_selectedMemoryIndexPaths;
}

- (PXMemoriesFeedTilingLayoutDelegate)delegate
{
  return (PXMemoriesFeedTilingLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXSectionedLayoutSnapshot)layoutSnapshot
{
  return self->_layoutSnapshot;
}

- (PXCollectionTileLayoutTemplate)_tileLayoutTemplate
{
  return self->__tileLayoutTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->_layoutSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedMemoryIndexPaths, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

uint64_t __63__PXMemoriesFeedTilingLayout__invalidateSelectionTilesWithTag___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[5];
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *a2;
  v4 = a2[1];
  v6[0] = xmmword_1A7C0C460;
  v6[1] = v3;
  v6[2] = v4;
  memset(&v6[3], 0, 32);
  v7 = 0;
  return objc_msgSend(v2, "invalidateTileWithIdentifier:", v6);
}

void __58__PXMemoriesFeedTilingLayout_indexPathsForMemoriesInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v3 = a2;
  if (!objc_msgSend(v3, "px_kind"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "identifier");
    v6 = objc_msgSend(v3, "px_section");
    v7 = objc_msgSend(v3, "px_item");

    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9[0] = v5;
    v9[1] = v6;
    v9[2] = v7;
    v9[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v8, "addIndexPath:", v9);
  }

}

void __56__PXMemoriesFeedTilingLayout_indexPathForMemoryAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v11 = a2;
  if (!objc_msgSend(v11, "px_kind"))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "identifier");
    v8 = objc_msgSend(v11, "px_section");
    v9 = objc_msgSend(v11, "px_item");
    v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v10[4] = v7;
    v10[5] = v8;
    v10[6] = v9;
    v10[7] = 0x7FFFFFFFFFFFFFFFLL;

    *a4 = 1;
  }

}

void __74__PXMemoriesFeedTilingLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v3 = a2;
  v4 = objc_msgSend(v3, "px_section");
  v5 = objc_msgSend(v3, "px_item");
  v6 = objc_msgSend(v3, "px_kind");

  if (v6 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addTileWithKind:entryIndex:memoryIndex:usingBlock:", 0, v4, 0, *(_QWORD *)(a1 + 40));
  }
  else if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addTileWithKind:entryIndex:memoryIndex:usingBlock:", 1, v4, v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_addTileWithKind:entryIndex:memoryIndex:usingBlock:", 2, v4, v5, *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "idiom") == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "identifier");

      v18 = 0u;
      v19 = 0u;
      v9 = *(void **)(a1 + 32);
      v11 = xmmword_1A7C0C460;
      *(_QWORD *)&v12 = v8;
      *((_QWORD *)&v12 + 1) = v4;
      v13 = v5;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = 0u;
      v16 = 0u;
      v17 = 0;
      objc_msgSend(v9, "indexPathForTileIdentifier:", &v11);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
      v11 = v18;
      v12 = v19;
      if (objc_msgSend(v10, "containsIndexPath:", &v11))
        objc_msgSend(*(id *)(a1 + 32), "_addTileWithKind:entryIndex:memoryIndex:usingBlock:", 4, v4, v5, *(_QWORD *)(a1 + 40));
    }
  }
}

@end
