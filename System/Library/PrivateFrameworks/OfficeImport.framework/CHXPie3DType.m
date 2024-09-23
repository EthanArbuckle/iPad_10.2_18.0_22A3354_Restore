@implementation CHXPie3DType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OADGraphicProperties *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDPie3DType, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CHXPie2DType readFrom:chartType:state:](CHXPie2DType, "readFrom:chartType:state:", a3, v7, v5);
  objc_msgSend(v5, "chart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "plotArea");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "graphicProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v5, "chart");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "plotArea");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(OADGraphicProperties);
    objc_msgSend(v12, "setGraphicProperties:", v13);

  }
  objc_msgSend(v5, "chart");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "plotArea");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "graphicProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasOrientedBounds");

  if (v17)
  {
    objc_msgSend(v5, "chart");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "plotArea");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "graphicProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "orientedBounds");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v25 = v24;

    if (v23 == 0.0 && v25 == 0.0)
    {
      objc_msgSend(v5, "chart");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "plotArea");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "graphicProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "orientedBounds");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBounds:", 0.0305555556, 0.0509259259, 0.860964348, 0.898148148);

    }
  }

  return v7;
}

@end
