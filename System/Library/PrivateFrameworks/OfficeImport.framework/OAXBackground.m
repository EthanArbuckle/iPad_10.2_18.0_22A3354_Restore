@implementation OAXBackground

+ (id)readBackgroundFromParentNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  CXNamespace *v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _xmlNode *v17;
  _xmlNode *v18;
  void *v19;
  void *v20;
  OADBackgroundProperties *v21;
  OADBackgroundProperties *v22;
  id v24;
  unsigned int v25;

  v7 = (CXNamespace *)a4;
  v8 = a5;
  v25 = 0;
  v9 = OCXFindChild(a3, v7, "bg");
  if (!v9)
  {
    v14 = 0;
    v11 = 0;
    goto LABEL_19;
  }
  v24 = 0;
  v10 = +[OAXStyleMatrix readReferenceFromParentNode:name:inNamespace:color:index:](OAXStyleMatrix, "readReferenceFromParentNode:name:inNamespace:color:index:", v9, "bgRef", v7, &v24, &v25);
  v11 = v24;
  if (!v10)
  {
    v17 = (_xmlNode *)OCXFindChild((_xmlNode *)v9, v7, "bgPr");
    if (!v17)
    {
      v14 = 0;
      v9 = 0;
      goto LABEL_19;
    }
    v18 = OCXFirstChild(v17);
    v14 = 0;
    v9 = 0;
    while (1)
    {
      if (!v18)
        goto LABEL_19;
      if (v14)
      {
        if (v9)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(v8, "packagePart");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", v18, v19, v8);
        v14 = objc_claimAutoreleasedReturnValue();

        if (v9)
          goto LABEL_17;
      }
      if (xmlStrEqual(v18->name, (const xmlChar *)"effectLst"))
      {
        objc_msgSend(v8, "packagePart");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", v18, v20, v8);
        v9 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
LABEL_17:
      v18 = OCXNextSibling(v18);
    }
  }
  objc_msgSend(v8, "styleMatrix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bgFillAtIndex:", v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");

  v9 = 0;
  if (v14 && v11)
  {
    objc_msgSend((id)v14, "setStyleColor:", v11);
    v15 = 0;
    v9 = 0;
    v16 = 1;
    goto LABEL_20;
  }
LABEL_19:
  v16 = v14 != 0;
  v15 = v9 != 0;
  if (!(v14 | v9))
  {
    v9 = 0;
    v14 = 0;
    v22 = 0;
    goto LABEL_25;
  }
LABEL_20:
  v21 = objc_alloc_init(OADBackgroundProperties);
  v22 = v21;
  if (v16)
    -[OADBackgroundProperties setFill:](v21, "setFill:", v14);
  if (v15)
    -[OADBackgroundProperties setEffects:](v22, "setEffects:", v9);
LABEL_25:

  return v22;
}

@end
