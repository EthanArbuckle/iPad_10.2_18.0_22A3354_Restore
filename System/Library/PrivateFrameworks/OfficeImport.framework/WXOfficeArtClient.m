@implementation WXOfficeArtClient

- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  WDAContent *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  WDATextBox *v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double x;
  double y;
  double width;
  double height;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v7 = a4;
  objc_msgSend(a5, "oavState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wxReadState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(WDAContent);
  objc_msgSend(v7, "setClientData:", v10);
  -[WDAContent setTextType:](v10, "setTextType:", objc_msgSend(v9, "currentOfficeArtTextType"));
  objc_msgSend(v9, "WXShapeNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "txbx");

  if (v12)
  {
    +[WXTextBox readFrom:parent:state:](WXTextBox, "readFrom:parent:state:", v12, v10, v8);
    v13 = (WDATextBox *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_21;
    objc_msgSend(v9, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAContent setTextBox:document:](v10, "setTextBox:document:", v13, v14);

    -[WDAContent setDrawable:](v10, "setDrawable:", v7);
    v53 = -1;
    if (!CXOptionalLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", &v53))
      goto LABEL_21;
    -[WDATextBox setFlowSequence:](v13, "setFlowSequence:", &unk_24F46A960);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v53);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDATextBox setFlowId:](v13, "setFlowId:", v15);

    -[WDATextBox setNextTextBoxId:](v13, "setNextTextBoxId:", 0xFFFFFFFFLL);
    -[WDATextBox flowId](v13, "flowId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextBox:forFlowId:", v13, v16);
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(v9, "WXShapeNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "linkedTxbx");

  if (v18)
  {
    v13 = objc_alloc_init(WDATextBox);
    -[WDATextBox setParent:](v13, "setParent:", v10);
    -[WDAContent setDrawable:](v10, "setDrawable:", v7);
    objc_msgSend(v9, "document");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAContent setTextBox:document:](v10, "setTextBox:document:", v13, v19);

    v52 = -1;
    v53 = -1;
    if (CXOptionalLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", &v53)
      && CXOptionalLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"seq", &v52))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v52);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDATextBox setFlowSequence:](v13, "setFlowSequence:", v20);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v53);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDATextBox setFlowId:](v13, "setFlowId:", v21);

    }
    -[WDATextBox flowId](v13, "flowId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textBoxForFlowId:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[WDAContent hasText](v10, "hasText"))
    {
      objc_msgSend(v9, "drawingState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isInsideGroup");
      v25 = v16 ? v24 : 0;

      if (v25 == 1)
      {
        objc_msgSend(v7, "drawableProperties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "orientedBounds");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "parent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "drawable");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "drawableProperties");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "orientedBounds");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v9, "drawingState");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "peekGroup");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (v51)
          {
            objc_msgSend(v51, "bounds");
            v34 = v33;
            v36 = v35;
            v38 = v37;
            v40 = v39;
            objc_msgSend(v30, "bounds");
            v57.origin.x = v41;
            v57.origin.y = v42;
            v44 = v43;
            v46 = v45;
            v54.origin.x = v34;
            v54.origin.y = v36;
            v54.size.width = v38;
            v54.size.height = v40;
            v57.size.width = v44;
            v57.size.height = v46;
            v55 = CGRectUnion(v54, v57);
            x = v55.origin.x;
            y = v55.origin.y;
            width = v55.size.width;
            height = v55.size.height;
            objc_msgSend(v32, "logicalBounds");
            v58.origin.x = x;
            v58.origin.y = y;
            v58.size.width = width;
            v58.size.height = height;
            if (CGRectContainsRect(v56, v58) && width * height < v44 * v46 + v38 * v40 + v44 * v46 + v38 * v40)
              objc_msgSend(v30, "setBounds:", x, y, width, height);
          }
        }

      }
    }
    goto LABEL_20;
  }
LABEL_22:

}

