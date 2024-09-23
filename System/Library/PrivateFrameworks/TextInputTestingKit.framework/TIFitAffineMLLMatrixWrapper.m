@implementation TIFitAffineMLLMatrixWrapper

- (TIFitAffineMLLMatrixWrapper)init
{
  TIFitAffineMLLMatrixWrapper *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  v2 = -[TIFitAffineMLLMatrixWrapper init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)3);
    v2->_pMatrix = (void *)v3;
  }
  return v2;
}

- (void)dealloc
{
  _QWORD **pMatrix;
  objc_super v4;

  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  -[TIFitAffineMLLMatrixWrapper dealloc](&v4, sel_dealloc);
}

- (void)setMatrix:(void *)a3
{
  _QWORD **pMatrix;
  TIFitAffineMLLMatrix *v6;
  _QWORD **pScaleMatrix;
  void **p_pScaleMatrix;
  _QWORD **pRotationMatrix;
  _QWORD **pSkewMatrix;
  _QWORD **pTransMatrix;

  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  v6 = (TIFitAffineMLLMatrix *)operator new();
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(v6, (const TIFitAffineMLLMatrix *)a3);
  p_pScaleMatrix = &self->_pScaleMatrix;
  pScaleMatrix = (_QWORD **)self->_pScaleMatrix;
  self->_pMatrix = v6;
  if (pScaleMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pScaleMatrix[3]);
    MEMORY[0x2348A8A24](pScaleMatrix, 0x1020C40FAF5D19FLL);
  }
  pRotationMatrix = (_QWORD **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pRotationMatrix[3]);
    MEMORY[0x2348A8A24](pRotationMatrix, 0x1020C40FAF5D19FLL);
  }
  pSkewMatrix = (_QWORD **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pSkewMatrix[3]);
    MEMORY[0x2348A8A24](pSkewMatrix, 0x1020C40FAF5D19FLL);
  }
  pTransMatrix = (_QWORD **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pTransMatrix[3]);
    MEMORY[0x2348A8A24](pTransMatrix, 0x1020C40FAF5D19FLL);
  }
  *(_OWORD *)p_pScaleMatrix = 0u;
  *((_OWORD *)p_pScaleMatrix + 1) = 0u;
}

- (void)setXScale:(double)a3 yScale:(double)a4
{
  _QWORD **pMatrix;
  _QWORD **pScaleMatrix;
  void *v9;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatrix = 0;
  pScaleMatrix = (_QWORD **)self->_pScaleMatrix;
  if (pScaleMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pScaleMatrix[3]);
    MEMORY[0x2348A8A24](pScaleMatrix, 0x1020C40FAF5D19FLL);
  }
  v9 = (void *)operator new();
  *(double *)v10 = a3;
  v10[1] = 0;
  v10[2] = 0;
  *(double *)&v10[3] = a4;
  MEMORY[0x2348A8640](v9, 2, 2, v10, 4);
  self->_pScaleMatrix = v9;
}

- (void)setRotation:(double)a3
{
  _QWORD **pMatrix;
  _QWORD **pRotationMatrix;
  __double2 v7;
  void *v8;
  _QWORD v9[2];
  __double2 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatrix = 0;
  pRotationMatrix = (_QWORD **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pRotationMatrix[3]);
    MEMORY[0x2348A8A24](pRotationMatrix, 0x1020C40FAF5D19FLL);
  }
  v7 = __sincos_stret(a3);
  v8 = (void *)operator new();
  v9[0] = *(_QWORD *)&v7.__cosval;
  *(double *)&v9[1] = -v7.__sinval;
  v10 = v7;
  MEMORY[0x2348A8640](v8, 2, 2, v9, 4);
  self->_pRotationMatrix = v8;
}

- (void)setSkewRotation:(double)a3
{
  _QWORD **pMatrix;
  _QWORD **pSkewMatrix;
  void *v7;
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatrix = 0;
  pSkewMatrix = (_QWORD **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pSkewMatrix[3]);
    MEMORY[0x2348A8A24](pSkewMatrix, 0x1020C40FAF5D19FLL);
  }
  v7 = (void *)operator new();
  v8[0] = 0x3FF0000000000000;
  *(double *)&v8[1] = a3 / 0.785398163;
  v9 = xmmword_22FAC90C0;
  MEMORY[0x2348A8640](v7, 2, 2, v8, 4);
  self->_pSkewMatrix = v7;
}

