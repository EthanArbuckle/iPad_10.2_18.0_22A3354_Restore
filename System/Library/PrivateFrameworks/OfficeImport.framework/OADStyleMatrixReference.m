@implementation OADStyleMatrixReference

- (void)setMatrixIndex:(unint64_t)a3
{
  self->mMatrixIndex = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (unint64_t)matrixIndex
{
  return self->mMatrixIndex;
}

- (id)color
{
  return self->mColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[1] = self->mMatrixIndex;
  v6 = -[OADColor copyWithZone:](self->mColor, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (OADStyleMatrixReference)initWithMatrixIndex:(unint64_t)a3 color:(id)a4
{
  id v7;
  OADStyleMatrixReference *v8;
  OADStyleMatrixReference *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OADStyleMatrixReference;
  v8 = -[OADStyleMatrixReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mMatrixIndex = a3;
    objc_storeStrong((id *)&v8->mColor, a4);
  }

  return v9;
}

+ (OADStyleMatrixReference)styleMatrixReferenceWithMatrixIndex:(unint64_t)a3 color:(id)a4
{
  id v5;
  OADStyleMatrixReference *v6;

  v5 = a4;
  v6 = -[OADStyleMatrixReference initWithMatrixIndex:color:]([OADStyleMatrixReference alloc], "initWithMatrixIndex:color:", a3, v5);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  +[OITSUDescription descriptionWithObject:class:](OITSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:format:", CFSTR("MatrixIndex"), CFSTR("%ld"), self->mMatrixIndex);
  -[OADColor description](self->mColor, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("Color"), v4);

  objc_msgSend(v3, "descriptionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
