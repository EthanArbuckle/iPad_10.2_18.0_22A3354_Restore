@implementation EXDifferentialStyle

+ (id)edDifferentialStyleFromXmlDifferentialStyleElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  EDDifferentialStyle *v6;
  CXNamespace *v7;
  uint64_t v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;

  v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(EDDifferentialStyle);
    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v8 = OCXFindChild(a3, v7, "numFmt");

    +[EXContentFormat edContentFormatFromXmlContentFormatElement:](EXContentFormat, "edContentFormatFromXmlContentFormatElement:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDDifferentialStyle setContentFormat:](v6, "setContentFormat:", v9);

    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = OCXFindChild(a3, v10, "font");

    +[EXFont edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:](EXFont, "edFontFromXmlFontElement:inConditionalFormat:returnDefaultIfEmpty:state:", v11, 1, 1, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDDifferentialStyle setFont:](v6, "setFont:", v12);

    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = OCXFindChild(a3, v13, "border");

    +[EXBorders edBordersFromXmlBordersElement:state:](EXBorders, "edBordersFromXmlBordersElement:state:", v14, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDDifferentialStyle setBorders:](v6, "setBorders:", v15);

    objc_msgSend(v5, "EXSpreadsheetMLNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = OCXFindChild(a3, v16, "fill");

    +[EXFill edFillFromXmlFillElement:differentialFill:state:](EXFill, "edFillFromXmlFillElement:differentialFill:state:", v17, 1, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDDifferentialStyle setFill:](v6, "setFill:", v18);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
