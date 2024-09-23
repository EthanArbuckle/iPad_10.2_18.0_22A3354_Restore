@implementation CHXReader

+ (id)readFromParentNode:(_xmlNode *)a3 drawingState:(id)a4
{
  OCXState *v6;
  void *v7;
  void *v8;
  void *v9;
  EDWorkbook *v10;
  void *v11;
  void *v12;
  OCPPackagePart *v13;
  EXReadState *v14;
  void *v15;
  xmlTextReader *v16;
  const xmlChar *v17;
  const xmlChar *v18;
  const xmlChar *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  EXReadState *v27;
  EXOfficeArtState *v28;
  void *v29;
  void *v30;
  void *v31;
  OCXState *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char isKindOfClass;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  EXReadState *v51;
  CHXReadState *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  id v61;
  void *v62;
  EXOfficeArtState *v64;
  void *v65;
  OCPPackagePart *v66;
  _xmlNode *v67;
  void *v68;
  void *context;
  void *v70;

  v6 = (OCXState *)a4;
  v70 = 0;
  context = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(a1, "chartPartWithParentNode:drawingState:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "externalDataRelationshipWithChartPart:drawingState:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v68 = v8;
  if (!v8)
  {
    v67 = a3;
    v14 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend(v8, "targetMode") == 1)
  {
    v10 = -[EDWorkbook initWithStringOptimization:]([EDWorkbook alloc], "initWithStringOptimization:", 1);
    -[OCXState packagePart](v6, "packagePart");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "package");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "mainDocumentPart");
    v13 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v67 = a3;
      v14 = objc_alloc_init(EXReadState);
      v65 = v12;
      v66 = v13;
      v64 = -[EXOfficeArtState initWithExcelState:]([EXOfficeArtState alloc], "initWithExcelState:", v14);
      -[EXReadState setOfficeArtState:](v14, "setOfficeArtState:", v64);
      -[EXReadState setWorkbook:](v14, "setWorkbook:", v10);
      +[EXWorksheet edSheetWithState:](EXWorksheet, "edSheetWithState:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDString edStringWithString:](EDString, "edStringWithString:", CFSTR("Sheet1"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setName:", v15);

      -[EDWorkbook addSheet:](v10, "addSheet:", v9);
      v16 = -[OCPPackagePart xmlReader](v13, "xmlReader");
      if (!v16)
        +[TCMessageException raise:](TCMessageException, "raise:", TCChartUnsupportedContent);
      if (xmlTextReaderRead(v16) != 1)
      {
        xmlFreeTextReader(v16);
        +[TCMessageException raise:](TCMessageException, "raise:", TCChartUnsupportedContent);
      }
      if (xmlTextReaderNodeType(v16) != 1
        || (v17 = xmlTextReaderConstLocalName(v16), !xmlStrEqual(v17, (const xmlChar *)"document"))
        && (v18 = xmlTextReaderConstLocalName(v16), !xmlStrEqual(v18, (const xmlChar *)"workbook"))
        && (v19 = xmlTextReaderConstLocalName(v16), !xmlStrEqual(v19, (const xmlChar *)"presentation")))
      {
        xmlFreeTextReader(v16);
        +[TCMessageException raise:](TCMessageException, "raise:", TCChartUnsupportedContent);
      }
      if (OCXIsStrictXmlFile(v16))
        -[EXReadState setupNSForXMLFormat:](v14, "setupNSForXMLFormat:", 1);
      xmlFreeTextReader(v16);
      OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v13, v6, (objc_selector *)sel_OCXThemeRelationshipType);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        -[OCDDocument theme](v10, "theme");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[EXReadState officeArtState](v14, "officeArtState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v20, v21, v22);

        -[OCDDocument theme](v10, "theme");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "baseStyles");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "colorScheme");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[EXReadState officeArtState](v14, "officeArtState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setColorScheme:", v25);

        if (v10)
        {
          if (v14)
            goto LABEL_22;
          goto LABEL_21;
        }
        goto LABEL_26;
      }

      v12 = v65;
      v13 = v66;
    }
    else
    {
      v9 = 0;
    }
    +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", TCChartUnsupportedContent);

    v60 = 0;
    goto LABEL_45;
  }
  objc_msgSend(a1, "externalDataWithChartPart:relationship:", v7, v9);
  v10 = (EDWorkbook *)objc_claimAutoreleasedReturnValue();
  v67 = a3;
  v14 = 0;
  v9 = 0;
  if (v10)
  {
LABEL_21:
    v27 = objc_alloc_init(EXReadState);
    -[EXReadState setupNSForXMLFormat:](v27, "setupNSForXMLFormat:", -[OCXState xmlFormat](v6, "xmlFormat"));
    v28 = -[EXOfficeArtState initWithExcelState:]([EXOfficeArtState alloc], "initWithExcelState:", v27);
    -[EXReadState setOfficeArtState:](v27, "setOfficeArtState:", v28);

    v14 = v27;
LABEL_22:
    -[EXReadState setCurrentSheetIndex:](v14, "setCurrentSheetIndex:", 0);
    -[EDWorkbook sheetAtIndex:loadIfNeeded:](v10, "sheetAtIndex:loadIfNeeded:", 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXReadState setCurrentSheet:](v14, "setCurrentSheet:", v29);

    -[EXReadState workbook](v14, "workbook");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      -[EXReadState setWorkbook:](v14, "setWorkbook:", v10);
    -[EDWorkbook resources](v10, "resources");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXReadState setResources:](v14, "setResources:", v31);

    -[EXReadState officeArtState](v14, "officeArtState");
    v32 = (OCXState *)objc_claimAutoreleasedReturnValue();
    -[OCXState styleMatrix](v6, "styleMatrix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState setStyleMatrix:](v32, "setStyleMatrix:", v33);

    -[OCXState colorScheme](v6, "colorScheme");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState setColorScheme:](v32, "setColorScheme:", v34);

    -[OCXState colorMap](v6, "colorMap");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState setColorMap:](v32, "setColorMap:", v35);

    -[OCXState fontScheme](v6, "fontScheme");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[OCXState fontScheme](v6, "fontScheme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[OCXState setFontScheme:](v32, "setFontScheme:", v37);
    }
    else
    {
      -[OCDDocument theme](v10, "theme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "baseStyles");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fontScheme");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[OCXState setFontScheme:](v32, "setFontScheme:", v40);

    }
    -[OCXState clearTargetBlipCollection](v32, "clearTargetBlipCollection");
    -[OCXState targetBlipCollection](v6, "targetBlipCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState setTargetBlipCollection:](v32, "setTargetBlipCollection:", v41);

    -[OCXState clientChartGraphicPropertyDefaultsBlock](v6, "clientChartGraphicPropertyDefaultsBlock");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState setClientChartGraphicPropertyDefaultsBlock:](v32, "setClientChartGraphicPropertyDefaultsBlock:", v42);

    -[OCXState client](v6, "client");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[OCXState client](v32, "client");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_38:
        -[OCXState client](v6, "client");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_41:

          goto LABEL_42;
        }
        -[OCXState client](v32, "client");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v49 = objc_opt_isKindOfClass();

        if ((v49 & 1) != 0)
        {
          -[OCXState client](v32, "client");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[OCXState client](v6, "client");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setAutoChartStrokeIsHollow:", objc_msgSend(v50, "chartAutoStrokeIsHollow"));

          goto LABEL_41;
        }
        goto LABEL_42;
      }
      -[OCXState client](v32, "client");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[OCXState client](v6, "client");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAutoChartFillIsHollow:", objc_msgSend(v46, "chartAutoFillIsHollow"));

    }
    goto LABEL_38;
  }
