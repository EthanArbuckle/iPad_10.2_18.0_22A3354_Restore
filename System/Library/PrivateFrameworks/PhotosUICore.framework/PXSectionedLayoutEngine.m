@implementation PXSectionedLayoutEngine

- (PXSectionedLayoutEngine)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 51, CFSTR("%s is not available as initializer"), "-[PXSectionedLayoutEngine init]");

  abort();
}

- (PXSectionedLayoutEngine)initWithLayoutGenerator:(id)a3 dataSourceSnapshot:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 55, CFSTR("%s is not available as initializer"), "-[PXSectionedLayoutEngine initWithLayoutGenerator:dataSourceSnapshot:]");

  abort();
}

- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5
{
  return -[PXSectionedLayoutEngine initWithAxis:layoutGenerator:dataSourceSnapshot:insets:](self, "initWithAxis:layoutGenerator:dataSourceSnapshot:insets:", a3, a4, a5, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (PXSectionedLayoutEngine)initWithAxis:(int64_t)a3 layoutGenerator:(id)a4 dataSourceSnapshot:(id)a5 insets:(UIEdgeInsets)a6
{
  double right;
  double bottom;
  double left;
  double top;
  PXSectionedLayoutEngine *v11;
  PXSectionedLayoutEngine *v12;
  PXSectionedLayoutContent *v13;
  PXSectionedLayoutContent *layoutContent;
  objc_super v16;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedLayoutEngine;
  v11 = -[PXLayoutEngine initWithLayoutGenerator:dataSourceSnapshot:](&v16, sel_initWithLayoutGenerator_dataSourceSnapshot_, a4, a5);
  v12 = v11;
  if (v11)
  {
    v11->_axis = a3;
    v13 = -[PXSectionedLayoutContent initWithAxis:insets:]([PXSectionedLayoutContent alloc], "initWithAxis:insets:", a3, top, left, bottom, right);
    layoutContent = v12->_layoutContent;
    v12->_layoutContent = v13;

    v12->_geometryBuffer = 0;
  }
  return v12;
}

- (void)dealloc
{
  _PXLayoutGeometry *geometryBuffer;
  objc_super v4;

  geometryBuffer = self->_geometryBuffer;
  if (geometryBuffer)
    free(geometryBuffer);
  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  -[PXSectionedLayoutEngine dealloc](&v4, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  self->_needsUpdateSeedItem = 1;
  v3.receiver = self;
  v3.super_class = (Class)PXSectionedLayoutEngine;
  -[PXLayoutEngine performChanges:](&v3, sel_performChanges_, a3);
}

- (id)performChangesAndWait:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];
  PXSectionedLayoutEngine *v8;
  id v9;

  v7[1] = 3221225472;
  v7[2] = __49__PXSectionedLayoutEngine_performChangesAndWait___block_invoke;
  v7[3] = &unk_1E5144990;
  v8 = self;
  v9 = a3;
  v6.receiver = v8;
  v6.super_class = (Class)PXSectionedLayoutEngine;
  v7[0] = MEMORY[0x1E0C809B0];
  v3 = v9;
  -[PXLayoutEngine performChangesAndWait:](&v6, sel_performChangesAndWait_, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSeedSize:(CGSize)a3
{
  if (a3.width != self->_seedSize.width || a3.height != self->_seedSize.height)
  {
    self->_seedSize = a3;
    -[PXLayoutEngine invalidateLayoutSnapshot](self, "invalidateLayoutSnapshot");
  }
}

- (void)setDataSourceSnapshot:(id)a3 withChangeDetails:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  -[PXLayoutEngine setDataSourceSnapshot:withChangeDetails:](&v4, sel_setDataSourceSnapshot_withChangeDetails_, a3, a4);
}

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSectionedLayoutEngine;
  v4 = a3;
  -[PXLayoutEngine setDelegate:](&v6, sel_setDelegate_, v4);
  v5 = objc_opt_respondsToSelector();

  self->_delegateRespondsTo.willGenerateLayoutForSection = v5 & 1;
}

- (void)setSeedItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSectionedLayoutEngine;
  -[PXLayoutEngine setSeedItem:](&v4, sel_setSeedItem_, a3);
  self->_needsUpdateSeedItem = 0;
}

- (BOOL)canComputeLayoutSnapshot
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSectionedLayoutEngine;
  v3 = -[PXLayoutEngine canComputeLayoutSnapshot](&v5, sel_canComputeLayoutSnapshot);
  if (v3)
    LOBYTE(v3) = *(double *)(MEMORY[0x1E0C9D820] + 8) != self->_seedSize.height
              || *MEMORY[0x1E0C9D820] != self->_seedSize.width;
  return v3;
}

