@implementation ODXStyleDefinition

+ (void)readNode:(_xmlNode *)a3 definition:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  BOOL HasName;
  CXNamespace *v10;
  _xmlNode *v11;
  CXNamespace *v12;
  _BOOL4 v13;
  ODDStyleLabel *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  objc_msgSend(v7, "ODXDiagramNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v8, (xmlChar *)"styleDef");

  if (!HasName)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Not a diagram style definition node"));
  objc_msgSend(v7, "ODXDiagramNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "styleLbl");

  while (1)
  {
    objc_msgSend(v7, "ODXDiagramNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = CXNodeHasName(v11, v12, (xmlChar *)"styleLbl");

    if (!v13)
      break;
    v14 = objc_alloc_init(ODDStyleLabel);
    +[ODXStyleLabel readNode:label:state:](ODXStyleLabel, "readNode:label:state:", v11, v14, v7);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initFromXmlNode:ns:attributeName:", v11, 0, "name");
    if (!v15)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ODXException"), CFSTR("Missing style label name"));
    objc_msgSend(v16, "setLabel:forName:", v14, v15);
    v11 = OCXNextSibling(v11);

  }
}

@end
