@implementation EPBorder

- (EPBorder)initWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5
{
  id v8;
  id v9;
  EPBorder *v10;
  uint64_t v11;
  EDColorReference *mColorReference;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EPBorder;
  v10 = -[EDBorder initWithResources:](&v14, sel_initWithResources_, v9);
  if (v10)
  {
    v10->super.mType = objc_msgSend(v8, "type");
    objc_msgSend(v8, "colorReference");
    v11 = objc_claimAutoreleasedReturnValue();
    mColorReference = v10->super.mColorReference;
    v10->super.mColorReference = (EDColorReference *)v11;

    v10->super.mDiagonalType = objc_msgSend(v8, "diagonalType");
    v10->mPrecedence = a4;
  }

  return v10;
}

- (unint64_t)precedence
{
  return self->mPrecedence;
}

- (BOOL)isEqualToBorder:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->mPrecedence != v4[5])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EPBorder;
    v5 = -[EDBorder isEqualToBorder:](&v7, sel_isEqualToBorder_, v4);
  }

  return v5;
}

+ (id)borderWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBorder:precedence:resources:", v8, a4, v9);

  return v10;
}

@end
