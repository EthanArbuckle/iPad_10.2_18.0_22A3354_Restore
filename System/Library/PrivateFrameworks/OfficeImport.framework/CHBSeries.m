@implementation CHBSeries

+ (id)readFrom:(void *)a3 state:(id)a4
{
  id v5;
  Class v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t CachedCustomFormat;
  void *v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t CachedCustomLabel;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t DefaultFormat;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  void *v40;

  v5 = a4;
  if (a3
    && (v6 = +[CHBSeries chdSeriesClassWithState:](CHBSeries, "chdSeriesClassWithState:", v5)) != 0)
  {
    -[objc_class chdSeriesWithState:](v6, "chdSeriesWithState:", v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setOrder:", *((unsigned __int16 *)a3 + 8));
    +[CHBData readFrom:state:](CHBData, "readFrom:state:", *((_QWORD *)a3 + 18), v5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "formula");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setName:", v7);

    objc_msgSend(v38, "dataValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      objc_msgSend(v37, "dataValueAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setLastCachedName:", v8);

    }
    +[CHBData readFrom:state:](CHBData, "readFrom:state:", *((_QWORD *)a3 + 19), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setValueData:", v9);

    +[CHBData readFrom:state:](CHBData, "readFrom:state:", *((_QWORD *)a3 + 20), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCategoryData:", v10);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CHBData readFrom:state:](CHBData, "readFrom:state:", *((_QWORD *)a3 + 21), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSizeData:", v11);

    }
    objc_msgSend(v40, "dataValuePropertiesCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *((_DWORD *)a3 + 14) - *((_DWORD *)a3 + 12);
    v14 = (unsigned __int16)(v13 >> 3);
    if ((unsigned __int16)(v13 >> 3))
    {
      v15 = 0;
      do
      {
        CachedCustomFormat = XlChartDataSeries::getCachedCustomFormat((XlChartDataSeries *)a3, (unsigned __int16)v15);
        if (CachedCustomFormat)
        {
          +[CHBDataValueProperties readFrom:state:](CHBDataValueProperties, "readFrom:state:", CachedCustomFormat, v5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v17);

        }
        ++v15;
      }
      while (v14 != v15);
    }
    v18 = *((_DWORD *)a3 + 20) - *((_DWORD *)a3 + 18);
    v19 = (unsigned __int16)(v18 >> 3);
    if ((unsigned __int16)(v18 >> 3))
    {
      v20 = 0;
      do
      {
        CachedCustomLabel = XlChartDataSeries::getCachedCustomLabel((XlChartDataSeries *)a3, (unsigned __int16)v20);
        if (CachedCustomLabel)
        {
          v22 = *(unsigned int *)(CachedCustomLabel + 216);
          +[CHBDataLabel chdDataLabelFromXlChartCustomLabelText:state:](CHBDataLabel, "chdDataLabelFromXlChartCustomLabelText:state:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v22 == 0xFFFF)
          {
            objc_msgSend(v40, "setDefaultDataLabel:", v23);
          }
          else
          {
            objc_msgSend(v12, "objectWithKey:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
            {
              DefaultFormat = *(_QWORD *)(objc_msgSend(v5, "xlCurrentPlot") + 24);
              if (!DefaultFormat
                && (((*((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 6)) & 0x7FFF8) == 0
                 || (DefaultFormat = XlChartDataSeries::getDefaultFormat((XlChartDataSeries *)a3, 0)) == 0)
                || (+[CHBDataValueProperties chdDataValuePropertiesFrom:state:](CHBDataValueProperties, "chdDataValuePropertiesFrom:state:", DefaultFormat, v5), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                +[CHBDataValueProperties chdDataValuePropertiesFromState:](CHBDataValueProperties, "chdDataValuePropertiesFromState:", v5);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v24, "setDataValueIndex:", v22);
              objc_msgSend(v12, "addObject:", v24);
            }
            objc_msgSend(v24, "setDataLabel:", v23);

          }
        }
        ++v20;
      }
      while (v19 != v20);
    }
    objc_msgSend(a1, "readXlChartSeriesFormat:chdSeries:state:", a3, v40, v5);
    objc_msgSend(a1, "resolveSeriesStyle:state:", v40, v5);
    objc_msgSend(v5, "chart");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "legend");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "legendEntries");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = *((_QWORD *)a3 + 22);
    v29 = *((_QWORD *)a3 + 23);
    if ((((_DWORD)v29 - (_DWORD)v30) & 0x7FFF8) != 0)
    {
      v31 = 0;
      do
      {
        v32 = *(_QWORD *)(v30 + 8 * v31);
        if (v32)
        {
          +[CHBLegend readCHDLegendEntryFrom:state:](CHBLegend, "readCHDLegendEntryFrom:state:", v32, v5);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v33);

          v30 = *((_QWORD *)a3 + 22);
          v29 = *((_QWORD *)a3 + 23);
        }
        ++v31;
      }
      while (v31 < (unsigned __int16)((v29 - v30) >> 3));
    }
    v34 = *((_QWORD *)a3 + 1);
    if (v34 && !*(_WORD *)(v34 + 18))
      objc_msgSend(v40, "setHiddenFlag:", 1);

    v35 = v40;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (Class)chdSeriesClassWithState:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "xlCurrentPlot");
  switch((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3))
  {
    case 5u:
      XlChartChartFormat::isVaried((uint64_t *)off_24F398F20, (XlChartChartFormat *)(v3 + 144));
      break;
    default:
      break;
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)chdSeriesWithState:(id)a3
{
  id v3;
  CHDSeries *v4;
  void *v5;
  CHDSeries *v6;

  v3 = a3;
  v4 = [CHDSeries alloc];
  objc_msgSend(v3, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHDSeries initWithChart:](v4, "initWithChart:", v5);

  return v6;
}

+ (void)readXlChartSeriesFormat:(void *)a3 chdSeries:(id)a4 state:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a5;
  v7 = objc_msgSend(v6, "xlCurrentDefaultSeriesFormat");
  v8 = v7;
  if (!v7 || (v9 = v7, !*(_QWORD *)(v7 + 8)))
    v9 = *(_QWORD *)(objc_msgSend(v6, "xlCurrentPlot") + 24);
  if (v13 && v8)
  {
    objc_msgSend(v13, "setStyleIndex:", *(unsigned __int16 *)(v8 + 70));
    XlChartBinaryReader::setDefaultFormat((uint64_t *)objc_msgSend(v6, "xlReader"), *(unsigned __int16 *)(v8 + 72), 0);
    +[CHBGraphicProperties oadGraphicPropertiesFromXlChartSeriesFormat:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartSeriesFormat:state:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGraphicProperties:", v10);

    objc_msgSend(v13, "defaultDataLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (*(_BYTE *)(v8 + 83)
      || *(_BYTE *)(v8 + 84)
      || *(_BYTE *)(v8 + 86)
      || *(_BYTE *)(v8 + 80)
      || *(_BYTE *)(v8 + 85)
      || *(_BYTE *)(v8 + 87))
    {
      +[CHBDataLabel chdDataLabelFromXlChartSeriesFormat:state:](CHBDataLabel, "chdDataLabelFromXlChartSeriesFormat:state:", v8, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      if (v12)
      {
        objc_msgSend(v12, "setGraphicProperties:", 0);
        objc_msgSend(v13, "setDefaultDataLabel:", v11);
      }
      goto LABEL_15;
    }
  }
LABEL_16:

}

+ (void)resolveSeriesStyle:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v5 = a4;
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_255B33708))
  {
    objc_msgSend(v5, "autoStyling");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "marker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "graphicProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolveMarker:withSeriesGraphicProperties:forSeriesIndex:clientGraphicPropertyDefaults:", v7, v8, objc_msgSend(v20, "styleIndex"), 0);

    objc_msgSend(v5, "autoStyling");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "graphicProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v10, objc_msgSend(v20, "styleIndex"), 1);
  }
  else
  {
    objc_msgSend(v5, "autoStyling");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "graphicProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v10, objc_msgSend(v20, "styleIndex"), 0);
  }

  objc_msgSend(v20, "dataValuePropertiesCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v12)
  {
    v14 = isKindOfClass;
    for (i = 0; i != v12; ++i)
    {
      objc_msgSend(v11, "objectAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "graphicProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v5, "autoStyling");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v14 & 1) != 0)
          v19 = objc_msgSend(v16, "dataValueIndex");
        else
          v19 = objc_msgSend(v20, "styleIndex");
        objc_msgSend(v18, "resolveGraphicPropertiesOfSeries:forSeriesIndex:", v17, v19);

      }
    }
  }

}

@end
