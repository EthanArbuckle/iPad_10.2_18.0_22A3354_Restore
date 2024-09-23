@implementation EXColorTable

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v6;
  void *v7;
  CXNamespace *v8;
  uint64_t v9;
  EDColorsCollection *v10;
  void *v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(v18, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3
    && (objc_msgSend(v18, "EXSpreadsheetMLNamespace"),
        v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v9 = OCXFindChild(a3, v8, "indexedColors"),
        v8,
        v9))
  {
    v10 = -[EDColorsCollection initWithDefaultSetup:]([EDColorsCollection alloc], "initWithDefaultSetup:", 0);

    objc_msgSend(a1, "readColorsFrom:toEDColors:state:", v9, v10, v18);
    objc_msgSend(v18, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColors:", v10);

    v7 = v10;
  }
  else
  {
    objc_msgSend(v7, "addPalette:paletteSize:paletteX:paletteXSize:", 0, 0, 0, 0);
  }
  objc_msgSend(v18, "resources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "themes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3
    && (objc_msgSend(v18, "EXSpreadsheetMLNamespace"),
        v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
        v15 = OCXFindChild(a3, v14, "themeColors"),
        v14,
        v15))
  {
    objc_msgSend(a1, "readColorsFrom:toEDColors:state:", v15, v13, v18);
  }
  else
  {
    objc_msgSend(v18, "workbook");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readOADThemeFrom:toEDThemeColors:", v17, v13);

  }
}

+ (void)readOADThemeFrom:(id)a3 toEDThemeColors:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (v11)
  {
    objc_msgSend(v11, "baseStyles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorScheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; objc_msgSend(v7, "colorCount") > (unint64_t)i; i = (i + 1))
    {
      objc_msgSend(v7, "colorForIndex:", +[EDColorsCollection oadSchemeColorIdFromThemeIndex:](EDColorsCollection, "oadSchemeColorIdFromThemeIndex:", i));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        +[OADColor tsuColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "tsuColorWithColor:colorMap:colorScheme:colorPalette:", v9, 0, v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

      }
    }

  }
}

+ (void)readColorsFrom:(_xmlNode *)a3 toEDColors:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *Child;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  id v17;
  uint64_t v18;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(a3, v10, "rgbColor");

    while (Child)
    {
      v17 = 0;
      v18 = 0;
      v12 = CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"rgb", &v17);
      v13 = v17;
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scanHexInt:", &v18);
        +[OITSUColor colorWithRGBValue:](OITSUColor, "colorWithRGBValue:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

      }
      objc_msgSend(v9, "EXSpreadsheetMLNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v16, (xmlChar *)"rgbColor");

    }
  }

}

@end
