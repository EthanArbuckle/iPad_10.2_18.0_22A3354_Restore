@implementation EXWorkbook

+ (void)setupProcessors:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());
  objc_msgSend(v3, "addProcessorClass:", objc_opt_class());

}

+ (void)readStylesFrom:(id)a3 state:(id)a4
{
  OCXState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _xmlDoc *v15;
  xmlNodePtr v16;
  _xmlNode *v17;
  CXNamespace *v18;
  uint64_t v19;
  CXNamespace *v20;
  uint64_t v21;
  CXNamespace *v22;
  uint64_t v23;
  CXNamespace *v24;
  uint64_t v25;
  CXNamespace *v26;
  uint64_t v27;
  CXNamespace *v28;
  uint64_t v29;
  CXNamespace *v30;
  uint64_t v31;
  CXNamespace *v32;
  uint64_t v33;
  CXNamespace *v34;
  uint64_t v35;
  CXNamespace *v36;
  uint64_t v37;
  OCPPackagePart *v38;

  v38 = (OCPPackagePart *)a3;
  v6 = (OCXState *)a4;
  -[OCPPackagePart package](v38, "package");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v38, v6, (objc_selector *)sel_OCXStylesRelationshipType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v10, "targetLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "partForLocation:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12
      || (objc_msgSend(v12, "contentType"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml")), v13, (v14 & 1) == 0))
    {
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    v15 = (_xmlDoc *)objc_msgSend(v12, "xmlDocument");
    if (!v15)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v16 = OCXGetRootElement(v15);
    v17 = v16;
    if (!v16 || !xmlStrEqual(v16->name, (const xmlChar *)"styleSheet"))
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = OCXFindChild(v17, v18, "colors");

    +[EXColorTable readFrom:state:](EXColorTable, "readFrom:state:", v19, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = OCXFindChild(v17, v20, "numFmts");

    +[EXContentFormatTable readFrom:state:](EXContentFormatTable, "readFrom:state:", v21, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v23 = OCXFindChild(v17, v22, "fonts");

    +[EXFontTable readFrom:state:](EXFontTable, "readFrom:state:", v23, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v25 = OCXFindChild(v17, v24, "fills");

    +[EXFillTable readFrom:state:](EXFillTable, "readFrom:state:", v25, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v27 = OCXFindChild(v17, v26, "borders");

    +[EXBordersTable readFrom:state:](EXBordersTable, "readFrom:state:", v27, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v29 = OCXFindChild(v17, v28, "cellXfs");

    +[EXCellFormatTable readFromCellXfsElement:state:](EXCellFormatTable, "readFromCellXfsElement:state:", v29, v6);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v31 = OCXFindChild(v17, v30, "cellStyleXfs");

    +[EXCellFormatTable readFromCellStyleXfsElement:state:](EXCellFormatTable, "readFromCellStyleXfsElement:state:", v31, v6);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v33 = OCXFindChild(v17, v32, "cellStyles");

    +[EXCellFormatTable readFromCellStylesElement:state:](EXCellFormatTable, "readFromCellStylesElement:state:", v33, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v35 = OCXFindChild(v17, v34, "dxfs");

    +[EXDifferentialStyleTable readFrom:state:](EXDifferentialStyleTable, "readFrom:state:", v35, v6);
    -[OCXState EXSpreadsheetMLNamespace](v6, "EXSpreadsheetMLNamespace");
    v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v37 = OCXFindChild(v17, v36, "tableStyles");

    +[EXTableStyleTable readFrom:state:](EXTableStyleTable, "readFrom:state:", v37, v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);

  }
  else
  {
    +[EXFontTable setDefaultWithState:](EXFontTable, "setDefaultWithState:", v6);
    +[EXFillTable setDefaultWithState:](EXFillTable, "setDefaultWithState:", v6);
    +[EXBordersTable setDefaultWithState:](EXBordersTable, "setDefaultWithState:", v6);
    +[EXCellFormatTable setDefaultWithState:](EXCellFormatTable, "setDefaultWithState:", v6);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 7.0);
  }
  objc_msgSend(a1, "setupDefaultTextStyleWithState:", v6);

}

+ (void)setupDefaultTextStyleWithState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;

  objc_msgSend(a3, "workbook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultTextStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "defaultProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDefaultParagraphProperties:", v5);

  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(v8, "propertiesForListLevel:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setDefaultParagraphProperties:", v7);

  }
}

+ (void)setDefaultParagraphProperties:(id)a3
{
  id v3;
  double v4;
  void *v5;
  id v6;

  v3 = a3;
  LODWORD(v4) = 11.0;
  v6 = v3;
  objc_msgSend(v3, "setSize:", v4);
  +[OADSolidFill blackFill](OADSolidFill, "blackFill");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFill:", v5);

  objc_msgSend(v6, "setLatinFont:", CFSTR("+mn-lt"));
  objc_msgSend(v6, "setEastAsianFont:", CFSTR("+mn-ea"));
  objc_msgSend(v6, "setBidiFont:", CFSTR("+mn-cs"));

}

+ (void)readStringsFrom:(id)a3 state:(id)a4
{
  OCXState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  OCPPackagePart *v14;

  v14 = (OCPPackagePart *)a3;
  v5 = (OCXState *)a4;
  -[OCPPackagePart package](v14, "package");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OCXPartRelationshipsByTypeWithFallback(v14, v5, (objc_selector *)sel_OCXSharedStringsRelationshipType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "targetLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partForLocation:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (objc_msgSend(v11, "contentType"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sharedStrings+xml")), v12, (v13 & 1) == 0))
    {
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    -[OCXState setCurrentPart:](v5, "setCurrentPart:", v11);
    +[EXStringTable readFromState:](EXStringTable, "readFromState:", v5);

  }
}

+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 fileName:(id)a6 temporaryDirectory:(id)a7 delegate:(id)a8 forThumbnail:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  objc_msgSend(a1, "edWorkbookFromState:package:reader:resourcesOnly:fileName:temporaryDirectory:delegate:forThumbnail:", a3, a4, a5, 0, a6, a7, a8, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)edWorkbookFromState:(id)a3 package:(id)a4 reader:(id)a5 resourcesOnly:(BOOL)a6 fileName:(id)a7 temporaryDirectory:(id)a8 delegate:(id)a9 forThumbnail:(BOOL)a10
{
  OCXState *v13;
  OCPPackagePart *v14;
  _xmlDoc *v15;
  xmlNodePtr v16;
  _xmlNode *v17;
  xmlNs *ns;
  const unsigned __int8 *href;
  CXNamespace *v20;
  EDWorkbook *v21;
  void *v22;
  void *v23;
  CXNamespace *v24;
  _xmlNode *v25;
  uint64_t v26;
  CXNamespace *v27;
  _xmlNode *v28;
  CXNamespace *v29;
  _xmlNode *v30;
  uint64_t v31;
  void *v32;
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
  CXNamespace *v43;
  uint64_t v44;
  _xmlDoc *v45;
  CXNamespace *v46;
  xmlNsPtr v47;
  void *v48;
  void *v49;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  BOOL v70;
  BOOL v71;
  id v72;

  v13 = (OCXState *)a3;
  v66 = a5;
  v67 = a7;
  v65 = a8;
  v68 = a9;
  -[OCXState workbookPart](v13, "workbookPart");
  v14 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  -[OCPPackagePart contentType](v14, "contentType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69
    && (objc_msgSend(v69, "isEqualToString:", CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml")) & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", CFSTR("application/vnd.ms-excel.sheet.macroEnabled.main+xml")) & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.template.main+xml")) & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", CFSTR("application/vnd.ms-excel.addin.macroEnabled.main+xml")) & 1) == 0&& (objc_msgSend(v69, "isEqualToString:", CFSTR("application/vnd.ms-excel.template.macroEnabled.main+xml")) & 1) == 0)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  v15 = -[OCPPackagePart xmlDocument](v14, "xmlDocument");
  if (!v15)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v16 = OCXGetRootElement(v15);
  v17 = v16;
  if (!v16 || !xmlStrEqual(v16->name, (const xmlChar *)"workbook"))
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v21 = 0;
    goto LABEL_40;
  }
  v72 = 0;
  CXOptionalStringAttribute(v17, (void *)CXNoNamespace, (xmlChar *)"conformance", &v72);
  v62 = v72;
  if (v62 && objc_msgSend(v62, "isEqualToString:", CFSTR("strict")))
    -[OCXState setupNSForXMLFormat:](v13, "setupNSForXMLFormat:", 1);
  ns = v17->ns;
  if (!ns
    || (href = ns->href,
        -[OCXState EXSpreadsheetMLNamespace](v13, "EXSpreadsheetMLNamespace"),
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        LODWORD(href) = CXXmlStrEqualToNsUriOrFallbackNsUri(href, v20),
        v20,
        !(_DWORD)href))
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  v21 = -[EDWorkbook initWithFileName:andStringOptimization:]([EDWorkbook alloc], "initWithFileName:andStringOptimization:", v67, 0);
  -[OCDDocument setReader:](v21, "setReader:", v66);
  -[EDWorkbook setTemporaryDirectory:](v21, "setTemporaryDirectory:", v65);
  -[EDWorkbook processors](v21, "processors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setupProcessors:", v22);

  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read globals"), 10.0, 0.1);
  -[OCXState setWorkbook:](v13, "setWorkbook:", v21);
  -[EDWorkbook resources](v21, "resources");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState setResources:](v13, "setResources:", v23);

  -[OCXState EXSpreadsheetMLNamespace](v13, "EXSpreadsheetMLNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = (_xmlNode *)OCXFindChild(v17, v24, "workbookPr");

  if (v25)
  {
    v71 = 1;
    CXOptionalBoolAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"dateCompatibility", &v71);
    if (v71)
    {
      v70 = 0;
      CXOptionalBoolAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"date1904", &v70);
      if (v70)
        v26 = 2;
      else
        v26 = 1;
      -[EDWorkbook setDateBase:](v21, "setDateBase:", v26);
    }
    else
    {
      -[EDWorkbook setDateBase:](v21, "setDateBase:", 0);
    }
  }
  else
  {
    -[EDWorkbook setDateBase:](v21, "setDateBase:", 1);
  }
  -[OCXState EXSpreadsheetMLNamespace](v13, "EXSpreadsheetMLNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v28 = (_xmlNode *)OCXFindChild(v17, v27, "bookViews");

  if (v28
    && (-[OCXState EXSpreadsheetMLNamespace](v13, "EXSpreadsheetMLNamespace"),
        v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v30 = (_xmlNode *)OCXFindChild(v28, v29, "workbookView"),
        v29,
        v30))
  {
    v31 = CXDefaultLongAttribute(v30, (CXNamespace *)CXNoNamespace, (xmlChar *)"activeTab", 0);
  }
  else
  {
    v31 = 0;
  }
  -[EDWorkbook setActiveSheetIndex:](v21, "setActiveSheetIndex:", v31);
  +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v14, v13, (objc_selector *)sel_OCXThemeRelationshipType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32
    || -[OCXState xmlFormat](v13, "xmlFormat") == 1
    && (-[OCPPackagePart firstPartWithRelationshipOfType:](v14, "firstPartWithRelationshipOfType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme")), (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[OCDDocument theme](v21, "theme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCXState officeArtState](v13, "officeArtState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v32, v33, v34);

    -[OCDDocument theme](v21, "theme");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "baseStyles");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "colorScheme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[OCXState officeArtState](v13, "officeArtState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setColorScheme:", v37);

    -[OCXState officeArtState](v13, "officeArtState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCDDocument theme](v21, "theme");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "baseStyles");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fontScheme");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFontScheme:", v42);

  }
  else
  {
    -[OCDDocument theme](v21, "theme");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isEmpty");

    if (!v52)
    {
      v32 = 0;
      goto LABEL_34;
    }
    -[OCDDocument theme](v21, "theme");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "validateTheme");

    -[OCXState officeArtState](v13, "officeArtState");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCDDocument theme](v21, "theme");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "baseStyles");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "styleMatrix");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setStyleMatrix:", v57);

    -[OCXState officeArtState](v13, "officeArtState");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCDDocument theme](v21, "theme");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "baseStyles");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "colorScheme");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setColorScheme:", v61);

    -[OCXState officeArtState](v13, "officeArtState");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCDDocument theme](v21, "theme");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "baseStyles");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "fontScheme");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFontScheme:", v41);
    v32 = 0;
  }

