@implementation CHBChartType

+ (id)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  XlChartChartFormat *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  unsigned __int16 *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t j;
  unsigned __int16 *v20;
  int v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_msgSend(v3, "xlCurrentPlot");
  if (v4)
  {
    v5 = +[CHBChartType chdChartTypeClassWithPlot:](CHBChartType, "chdChartTypeClassWithPlot:", v4);
    if (v5)
    {
      -[objc_class chdChartTypeWithState:](v5, "chdChartTypeWithState:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(XlChartChartFormat **)(v4 + 16);
      if (v7)
        objc_msgSend(v6, "setVaryColors:", XlChartChartFormat::isVaried(v7));
      objc_msgSend(v6, "axisIds");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_DWORD *)(v4 + 136);
      if (XlChartBinaryReader::hasAxis(objc_msgSend(v3, "xlReader"), v9, 0))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 0, v3));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

      }
      if (XlChartBinaryReader::hasAxis(objc_msgSend(v3, "xlReader"), v9, 1))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 1, v3));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v11);

      }
      if (XlChartBinaryReader::hasAxis(objc_msgSend(v3, "xlReader"), v9, 2))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", 2, v3));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

      }
      for (i = 0; (int)i < (int)objc_msgSend(v3, "xlSeriesCount"); i = (i + 1))
      {
        v14 = (unsigned __int16 *)objc_msgSend(v3, "xlChartDataSeriesAtIndex:", i);
        v15 = v14[10];
        if (objc_msgSend(v3, "xlCurrentPlotIndex") == v15
          && !(*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)v14 + 16))(v14))
        {
          objc_msgSend(v3, "setXlCurrentSeriesIndex:", i);
          +[CHBSeries readFrom:state:](CHBSeries, "readFrom:state:", v14, v3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            if ((objc_msgSend(v16, "isHidden") & 1) == 0)
            {
              objc_msgSend(v17, "setChartType:", v6);
              objc_msgSend(v6, "seriesCollection");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v17);

            }
          }

        }
      }
      for (j = 0; ; j = (j + 1))
      {
        if ((int)j >= (int)objc_msgSend(v3, "xlSeriesCount"))
        {
          +[CHBDataLabel chdDataLabelFromXlChartSeriesFormat:state:](CHBDataLabel, "chdDataLabelFromXlChartSeriesFormat:state:", *(_QWORD *)(v4 + 24), v3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setDefaultDataLabel:", v23);

          goto LABEL_31;
        }
        v20 = (unsigned __int16 *)objc_msgSend(v3, "xlChartDataSeriesAtIndex:", j);
        v21 = v20[10];
        if (objc_msgSend(v3, "xlCurrentPlotIndex") == v21)
        {
          if ((*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)v20 + 16))(v20) == 1)
          {
            objc_msgSend(v6, "seriesCollection");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[CHBErrorBar readFrom:toSeries:state:](CHBErrorBar, "readFrom:toSeries:state:", v20, v22, v3);
          }
          else
          {
            if ((*(unsigned int (**)(unsigned __int16 *))(*(_QWORD *)v20 + 16))(v20) != 2)
              continue;
            objc_msgSend(v6, "seriesCollection");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[CHBTrendLine readFrom:toSeries:state:](CHBTrendLine, "readFrom:toSeries:state:", v20, v22, v3);
          }

        }
      }
    }
  }
  v6 = 0;
LABEL_31:

  return v6;
}

+ (Class)chdChartTypeClassWithPlot:(void *)a3
{
  int v4;

  v4 = (*(uint64_t (**)(void *, SEL))(*(_QWORD *)a3 + 16))(a3, a2);
  if (!*((_QWORD *)a3 + 1))
  {
    switch(v4)
    {
      case 5:
        XlChartChartFormat::isVaried((uint64_t *)off_24F398F28, (XlChartChartFormat *)((char *)a3 + 144));
        break;
      default:
        break;
    }
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
