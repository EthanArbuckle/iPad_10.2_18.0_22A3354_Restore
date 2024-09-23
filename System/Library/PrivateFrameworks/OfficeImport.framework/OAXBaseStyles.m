@implementation OAXBaseStyles

+ (void)readFromXmlNode:(_xmlNode *)a3 toBaseStyles:(id)a4 packagePart:(id)a5 drawingState:(id)a6
{
  id v9;
  id v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v10, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "clrScheme");

  if (v12)
  {
    objc_msgSend(v20, "colorScheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXColorScheme readFromXmlNode:toColorScheme:](OAXColorScheme, "readFromXmlNode:toColorScheme:", v12, v13);

  }
  objc_msgSend(v10, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "fmtScheme");

  if (v15)
  {
    objc_msgSend(v20, "styleMatrix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXStyleMatrix readFromNode:toStyleMatrix:packagePart:drawingState:](OAXStyleMatrix, "readFromNode:toStyleMatrix:packagePart:drawingState:", v15, v16, v9, v10);

  }
  objc_msgSend(v10, "OAXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "fontScheme");

  if (v18)
  {
    objc_msgSend(v20, "fontScheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXFontScheme readFontScheme:toFontScheme:drawingState:](OAXFontScheme, "readFontScheme:toFontScheme:drawingState:", v18, v19, v10);

  }
  objc_msgSend(v20, "validateBaseStyles");

}

@end
