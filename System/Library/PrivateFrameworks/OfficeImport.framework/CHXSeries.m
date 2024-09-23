@implementation CHXSeries

+ (id)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  OADGraphicProperties *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  void *v20;
  CXNamespace *v21;
  _xmlNode *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  OADTileTechnique *v26;
  void *v27;
  CXNamespace *v28;
  uint64_t v29;
  void *v30;
  CXNamespace *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  CXNamespace *v36;
  uint64_t v37;
  void *v38;
  CXNamespace *v39;
  void *v40;
  void *v41;
  CXNamespace *v42;
  uint64_t v43;
  void *v44;
  _xmlNode *v45;
  void *v46;
  void *v47;
  void *v48;
  CXNamespace *v49;
  uint64_t v50;
  _xmlNode *parent;
  void *v52;
  CXNamespace *v53;
  void *v54;
  _xmlNode *v55;
  void *v56;
  _xmlNode *v57;
  uint64_t v58;
  _xmlNode *v59;
  void *v60;
  void *v61;
  void *v62;
  CXNamespace *v63;
  _xmlNode *v64;
  void *v65;
  CXNamespace *v66;
  uint64_t v67;
  EDValue *v68;
  id v69;
  EDValue *v70;
  CHDDataValue *v71;
  void *v72;
  CXNamespace *v73;
  uint64_t v74;
  CHDDataValue *v75;
  void *v77;
  EDValue v78;
  id v79;
  id v80;
  id v81;

  v5 = a4;
  -[objc_class chdSeriesFromXmlSeriesElement:state:](+[CHXSeries chxSeriesClassWithState:](CHXSeries, "chxSeriesClassWithState:", v5), "chdSeriesFromXmlSeriesElement:state:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentSeries:", v6);
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindRequiredChild(a3, v8, (xmlChar *)"idx");

  objc_msgSend(v6, "setStyleIndex:", CXRequiredUnsignedLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindRequiredChild(a3, v11, (xmlChar *)"order");

  objc_msgSend(v6, "setOrder:", (int)CXRequiredLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v13, a3, v5);
  if (-[OADGraphicProperties hasFill](v13, "hasFill"))
  {
    -[OADGraphicProperties fill](v13, "fill");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[OADGraphicProperties fill](v13, "fill");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "drawingState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "OAXChartNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v19 = (_xmlNode *)OCXFindChild(a3, v18, "pictureOptions");

      if (v19)
      {
        objc_msgSend(v5, "drawingState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "OAXChartNamespace");
        v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v22 = (_xmlNode *)OCXFindChild(v19, v21, "pictureFormat");

        if (v22)
        {
          v81 = 0;
          v23 = CXOptionalStringAttribute(v22, (void *)CXNoNamespace, (xmlChar *)"val", &v81);
          v24 = v81;
          v25 = v24;
          if (v23
            && ((objc_msgSend(v24, "isEqualToString:", CFSTR("stackScale")) & 1) != 0
             || objc_msgSend(v25, "isEqualToString:", CFSTR("stack"))))
          {
            v26 = objc_alloc_init(OADTileTechnique);
            objc_msgSend(v16, "setTechnique:", v26);

          }
        }
        else
        {
          v25 = 0;
        }

      }
    }
  }
  objc_msgSend(v6, "setGraphicProperties:", v13);
  objc_msgSend(v5, "drawingState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "OAXChartNamespace");
  v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v29 = OCXFindChild(a3, v28, "val");

  if (v29
    || (objc_msgSend(v5, "drawingState"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v30, "OAXChartNamespace"),
        v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v29 = OCXFindChild(a3, v31, "yVal"),
        v31,
        v30,
        v29))
  {
    +[CHXData chdDataFromXmlDataElement:state:](CHXData, "chdDataFromXmlDataElement:state:", v29, v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValueData:", v32);
    objc_msgSend(v32, "dataValues");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (!v34)
      objc_msgSend(v6, "setHiddenFlag:", 1);

  }
  objc_msgSend(v5, "drawingState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "OAXChartNamespace");
  v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v37 = OCXFindChild(a3, v36, "cat");

  if (v37
    || (objc_msgSend(v5, "drawingState"),
        v38 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v38, "OAXChartNamespace"),
        v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v37 = OCXFindChild(a3, v39, "xVal"),
        v39,
        v38,
        v37))
  {
    +[CHXData chdDataFromXmlDataElement:state:](CHXData, "chdDataFromXmlDataElement:state:", v37, v5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategoryData:", v40);
  }
  else
  {
    objc_msgSend(v5, "resources");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHDData dataWithResources:](CHDData, "dataWithResources:", v40);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCategoryData:", v77);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "drawingState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "OAXChartNamespace");
    v42 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v43 = OCXFindChild(a3, v42, "bubbleSize");

    if (v43)
    {
      +[CHXData chdDataFromXmlDataElement:state:](CHXData, "chdDataFromXmlDataElement:state:", v43, v5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSizeData:", v44);

    }
  }
  v45 = OCXFirstChildNamed(a3, (xmlChar *)"dPt");
  while (v45)
  {
    +[CHXDataValueProperties readFrom:state:](CHXDataValueProperties, "readFrom:state:", v45, v5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataValuePropertiesCollection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v46);

    v45 = OCXNextSiblingNamed(v45, (xmlChar *)"dPt");
  }
  objc_msgSend(v5, "drawingState");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "OAXChartNamespace");
  v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v50 = OCXFindChild(a3, v49, "dLbls");

  if (v50)
    goto LABEL_27;
  parent = a3->parent;
  objc_msgSend(v5, "drawingState");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "OAXChartNamespace");
  v53 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v50 = OCXFindChild(parent, v53, "dLbls");

  if (v50)
  {
LABEL_27:
    objc_msgSend(v6, "dataValuePropertiesCollection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHXDataLabel readFrom:dataValuePropertiesCollection:state:](CHXDataLabel, "readFrom:dataValuePropertiesCollection:state:", v50, v54, v5);

  }
  v55 = OCXFirstChildNamed(a3, (xmlChar *)"errBars");
  if (v55)
  {
    +[CHXErrorBar chdErrorBarFromXmlErrorBarElement:state:](CHXErrorBar, "chdErrorBarFromXmlErrorBarElement:state:", v55, v5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setErrorBar:", v56);
    v57 = OCXNextSiblingNamed(v55, (xmlChar *)"errBars");
    if (v57)
    {
      +[CHXErrorBar chdErrorBarFromXmlErrorBarElement:state:](CHXErrorBar, "chdErrorBarFromXmlErrorBarElement:state:", v57, v5);
      v58 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v58;
      objc_msgSend(v6, "setErrorBar:", v58);
    }

  }
  v59 = OCXFirstChildNamed(a3, (xmlChar *)"trendline");
  while (v59)
  {
    +[CHXTrendline chdTrendlineFromXmlTrendlineElement:state:](CHXTrendline, "chdTrendlineFromXmlTrendlineElement:state:", v59, v5);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trendlineCollection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v60);

    v59 = OCXNextSiblingNamed(v59, (xmlChar *)"trendline");
  }
  objc_msgSend(v5, "drawingState");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "OAXChartNamespace");
  v63 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v64 = (_xmlNode *)OCXFindChild(a3, v63, "tx");

  if (v64)
  {
    objc_msgSend(v5, "drawingState");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "OAXChartNamespace");
    v66 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v67 = OCXFindChild(v64, v66, "strRef");

    if (v67)
    {
      v79 = 0;
      v80 = 0;
      +[CHXString readFromXmlTxElement:formula:lastCached:state:](CHXString, "readFromXmlTxElement:formula:lastCached:state:", v64, &v80, &v79, v5);
      v68 = (EDValue *)v80;
      v69 = v79;
      if (v68)
        objc_msgSend(v6, "setName:", v68);
      if (v69)
      {
        objc_msgSend(v69, "string");
        v70 = (EDValue *)objc_claimAutoreleasedReturnValue();
        EDValue::makeWithNSString(v70, (uint64_t)&v78);

        v71 = -[CHDDataValue initWithIndex:value:]([CHDDataValue alloc], "initWithIndex:value:", -1, &v78);
        objc_msgSend(v6, "setLastCachedName:", v71);

        EDValue::~EDValue(&v78);
      }

      goto LABEL_43;
    }
    objc_msgSend(v5, "drawingState");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "OAXChartNamespace");
    v73 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v74 = OCXFindChild(v64, v73, "v");

    if (v74)
    {
      v68 = (EDValue *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v74);
      EDValue::makeWithNSString(v68, (uint64_t)&v78);
      v75 = -[CHDDataValue initWithIndex:value:]([CHDDataValue alloc], "initWithIndex:value:", -1, &v78);
      objc_msgSend(v6, "setLastCachedName:", v75);

      EDValue::~EDValue(&v78);
LABEL_43:

    }
  }

  return v6;
}

