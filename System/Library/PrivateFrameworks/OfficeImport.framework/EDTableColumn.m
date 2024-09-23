@implementation EDTableColumn

- (EDTableColumn)initWithResources:(id)a3
{
  id v4;
  EDTableColumn *v5;
  EDTableColumn *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDTableColumn;
  v5 = -[EDTableColumn init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mHeaderRowDxfIndex = -1;
    v6->mTotalsRowDxfIndex = -1;
    v6->mDataAreaDxfIndex = -1;
  }

  return v6;
}

- (void)setName:(id)a3
{
  EDString *v5;
  EDString **p_mName;
  EDString *mName;
  EDString *v8;

  v5 = (EDString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }

}

- (void)setDataAreaDxfIndex:(unint64_t)a3
{
  self->mDataAreaDxfIndex = a3;
}

+ (id)tableColumnWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
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

- (id)name
{
  return self->mName;
}

- (id)uniqueName
{
  return self->mUniqueName;
}

- (void)setUniqueName:(id)a3
{
  EDString *v5;
  EDString **p_mUniqueName;
  EDString *mUniqueName;
  EDString *v8;

  v5 = (EDString *)a3;
  mUniqueName = self->mUniqueName;
  p_mUniqueName = &self->mUniqueName;
  if (mUniqueName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mUniqueName, a3);
    v5 = v8;
  }

}

- (id)totalsRowLabel
{
  return self->mTotalsRowLabel;
}

- (void)setTotalsRowLabel:(id)a3
{
  EDString *v5;
  EDString **p_mTotalsRowLabel;
  EDString *mTotalsRowLabel;
  EDString *v8;

  v5 = (EDString *)a3;
  mTotalsRowLabel = self->mTotalsRowLabel;
  p_mTotalsRowLabel = &self->mTotalsRowLabel;
  if (mTotalsRowLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTotalsRowLabel, a3);
    v5 = v8;
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTableColumn;
  -[EDTableColumn description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTotalsRowLabel, 0);
  objc_storeStrong((id *)&self->mUniqueName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)headerRowDxfIndex
{
  return self->mHeaderRowDxfIndex;
}

- (void)setHeaderRowDxfIndex:(unint64_t)a3
{
  self->mHeaderRowDxfIndex = a3;
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

@end
