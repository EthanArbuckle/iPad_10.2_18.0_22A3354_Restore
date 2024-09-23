@implementation EQKitLayoutElementaryStackLineRow

- (EQKitLayoutElementaryStackLineRow)initWithLength:(unint64_t)a3 thickness:(double)a4 position:(int64_t)a5 followingSpace:(double)a6
{
  EQKitLayoutElementaryStackLineRow *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EQKitLayoutElementaryStackLineRow;
  result = -[EQKitLayoutElementaryStackLineRow init](&v11, sel_init);
  if (result)
  {
    result->mLength = a3;
    result->mThickness = a4;
    result->mFollowingSpace = a6;
    if (a3)
      result->mAlignmentShift -= a5 + a3;
  }
  return result;
}

- (BOOL)spansStack
{
  return self->mLength == 0;
}

- (id)newBoxWithStackWidth:(double)a3 columnWidthIter:(__wrap_iter<double *>)a4 iterMax:(__wrap_iter<double *>)a5 previousRow:(id)a6 layoutManager:(const void *)a7
{
  unint64_t mLength;
  uint64_t v9;
  float v10;
  double v11;

  mLength = self->mLength;
  if (mLength)
  {
    v9 = 8 * mLength;
    v10 = 0.0;
    do
    {
      v11 = *a4.var0;
      a4.var0 += 8;
      v10 = v11 + v10;
      v9 -= 8;
    }
    while (v9);
    a3 = v10;
  }
  return -[EQKitRule initWithHeight:depth:width:cgColor:]([EQKitRule alloc], "initWithHeight:depth:width:cgColor:", *(_QWORD *)(EQKitLayoutManager::layoutContext((EQKitLayoutManager *)a7) + 96), 0.0, self->mThickness, a3);
}

- (int64_t)alignmentShift
{
  return self->mAlignmentShift;
}

- (unint64_t)firstColumnIndex
{
  return self->mFirstColumnIndex;
}

- (void)setFirstColumnIndex:(unint64_t)a3
{
  self->mFirstColumnIndex = a3;
}

- (unint64_t)columnCount
{
  return self->mLength;
}

- (double)followingSpace
{
  return self->mFollowingSpace;
}

@end
