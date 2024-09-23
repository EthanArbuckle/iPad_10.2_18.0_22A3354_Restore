@implementation ODIHNodeInfo

- (ODIHNodeInfo)init
{
  ODIHNodeInfo *v2;
  ODIHNodeInfo *v3;
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODIHNodeInfo;
  v2 = -[ODIHNodeInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->mTreeDepth = -1;
    v2->mExtraRowsBetweenParentAndSelf = 0;
    v2->mXRange = 0;
    v2->mConnectToVerticalSide = 0;
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    v3->mXRanges = v4;
  }
  return v3;
}

- (void)dealloc
{
  void **mXRanges;
  void *v4;
  objc_super v5;

  mXRanges = (void **)self->mXRanges;
  if (mXRanges)
  {
    v4 = *mXRanges;
    if (*mXRanges)
    {
      mXRanges[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x22E2DD408](mXRanges, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)ODIHNodeInfo;
  -[ODIHNodeInfo dealloc](&v5, sel_dealloc);
}

- (ODIHRange)xRange
{
  float mMid;
  float mLength;
  ODIHRange result;

  mMid = self->mXRange.mMid;
  mLength = self->mXRange.mLength;
  result.mLength = mLength;
  result.mMid = mMid;
  return result;
}

- (void)setXRange:(ODIHRange)a3
{
  self->mXRange = a3;
}

- (int)treeDepth
{
  return self->mTreeDepth;
}

- (void)setTreeDepth:(int)a3
{
  self->mTreeDepth = a3;
}

- (int)row
{
  return self->mRow;
}

- (void)setRow:(int)a3
{
  self->mRow = a3;
}

- (BOOL)connectToVerticalSide
{
  return self->mConnectToVerticalSide;
}

- (void)setConnectToVerticalSide:(BOOL)a3
{
  self->mConnectToVerticalSide = a3;
}

- (int)extraRowsBetweenParentAndSelf
{
  return self->mExtraRowsBetweenParentAndSelf;
}

- (void)setExtraRowsBetweenParentAndSelf:(int)a3
{
  self->mExtraRowsBetweenParentAndSelf = a3;
}

- (float)xOffsetRelativeToParent
{
  return self->mXOffsetRelativeToParent;
}

- (void)setXOffsetRelativeToParent:(float)a3
{
  self->mXOffsetRelativeToParent = a3;
}

- (void)addToXOffsetRelativeToParent:(float)a3
{
  self->mXOffsetRelativeToParent = self->mXOffsetRelativeToParent + a3;
}

- (void)xRanges
{
  return self->mXRanges;
}

@end
