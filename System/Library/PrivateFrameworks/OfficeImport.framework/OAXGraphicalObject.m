@implementation OAXGraphicalObject

+ (id)readFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v6;
  CXNamespace *v7;
  _xmlNode *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  ODXState *v12;
  const unsigned __int8 *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  const unsigned __int8 *v17;
  CXNamespace *v18;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  CXNamespace *v24;
  uint64_t v25;
  CXNamespace *v26;
  uint64_t v27;
  CXNamespace *v28;
  _xmlNode *v29;
  void *v30;
  void *v31;

  v6 = a5;
  objc_msgSend(v6, "OAXMainNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "graphic");

  if (v8)
  {
    objc_msgSend(v6, "OAXMainNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlNode *)OCXFindChild(v8, v9, "graphicData");

    if (v10)
    {
      CXRequiredStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ODXState initWithOfficeArtState:]([ODXState alloc], "initWithOfficeArtState:", v6);
      v13 = (const unsigned __int8 *)objc_msgSend(v11, "tc_xmlString");
      -[ODXState ODXDiagramNamespace](v12, "ODXDiagramNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = CXXmlStrEqualToNsUriOrFallbackNsUri(v13, v14);

      if ((_DWORD)v13)
      {
        +[ODXDiagram readFromParentNode:state:](ODXDiagram, "readFromParentNode:state:", v10, v12);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v16 = (void *)v15;
LABEL_9:

        goto LABEL_10;
      }
      v17 = (const unsigned __int8 *)objc_msgSend(v11, "tc_xmlString");
      objc_msgSend(v6, "OAXChartNamespace");
      v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = CXXmlStrEqualToNsUriOrFallbackNsUri(v17, v18);

      if ((_DWORD)v17)
      {
        +[CHXReader readFromParentNode:drawingState:](CHXReader, "readFromParentNode:drawingState:", v10, v6);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if (objc_msgSend(v11, "hasSuffix:", CFSTR("/picture")))
      {
        objc_msgSend(v6, "OAXPictureNamespace");
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v21 = OCXFindChild(v10, v20, "pic");

        if (!v21)
          +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
        objc_msgSend(v6, "OAXPictureNamespace");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXPicture readFromXmlNode:inNamespace:drawingState:](OAXPicture, "readFromXmlNode:inNamespace:drawingState:", v21, v22, v6);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v11, "hasSuffix:", CFSTR("/table")))
        {
          objc_msgSend(v6, "OAXMainNamespace");
          v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v25 = OCXFindChild(v10, v24, "tbl");

          if (!v25)
            +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
          +[OAXTable readFromXmlNode:drawingState:](OAXTable, "readFromXmlNode:drawingState:", v25, v6);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_8;
        }
        if ((objc_msgSend(v11, "hasSuffix:", CFSTR("/ole")) & 1) != 0
          || objc_msgSend(v11, "hasSuffix:", CFSTR("/oleObject")))
        {
          objc_msgSend(v6, "client");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "readOle:state:", v10, v6);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v11, "hasSuffix:", CFSTR("/lockedCanvas")))
        {
          objc_msgSend(v6, "OAXLockedCanvasNamespace");
          v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v27 = OCXFindChild(v10, v26, "lockedCanvas");

          if (!v27)
            +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
          objc_msgSend(v6, "OAXMainNamespace");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[OAXGroup readFromXmlNode:inNamespace:drawingState:](OAXGroup, "readFromXmlNode:inNamespace:drawingState:", v27, v22, v6);
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v11, "hasSuffix:", CFSTR("/compatibility")))
          {
            objc_msgSend(v6, "OAXCompatNamespace");
            v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
            v29 = (_xmlNode *)OCXFindChild(v10, v28, "legacyDrawing");

            if (!v29)
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
            CXRequiredStringAttribute(v29, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "oavState");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "drawableForVmlShapeId:", v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "oavState");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addDualDrawable:", v16);

            goto LABEL_23;
          }
          objc_msgSend(v6, "client");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "readGraphicData:state:", v10, v6);
          v23 = objc_claimAutoreleasedReturnValue();
        }
      }
      v16 = (void *)v23;
LABEL_23:

      goto LABEL_9;
    }
  }
  v16 = 0;
LABEL_10:

  return v16;
}

@end
