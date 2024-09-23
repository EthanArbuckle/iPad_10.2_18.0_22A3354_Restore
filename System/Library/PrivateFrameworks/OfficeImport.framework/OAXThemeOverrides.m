@implementation OAXThemeOverrides

+ (void)readFromPackagePart:(id)a3 toThemeOverrides:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  _xmlNode *v9;
  CXNamespace *v10;
  uint64_t v11;
  OADColorScheme *v12;
  CXNamespace *v13;
  uint64_t v14;
  OADFontScheme *v15;
  uint64_t v16;
  OADStyleMatrix *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = a5;
  v9 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v18, "xmlDocument"));
  objc_msgSend(v8, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(v9, v10, "clrScheme");

  if (v11)
  {
    v12 = objc_alloc_init(OADColorScheme);
    objc_msgSend(v7, "setColorScheme:", v12);
    +[OAXColorScheme readFromXmlNode:toColorScheme:](OAXColorScheme, "readFromXmlNode:toColorScheme:", v11, v12);

  }
  objc_msgSend(v8, "OAXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(v9, v13, "fontScheme");

  if (v14)
  {
    v15 = objc_alloc_init(OADFontScheme);
    objc_msgSend(v7, "setFontScheme:", v15);
    +[OAXFontScheme readFontScheme:toFontScheme:drawingState:](OAXFontScheme, "readFontScheme:toFontScheme:drawingState:", v14, v15, v8);

  }
  v16 = OCXFindChild(v9, (CXNamespace *)CXNoNamespace, "styleMatrix");
  if (v16)
  {
    v17 = objc_alloc_init(OADStyleMatrix);
    +[OAXStyleMatrix readFromNode:toStyleMatrix:packagePart:drawingState:](OAXStyleMatrix, "readFromNode:toStyleMatrix:packagePart:drawingState:", v16, v17, v18, v8);
    objc_msgSend(v7, "setStyleMatrix:", v17);

  }
}

@end
