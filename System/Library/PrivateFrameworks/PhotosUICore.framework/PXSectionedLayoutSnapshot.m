@implementation PXSectionedLayoutSnapshot

- (PXSectionedLayoutSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutSnapshot.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSectionedLayoutSnapshot init]");

  abort();
}

- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutSnapshot.m"), 38, CFSTR("%s is not available as initializer"), "-[PXSectionedLayoutSnapshot initWithContentRect:]");

  abort();
}

- (PXSectionedLayoutSnapshot)initWithContentRect:(CGRect)a3 forSections:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PXSectionedLayoutSnapshot *v10;
  uint64_t v11;
  NSArray *sections;
  PXLayoutPageMap *v13;
  PXLayoutPageMap *pageMap;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedLayoutSnapshot;
  v10 = -[PXLayoutSnapshot initWithContentRect:](&v16, sel_initWithContentRect_, x, y, width, height);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v9, 1);
    sections = v10->_sections;
    v10->_sections = (NSArray *)v11;

    v13 = -[PXLayoutPageMap initWithSources:contentRect:]([PXLayoutPageMap alloc], "initWithSources:contentRect:", v10->_sections, x, y, width, height);
    pageMap = v10->_pageMap;
    v10->_pageMap = v13;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSectionedLayoutSnapshot;
  -[PXLayoutSnapshot description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("contents:%@"), self->_sections);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_PXLayoutGeometry)geometryForItem:(SEL)a3
{
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  _PXLayoutGeometry *result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGFloat v27;

  v6 = a4;
  v7 = *((_OWORD *)off_1E50B8498 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E50B8498 + 6);
  *(_OWORD *)&retstr->var6.origin.y = v7;
  *(_OWORD *)&retstr->var6.size.height = *((_OWORD *)off_1E50B8498 + 8);
  retstr->var7.height = *((CGFloat *)off_1E50B8498 + 18);
  v8 = *((_OWORD *)off_1E50B8498 + 3);
  *(_OWORD *)&retstr->var2.height = *((_OWORD *)off_1E50B8498 + 2);
  *(_OWORD *)&retstr->var3.b = v8;
  v9 = *((_OWORD *)off_1E50B8498 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E50B8498 + 4);
  *(_OWORD *)&retstr->var3.ty = v9;
  v10 = *((_OWORD *)off_1E50B8498 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E50B8498;
  *(_OWORD *)&retstr->var1.y = v10;
  v11 = objc_msgSend(v6, "px_section");
  if (v11 < -[NSArray count](self->_sections, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "px_item");
    objc_msgSend(v12, "geometriesWithKind:", objc_msgSend(v6, "px_kind"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 < objc_msgSend(v14, "count"))
    {
      if (v14)
      {
        objc_msgSend(v14, "geometryAtIndex:", v13);
      }
      else
      {
        v27 = 0.0;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v18 = 0u;
      }
      *(_OWORD *)&retstr->var5 = v24;
      *(_OWORD *)&retstr->var6.origin.y = v25;
      *(_OWORD *)&retstr->var6.size.height = v26;
      retstr->var7.height = v27;
      *(_OWORD *)&retstr->var2.height = v20;
      *(_OWORD *)&retstr->var3.b = v21;
      *(_OWORD *)&retstr->var3.d = v22;
      *(_OWORD *)&retstr->var3.ty = v23;
      *(_OWORD *)&retstr->var0 = v18;
      *(_OWORD *)&retstr->var1.y = v19;
      objc_msgSend(v12, "frame", v18, v19, v20, v21, v22, v23, v24, v25, v26, *(_QWORD *)&v27);
      PXPointAdd();
      retstr->var1.x = v15;
      retstr->var1.y = v16;
    }

  }
  return result;
}

- (void)enumerateGeometriesForItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  _QWORD v25[5];
  id v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  -[PXLayoutPageMap sourcesFromRect:](self->_pageMap, "sourcesFromRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v16, "frame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        v42.origin.x = v18;
        v42.origin.y = v20;
        v42.size.width = v22;
        v42.size.height = v24;
        if (CGRectIntersectsRect(v41, v42))
        {
          v25[0] = v14;
          v25[1] = 3221225472;
          v25[2] = __74__PXSectionedLayoutSnapshot_enumerateGeometriesForItemsInRect_usingBlock___block_invoke;
          v25[3] = &unk_1E5118628;
          v27 = v18;
          v28 = v20;
          v29 = v22;
          v30 = v24;
          v31 = x;
          v32 = y;
          v33 = width;
          v34 = height;
          v25[4] = v16;
          v26 = v9;
          objc_msgSend(v16, "enumerateGeometriesWithBlock:", v25);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }

}

- (void)enumerateFramesForSectionsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void (**v9)(id, uint64_t, _BYTE *, double, double, double, double);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, uint64_t, _BYTE *, double, double, double, double))a4;
  -[PXLayoutPageMap sourcesFromRect:](self->_pageMap, "sourcesFromRect:", x, y, width, height);
  v28 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      objc_msgSend(v15, "frame", (_QWORD)v24);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v32.origin.x = v17;
      v32.origin.y = v19;
      v32.size.width = v21;
      v32.size.height = v23;
      if (CGRectIntersectsRect(v31, v32))
      {
        v9[2](v9, objc_msgSend(v15, "index"), &v28, v17, v19, v21, v23);
        if (v28)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (CGRect)frameForSectionAtIndex:(unint64_t)a3
{
  NSArray *v6;
  void *v7;
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
  double v18;
  double v19;
  void *v20;
  CGRect result;

  v6 = self->_sections;
  if (-[NSArray count](v6, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutSnapshot.m"), 106, CFSTR("Sectioned snapshot asked for rect for section %lu, but there are only %lu sections:\r%@"), a3, -[NSArray count](v6, "count"), v6);

  }
  -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageMap, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

void __74__PXSectionedLayoutSnapshot_enumerateGeometriesForItemsInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[9];
  uint64_t v24;
  CGRect v25;

  PXPointAdd();
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a2 + 16) = v7;
  PXRectWithCenterAndSize();
  v25.origin.x = v8;
  v25.origin.y = v9;
  v25.size.width = v10;
  v25.size.height = v11;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 80), v25))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:withKind:", *(_QWORD *)a2, objc_msgSend(*(id *)(a1 + 32), "index"), *(_QWORD *)(a2 + 96));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void (**)(uint64_t, void *, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16);
    v15 = *(_OWORD *)(a2 + 112);
    v23[6] = *(_OWORD *)(a2 + 96);
    v23[7] = v15;
    v23[8] = *(_OWORD *)(a2 + 128);
    v24 = *(_QWORD *)(a2 + 144);
    v16 = *(_OWORD *)(a2 + 48);
    v23[2] = *(_OWORD *)(a2 + 32);
    v23[3] = v16;
    v17 = *(_OWORD *)(a2 + 80);
    v23[4] = *(_OWORD *)(a2 + 64);
    v23[5] = v17;
    v18 = *(_OWORD *)(a2 + 16);
    v23[0] = *(_OWORD *)a2;
    v23[1] = v18;
    v14(v13, v12, v23, a3, v19, v20, v21, v22);

  }
}

+ (id)emptyLayoutSnapshot
{
  if (emptyLayoutSnapshot_onceToken != -1)
    dispatch_once(&emptyLayoutSnapshot_onceToken, &__block_literal_global_14480);
  return (id)emptyLayoutSnapshot_emptySnapshot;
}

void __48__PXSectionedLayoutSnapshot_emptyLayoutSnapshot__block_invoke()
{
  PXSectionedLayoutSnapshot *v0;
  uint64_t v1;
  void *v2;

  v0 = [PXSectionedLayoutSnapshot alloc];
  v1 = -[PXSectionedLayoutSnapshot initWithContentRect:forSections:](v0, "initWithContentRect:forSections:", MEMORY[0x1E0C9AA60], *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)emptyLayoutSnapshot_emptySnapshot;
  emptyLayoutSnapshot_emptySnapshot = v1;

}

@end