LABEL_34:
  objc_msgSend(a1, "readStylesFrom:state:", v14, v13);
  if (a6)
  {
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 2.0);
  }
  else
  {
    -[OCXState EXSpreadsheetMLNamespace](v13, "EXSpreadsheetMLNamespace");
    v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v44 = OCXFindChild(v17, v43, "definedNames");

    +[EXNameTable readFrom:state:](EXNameTable, "readFrom:state:", v44, v13);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
    objc_msgSend(a1, "readStringsFrom:state:", v14, v13);
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 1.0);
  }
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read sheets"), 1.0, 0.9);
  v45 = -[OCPPackagePart xmlDocument](v14, "xmlDocument");
  -[OCXState OCXRelationshipsNamespace](v13, "OCXRelationshipsNamespace");
  v46 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v47 = CXXmlSearchNsByHrefWithFallbackNs(v45, v17, v46);

  -[OCXState relationshipNameSpaceForWorkbook:](v13, "relationshipNameSpaceForWorkbook:", v47);
  if (!a6)
    objc_msgSend(a1, "readSheetsFrom:relationNS:state:delegate:forThumbnail:", v14, v47, v13, v68, a10);
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  -[OCDDocument summary](v21, "summary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCPPackagePart package](v14, "package");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[OCXSummary readSummary:package:](OCXSummary, "readSummary:package:", v48, v49);

  objc_msgSend(v68, "readerDidEndDocument:", v21);
LABEL_40:

  return v21;
}

