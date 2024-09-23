@implementation CHBDefaultTextProperties

+ (void)readWithState:(id)a3
{
  id v3;
  void *v4;
  XlParserVisitor **v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[17];
  unsigned int v12;
  __int16 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  int v19;

  v3 = a3;
  objc_msgSend(v3, "chart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (XlParserVisitor **)objc_msgSend(v3, "xlReader");
  objc_msgSend(v4, "defaultTextProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  do
  {
    XlChartTextFrame::XlChartTextFrame((XlChartTextFrame *)v11);
    v11[0] = &off_24F3A7770;
    v19 = v7;
    XlChartBinaryReader::read(v5, (XlChartTextFrame *)v11);
    objc_msgSend(v3, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHDDefaultTextProperty defaultTextPropertyWithResources:](CHDDefaultTextProperty, "defaultTextPropertyWithResources:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CHBString edRunsFromXlChartTextFrame:state:](CHBString, "edRunsFromXlChartTextFrame:state:", v11, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRuns:", v10);

    objc_msgSend(v9, "setContentFormatId:", v13);
    objc_msgSend(v9, "setDefaultTextType:", v7);
    objc_msgSend(v9, "setLabelPosition:", v12);
    objc_msgSend(v9, "setIsShowCategoryLabel:", v15);
    objc_msgSend(v9, "setIsShowValueLabel:", v14);
    objc_msgSend(v9, "setIsShowPercentageLabel:", v17);
    objc_msgSend(v9, "setIsShowBubbleSizeLabel:", v18);
    objc_msgSend(v9, "setIsShowSeriesLabel:", v16);
    objc_msgSend(v6, "addObject:", v9);

    XlChartTextFrame::~XlChartTextFrame((XlChartTextFrame *)v11);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 4);

}

@end
