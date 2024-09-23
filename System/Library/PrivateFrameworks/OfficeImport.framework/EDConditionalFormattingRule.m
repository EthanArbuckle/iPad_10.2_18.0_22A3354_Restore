@implementation EDConditionalFormattingRule

- (EDConditionalFormattingRule)initWithResources:(id)a3
{
  id v4;
  EDConditionalFormattingRule *v5;
  EDConditionalFormattingRule *v6;
  NSMutableArray *v7;
  NSMutableArray *mFormulas;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDConditionalFormattingRule;
  v5 = -[EDConditionalFormattingRule init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFormulas = v6->mFormulas;
    v6->mFormulas = v7;

    *(_QWORD *)&v6->mType = 0;
    *(_WORD *)&v6->mStopIfTrue = 0;
    v6->mPriority = 1;
    v6->mDifferentialStyleIndex = -1;
    *(_DWORD *)&v6->mAboveAverage = 1;
    v6->mTimePeriod = 0;
    v6->mRank = 0;
    v6->mStdDev = 0;
  }

  return v6;
}

- (void)setStopIfTrue:(BOOL)a3
{
  self->mStopIfTrue = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setOperatorEnum:(int)a3
{
  self->mOperator = a3;
}

- (void)addFormula:(id)a3 worksheet:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    -[NSMutableArray addObject:](self->mFormulas, "addObject:");
    objc_msgSend(v6, "processors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markObject:processor:", v8, objc_opt_class());

  }
}

- (void)setDifferentialStyle:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->mDifferentialStyleIndex = objc_msgSend(v5, "addObject:", v6);
}

+ (id)conditionalFormattingRuleWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (int64_t)compareToOtherRuleUsingPriority:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t mPriority;
  BOOL v7;
  _BOOL8 v8;
  int64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "priority");
    mPriority = self->mPriority;
    v7 = mPriority < v5;
    v8 = mPriority > v5;
    if (v7)
      v9 = -1;
    else
      v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)type
{
  return self->mType;
}

- (int)operatorEnum
{
  return self->mOperator;
}

- (unint64_t)formulaCount
{
  return -[NSMutableArray count](self->mFormulas, "count");
}

- (id)formulaAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDConditionalFormattingRule formulaCount](self, "formulaCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mFormulas, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)differentialStyle
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "differentialStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mDifferentialStyleIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)stopIfTrue
{
  return self->mStopIfTrue;
}

- (int64_t)priority
{
  return self->mPriority;
}

- (void)setPriority:(int64_t)a3
{
  self->mPriority = a3;
}

- (BOOL)aboveAverage
{
  return self->mAboveAverage;
}

- (void)setAboveAverage:(BOOL)a3
{
  self->mAboveAverage = a3;
}

- (BOOL)bottom
{
  return self->mBottom;
}

- (void)setBottom:(BOOL)a3
{
  self->mBottom = a3;
}

- (BOOL)equalAverage
{
  return self->mEqualAverage;
}

- (void)setEqualAverage:(BOOL)a3
{
  self->mEqualAverage = a3;
}

- (BOOL)percent
{
  return self->mPercent;
}

- (void)setPercent:(BOOL)a3
{
  self->mPercent = a3;
}

- (unint64_t)rank
{
  return self->mRank;
}

- (void)setRank:(unint64_t)a3
{
  self->mRank = a3;
}

- (int64_t)stdDev
{
  return self->mStdDev;
}

- (void)setStdDev:(int64_t)a3
{
  self->mStdDev = a3;
}

- (id)text
{
  return self->mText;
}

- (void)setText:(id)a3
{
  NSString *v5;
  NSString **p_mText;
  NSString *mText;
  NSString *v8;

  v5 = (NSString *)a3;
  mText = self->mText;
  p_mText = &self->mText;
  if (mText != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mText, a3);
    v5 = v8;
  }

}

- (int)timePeriod
{
  return self->mTimePeriod;
}

- (void)setTimePeriod:(int)a3
{
  self->mTimePeriod = a3;
}

- (BOOL)appliesToDateOnly
{
  return self->mAppliesToDateOnly;
}

- (void)setAppliesToDateOnly:(BOOL)a3
{
  self->mAppliesToDateOnly = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDConditionalFormattingRule;
  -[EDConditionalFormattingRule description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)differentialStyleIndex
{
  return self->mDifferentialStyleIndex;
}

- (void)setDifferentialStyleIndex:(unint64_t)a3
{
  self->mDifferentialStyleIndex = a3;
}

@end
