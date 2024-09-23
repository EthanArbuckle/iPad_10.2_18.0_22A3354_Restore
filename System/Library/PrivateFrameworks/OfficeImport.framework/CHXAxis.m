@implementation CHXAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  void *v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CXNamespace *v25;
  _xmlNode *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  CXNamespace *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  CXNamespace *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  CXNamespace *v40;
  uint64_t v41;
  void *v42;
  CXNamespace *v43;
  _xmlNode *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  CXNamespace *v48;
  _xmlNode *v49;
  void *v50;
  CXNamespace *v51;
  uint64_t v52;
  OADTextBody *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  int v61;
  void *v62;
  float v63;
  float v64;
  double v65;
  void *v67;
  CXNamespace *v68;
  uint64_t v69;
  OADGraphicProperties *v70;
  void *v71;
  void *v72;
  void *v73;
  CXNamespace *v74;
  uint64_t v75;
  OADGraphicProperties *v76;
  void *v77;
  void *v78;
  OADGraphicProperties *v79;
  void *v80;
  void *v81;
  void *v82;
  char isKindOfClass;
  void *v84;
  double v86;
  id v87;

  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "chxAxisClassWithXmlAxisElement:state:", a3, v6);
  if (v7)
  {
    objc_msgSend(v7, "chdAxisFromXmlAxisElement:state:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "drawingState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OAXChartNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = OCXFindRequiredChild(a3, v10, (xmlChar *)"axId");

    objc_msgSend(v8, "setAxisId:", CXRequiredUnsignedLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    objc_msgSend(v6, "drawingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "OAXChartNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = (_xmlNode *)OCXFindChild(a3, v13, "delete");

    if (v14)
    {
      objc_msgSend(v8, "setDeleted:", CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
    }
    else
    {
      objc_msgSend(v6, "drawingState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setDeleted:", objc_msgSend(v16, "hasPrefix:", CFSTR("12.")) ^ 1);
    }
    objc_msgSend(v6, "drawingState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "OAXChartNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = OCXFindRequiredChild(a3, v18, (xmlChar *)"scaling");

    objc_msgSend(a1, "readScalingFromXmlScalingElement:axis:state:", v19, v8, v6);
    objc_msgSend(v8, "setAxisPosition:", objc_msgSend(a1, "chdAxisPositionFromXmlAxisElement:state:", a3, v6));
    objc_msgSend(v6, "drawingState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "OAXChartNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(a3, v21, "title");

    if (v22)
    {
      +[CHXTitle chdTitleFromXmlTitleElement:isChartTitle:state:](CHXTitle, "chdTitleFromXmlTitleElement:isChartTitle:state:", v22, 0, v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v23);

    }
    objc_msgSend(v6, "drawingState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "OAXChartNamespace");
    v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v26 = (_xmlNode *)OCXFindChild(a3, v25, "numFmt");

    if (v26)
    {
      v87 = 0;
      v27 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v87);
      v28 = v87;
      if (v27)
      {
        +[EDString edStringWithString:](EDString, "edStringWithString:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setContentFormat:", v30);
      }
      v86 = 0.0;
      if (CXOptionalDoubleAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v86))
        objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", v86 == 1.0, v86);

    }
    objc_msgSend(v6, "drawingState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "OAXChartNamespace");
    v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v33 = OCXFindChild(a3, v32, "majorTickMark");

    if (v33)
      v34 = objc_msgSend(a1, "chdTickMarkFromXmlTickMarkElement:", v33);
    else
      v34 = 2;
    objc_msgSend(v8, "setMajorTickMark:", v34);
    objc_msgSend(v6, "drawingState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "OAXChartNamespace");
    v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v37 = OCXFindChild(a3, v36, "minorTickMark");

    if (v37)
      v38 = objc_msgSend(a1, "chdTickMarkFromXmlTickMarkElement:", v37);
    else
      v38 = 0;
    objc_msgSend(v8, "setMinorTickMark:", v38);
    objc_msgSend(v6, "drawingState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "OAXChartNamespace");
    v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v41 = OCXFindChild(a3, v40, "tickLblPos");

    if (v41)
      objc_msgSend(v8, "setTickLabelPosition:", objc_msgSend(a1, "chdTickLabelPositionFromXmlTickLabelPositionElement:", v41));
    objc_msgSend(v6, "drawingState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "OAXChartNamespace");
    v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v44 = (_xmlNode *)OCXFindChild(a3, v43, "crossBetween");

    if (v44)
    {
      CXRequiredStringAttribute(v44, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "isEqualToString:", CFSTR("between")) & 1) != 0)
        v46 = 1;
      else
        v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("midCat")) ^ 1;
      objc_msgSend(v8, "setCrossBetween:", v46);

    }
    objc_msgSend(v8, "setCrosses:", objc_msgSend(a1, "chdCrossesFromXmlAxisElement:state:", a3, v6));
    objc_msgSend(v6, "drawingState");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "OAXChartNamespace");
    v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v49 = (_xmlNode *)OCXFindChild(a3, v48, "crossesAt");

    if (v49)
    {
      v86 = 0.0;
      if (CXOptionalDoubleAttribute(v49, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v86))
        objc_msgSend(v8, "setCrossesAt:", v86);
    }
    objc_msgSend(v6, "drawingState");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "OAXChartNamespace");
    v51 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v52 = OCXFindChild(a3, v51, "txPr");

    if (v52)
    {
      v53 = objc_alloc_init(OADTextBody);
      objc_msgSend(v6, "drawingState");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v52, v53, v54);

      +[CHXFont edFontWithOadTextBody:state:](CHXFont, "edFontWithOadTextBody:state:", v53, v6);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFont:", v55);
      if (-[OADTextBody paragraphCount](v53, "paragraphCount"))
      {
        -[OADTextBody firstParagraphEffects](v53, "firstParagraphEffects");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXEffect updateIncomingEffects:](OAXEffect, "updateIncomingEffects:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setLabelEffects:", v57);
      }
      -[OADTextBody properties](v53, "properties");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0.0;
      if (v58)
      {
        -[OADTextBody properties](v53, "properties");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "hasRotation");

        if (v61)
        {
          -[OADTextBody properties](v53, "properties");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "rotation");
          v64 = v63;
          v65 = v63;

          if (v64 > -1000.0 || v64 <= -1001.0)
            v59 = v65;
          else
            v59 = 0.0;
        }
      }
      objc_msgSend(v8, "setTickLabelRotationAngle:", v59);

    }
    objc_msgSend(v6, "drawingState");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "OAXChartNamespace");
    v68 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v69 = OCXFindChild(a3, v68, "minorGridlines");

    v70 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v70, v69, v6);
    if (!v69)
    {
      +[OADStroke nullStroke](OADStroke, "nullStroke");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties setStroke:](v70, "setStroke:", v71);

    }
    objc_msgSend(v6, "autoStyling");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "resolveMinorGridLinesGraphicProperties:", v70);

    objc_msgSend(v8, "setMinorGridLinesGraphicProperties:", v70);
    objc_msgSend(v6, "drawingState");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "OAXChartNamespace");
    v74 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v75 = OCXFindChild(a3, v74, "majorGridlines");

    v76 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v76, v75, v6);
    if (!v75)
    {
      +[OADStroke nullStroke](OADStroke, "nullStroke");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties setStroke:](v76, "setStroke:", v77);

    }
    objc_msgSend(v6, "autoStyling");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "resolveMajorGridLinesGraphicProperties:", v76);

    objc_msgSend(v8, "setMajorGridLinesGraphicProperties:", v76);
    v79 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v79, a3, v6);
    if (-[OADGraphicProperties hasStroke](v79, "hasStroke"))
    {
      -[OADGraphicProperties stroke](v79, "stroke");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v80, "isFillOverridden") & 1) != 0)
      {
        -[OADGraphicProperties stroke](v79, "stroke");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "fill");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v8, "setLineVisible:", 0);
      }
      else
      {

      }
    }
    objc_msgSend(v6, "autoStyling");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "resolveAxisGraphicProperties:", v79);

    objc_msgSend(v8, "setAxisGraphicProperties:", v79);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)readScalingFromXmlScalingElement:(_xmlNode *)a3 axis:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;
  double v19;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "max");

  if (v11)
  {
    v19 = 0.0;
    if (CXOptionalDoubleAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v19))
      objc_msgSend(v7, "setScalingMaximum:", v19);
  }
  objc_msgSend(v8, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "min");

  if (v14)
  {
    v19 = 0.0;
    if (CXOptionalDoubleAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v19))
      objc_msgSend(v7, "setScalingMinimum:", v19);
  }
  objc_msgSend(v8, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "orientation");

  if (v17)
  {
    CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("maxMin")))
    {
      objc_msgSend(v7, "setOrientation:", 1);
      objc_msgSend(v7, "setReverseOrder:", 1);
    }

  }
}

