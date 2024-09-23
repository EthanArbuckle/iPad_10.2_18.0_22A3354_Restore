@implementation CHXChart

+ (id)readFromXmlDocument:(_xmlDoc *)a3 state:(id)a4
{
  id v6;
  _xmlNode *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  unint64_t v11;
  _xmlNode *v12;
  _xmlNode *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;
  CXNamespace *v19;
  void *v20;

  v6 = a4;
  if (!a3)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v7 = OCXGetRootElement(a3);
  objc_msgSend(v6, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(v7, v9, "style");

  if (v10)
    goto LABEL_4;
  v12 = (_xmlNode *)OCXFindChild(v7, (CXNamespace *)OCXMarkupCompatibilityNamespace, "AlternateContent");
  v13 = v12;
  if (!v12)
    goto LABEL_11;
  v14 = (_xmlNode *)OCXFindChild(v12, (CXNamespace *)OCXMarkupCompatibilityNamespace, "Choice");
  if (v14)
  {
    objc_msgSend(v6, "drawingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "OAXChartNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlNode *)OCXFindChild(v14, v16, "style");

    if (v10)
      goto LABEL_4;
  }
  v17 = (_xmlNode *)OCXFindChild(v13, (CXNamespace *)OCXMarkupCompatibilityNamespace, "Fallback");
  if (!v17)
    goto LABEL_11;
  objc_msgSend(v6, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(v17, v19, "style");

  if (v10)
  {
LABEL_4:
    v11 = CXDefaultUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 2);
    if (v11 - 49 <= 0xFFFFFFFFFFFFFFCFLL)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  else
  {
LABEL_11:
    v11 = 2;
  }
  objc_msgSend(a1, "readFromXmlDocument:chartStyleId:state:", a3, v11, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)readFromXmlDocument:(_xmlDoc *)a3 chartStyleId:(int)a4 state:(id)a5
{
  uint64_t v5;
  id v8;
  _xmlNode *v9;
  CHDChart *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  void *v27;
  void *v28;
  void *v29;
  OADThemeOverrides *v30;
  void *v31;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  if (!a3)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v9 = OCXGetRootElement(a3);
  v10 = objc_alloc_init(CHDChart);
  -[CHDChart setStyleId:](v10, "setStyleId:", v5);
  objc_msgSend(v8, "setChart:", v10);
  objc_msgSend(v8, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "autoStyling");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v8, "autoStyling");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "drawingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoChartFillIsHollow:", objc_msgSend(v15, "chartAutoFillIsHollow"));

  }
LABEL_7:
  objc_msgSend(v8, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "client");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "autoStyling");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) == 0)
      goto LABEL_11;
    objc_msgSend(v8, "autoStyling");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "drawingState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutoChartStrokeIsHollow:", objc_msgSend(v20, "chartAutoStrokeIsHollow"));

  }
LABEL_11:
  -[CHDChart setLogicalBounds:](v10, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v8, "drawingState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "excelState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentSheet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHDChart setSheet:](v10, "setSheet:", v23);

  objc_msgSend(a1, "readDefaultTextPropertiesFromXmlNode:chart:state:", v9, v10, v8);
  objc_msgSend(v8, "drawingState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "OAXChartNamespace");
  v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v26 = OCXFindRequiredChild(v9, v25, (xmlChar *)"chart");

  objc_msgSend(a1, "readChartFromXmlNode:chart:state:", v26, v10, v8);
  +[CHXUserShapes readFromCharSpaceNode:state:](CHXUserShapes, "readFromCharSpaceNode:state:", v9, v8);
  objc_msgSend(v8, "chartPart");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "firstPartWithRelationshipOfType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/themeOverride"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = objc_alloc_init(OADThemeOverrides);
      objc_msgSend(v8, "drawingState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXThemeOverrides readFromPackagePart:toThemeOverrides:drawingState:](OAXThemeOverrides, "readFromPackagePart:toThemeOverrides:drawingState:", v29, v30, v31);

      -[CHDChart setThemeOverrides:](v10, "setThemeOverrides:", v30);
    }

  }
  return v10;
}

+ (void)readDefaultTextPropertiesFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a4;
  v7 = a5;
  objc_msgSend(v7, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDDefaultTextProperty defaultTextPropertyWithResources:](CHDDefaultTextProperty, "defaultTextPropertyWithResources:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDefaultTextType:", 2);
  objc_msgSend(v29, "defaultTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  +[CHXFont readParagraphPropertiesFromXmlTextPropertiesParentElement:state:](CHXFont, "readParagraphPropertiesFromXmlTextPropertiesParentElement:state:", a3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "txPr");

  objc_msgSend(v11, "setMergedWithParent:", 0);
  if ((objc_msgSend(v11, "hasLatinFont") & 1) == 0)
  {
    objc_msgSend(v7, "drawingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontScheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minorFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "latinFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setLatinFont:", v18);
  }
  objc_msgSend(v7, "setDefaultTextPropertiesHaveExplicitFontSize:", objc_msgSend(v11, "hasSize"));
  if ((objc_msgSend(v11, "hasSize") & 1) == 0)
  {
    LODWORD(v19) = 10.0;
    objc_msgSend(v11, "setSize:", v19);
  }
  if (!objc_msgSend(v11, "hasFill")
    || (objc_msgSend(v11, "fill"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v20,
        (isKindOfClass & 1) == 0))
  {
    objc_msgSend(v7, "autoStyling");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "autoTextFill");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setFill:", v23);
  }
  objc_msgSend(v11, "setMergedWithParent:", 1);
  objc_msgSend(v7, "setDefaultTextProperties:", v11);
  if (v14)
    +[CHXFont edRunCollectionFromXmlTextPropertiesElement:state:](CHXFont, "edRunCollectionFromXmlTextPropertiesElement:state:", v14, v7);
  else
    +[CHXFont defaultEdRunCollectionWithState:](CHXFont, "defaultEdRunCollectionWithState:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v29, "defaultTextProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allTextDefaultProperties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRuns:", v24);

    objc_msgSend(v29, "defaultTextProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allTextDefaultProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentFormatId:", 0);

  }
}

+ (void)readChartFromXmlNode:(_xmlNode *)a3 chart:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *parent;
  void *v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  OADGraphicProperties *v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  OADGraphicProperties *v18;
  void *v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  OADGraphicProperties *v23;
  void *v24;
  void *v25;
  CXNamespace *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CXNamespace *v30;
  _xmlNode *v31;
  void *v32;
  CXNamespace *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  CXNamespace *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  CXNamespace *v58;
  _xmlNode *v59;
  void *v60;
  CXNamespace *v61;
  uint64_t v62;
  void *v63;
  OADGraphicProperties *v65;
  id v66;

  v66 = a4;
  v7 = a5;
  parent = a3->parent;
  v65 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v65, parent, v7);
  objc_msgSend(v7, "autoStyling");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolveChartAreaGraphicProperties:", v65);

  objc_msgSend(v66, "setChartAreaGraphicProperties:", v65);
  objc_msgSend(v7, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "floor");

  v13 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v13, v12, v7);
  objc_msgSend(v7, "autoStyling");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolveFloorGraphicProperties:", v13);

  objc_msgSend(v66, "setFloorGraphicProperties:", v13);
  objc_msgSend(v7, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "backWall");

  v18 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v18, v17, v7);
  objc_msgSend(v7, "autoStyling");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resolveWallGraphicProperties:", v18);

  objc_msgSend(v66, "setBackWallGraphicProperties:", v18);
  objc_msgSend(v7, "drawingState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "OAXChartNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = OCXFindChild(a3, v21, "sideWall");

  v23 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v23, v22, v7);
  objc_msgSend(v7, "autoStyling");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resolveWallGraphicProperties:", v23);

  objc_msgSend(v66, "setSideWallGraphicProperties:", v23);
  objc_msgSend(v7, "drawingState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "OAXChartNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = OCXFindChild(a3, v26, "view3D");

  if (v27)
  {
    +[CHXView3D chdView3DFromXmlView3DElement:state:](CHXView3D, "chdView3DFromXmlView3DElement:state:", v27, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setView3D:", v28);

  }
  objc_msgSend(v7, "drawingState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "OAXChartNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v31 = OCXFindRequiredChild(a3, v30, (xmlChar *)"plotArea");

  if (!v31)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  +[CHXPlotArea readFrom:state:](CHXPlotArea, "readFrom:state:", v31, v7);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setPlotArea:");
  objc_msgSend(v7, "drawingState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "OAXChartNamespace");
  v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v34 = OCXFindChild(a3, v33, "legend");

  if (v34)
  {
    +[CHXLegend chdLegendFromXmlLegendElement:state:](CHXLegend, "chdLegendFromXmlLegendElement:state:", v34, v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setLegend:", v35);

  }
  objc_msgSend(v7, "drawingState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "OAXChartNamespace");
  v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v38 = OCXFindChild(a3, v37, "title");

  if (v38)
  {
    objc_msgSend(v66, "setAutoTitleDeleted:", 0);
    +[CHXTitle chdTitleFromXmlTitleElement:isChartTitle:state:](CHXTitle, "chdTitleFromXmlTitleElement:isChartTitle:state:", v38, 1, v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTitle:", v39);

    objc_msgSend(v66, "title");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isAutoGenerated");

    if (v41)
    {
      objc_msgSend(v66, "mainType");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resources");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "defaultTitleWithResources:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_msgSend(v66, "title");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setLastCachedName:", v44);

      }
    }
    objc_msgSend(v66, "title");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "lastCachedName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      objc_msgSend(v66, "title");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDString string](EDString, "string");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setLastCachedName:", v49);

    }
    objc_msgSend(v66, "title");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "lastCachedName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "runs");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
    {
      objc_msgSend(v66, "title");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lastCachedName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "title");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHXFont defaultEdRunCollectionForTitle:titleElement:state:](CHXFont, "defaultEdRunCollectionForTitle:titleElement:state:", v55, v38, v7);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setRuns:", v56);

    }
  }
  objc_msgSend(v7, "drawingState");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "OAXChartNamespace");
  v58 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v59 = (_xmlNode *)OCXFindChild(a3, v58, "plotVisOnly");

  if (v59)
    objc_msgSend(v66, "setPlotVisibleCellsOnly:", CXRequiredBoolAttribute(v59, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v7, "drawingState");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "OAXChartNamespace");
  v61 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v62 = OCXFindChild(a3, v61, "dispBlanksAs");

  objc_msgSend(v66, "setDisplayBlankAs:", objc_msgSend(a1, "chdDisplayBlanksAsEnumFromXmlElement:", v62));
}

+ (int)chdDisplayBlanksAsEnumFromXmlElement:(_xmlNode *)a3
{
  void *v3;
  int v4;

  if (a3)
  {
    CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("span")) & 1) != 0)
    {
      v4 = 1;
LABEL_10:

      return v4;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("gap")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zero")) & 1) != 0)
      {
        v4 = 2;
        goto LABEL_10;
      }
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    v4 = 0;
    goto LABEL_10;
  }
  return 0;
}

@end
