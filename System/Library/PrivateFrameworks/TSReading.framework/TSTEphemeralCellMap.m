@implementation TSTEphemeralCellMap

- (TSTEphemeralCellMap)init
{
  return -[TSTEphemeralCellMap initWithCapacity:](self, "initWithCapacity:", 1);
}

- (TSTEphemeralCellMap)initWithCapacity:(unint64_t)a3
{
  TSTEphemeralCellMap *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTEphemeralCellMap;
  v4 = -[TSTEphemeralCellMap init](&v6, sel_init);
  if (v4)
  {
    v4->mCells = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v4->mCellIDs = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    v4->mCapacity = a3;
    v4->mCount = 0;
    v4->mMayModifyValuesReferencedByFormulas = 1;
    v4->mAppliesToHidden = 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  unsigned int v4;
  objc_super v6;

  if (self->mCount)
  {
    v3 = 0;
    v4 = 1;
    do
    {

      v3 = v4;
    }
    while (self->mCount > v4++);
  }
  free(self->mCellIDs);
  free(self->mCells);
  self->mCellIDs = 0;
  self->mCells = 0;
  v6.receiver = self;
  v6.super_class = (Class)TSTEphemeralCellMap;
  -[TSTEphemeralCellMap dealloc](&v6, sel_dealloc);
}

- (unint64_t)count
{
  return self->mCount;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDs
{
  return self->mCellIDs;
}

- (BOOL)containsCellID:(id)a3
{
  unint64_t mCount;
  uint64_t v4;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 *mCellIDs;
  unsigned int v6;

  mCount = self->mCount;
  if (!mCount)
    return 0;
  v4 = 0;
  mCellIDs = self->mCellIDs;
  v6 = 1;
  while (mCellIDs[v4].var1 != a3.var1 || mCellIDs[v4].var0 != a3.var0)
  {
    v4 = v6;
    if (mCount <= v6++)
      return 0;
  }
  return 1;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDAtIndex:(unint64_t)a3
{
  if (-[TSTEphemeralCellMap count](self, "count") <= a3)
    return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)0xFFFFFF;
  else
    return self->mCellIDs[a3];
}

- (id)cellAtIndex:(unint64_t)a3
{
  if (-[TSTEphemeralCellMap count](self, "count") <= a3)
    return 0;
  else
    return self->mCells[a3];
}

- (void)addCell:(id)a3 andCellID:(id)a4
{
  unint64_t mCapacity;
  unint64_t mCount;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 *mCellIDs;
  void *v10;
  uint64_t v11;
  void *v12;

  mCapacity = self->mCapacity;
  if (mCapacity)
  {
    mCount = self->mCount;
    if (mCount == mCapacity)
    {
      self->mCapacity = 2 * mCapacity;
      self->mCells = (id *)malloc_type_realloc(self->mCells, 16 * mCapacity, 0x80040B8603338uLL);
      mCellIDs = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)malloc_type_realloc(self->mCellIDs, 4 * self->mCapacity, 0x100004052888210uLL);
      self->mCellIDs = mCellIDs;
      mCount = self->mCount;
    }
    else
    {
      mCellIDs = self->mCellIDs;
    }
    mCellIDs[mCount] = a4;
    if (a3)
      v12 = (void *)objc_msgSend(a3, "copy");
    else
      v12 = 0;
    self->mCells[self->mCount++] = v12;
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, *(_QWORD *)&a4.var0);
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTEphemeralCellMap addCell:andCellID:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEphemeralCellMap.m"), 101, CFSTR("0 capacity not permitted in nonempty TSTEphemeralCellMap"));
  }
}

- (void)popLastCell
{
  unint64_t mCount;
  unint64_t v3;

  mCount = self->mCount;
  if (mCount)
  {
    v3 = mCount - 1;
    self->mCount = v3;

  }
}

- (BOOL)mayModifyFormulasInCells
{
  return 1;
}

- (BOOL)mayModifyValuesReferencedByFormulas
{
  return self->mMayModifyValuesReferencedByFormulas;
}

- (void)setMayModifyValuesReferencedByFormulas:(BOOL)a3
{
  self->mMayModifyValuesReferencedByFormulas = a3;
}

- (BOOL)appliesToHidden
{
  return self->mAppliesToHidden;
}

- (void)setAppliesToHidden:(BOOL)a3
{
  self->mAppliesToHidden = a3;
}

@end