LABEL_26:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      v32 = 0;
      goto LABEL_42;
    }
    -[OCXState chxState](v6, "chxState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "drawingState");
    v32 = (OCXState *)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
LABEL_42:
  v51 = v14;
  v52 = -[CHXReadState initWithDrawingState:]([CHXReadState alloc], "initWithDrawingState:", v32);
  -[CHXReadState setChartPart:](v52, "setChartPart:", v7);
  -[OCXState excelState](v32, "excelState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "resources");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHXReadState setResources:](v52, "setResources:", v54);

  -[OCXState packagePart](v32, "packagePart");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState setPackagePart:](v32, "setPackagePart:", v7);
  +[CHXChart readFromXmlDocument:state:](CHXChart, "readFromXmlDocument:state:", objc_msgSend(v7, "xmlDocument"), v52);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[OCXState setPackagePart:](v32, "setPackagePart:", v55);
  if (v9)
    objc_msgSend(v9, "applyProcessors");
  objc_msgSend(v70, "setExternalData:", v10);

  -[OCXState client](v6, "client");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "readClientDataFromNode:toDrawable:state:", v67, v70, v6);

  -[OCXState packagePart](v6, "packagePart");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "package");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "resetPartForLocation:", v59);

  v60 = 1;
LABEL_45:
  objc_autoreleasePoolPop(context);
  if ((v60 & 1) != 0)
  {
    v61 = v70;
    v62 = v61;
  }
  else
  {
    v62 = 0;
    v61 = v70;
  }

  return v62;
}

