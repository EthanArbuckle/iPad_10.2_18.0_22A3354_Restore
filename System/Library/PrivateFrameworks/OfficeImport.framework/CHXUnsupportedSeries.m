@implementation CHXUnsupportedSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "chart", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDUnsupportedSeries, "seriesWithChart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
