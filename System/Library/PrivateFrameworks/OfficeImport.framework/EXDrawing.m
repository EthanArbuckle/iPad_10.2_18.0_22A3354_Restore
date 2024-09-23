@implementation EXDrawing

+ (void)readFromPart:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  xmlNodePtr v8;
  void *v9;
  int v10;
  _xmlNode *i;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v13)
  {
    objc_msgSend(v6, "officeArtState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPackagePart:", v13);

    v8 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v13, "xmlDocument"));
    if (v8)
    {
      objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsNode:", v8) & 1) != 0)
      {
        v10 = xmlStrEqual(v8->name, (const xmlChar *)"wsDr");

        if (v10)
        {
          for (i = OCXFirstChild(v8); i; i = OCXNextSibling(i))
            v12 = (id)objc_msgSend(a1, "readAnchorNode:state:", i, v6);
        }
      }
      else
      {

      }
    }
  }

}

+ (id)readTwoCellAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  EDTwoCellAnchor *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  uint64_t v10;
  uint64_t v11;
  CXNamespace *v12;
  _xmlNode *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a4;
  v7 = objc_alloc_init(EDTwoCellAnchor);
  -[EDTwoCellAnchor setRelative:](v7, "setRelative:", 0);
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"from");

  v10 = objc_msgSend(a1, "readAnchorMarkerFromNode:state:", v9, v6);
  -[EDTwoCellAnchor setFrom:](v7, "setFrom:", v10, v11);
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXNextSibling(v9, v12, (xmlChar *)"to");

  v14 = objc_msgSend(a1, "readAnchorMarkerFromNode:state:", v13, v6);
  -[EDTwoCellAnchor setTo:](v7, "setTo:", v14, v15);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"editAs", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("twoCell")) & 1) != 0)
  {
    v17 = 0;
  }
  else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("oneCell")) & 1) != 0)
  {
    v17 = 1;
  }
  else if (objc_msgSend(v16, "isEqualToString:", CFSTR("absolute")))
  {
    v17 = 2;
  }
  else
  {
    v17 = 0;
  }
  -[EDTwoCellAnchor setEditAs:](v7, "setEditAs:", v17);
  objc_msgSend(a1, "readDrawableNode:anchor:state:", OCXNextSibling(v13), v7, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)readDrawableNode:(_xmlNode *)a3 anchor:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EDOfficeArtClient *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "EXSpreadsheetDrawingNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "officeArtState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXDrawable readDrawableFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawableFromXmlNode:inNamespace:drawingState:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "clientData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = objc_alloc_init(EDOfficeArtClient);
      objc_msgSend(v8, "currentSheet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDOfficeArtClient setSheet:](v13, "setSheet:", v14);

      v12 = v13;
      objc_msgSend(v11, "setClientData:", v13);
    }
    objc_msgSend(v12, "setAnchor:", v7);
    objc_msgSend(v8, "currentSheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addDrawable:", v11);

  }
  return v11;
}

+ (id)readAbsoluteAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  EDAbsoluteAnchor *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  void *v12;

  v6 = a4;
  v7 = objc_alloc_init(EDAbsoluteAnchor);
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"pos");

  +[OAXBaseTypes readPoint2DFromXmlNode:](OAXBaseTypes, "readPoint2DFromXmlNode:", v9);
  -[EDAbsoluteAnchor setPosition:](v7, "setPosition:");
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXNextSibling(v9, v10, (xmlChar *)"ext");

  +[OAXBaseTypes readSize2DFromXmlNode:](OAXBaseTypes, "readSize2DFromXmlNode:", v11);
  -[EDAbsoluteAnchor setSize:](v7, "setSize:");
  objc_msgSend(a1, "readDrawableNode:anchor:state:", OCXNextSibling(v11), v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)readOneCellAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  EDOneCellAnchor *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  uint64_t v10;
  uint64_t v11;
  CXNamespace *v12;
  _xmlNode *v13;
  void *v14;

  v6 = a4;
  v7 = objc_alloc_init(EDOneCellAnchor);
  -[EDOneCellAnchor setRelative:](v7, "setRelative:", 0);
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"from");

  v10 = objc_msgSend(a1, "readAnchorMarkerFromNode:state:", v9, v6);
  -[EDOneCellAnchor setFrom:](v7, "setFrom:", v10, v11);
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXNextSibling(v9, v12, (xmlChar *)"ext");

  +[OAXBaseTypes readSize2DFromXmlNode:](OAXBaseTypes, "readSize2DFromXmlNode:", v13);
  -[EDOneCellAnchor setSize:](v7, "setSize:");
  objc_msgSend(a1, "readDrawableNode:anchor:state:", OCXNextSibling(v13), v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_opt_class();
}

+ (id)readAnchorNode:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = v6;
  if (a3->type != XML_ELEMENT_NODE)
    goto LABEL_10;
  objc_msgSend(v6, "EXSpreadsheetDrawingNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsNode:", a3);

  if (!v9)
    goto LABEL_10;
  if (!xmlStrEqual(a3->name, (const xmlChar *)"twoCellAnchor"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"oneCellAnchor"))
    {
      objc_msgSend(a1, "readOneCellAnchorNode:state:", a3, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"absoluteAnchor"))
    {
      objc_msgSend(a1, "readAbsoluteAnchorNode:state:", a3, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "readTwoCellAnchorNode:state:", a3, v7);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = (void *)v10;
LABEL_11:

  return v11;
}

+ (EDCellAnchorMarker)readAnchorMarkerFromNode:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CXNamespace *v6;
  unsigned int v7;
  CXNamespace *v8;
  _xmlNode *v9;
  CXNamespace *v10;
  CXNamespace *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  EDCellAnchorMarker result;

  v5 = a4;
  objc_msgSend(v5, "EXSpreadsheetDrawingNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = CXRequiredLongChild(a3, v6, (xmlChar *)"col");

  objc_msgSend(v5, "EXSpreadsheetDrawingNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = CXRequiredLongChild(a3, v8, (xmlChar *)"colOff", 12);

  objc_msgSend(v5, "EXSpreadsheetDrawingNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = CXRequiredLongChild(a3, v10, (xmlChar *)"row");

  objc_msgSend(v5, "EXSpreadsheetDrawingNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = (float)(uint64_t)CXRequiredLongChild(a3, v11, (xmlChar *)"rowOff", 12) / 12700.0;

  v13 = v7 | ((unint64_t)COERCE_UNSIGNED_INT((float)(uint64_t)v9 / 12700.0) << 32);
  v14 = v8 | ((unint64_t)v12 << 32);
  result.rowIndex = v14;
  result.rowAdjustment = *((float *)&v14 + 1);
  result.columnIndex = v13;
  result.columnAdjustment = *((float *)&v13 + 1);
  return result;
}

@end
