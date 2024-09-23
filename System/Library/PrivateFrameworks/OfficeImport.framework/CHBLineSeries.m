@implementation CHBLineSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDLineSeries *v4;
  void *v5;
  CHDLineSeries *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = [CHDLineSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDLineSeries initWithChart:](v4, "initWithChart:", v5);

  v7 = objc_msgSend(v3, "xlCurrentDefaultSeriesFormat");
  v8 = v7;
  if (v7 && (v9 = v7, *(_QWORD *)(v7 + 8)) || (v9 = *(_QWORD *)(objc_msgSend(v3, "xlCurrentPlot") + 24), v8))
    -[CHDLineSeries setSmooth:](v6, "setSmooth:", *(unsigned __int8 *)(v8 + 88));
  +[CHBMarker readFrom:state:](CHBMarker, "readFrom:state:", v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHDLineSeries setMarker:](v6, "setMarker:", v10);

  return v6;
}

@end
