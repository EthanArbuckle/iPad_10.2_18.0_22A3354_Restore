@implementation CHBBar3DSeries

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDBar3DSeries *v4;
  void *v5;
  CHDBar3DSeries *v6;
  uint64_t v7;

  v3 = a3;
  v4 = [CHDBar3DSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDSeries initWithChart:](v4, "initWithChart:", v5);

  v7 = objc_msgSend(v3, "xlCurrentDefaultSeriesFormat");
  if (v7)
    -[CHDBar3DSeries setShapeType:](v6, "setShapeType:", chdShapeTypeFromXlShapeTypeEnum(*(_DWORD *)(v7 + 76)));

  return v6;
}

@end
