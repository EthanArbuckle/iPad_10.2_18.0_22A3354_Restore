@implementation CHXPlotArea

+ (id)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _xmlNode *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  CXNamespace *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  CXNamespace *v18;
  void *v19;
  CXNamespace *v20;
  BOOL v21;
  void *v22;
  CXNamespace *v23;
  BOOL HasName;
  void *v25;
  unint64_t i;
  void *v27;
  unint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  OADGraphicProperties *v34;
  id v36;
  void *v37;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plotArea");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:");
  objc_msgSend(v5, "autoStyling");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvePlotAreaGraphicProperties:", v34);

  objc_msgSend(v36, "setGraphicProperties:", v34);
  v8 = OCXFirstChild(a3);
  v37 = v5;
  while (v8)
  {
    if (objc_msgSend(a1, "isAxisElement:state:", v8, v5))
    {
      +[CHXAxis chdAxisFromXmlAxisElement:state:](CHXAxis, "chdAxisFromXmlAxisElement:state:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "axes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

      objc_msgSend(v36, "axes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 >= 3)
        objc_msgSend(v9, "setSecondary:", 1);
      objc_msgSend(v37, "drawingState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "OAXChartNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      if (CXNodeHasName(v8, v14, (xmlChar *)"catAx"))
      {
LABEL_9:

      }
      else
      {
        objc_msgSend(v37, "drawingState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "OAXChartNamespace");
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        if (CXNodeHasName(v8, v16, (xmlChar *)"dateAx"))
        {

          goto LABEL_9;
        }
        objc_msgSend(v37, "drawingState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "OAXChartNamespace");
        v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        HasName = CXNodeHasName(v8, v23, (xmlChar *)"valAx");

        if (!HasName)
        {
          if (v12 <= 2)
            v17 = 2;
          else
            v17 = 5;
          goto LABEL_26;
        }
      }
      if (objc_msgSend(v9, "isHorizontalPosition"))
      {
        if (v12 <= 2)
          v17 = 0;
        else
          v17 = 3;
      }
      else if (v12 <= 2)
      {
        v17 = 1;
      }
      else
      {
        v17 = 4;
      }
LABEL_26:
      objc_msgSend(v9, "setAxisType:", v17);
      v5 = v37;
      goto LABEL_27;
    }
    objc_msgSend(v5, "drawingState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OAXChartNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    if (CXNodeHasName(v8, v18, (xmlChar *)"spPr"))
      goto LABEL_18;
    objc_msgSend(v5, "drawingState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "OAXChartNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = CXNodeHasName(v8, v20, (xmlChar *)"layout");

    if (v21)
      goto LABEL_28;
    +[CHXChartType chdChartTypeFromXmlChartTypeElement:state:](CHXChartType, "chdChartTypeFromXmlChartTypeElement:state:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v36, "chartTypes");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      -[CXNamespace addObject:](v18, "addObject:", v9);
LABEL_18:

    }
LABEL_27:

LABEL_28:
    v8 = OCXNextSibling(v8);
  }
  objc_msgSend(v36, "chartTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v25, "count"); ++i)
  {
    objc_msgSend(v25, "objectAtIndex:", i);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHXChartType resolveStyle:state:](CHXChartType, "resolveStyle:state:", v27, v5);

  }
  for (j = 0; j < objc_msgSend(v25, "count"); ++j)
  {
    objc_msgSend(v25, "objectAtIndex:", j);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "axisForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "axisForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31 && v30)
      objc_msgSend(v30, "setCrossBetween:", objc_msgSend(v31, "crossBetween"));

  }
  return v36;
}

+ (BOOL)isAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  BOOL HasName;
  void *v9;
  CXNamespace *v10;
  void *v11;
  CXNamespace *v12;
  void *v13;
  CXNamespace *v14;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXNodeHasName(a3, v7, (xmlChar *)"valAx"))
  {
    HasName = 1;
  }
  else
  {
    objc_msgSend(v5, "drawingState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OAXChartNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    if (CXNodeHasName(a3, v10, (xmlChar *)"catAx"))
    {
      HasName = 1;
    }
    else
    {
      objc_msgSend(v5, "drawingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "OAXChartNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      if (CXNodeHasName(a3, v12, (xmlChar *)"dateAx"))
      {
        HasName = 1;
      }
      else
      {
        objc_msgSend(v5, "drawingState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "OAXChartNamespace");
        v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        HasName = CXNodeHasName(a3, v14, (xmlChar *)"serAx");

      }
    }

  }
  return HasName;
}

@end
