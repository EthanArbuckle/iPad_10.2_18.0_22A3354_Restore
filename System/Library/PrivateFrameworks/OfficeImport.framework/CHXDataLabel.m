@implementation CHXDataLabel

+ (void)readFrom:(_xmlNode *)a3 dataValuePropertiesCollection:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  OADGraphicProperties *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  void *v22;
  CXNamespace *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  CXNamespace *v28;
  _xmlNode *v29;
  uint64_t v30;
  id v31;
  OADGraphicProperties *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a4;
  v8 = a5;
  +[CHXFont readParagraphPropertiesFromXmlTextPropertiesParentElement:state:](CHXFont, "readParagraphPropertiesFromXmlTextPropertiesParentElement:state:", a3, v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "showLeaderLines");

  if (v11 && CXRequiredBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"))
  {
    objc_msgSend(v8, "drawingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "OAXChartNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = OCXFindChild(a3, v13, "leaderLines");

    if (v14)
    {
      v15 = objc_alloc_init(OADGraphicProperties);
      +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v15, v14, v8);
      v32 = v15;
    }
    else
    {
      v32 = 0;
    }
    v16 = 1;
    objc_msgSend(a1, "chdDataLabelFromXmlDataLabelElement:state:", a3, v8, v32);
  }
  else
  {
    v16 = 0;
    objc_msgSend(a1, "chdDataLabelFromXmlDataLabelElement:state:", a3, v8, 0);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setShowLeaderLines:", v16);
  if (v33)
    v17 = v16;
  else
    v17 = 0;
  if (v17 == 1)
    objc_msgSend(v35, "setLeaderlineGraphicProperties:", v33);
  objc_msgSend(v8, "currentSeries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDefaultDataLabel:", v35);

  objc_msgSend(v8, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "OAXChartNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "dLbl");

  while (v21)
  {
    objc_msgSend(v8, "drawingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "OAXChartNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = OCXFindChild(v21, v23, "spPr");

    if (!v24)
      objc_msgSend(v8, "pushDefaultTextProperties:", v34);
    objc_msgSend(a1, "chdDataLabelFromXmlDataLabelElement:state:", v21, v8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
      objc_msgSend(v8, "popDefaultTextProperties");
    objc_msgSend(v25, "setShowLeaderLines:", v16);
    if ((_DWORD)v16)
    {
      objc_msgSend(v35, "leaderlineGraphicProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLeaderlineGraphicProperties:", v26);

    }
    objc_msgSend(v8, "drawingState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "OAXChartNamespace");
    v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v29 = OCXFindRequiredChild(v21, v28, (xmlChar *)"idx");

    v30 = CXRequiredUnsignedLongAttribute(v29, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    objc_msgSend(v36, "objectWithKey:", v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v31 = objc_alloc_init((Class)objc_msgSend(a1, "chdDataValuePropertiesClassWithState:", v8));
      objc_msgSend(v31, "setDataValueIndex:", v30);
      objc_msgSend(v36, "addObject:", v31);
    }
    objc_msgSend(v31, "setDataLabel:", v25);
    v21 = OCXNextSiblingNamed(v21, (xmlChar *)"dLbl");

  }
}

+ (id)chdDataLabelFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OADGraphicProperties *v13;
  uint64_t v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  void *v21;
  CXNamespace *v22;
  _xmlNode *v23;
  void *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  void *v27;
  CXNamespace *v28;
  _xmlNode *v29;
  void *v30;
  CXNamespace *v31;
  _xmlNode *v32;
  void *v33;
  CXNamespace *v34;
  _xmlNode *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  CXNamespace *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  CXNamespace *v46;
  uint64_t v47;
  id v48;
  void *v49;
  CXNamespace *v50;
  _xmlNode *v51;
  void *v52;
  CXNamespace *v53;
  _xmlNode *v54;
  void *v55;
  CXNamespace *v56;
  uint64_t v57;
  id v59;
  id v60;
  double v61;
  id v62;

  v6 = a4;
  objc_msgSend(v6, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDDataLabel dataLabelWithResources:](CHDDataLabel, "dataLabelWithResources:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentSeries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultDataLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "currentSeries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultDataLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPosition:", objc_msgSend(v12, "position"));
    objc_msgSend(v8, "setShowValue:", objc_msgSend(v12, "isShowValue"));
    objc_msgSend(v8, "setShowPercent:", objc_msgSend(v12, "isShowPercent"));
    objc_msgSend(v8, "setShowBubbleSize:", objc_msgSend(v12, "isShowBubbleSize"));
    objc_msgSend(v8, "setShowCategoryName:", objc_msgSend(v12, "isShowCategoryName"));
    objc_msgSend(v8, "setShowSeriesName:", objc_msgSend(v12, "isShowSeriesName"));
    objc_msgSend(v8, "setShowLegendKey:", objc_msgSend(v12, "isShowLegendKey"));
    objc_msgSend(v8, "setIsPositionAffineTransform:", objc_msgSend(v12, "isPositionAffineTransform"));

  }
  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v13, a3, v6);
  objc_msgSend(v8, "setGraphicProperties:", v13);
  if (-[OADDrawableProperties hasOrientedBounds](v13, "hasOrientedBounds"))
    objc_msgSend(v8, "setIsPositionAffineTransform:", 1);
  if (-[OADDrawableProperties hasOrientedBounds](v13, "hasOrientedBounds"))
    v14 = 10;
  else
    v14 = objc_msgSend(a1, "chdDataLabelPositionFromXmlDataLabelElement:state:", a3, v6);
  objc_msgSend(v8, "setPosition:", v14);
  objc_msgSend(v6, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "showVal");

  if (v17)
    objc_msgSend(v8, "setShowValue:", CXRequiredBoolAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "showPercent");

  if (v20)
    objc_msgSend(v8, "setShowPercent:", CXRequiredBoolAttribute(v20, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "OAXChartNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = (_xmlNode *)OCXFindChild(a3, v22, "showBubbleSize");

  if (v23)
    objc_msgSend(v8, "setShowBubbleSize:", CXRequiredBoolAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "OAXChartNamespace");
  v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v26 = (_xmlNode *)OCXFindChild(a3, v25, "showCatName");

  if (v26)
    objc_msgSend(v8, "setShowCategoryName:", CXRequiredBoolAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "OAXChartNamespace");
  v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v29 = (_xmlNode *)OCXFindChild(a3, v28, "showLegendKey");

  if (v29)
    objc_msgSend(v8, "setShowLegendKey:", CXRequiredBoolAttribute(v29, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "OAXChartNamespace");
  v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v32 = (_xmlNode *)OCXFindChild(a3, v31, "showSerName");

  if (v32)
    objc_msgSend(v8, "setShowSeriesName:", CXRequiredBoolAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "OAXChartNamespace");
  v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v35 = (_xmlNode *)OCXFindChild(a3, v34, "numFmt");

  if (v35)
  {
    v62 = 0;
    v36 = CXOptionalStringAttribute(v35, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v62);
    v37 = v62;
    if (v36)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setContentFormat:", v39);
    }
    v61 = 0.0;
    if (CXOptionalDoubleAttribute(v35, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v61))
      objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", v61 == 1.0, v61);

  }
  objc_msgSend(v6, "drawingState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "OAXChartNamespace");
  v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v42 = OCXFindChild(a3, v41, "txPr");

  if (v42)
  {
    +[CHXString edStringFromXmlRichElement:state:](CHXString, "edStringFromXmlRichElement:state:", v42, v6);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (!v43)
    {
      +[CHXFont edRunCollectionFromXmlTextPropertiesElement:state:](CHXFont, "edRunCollectionFromXmlTextPropertiesElement:state:", v42, v6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        +[EDString string](EDString, "string");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setRuns:", v44);
      }
      else
      {
        v43 = 0;
      }

    }
    objc_msgSend(v8, "setString:", v43);
    goto LABEL_35;
  }
  objc_msgSend(v6, "drawingState");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "OAXChartNamespace");
  v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v47 = OCXFindChild(a3, v46, "tx");

  if (v47)
  {
    v59 = 0;
    v60 = 0;
    +[CHXString readFromXmlTxElement:formula:lastCached:state:](CHXString, "readFromXmlTxElement:formula:lastCached:state:", v47, &v60, &v59, v6);
    v43 = v60;
    v48 = v59;
    objc_msgSend(v8, "setString:", v48);

LABEL_35:
  }
  objc_msgSend(v6, "drawingState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "OAXChartNamespace");
  v50 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v51 = (_xmlNode *)OCXFindChild(a3, v50, "delete");

  if (v51 && CXRequiredBoolAttribute(v51, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"))
    objc_msgSend(v8, "setDeleted:", 1);
  objc_msgSend(v6, "drawingState");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "OAXChartNamespace");
  v53 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v54 = (_xmlNode *)OCXFindChild(a3, v53, "extLst");

  if (v54)
  {
    objc_msgSend(v6, "drawingState");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "OAXChartNamespace");
    v56 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v57 = OCXFindChild(v54, v56, "ext");

    if (v57)
      objc_msgSend(v8, "setExtensionDetected:", 1);
  }

  return v8;
}

+ (Class)chdDataValuePropertiesClassWithState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "currentChartType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (int)chdDataLabelPositionFromXmlDataLabelElement:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  CXNamespace *v6;
  _xmlNode *v7;
  void *v8;
  int v9;

  objc_msgSend(a4, "drawingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "OAXChartNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "dLblPos");

  if (!v7)
    return 0;
  CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bestFit")) & 1) != 0)
  {
    v9 = 9;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v9 = 6;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ctr")) & 1) != 0)
  {
    v9 = 3;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("inBase")) & 1) != 0)
  {
    v9 = 4;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("inEnd")) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("l")) & 1) != 0)
  {
    v9 = 7;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("outEnd")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("r")) & 1) != 0)
  {
    v9 = 8;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("t")))
  {
    v9 = 5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)stringFromDataLabelPosition:(int)a3
{
  if ((a3 - 1) > 9)
    return CFSTR("ctr");
  else
    return off_24F3A7920[a3 - 1];
}

@end
