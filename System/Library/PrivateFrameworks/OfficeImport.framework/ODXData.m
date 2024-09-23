@implementation ODXData

+ (void)readNode:(_xmlNode *)a3 toDiagram:(id)a4 state:(id)a5
{
  id v8;
  CXNamespace *v9;
  BOOL HasName;
  OITSUNoCopyDictionary *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  void *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  _BOOL4 v17;
  id v18;

  v18 = a4;
  v8 = a5;
  objc_msgSend(v8, "ODXDiagramNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v9, (xmlChar *)"dataModel");

  if (!HasName)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Not a diagram data node"));
  v11 = objc_alloc_init(OITSUNoCopyDictionary);
  objc_msgSend(v8, "ODXDiagramNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFirstChild(a3, v12, (xmlChar *)"ptLst");

  objc_msgSend(a1, "readPointListFromNode:pointIdMap:state:", v13, v11, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDocumentPoint:", v14);
  v15 = OCXNextSibling(v13);
  objc_msgSend(v8, "ODXDiagramNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = CXNodeHasName(v15, v16, (xmlChar *)"cxnLst");

  if (v17)
    objc_msgSend(a1, "readConnectionListFromNode:pointIdMap:state:", v15, v11, v8);
  objc_msgSend(a1, "associatePresentationsInIdMap:", v11);

}

+ (id)readPointListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  _BOOL4 HasName;
  id v14;

  v8 = a4;
  v9 = a5;
  v10 = OCXFirstChild(a3);
  v11 = 0;
  while (v10)
  {
    if (v10->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(v9, "ODXDiagramNamespace");
      v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      HasName = CXNodeHasName(v10, v12, (xmlChar *)"pt");

      if (HasName)
      {
        if (v11)
        {
          v14 = (id)objc_msgSend(a1, "readPointFromNode:pointIdMap:state:", v10, v8, v9);
        }
        else
        {
          objc_msgSend(a1, "readPointFromNode:pointIdMap:state:", v10, v8, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Found non-point node"));
      }
    }
    v10 = OCXNextSibling(v10);
  }
  if (!v11)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("No document point"));

  return v11;
}

+ (id)readPointFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v8;
  uint64_t v9;
  __objc2_class **v10;
  ODDNodePoint *v11;
  ODDNodePoint *v12;
  ODDNodePoint *v13;
  void *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  _BOOL4 HasName;
  void *v18;
  CXNamespace *v19;
  _BOOL4 v20;
  CXNamespace *v21;
  _BOOL4 v22;
  OADShapeStyle *v23;
  void *v24;
  OADShapeStyle *v25;
  CXNamespace *v26;
  _BOOL4 v27;
  OADTextBody *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  id v34;

  v34 = a4;
  v8 = a5;
  v9 = objc_msgSend(a1, "readPointTypeFromNode:", a3);
  v10 = off_24F399398;
  switch((int)v9)
  {
    case 0:
    case 2:
      goto LABEL_6;
    case 1:
      v13 = objc_alloc_init(ODDNodePoint);
      v11 = v13;
      goto LABEL_7;
    case 3:
    case 5:
      v10 = off_24F3993A8;
      goto LABEL_6;
    case 4:
      v10 = off_24F3993A0;
LABEL_6:
      v11 = 0;
      v13 = (ODDNodePoint *)objc_alloc_init(*v10);
LABEL_7:
      v12 = v13;
      break;
    default:
      v11 = 0;
      v12 = 0;
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Unknown diagram node type"));
      break;
  }
  -[ODDNodePoint setType:](v12, "setType:", v9);
  objc_msgSend(v8, "officeArtState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODDPoint shapeProperties](v12, "shapeProperties");
  v32 = objc_claimAutoreleasedReturnValue();
  v15 = OCXFirstChild(a3);
  objc_msgSend(v8, "ODXDiagramNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(v15, v16, (xmlChar *)"prSet");

  if (HasName)
  {
    -[ODDPoint propertySet](v12, "propertySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ODXPointPropertySet readNode:toSet:](ODXPointPropertySet, "readNode:toSet:", v15, v18);

    v15 = OCXNextSibling(v15);
  }
  objc_msgSend(v8, "ODXDiagramNamespace", v32);
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = CXNodeHasName(v15, v19, (xmlChar *)"spPr");

  if (v20)
  {
    +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v15, v33, v14);
    v15 = OCXNextSibling(v15);
  }
  objc_msgSend(v8, "ODXDiagramNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = CXNodeHasName(v15, v21, (xmlChar *)"style");

  if (v22)
  {
    v23 = objc_alloc_init(OADShapeStyle);
    +[OAXShapeStyle readFromNode:shapeStyle:drawingState:](OAXShapeStyle, "readFromNode:shapeStyle:drawingState:", v15, v23, v14);
    objc_msgSend(v14, "styleMatrix");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:](v23, "applyToGraphicProperties:styleMatrix:", v33, v24);

    v15 = OCXNextSibling(v15);
    v25 = v23;
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v8, "ODXDiagramNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = CXNodeHasName(v15, v26, (xmlChar *)"t");

  if (v27)
  {
    v28 = objc_alloc_init(OADTextBody);
    -[ODDPoint setText:](v12, "setText:", v28);
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v15, v28, v14);
    if (v25)
      -[OADShapeStyle applyToTextBody:](v25, "applyToTextBody:", v28);

  }
  objc_msgSend(a1, "readModelIdentifierFromNode:attributeName:", a3, "modelId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Didn't find required model identifier"));
  objc_msgSend(v34, "objectForKey:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Already a point for the identifier"));
  objc_msgSend(v34, "setObject:forUncopiedKey:", v12, v29);

  return v11;
}

+ (int)readPointTypeFromNode:(_xmlNode *)a3
{
  xmlChar *NoNsProp;
  const xmlChar *v4;
  int v5;

  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"type");
  if (!NoNsProp)
    return 2;
  v4 = NoNsProp;
  if (xmlStrEqual(NoNsProp, (const xmlChar *)"node"))
  {
    v5 = 2;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"asst"))
  {
    v5 = 0;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"doc"))
  {
    v5 = 1;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"pres"))
  {
    v5 = 4;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"parTrans"))
  {
    v5 = 3;
  }
  else if (xmlStrEqual(v4, (const xmlChar *)"sibTrans"))
  {
    v5 = 5;
  }
  else
  {
    if (!xmlStrEqual(v4, (const xmlChar *)"unknown"))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Unknown diagram node type: %s"), v4);
    v5 = 6;
  }
  ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v4);
  return v5;
}

