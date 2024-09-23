@implementation _PXStoryPPTMeasureInfo

- (_PXStoryPPTMeasureInfo)init
{
  return -[_PXStoryPPTMeasureInfo initWithMetric:](self, "initWithMetric:", 0);
}

- (_PXStoryPPTMeasureInfo)initWithMetric:(int64_t)a3
{
  _PXStoryPPTMeasureInfo *v4;
  _PXStoryPPTMeasureInfo *v5;
  PXStatsCalculator *v6;
  PXStatsCalculator *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PXStoryPPTMeasureInfo;
  v4 = -[_PXStoryPPTMeasureInfo init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_metric = a3;
    v6 = objc_alloc_init(PXStatsCalculator);
    statistics = v5->_statistics;
    v5->_statistics = v6;

  }
  return v5;
}

- (int64_t)metric
{
  return self->_metric;
}

- (PXStatsCalculator)statistics
{
  return self->_statistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