- (void)updateLayoutDataWithChangeDetails:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    goto LABEL_6;
  objc_msgSend(v4, "sectionChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasIncrementalChanges") & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "sectionChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasMoves");

  v5 = v9;
  if ((v8 & 1) != 0)
  {
LABEL_6:
    -[PXSectionedLayoutEngine _resetLayoutData](self, "_resetLayoutData", v5);
    goto LABEL_7;
  }
  -[PXSectionedLayoutEngine _updateLayoutDataWithChangeDetails:](self, "_updateLayoutDataWithChangeDetails:", v9);
  -[PXLayoutEngine invalidateLayoutSnapshot](self, "invalidateLayoutSnapshot");
LABEL_7:

}

- (id)computeLayoutSnapshot
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PXLayoutEngine dataSourceSnapshot](self, "dataSourceSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "numberOfSections"))
  {
    -[PXSectionedLayoutEngine _emptyLayoutSnapshot](self, "_emptyLayoutSnapshot");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[PXSectionedLayoutEngine _computeSectionsIfNeeded](self, "_computeSectionsIfNeeded"))
    goto LABEL_5;
  v4 = objc_msgSend(v3, "identifier");
  -[PXLayoutEngine layoutSnapshot](self, "layoutSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  if (v4 != v7)
  {
LABEL_5:
    v9 = -[PXSectionedLayoutEngine _newLayoutSnapshot](self, "_newLayoutSnapshot");
LABEL_7:
    v8 = v9;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)_resetLayoutData
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t i;
  id v10;
  id v11;

  -[PXLayoutEngine dataSourceSnapshot](self, "dataSourceSnapshot");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "numberOfSections");
  -[PXLayoutEngine layoutGenerator](self, "layoutGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "estimatedSize");
  v6 = v5;
  v8 = v7;
  -[PXSectionedLayoutContent removeAllSections](self->_layoutContent, "removeAllSections");
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v10 = -[PXSectionedLayoutEngine _newLayoutSection](self, "_newLayoutSection");
      objc_msgSend(v10, "setIndex:", i);
      objc_msgSend(v10, "setSize:", v6, v8);
      objc_msgSend(v10, "setAccurate:", 0);
      -[PXSectionedLayoutContent addSection:](self->_layoutContent, "addSection:", v10);

    }
  }
  -[PXLayoutEngine invalidateLayoutSnapshot](self, "invalidateLayoutSnapshot");

}

- (void)_updateLayoutDataWithChangeDetails:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v19 = a3;
  objc_msgSend(v19, "sectionChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sectionChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sectionsWithItemChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "count");
  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v8, "count");
  v12 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke;
    v22[3] = &unk_1E5148928;
    v22[4] = self;
    objc_msgSend(v5, "enumerateIndexesWithOptions:usingBlock:", 2, v22);
  }
  if (v10)
  {
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_2;
    v21[3] = &unk_1E5148928;
    v21[4] = self;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v21);
  }
  if (v11)
  {
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_3;
    v20[3] = &unk_1E5148928;
    v20[4] = self;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v20);
  }
  -[PXLayoutEngine seedItem](self, "seedItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_11;
  if (!self->_needsUpdateSeedItem)
    goto LABEL_11;
  objc_msgSend(v19, "sectionChanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexAfterApplyingChangesToIndex:", objc_msgSend(v13, "px_section"));

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  objc_msgSend(v19, "itemChangesInSection:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "indexAfterApplyingChangesToIndex:", objc_msgSend(v13, "px_item"));

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v18 = 0;
  }
  -[PXSectionedLayoutEngine setSeedItem:](self, "setSeedItem:", v18);

}

- (id)_newLayoutSection
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  PXLayoutSection *v7;

  -[PXLayoutEngine layoutGenerator](self, "layoutGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "estimatedSize");
  v4 = v3;
  v6 = v5;
  v7 = objc_alloc_init(PXLayoutSection);
  -[PXLayoutSection setFrame:](v7, "setFrame:", 0.0, 0.0, v4, v6);

  return v7;
}

- (id)_newLayoutSnapshot
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  PXSectionedLayoutSnapshot *v8;

  -[PXSectionedLayoutContent contentSize](self->_layoutContent, "contentSize");
  v4 = v3;
  v6 = v5;
  -[PXSectionedLayoutContent sections](self->_layoutContent, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSectionedLayoutSnapshot initWithContentRect:forSections:]([PXSectionedLayoutSnapshot alloc], "initWithContentRect:forSections:", v7, 0.0, 0.0, v4, v6);

  return v8;
}

