@implementation CHBMarker

+ (id)readFrom:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v5;
  CHDMarker *v6;
  XlChartMarkerStyle *var3;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  v6 = objc_alloc_init(CHDMarker);
  if (a3)
  {
    var3 = a3->var3;
    v8 = a3->var4 != 0;
  }
  else
  {
    var3 = 0;
    v8 = 0;
  }
  +[CHBGraphicProperties oadGraphicPropertiesFromXlMarkerStyle:complex:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlMarkerStyle:complex:state:", var3, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHDMarker setGraphicProperties:](v6, "setGraphicProperties:", v9);

  if (var3)
  {
    -[CHDMarker setSize:](v6, "setSize:", var3->var4 / 0x14uLL);
    if (var3->var9)
      v10 = 0xFFFFFFFFLL;
    else
      v10 = +[CHBMarker chdMarkerStyleFromXlMarkerType:](CHBMarker, "chdMarkerStyleFromXlMarkerType:", var3->var1);
    -[CHDMarker setStyle:](v6, "setStyle:", v10);
  }

  return v6;
}

+ (int)chdMarkerStyleFromXlMarkerType:(int)a3
{
  if ((a3 - 1) > 8)
    return 0;
  else
    return dword_22A4C1800[a3 - 1];
}

+ (int)xlMarkerStyleFromCHDMarkerType:(int)a3
{
  if ((a3 - 1) > 9)
    return 0;
  else
    return dword_22A4C1824[a3 - 1];
}

@end
