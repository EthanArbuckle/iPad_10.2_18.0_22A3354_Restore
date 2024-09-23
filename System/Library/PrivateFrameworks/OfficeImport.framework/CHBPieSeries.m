@implementation CHBPieSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDPieSeries *v4;
  void *v5;
  CHDPieSeries *v6;
  uint64_t v7;

  v3 = a3;
  v4 = [CHDPieSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDSeries initWithChart:](v4, "initWithChart:", v5);

  v7 = *(_QWORD *)(objc_msgSend(v3, "xlCurrentPlot") + 24);
  if (v7)
    -[CHDPieSeries setExplosion:](v6, "setExplosion:", *(unsigned __int16 *)(v7 + 68));

  return v6;
}

@end
