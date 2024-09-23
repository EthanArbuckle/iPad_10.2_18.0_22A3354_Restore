@implementation CHBPlotArea

+ (id)readWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  XlChartFrameType v11;

  v4 = a3;
  objc_msgSend(v4, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "plotArea");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  XlChartFrameType::XlChartFrameType(&v11);
  v11.var0 = (void **)&off_24F3A77A8;
  *(&v11.var16 + 1) = 0;
  v7 = objc_msgSend(v4, "xlReader");
  (*(void (**)(uint64_t, XlChartFrameType *))(*(_QWORD *)v7 + 704))(v7, &v11);
  +[CHBGraphicProperties oadGraphicPropertiesFromXlChartFrameType:state:](CHBGraphicProperties, "oadGraphicPropertiesFromXlChartFrameType:state:", &v11, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoStyling");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvePlotAreaGraphicProperties:", v8);

  objc_msgSend(v6, "setGraphicProperties:", v8);
  objc_msgSend(a1, "readAxisGroup:to:state:", 0, v6, v4);
  objc_msgSend(a1, "readAxisGroup:to:state:", 1, v6, v4);

  XlChartFrameType::~XlChartFrameType(&v11);
  return v6;
}

+ (void)readAxisGroup:(int)a3 to:(id)a4 state:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  XlChartBinaryReader *v12;
  void *v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[28];
  int v25;
  int v26;
  char v27;
  _QWORD *v28;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "setAxisGroup:", v6);
  objc_msgSend(v7, "axes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHBAxis readWithXlPlotAxis:state:](CHBAxis, "readWithXlPlotAxis:state:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v9);

  +[CHBAxis readWithXlPlotAxis:state:](CHBAxis, "readWithXlPlotAxis:state:", 1, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v10);

  +[CHBAxis readWithXlPlotAxis:state:](CHBAxis, "readWithXlPlotAxis:state:", 2, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v11);

  v12 = (XlChartBinaryReader *)objc_msgSend(v8, "xlReader");
  objc_msgSend(v7, "chartTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "xlPlotCount");
  if (v14 >= 1)
  {
    v15 = 0;
    do
    {
      v28 = 0;
      (*(void (**)(XlChartBinaryReader *, uint64_t, uint64_t, _QWORD **))(*(_QWORD *)v12 + 712))(v12, v6, v15, &v28);
      v16 = v28;
      if (v28)
      {
        if (!(_DWORD)v15)
        {
          if (XlChartBinaryReader::hasLegend(v12))
          {
            XlChartTextFrame::XlChartTextFrame((XlChartTextFrame *)v24);
            v24[0] = &off_24F3A77E0;
            v24[27] = 0x100000004;
            v25 = 0;
            v26 = 16843009;
            v27 = 1;
            v17 = objc_msgSend(v8, "xlReader");
            (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v17 + 768))(v17, v24);
            objc_msgSend(v8, "chart");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[CHBLegend readFrom:state:](CHBLegend, "readFrom:state:", v24, v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLegend:", v19);

            XlChartTextFrame::~XlChartTextFrame((XlChartTextFrame *)v24);
          }
          objc_msgSend(v8, "chart");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[CHBView3D readFrom:](CHBView3D, "readFrom:", v28[1]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setView3D:", v21);

          v16 = v28;
        }
        objc_msgSend(v8, "setXlCurrentPlotIndex:", *(__int16 *)(v16[2] + 16));
        objc_msgSend(v8, "setXlCurrentPlot:", v28);
        +[CHBChartType readWithState:](CHBChartType, "readWithState:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);
        if (objc_msgSend(v13, "count") == 1 && objc_msgSend(v22, "isHorizontal"))
          objc_msgSend(v23, "adjustAxesPositionForHorizontalChart");
        objc_msgSend(v8, "setXlCurrentPlot:", 0);
        objc_msgSend(v8, "setXlCurrentPlotIndex:", 0xFFFFFFFFLL);
        if (v28)
          (*(void (**)(_QWORD *))(*v28 + 8))(v28);

      }
      v15 = (v15 + 1);
    }
    while (v14 != (_DWORD)v15);
  }

}

@end
