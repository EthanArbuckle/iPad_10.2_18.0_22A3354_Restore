@implementation OADCustomShapeGeometry

- (OADCustomShapeGeometry)init
{
  OADCustomShapeGeometry *v2;
  _QWORD *v3;
  _QWORD *v4;
  NSMutableArray *v5;
  NSMutableArray *mFormulas;
  NSMutableArray *v7;
  NSMutableArray *mTextBodyRects;
  NSMutableArray *v9;
  NSMutableArray *mPaths;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OADCustomShapeGeometry;
  v2 = -[OADShapeGeometry init](&v12, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v2->mGeometryCoordSpace = v3;
    v4 = (_QWORD *)operator new();
    *v4 = 0x8000000080000000;
    v2->mLimo = v4;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFormulas = v2->mFormulas;
    v2->mFormulas = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mTextBodyRects = v2->mTextBodyRects;
    v2->mTextBodyRects = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mPaths = v2->mPaths;
    v2->mPaths = v9;

  }
  return v2;
}

- (void)addPath:(id)a3
{
  -[NSMutableArray addObject:](self->mPaths, "addObject:", a3);
}

- (void)setGeometryCoordSpace:(CsRect<int>)a3
{
  _DWORD *mGeometryCoordSpace;

  mGeometryCoordSpace = self->mGeometryCoordSpace;
  *mGeometryCoordSpace = **(_DWORD **)a3.var0;
  mGeometryCoordSpace[1] = *(_DWORD *)(*(_QWORD *)a3.var0 + 4);
  mGeometryCoordSpace[2] = *(_DWORD *)(*(_QWORD *)a3.var0 + 8);
  mGeometryCoordSpace[3] = *(_DWORD *)(*(_QWORD *)a3.var0 + 12);
}

- (void)setLimo:(CsPoint<int>)a3
{
  _DWORD *mLimo;

  mLimo = self->mLimo;
  *mLimo = *(_DWORD *)a3.var0[0];
  mLimo[1] = *(_DWORD *)(*(_QWORD *)&a3 + 4);
}

- (unint64_t)textBodyRectCount
{
  return -[NSMutableArray count](self->mTextBodyRects, "count");
}

- (void)dealloc
{
  void *mGeometryCoordSpace;
  void *mLimo;
  objc_super v5;

  mGeometryCoordSpace = self->mGeometryCoordSpace;
  if (mGeometryCoordSpace)
    MEMORY[0x22E2DD408](mGeometryCoordSpace, 0x1000C40451B5BE8);
  mLimo = self->mLimo;
  if (mLimo)
    MEMORY[0x22E2DD408](mLimo, 0x1000C4000313F17);
  v5.receiver = self;
  v5.super_class = (Class)OADCustomShapeGeometry;
  -[OADCustomShapeGeometry dealloc](&v5, sel_dealloc);
}

- (void)addTextBodyRect:(id)a3
{
  -[NSMutableArray addObject:](self->mTextBodyRects, "addObject:", a3);
}

- (id)textBodyRectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mTextBodyRects, "objectAtIndex:", a3);
}

- (CsRect<int>)geometryCoordSpace
{
  _OWORD *v2;
  CsRect<int> result;

  *v2 = *(_OWORD *)self->mGeometryCoordSpace;
  *(_QWORD *)&result.var0[2] = a2;
  *(_QWORD *)result.var0 = self;
  return result;
}

- (unint64_t)pathCount
{
  return -[NSMutableArray count](self->mPaths, "count");
}

- (id)pathAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mPaths, "objectAtIndex:", a3);
}

- (void)addFormula:(id)a3
{
  -[NSMutableArray addObject:](self->mFormulas, "addObject:", a3);
}

- (unint64_t)formulaCount
{
  return -[NSMutableArray count](self->mFormulas, "count");
}

- (id)formulaAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mFormulas, "objectAtIndex:", a3);
}

- (int)type
{
  return 0;
}

- (CsPoint<int>)limo
{
  _QWORD *v2;

  *v2 = *(_QWORD *)self->mLimo;
  return (CsPoint<int>)self;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADCustomShapeGeometry;
  -[OADShapeGeometry description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPaths, 0);
  objc_storeStrong((id *)&self->mTextBodyRects, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
}

@end
