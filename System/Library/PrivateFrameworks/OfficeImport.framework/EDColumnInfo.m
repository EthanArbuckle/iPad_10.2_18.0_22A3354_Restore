@implementation EDColumnInfo

- (EDColumnInfo)initWithResources:(id)a3 worksheet:(id)a4
{
  id v6;
  id v7;
  EDColumnInfo *v8;
  EDColumnInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDColumnInfo;
  v8 = -[EDColumnInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->mWorksheet, v7);
    objc_storeWeak((id *)&v9->mResources, v6);
    v9->mWidth = 0;
    v9->mHidden = 0;
    v9->mStyleIndex = -1;
    v9->mOutlineLevel = 0;
  }

  return v9;
}

- (void)setWidthInXlUnits:(int)a3
{
  self->mWidth = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (void)setRangeWithFirstColumn:(int)a3 lastColumn:(int)a4
{
  id v5;

  +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, *(_QWORD *)&a3, *(_QWORD *)&a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EDColumnInfo setRange:](self, "setRange:");

}

- (void)setRange:(id)a3
{
  EDReference *v5;
  EDReference **p_mRange;
  EDReference *mRange;
  EDReference *v8;

  v5 = (EDReference *)a3;
  mRange = self->mRange;
  p_mRange = &self->mRange;
  if (mRange != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mRange, a3);
    v5 = v8;
  }

}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (void)setOutlineLevel:(unsigned __int8)a3
{
  id WeakRetained;

  self->mOutlineLevel = a3;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mWorksheet);
    objc_msgSend(WeakRetained, "updateMaxColumnOutlineLevelIfNeeded:", self->mOutlineLevel);

  }
}

- (int64_t)key
{
  return -[EDReference firstColumn](self->mRange, "firstColumn");
}

- (id)range
{
  return self->mRange;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (double)width
{
  double v3;
  id WeakRetained;
  double v5;
  EDWorksheet **p_mWorksheet;
  id v7;
  void *v8;
  id v9;
  int v10;

  v3 = (double)-[EDColumnInfo widthInXlUnits](self, "widthInXlUnits") * 0.00390625;
  if (v3 == 0.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mWorksheet);
    objc_msgSend(WeakRetained, "defaultColumnWidth");
    v3 = v5;

  }
  p_mWorksheet = &self->mWorksheet;
  v7 = objc_loadWeakRetained((id *)p_mWorksheet);
  if (v7)
  {
    v8 = v7;
    v9 = objc_loadWeakRetained((id *)p_mWorksheet);
    v10 = objc_msgSend(v9, "isDisplayFormulas");

    if (v10)
      return v3 + v3;
  }
  return v3;
}

- (int)widthInXlUnits
{
  return self->mWidth;
}

- (id)style
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "styles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mStyleIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setWidth:(double)a3
{
  int v3;
  int v4;

  v3 = vcvtd_n_s64_f64(a3, 8uLL);
  if (v3 <= 0)
    v4 = -(-v3 & 7);
  else
    v4 = v3 & 7;
  -[EDColumnInfo setWidthInXlUnits:](self, "setWidthInXlUnits:", (v4 + v3));
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

+ (id)columnInfoWithResources:(id)a3 worksheet:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:worksheet:", v5, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v5 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v7 = objc_loadWeakRetained((id *)&self->mWorksheet);
  v8 = objc_msgSend(v5, "initWithResources:worksheet:", WeakRetained, v7);

  if (v8)
  {
    *(_DWORD *)(v8 + 24) = self->mWidth;
    *(_BYTE *)(v8 + 28) = self->mHidden;
    v9 = -[EDReference copyWithZone:](self->mRange, "copyWithZone:", a3);
    v10 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v9;

    *(_QWORD *)(v8 + 40) = self->mStyleIndex;
    *(_BYTE *)(v8 + 48) = self->mOutlineLevel;
    v11 = (id)v8;
  }

  return (id)v8;
}

- (void)setStyle:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "styles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mStyleIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);
}

- (unsigned)outlineLevel
{
  return self->mOutlineLevel;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDColumnInfo;
  -[EDColumnInfo description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRange, 0);
  objc_destroyWeak((id *)&self->mWorksheet);
  objc_destroyWeak((id *)&self->mResources);
}

@end
