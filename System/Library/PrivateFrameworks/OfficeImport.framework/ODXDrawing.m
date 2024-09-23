@implementation ODXDrawing

+ (id)readDrawingRelationshipIdFromDataNode:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *Child;
  void *v8;
  CXNamespace *v9;
  void *v10;
  void *v11;
  id v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;

  v5 = a4;
  objc_msgSend(v5, "ODXDiagramNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v6, "extLst");

  if (Child)
  {
    objc_msgSend(v5, "officeArtState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "OAXMainNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(Child, v9, "ext");

    if (Child)
    {
      while (1)
      {
        CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = objc_retainAutorelease(v10);
          if (!strcmp((const char *)objc_msgSend(v12, "UTF8String"), "http://schemas.microsoft.com/office/drawing/2008/diagram"))
          {
            v13 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/drawing/2008/diagram");
            v14 = (_xmlNode *)OCXFindChild(Child, v13, "dataModelExt");

            if (v14)
              break;
          }
        }
        objc_msgSend(v5, "officeArtState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "OAXMainNamespace");
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v16, (xmlChar *)"ext");

        if (!Child)
          goto LABEL_7;
      }
      CXDefaultStringAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"relId", 0);
      Child = (_xmlNode *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_7:

  return Child;
}

+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  v8 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/drawing/2008/diagram");
  if (CXNodeHasName(a3, v8, (xmlChar *)"drawing"))
  {
    v9 = OCXFindChild(a3, v8, "spTree");
    if (v9)
    {
      objc_msgSend(v7, "officeArtState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXDrawable readDrawablesFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawablesFromXmlNode:inNamespace:drawingState:", v9, v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setEquivalentDrawables:", v11);
    }
  }

}

@end
