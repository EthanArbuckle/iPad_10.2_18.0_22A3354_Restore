@implementation CHBDataLabel

+ (id)chdDataLabelFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "xlCurrentPlot");
  v7 = 0;
  if (a3)
  {
    v8 = v6;
    if (v6)
    {
      objc_msgSend(v5, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHDDataLabel dataLabelWithResources:](CHDDataLabel, "dataLabelWithResources:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setShowLeaderLines:", *(unsigned __int8 *)(v8 + 143));
      objc_msgSend(v7, "setShowCategoryName:", a3->var19);
      objc_msgSend(v7, "setShowPercent:", a3->var18);
      objc_msgSend(v7, "setShowBubbleSize:", a3->var21);
      objc_msgSend(v7, "setShowValue:", a3->var17);
      +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartSeriesFormat:state:", a3, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGraphicProperties:", v10);

      +[CHBGraphicProperties oadGraphicPropertiesFromXlLeaderLineStyleInPlot:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlLeaderLineStyleInPlot:state:", v8, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeaderlineGraphicProperties:", v11);

    }
  }

  return v7;
}

+ (id)chdDataLabelFromXlChartCustomLabelText:(void *)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = objc_msgSend(v5, "xlCurrentPlot");
  v7 = 0;
  if (a3)
  {
    v8 = v6;
    if (v6)
    {
      objc_msgSend(v5, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHDDataLabel dataLabelWithResources:](CHDDataLabel, "dataLabelWithResources:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setShowLeaderLines:", *(unsigned __int8 *)(v8 + 143));
      objc_msgSend(v7, "setShowCategoryName:", *((unsigned __int8 *)a3 + 197));
      objc_msgSend(v7, "setShowPercent:", *((unsigned __int8 *)a3 + 199));
      objc_msgSend(v7, "setShowBubbleSize:", *((unsigned __int8 *)a3 + 200));
      objc_msgSend(v7, "setShowValue:", *((unsigned __int8 *)a3 + 196));
      objc_msgSend(v7, "setShowLegendKey:", *((unsigned __int8 *)a3 + 195));
      objc_msgSend(v7, "setShowSeriesName:", *((unsigned __int8 *)a3 + 198));
      objc_msgSend(v7, "setPosition:", +[CHBDataLabel chdLabelPositionEnumFromXlLabelPosition:](CHBDataLabel, "chdLabelPositionEnumFromXlLabelPosition:", *((unsigned int *)a3 + 34)));
      if (*((_BYTE *)a3 + 202))
        objc_msgSend(v7, "setIsContentFormatDerivedFromDataPoints:", 1);
      else
        objc_msgSend(v7, "setContentFormatId:", *((__int16 *)a3 + 92));
      +[CHBGraphicProperties oadGraphicPropertiesFromXlChartTextFrame:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartTextFrame:state:", a3, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGraphicProperties:", v10);

      +[CHBGraphicProperties oadGraphicPropertiesFromXlLeaderLineStyleInPlot:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlLeaderLineStyleInPlot:state:", v8, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLeaderlineGraphicProperties:", v11);

      +[CHBString edStringFromXlChartTextFrame:state:](CHBString, "edStringFromXlChartTextFrame:state:", a3, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setString:", v12);

      objc_msgSend(v7, "setRotationAngle:", (double)*((__int16 *)a3 + 88));
    }
  }

  return v7;
}

+ (int)chdLabelPositionEnumFromXlLabelPosition:(int)a3
{
  if ((a3 - 1) >= 0xA)
    return 0;
  else
    return a3;
}

+ (int)xlLabelPositionEnumFromCHDDataLabelPosition:(int)a3
{
  if ((a3 - 1) >= 0xA)
    return 0;
  else
    return a3;
}

@end
