@implementation ODXStyleLabel

+ (void)readNode:(_xmlNode *)a3 label:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  uint64_t v9;
  OADShapeStyle *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  objc_msgSend(v7, "ODXDiagramNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "style");

  if (v9)
  {
    v10 = objc_alloc_init(OADShapeStyle);
    objc_msgSend(v7, "officeArtState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXShapeStyle readFromNode:shapeStyle:drawingState:](OAXShapeStyle, "readFromNode:shapeStyle:drawingState:", v9, v10, v11);

    objc_msgSend(v12, "setShapeStyle:", v10);
  }

}

@end
