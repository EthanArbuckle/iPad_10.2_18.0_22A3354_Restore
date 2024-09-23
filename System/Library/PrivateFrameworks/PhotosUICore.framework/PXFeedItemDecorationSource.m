@implementation PXFeedItemDecorationSource

- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "spriteIndexesForItems:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setDecoratedLayout:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    -[PXFeedItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    v5 = obj;
  }

}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  if (*(_OWORD *)&self->_dataSource != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_section = a4;
    v9 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXFeedItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateDecoration");

    v7 = v9;
  }

}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  void *v6;
  PXSelectionSnapshot *v7;

  v5 = (PXSelectionSnapshot *)a3;
  if (self->_selectionSnapshot != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    -[PXFeedItemDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    v5 = v7;
  }

}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v5 = a3;
  -[PXFeedItemDecorationSource selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") < 1)
  {
    v13 = 0;
  }
  else
  {
    -[PXFeedItemDecorationSource dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "identifier");

    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "identifier");

    if (v9 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedItemDecorationSource.m"), 79, CFSTR("identifier mismatch between dataSource of %@ and selectionSnapshot %@"), self, v6);

    }
    objc_msgSend(v7, "itemIndexSetForDataSourceIdentifier:section:", v9, -[PXFeedItemDecorationSource section](self, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PXFeedItemDecorationSource _spriteIndexesForItems:inLayout:](self, "_spriteIndexesForItems:inLayout:", v12, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "sectionIndexSetForDataSourceIdentifier:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "containsIndex:", -[PXFeedItemDecorationSource section](self, "section"))
        && (objc_msgSend(v6, "dataSource"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "numberOfItemsInSection:", -[PXFeedItemDecorationSource section](self, "section")),
            v15,
            v16 >= 1))
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFeedItemDecorationSource _spriteIndexesForItems:inLayout:](self, "_spriteIndexesForItems:inLayout:", v17, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

    }
  }

  return v13;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;
  CGRect v21;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = *(float *)off_1E50B8290;
  v7 = *((float *)off_1E50B8290 + 1);
  v8 = *((float *)off_1E50B8290 + 2);
  v9 = *((float *)off_1E50B8290 + 3);
  v10 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "decorationOverlayRectForSpriteIndex:", v4);
      if (!CGRectIsNull(v21))
      {
        objc_msgSend(v11, "geometryForSpriteAtIndex:", v4);
        PXEdgeInsetsBetweenRects();
        v6 = v12;
        v7 = v13;
        v8 = v14;
        v9 = v15;
      }
    }
  }
  else
  {

    v11 = 0;
  }

  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (PXGLayout)decoratedLayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_decoratedLayout);
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)section
{
  return self->_section;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXFeedSectionContentLayout)decoratedSectionContentLayout
{
  return self->_decoratedSectionContentLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedSectionContentLayout, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
}

@end
