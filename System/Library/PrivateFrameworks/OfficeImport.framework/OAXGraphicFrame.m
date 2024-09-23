@implementation OAXGraphicFrame

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  CXNamespace *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _xmlNode *v11;
  void *v12;
  id v13;

  v7 = (CXNamespace *)a4;
  v8 = a5;
  +[OAXGraphicalObject readFromParentXmlNode:inNamespace:drawingState:](OAXGraphicalObject, "readFromParentXmlNode:inNamespace:drawingState:", a3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[OAXTransform2D readFromParentXmlNode:inNamespace:toDrawable:drawingState:](OAXTransform2D, "readFromParentXmlNode:inNamespace:toDrawable:drawingState:", a3, v7, v9, v8);
    v10 = OCXFindChild(a3, v7, "nvGraphicFramePr");
    if (v10)
      v11 = (_xmlNode *)v10;
    else
      v11 = a3;
    +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:](OAXDrawable, "readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:", a3, v7, "nvGraphicFramePr", v9, v8);
    objc_msgSend(v8, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "readClientDataFromGraphicalFramePropertiesNode:toDrawable:state:", v11, v9, v8);

    v13 = v9;
  }

  return v9;
}

@end
