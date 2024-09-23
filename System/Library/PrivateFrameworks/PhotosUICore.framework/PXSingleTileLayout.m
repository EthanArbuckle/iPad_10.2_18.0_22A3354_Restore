@implementation PXSingleTileLayout

- (PXSingleTileLayout)init
{
  _OWORD v3[5];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  return -[PXSingleTileLayout initWithTileIdentifier:](self, "initWithTileIdentifier:", v3);
}

- (PXSingleTileLayout)initWithTileIdentifier:(PXTileIdentifier *)a3
{
  PXSingleTileLayout *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXSingleTileLayout;
  result = -[PXTilingLayout init](&v14, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->index[1];
    *(_OWORD *)&result->_tileIdentifier.length = *(_OWORD *)&a3->length;
    *(_OWORD *)&result->_tileIdentifier.index[1] = v5;
    v7 = *(_OWORD *)&a3->index[5];
    v6 = *(_OWORD *)&a3->index[7];
    v8 = *(_OWORD *)&a3->index[3];
    result->_tileIdentifier.index[9] = a3->index[9];
    *(_OWORD *)&result->_tileIdentifier.index[5] = v7;
    *(_OWORD *)&result->_tileIdentifier.index[7] = v6;
    *(_OWORD *)&result->_tileIdentifier.index[3] = v8;
    __asm { FMOV            V0.2D, #-1.0 }
    result->_preferredSize = _Q0;
  }
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  PXTilingLayoutInvalidationContext *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v7 = v6;
  v9 = v8;
  v12.receiver = self;
  v12.super_class = (Class)PXSingleTileLayout;
  -[PXTilingLayout setReferenceSize:](&v12, sel_setReferenceSize_, width, height);
  if (width != v7 || height != v9)
  {
    v11 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v11, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v11, "invalidateContentBounds");
    -[PXTilingLayoutInvalidationContext invalidateScrollBounds](v11, "invalidateScrollBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v11);

  }
}

- (void)setPreferredSize:(CGSize)a3
{
  PXTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_preferredSize.width || a3.height != self->_preferredSize.height)
  {
    self->_preferredSize = a3;
    v5 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v5, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v5, "invalidateContentBounds");
    -[PXTilingLayoutInvalidationContext invalidateScrollBounds](v5, "invalidateScrollBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)prepareLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSingleTileLayout;
  -[PXTilingLayout prepareLayout](&v9, sel_prepareLayout);
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXSingleTileLayout preferredSize](self, "preferredSize");
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  if (v7 < 0.0)
    v7 = v4;
  if (v8 < 0.0)
    v8 = v6;
  self->_contentBounds.size.width = v7;
  self->_contentBounds.size.height = v8;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  void (**v14)(void *, _QWORD *);
  uint64_t v15;
  _QWORD aBlock[5];
  id v17;
  _QWORD *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  _QWORD v23[3];
  char v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXSingleTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5140468;
  v18 = v23;
  aBlock[4] = self;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v13 = v12;
  v17 = v13;
  v14 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  -[PXSingleTileLayout tileIdentifier](self, "tileIdentifier");
  v14[2](v14, &v15);

  _Block_object_dispose(v23, 8);
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v15;
  __int128 v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL IsNull;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  __int128 v30;
  CGPoint v31;
  _OWORD v33[5];
  unint64_t v34;
  _QWORD v35[11];
  CGRect v36;

  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXSingleTileLayout tileIdentifier](self, "tileIdentifier");
  v15 = *(_OWORD *)&a6->index[5];
  v33[2] = *(_OWORD *)&a6->index[3];
  v33[3] = v15;
  v33[4] = *(_OWORD *)&a6->index[7];
  v34 = a6->index[9];
  v16 = *(_OWORD *)&a6->index[1];
  v33[0] = *(_OWORD *)&a6->length;
  v33[1] = v16;
  v17 = *(_QWORD *)&v33[0] == v35[0];
  if (*(_QWORD *)&v33[0] && *(_QWORD *)&v33[0] == v35[0])
  {
    v18 = 1;
    do
    {
      v19 = *((_QWORD *)v33 + v18);
      v20 = v35[v18];
      v17 = v19 == v20;
      if (v18 >= *(_QWORD *)&v33[0])
        break;
      ++v18;
    }
    while (v19 == v20);
  }
  if (v17)
  {
    -[PXSingleTileLayout contentBounds](self, "contentBounds");
    v11 = v21;
    v12 = v22;
    v13 = v23;
    v14 = v24;
  }
  v36.origin.x = v11;
  v36.origin.y = v12;
  v36.size.width = v13;
  v36.size.height = v14;
  IsNull = CGRectIsNull(v36);
  if (!IsNull)
  {
    if (a3)
    {
      v26 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      PXRectGetCenter();
      a3->frame.origin.x = v11;
      a3->frame.origin.y = v12;
      a3->frame.size.width = v13;
      a3->frame.size.height = v14;
      a3->center.x = v27;
      a3->center.y = v28;
      a3->size.width = v13;
      a3->size.height = v14;
      v29 = MEMORY[0x1E0C9BAA8];
      v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&a3->transform.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&a3->transform.c = v30;
      *(_OWORD *)&a3->transform.tx = *(_OWORD *)(v29 + 32);
      a3->zPosition = 0.0;
      *(_QWORD *)&a3->hidden = 0;
      a3->alpha = 1.0;
      a3->contentSize.width = v13;
      a3->contentSize.height = v14;
      v31 = *(CGPoint *)off_1E50B86D0;
      a3->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
      a3->contentsRect.origin = v31;
      a3->coordinateSpaceIdentifier = v26;
    }
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 0;
  }
  return !IsNull;
}

