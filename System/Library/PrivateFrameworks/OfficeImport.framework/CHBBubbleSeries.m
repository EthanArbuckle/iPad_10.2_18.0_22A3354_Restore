@implementation CHBBubbleSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDBubbleSeries *v4;
  void *v5;
  CHDBubbleSeries *v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;

  v3 = a3;
  v4 = [CHDBubbleSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDSeries initWithChart:](v4, "initWithChart:", v5);

  v7 = objc_msgSend(v3, "xlCurrentDefaultSeriesFormat");
  if (v7)
  {
    v8 = *(_BYTE *)(v7 + 81) != 0;
    v9 = *(_BYTE *)(v7 + 87) != 0;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  -[CHDBubbleSeries setBubble3D:](v6, "setBubble3D:", v8);
  -[CHDBubbleSeries setShowBubbleSize:](v6, "setShowBubbleSize:", v9);

  return v6;
}

@end
