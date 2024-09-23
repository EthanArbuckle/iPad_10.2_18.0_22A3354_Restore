@implementation OAXShape

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  CXNamespace *v8;
  id v9;
  OADShape *v10;
  void *v11;
  uint64_t v12;
  _xmlNode *v13;

  v8 = (CXNamespace *)a4;
  v9 = a5;
  v10 = objc_alloc_init(OADShape);
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:](OAXDrawable, "readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:", a3, v8, "nvSpPr", v10, v9);
  -[OADShape shapeProperties](v10, "shapeProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v8, "nvSpPr");
  if (v12)
    v13 = (_xmlNode *)v12;
  else
    v13 = a3;
  objc_msgSend(a1, "readNonVisualShapeProperties:nodeName:inNamespace:shapeProperties:", v13, "cNvSpPr", v8, v11);
  objc_msgSend(a1, "readCoreFromXmlNode:inNamespace:toShape:drawingState:", a3, v8, v10, v9);

  return v10;
}

+ (void)readNonVisualShapeProperties:(_xmlNode *)a3 nodeName:(const char *)a4 inNamespace:(id)a5 shapeProperties:(id)a6
{
  _xmlNode *v9;
  id v10;

  v10 = a6;
  v9 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)a5, a4);
  if (v9)
    objc_msgSend(v10, "setIsTextBox:", CXDefaultBoolAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"txBox", 0));

}

+ (void)readCoreFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toShape:(id)a5 drawingState:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  OADShapeStyle *v13;
  uint64_t v14;
  void *v15;
  OADBackgroundFill *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  CXNamespace *v30;

  v30 = (CXNamespace *)a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v9, "shapeProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v30, "style");
  if (v12)
  {
    v13 = objc_alloc_init(OADShapeStyle);
    +[OAXShapeStyle readFromNode:shapeStyle:drawingState:](OAXShapeStyle, "readFromNode:shapeStyle:drawingState:", v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = OCXFindChild(a3, v30, "spPr");
  if (!v14)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v14, v11, v10);
  if (v13)
  {
    objc_msgSend(v10, "styleMatrix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:](v13, "applyToGraphicProperties:styleMatrix:", v11, v15);

  }
  if (CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useBgFill", 0))
  {
    v16 = objc_alloc_init(OADBackgroundFill);
    objc_msgSend(v11, "setFill:", v16);

  }
  +[OAXTransform2D readFromParentXmlNode:inNamespace:toDrawable:drawingState:](OAXTransform2D, "readFromParentXmlNode:inNamespace:toDrawable:drawingState:", v14, v30, v9, v10);
  +[OAXGeometry readFromParentXmlNode:drawingState:](OAXGeometry, "readFromParentXmlNode:drawingState:", v14, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGeometry:", v17);

  v18 = OCXFindChild(a3, v30, "txBody");
  if (v18
    || (objc_msgSend(v10, "OAXMainNamespace"),
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v21 = (_xmlNode *)OCXFindChild(a3, v20, "txSp"),
        v20,
        v21)
    && (v18 = OCXFindChild(v21, v30, "txBody")) != 0)
  {
    objc_msgSend(v9, "textBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v18, v19, v10);
    if (v13)
      -[OADShapeStyle applyToTextBody:](v13, "applyToTextBody:", v19);
  }
  else
  {
    v22 = OCXFindChild(a3, v30, "bodyPr");
    if (!v22)
      goto LABEL_18;
    objc_msgSend(v9, "textBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "properties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyProperties:textBodyProperties:drawingState:](OAXTextBody, "readTextBodyProperties:textBodyProperties:drawingState:", v22, v23, v10);

  }
LABEL_18:
  v24 = OCXFindChild(a3, v30, "txXfrm");
  if (v24)
  {
    +[OAXTransform2D readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:](OAXTransform2D, "readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:", v24, v30, objc_msgSend(v10, "isInsideGroup"), v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextOrientedBounds:", v25);

  }
  v26 = OCXFindChild(a3, v30, "bodyPr");
  if (v26)
  {
    objc_msgSend(v9, "textBody");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "properties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyProperties:textBodyProperties:drawingState:](OAXTextBody, "readTextBodyProperties:textBodyProperties:drawingState:", v26, v28, v10);

  }
  objc_msgSend(v10, "client");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "readClientDataFromShapeNode:toShape:state:", a3, v9, v10);

}

+ (BOOL)isWritable:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[OAXGeometry stringWritingShapeType:](OAXGeometry, "stringWritingShapeType:", objc_msgSend(v3, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end
