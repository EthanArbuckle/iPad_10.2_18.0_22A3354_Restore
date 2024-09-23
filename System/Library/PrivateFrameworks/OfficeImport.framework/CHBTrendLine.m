@implementation CHBTrendLine

+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  CHDTrendline *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  EDValue *v16;
  EDResources *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(v21, "objectWithKey:", (*(unsigned int (**)(void *))(*(_QWORD *)a3 + 24))(a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "edTrendLineTypeFrom:order:", *((unsigned int *)a3 + 60), *((unsigned __int8 *)a3 + 244));
    v11 = objc_alloc_init(CHDTrendline);
    -[CHDTrendline setType:](v11, "setType:", v10);
    +[CHBTrendLineLabel readFrom:state:](CHBTrendLineLabel, "readFrom:state:", a3, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHDTrendline setLabel:](v11, "setLabel:", v12);

    -[CHDTrendline setDisplayEquation:](v11, "setDisplayEquation:", *((_BYTE *)a3 + 245) != 0);
    -[CHDTrendline setDisplayRSquaredValue:](v11, "setDisplayRSquaredValue:", *((_BYTE *)a3 + 246) != 0);
    -[CHDTrendline setBackward:](v11, "setBackward:", *((double *)a3 + 29));
    -[CHDTrendline setForward:](v11, "setForward:", *((double *)a3 + 28));
    -[CHDTrendline setInterceptYAxis:](v11, "setInterceptYAxis:", *((double *)a3 + 27));
    if ((_DWORD)v10 == 3)
    {
      -[CHDTrendline setMovingAveragePeriod:](v11, "setMovingAveragePeriod:", *((unsigned __int8 *)a3 + 244));
    }
    else if ((_DWORD)v10 == 4)
    {
      -[CHDTrendline setPolynomialOrder:](v11, "setPolynomialOrder:", *((unsigned __int8 *)a3 + 244));
    }
    +[CHBData readFrom:state:](CHBData, "readFrom:state:", *((_QWORD *)a3 + 18), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_msgSend(v14, "dataPointAtIndex:", 0);
      if (v15)
      {
        v16 = (EDValue *)(v15 + 8);
        if (EDValue::isStringType((EDValue *)(v15 + 8)))
        {
          objc_msgSend(v8, "resources");
          v17 = (EDResources *)objc_claimAutoreleasedReturnValue();
          EDValue::resolvedEDStringValue(v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHDTrendline setName:](v11, "setName:", v18);

        }
      }
    }
    objc_msgSend(a1, "readTrendlineGraphicProperties:forStyleIndex:state:", objc_msgSend(v8, "defaultFormatForXlSeries:", a3), objc_msgSend(v9, "styleIndex"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHDTrendline setGraphicProperties:](v11, "setGraphicProperties:", v19);

    objc_msgSend(v9, "trendlineCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v11);

  }
}

+ (int)edTrendLineTypeFrom:(int)a3 order:(int)a4
{
  char v4;
  int v5;

  switch(a3)
  {
    case 1:
      v4 = 0;
      v5 = 0;
      break;
    case 2:
      v4 = 0;
      v5 = 2;
      break;
    case 3:
      v4 = 0;
      v5 = 5;
      break;
    case 4:
      v4 = 0;
      v5 = 3;
      break;
    default:
      v5 = 4;
      v4 = 1;
      break;
  }
  if (((a4 == 1) & v4) != 0)
    return 1;
  else
    return v5;
}

+ (id)readTrendlineGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartSeriesFormat:state:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autoStyling");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolveGraphicPropertiesOfTrendline:forSeriesIndex:", v8, a4);

  return v8;
}

+ (int)xlTrendLineRegressionTypeFrom:(int)a3
{
  if (a3 > 5)
    return 0;
  else
    return dword_22A4C1890[a3];
}

@end
