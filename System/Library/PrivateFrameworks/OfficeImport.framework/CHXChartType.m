@implementation CHXChartType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  _xmlNode *v11;
  void *v12;
  void *v13;
  _xmlNode *i;
  _xmlAttr *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = +[CHXChartType chxChartTypeClassWithXmlElement:state:](CHXChartType, "chxChartTypeClassWithXmlElement:state:", a3, v5);
  if (v6)
  {
    -[objc_class chdChartTypeFromXmlChartTypeElement:state:](v6, "chdChartTypeFromXmlChartTypeElement:state:", a3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCurrentChartType:", v7);
    objc_msgSend(v5, "drawingState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "OAXChartNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlNode *)OCXFindChild(a3, v9, "varyColors");

    if (v10)
      objc_msgSend(v7, "setVaryColors:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    v11 = OCXFirstChildNamed(a3, (xmlChar *)"ser");
    while (v11)
    {
      +[CHXSeries readFrom:state:](CHXSeries, "readFrom:state:", v11, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setChartType:", v7);
      objc_msgSend(v7, "seriesCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);

      v11 = OCXNextSiblingNamed(v11, (xmlChar *)"ser");
    }
    for (i = OCXFirstChildNamed(a3, (xmlChar *)"axId"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"axId"))
    {
      v15 = CXRequiredUnsignedLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      objc_msgSend(v7, "axisIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)chdGroupingFromXmlGroupingElement:(_xmlNode *)a3
{
  int v3;
  id v4;
  void *v5;
  id v7;

  if (!a3)
    return 0;
  v7 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("percentStacked")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("clustered")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("standard")) & 1) != 0)
    {
      v3 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("stacked")))
    {
      v3 = 2;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

+ (void)resolveStyle:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (v10)
  {
    objc_msgSend(v10, "seriesCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(v6, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          +[CHXSeries resolveSeriesStyle:state:](CHXSeries, "resolveSeriesStyle:state:", v9, v5);

      }
    }

  }
}

+ (int)chdShapeTypeFromXmlShapeTypeElement:(_xmlNode *)a3
{
  int v3;
  id v4;
  void *v5;
  id v7;

  if (!a3)
    return 0;
  v7 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cone")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("coneToMax")) & 1) != 0)
    {
      v3 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("box")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("cylinder")) & 1) != 0)
    {
      v3 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("pyramid")) & 1) != 0)
    {
      v3 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("pyramidToMax")))
    {
      v3 = 5;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

+ (id)stringWithGroupingEnum:(int)a3
{
  if ((a3 - 1) > 2)
    return CFSTR("clustered");
  else
    return off_24F3A7908[a3 - 1];
}

+ (Class)chxChartTypeClassWithXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  BOOL HasName;
  void *v9;
  CXNamespace *v10;
  BOOL v11;
  void *v12;
  CXNamespace *v13;
  BOOL v14;
  void *v15;
  CXNamespace *v16;
  BOOL v17;
  void *v18;
  CXNamespace *v19;
  BOOL v20;
  void *v21;
  CXNamespace *v22;
  BOOL v23;
  void *v24;
  CXNamespace *v25;
  BOOL v26;
  void *v27;
  CXNamespace *v28;
  BOOL v29;
  void *v30;
  CXNamespace *v31;
  BOOL v32;
  void *v33;
  CXNamespace *v34;
  BOOL v35;
  void *v36;
  CXNamespace *v37;
  BOOL v38;
  void *v39;
  CXNamespace *v40;
  BOOL v41;
  void *v42;
  CXNamespace *v43;
  BOOL v44;
  CXNamespace *v45;
  void *v46;
  CXNamespace *v47;
  void *v48;
  void *v50;
  CXNamespace *v51;
  BOOL v52;
  void *v53;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v7, (xmlChar *)"pieChart");

  if (HasName)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = CXNodeHasName(a3, v10, (xmlChar *)"doughnutChart");

  if (v11)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXNodeHasName(a3, v13, (xmlChar *)"ofPieChart");

  if (v14)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = CXNodeHasName(a3, v16, (xmlChar *)"pie3DChart");

  if (v17)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = CXNodeHasName(a3, v19, (xmlChar *)"barChart");

  if (v20)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "OAXChartNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = CXNodeHasName(a3, v22, (xmlChar *)"bar3DChart");

  if (v23)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "OAXChartNamespace");
  v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v26 = CXNodeHasName(a3, v25, (xmlChar *)"areaChart");

  if (v26)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "OAXChartNamespace");
  v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v29 = CXNodeHasName(a3, v28, (xmlChar *)"area3DChart");

  if (v29)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "OAXChartNamespace");
  v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v32 = CXNodeHasName(a3, v31, (xmlChar *)"lineChart");

  if (v32)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "OAXChartNamespace");
  v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v35 = CXNodeHasName(a3, v34, (xmlChar *)"stockChart");

  if (v35)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "OAXChartNamespace");
  v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v38 = CXNodeHasName(a3, v37, (xmlChar *)"line3DChart");

  if (v38)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "OAXChartNamespace");
  v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v41 = CXNodeHasName(a3, v40, (xmlChar *)"scatterChart");

  if (v41)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "OAXChartNamespace");
  v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v44 = CXNodeHasName(a3, v43, (xmlChar *)"bubbleChart");

  if (v44)
    goto LABEL_18;
  objc_msgSend(v5, "drawingState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "OAXChartNamespace");
  v45 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXNodeHasName(a3, v45, (xmlChar *)"radarChart"))
    goto LABEL_17;
  objc_msgSend(v5, "drawingState");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "OAXChartNamespace");
  v47 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXNodeHasName(a3, v47, (xmlChar *)"surfaceChart"))
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v5, "drawingState");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "OAXChartNamespace");
  v51 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v52 = CXNodeHasName(a3, v51, (xmlChar *)"surface3DChart");

  if (!v52)
  {
    v48 = 0;
    goto LABEL_19;
  }
LABEL_18:
  objc_opt_class();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return (Class)v48;
}

+ (void)prepareChartTypeForWriting:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t j;
  void *v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "axes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v24, "axes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "axisId");

    v8 = v7 > 2;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v24, "axisIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  objc_msgSend(v24, "chart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "plotArea");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "axes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i < objc_msgSend(v12, "count"); ++i)
  {
    objc_msgSend(v12, "objectAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "axisId");

    if (((v8 ^ ((int)v15 > 2)) & 1) == 0)
    {
      objc_msgSend(v24, "axisIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
  }
  objc_msgSend(v24, "axes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < objc_msgSend(v18, "count"); ++j)
  {
    objc_msgSend(v18, "objectAtIndex:", j);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "axisId");
    if (v21)
      v22 = v21 == 3;
    else
      v22 = 1;
    if (v22)
      v23 = v21 + 1;
    else
      v23 = v21 - 1;
    objc_msgSend(v20, "setCrossAxisId:", (double)(unint64_t)v23);

  }
}

@end
