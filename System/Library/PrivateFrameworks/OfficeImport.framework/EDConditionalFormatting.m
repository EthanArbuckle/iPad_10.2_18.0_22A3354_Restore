@implementation EDConditionalFormatting

- (EDConditionalFormatting)init
{
  EDConditionalFormatting *v2;
  NSMutableArray *v3;
  NSMutableArray *mRules;
  EDReferenceCollection *v5;
  EDReferenceCollection *mRanges;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EDConditionalFormatting;
  v2 = -[EDConditionalFormatting init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mRules = v2->mRules;
    v2->mRules = v3;

    v5 = objc_alloc_init(EDReferenceCollection);
    mRanges = v2->mRanges;
    v2->mRanges = v5;

    v2->mApplyToDate = 0;
  }
  return v2;
}

- (void)addRange:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[EDReferenceCollection addObject:](self->mRanges, "addObject:", v4);

}

- (void)addRule:(id)a3
{
  id v4;
  int v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[NSMutableArray addObject:](self->mRules, "addObject:", v4);
    v5 = objc_msgSend(v6, "appliesToDateOnly");
    v4 = v6;
    if (v5)
      self->mApplyToDate = 1;
  }

}

+ (id)conditionalFormatting
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (unint64_t)ruleCount
{
  return -[NSMutableArray count](self->mRules, "count");
}

- (id)ruleAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDConditionalFormatting ruleCount](self, "ruleCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mRules, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)rules
{
  return self->mRules;
}

- (unint64_t)rangeCount
{
  return -[EDCollection count](self->mRanges, "count");
}

- (id)rangeAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDConditionalFormatting rangeCount](self, "rangeCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[EDCollection objectAtIndex:](self->mRanges, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isApplyToDate
{
  return self->mApplyToDate;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDConditionalFormatting;
  -[EDConditionalFormatting description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRanges, 0);
  objc_storeStrong((id *)&self->mRules, 0);
}

@end