+ (void)readSheetsFrom:(id)a3 relationNS:(_xmlNs *)a4 state:(id)a5 delegate:(id)a6 forThumbnail:(BOOL)a7
{
  id v9;
  id v10;
  _xmlDoc *v11;
  xmlNodePtr v12;
  _xmlNode *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  int v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *Child;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CXNamespace *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  id v31;

  v29 = a7;
  v9 = a3;
  v10 = a5;
  v30 = a6;
  v28 = v9;
  v11 = (_xmlDoc *)objc_msgSend(v9, "xmlDocument");
  if (!v11)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v12 = OCXGetRootElement(v11);
  v13 = v12;
  if (!v12 || !xmlStrEqual(v12->name, (const xmlChar *)"workbook"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v10, "EXSpreadsheetMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(v13, v14, "sheets");

  if (!v15)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v10, "EXSpreadsheetMLNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = CXCountChildren(v15, v16, (xmlChar *)"sheet");

  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read sheets"), (double)v17, 1.0);
  objc_msgSend(v10, "workbook");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "readerDidStartDocument:withElementCount:", v18, v17);

  objc_msgSend(v10, "EXSpreadsheetMLNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(v15, v19, "sheet");

  if (Child)
  {
    v21 = 0;
    do
    {
      if (objc_msgSend(v10, "isCancelled"))
        +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
      v31 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"state", &v31);
      v22 = v31;
      v23 = v22;
      if (v22 && objc_msgSend(v22, "isEqualToString:", CFSTR("veryHidden")))
      {
        LODWORD(v21) = v21 - 1;
      }
      else
      {
        objc_msgSend(v10, "setCurrentSheetIndex:", v21);
        +[EXSheet readFrom:state:](EXSheet, "readFrom:state:", Child, v10);
        objc_msgSend(v10, "workbook");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sheetAtIndex:", (int)v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "workbook");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "readerDidReadElement:atIndex:inDocument:isLastElement:", v25, (int)v21, v26, (_DWORD)v21 == v17 - 1);

        if (v29 && (objc_msgSend(v25, "isHidden") & 1) == 0)
        {

          break;
        }

      }
      objc_msgSend(v10, "EXSpreadsheetMLNamespace");
      v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v27, (xmlChar *)"sheet");
      v21 = (v21 + 1);

    }
    while (Child);
  }
  +[TCProgressContext endStage](TCProgressContext, "endStage");

}

@end