- (void)setXTrans:(double)a3 yTrans:(double)a4
{
  _QWORD **pMatrix;
  _QWORD **pTransMatrix;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  pMatrix = (_QWORD **)self->_pMatrix;
  if (pMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pMatrix[3]);
    MEMORY[0x2348A8A24](pMatrix, 0x1020C40FAF5D19FLL);
  }
  self->_pMatrix = 0;
  pTransMatrix = (_QWORD **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(pTransMatrix[3]);
    MEMORY[0x2348A8A24](pTransMatrix, 0x1020C40FAF5D19FLL);
  }
  v9 = (void *)operator new();
  *(double *)v10 = a3;
  *(double *)&v10[1] = a4;
  MEMORY[0x2348A8640](v9, 2, 1, v10, 2);
  self->_pTransMatrix = v9;
}

- (void)calcMatrix
{
  const TIFitAffineMLLMatrix *pScaleMatrix;
  const TIFitAffineMLLMatrix *pRotationMatrix;
  const TIFitAffineMLLMatrix *pSkewMatrix;
  const TIFitAffineMLLMatrix *pTransMatrix;
  void *v7;
  _QWORD *v8;
  _BYTE v9[24];
  _QWORD *v10;
  _BYTE v11[24];
  _QWORD *v12;
  _BYTE v13[24];
  _QWORD *v14;
  _BYTE v15[24];
  _QWORD *v16;
  _BYTE v17[24];
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  if (!self->_pMatrix)
  {
    pScaleMatrix = (const TIFitAffineMLLMatrix *)self->_pScaleMatrix;
    if (pScaleMatrix)
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v17, pScaleMatrix);
    else
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    pRotationMatrix = (const TIFitAffineMLLMatrix *)self->_pRotationMatrix;
    if (pRotationMatrix)
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v15, pRotationMatrix);
    else
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    pSkewMatrix = (const TIFitAffineMLLMatrix *)self->_pSkewMatrix;
    if (pSkewMatrix)
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v13, pSkewMatrix);
    else
      TIFitAffineMLLMatrix::identity((TIFitAffineMLLMatrix *)2);
    pTransMatrix = (const TIFitAffineMLLMatrix *)self->_pTransMatrix;
    if (pTransMatrix)
    {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v11, pTransMatrix);
    }
    else
    {
      v21[0] = 0;
      v21[1] = 0;
      MEMORY[0x2348A8640](v11, 2, 1, v21, 2);
    }
    TIFitAffineMLLMatrix::operator*();
    TIFitAffineMLLMatrix::operator*();
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v10);
    v7 = (void *)operator new();
    TIFitAffineMLLMatrix::transform((TIFitAffineMLLMatrix *)v21);
    v19 = *(_QWORD *)MEMORY[0x2348A864C](v11, 0, 0);
    v20 = *(_QWORD *)MEMORY[0x2348A864C](v11, 1, 0);
    TIFitAffineMLLMatrix::addRow();
    TIFitAffineMLLMatrix::transform((TIFitAffineMLLMatrix *)v9);
    self->_pMatrix = v7;
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v10);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v8);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy((_QWORD *)v21[3]);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v12);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v14);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v16);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v18);
  }
}

- (CGPoint)transformedPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD *v9[5];
  _BYTE v10[24];
  _QWORD *v11;
  _QWORD v12[4];
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v12[3] = *MEMORY[0x24BDAC8D0];
  -[TIFitAffineMLLMatrixWrapper calcMatrix](self, "calcMatrix");
  *(CGFloat *)v12 = x;
  *(CGFloat *)&v12[1] = y;
  v12[2] = 0x3FF0000000000000;
  MEMORY[0x2348A8640](v9, 3, 1, v12, 3);
  TIFitAffineMLLMatrix::operator*();
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v9[3]);
  v5 = *(double *)MEMORY[0x2348A864C](v10, 0, 0);
  v6 = *(double *)MEMORY[0x2348A864C](v10, 1, 0);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(v11);
  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
