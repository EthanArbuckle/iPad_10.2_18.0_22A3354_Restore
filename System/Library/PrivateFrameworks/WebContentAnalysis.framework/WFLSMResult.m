@implementation WFLSMResult

+ (id)extractScoresFromLSMResults:(__LSMResult *)a3
{
  void *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  uint64_t Category;
  double v9;

  v4 = (void *)objc_opt_new();
  Count = LSMResultGetCount(a3);
  if (Count >= 1)
  {
    v6 = Count;
    for (i = 0; i != v6; ++i)
    {
      Category = LSMResultGetCategory(a3, i);
      *(float *)&v9 = LSMResultGetScore(a3, i);
      objc_msgSend(v4, "addObject:", +[WFCategoryJudgement categoryJudgementWithCategory:score:](WFCategoryJudgement, "categoryJudgementWithCategory:score:", Category, v9));
    }
  }
  return v4;
}

+ (id)LSMResultWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLSMResultRef:threshold:", a3, a4);
}

- (WFLSMResult)initWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4
{
  WFLSMResult *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  objc_super v10;

  if (!a3)
    return 0;
  v10.receiver = self;
  v10.super_class = (Class)WFLSMResult;
  v6 = -[WFLSMResult init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_msgSend((id)objc_opt_class(), "extractScoresFromLSMResults:", a3);
    v6->categoryJudgements = v7;
    -[NSMutableArray sortUsingSelector:](v7, "sortUsingSelector:", sel_compareByCategory_);
    v8 = v6->categoryJudgements;
    -[WFLSMResult setThreshold:](v6, "setThreshold:", a4);
  }
  return v6;
}

- (int64_t)numberOfCategories
{
  return -[NSMutableArray count](self->categoryJudgements, "count");
}

- (int64_t)bestMatchingCategory
{
  NSMutableArray *categoryJudgements;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  int64_t v7;
  uint64_t i;
  void *v9;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  categoryJudgements = self->categoryJudgements;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](categoryJudgements, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v3)
    return -1;
  v4 = v3;
  v5 = *(_QWORD *)v14;
  v6 = -1.0;
  v7 = -1;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(categoryJudgements);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      objc_msgSend(v9, "score");
      if (v10 > v6)
      {
        v11 = v10;
        v7 = objc_msgSend(v9, "category");
        v6 = v11;
      }
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](categoryJudgements, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v4);
  return v7;
}

- (float)scoreForCategory:(int64_t)a3
{
  float result;

  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->categoryJudgements, "objectAtIndex:", a3 - 1), "score");
  return result;
}

- (void)setScore:(float)a3 forCategory:(int64_t)a4
{
  void *v5;
  double v6;

  v5 = (void *)-[NSMutableArray objectAtIndex:](self->categoryJudgements, "objectAtIndex:", a4 - 1);
  *(float *)&v6 = a3;
  objc_msgSend(v5, "setScore:", v6);
}

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  float v8;
  double v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24C583DA8);
  v4 = -[WFLSMResult bestMatchingCategory](self, "bestMatchingCategory");
  v5 = -[WFLSMResult numberOfCategories](self, "numberOfCategories");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 1; i <= v6; ++i)
    {
      -[WFLSMResult scoreForCategory:](self, "scoreForCategory:", i);
      v9 = v8;
      if (v4 == i)
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[ %d:%.2f ]"), v4, *(_QWORD *)&v9);
      else
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d:%.2f"), i, *(_QWORD *)&v9);
      objc_msgSend(v3, "appendString:", v10);
      if (v6 != i)
        objc_msgSend(v3, "appendString:", CFSTR("    "));
    }
  }
  return v3;
}

- (BOOL)isRestricted
{
  int64_t v3;
  int64_t v4;
  float v5;
  float v6;
  float v7;

  v3 = -[WFLSMResult numberOfCategories](self, "numberOfCategories");
  v4 = -[WFLSMResult bestMatchingCategory](self, "bestMatchingCategory");
  -[WFLSMResult scoreForCategory:](self, "scoreForCategory:", v4);
  if (v4 != v3)
    return 0;
  v6 = v5;
  -[NSNumber floatValue](-[WFLSMResult threshold](self, "threshold"), "floatValue");
  return v6 > v7;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->categoryJudgements);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%d categoryJudgements:%@>"), objc_msgSend((id)objc_opt_class(), "description"), self, objc_msgSend(v3, "description"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFLSMResult;
  -[WFLSMResult dealloc](&v3, sel_dealloc);
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreshold:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end
