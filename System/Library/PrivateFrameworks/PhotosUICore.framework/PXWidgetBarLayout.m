@implementation PXWidgetBarLayout

- (void)setHeight:(double)a3
{
  PXTilingLayoutInvalidationContext *v4;

  if (self->_height != a3)
  {
    self->_height = a3;
    v4 = objc_alloc_init(PXTilingLayoutInvalidationContext);
    -[PXTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PXTilingLayoutInvalidationContext invalidateContentBounds](v4, "invalidateContentBounds");
    -[PXTilingLayoutInvalidationContext invalidateScrollBounds](v4, "invalidateScrollBounds");
    -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

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
  PXTilingLayoutInvalidationContext *v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v7 = v6;
  v9 = v8;
  v12.receiver = self;
  v12.super_class = (Class)PXWidgetBarLayout;
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

- (void)prepareLayout
{
  CGSize v3;
  CGFloat v4;
  CGFloat v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXWidgetBarLayout;
  -[PXTilingLayout prepareLayout](&v6, sel_prepareLayout);
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_contentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_contentBounds.size = v3;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  self->_contentBounds.size.width = v4;
  -[PXWidgetBarLayout height](self, "height");
  self->_contentBounds.size.height = v5;
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
  void (**v14)(void *, _OWORD *);
  void *v15;
  _OWORD v16[5];
  uint64_t v17;
  _QWORD aBlock[5];
  id v19;
  _QWORD *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _QWORD v25[3];
  char v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXWidgetBarLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5140468;
  v20 = v25;
  aBlock[4] = self;
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  v13 = v12;
  v19 = v13;
  v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  v15 = (void *)objc_opt_class();
  if (v15)
  {
    objc_msgSend(v15, "tileIdentifier");
  }
  else
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
  }
  v14[2](v14, v16);

  _Block_object_dispose(v25, 8);
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  __int128 v10;
  CGSize v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  char v31;
  __int128 v32;
  __int128 v33;
  CGPoint v34;
  CGSize v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  __int128 v42;
  int v43;
  CGPoint v44;
  _OWORD v46[5];
  unint64_t v47;
  _OWORD v48[5];
  uint64_t v49;
  CGPoint v50;
  CGSize v51;
  _DWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v10 = *((_OWORD *)off_1E50B8940 + 5);
  v53 = *((_OWORD *)off_1E50B8940 + 4);
  v54 = v10;
  v55 = *((_OWORD *)off_1E50B8940 + 6);
  v52[0] = *(_DWORD *)((char *)off_1E50B8940 + 129);
  *(_DWORD *)((char *)v52 + 3) = *((_DWORD *)off_1E50B8940 + 33);
  v11 = *(CGSize *)((char *)off_1E50B8940 + 168);
  v50 = *(CGPoint *)((char *)off_1E50B8940 + 152);
  v51 = v11;
  v12 = (void *)objc_opt_class();
  if (v12)
  {
    objc_msgSend(v12, "tileIdentifier");
    v13 = *(_QWORD *)&v48[0];
  }
  else
  {
    v13 = 0;
    v49 = 0;
    memset(v48, 0, sizeof(v48));
  }
  v14 = *(_OWORD *)&a6->index[5];
  v46[2] = *(_OWORD *)&a6->index[3];
  v46[3] = v14;
  v46[4] = *(_OWORD *)&a6->index[7];
  v47 = a6->index[9];
  v15 = *(_OWORD *)&a6->index[1];
  v46[0] = *(_OWORD *)&a6->length;
  v46[1] = v15;
  v16 = *(_QWORD *)&v46[0] == v13;
  if (*(_QWORD *)&v46[0] && *(_QWORD *)&v46[0] == v13)
  {
    v17 = 1;
    do
    {
      v18 = *((_QWORD *)v46 + v17);
      v19 = *((_QWORD *)v48 + v17);
      v16 = v18 == v19;
      if (v17 >= v13)
        break;
      ++v17;
    }
    while (v18 == v19);
  }
  if (!v16)
  {
    v31 = *((_BYTE *)off_1E50B8940 + 128);
    v28 = (void *)*((_QWORD *)off_1E50B8940 + 23);
    v21 = *(double *)off_1E50B8940;
    v23 = *((double *)off_1E50B8940 + 1);
    v25 = *((double *)off_1E50B8940 + 2);
    v27 = *((double *)off_1E50B8940 + 3);
    v29 = *((double *)off_1E50B8940 + 4);
    v30 = *((double *)off_1E50B8940 + 5);
    v38 = *((double *)off_1E50B8940 + 6);
    v39 = *((double *)off_1E50B8940 + 7);
    v37 = *((double *)off_1E50B8940 + 14);
    v36 = *((double *)off_1E50B8940 + 15);
    v40 = *((double *)off_1E50B8940 + 17);
    v41 = *((double *)off_1E50B8940 + 18);
    if (!a3)
      goto LABEL_14;
    goto LABEL_13;
  }
  -[PXWidgetBarLayout contentBounds](self, "contentBounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
  v52[0] = 0;
  *(_DWORD *)((char *)v52 + 3) = 0;
  PXRectGetCenter();
  v31 = 0;
  v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v34 = *(CGPoint *)off_1E50B86D0;
  v35 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
  v36 = 10000000.0;
  v53 = *MEMORY[0x1E0C9BAA8];
  v54 = v32;
  v55 = v33;
  v50 = v34;
  v51 = v35;
  v37 = 1.0;
  v38 = v25;
  v39 = v27;
  v40 = v25;
  v41 = v27;
  if (a3)
  {
LABEL_13:
    a3->frame.origin.x = v21;
    a3->frame.origin.y = v23;
    a3->frame.size.width = v25;
    a3->frame.size.height = v27;
    a3->center.x = v29;
    a3->center.y = v30;
    a3->size.width = v38;
    a3->size.height = v39;
    v42 = v54;
    *(_OWORD *)&a3->transform.a = v53;
    *(_OWORD *)&a3->transform.c = v42;
    *(_OWORD *)&a3->transform.tx = v55;
    a3->alpha = v37;
    a3->zPosition = v36;
    a3->hidden = v31;
    v43 = v52[0];
    *((_DWORD *)&a3->hidden + 1) = *(_DWORD *)((char *)v52 + 3);
    *(_DWORD *)(&a3->hidden + 1) = v43;
    a3->contentSize.width = v40;
    a3->contentSize.height = v41;
    v44 = v50;
    a3->contentsRect.size = v51;
    a3->contentsRect.origin = v44;
    a3->coordinateSpaceIdentifier = v28;
  }
LABEL_14:
  if (a5)
    *a5 = 0;
  return v16;
}

- (double)height
{
  return self->_height;
}

void __65__PXWidgetBarLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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

+ (PXTileIdentifier)tileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1A7C0C680;
  return result;
}

@end
