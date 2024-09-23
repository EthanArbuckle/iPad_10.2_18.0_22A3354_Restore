@implementation EDBorders

+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 resources:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  objc_msgSend(a1, "bordersWithResources:", a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLeftBorder:", v14);
  objc_msgSend(v19, "setRightBorder:", v15);
  objc_msgSend(v19, "setTopBorder:", v16);
  objc_msgSend(v19, "setBottomBorder:", v17);
  objc_msgSend(v19, "setDiagonalBorder:", v18);

  return v19;
}

+ (id)bordersWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (EDBorders)initWithResources:(id)a3
{
  id v4;
  EDBorders *v5;
  EDBorders *v6;
  __int128 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDBorders;
  v5 = -[EDBorders init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_QWORD *)&v7 = -1;
    *((_QWORD *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mLeftBorderIndex = v7;
    *(_OWORD *)&v6->mTopBorderIndex = v7;
    *(_OWORD *)&v6->mDiagonalBorderIndex = v7;
    v6->mHorizontalBorderIndex = -1;
  }

  return v6;
}

- (void)setLeftBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mLeftBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (void)setRightBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mRightBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (void)setTopBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mTopBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (void)setBottomBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mBottomBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (void)setDiagonalBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mDiagonalBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (BOOL)isEqual:(id)a3
{
  EDBorders *v4;
  EDBorders *v5;
  BOOL v6;

  v4 = (EDBorders *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDBorders isEqualToBorders:](self, "isEqualToBorders:", v5);

  return v6;
}

- (BOOL)isEqualToBorders:(id)a3
{
  _OWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = *(_OWORD *)&self->mLeftBorderIndex == v4[1]
    && self->mTopBorderIndex == *((_QWORD *)v4 + 4)
    && self->mBottomBorderIndex == *((_QWORD *)v4 + 5)
    && self->mDiagonalBorderIndex == *((_QWORD *)v4 + 6)
    && self->mVerticalBorderIndex == *((_QWORD *)v4 + 7)
    && self->mHorizontalBorderIndex == *((_QWORD *)v4 + 8);

  return v5;
}

- (id)topBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mTopBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)leftBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mLeftBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bottomBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mBottomBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rightBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mRightBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 vertical:(id)a8 horizontal:(id)a9 resources:(id)a10
{
  id v16;
  id v17;
  void *v18;

  v16 = a8;
  v17 = a9;
  objc_msgSend(a1, "bordersWithLeft:right:top:bottom:diagonal:resources:", a3, a4, a5, a6, a7, a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVerticalBorder:", v16);
  objc_msgSend(v18, "setHorizontalBorder:", v17);

  return v18;
}

- (void)setVerticalBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mVerticalBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (void)setHorizontalBorder:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->mHorizontalBorderIndex = objc_msgSend(v5, "addOrEquivalentObject:", v6);

}

- (id)verticalBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mVerticalBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)diagonalBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mDiagonalBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)horizontalBorder
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", self->mHorizontalBorderIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  _QWORD *v6;
  _QWORD *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v6 = (_QWORD *)objc_msgSend(v4, "initWithResources:", WeakRetained);

  if (v6)
  {
    v6[2] = self->mLeftBorderIndex;
    v6[3] = self->mRightBorderIndex;
    v6[4] = self->mTopBorderIndex;
    v6[5] = self->mBottomBorderIndex;
    v6[6] = self->mDiagonalBorderIndex;
    v6[7] = self->mVerticalBorderIndex;
    v6[8] = self->mHorizontalBorderIndex;
    v7 = v6;
  }

  return v6;
}

- (unint64_t)hash
{
  return vaddvq_s64(vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->mLeftBorderIndex, (uint64x2_t)xmmword_22A4C1D70), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->mTopBorderIndex, (uint64x2_t)xmmword_22A4C1D60)))+ (self->mVerticalBorderIndex ^ self->mDiagonalBorderIndex ^ self->mHorizontalBorderIndex);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDBorders;
  -[EDBorders description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
}

@end
