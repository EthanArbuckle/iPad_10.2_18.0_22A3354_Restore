@implementation CHBErrorBar

+ (void)readFrom:(void *)a3 toSeries:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(v17, "objectWithKey:", (*(unsigned int (**)(void *))(*(_QWORD *)a3 + 24))(a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "edErrorBarDirectionFrom:", *((unsigned int *)a3 + 60));
    if ((_DWORD)v10 == 1)
      objc_msgSend(v9, "errorBarYAxis");
    else
      objc_msgSend(v9, "errorBarXAxis");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v11)
    {
      objc_msgSend(v9, "chart");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHDErrorBar errorBarWithChart:](CHDErrorBar, "errorBarWithChart:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "setType:", objc_msgSend(a1, "edErrorBarTypeFrom:", *((unsigned int *)a3 + 60)));
    objc_msgSend(v12, "setDirection:", v10);
    objc_msgSend(v12, "setValueType:", *((unsigned int *)a3 + 58));
    objc_msgSend(v12, "setNoEndCap:", *((_BYTE *)a3 + 236) == 0);
    if (objc_msgSend(v12, "valueType") == 4 || objc_msgSend(v12, "valueType") == 5)
    {
      v14 = *((_QWORD *)a3 + 19);
      if (!v14)
        v14 = *((_QWORD *)a3 + 20);
      if (objc_msgSend(v12, "type") == 2)
      {
        +[CHBData readFrom:state:](CHBData, "readFrom:state:", v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPlusValues:", v15);
      }
      else
      {
        +[CHBData readFrom:state:](CHBData, "readFrom:state:", v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMinusValues:", v15);
      }

    }
    else
    {
      objc_msgSend(v12, "setValue:", *((double *)a3 + 27));
    }
    if (v11)
      objc_msgSend(v12, "setType:", 0);
    objc_msgSend(a1, "readErrorBarGraphicProperties:forStyleIndex:state:", objc_msgSend(v8, "defaultFormatForXlSeries:", a3), objc_msgSend(v9, "styleIndex"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGraphicProperties:", v16);

    objc_msgSend(v9, "setErrorBar:", v12);
  }

}

+ (int)edErrorBarDirectionFrom:(int)a3
{
  return (a3 - 3) < 0xFFFFFFFE;
}

+ (int)edErrorBarTypeFrom:(int)a3
{
  if ((a3 & 0xFFFFFFFD) == 1)
    return 2;
  else
    return 1;
}

+ (id)readErrorBarGraphicProperties:(const XlChartSeriesFormat *)a3 forStyleIndex:(unint64_t)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartSeriesFormat:state:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autoStyling");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolveGraphicPropertiesOfErrorBar:forSeriesIndex:", v8, a4);

  return v8;
}

+ (int)xlErrorBarTypeFrom:(int)a3 direction:(int)a4
{
  int v4;
  int v5;

  if (a4 == 1)
    v4 = 4;
  else
    v4 = 2;
  if (a4 == 1)
    v5 = 3;
  else
    v5 = 1;
  if (a3 == 1)
    return v4;
  else
    return v5;
}

+ (int)xlErrorBarSourceFrom:(int)a3
{
  if ((a3 - 1) >= 5)
    return 2;
  else
    return a3;
}

@end
