@implementation CHBScatterSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDScatterSeries *v4;
  void *v5;
  CHDScatterSeries *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  char v10;
  void *v11;

  v3 = a3;
  v4 = [CHDScatterSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDLineSeries initWithChart:](v4, "initWithChart:", v5);

  v7 = objc_msgSend(v3, "xlCurrentDefaultSeriesFormat");
  v8 = v7;
  if (v7)
  {
    v9 = *(_BYTE *)(v7 + 88) != 0;
    if (*(_QWORD *)(v7 + 8))
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
  }
  v8 = *(_QWORD *)(objc_msgSend(v3, "xlCurrentPlot") + 24);
  if (v8)
    v10 = v9;
  else
    v10 = 1;
  if ((v10 & 1) == 0)
    v9 = *(_BYTE *)(v8 + 88) != 0;
LABEL_10:
  -[CHDLineSeries setSmooth:](v6, "setSmooth:", v9);
  +[CHBMarker readFrom:state:](CHBMarker, "readFrom:state:", v8, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHDLineSeries setMarker:](v6, "setMarker:", v11);

  return v6;
}

@end
