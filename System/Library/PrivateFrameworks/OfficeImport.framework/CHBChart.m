@implementation CHBChart

+ (void)readWithState:(id)a3
{
  id v4;
  void *v5;
  XlChartBinaryReader *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[24];
  unsigned __int8 v21;
  _BYTE v22[88];
  _DWORD v23[46];

  v4 = a3;
  objc_msgSend(v4, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStyleId:", 0);
  objc_msgSend(v5, "setLogicalBounds:", 0.0, 0.0, 4000.0, 4000.0);
  v6 = (XlChartBinaryReader *)objc_msgSend(v4, "xlReader");
  if (*((int *)v6 + 50) >= 1)
  {
    objc_msgSend(v4, "ebReaderSheetState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EBGraphic readGraphicsInChart:state:](EBGraphic, "readGraphicsInChart:state:", v5, v7);

  }
  if (*((_BYTE *)v6 + 1344))
  {
    objc_msgSend(v5, "setMSGraph:", 1);
    if (*((_BYTE *)v6 + 1997))
      v8 = 1;
    else
      v8 = 2;
    objc_msgSend(v5, "setDirection:", v8);
  }
  XlChartParent::XlChartParent((XlChartParent *)v22);
  (*(void (**)(XlChartBinaryReader *, _BYTE *))(*(_QWORD *)v6 + 696))(v6, v22);
  +[CHBGraphicProperties oadGraphicPropertiesFromXlChartFrameType:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartFrameType:state:", v22, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoStyling");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolveChartAreaGraphicProperties:", v9);

  objc_msgSend(v5, "setChartAreaGraphicProperties:", v9);
  objc_msgSend(v5, "setPlotVisibleCellsOnly:", XlChartArea::isCategoryPercentage((XlChartArea *)v23));
  objc_msgSend(v5, "setDisplayBlankAs:", objc_msgSend(a1, "readCHDDisplayBlanksAsEnumFrom:", v23[5]));
  objc_msgSend(v4, "readAndCacheXlChartDataSeries");
  +[CHBDefaultTextProperties readWithState:](CHBDefaultTextProperties, "readWithState:", v4);
  +[CHBPlotArea readWithState:](CHBPlotArea, "readWithState:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlotArea:", v11);

  if (XlChartBinaryReader::hasTitle(v6))
  {
    XlChartTextFrame::XlChartTextFrame((XlChartTextFrame *)v20);
    v20[0] = &off_24F3A7698;
    (*(void (**)(XlChartBinaryReader *, _QWORD *))(*(_QWORD *)v6 + 760))(v6, v20);
    +[CHBTitle readFrom:state:](CHBTitle, "readFrom:state:", v20, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "isCachedTitleEmpty"))
      {
        objc_msgSend(v5, "mainType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "resources");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "defaultTitleWithResources:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v13, "lastCachedName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17 && objc_msgSend(v17, "areThereRuns"))
          {
            objc_msgSend(v16, "string");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setString:", v19);

          }
          else
          {
            objc_msgSend(v13, "setLastCachedName:", v16);
          }

        }
      }
      objc_msgSend(v5, "setTitle:", v13);
    }
    objc_msgSend(v5, "setAutoTitleDeleted:", v21);

    XlChartTextFrame::~XlChartTextFrame((XlChartTextFrame *)v20);
  }

  XlChartParent::~XlChartParent((XlChartParent *)v22);
}

+ (int)readCHDDisplayBlanksAsEnumFrom:(int)a3
{
  if (a3 > 2)
    return 2;
  else
    return dword_22A4C1764[a3];
}

+ (int)emptyCellsPlottedEnumsFrom:(int)a3
{
  if (a3 > 2)
    return 1;
  else
    return dword_22A4C1764[a3];
}

@end
