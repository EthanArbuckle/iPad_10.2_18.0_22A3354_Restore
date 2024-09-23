@implementation OAXGroup

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  CXNamespace *v8;
  id v9;
  OADGroup *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = (CXNamespace *)a4;
  v9 = a5;
  v10 = objc_alloc_init(OADGroup);
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:](OAXDrawable, "readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:", a3, v8, "nvGrpSpPr", v10, v9);
  v11 = OCXFindChild(a3, v8, "grpSpPr");
  +[OAXTransform2D readFromParentXmlNode:inNamespace:toDrawable:drawingState:](OAXTransform2D, "readFromParentXmlNode:inNamespace:toDrawable:drawingState:", v11, v8, v10, v9);
  +[OAXTransform2D readChildrenBoundsFromParentXmlNode:inNamespace:drawingState:](OAXTransform2D, "readChildrenBoundsFromParentXmlNode:inNamespace:drawingState:", v11, v8, v9);
  -[OADGroup setLogicalBounds:](v10, "setLogicalBounds:");
  -[OADGroup groupProperties](v10, "groupProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readPropertiesFromXmlNode:properties:drawingState:", v11, v12, v9);

  objc_msgSend(v9, "pushGroup:", v10);
  +[OAXDrawable readDrawablesFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawablesFromXmlNode:inNamespace:drawingState:", a3, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v9, "popGroup");
  -[OADGroup addChildren:](v10, "addChildren:", v13);
  objc_msgSend(v9, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "readClientDataFromGroupNode:toGroup:state:", a3, v10, v9);

  -[OADGroup groupProperties](v10, "groupProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fill");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(a1, "applyGroupFill:toChildrenOfGroup:", v17, v10);
  }

  return v10;
}

+ (void)readPropertiesFromXmlNode:(_xmlNode *)a3 properties:(id)a4 drawingState:(id)a5
{
  id v7;
  _xmlNode *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    objc_msgSend(v7, "packagePart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v13, "setFill:", v10);
    if (xmlStrEqual(i->name, (const xmlChar *)"effectLst"))
    {
      objc_msgSend(v7, "packagePart");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", i, v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setEffects:", v12);
    }

  }
}

+ (void)applyGroupFill:(id)a3 toChildrenOfGroup:(id)a4
{
  id v6;
  unint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;

  v14 = a3;
  v6 = a4;
  for (i = 0; i < objc_msgSend(v6, "childCount"); ++i)
  {
    objc_msgSend(v6, "childAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      objc_msgSend(v9, "groupProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fill");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(a1, "applyGroupFill:toChildrenOfGroup:", v14, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
      objc_msgSend(v8, "shapeProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fill");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v11, "setFill:", v14);
    }

LABEL_11:
  }

}

@end
