@implementation PKRewardsSummaryChartBarConfiguration

- (PKRewardsSummaryChartBarConfiguration)initWithSummary:(id)a3
{
  id v5;
  PKRewardsSummaryChartBarConfiguration *v6;
  PKRewardsSummaryChartBarConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *tierAmounts;
  objc_super v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRewardsSummaryChartBarConfiguration;
  v6 = -[PKRewardsSummaryChartBarConfiguration init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    objc_msgSend(v5, "onePercentTotal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(v5, "twoPercentTotal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(v5, "threePercentTotal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v10;
    objc_msgSend(v5, "specialTotal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v12 = objc_claimAutoreleasedReturnValue();
    tierAmounts = v7->_tierAmounts;
    v7->_tierAmounts = (NSArray *)v12;

  }
  return v7;
}

- (BOOL)isReady
{
  return self->_summary != 0;
}

- (int64_t)numberOfSegments
{
  return -[NSArray count](self->_tierAmounts, "count");
}

- (double)totalValue
{
  void *v2;
  double v3;
  double v4;

  -[PKAccountRewardsTierSummary totalAmount](self->_summary, "totalAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)valueForSegmentAtIndex:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[PKRewardsSummaryChartBarConfiguration _valueAtIndex:](self, "_valueAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v4 = 0.0;
  if (v5 >= 0.0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v6;
  }

  return v4;
}

- (id)colorForSegmentAtIndex:(int64_t)a3
{
  return PKColorForRewardsTier(-[PKRewardsSummaryChartBarConfiguration _rewardsTierForIndex:](self, "_rewardsTierForIndex:", a3));
}

- (id)_valueAtIndex:(int64_t)a3
{
  void *v5;

  if (-[PKRewardsSummaryChartBarConfiguration numberOfSegments](self, "numberOfSegments") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_tierAmounts, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)_rewardsTierForIndex:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (PKAccountRewardsTierSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_tierAmounts, 0);
}

@end
