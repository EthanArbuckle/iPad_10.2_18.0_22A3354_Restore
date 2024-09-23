@implementation PXDemoTilingControllerWidgetLayout

- (void)setReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[PXTilingLayout referenceSize](self, "referenceSize");
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PXDemoTilingControllerWidgetLayout;
    -[PXTilingLayout setReferenceSize:](&v9, sel_setReferenceSize_, width, height);
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PXTilingLayout contentInset](self, "contentInset");
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXDemoTilingControllerWidgetLayout;
    -[PXTilingLayout setContentInset:](&v8, sel_setContentInset_, top, left, bottom, right);
    -[PXTilingLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGRect)contentBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXTilingLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
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
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _OWORD v25[5];
  uint64_t v26;
  _QWORD aBlock[5];
  id v28;
  _QWORD *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  _QWORD v34[3];
  char v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PXDemoTilingControllerWidgetLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5140468;
  v29 = v34;
  aBlock[4] = self;
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  v13 = v12;
  v28 = v13;
  v14 = (void (**)(void *, _OWORD *))_Block_copy(aBlock);
  v15 = (void *)objc_opt_class();
  if (v15)
  {
    objc_msgSend(v15, "backgroundTileIdentifier");
  }
  else
  {
    v26 = 0;
    memset(v25, 0, sizeof(v25));
  }
  v14[2](v14, v25);
  -[PXAssetsTilingLayout dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "numberOfSections") >= 1 && objc_msgSend(v16, "numberOfItemsInSection:", 0) >= 1)
  {
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v17 = xmmword_1A7C0C200;
    v18 = objc_msgSend(v16, "identifier");
    v19 = 0;
    v20 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    v14[2](v14, &v17);
  }

  _Block_object_dispose(v34, 8);
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  BOOL v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL IsNull;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  __int128 v43;
  CGPoint v44;
  double v46;
  _OWORD v47[5];
  unint64_t v48;
  _OWORD v49[5];
  uint64_t v50;
  CGRect v51;

  v12 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PXDemoTilingControllerWidgetLayout contentBounds](self, "contentBounds");
  -[PXTilingLayout contentInset](self, "contentInset");
  PXEdgeInsetsInsetRect();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_opt_class();
  if (v23)
  {
    objc_msgSend(v23, "backgroundTileIdentifier");
    v24 = *(_QWORD *)&v49[0];
  }
  else
  {
    v24 = 0;
    v50 = 0;
    memset(v49, 0, sizeof(v49));
  }
  v25 = *(_OWORD *)&a6->index[5];
  v47[2] = *(_OWORD *)&a6->index[3];
  v47[3] = v25;
  v47[4] = *(_OWORD *)&a6->index[7];
  v48 = a6->index[9];
  v26 = *(_OWORD *)&a6->index[1];
  v47[0] = *(_OWORD *)&a6->length;
  v47[1] = v26;
  v27 = *(_QWORD *)&v47[0] == v24;
  if (*(_QWORD *)&v47[0] && *(_QWORD *)&v47[0] == v24)
  {
    v28 = 1;
    do
    {
      v29 = *((_QWORD *)v47 + v28);
      v30 = *((_QWORD *)v49 + v28);
      v27 = v29 == v30;
      if (v28 >= v24)
        break;
      ++v28;
    }
    while (v29 == v30);
  }
  if (v27)
  {
    v46 = -1.0;
    v13 = v22;
    v14 = v20;
    v11 = v18;
    v12 = v16;
  }
  else if (a6->length == 5 && a6->index[0] == 6432423)
  {
    v46 = 0.0;
    v31 = a6->index[1];
    -[PXAssetsTilingLayout dataSource](self, "dataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "identifier");

    if (v31 == v33 && *(_OWORD *)&a6->index[2] == 0)
    {
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v12 = v34;
      v11 = v35;
      v14 = v36;
      v13 = v37;
    }
  }
  else
  {
    v46 = 0.0;
  }
  v51.origin.x = v12;
  v51.origin.y = v11;
  v51.size.width = v14;
  v51.size.height = v13;
  IsNull = CGRectIsNull(v51);
  if (!IsNull)
  {
    if (a3)
    {
      v39 = -[PXTilingLayout coordinateSpaceIdentifier](self, "coordinateSpaceIdentifier");
      PXRectGetCenter();
      a3->frame.origin.x = v12;
      a3->frame.origin.y = v11;
      a3->frame.size.width = v14;
      a3->frame.size.height = v13;
      a3->center.x = v40;
      a3->center.y = v41;
      a3->size.width = v14;
      a3->size.height = v13;
      v42 = MEMORY[0x1E0C9BAA8];
      v43 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&a3->transform.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&a3->transform.c = v43;
      *(_OWORD *)&a3->transform.tx = *(_OWORD *)(v42 + 32);
      a3->alpha = 1.0;
      *(_QWORD *)&a3->hidden = 0;
      a3->contentSize.width = v14;
      a3->contentSize.height = v13;
      v44 = *(CGPoint *)off_1E50B86D0;
      a3->contentsRect.size = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
      a3->contentsRect.origin = v44;
      a3->coordinateSpaceIdentifier = v39;
      a3->zPosition = v46;
    }
    if (a4)
      *a4 = 0;
    if (a5)
      *a5 = 0;
  }
  return !IsNull;
}

void __82__PXDemoTilingControllerWidgetLayout_enumerateTilesInRect_withOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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

+ (PXTileIdentifier)backgroundTileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1A7C0C3C0;
  return result;
}

@end