+ (int)chdTickLabelPositionFromXmlTickLabelPositionElement:(_xmlNode *)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  id v13;

  if (!a3)
    return 3;
  v13 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v13);
  v4 = v13;
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("high"));
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("low"));
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("nextTo"));
    v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("none"));
    if (v6)
      v10 = 2;
    else
      v10 = 3;
    if (v7)
      v10 = 1;
    if (v8)
      v10 = 3;
    if (v9)
      v11 = 0;
    else
      v11 = v10;
  }
  else
  {
    v11 = 3;
  }

  return v11;
}

+ (int)chdTickMarkFromXmlTickMarkElement:(_xmlNode *)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  id v12;

  if (!a3)
    return 3;
  v12 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v12);
  v4 = v12;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "isEqualToString:", CFSTR("cross"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("in"));
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("none"));
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("out"));
    if (v6)
      v9 = 1;
    else
      v9 = 3;
    if (v7)
      v9 = 0;
    if (v8)
      v10 = 2;
    else
      v10 = v9;
  }
  else
  {
    v10 = 3;
  }

  return v10;
}

+ (Class)chxAxisClassWithXmlAxisElement:(_xmlNode *)a3 state:(id)a4
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
  _BOOL4 v17;
  void *v18;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v7, (xmlChar *)"valAx");

  if (HasName)
    goto LABEL_5;
  objc_msgSend(v5, "drawingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "OAXChartNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = CXNodeHasName(a3, v10, (xmlChar *)"catAx");

  if (v11)
    goto LABEL_5;
  objc_msgSend(v5, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXNodeHasName(a3, v13, (xmlChar *)"dateAx");

  if (v14
    || (objc_msgSend(v5, "drawingState"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "OAXChartNamespace"),
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v17 = CXNodeHasName(a3, v16, (xmlChar *)"serAx"),
        v16,
        v15,
        v17))
  {
LABEL_5:
    objc_opt_class();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return (Class)v18;
}

+ (Class)chxAxisClassWithChdAxis:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (int)chdAxisPositionFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
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
  v7 = OCXFindRequiredChild(a3, v6, (xmlChar *)"axPos");

  CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("l")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("r")) & 1) != 0)
  {
    v9 = 2;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("t")))
  {
    v9 = 3;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)chdCrossesFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  CXNamespace *v6;
  _xmlNode *v7;
  void *v8;
  int v9;
  char v10;

  objc_msgSend(a4, "drawingState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "OAXChartNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "crosses");

  if (!v7)
    return 0;
  CXRequiredStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("autoZero")) & 1) == 0)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("min")) & 1) != 0)
    {
      v9 = 1;
      goto LABEL_6;
    }
    v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("max"));

    if ((v10 & 1) != 0)
      return 2;
    return 0;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

@end
