@implementation PDParagraphBuild

- (PDParagraphBuild)init
{
  PDParagraphBuild *v2;
  NSMutableArray *v3;
  NSMutableArray *mTimeNodeDataList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDParagraphBuild;
  v2 = -[PDBuild init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mTimeNodeDataList = v2->mTimeNodeDataList;
    v2->mTimeNodeDataList = v3;

    v2->mType = 4;
  }
  return v2;
}

- (void)setAutoAdvanceTime:(double)a3
{
  self->mAutoAdvanceTime = a3;
}

- (void)setBuildLevel:(int)a3
{
  self->mBuildLevel = a3;
}

- (void)setIsReversedParagraphOrder:(BOOL)a3
{
  self->mIsReversedParagraphOrder = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (unint64_t)timeNodeDataListCount
{
  return -[NSMutableArray count](self->mTimeNodeDataList, "count");
}

- (id)timeNodeDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mTimeNodeDataList, "objectAtIndex:", a3);
}

- (id)addTimeNodeData
{
  PDTimeNode *v3;

  v3 = objc_alloc_init(PDTimeNode);
  -[NSMutableArray addObject:](self->mTimeNodeDataList, "addObject:", v3);
  return v3;
}

- (id)timeNodeDataList
{
  return self->mTimeNodeDataList;
}

- (double)autoAdvanceTime
{
  return self->mAutoAdvanceTime;
}

- (BOOL)isReversedParagraphOrder
{
  return self->mIsReversedParagraphOrder;
}

- (int)buildLevel
{
  return self->mBuildLevel;
}

- (int)type
{
  return self->mType;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double mAutoAdvanceTime;
  double v9;
  int mIsReversedParagraphOrder;
  int mBuildLevel;
  int mType;
  NSMutableArray *mTimeNodeDataList;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  char v17;
  BOOL v18;
  objc_super v20;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  mAutoAdvanceTime = self->mAutoAdvanceTime;
  objc_msgSend(v6, "autoAdvanceTime");
  if (mAutoAdvanceTime != v9)
    goto LABEL_10;
  mIsReversedParagraphOrder = self->mIsReversedParagraphOrder;
  if (mIsReversedParagraphOrder != objc_msgSend(v7, "isReversedParagraphOrder"))
    goto LABEL_10;
  mBuildLevel = self->mBuildLevel;
  if (mBuildLevel != objc_msgSend(v7, "buildLevel"))
    goto LABEL_10;
  mType = self->mType;
  if (mType != objc_msgSend(v7, "type"))
    goto LABEL_10;
  mTimeNodeDataList = self->mTimeNodeDataList;
  objc_msgSend(v7, "timeNodeDataList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mTimeNodeDataList) = (mTimeNodeDataList != 0) ^ (v14 == 0);

  if ((mTimeNodeDataList & 1) == 0)
    goto LABEL_10;
  v15 = self->mTimeNodeDataList;
  if (!v15
    || (objc_msgSend(v7, "timeNodeDataList"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = -[NSMutableArray isEqual:](v15, "isEqual:", v16),
        v16,
        (v17 & 1) != 0))
  {

    v20.receiver = self;
    v20.super_class = (Class)PDParagraphBuild;
    v18 = -[PDBuild isEqual:](&v20, sel_isEqual_, v4);
  }
  else
  {
LABEL_10:

    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = ((unint64_t)self->mAutoAdvanceTime << 8)
     + (-[NSMutableArray count](self->mTimeNodeDataList, "count") << 16);
  v4 = self->mType ^ self->mBuildLevel;
  v6.receiver = self;
  v6.super_class = (Class)PDParagraphBuild;
  return v3 + (-[PDBuild hash](&v6, sel_hash) ^ v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTimeNodeDataList, 0);
}

@end