- (PXTileIdentifier)tileIdentifier
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].index[4];
  *(_OWORD *)&retstr->index[3] = *(_OWORD *)&self[2].index[2];
  *(_OWORD *)&retstr->index[5] = v3;
  *(_OWORD *)&retstr->index[7] = *(_OWORD *)&self[2].index[6];
  retstr->index[9] = self[2].index[8];
  v4 = *(_OWORD *)self[2].index;
  *(_OWORD *)&retstr->length = *(_OWORD *)&self[1].index[9];
  *(_OWORD *)&retstr->index[1] = v4;
  return self;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

void __66__PXSingleTileLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGSize v8;
  __int128 v9;
  void *v10;
  __int128 v11;
  CGSize v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t);
  __int128 v20;
  __int128 v21;
  CGRect v22;
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
  _OWORD v33[5];
  uint64_t v34;
  id v35;
  uint64_t v36;
  CGRect v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = *((_OWORD *)off_1E50B8940 + 9);
    v44 = *((_OWORD *)off_1E50B8940 + 8);
    v45 = v4;
    v5 = *((_OWORD *)off_1E50B8940 + 11);
    v46 = *((_OWORD *)off_1E50B8940 + 10);
    v47 = v5;
    v6 = *((_OWORD *)off_1E50B8940 + 5);
    v40 = *((_OWORD *)off_1E50B8940 + 4);
    v41 = v6;
    v7 = *((_OWORD *)off_1E50B8940 + 7);
    v42 = *((_OWORD *)off_1E50B8940 + 6);
    v43 = v7;
    v8 = (CGSize)*((_OWORD *)off_1E50B8940 + 1);
    v37.origin = *(CGPoint *)off_1E50B8940;
    v37.size = v8;
    v9 = *((_OWORD *)off_1E50B8940 + 3);
    v38 = *((_OWORD *)off_1E50B8940 + 2);
    v39 = v9;
    v35 = 0;
    v36 = 0;
    v10 = *(void **)(a1 + 32);
    v11 = *(_OWORD *)(a2 + 48);
    v23 = *(_OWORD *)(a2 + 32);
    v24 = v11;
    v25 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)&v26 = *(_QWORD *)(a2 + 80);
    v12 = *(CGSize *)(a2 + 16);
    v22.origin = *(CGPoint *)a2;
    v22.size = v12;
    v13 = objc_msgSend(v10, "getGeometry:group:userData:forTileWithIdentifier:", &v37, &v36, &v35, &v22);
    v14 = v35;
    if (v13)
    {
      if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v37))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24;
        v19 = *(void (**)(uint64_t, _OWORD *, CGRect *, uint64_t, id, uint64_t, uint64_t, uint64_t))(v17 + 16);
        v20 = *(_OWORD *)(a2 + 48);
        v33[2] = *(_OWORD *)(a2 + 32);
        v33[3] = v20;
        v33[4] = *(_OWORD *)(a2 + 64);
        v34 = *(_QWORD *)(a2 + 80);
        v21 = *(_OWORD *)(a2 + 16);
        v33[0] = *(_OWORD *)a2;
        v33[1] = v21;
        v29 = v44;
        v30 = v45;
        v31 = v46;
        v32 = v47;
        v25 = v40;
        v26 = v41;
        v27 = v42;
        v28 = v43;
        v22 = v37;
        v23 = v38;
        v24 = v39;
        v19(v17, v33, &v22, v36, v14, v18, v15, v16);
      }
    }

  }
}

@end
