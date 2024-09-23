@implementation EXSheet

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  void *v18;
  EXSheetContext *v19;
  void *v20;
  EXSheetContext *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;

  v6 = a4;
  objc_msgSend(v6, "resetForNewSheet");
  objc_msgSend(v6, "workbookPart");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OCXReadRequiredRelationshipForNode:packagePart:", a3, v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "package");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v7, "targetLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "partForLocation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relativeString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v29);
  v12 = v29;
  v13 = (void *)objc_msgSend(a1, "exSheetClassFromXmlSheetType:location:", v12, v26);
  if (v13)
  {
    objc_msgSend(v6, "setCurrentPart:", v10);
    objc_msgSend(v13, "edSheetWithState:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v28);
    v24 = v28;
    if (v15)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setName:", v16);

    }
    v27 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"state", &v27);
    v17 = v27;
    v18 = v17;
    if (v17
      && ((objc_msgSend(v17, "isEqualToString:", CFSTR("hidden")) & 1) != 0
       || objc_msgSend(v18, "isEqualToString:", CFSTR("veryHidden"))))
    {
      objc_msgSend(v14, "setHidden:", 1);
    }
    v19 = [EXSheetContext alloc];
    objc_msgSend(v7, "targetLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[EXSheetContext initWithSheetLocation:sheetXmlType:state:](v19, "initWithSheetLocation:sheetXmlType:state:", v20, v12, v6);

    objc_msgSend(v14, "setDelayedContext:", v21);
    objc_msgSend(v6, "workbook");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSheet:", v14);

    objc_msgSend(v6, "setCurrentSheet:", v14);
    objc_msgSend(v13, "readTables:", v6);
    objc_msgSend(v6, "setCurrentSheet:", 0);
    objc_msgSend(v6, "setCurrentPart:", 0);
    objc_msgSend(v7, "targetLocation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetPartForLocation:", v23);

  }
}

+ (Class)exSheetClassFromXmlSheetType:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("chartsheets")) & 1) == 0
      && (objc_msgSend(v7, "hasPrefix:", CFSTR("worksheets")) & 1) == 0
      && objc_msgSend(v7, "rangeOfString:", CFSTR("/worksheets")) == 0x7FFFFFFFFFFFFFFFLL
      && (objc_msgSend(v7, "hasPrefix:", CFSTR("dialogsheets")) & 1) == 0
      && (objc_msgSend(v7, "hasPrefix:", CFSTR("macrosheets")) & 1) == 0
      && (objc_msgSend(v7, "hasPrefix:", CFSTR("basics")) & 1) == 0
      && (!objc_msgSend(v7, "hasSuffix:", CFSTR(".xml"))
       || objc_msgSend(v7, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL))
    {
      goto LABEL_7;
    }
LABEL_18:
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("work")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("chartsheet")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("macrosheet")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("dialogsheet")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("basic")))
  {
    goto LABEL_18;
  }
LABEL_7:
  v8 = 0;
LABEL_19:

  return (Class)v8;
}

+ (void)readDelayedSheeWithLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  xmlTextReader *v16;
  OCXSStream *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x22E2DDB58]();
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read sheet"), 3.0, 1.0);
  objc_msgSend(v9, "resetForNewSheet");
  objc_msgSend(v9, "workbookPart");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "package");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  if (!v11)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v11, "partForLocation:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v12;
  if (!v12)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relativeString");
  v14 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)v14;
  v15 = (void *)objc_msgSend(a1, "exSheetClassFromXmlSheetType:location:", v8, v14);
  if (v15)
  {
    objc_msgSend(v9, "setCurrentPart:", v24);
    objc_msgSend(v15, "readOtherSheetComponentsWithState:", v9);
    v16 = (xmlTextReader *)objc_msgSend(v24, "xmlReader");
    if (!v16)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read common sheet elements outer"), 1.0, 1.0);
    v17 = objc_alloc_init(OCXSStream);
    v18 = xmlTextReaderDepth(v16);
    -[OCXSStream pushLevel:name:](v17, "pushLevel:name:", v18, xmlTextReaderConstLocalName(v16));
    v19 = -1;
    while (+[OCXStreamUtility readStream:streamState:](OCXStreamUtility, "readStream:streamState:", v16, v17))
    {
      +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read common sheet elements inner"), 2.0, (double)ldexp(1.0, v19));
      if ((objc_msgSend(v15, "readDistinctSheetElementsFrom:state:", v16, v9) & 1) == 0)
        objc_msgSend(a1, "readCommonSheetElementsFrom:state:", v16, v9);
      --v19;
      +[TCProgressContext endStage](TCProgressContext, "endStage");
    }
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(a1, "readAllDrawablesWithState:", v9);
    objc_msgSend(v9, "currentSheet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXFormula applyArrayedFormulasToSheet:state:](EXFormula, "applyArrayedFormulasToSheet:state:", v20, v9);

    objc_msgSend(v9, "setCurrentPart:", 0);
    objc_msgSend(v23, "resetPartForLocation:", v25);
    +[TCProgressContext endStage](TCProgressContext, "endStage");
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }

  if (v16)
    xmlFreeTextReader(v16);

  objc_autoreleasePoolPop(v10);
}

