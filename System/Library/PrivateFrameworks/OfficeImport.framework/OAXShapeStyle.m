@implementation OAXShapeStyle

+ (void)readFromNode:(_xmlNode *)a3 shapeStyle:(id)a4 drawingState:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  OADFontReference *v19;
  id v20;

  v20 = a4;
  v7 = a5;
  objc_msgSend(v7, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFirstChild(a3, v8, (xmlChar *)"lnRef");

  +[OAXStyleMatrix readReferenceFromNode:](OAXStyleMatrix, "readReferenceFromNode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLineReference:", v10);

  objc_msgSend(v7, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXNextSibling(v9, v11, (xmlChar *)"fillRef");

  +[OAXStyleMatrix readReferenceFromNode:](OAXStyleMatrix, "readReferenceFromNode:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFillReference:", v13);

  objc_msgSend(v7, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXNextSibling(v12, v14, (xmlChar *)"effectRef");

  +[OAXStyleMatrix readReferenceFromNode:](OAXStyleMatrix, "readReferenceFromNode:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEffectReference:", v16);

  objc_msgSend(v7, "OAXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXNextSibling(v15, v17, (xmlChar *)"fontRef");

  v19 = objc_alloc_init(OADFontReference);
  +[OAXFontReference readFromNode:fontReference:](OAXFontReference, "readFromNode:fontReference:", v18, v19);
  objc_msgSend(v20, "setFontReference:", v19);

}

@end