- (BOOL)_computeSectionsIfNeeded
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  PXSectionedLayoutContent *layoutContent;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  SEL v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PXLayoutEngine dataSourceSnapshot](self, "dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");
  if (v5 < 1)
  {
    v29 = 0;
  }
  else
  {
    v6 = v5;
    v31 = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXLayoutEngine seedItem](self, "seedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "px_section");
    v33 = objc_msgSend(v8, "px_item");
    v32 = objc_msgSend(v8, "px_kind");
    -[PXSectionedLayoutContent sections](self->_layoutContent, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    -[PXLayoutEngine layoutGenerator](self, "layoutGenerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "estimatedSize");
    if (v11 < v6)
    {
      v15 = v13;
      v16 = v14;
      do
      {
        v17 = -[PXSectionedLayoutEngine _newLayoutSection](self, "_newLayoutSection");
        objc_msgSend(v17, "setIndex:", v11);
        objc_msgSend(v17, "setSize:", v15, v16);
        objc_msgSend(v17, "setAccurate:", 0);
        -[PXSectionedLayoutContent addSection:](self->_layoutContent, "addSection:", v17);

        ++v11;
      }
      while (v6 != v11);
    }
    -[PXSectionedLayoutContent sections](self->_layoutContent, "sections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 <= v9)
    {
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (uint64_t)v4;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "dataSourceSnapshot %@", buf, 0xCu);
      }

      PLUIGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_msgSend(v4, "numberOfSections");
        *(_DWORD *)buf = 134217984;
        v35 = v22;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEBUG, "[dataSourceSnapshot numberOfSections] %ld", buf, 0xCu);
      }

      PLUIGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        layoutContent = self->_layoutContent;
        *(_DWORD *)buf = 138412290;
        v35 = (uint64_t)layoutContent;
        _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEBUG, "_layoutContent %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, CFSTR("PXSectionedLayoutEngine.m"), 260, CFSTR("Seed item specifies out of bounds section index: sections %ld > seedSectionIndex %ld"), v19, v9);

    }
    -[PXSectionedLayoutContent sectionAtIndex:](self->_layoutContent, "sectionAtIndex:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isAccurate") & 1) == 0)
    {
      -[PXSectionedLayoutEngine _computeSection:](self, "_computeSection:", v26);
      objc_msgSend(v7, "addObject:", v26);
    }
    -[PXSectionedLayoutEngine _computeSectionsFromSection:itemIndex:kind:](self, "_computeSectionsFromSection:itemIndex:kind:", v26, v33, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v27);
    v28 = objc_msgSend(v7, "count");
    v29 = v28 != 0;
    if (v28)
      -[PXSectionedLayoutContent updateSections:](self->_layoutContent, "updateSections:", v7);

  }
  return v29;
}

- (id)_computeSectionsFromSection:(id)a3 itemIndex:(int64_t)a4 kind:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t axis;
  double v24;
  double v25;
  double *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  int64_t v33;
  void *v34;
  BOOL v35;
  unint64_t v36;
  int64_t v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  int64_t v49;
  void *v50;
  uint64_t v52;
  void *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedLayoutEngine seedSize](self, "seedSize");
  v11 = v10;
  v13 = v12;
  -[PXLayoutEngine dataSourceSnapshot](self, "dataSourceSnapshot");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v53, "numberOfSections");
  v15 = objc_msgSend(v8, "index");
  v16 = v8;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  objc_msgSend(v16, "geometriesWithKind:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "geometryAtIndex:", a4);
  }
  else
  {
    v64 = 0;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
  }

  objc_msgSend(v16, "frame");
  v21 = v19;
  v22 = v20;
  axis = self->_axis;
  v24 = 0.0;
  if (axis)
  {
    if (axis == 2)
    {
      v26 = (double *)&v55 + 1;
      v25 = v19;
      v13 = v11;
    }
    else
    {
      v25 = 0.0;
      if (axis != 1)
        goto LABEL_26;
      v26 = (double *)&v56;
      v25 = v20;
    }
    v24 = v13 * 0.5;
    if (v15)
    {
      v28 = v25 + *v26 - v24;
      if (v25 > v28)
      {
        v52 = v14;
        v29 = v15 - 1;
        do
        {
          -[PXSectionedLayoutContent sectionAtIndex:](self->_layoutContent, "sectionAtIndex:", v29, v52);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v30, "isAccurate") & 1) == 0)
          {
            -[PXSectionedLayoutEngine _computeSection:](self, "_computeSection:", v30);
            objc_msgSend(v9, "insertObject:atIndex:", v30, 0);
          }
          objc_msgSend(v30, "frame");
          v33 = self->_axis;
          if (v33)
          {
            if (v33 != 1)
              v32 = v25;
            if (v33 == 2)
              v25 = v31;
            else
              v25 = v32;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 338, CFSTR("axis == PXAxisUndefined"));

          }
          v35 = v29-- != 0;
        }
        while (v35 && v25 > v28);
        v14 = v52;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 311, CFSTR("axis == PXAxisUndefined"));

    v25 = 0.0;
  }
