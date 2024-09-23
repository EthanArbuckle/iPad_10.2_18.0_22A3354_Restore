@implementation EDChartSheet

- (void)setBounds:(CGRect)a3
{
  self->mIsBoundsSet = 1;
  self->mBounds = a3;
}

- (void)setMainChart:(id)a3
{
  CHDChart *v5;
  CHDChart *mMainChart;
  CHDChart *v7;

  v5 = (CHDChart *)a3;
  mMainChart = self->mMainChart;
  v7 = v5;
  if (mMainChart != v5)
  {
    -[CHDChart setSheet:](mMainChart, "setSheet:", 0);
    objc_storeStrong((id *)&self->mMainChart, a3);
    -[CHDChart setSheet:](self->mMainChart, "setSheet:", self);
  }

}

- (BOOL)areBoundsSet
{
  return self->mIsBoundsSet;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)mainChart
{
  return self->mMainChart;
}

- (void)addDrawable:(id)a3
{
  id v4;
  CHDChart *mMainChart;
  objc_super v6;

  v4 = a3;
  mMainChart = self->mMainChart;
  if (mMainChart)
  {
    -[CHDChart addChild:](mMainChart, "addChild:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EDChartSheet setMainChart:](self, "setMainChart:", v4);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)EDChartSheet;
      -[EDSheet addDrawable:](&v6, sel_addDrawable_, v4);
    }
  }

}

- (void)teardown
{
  CHDChart *mMainChart;
  objc_super v4;

  -[CHDChart setSheet:](self->mMainChart, "setSheet:", 0);
  mMainChart = self->mMainChart;
  self->mMainChart = 0;

  v4.receiver = self;
  v4.super_class = (Class)EDChartSheet;
  -[EDSheet teardown](&v4, sel_teardown);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMainChart, 0);
}

@end
