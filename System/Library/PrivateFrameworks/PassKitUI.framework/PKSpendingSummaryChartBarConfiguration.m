@implementation PKSpendingSummaryChartBarConfiguration

- (PKSpendingSummaryChartBarConfiguration)initWithSummary:(id)a3
{
  id v5;
  PKSpendingSummaryChartBarConfiguration *v6;
  PKSpendingSummaryChartBarConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSummaryChartBarConfiguration;
  v6 = -[PKSpendingSummaryChartBarConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    -[PKSpendingSummaryChartBarConfiguration _configureWithSummary:](v7, "_configureWithSummary:", v5);
  }

  return v7;
}

- (void)_configureWithSummary:(id)a3
{
  NSArray *v4;
  NSArray *orderedCategories;
  id v6;

  objc_msgSend(a3, "orderedSpendingCategories");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_171);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedCategories = self->_orderedCategories;
  self->_orderedCategories = v4;

}

uint64_t __64__PKSpendingSummaryChartBarConfiguration__configureWithSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = objc_msgSend(a2, "merchantCategory") - 1;
  if (v5 > 6)
    v6 = -1;
  else
    v6 = qword_19DF17300[v5];
  v7 = objc_msgSend(v4, "merchantCategory");

  if ((unint64_t)(v7 - 1) > 6)
    v8 = -1;
  else
    v8 = qword_19DF17300[v7 - 1];
  v9 = v6 >= v8;
  v10 = v6 > v8;
  if (v9)
    return v10;
  else
    return -1;
}

- (BOOL)isReady
{
  return -[PKSpendingSummary isLoading](self->_summary, "isLoading") ^ 1;
}

- (int64_t)numberOfSegments
{
  return -[NSArray count](self->_orderedCategories, "count");
}

- (double)totalValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PKSpendingSummary totalSpending](self->_summary, "totalSpending");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)valueForSegmentAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  -[PKSpendingSummaryChartBarConfiguration _categoryAtIndex:](self, "_categoryAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v6 = 0.0;
  if (v7 >= 0.0)
  {
    objc_msgSend(v3, "totalAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v6 = v10;

  }
  return v6;
}

- (id)colorForSegmentAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PKSpendingSummaryChartBarConfiguration _categoryAtIndex:](self, "_categoryAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKBrightColorForMerchantCategory(objc_msgSend(v3, "merchantCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_categoryAtIndex:(int64_t)a3
{
  void *v5;

  if (-[PKSpendingSummaryChartBarConfiguration numberOfSegments](self, "numberOfSegments") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_orderedCategories, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (PKSpendingSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_orderedCategories, 0);
}

@end