+ (void)readCommonSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  id v6;
  const xmlChar *v7;
  _xmlNode *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = xmlTextReaderConstLocalName(a3);
  if (v7)
    v8 = xmlTextReaderExpand(a3);
  else
    v8 = 0;
  if (xmlStrEqual(v7, (const xmlChar *)"sheetProtection") && v8)
  {
    v13 = 0;
    v9 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"password", &v13);
    v10 = v13;
    if (v9)
      objc_msgSend(v6, "reportWarning:", ECPasswordProtectedSheet);

  }
  if (xmlStrEqual(v7, (const xmlChar *)"headerFooter"))
  {
    objc_msgSend(v6, "currentSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXHeaderFooter edHeaderFooterFromXmlHeaderFooterElement:state:](EXHeaderFooter, "edHeaderFooterFromXmlHeaderFooterElement:state:", v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHeaderFooter:", v12);
LABEL_15:

    goto LABEL_16;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"pageMargins"))
  {
    objc_msgSend(v6, "currentSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXPageSetup edPageMarginsFrom:state:](EXPageSetup, "edPageMarginsFrom:state:", v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageSetup:", v12);
    goto LABEL_15;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"pageSetup"))
  {
    objc_msgSend(v6, "currentSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXPageSetup edPageSetupFrom:state:](EXPageSetup, "edPageSetupFrom:state:", v8, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageSetup:", v12);
    goto LABEL_15;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"sheetPr"))
  {
    objc_msgSend(a1, "readSheetProperties:state:", v8, v6);
  }
  else if (xmlStrEqual(v7, (const xmlChar *)"legacyDrawing"))
  {
    objc_msgSend(a1, "readLegacyDrawablesWithState:", v6);
  }
LABEL_16:

}

+ (void)readAllDrawablesWithState:(id)a3
{
  void *v4;
  unsigned int i;
  unsigned int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "legacyDrawables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readDrawablesWithState:", v11);
  for (i = 0; ; i = v6 + 1)
  {
    v6 = i;
    if (objc_msgSend(v4, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v4, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oavState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDualDrawable:", v7);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v11, "currentSheet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addDrawable:", v7);

    }
  }

}

+ (void)readDrawablesWithState:(id)a3
{
  OCPPackagePart *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  OCXState *v12;

  v12 = (OCXState *)a3;
  -[OCXState currentPart](v12, "currentPart");
  v3 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v3, v12, (objc_selector *)sel_OCXDrawingRelationshipType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[OCPPackagePart package](v3, "package");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || objc_msgSend(v5, "count") != 1)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partForLocation:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    +[EXDrawing readFromPart:state:](EXDrawing, "readFromPart:state:", v9, v12);
    objc_msgSend(v5, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetPartForLocation:", v11);

  }
}

+ (void)readLegacyDrawablesWithState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int i;
  void *v8;
  void *v9;
  void *v10;
  _xmlDoc *v11;
  xmlNodePtr v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "currentPart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relationshipsByType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/vmlDrawing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "package");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v18 = v3;
    objc_msgSend(v20, "legacyDrawables");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(v5, "count") > (unint64_t)i; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "targetLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "partForLocation:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v11 = +[OAVDrawable vmlDocumentFromPart:](OAVDrawable, "vmlDocumentFromPart:", v10);
      if (!v11)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      v12 = OCXGetRootElement(v11);
      if (!v12)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      objc_msgSend(v20, "oavState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPackagePart:", v10);
      objc_msgSend(v20, "EXSpreadsheetDrawingNamespace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAVDrawable readDrawablesFromParent:inNamespace:state:](OAVDrawable, "readDrawablesFromParent:inNamespace:state:", v12, v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v15);

      objc_msgSend(v5, "objectAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "targetLocation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resetPartForLocation:", v17);

      xmlFreeDoc(v11);
    }

    v3 = v18;
  }

}

+ (void)readSheetProperties:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  objc_msgSend(v5, "EXSpreadsheetMLNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "pageSetUpPr");

  if (v7)
  {
    v11 = 0;
    if (CXOptionalBoolAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"fitToPage", &v11))
    {
      v8 = objc_opt_class();
      objc_msgSend(v5, "currentSheet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v8, (uint64_t)v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setFitToPage:", v11);
    }
  }

}

@end
