@implementation OAXGraphic

+ (void)readPropertiesFromXmlNode:(_xmlNode *)a3 graphicProperties:(id)a4 drawingState:(id)a5
{
  id v7;
  _xmlNode *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _xmlNode *v21;
  id v22;

  v22 = a4;
  v7 = a5;
  v21 = a3;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    objc_msgSend(v7, "packagePart", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v22, "setFill:", v10);
    if (xmlStrEqual(i->name, (const xmlChar *)"effectLst"))
    {
      objc_msgSend(v7, "packagePart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", i, v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setEffects:", v12);
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"scene3d"))
    {
      objc_msgSend(v7, "packagePart");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXScene3D readScene3DFromXmlNode:packagePart:drawingState:](OAXScene3D, "readScene3DFromXmlNode:packagePart:drawingState:", i, v13, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setScene3D:", v14);

    }
    if (xmlStrEqual(i->name, (const xmlChar *)"sp3d"))
    {
      objc_msgSend(v7, "packagePart");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXShape3D readShape3DFromXmlNode:packagePart:drawingState:](OAXShape3D, "readShape3DFromXmlNode:packagePart:drawingState:", i, v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setShape3D:", v16);

    }
  }
  objc_msgSend(v7, "OAXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(v21, v17, "ln");

  if (v18)
  {
    objc_msgSend(v7, "packagePart");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", v18, v19, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setStroke:", v20);
  }

}

@end
