@implementation REMLElementComparator

- (REMLElementComparator)initWithModel:(id)a3
{
  id v5;
  REMLElementComparator *v6;
  REMLElementComparator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLElementComparator;
  v6 = -[REMLElementComparator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingRules, 0);
  objc_storeStrong((id *)&self->_filteringRules, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (id)model
{
  return self->_model;
}

+ (REMLElementComparator)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  return (REMLElementComparator *)+[_RERuleMLElementComparator comparatorWithFilteringRules:rankingRules:model:](_RERuleMLElementComparator, "comparatorWithFilteringRules:rankingRules:model:", a3, a4, a5);
}

- (BOOL)shouldHideElement:(id)a3
{
  return 0;
}

- (unint64_t)comparisonLevels
{
  return 1;
}

- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  if (v9 == 1)
    v10 = 1;
  else
    v10 = -1;
  if (v9)
    return v10;
  else
    return 0;
}

- (NSArray)filteringRules
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (NSArray)rankingRules
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithModel:", self->_model);
}

- (void)setFilteringRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRankingRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
