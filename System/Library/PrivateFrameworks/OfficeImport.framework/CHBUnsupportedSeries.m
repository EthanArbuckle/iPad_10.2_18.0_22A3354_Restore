@implementation CHBUnsupportedSeries

+ (id)chdSeriesWithState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "chart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDUnsupportedSeries, "seriesWithChart:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