+ (id)chartPartWithParentNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *v7;
  CXNamespace *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  objc_msgSend(v5, "OAXChartNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "chart");

  if (!v7)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v5, "OCXRelationshipsNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXRequiredStringAttribute(v7, v8, (xmlChar *)"id");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "packagePart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relationshipForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "package");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "partForLocation:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)externalDataWithChartPart:(id)a3 relationship:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  EXReader *v10;
  OCPZipPackage *v11;
  void *v12;
  OCPZipPackage *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "package");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partForLocation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[OCDReader initWithCancelDelegate:]([EXReader alloc], "initWithCancelDelegate:", 0);
    v11 = [OCPZipPackage alloc];
    objc_msgSend(v9, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[OCPZipPackage initWithData:](v11, "initWithData:", v12);

    -[OCXReader setZipPackage:](v10, "setZipPackage:", v13);
    +[TCProgressContext createStageWithSteps:takingSteps:](TCProgressContext, "createStageWithSteps:takingSteps:", 1.0, 0.0);
    if (!-[OCXReader start](v10, "start"))
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    -[EXReader read](v10, "read");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    objc_msgSend(v5, "package");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resetPartForLocation:", v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)readFromXmlDocument:(_xmlDoc *)a3 chartStyleId:(int)a4 drawingState:(id)a5
{
  uint64_t v5;
  id v7;
  uint64_t v8;
  EDWorkbook *v9;
  EDWorksheet *v10;
  void *v11;
  EXReadState *v12;
  EXOfficeArtState *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CHXReadState *v33;
  void *v34;
  void *v35;
  void *context;
  _xmlDoc *v38;
  void *v39;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = MEMORY[0x22E2DDB58]();
  v9 = -[EDWorkbook initWithStringOptimization:]([EDWorkbook alloc], "initWithStringOptimization:", 1);
  context = (void *)v8;
  v38 = a3;
  v10 = -[EDSheet initWithWorkbook:]([EDWorksheet alloc], "initWithWorkbook:", v9);
  +[EDString edStringWithString:](EDString, "edStringWithString:", CFSTR("Sheet1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSheet setName:](v10, "setName:", v11);

  -[EDWorkbook addSheet:](v9, "addSheet:", v10);
  v12 = objc_alloc_init(EXReadState);
  v13 = -[EXOfficeArtState initWithExcelState:]([EXOfficeArtState alloc], "initWithExcelState:", v12);
  -[EXReadState setOfficeArtState:](v12, "setOfficeArtState:", v13);
  -[EXReadState setWorkbook:](v12, "setWorkbook:", v9);
  -[EDWorkbook resources](v9, "resources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXReadState setResources:](v12, "setResources:", v14);

  -[EXReadState setCurrentSheetIndex:](v12, "setCurrentSheetIndex:", 0);
  -[EDWorkbook sheetAtIndex:loadIfNeeded:](v9, "sheetAtIndex:loadIfNeeded:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXReadState setCurrentSheet:](v12, "setCurrentSheet:", v15);

  objc_msgSend(v7, "styleMatrix");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setStyleMatrix:](v13, "setStyleMatrix:", v16);

  objc_msgSend(v7, "colorScheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setColorScheme:](v13, "setColorScheme:", v17);

  objc_msgSend(v7, "colorMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setColorMap:](v13, "setColorMap:", v18);

  objc_msgSend(v7, "fontScheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setFontScheme:](v13, "setFontScheme:", v19);

  objc_msgSend(v7, "client");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[OAXDrawingState client](v13, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_5;
    -[OAXDrawingState client](v13, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAutoChartFillIsHollow:", objc_msgSend(v23, "chartAutoFillIsHollow"));

  }
LABEL_5:
  objc_msgSend(v7, "client");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[OAXDrawingState client](v13, "client");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = objc_opt_isKindOfClass();

  if ((v26 & 1) != 0)
  {
    -[OAXDrawingState client](v13, "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAutoChartStrokeIsHollow:", objc_msgSend(v27, "chartAutoStrokeIsHollow"));

    goto LABEL_8;
  }
LABEL_9:
  -[OCDDocument theme](v9, "theme");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "baseStyles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "styleMatrix");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStyleMatrix:", v30);

  objc_msgSend(v7, "colorScheme");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setColorScheme:", v31);

  objc_msgSend(v7, "fontScheme");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFontScheme:", v32);

  v33 = -[CHXReadState initWithDrawingState:]([CHXReadState alloc], "initWithDrawingState:", v13);
  -[CHXReadState setIgnoreFormulas:](v33, "setIgnoreFormulas:", 1);
  -[EXOfficeArtState excelState](v13, "excelState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "resources");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHXReadState setResources:](v33, "setResources:", v35);

  +[CHXChart readFromXmlDocument:chartStyleId:state:](CHXChart, "readFromXmlDocument:chartStyleId:state:", v38, v5, v33);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setExternalData:", v9);
  objc_autoreleasePoolPop(context);

  return v39;
}

+ (id)externalDataRelationshipWithChartPart:(id)a3 drawingState:(id)a4
{
  id v5;
  id v6;
  _xmlDoc *v7;
  _xmlNode *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  CXNamespace *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = (_xmlDoc *)objc_msgSend(v5, "xmlDocument");
  if (!v7)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v8 = OCXGetRootElement(v7);
  objc_msgSend(v6, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(v8, v9, "externalData");

  if (v10)
  {
    objc_msgSend(v6, "OCXRelationshipsNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXRequiredStringAttribute(v10, v11, (xmlChar *)"id");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "relationshipForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
