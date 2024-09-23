@implementation EDBorder

+ (id)borderWithType:(int)a3 colorReference:(id)a4 resources:(id)a5
{
  uint64_t v6;
  id v8;
  _QWORD *v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(a1, "borderWithType:resources:", v6, a5);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9[3];
  v9[3] = v8;

  return v9;
}

+ (id)borderWithType:(int)a3 resources:(id)a4
{
  id v5;
  _DWORD *v6;

  v5 = a4;
  v6 = (_DWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v5);
  v6[4] = a3;

  return v6;
}

- (EDBorder)initWithResources:(id)a3
{
  id v4;
  EDBorder *v5;
  EDBorder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDBorder;
  v5 = -[EDBorder init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mType = 0;
    v6->mDiagonalType = 0;
  }

  return v6;
}

+ (id)borderWithType:(int)a3 colorReference:(id)a4 diagonalType:(int)a5 resources:(id)a6
{
  _DWORD *v7;

  objc_msgSend(a1, "borderWithType:colorReference:resources:", *(_QWORD *)&a3, a4, a6);
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v7[8] = a5;
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  EDBorder *v4;
  EDBorder *v5;
  BOOL v6;

  v4 = (EDBorder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDBorder isEqualToBorder:](self, "isEqualToBorder:", v5);

  return v6;
}

- (BOOL)isEqualToBorder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  EDColorReference *mColorReference;
  char v7;

  v4 = a3;
  v5 = v4;
  if (self->mType == *((_DWORD *)v4 + 4) && self->mDiagonalType == *((_DWORD *)v4 + 8))
  {
    mColorReference = self->mColorReference;
    if (mColorReference == (EDColorReference *)v5[3])
      v7 = 1;
    else
      v7 = -[EDColorReference isEqual:](mColorReference, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)type
{
  return self->mType;
}

- (id)color
{
  return -[EDColorReference color](self->mColorReference, "color");
}

- (id)colorReference
{
  return self->mColorReference;
}

- (int)diagonalType
{
  return self->mDiagonalType;
}

+ (id)borderWithType:(int)a3 color:(id)a4 resources:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _QWORD *v10;
  EDColorReference *v11;
  void *v12;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "borderWithType:resources:", v6, v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = -[EDColorReference initWithColor:resources:]([EDColorReference alloc], "initWithColor:resources:", v8, v9);
  v12 = (void *)v10[3];
  v10[3] = v11;

  return v10;
}

+ (id)borderWithType:(int)a3 color:(id)a4 diagonalType:(int)a5 resources:(id)a6
{
  _DWORD *v7;

  objc_msgSend(a1, "borderWithType:color:resources:", *(_QWORD *)&a3, a4, a6);
  v7 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v7[8] = a5;
  return v7;
}

- (unint64_t)hash
{
  int v2;

  v2 = (self->mDiagonalType << 8) + (self->mType << 16);
  return -[EDColorReference hash](self->mColorReference, "hash") + v2;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDiagonalType:(int)a3
{
  self->mDiagonalType = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDBorder;
  -[EDBorder description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorReference, 0);
  objc_destroyWeak((id *)&self->mResources);
}

@end
