@implementation CHXData

+ (id)chdDataFromXmlDataElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  _xmlNode *i;
  void *v9;
  CXNamespace *v10;
  void *v11;
  CXNamespace *v12;
  int v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  BOOL HasName;
  void *v24;
  CXNamespace *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  CXNamespace *v29;
  uint64_t v30;
  void *v31;
  CXNamespace *v32;
  uint64_t v33;
  void *v34;
  CXNamespace *v35;
  uint64_t v36;
  void *v37;
  CXNamespace *v38;
  _BOOL4 v39;
  void *v40;
  void *v42;
  id v43;

  v6 = a4;
  objc_msgSend(v6, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDData dataWithResources:](CHDData, "dataWithResources:", v7);
  v43 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(v6, "exState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
    {
      if (!i)
      {
        objc_msgSend(v43, "dataValues");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "finishReading");

        goto LABEL_22;
      }
      objc_msgSend(v6, "drawingState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "OAXChartNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      if (CXNodeHasName(i, v10, (xmlChar *)"numRef"))
        goto LABEL_7;
      objc_msgSend(v6, "drawingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "OAXChartNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      if (CXNodeHasName(i, v12, (xmlChar *)"strRef"))
        break;
      objc_msgSend(v6, "drawingState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "OAXChartNamespace");
      v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      HasName = CXNodeHasName(i, v22, (xmlChar *)"multiLvlStrRef");

      if (!HasName)
      {
        objc_msgSend(v6, "drawingState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "OAXChartNamespace");
        v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v26 = CXNodeHasName(i, v25, (xmlChar *)"numLit");

        if (v26)
        {
          objc_msgSend(a1, "readNumDataFromXmlNumDataElement:data:state:", i, v43, v6);
        }
        else
        {
          objc_msgSend(v6, "drawingState");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "OAXChartNamespace");
          v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v39 = CXNodeHasName(i, v38, (xmlChar *)"strLit");

          if (v39)
            objc_msgSend(a1, "readStrDataFromXmlStrDataElement:data:state:", i, v43, v6);
        }
        continue;
      }
LABEL_8:
      v13 = objc_msgSend(v6, "ignoreFormulas", v42);
      if ((objc_msgSend(v6, "ignoreFormulas") & 1) == 0)
      {
        objc_msgSend(v6, "drawingState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "OAXChartNamespace");
        v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v16 = OCXFindRequiredChild(i, v15, (xmlChar *)"f");

        +[EXFormula edFormulaFromXmlFormulaElement:formulaClass:state:](EXFormula, "edFormulaFromXmlFormulaElement:formulaClass:state:", v16, objc_opt_class(), v42);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "workbook");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setWorkbook:", v18);

        objc_msgSend(v6, "chart");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFormula:chart:", v17, v19);

        objc_msgSend(v17, "originalFormulaString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "rangeOfString:", CFSTR("#REF")) == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          v27 = objc_msgSend(v20, "rangeOfString:", CFSTR("'#REF'"));

          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
            continue;
        }
LABEL_17:
        objc_msgSend(v6, "drawingState");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "OAXChartNamespace");
        v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v30 = OCXFindChild(i, v29, "strCache");

        objc_msgSend(a1, "readStrDataFromXmlStrDataElement:data:state:", v30, v43, v6);
        objc_msgSend(v6, "drawingState");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "OAXChartNamespace");
        v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v33 = OCXFindChild(i, v32, "multiLvlStrCache");

        objc_msgSend(a1, "readStrDataFromXmlMultiLevelStrDataElement:data:state:", v33, v43, v6);
        objc_msgSend(v6, "drawingState");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "OAXChartNamespace");
        v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v36 = OCXFindChild(i, v35, "numCache");

        objc_msgSend(a1, "readNumDataFromXmlNumDataElement:data:state:", v36, v43, v6);
        continue;
      }
      if (v13)
        goto LABEL_17;
    }

LABEL_7:
    goto LABEL_8;
  }
LABEL_22:

  return v43;
}

+ (void)readStrDataFromXmlStrDataElement:(_xmlNode *)a3 data:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *i;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  if (a3 && (objc_msgSend(a1, "isHiddenDataElement:data:state:", a3, v12, v8) & 1) == 0)
  {
    for (i = OCXFirstChildNamed(a3, (xmlChar *)"pt"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"pt"))
    {
      objc_msgSend(v12, "dataValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHXDataValue chdStringValueFromXmlDataValueElement:state:](CHXDataValue, "chdStringValueFromXmlDataValueElement:state:", i, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addDataValue:", v11);

    }
  }

}

+ (void)readStrDataFromXmlMultiLevelStrDataElement:(_xmlNode *)a3 data:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *v9;
  _xmlNode *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (a3)
  {
    if ((objc_msgSend(a1, "isHiddenDataElement:data:state:", a3, v11, v8) & 1) == 0)
    {
      v9 = OCXFirstChildNamed(a3, (xmlChar *)"lvl");
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = OCXNextSiblingNamed(v9, (xmlChar *)"lvl");
        }
        while (v9);
        objc_msgSend(a1, "readStrDataFromXmlStrDataElement:data:state:", v10, v11, v8);
      }
    }
  }

}

+ (void)readNumDataFromXmlNumDataElement:(_xmlNode *)a3 data:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *i;
  void *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  if (a3)
  {
    if ((objc_msgSend(a1, "isHiddenDataElement:data:state:", a3, v18, v8) & 1) == 0)
    {
      for (i = OCXFirstChildNamed(a3, (xmlChar *)"pt"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"pt"))
      {
        objc_msgSend(v18, "dataValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CHXDataValue chdNumberValueFromXmlDataValueElement:state:](CHXDataValue, "chdNumberValueFromXmlDataValueElement:state:", i, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addDataValue:", v11);

      }
      objc_msgSend(v8, "drawingState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "OAXChartNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v14 = OCXFindChild(a3, v13, "formatCode");

      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v14);
        +[EDString edStringWithString:](EDString, "edStringWithString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setContentFormat:", v17);
      }
    }
  }

}

+ (BOOL)isHiddenDataElement:(_xmlNode *)a3 data:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  unint64_t v15;

  v7 = a4;
  objc_msgSend(a5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "ptCount");

  v15 = 0;
  if (v10
    && ((v11 = CXOptionalUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15), !v15)
      ? (v12 = v11)
      : (v12 = 0),
        v12))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v7, "setDataValueIndexCount:");
    v13 = 0;
  }

  return v13;
}

@end