- (id)readClientDrawableFromXmlNode:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;

  v5 = a4;
  objc_opt_class();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (xmlStrEqual(a3->name, (const xmlChar *)"wsp")
    && (objc_msgSend(v6, "WXShapeNamespace"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsNode:", a3),
        v7,
        v8))
  {
    objc_msgSend(v6, "WXShapeNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXShape readFromXmlNode:inNamespace:drawingState:](OAXShape, "readFromXmlNode:inNamespace:drawingState:", a3, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"pic")
         && (objc_msgSend(v5, "OAXPictureNamespace"),
             v11 = (void *)objc_claimAutoreleasedReturnValue(),
             v12 = objc_msgSend(v11, "containsNode:", a3),
             v11,
             v12))
  {
    objc_msgSend(v5, "OAXPictureNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXPicture readFromXmlNode:inNamespace:drawingState:](OAXPicture, "readFromXmlNode:inNamespace:drawingState:", a3, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!xmlStrEqual(a3->name, (const xmlChar *)"grpSp")
      || (objc_msgSend(v6, "WXGroupNamespace"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "containsNode:", a3),
          v13,
          !v14))
    {
      v15 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v6, "WXGroupNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXGroup readFromXmlNode:inNamespace:drawingState:](OAXGroup, "readFromXmlNode:inNamespace:drawingState:", a3, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;

LABEL_12:
  return v15;
}

- (_xmlNode)genericNonVisualPropertiesNodeForDrawableNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7;
  _xmlNode *v8;
  _xmlNode *parent;
  void *v10;
  CXNamespace *v11;

  v7 = a5;
  v8 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)a4, "cNvPr");
  if (!v8)
  {
    parent = a3->parent->parent->parent;
    objc_msgSend(v7, "documentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "WXDrawingNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v8 = (_xmlNode *)OCXFindChild(parent, v11, "docPr");

  }
  return v8;
}

- (id)readGraphicData:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const unsigned __int8 *v8;
  CXNamespace *v9;
  CXNamespace *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const unsigned __int8 *v14;
  CXNamespace *v15;
  CXNamespace *v16;

  v5 = a4;
  objc_opt_class();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const unsigned __int8 *)objc_msgSend(v7, "tc_xmlString");
  objc_msgSend(v6, "WXShapeNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = CXXmlStrEqualToNsUriOrFallbackNsUri(v8, v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "WXShapeNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)OCXFindChild(a3, v10, "wsp");

    if (v11)
    {
      objc_msgSend(v6, "WXShapeNamespace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXShape readFromXmlNode:inNamespace:drawingState:](OAXShape, "readFromXmlNode:inNamespace:drawingState:", v11, v12, v5);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v13;

    }
  }
  else
  {
    v14 = (const unsigned __int8 *)objc_msgSend(v7, "tc_xmlString");
    objc_msgSend(v6, "WXGroupNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = CXXmlStrEqualToNsUriOrFallbackNsUri(v14, v15);

    if (!(_DWORD)v14)
    {
      v11 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v6, "WXGroupNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)OCXFindChild(a3, v16, "wgp");

    if (v11)
    {
      objc_msgSend(v6, "WXGroupNamespace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXGroup readFromXmlNode:inNamespace:drawingState:](OAXGroup, "readFromXmlNode:inNamespace:drawingState:", v11, v12, v5);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_9:

  return v11;
}

- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6
{
  _xmlNode *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  xmlDocPtr Doc;
  _xmlNode *v16;
  _xmlNode *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  OADLinkedMediaFile *v23;
  id v24;

  v24 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("{C809E66F-F1BF-436E-b5F7-EEA9579F0CBA}")))
  {
    v8 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)WXWord2012DrawingNamespace, "webVideoPr");
    v9 = objc_opt_class();
    TSUDynamicCast(v9, (uint64_t)v24);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      CXDefaultStringAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"embeddedHtml", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        Doc = xmlReadDoc((const xmlChar *)objc_msgSend(v14, "tc_xmlString"), 0, 0, 1);
        v16 = CXGetRootElement(Doc);
        v17 = CXFirstChildNamed(v16, (xmlChar *)"embed");
        CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"src", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"flashVars", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v18 && v19)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&amp;%@"), v18, v19);
          v21 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v21;
        }
        xmlFreeDoc(Doc);
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_alloc_init(OADLinkedMediaFile);
          -[OADLinkedMediaFile setUrl:](v23, "setUrl:", v22);
          -[OADLinkedMediaFile setIsExternal:](v23, "setIsExternal:", 1);
          objc_msgSend(v11, "setMovie:", v23);

        }
      }
      else
      {
        v14 = v13;
      }

    }
  }

}

@end