+ (Class)chxSeriesClassWithState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "currentChartType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              objc_opt_isKindOfClass();
            }
          }
        }
      }
    }
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v4;
  CHDSeries *v5;
  void *v6;
  CHDSeries *v7;

  v4 = a4;
  v5 = [CHDSeries alloc];
  objc_msgSend(v4, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CHDSeries initWithChart:](v5, "initWithChart:", v6);

  return v7;
}

+ (void)resolveSeriesStyle:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  char v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  v5 = a4;
  objc_msgSend(v34, "graphicProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v34, "conformsToProtocol:", &unk_255B33708))
    {
      objc_msgSend(v5, "autoStyling");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", v6, objc_msgSend(v34, "styleIndex"), 1);

      objc_msgSend(v5, "autoStyling");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "marker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v34, "styleIndex");
      objc_msgSend(v5, "drawingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientChartGraphicPropertyDefaultsBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resolveMarker:withSeriesGraphicProperties:forSeriesIndex:clientGraphicPropertyDefaults:", v9, v6, v10, v12);

    }
    else
    {
      objc_msgSend(v5, "autoStyling");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resolveGraphicPropertiesOfSeries:forSeriesIndex:", v6, objc_msgSend(v34, "styleIndex"));
    }

  }
  objc_msgSend(v34, "dataValuePropertiesCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v14)
  {
    v16 = isKindOfClass;
    for (i = 0; i != v14; ++i)
    {
      objc_msgSend(v13, "objectAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "graphicProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v5, "autoStyling");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v16 & 1) != 0)
          v21 = objc_msgSend(v18, "dataValueIndex");
        else
          v21 = objc_msgSend(v34, "styleIndex");
        objc_msgSend(v20, "resolveGraphicPropertiesOfSeries:forSeriesIndex:", v19, v21);

      }
    }
  }
  objc_msgSend(v34, "errorBarXAxis");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v5, "autoStyling");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "graphicProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resolveGraphicPropertiesOfErrorBar:forSeriesIndex:", v24, objc_msgSend(v34, "styleIndex"));

  }
  objc_msgSend(v34, "errorBarYAxis");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v5, "autoStyling");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "graphicProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resolveGraphicPropertiesOfErrorBar:forSeriesIndex:", v27, objc_msgSend(v34, "styleIndex"));

  }
  objc_msgSend(v34, "trendlineCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");
  if (v29)
  {
    v30 = 0;
    do
    {
      objc_msgSend(v28, "objectAtIndex:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend(v5, "autoStyling");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "graphicProperties");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "resolveGraphicPropertiesOfTrendline:forSeriesIndex:", v33, objc_msgSend(v34, "styleIndex"));

      }
      ++v30;
    }
    while (v29 != v30);
  }

}

@end
