@implementation CHXString

+ (void)readFromXmlTxElement:(_xmlNode *)a3 formula:(id *)a4 lastCached:(id *)a5 state:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  _BOOL4 HasName;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CXNamespace *v23;
  uint64_t v24;
  _xmlNode *parent;
  void *v26;
  CXNamespace *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;

  v10 = a6;
  v11 = v10;
  *a4 = 0;
  *a5 = 0;
  if (!a3)
    goto LABEL_13;
  v31 = v10;
  objc_msgSend(v10, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v13, (xmlChar *)"tx");

  v11 = v31;
  if (!HasName)
    goto LABEL_13;
  objc_msgSend(v31, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "strRef");

  if (v17)
  {
    if ((objc_msgSend(v31, "ignoreFormulas") & 1) == 0)
    {
      objc_msgSend(a1, "chdFormulaFromXmlStrRefElement:state:", v17, v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v31, "drawingState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "OAXChartNamespace");
    v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v20 = OCXFindChild(v17, v19, "strCache");

    if (!v20)
      goto LABEL_11;
    objc_msgSend(a1, "edStringFromXmlStrCacheElement:state:", v20, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v31, "drawingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "OAXChartNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = OCXFindChild(a3, v23, "rich");

    if (!v24)
      goto LABEL_11;
    objc_msgSend(a1, "edStringFromXmlRichElement:state:", v24, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *a5 = v21;
LABEL_11:
  parent = a3->parent;
  objc_msgSend(v31, "drawingState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "OAXChartNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v28 = OCXFindChild(parent, v27, "txPr");

  v11 = v31;
  if (v28)
  {
    v29 = *a5;
    +[CHXFont edRunCollectionFromXmlTextPropertiesElement:state:](CHXFont, "edRunCollectionFromXmlTextPropertiesElement:state:", v28, v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setRuns:", v30);

    v11 = v31;
  }
LABEL_13:

}

+ (id)chdFormulaFromXmlStrRefElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindRequiredChild(a3, v7, (xmlChar *)"f");

  v9 = objc_opt_class();
  objc_msgSend(v5, "exState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EXFormula edFormulaFromXmlFormulaElement:formulaClass:state:](EXFormula, "edFormulaFromXmlFormulaElement:formulaClass:state:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workbook");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWorkbook:", v13);

  return v11;
}

+ (id)edStringFromXmlStrCacheElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  id v6;
  _xmlNode *i;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  for (i = OCXFirstChildNamed(a3, (xmlChar *)"pt"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"pt"))
  {
    objc_msgSend(v5, "drawingState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "OAXChartNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = OCXFindChild(i, v9, "v");

    if (v10)
    {
      +[EXString readStringWithAsciiCodeFromXmlStringElement:](EXString, "readStringWithAsciiCodeFromXmlStringElement:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v11);

    }
  }
  if (objc_msgSend(v6, "length"))
  {
    +[EDString edStringWithString:](EDString, "edStringWithString:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)edStringFromXmlRichElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  OADTextBody *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int i;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  OADTextBody *v25;
  unsigned int v26;
  EDRunsCollection *v27;
  id v28;

  v5 = a4;
  v6 = objc_alloc_init(OADTextBody);
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", a3, v6, v7);

  v28 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v27 = objc_alloc_init(EDRunsCollection);
  v8 = 0;
  v25 = v6;
  while (-[OADTextBody paragraphCount](v6, "paragraphCount", v25) > v8)
  {
    if (v8)
      objc_msgSend(v28, "appendString:", CFSTR("\n"));
    v26 = v8;
    -[OADTextBody paragraphAtIndex:](v6, "paragraphAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v11 + 1)
    {
      v11 = i;
      if (objc_msgSend(v9, "textRunCount") <= (unint64_t)i)
        break;
      objc_msgSend(v9, "textRunAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "properties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHXFont edFontWithOadCharacterProperties:state:](CHXFont, "edFontWithOadCharacterProperties:state:", v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v12, "properties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "effects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v5;

        +[OAXEffect updateIncomingEffects:](OAXEffect, "updateIncomingEffects:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v28, "length");
        objc_msgSend(v17, "resources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDRun runWithCharIndex:font:effects:resources:](EDRun, "runWithCharIndex:font:effects:resources:", v19, v14, v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDSortedCollection addObject:](v27, "addObject:", v21);

        v5 = v17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v12, "text");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "appendString:", v22);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v28, "appendString:", CFSTR("\n"));
      }

    }
    v6 = v25;
    v8 = v26 + 1;
  }
  if (objc_msgSend(v28, "length"))
  {
    +[EDString edStringWithString:](EDString, "edStringWithString:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EDCollection count](v27, "count"))
      objc_msgSend(v23, "setRuns:", v27);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
