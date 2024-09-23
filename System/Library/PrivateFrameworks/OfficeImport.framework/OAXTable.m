@implementation OAXTable

+ (id)readDefaultTableStyleWithDrawingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "tableStyleCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readTableStyle:drawingState:", objc_msgSend(v5, "defaultStyleNode"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readTableStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  OADTableStyle *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  OADTableBackground *v14;
  void *v15;
  void *v16;
  _xmlNode *i;
  void *v18;

  v6 = a4;
  if (a3)
  {
    CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "OAXMainNamespace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsNode:", a3);

    if ((v9 & 1) != 0)
    {
      v10 = objc_alloc_init(OADTableStyle);
      -[OADTableStyle setId:](v10, "setId:", v7);
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableStyle setName:](v10, "setName:", v11);
      objc_msgSend(v6, "OAXMainNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v13 = OCXFindChild(a3, v12, "tblBg");

      if (v13)
      {
        v14 = objc_alloc_init(OADTableBackground);
        objc_msgSend(a1, "readThemableFillFromParent:drawingState:", v13, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[OADTableBackground setFill:](v14, "setFill:", v15);
        objc_msgSend(a1, "readThemableEffectsFromParent:drawingState:", v13, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          -[OADTableBackground setEffects:](v14, "setEffects:", v16);
        -[OADTableStyle setBackground:](v10, "setBackground:", v14);

      }
      for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
      {
        objc_msgSend(a1, "readPartStyle:drawingState:", i, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (xmlStrEqual(i->name, (const xmlChar *)"wholeTbl"))
        {
          -[OADTableStyle setWholeTableStyle:](v10, "setWholeTableStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band1H"))
        {
          -[OADTableStyle setBand1HorzStyle:](v10, "setBand1HorzStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band2H"))
        {
          -[OADTableStyle setBand2HorzStyle:](v10, "setBand2HorzStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band1V"))
        {
          -[OADTableStyle setBand1VertStyle:](v10, "setBand1VertStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"band2V"))
        {
          -[OADTableStyle setBand2VertStyle:](v10, "setBand2VertStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"firstRow"))
        {
          -[OADTableStyle setFirstRowStyle:](v10, "setFirstRowStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"lastRow"))
        {
          -[OADTableStyle setLastRowStyle:](v10, "setLastRowStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"firstCol"))
        {
          -[OADTableStyle setFirstColumnStyle:](v10, "setFirstColumnStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"lastCol"))
        {
          -[OADTableStyle setLastColumnStyle:](v10, "setLastColumnStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"neCell"))
        {
          -[OADTableStyle setNorthEastStyle:](v10, "setNorthEastStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"nwCell"))
        {
          -[OADTableStyle setNorthWestStyle:](v10, "setNorthWestStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"seCell"))
        {
          -[OADTableStyle setSouthEastStyle:](v10, "setSouthEastStyle:", v18);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"swCell"))
        {
          -[OADTableStyle setSouthWestStyle:](v10, "setSouthWestStyle:", v18);
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)readPartStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADTablePartStyle *v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = objc_alloc_init(OADTablePartStyle);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "tcStyle");

  if (v9)
  {
    objc_msgSend(a1, "readCellStyle:drawingState:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTablePartStyle setCellStyle:](v7, "setCellStyle:", v10);

  }
  objc_msgSend(v6, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "tcTxStyle");

  if (v12)
  {
    objc_msgSend(a1, "readTextStyle:drawingState:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTablePartStyle setTextStyle:](v7, "setTextStyle:", v13);

  }
  return v7;
}

+ (id)readCellStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADTableCellStyle *v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = objc_alloc_init(OADTableCellStyle);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "tcBdr");

  if (v9)
  {
    objc_msgSend(a1, "readCellBorderStyle:drawingState:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTableCellStyle setBorderStyle:](v7, "setBorderStyle:", v10);

  }
  objc_msgSend(a1, "readThemableFillFromParent:drawingState:", a3, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[OADTableCellStyle setFill:](v7, "setFill:", v11);

  return v7;
}

+ (id)readCellBorderStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADTableCellBorderStyle *v7;
  _xmlNode *i;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init(OADTableCellBorderStyle);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    objc_msgSend(a1, "readThemableStrokeFromParent:drawingState:", i, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (xmlStrEqual(i->name, (const xmlChar *)"left"))
    {
      -[OADTableCellBorderStyle setLeftStroke:](v7, "setLeftStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"right"))
    {
      -[OADTableCellBorderStyle setRightStroke:](v7, "setRightStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"top"))
    {
      -[OADTableCellBorderStyle setTopStroke:](v7, "setTopStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"bottom"))
    {
      -[OADTableCellBorderStyle setBottomStroke:](v7, "setBottomStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"insideH"))
    {
      -[OADTableCellBorderStyle setHorzInsideStroke:](v7, "setHorzInsideStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"insideV"))
    {
      -[OADTableCellBorderStyle setVertInsideStroke:](v7, "setVertInsideStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"tl2br"))
    {
      -[OADTableCellBorderStyle setTopLeftToBottomRightStroke:](v7, "setTopLeftToBottomRightStroke:", v9);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"tr2bl"))
    {
      -[OADTableCellBorderStyle setBottomLeftToTopRightStroke:](v7, "setBottomLeftToTopRightStroke:", v9);
    }

  }
  return v7;
}

+ (id)readThemableStrokeFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  unsigned int v17;

  v5 = a4;
  objc_msgSend(v5, "OAXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = OCXFindChild(a3, v6, "ln");

  if (v7)
  {
    objc_msgSend(v5, "packagePart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "styleMatrix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v5, "OAXMainNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:name:inNamespace:color:index:](OAXStyleMatrix, "readReferenceFromParentNode:name:inNamespace:color:index:", a3, "lnRef", v11, &v16, &v17);
    v12 = v16;

    objc_msgSend(v10, "strokeAtIndex:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = (void *)objc_msgSend(v13, "copy");

      if (v12)
        objc_msgSend(v9, "setStyleColor:", v12);
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (id)readThemableFillFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *v7;
  _xmlNode *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  unsigned int v18;

  v5 = a4;
  objc_msgSend(v5, "OAXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "fill");

  if (v7)
  {
    for (i = OCXFirstChild(v7); i; i = OCXNextSibling(i))
    {
      objc_msgSend(v5, "packagePart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_12;
    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "styleMatrix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "OAXMainNamespace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:name:inNamespace:color:index:](OAXStyleMatrix, "readReferenceFromParentNode:name:inNamespace:color:index:", a3, "fillRef", v12, &v17, &v18);
    v13 = v17;

    objc_msgSend(v11, "fillAtIndex:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v10 = (void *)objc_msgSend(v14, "copy");

      if (v13)
        objc_msgSend(v10, "setStyleColor:", v13);
    }
    else
    {
      v10 = 0;
    }

  }
LABEL_12:

  return v10;
}

+ (id)readTextStyle:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADTableTextStyle *v7;
  CXNamespace *v8;
  uint64_t v9;
  OADFontReference *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  _BOOL4 v14;
  id v15;
  id v17;
  id v18;

  v6 = a4;
  v7 = objc_alloc_init(OADTableTextStyle);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "fontRef");

  if (v9)
  {
    v10 = objc_alloc_init(OADFontReference);
    -[OADTableTextStyle setFontReference:](v7, "setFontReference:", v10);
    +[OAXFontReference readFromNode:fontReference:](OAXFontReference, "readFromNode:fontReference:", v9, v10);

  }
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[OADTableTextStyle setColor:](v7, "setColor:", v11);
  v18 = 0;
  v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"b", &v18);
  v13 = v18;
  if (v12)
    -[OADTableTextStyle setBold:](v7, "setBold:", objc_msgSend(a1, "readOnOffFlag:", v13));
  v17 = 0;
  v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"i", &v17);
  v15 = v17;
  if (v14)
    -[OADTableTextStyle setItalic:](v7, "setItalic:", objc_msgSend(a1, "readOnOffFlag:", v15));

  return v7;
}

+ (int)readOnOffFlag:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("on")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("off")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("def"));
    v4 = 2;
  }

  return v4;
}

+ (id)readFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADTable *v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v7 = objc_alloc_init(OADTable);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "tblPr");

  if (v9)
  {
    -[OADTable tableProperties](v7, "tableProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readPropertiesFromXmlNode:toProperties:drawingState:", v9, v10, v6);

  }
  objc_msgSend(v6, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "tblGrid");

  if (!v12)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  -[OADTable grid](v7, "grid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readGridFromXmlNode:toGrid:drawingState:", v12, v13, v6);

  objc_msgSend(a1, "readRowsFromTableXmlNode:toTable:drawingState:", a3, v7, v6);
  return v7;
}

+ (void)readPropertiesFromXmlNode:(_xmlNode *)a3 toProperties:(id)a4 drawingState:(id)a5
{
  id v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a5;
  objc_msgSend(v20, "setFirstColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstCol", 0));
  objc_msgSend(v20, "setFirstRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstRow", 0));
  objc_msgSend(v20, "setLastColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastCol", 0));
  objc_msgSend(v20, "setLastRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastRow", 0));
  objc_msgSend(v20, "setBandColumn:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bandCol", 0));
  objc_msgSend(v20, "setBandRow:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bandRow", 0));
  objc_msgSend(v20, "setRightToLeft:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", 0));
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "effectLst");

  if (v10)
  {
    objc_msgSend(v8, "packagePart");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v20, "setEffects:", v12);
  objc_msgSend(v8, "OAXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "tableStyle");

  if (v14)
    goto LABEL_5;
  objc_msgSend(v8, "OAXMainNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "tableStyleId");

  if (v17)
  {
    v18 = *(_QWORD *)(v17 + 24);
    if (v18)
    {
      if (*(_DWORD *)(v18 + 8) == 3)
      {
        v17 = *(_QWORD *)(v17 + 24);
      }
      else
      {
        +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
        v17 = v18;
      }
    }
    if (*(_QWORD *)(v17 + 80))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tableStyleCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v19, "styleNodeForId:", v15);

      if (!v14)
      {
        +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
        goto LABEL_6;
      }

LABEL_5:
      objc_msgSend(a1, "readTableStyle:drawingState:", v14, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStyle:", v15);
LABEL_6:

    }
  }

}

+ (void)readRowsFromTableXmlNode:(_xmlNode *)a3 toTable:(id)a4 drawingState:(id)a5
{
  id v8;
  CXNamespace *v9;
  _xmlNode *Child;
  void *v11;
  CXNamespace *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v9, "tr");

  while (Child)
  {
    objc_msgSend(v13, "addRow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readRowFromXmlNode:toRow:drawingState:", Child, v11, v8);

    objc_msgSend(v8, "OAXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v12, (xmlChar *)"tr");

  }
}

+ (void)readRowFromXmlNode:(_xmlNode *)a3 toRow:(id)a4 drawingState:(id)a5
{
  id v8;
  CXNamespace *v9;
  _xmlNode *Child;
  void *v11;
  CXNamespace *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  +[OAXBaseTypes readRequiredLengthFromXmlNode:name:](OAXBaseTypes, "readRequiredLengthFromXmlNode:name:", a3, "h");
  objc_msgSend(v13, "setHeight:");
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v9, "tc");

  while (Child)
  {
    objc_msgSend(v13, "addCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readCellFromXmlNode:toCell:drawingState:", Child, v11, v8);

    objc_msgSend(v8, "OAXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v12, (xmlChar *)"tc");

  }
}

+ (void)readCellFromXmlNode:(_xmlNode *)a3 toCell:(id)a4 drawingState:(id)a5
{
  id v8;
  CXNamespace *v9;
  uint64_t v10;
  OADTextBody *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  objc_msgSend(v15, "setRowSpan:", CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowSpan", 1));
  objc_msgSend(v15, "setGridSpan:", CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"gridSpan", 1));
  objc_msgSend(v15, "setHorzMerge:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hMerge", 0));
  objc_msgSend(v15, "setVertMerge:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"vMerge", 0));
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "txBody");

  if (v10)
  {
    v11 = objc_alloc_init(OADTextBody);
    objc_msgSend(v15, "setTextBody:", v11);
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v10, v11, v8);

  }
  objc_msgSend(v8, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "tcPr");

  if (v13)
  {
    objc_msgSend(a1, "readCellPropertiesFromXmlNode:drawingState:", v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperties:", v14);

  }
}

+ (id)readCellPropertiesFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  OADTableCellProperties *v6;
  void *v7;
  _xmlNode *i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  id v19;
  id v21;
  BOOL v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a4;
  v6 = objc_alloc_init(OADTableCellProperties);
  objc_msgSend(v5, "packagePart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE)
      continue;
    if (xmlStrEqual(i->name, (const xmlChar *)"lnL"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setLeftStroke:](v6, "setLeftStroke:", v9);
LABEL_16:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnR"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setRightStroke:](v6, "setRightStroke:", v9);
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnT"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setTopStroke:](v6, "setTopStroke:", v9);
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnB"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setBottomStroke:](v6, "setBottomStroke:", v9);
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnTlToBr"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setTopLeftToBottomRightStroke:](v6, "setTopLeftToBottomRightStroke:", v9);
      goto LABEL_16;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"lnBlToTr"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellProperties setBottomLeftToTopRightStroke:](v6, "setBottomLeftToTopRightStroke:", v9);
      goto LABEL_16;
    }
    if (!xmlStrEqual(i->name, (const xmlChar *)"cell3D")
      && !xmlStrEqual(i->name, (const xmlChar *)"ext")
      && !xmlStrEqual(i->name, (const xmlChar *)"headers"))
    {
      +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v7, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[OADTableCellProperties setFill:](v6, "setFill:", v9);
      goto LABEL_16;
    }
  }
  v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marL", &v28, 12))
  {
    v10 = (double)v28 / 12700.0;
    *(float *)&v10 = v10;
    -[OADTableCellProperties setLeftMargin:](v6, "setLeftMargin:", v10);
  }
  v27 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marR", &v27, 12))
  {
    v11 = (double)v27 / 12700.0;
    *(float *)&v11 = v11;
    -[OADTableCellProperties setRightMargin:](v6, "setRightMargin:", v11);
  }
  v26 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marT", &v26, 12))
  {
    v12 = (double)v26 / 12700.0;
    *(float *)&v12 = v12;
    -[OADTableCellProperties setTopMargin:](v6, "setTopMargin:", v12);
  }
  v25 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"marB", &v25, 12))
  {
    v13 = (double)v25 / 12700.0;
    *(float *)&v13 = v13;
    -[OADTableCellProperties setBottomMargin:](v6, "setBottomMargin:", v13);
  }
  v24 = 0;
  v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vert", &v24);
  v15 = v24;
  if (v14)
    -[OADTableCellProperties setTextFlow:](v6, "setTextFlow:", +[OAXTextBody readFlowType:](OAXTextBody, "readFlowType:", v15));
  v23 = 0;
  v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"anchor", &v23);
  v17 = v23;
  if (v16)
    -[OADTableCellProperties setTextAnchor:](v6, "setTextAnchor:", +[OAXTextBody readAnchorType:](OAXTextBody, "readAnchorType:", v17));
  v22 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"anchorCtr", &v22))
    -[OADTableCellProperties setTextAnchorCenter:](v6, "setTextAnchorCenter:", v22);
  v21 = 0;
  v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horzOverflow", &v21);
  v19 = v21;
  if (v18)
    -[OADTableCellProperties setTextHorizontalOverflow:](v6, "setTextHorizontalOverflow:", +[OAXTextBody readHorizontalOverflowType:](OAXTextBody, "readHorizontalOverflowType:", v19));

  return v6;
}

+ (id)readThemableEffectsFromParent:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  unsigned int v16;

  v5 = a4;
  objc_msgSend(v5, "OAXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = OCXFindChild(a3, v6, "effect");

  if (v7)
  {
    objc_msgSend(v5, "packagePart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "styleMatrix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "OAXMainNamespace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    +[OAXStyleMatrix readReferenceFromParentNode:name:inNamespace:color:index:](OAXStyleMatrix, "readReferenceFromParentNode:name:inNamespace:color:index:", a3, "effectRef", v11, &v15, &v16);
    v12 = v15;

    objc_msgSend(v10, "effectsAtIndex:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v13, 1);

      if (v12)
        objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_setStyleColor_, v12);
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (void)cacheTableStylesInPart:(id)a3 cache:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  xmlNodePtr v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *Child;
  void *v14;
  CXNamespace *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  if (v16)
  {
    v9 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v16, "xmlDocument"));
    v10 = v9;
    if (!v9 || !xmlStrEqual(v9->name, (const xmlChar *)"tblStyleLst"))
      +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
    objc_msgSend(v7, "setStylesPart:", v16);
    CXDefaultStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"def", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultStyleId:", v11);
    objc_msgSend(v8, "OAXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(v10, v12, "tblStyle");

    while (Child)
    {
      CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"styleId", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStyleNode:forId:", Child, v14);
      objc_msgSend(v8, "OAXMainNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"tblStyle");

    }
  }

}

+ (void)readGridFromXmlNode:(_xmlNode *)a3 toGrid:(id)a4 drawingState:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *Child;
  void *v10;
  CXNamespace *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  objc_msgSend(v7, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v8, "gridCol");

  while (Child)
  {
    objc_msgSend(v12, "addColumn");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXBaseTypes readRequiredLengthFromXmlNode:name:](OAXBaseTypes, "readRequiredLengthFromXmlNode:name:", Child, "w");
    objc_msgSend(v10, "setWidth:");
    objc_msgSend(v7, "OAXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v11, (xmlChar *)"gridCol");

  }
}

@end
