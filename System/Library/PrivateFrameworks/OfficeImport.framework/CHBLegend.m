@implementation CHBLegend

+ (id)readFrom:(void *)a3 state:(id)a4
{
  id v5;
  CHDLegend *v6;
  void *v7;
  CHDLegend *v8;
  void *v9;
  void *v10;

  v5 = a4;
  if (a3)
  {
    v6 = [CHDLegend alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHDLegend initWithResources:](v6, "initWithResources:", v7);

    -[CHDLegend setFontIndex:](v8, "setFontIndex:", +[CHBString edFontIndexForXlChartTextFrame:state:](CHBString, "edFontIndexForXlChartTextFrame:state:", a3, v5));
    +[CHBGraphicProperties oadGraphicPropertiesFromXlChartTextFrame:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartTextFrame:state:", a3, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autoStyling");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolveLegendGraphicProperties:", v9);

    -[CHDLegend setGraphicProperties:](v8, "setGraphicProperties:", v9);
    -[CHDLegend setLegendPosition:](v8, "setLegendPosition:", +[CHBLegend chdLegendPositionEnumFromXlLegendPosition:](CHBLegend, "chdLegendPositionEnumFromXlLegendPosition:", *((unsigned int *)a3 + 54)));
    -[CHDLegend setIsSingleColumnLegend:](v8, "setIsSingleColumnLegend:", *((unsigned __int8 *)a3 + 232));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)chdLegendPositionEnumFromXlLegendPosition:(int)a3
{
  if (a3 > 7)
    return 3;
  else
    return dword_22A4C17C8[a3];
}

+ (id)readCHDLegendEntryFrom:(const void *)a3 state:(id)a4
{
  id v5;
  CHDLegendEntry *v6;
  void *v7;
  CHDLegendEntry *v8;

  v5 = a4;
  if (a3)
  {
    v6 = [CHDLegendEntry alloc];
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CHDLegendEntry initWithResources:](v6, "initWithResources:", v7);

    -[CHDLegendEntry setFontIndex:](v8, "setFontIndex:", +[CHBString edFontIndexForXlChartTextFrame:state:](CHBString, "edFontIndexForXlChartTextFrame:state:", a3, v5));
    -[CHDLegendEntry setEntryIndex:](v8, "setEntryIndex:", *((unsigned __int16 *)a3 + 108));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)xlLegendPositionEnumFromCHDLegendPosition:(int)a3
{
  if (a3 > 5)
    return 3;
  else
    return dword_22A4C17E8[a3];
}

@end
