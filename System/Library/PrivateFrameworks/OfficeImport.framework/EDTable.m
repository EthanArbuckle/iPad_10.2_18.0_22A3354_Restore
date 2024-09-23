@implementation EDTable

- (EDTable)initWithResources:(id)a3
{
  id v4;
  EDTable *v5;
  EDTable *v6;
  __int128 v7;
  EDCollection *v8;
  EDCollection *mTableColumns;
  EDCollection *v10;
  EDCollection *mColumnFilters;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDTable;
  v5 = -[EDTable init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_QWORD *)&v7 = -1;
    *((_QWORD *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mStyleIndex = v7;
    *(_OWORD *)&v6->mTotalsRowDxfIndex = v7;
    *(_OWORD *)&v6->mHeaderRowBorderDxfIndex = v7;
    *(_OWORD *)&v6->mDataAreaBorderDxfIndex = v7;
    *(_OWORD *)&v6->mHeaderRowCount = xmmword_22A4BF980;
    v8 = objc_alloc_init(EDCollection);
    mTableColumns = v6->mTableColumns;
    v6->mTableColumns = v8;

    v10 = objc_alloc_init(EDCollection);
    mColumnFilters = v6->mColumnFilters;
    v6->mColumnFilters = v10;

    *(_DWORD *)&v6->mShowFirstColumn = 0x10000;
  }

  return v6;
}

- (void)setName:(id)a3
{
  NSString *v5;
  NSString **p_mName;
  NSString *mName;
  NSString *v8;

  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }

}

- (void)setDisplayName:(id)a3
{
  NSString *v5;
  NSString **p_mDisplayName;
  NSString *mDisplayName;
  NSString *v8;

  v5 = (NSString *)a3;
  mDisplayName = self->mDisplayName;
  p_mDisplayName = &self->mDisplayName;
  if (mDisplayName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDisplayName, a3);
    v5 = v8;
  }

}

- (void)setTableRange:(id)a3
{
  EDReference *v5;
  EDReference **p_mTableRange;
  EDReference *mTableRange;
  EDReference *v8;

  v5 = (EDReference *)a3;
  mTableRange = self->mTableRange;
  p_mTableRange = &self->mTableRange;
  if (mTableRange != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTableRange, a3);
    v5 = v8;
  }

}

- (id)tableColumns
{
  return self->mTableColumns;
}

- (id)name
{
  return self->mName;
}

- (void)setTableBorderDxfIndex:(unint64_t)a3
{
  self->mTableBorderDxfIndex = a3;
}

- (void)setShowFirstColumn:(BOOL)a3
{
  self->mShowFirstColumn = a3;
}

- (void)setShowLastColumn:(BOOL)a3
{
  self->mShowLastColumn = a3;
}

- (void)setShowRowStripes:(BOOL)a3
{
  self->mShowRowStripes = a3;
}

- (void)setShowColumnStripes:(BOOL)a3
{
  self->mShowColumnStripes = a3;
}

- (id)columnFilters
{
  return self->mColumnFilters;
}

- (void)setStyleName:(id)a3
{
  NSString *v5;
  NSString **p_mStyleName;
  NSString *mStyleName;
  NSString *v8;

  v5 = (NSString *)a3;
  mStyleName = self->mStyleName;
  p_mStyleName = &self->mStyleName;
  if (mStyleName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mStyleName, a3);
    v5 = v8;
  }

}

- (id)tableRange
{
  return self->mTableRange;
}

- (unint64_t)headerRowCount
{
  return self->mHeaderRowCount;
}

- (unint64_t)totalsRowCount
{
  return self->mTotalsRowCount;
}

- (id)style
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "tableStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectWithName:", self->mStyleName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableBorderDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mTableBorderDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)showFirstColumn
{
  return self->mShowFirstColumn;
}

- (BOOL)showLastColumn
{
  return self->mShowLastColumn;
}

- (BOOL)showColumnStripes
{
  return self->mShowColumnStripes;
}

- (BOOL)showRowStripes
{
  return self->mShowRowStripes;
}

- (void)setHeaderRowDxfIndex:(unint64_t)a3
{
  self->mHeaderRowDxfIndex = a3;
}

- (void)setHeaderRowBorderDxfIndex:(unint64_t)a3
{
  self->mHeaderRowBorderDxfIndex = a3;
}

- (void)setTotalsRowBorderDxfIndex:(unint64_t)a3
{
  self->mTotalsRowBorderDxfIndex = a3;
}

- (void)setDataAreaDxfIndex:(unint64_t)a3
{
  self->mDataAreaDxfIndex = a3;
}

+ (id)tableWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (void)setStyle:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "tableStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mStyleIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)headerRowDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mHeaderRowDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHeaderRowDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mHeaderRowDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)totalsRowDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mTotalsRowDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTotalsRowDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mTotalsRowDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)dataAreaDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mDataAreaDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDataAreaDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mDataAreaDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)headerRowBorderDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mHeaderRowBorderDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHeaderRowBorderDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mHeaderRowBorderDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)totalsRowBorderDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mTotalsRowBorderDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTotalsRowBorderDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mTotalsRowBorderDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)dataAreaBorderDxf
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mDataAreaBorderDxfIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDataAreaBorderDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mDataAreaBorderDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (void)setTableBorderDxf:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mTableBorderDxfIndex = objc_msgSend(v5, "addObject:", v6);
}

- (id)displayName
{
  return self->mDisplayName;
}

- (id)styleName
{
  return self->mStyleName;
}

- (void)setHeaderRowCount:(unint64_t)a3
{
  self->mHeaderRowCount = a3;
}

- (void)setTotalsRowCount:(unint64_t)a3
{
  self->mTotalsRowCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnFilters, 0);
  objc_storeStrong((id *)&self->mTableColumns, 0);
  objc_storeStrong((id *)&self->mStyleName, 0);
  objc_storeStrong((id *)&self->mTableRange, 0);
  objc_storeStrong((id *)&self->mDisplayName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (unint64_t)headerRowDxfIndex
{
  return self->mHeaderRowDxfIndex;
}

- (unint64_t)totalsRowDxfIndex
{
  return self->mTotalsRowDxfIndex;
}

- (void)setTotalsRowDxfIndex:(unint64_t)a3
{
  self->mTotalsRowDxfIndex = a3;
}

- (unint64_t)dataAreaDxfIndex
{
  return self->mDataAreaDxfIndex;
}

- (unint64_t)headerRowBorderDxfIndex
{
  return self->mHeaderRowBorderDxfIndex;
}

- (unint64_t)totalsRowBorderDxfIndex
{
  return self->mTotalsRowBorderDxfIndex;
}

- (unint64_t)dataAreaBorderDxfIndex
{
  return self->mDataAreaBorderDxfIndex;
}

- (void)setDataAreaBorderDxfIndex:(unint64_t)a3
{
  self->mDataAreaBorderDxfIndex = a3;
}

- (unint64_t)tableBorderDxfIndex
{
  return self->mTableBorderDxfIndex;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTable;
  -[EDTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