LABEL_26:
  v36 = objc_msgSend(v16, "index");
  v37 = self->_axis;
  v38 = 0.0;
  if (v37)
  {
    if (v37 == 2)
    {
      v38 = v24 + v21 + *((double *)&v55 + 1);
      objc_msgSend(v16, "frame");
      v25 = v21 + v41;
    }
    else if (v37 == 1)
    {
      v38 = v24 + v22 + *(double *)&v56;
      objc_msgSend(v16, "frame");
      v25 = v22 + v39;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 363, CFSTR("axis == PXAxisUndefined"));

  }
  v42 = v14 - 1;
  if (v36 < v14 - 1 && v25 < v38)
  {
    v43 = v36 + 1;
    do
    {
      -[PXSectionedLayoutContent sectionAtIndex:](self->_layoutContent, "sectionAtIndex:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isAccurate") & 1) == 0)
      {
        -[PXSectionedLayoutEngine _computeSection:](self, "_computeSection:", v44);
        objc_msgSend(v9, "addObject:", v44);
      }
      objc_msgSend(v44, "frame");
      v49 = self->_axis;
      if (v49)
      {
        if (v49 == 2)
        {
          v25 = v45 + v47;
        }
        else if (v49 == 1)
        {
          v25 = v46 + v48;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 389, CFSTR("axis == PXAxisUndefined"));

      }
      if (v43 >= v42)
        break;
      ++v43;
    }
    while (v25 < v38);
  }

  return v9;
}

- (void)_computeSection:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PXSectionedLayoutEngine *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedLayoutEngine.m"), 400, CFSTR("section is nil"));

  }
  -[PXLayoutEngine dataSourceSnapshot](self, "dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "index");
  v8 = objc_msgSend(v6, "numberOfItemsInSection:", v7);
  -[PXLayoutEngine layoutGenerator](self, "layoutGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateRespondsTo.willGenerateLayoutForSection)
  {
    -[PXLayoutEngine delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutEngine:willGenerateLayoutWithGenerator:forSection:", self, v9, v7);

  }
  objc_msgSend(v9, "setItemCount:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __43__PXSectionedLayoutEngine__computeSection___block_invoke;
  v21[3] = &unk_1E51449B8;
  v22 = v6;
  v23 = v7;
  v12 = v6;
  objc_msgSend(v9, "setItemLayoutInfoBlock:", v21);
  objc_msgSend(v9, "geometryKinds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __43__PXSectionedLayoutEngine__computeSection___block_invoke_2;
  v17[3] = &unk_1E51489A0;
  v18 = v9;
  v19 = self;
  v20 = v5;
  v14 = v5;
  v15 = v9;
  objc_msgSend(v13, "enumerateIndexesUsingBlock:", v17);
  objc_msgSend(v15, "size");
  objc_msgSend(v14, "setSize:");
  objc_msgSend(v14, "setAccurate:", 1);

}

- (void)_prepareGeometryBufferForCount:(unint64_t)a3
{
  if (self->_geometryBufferCount < a3)
  {
    self->_geometryBuffer = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometryBuffer, 152 * a3, 0x100004050011849uLL);
    self->_geometryBufferCount = a3;
  }
}

- (id)_emptyLayoutSnapshot
{
  return +[PXSectionedLayoutSnapshot emptyLayoutSnapshot](PXSectionedLayoutSnapshot, "emptyLayoutSnapshot");
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGSize)seedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_seedSize.width;
  height = self->_seedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContent, 0);
}

id __43__PXSectionedLayoutEngine__computeSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __43__PXSectionedLayoutEngine__computeSection___block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  PXLayoutGeometryArray *v6;
  PXLayoutGeometryArray *v7;

  v4 = objc_msgSend(a1[4], "numberOfGeometriesWithKind:", a2);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1[5], "_prepareGeometryBufferForCount:", v4);
    objc_msgSend(a1[4], "getGeometries:inRange:withKind:", *((_QWORD *)a1[5] + 11), 0, v5, a2);
    v6 = -[PXLayoutGeometryArray initWithGeometries:count:]([PXLayoutGeometryArray alloc], "initWithGeometries:count:", *((_QWORD *)a1[5] + 11), v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(a1[6], "setGeometries:withKind:", v6, a2);

}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sectionAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeSection:", v3);

}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "_newLayoutSection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "insertSection:atIndex:", v4, a2);

}

void __62__PXSectionedLayoutEngine__updateLayoutDataWithChangeDetails___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sectionAtIndex:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccurate:", 0);

}

uint64_t __49__PXSectionedLayoutEngine_performChangesAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