+ (id)readModelIdentifierFromNode:(_xmlNode *)a3 attributeName:(const char *)a4
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unsigned int v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initFromXmlNode:ns:attributeName:", a3, 0, a4);
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "length") == 38
      && objc_msgSend(v5, "characterAtIndex:", 0) == 123
      && objc_msgSend(v5, "characterAtIndex:", 37) == 125)
    {
      objc_msgSend(v5, "substringWithRange:", 1, 36);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = CFUUIDCreateFromString(0, v6);
      if (!v7)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Couldn't parse uuid: %@"), v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (-[__CFString scanInt:](v6, "scanInt:", &v9)
        && -[__CFString isAtEnd](v6, "isAtEnd"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Couldn't parse int: %@"), v5);
        v7 = 0;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)readConnectionListFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  id v8;
  _xmlNode *i;
  CXNamespace *v10;
  _BOOL4 HasName;
  id v12;

  v12 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(v8, "ODXDiagramNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      HasName = CXNodeHasName(i, v10, (xmlChar *)"cxn");

      if (HasName)
        objc_msgSend(a1, "readConnectionFromNode:pointIdMap:state:", i, v12, v8);
      else
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Found non-connection node"));
    }
  }

}

+ (void)readConnectionFromNode:(_xmlNode *)a3 pointIdMap:(id)a4 state:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(a1, "readModelIdentifierFromNode:attributeName:", a3, "srcId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing connection source"));
  objc_msgSend(a1, "readModelIdentifierFromNode:attributeName:", a3, "destId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing connection destination"));
  v11 = CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"srcOrd");
  CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"destOrd");
  v12 = objc_msgSend(a1, "readConnectionTypeFromNode:", a3);
  if (v12)
  {
    if (v12 == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Bad classes for presentation-of connection"));
      objc_msgSend(v8, "addPresentation:order:", v10, v11);
    }
    else if (v12 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Bad classes for presentation-parent-of connection"));
      objc_msgSend(v8, "addChild:order:", v10, v11);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Bad classes for parent-of connection"));
    v13 = v10;
    objc_msgSend(v8, "addChild:order:", v13, v11);
    objc_msgSend(a1, "readModelIdentifierFromNode:attributeName:", a3, "parTransId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v18, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v13, "setParentTransition:", v15);
      else
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing connection parent transition"));

    }
    objc_msgSend(a1, "readModelIdentifierFromNode:attributeName:", a3, "sibTransId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v18, "objectForKey:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v13, "setSiblingTransition:", v17);
      else
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing connection sibling transition"));

    }
  }

}

+ (int)readConnectionTypeFromNode:(_xmlNode *)a3
{
  xmlChar *NoNsProp;
  const xmlChar *v4;
  int v5;

  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"type");
  if (NoNsProp)
  {
    v4 = NoNsProp;
    if (!xmlStrEqual(NoNsProp, (const xmlChar *)"parOf"))
    {
      if (xmlStrEqual(v4, (const xmlChar *)"presOf"))
      {
        v5 = 1;
        goto LABEL_9;
      }
      if (xmlStrEqual(v4, (const xmlChar *)"presParOf"))
      {
        v5 = 2;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Unknown diagram node type: %s"), v4);
    }
    v5 = 0;
LABEL_9:
    ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v4);
    return v5;
  }
  return 0;
}

+ (void)associatePresentationsInIdMap:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      break;
    if (objc_msgSend(v4, "type") == 4)
    {
      objc_msgSend(v5, "propertySet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentationAssociatedId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v10, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            v9 = v5;
            objc_msgSend(v8, "addAssociatedPresentation:", v9);

          }
        }

      }
    }

  }
}

@end
