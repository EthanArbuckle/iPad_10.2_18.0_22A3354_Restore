@implementation PXZoomableInlineHeaderSectionInfoMetaDataStore

- (PXZoomableInlineHeaderSectionInfoMetaDataStore)initWithDataSource:(id)a3
{
  id v5;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v6;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableInlineHeaderSectionInfoMetaDataStore;
  v6 = -[PXZoomableInlineHeaderSectionInfoMetaDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sectionInfosByLevel[0]);
  free(self->_sectionInfosByLevel[1]);
  v3.receiver = self;
  v3.super_class = (Class)PXZoomableInlineHeaderSectionInfoMetaDataStore;
  -[PXZoomableInlineHeaderSectionInfoMetaDataStore dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = self->_sectionsCountByLevel[0];
  v4 = self->_sectionsCountByLevel[1];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  v7 = objc_retainAutorelease(self);
  v8 = -[PXZoomableInlineHeaderSectionInfoMetaDataStore sectionInfosForLevel:](v7, "sectionInfosForLevel:", 0);
  if (v3 >= 1)
  {
    v9 = (uint64_t *)(v8 + 8);
    v10 = v3;
    do
    {
      v11 = *v9;
      v9 += 4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      --v10;
    }
    while (v10);
  }
  v13 = objc_retainAutorelease(v7);
  v14 = -[PXZoomableInlineHeaderSectionInfoMetaDataStore sectionInfosForLevel:](v13, "sectionInfosForLevel:", 1);
  if (v4 >= 1)
  {
    v15 = (_QWORD *)(v14 + 16);
    v16 = v4;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld-%ld"), *(v15 - 1), *v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v17);

      v15 += 4;
      --v16;
    }
    while (v16);
  }
  v18 = (void *)MEMORY[0x1E0CB3940];
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p, %ld years:[%@] %ld months:[%@]>"), v20, v13, v3, v21, v4, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)resetSectionInfos
{
  self->_sectionsCountByLevel[0] = 0;
  self->_sectionsCountByLevel[1] = 0;
}

- (void)addSectionInfo:(id *)a3 forLevel:(unint64_t)a4
{
  Class *v5;
  Class v6;
  _OWORD *v7;
  __int128 v8;

  v5 = &self->super.isa + a4;
  v6 = v5[3];
  v5[3] = (Class)((char *)v6 + 1);
  -[PXZoomableInlineHeaderSectionInfoMetaDataStore _resizeStorageIfNeededForNumberOfSections:level:](self, "_resizeStorageIfNeededForNumberOfSections:level:");
  v7 = (_OWORD *)((char *)v5[1] + 32 * (_QWORD)v6);
  v8 = *(_OWORD *)&a3->var2;
  *v7 = *(_OWORD *)&a3->var0;
  v7[1] = v8;
}

- (const)sectionInfosForLevel:(unint64_t)a3
{
  return (const $4479F518DFD59EF68F6FA14DAF968345 *)self->_sectionInfosByLevel[a3];
}

- (int64_t)numberOfSectionInfosForLevel:(unint64_t)a3
{
  return self->_sectionsCountByLevel[a3];
}

- (BOOL)updateWithDataSourceAfterChanges:(id)a3 changeDetails:(id)a4
{
  PXAssetsDataSource *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  char v16;
  uint64_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PXAssetsDataSource *dataSource;
  void *v24;
  void *v25;
  PXZoomableInlineHeaderSectionInfoMetaDataStore *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **sectionInfosByLevel;
  int64_t *sectionsCountByLevel;
  char v29;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;

  v7 = (PXAssetsDataSource *)a3;
  v8 = a4;
  if (objc_msgSend(off_1E50B4A18, "changesHaveAnyInsertionsRemovalsOrMoves:", v8))
  {
    -[PXZoomableInlineHeaderSectionInfoMetaDataStore dataSource](self, "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v25, "identifier");
    if (-[PXAssetsDataSource numberOfSections](v7, "numberOfSections") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersDataSourceManager.m"), 398, CFSTR("Only supports data sources with 1 section (or empty)"));

    }
    if (-[PXAssetsDataSource numberOfSections](v7, "numberOfSections"))
      v10 = -[PXAssetsDataSource numberOfItemsInSection:](v7, "numberOfItemsInSection:", 0) - 1;
    else
      v10 = -1;
    v12 = 0;
    sectionsCountByLevel = self->_sectionsCountByLevel;
    v26 = self;
    sectionInfosByLevel = self->_sectionInfosByLevel;
    v13 = *(_QWORD *)off_1E50B7E98;
    v14 = 1;
    v15 = 0uLL;
    v16 = 1;
    do
    {
      v29 = v16;
      v17 = sectionsCountByLevel[v12];
      if (v17 >= 1)
      {
        v18 = sectionInfosByLevel[v12];
        do
        {
          v19 = *(_QWORD *)v18;
          v31 = v15;
          v32 = v15;
          v30[0] = v9;
          v30[1] = 0;
          v30[2] = v19;
          v30[3] = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(off_1E50B4A18, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:", v8, v30, 0, 0);
          v15 = 0uLL;
          if (v19 >= v10)
            v20 = v10;
          else
            v20 = v19;
          if ((_QWORD)v31 == v13)
            v21 = v20;
          else
            v21 = v32;
          if ((_QWORD)v31 == v13)
            v14 = 0;
          *(_QWORD *)v18 = v21;
          v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 32);
          --v17;
        }
        while (v17);
      }
      v16 = 0;
      v12 = 1;
    }
    while ((v29 & 1) != 0);

    v11 = v14 & 1;
    self = v26;
  }
  else
  {
    v11 = 1;
  }
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  return v11;
}

- (void)_resizeStorageIfNeededForNumberOfSections:(int64_t)a3 level:(unint64_t)a4
{
  int64_t *sectionsCapacityByLevel;
  int64_t v6;

  sectionsCapacityByLevel = self->_sectionsCapacityByLevel;
  v6 = self->_sectionsCapacityByLevel[a4];
  if (v6 < a3)
  {
    if (!v6)
    {
      v6 = 8;
      sectionsCapacityByLevel[a4] = 8;
    }
    if (v6 < a3)
    {
      do
        v6 *= 2;
      while (v6 < a3);
      sectionsCapacityByLevel[a4] = v6;
    }
    _PXGArrayResize();
  }
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
