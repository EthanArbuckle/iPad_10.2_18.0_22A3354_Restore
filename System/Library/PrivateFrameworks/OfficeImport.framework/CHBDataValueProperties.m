@implementation CHBDataValueProperties

+ (id)readFrom:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a1, "chdDataValuePropertiesFrom:state:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataValueIndex:", a3->var9);
    XlChartBinaryReader::setDataPointFormat((uint64_t *)objc_msgSend(v6, "xlReader"), a3->var12, LOWORD(a3->var9));
    +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartSeriesFormat:state:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGraphicProperties:", v8);

    +[CHBMarker readFrom:state:](CHBMarker, "readFrom:state:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMarker:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)chdDataValuePropertiesFrom:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a1, "chbDataValuePropertiesClassWithState:", a4);
  objc_msgSend(v5, "chdDataValueProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "read:from:", v6, a3);
  return v6;
}

+ (Class)chbDataValuePropertiesClassWithState:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "xlCurrentPlot");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4) != 2)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)chdDataValueProperties
{
  return objc_alloc_init(CHDDataValueProperties);
}

+ (id)chdDataValuePropertiesFromState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "chbDataValuePropertiesClassWithState:", v4), "chdDataValueProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
