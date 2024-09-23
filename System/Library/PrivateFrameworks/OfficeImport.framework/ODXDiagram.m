@implementation ODXDiagram

+ (id)readFromParentNode:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CXNamespace *v7;
  _xmlNode *v8;
  void *v9;
  CXNamespace *v10;
  void *v11;
  void *v12;
  ODDDiagram *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a4;
  objc_msgSend(v6, "ODXDiagramNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "relIds");

  if (!v8)
  {
    objc_msgSend(v6, "officeArtState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OAXMainNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v8 = OCXFirstChild(a3, v10, (xmlChar *)"relIds");

  }
  objc_msgSend(v6, "officeArtState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "packagePart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(ODDDiagram);
  objc_msgSend(v6, "officeArtState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "nodeForRelationshipName:relIdsNode:part:state:", "qs", v8, v12, v14);

  -[ODDDiagram styleDefinition](v13, "styleDefinition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODXStyleDefinition readNode:definition:state:](ODXStyleDefinition, "readNode:definition:state:", v15, v16, v6);

  objc_msgSend(v6, "officeArtState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "nodeForRelationshipName:relIdsNode:part:state:", "cs", v8, v12, v17);

  -[ODDDiagram colorTransform](v13, "colorTransform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[ODXColorTransform readNode:transform:state:](ODXColorTransform, "readNode:transform:state:", v18, v19, v6);

  objc_msgSend(v6, "officeArtState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(a1, "nodeForRelationshipName:relIdsNode:part:state:", "dm", v8, v12, v20);

  +[ODXData readNode:toDiagram:state:](ODXData, "readNode:toDiagram:state:", v21, v13, v6);
  +[ODXDrawing readDrawingRelationshipIdFromDataNode:state:](ODXDrawing, "readDrawingRelationshipIdFromDataNode:state:", v21, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(v12, "relationshipForIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "officeArtState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(a1, "nodeForRelationship:part:state:", v23, v12, v24);

    +[ODXDrawing readNode:toDiagram:state:](ODXDrawing, "readNode:toDiagram:state:", v25, v13, v6);
  }
  objc_msgSend(v6, "officeArtState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "client");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "officeArtState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "readClientDataFromGraphicDataNode:toDiagram:state:", a3, v13, v28);

  objc_msgSend(v6, "officeArtState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPackagePart:", v12);

  return v13;
}

+ (_xmlNode)nodeForRelationshipName:(const char *)a3 relIdsNode:(_xmlNode *)a4 part:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _xmlNode *v13;

  v10 = a5;
  v11 = a6;
  objc_msgSend(v11, "OCXReadRequiredRelationshipForNode:attributeName:packagePart:", a4, a3, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)objc_msgSend(a1, "nodeForRelationship:part:state:", v12, v10, v11);

  return v13;
}

+ (_xmlNode)nodeForRelationship:(id)a3 part:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _xmlNode *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "package");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "partForLocation:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", CFSTR("ODXException"), CFSTR("Couldn't find drawing part: %@"), v14);

  }
  objc_msgSend(v9, "setPackagePart:", v12);
  v15 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v12, "xmlDocument"));
  if (!v15)
  {
    v16 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", CFSTR("ODXException"), CFSTR("Couldn't get root node for drawing part: %@"), v17);

  }
  objc_msgSend(v8, "package");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resetPartForLocation:", v19);

  return v15;
}

@end
