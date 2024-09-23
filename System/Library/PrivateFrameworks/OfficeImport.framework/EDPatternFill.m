@implementation EDPatternFill

- (EDPatternFill)initWithResources:(id)a3
{
  EDPatternFill *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EDPatternFill;
  result = -[EDFill initWithResources:](&v4, sel_initWithResources_, a3);
  if (result)
    result->mType = 0;
  return result;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setForeColorReference:(id)a3
{
  EDColorReference *v5;
  EDColorReference *v6;

  v5 = (EDColorReference *)a3;
  if (self->mForeColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mForeColorReference, a3);
    v5 = v6;
  }

}

- (void)setBackColorReference:(id)a3
{
  EDColorReference *v5;
  EDColorReference *v6;

  v5 = (EDColorReference *)a3;
  if (self->mBackColorReference != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mBackColorReference, a3);
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  EDPatternFill *v4;
  EDPatternFill *v5;
  BOOL v6;

  v4 = (EDPatternFill *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDPatternFill isEqualToPatternFill:](self, "isEqualToPatternFill:", v5);

  return v6;
}

- (BOOL)isEqualToPatternFill:(id)a3
{
  EDColorReference **v4;
  EDColorReference *mForeColorReference;
  EDColorReference *mBackColorReference;
  BOOL v7;

  v4 = (EDColorReference **)a3;
  mForeColorReference = self->mForeColorReference;
  v7 = (mForeColorReference == v4[4] || -[EDColorReference isEqual:](mForeColorReference, "isEqual:"))
    && ((mBackColorReference = self->mBackColorReference, mBackColorReference == v4[3])
     || -[EDColorReference isEqual:](mBackColorReference, "isEqual:"))
    && self->mType == *((_DWORD *)v4 + 4);

  return v7;
}

- (int)type
{
  return self->mType;
}

- (id)foreColor
{
  return -[EDColorReference color](self->mForeColorReference, "color");
}

- (id)backColor
{
  return -[EDColorReference color](self->mBackColorReference, "color");
}

+ (id)patternFillWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:foreColorReference:backColorReference:resources:", v8, v10, v11, v12);

  return v13;
}

- (EDPatternFill)initWithType:(int)a3 foreColorReference:(id)a4 backColorReference:(id)a5 resources:(id)a6
{
  id v10;
  id v11;
  id v12;
  EDPatternFill *v13;
  EDPatternFill *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[EDPatternFill initWithResources:](self, "initWithResources:", v12);
  v14 = v13;
  if (v13)
  {
    v13->mType = a3;
    -[EDPatternFill setBackColorReference:](v13, "setBackColorReference:", v11);
    -[EDPatternFill setForeColorReference:](v14, "setForeColorReference:", v10);
  }

  return v14;
}

- (EDPatternFill)initWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6
{
  id v10;
  id v11;
  id v12;
  EDPatternFill *v13;
  EDPatternFill *v14;
  EDColorReference *v15;
  id WeakRetained;
  uint64_t v17;
  EDColorReference *mBackColorReference;
  EDColorReference *v19;
  id v20;
  uint64_t v21;
  EDColorReference *mForeColorReference;
  objc_super v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EDPatternFill;
  v13 = -[EDFill initWithResources:](&v24, sel_initWithResources_, v12);
  v14 = v13;
  if (v13)
  {
    v13->mType = a3;
    v15 = [EDColorReference alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v14->super.mResources);
    v17 = -[EDColorReference initWithColor:resources:](v15, "initWithColor:resources:", v11, WeakRetained);
    mBackColorReference = v14->mBackColorReference;
    v14->mBackColorReference = (EDColorReference *)v17;

    v19 = [EDColorReference alloc];
    v20 = objc_loadWeakRetained((id *)&v14->super.mResources);
    v21 = -[EDColorReference initWithColor:resources:](v19, "initWithColor:resources:", v10, v20);
    mForeColorReference = v14->mForeColorReference;
    v14->mForeColorReference = (EDColorReference *)v21;

  }
  return v14;
}

- (void)setForeColor:(id)a3
{
  EDColorReference *v4;
  id WeakRetained;
  EDColorReference *v6;
  EDColorReference *mForeColorReference;
  id v8;

  v8 = a3;
  v4 = [EDColorReference alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  v6 = -[EDColorReference initWithColor:resources:](v4, "initWithColor:resources:", v8, WeakRetained);
  mForeColorReference = self->mForeColorReference;
  self->mForeColorReference = v6;

}

- (void)setBackColor:(id)a3
{
  EDColorReference *v4;
  id WeakRetained;
  EDColorReference *v6;
  EDColorReference *mBackColorReference;
  id v8;

  v8 = a3;
  v4 = [EDColorReference alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  v6 = -[EDColorReference initWithColor:resources:](v4, "initWithColor:resources:", v8, WeakRetained);
  mBackColorReference = self->mBackColorReference;
  self->mBackColorReference = v6;

}

+ (id)patternFillWithType:(int)a3 resources:(id)a4
{
  _DWORD *v5;

  objc_msgSend(a1, "fillWithResources:", a4);
  v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v5[4] = a3;
  return v5;
}

+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 resources:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(a1, "patternFillWithType:resources:", v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForeColor:", v8);

  return v9;
}

+ (id)patternFillWithType:(int)a3 foreColor:(id)a4 backColor:(id)a5 resources:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  objc_msgSend(a1, "patternFillWithType:foreColor:resources:", v8, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackColor:", v10);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EDPatternFill;
  v4 = -[EDFill copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[EDColorReference copy](self->mBackColorReference, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[EDColorReference copy](self->mForeColorReference, "copy");
  v8 = (void *)v4[4];
  v4[4] = v7;

  return v4;
}

- (unint64_t)hash
{
  int v3;
  unint64_t v4;

  v3 = self->mType << 16;
  v4 = (-[EDColorReference hash](self->mBackColorReference, "hash") << 8) + v3;
  return v4 + -[EDColorReference hash](self->mForeColorReference, "hash");
}

- (BOOL)isEmpty
{
  return self->mType == 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPatternFill;
  -[EDFill description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mForeColorReference, 0);
  objc_storeStrong((id *)&self->mBackColorReference, 0);
}

- (id)foreColorReference
{
  return self->mForeColorReference;
}

- (id)backColorReference
{
  return self->mBackColorReference;
}

@end
