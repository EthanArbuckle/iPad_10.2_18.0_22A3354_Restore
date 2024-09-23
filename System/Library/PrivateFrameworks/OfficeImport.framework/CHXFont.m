@implementation CHXFont

+ (id)edRunCollectionFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  OADTextBody *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (a3)
  {
    v6 = objc_alloc_init(OADTextBody);
    objc_msgSend(v5, "drawingState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", a3, v6, v7);

    +[CHXFont edFontWithOadTextBody:state:](CHXFont, "edFontWithOadTextBody:state:", v6, v5);
    a3 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    if (-[OADTextBody paragraphCount](v6, "paragraphCount"))
    {
      -[OADTextBody firstParagraphEffects](v6, "firstParagraphEffects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    if (a3)
    {
      +[OAXEffect updateIncomingEffects:](OAXEffect, "updateIncomingEffects:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "resources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDRun runWithCharIndex:font:effects:resources:](EDRun, "runWithCharIndex:font:effects:resources:", 0, a3, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[EDCollection collection](EDRunsCollection, "collection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      v8 = (void *)v10;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v9;
}

+ (id)edFontFromXmlTextPropertiesElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  OADTextBody *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = objc_alloc_init(OADTextBody);
  objc_msgSend(v6, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", a3, v7, v8);

  objc_msgSend(a1, "edFontWithOadTextBody:state:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)edFontWithOadTextBody:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "paragraphCount"))
  {
    objc_msgSend(v6, "paragraphAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "edFontWithOadCharacterProperties:state:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)edFontWithOadCharacterProperties:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "defaultTextProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  for (i = v9; ; i = v11)
  {
    objc_msgSend(i, "parent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      break;
    +[OADParagraphProperties defaultProperties](OADParagraphProperties, "defaultProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) != 0)
      break;
    v14 = v8;
    if (v8)
    {
      v15 = v14;
      while (v15 != v11)
      {
        objc_msgSend(v15, "parent");
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
        if (!v16)
          goto LABEL_8;
      }

      break;
    }
LABEL_8:

  }
  objc_msgSend(i, "parent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(i, "setParent:", v8);
  objc_msgSend(a1, "edFontWithFullOadCharacterProperties:state:", v9, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(i, "setParent:", v17);

  return v18;
}

+ (id)edFontWithFullOadCharacterProperties:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  EDFont *v7;
  void *v8;
  EDFont *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *v13;
  OADFontScheme *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  v7 = [EDFont alloc];
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDFont initWithResources:](v7, "initWithResources:", v8);

  objc_msgSend(v6, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasLatinFont"))
  {
    objc_msgSend(v5, "latinFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v5, "latinFont");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fontScheme");
      v14 = (OADFontScheme *)objc_claimAutoreleasedReturnValue();
      OADAbsoluteFontNameWithPossiblyRelativeFontNameAndFontScheme(v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDFont setName:](v9, "setName:", v15);

    }
  }
  objc_msgSend(v5, "fill");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorScheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADColor tsuColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "tsuColorWithColor:colorMap:colorScheme:colorPalette:", v17, v18, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDFont setColor:](v9, "setColor:", v20);
  }

  objc_msgSend(v5, "size");
  -[EDFont setHeight:](v9, "setHeight:", (float)(v21 * 20.0));
  if (objc_msgSend(v5, "underlineType") == 3)
    v22 = 2;
  else
    v22 = objc_msgSend(v5, "underlineType") != 0;
  -[EDFont setUnderline:](v9, "setUnderline:", v22);
  -[EDFont setBold:](v9, "setBold:", objc_msgSend(v5, "isBold"));
  -[EDFont setItalic:](v9, "setItalic:", objc_msgSend(v5, "isItalic"));
  if (objc_msgSend(v5, "strikeThroughType"))
    -[EDFont setStrike:](v9, "setStrike:", 1);
  objc_msgSend(v6, "resources");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fonts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "indexOfObject:", v9);
  if (v25 == -1)
    v25 = objc_msgSend(v24, "addObject:", v9);
  objc_msgSend(v24, "objectAtIndex:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)defaultEdRunCollectionWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "defaultTextProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHXFont edFontWithFullOadCharacterProperties:state:](CHXFont, "edFontWithFullOadCharacterProperties:state:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDCollection collection](EDRunsCollection, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDRun runWithCharIndex:font:effects:resources:](EDRun, "runWithCharIndex:font:effects:resources:", 0, v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v8);
  return v6;
}

+ (id)defaultEdRunCollectionForTitle:(id)a3 titleElement:(_xmlNode *)a4 state:(id)a5
{
  id v7;
  OADCharacterProperties *v8;
  void *v9;
  void *v10;
  CXNamespace *v11;
  void *v12;
  OADTextBody *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a5;
  objc_msgSend(v7, "pushTitleTextProperties:", 1);
  v8 = objc_alloc_init(OADCharacterProperties);
  objc_msgSend(a1, "edFontWithOadCharacterProperties:state:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popTitleTextProperties");
  if (v9)
  {
    objc_msgSend(v7, "drawingState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "OAXChartNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)OCXFindChild(a4, v11, "txPr");

    if (v12)
    {
      v13 = objc_alloc_init(OADTextBody);
      objc_msgSend(v7, "drawingState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v12, v13, v14);

      if (-[OADTextBody paragraphCount](v13, "paragraphCount"))
      {
        -[OADTextBody firstParagraphEffects](v13, "firstParagraphEffects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    objc_msgSend(v7, "resources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDRun runWithCharIndex:font:effects:resources:](EDRun, "runWithCharIndex:font:effects:resources:", 0, v9, v12, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDCollection collection](EDRunsCollection, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)readParagraphPropertiesFromXmlTextPropertiesParentElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  uint64_t v8;
  OADTextBody *v9;
  void *v10;
  void *v11;
  OADParagraphProperties *v12;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindChild(a3, v7, "txPr");

  if (v8)
  {
    v9 = objc_alloc_init(OADTextBody);
    objc_msgSend(v5, "drawingState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v8, v9, v10);

    if (-[OADTextBody paragraphCount](v9, "paragraphCount"))
    {
      -[OADTextBody paragraphAtIndex:](v9, "paragraphAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "properties");
      v12 = (OADParagraphProperties *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = objc_alloc_init(OADParagraphProperties);
  }

  return v12;
}

+ (void)mapFontProperties:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  OADSolidFill *v19;
  unsigned int v20;
  unint64_t v21;
  int v22;
  double v23;
  float v24;
  void *v25;
  id v26;

  v26 = a3;
  v5 = a4;
  objc_msgSend(v26, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLatinFont:", v6);

  objc_msgSend(v26, "height");
  v8 = v7 / 20.0;
  *(float *)&v8 = v8;
  objc_msgSend(v5, "setSize:", v8);
  objc_msgSend(v5, "setIsBold:", objc_msgSend(v26, "isBold"));
  objc_msgSend(v5, "setIsItalic:", objc_msgSend(v26, "isItalic"));
  objc_msgSend(v26, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "redComponent");
  v11 = v10;
  objc_msgSend(v9, "greenComponent");
  v13 = v12;
  objc_msgSend(v9, "blueComponent");
  v14 = v11;
  *(float *)&v15 = v13;
  *(float *)&v17 = v16;
  *(float *)&v16 = v14;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v16, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(OADSolidFill);
  -[OADSolidFill setColor:](v19, "setColor:", v18);
  objc_msgSend(v5, "setFill:", v19);
  if (objc_msgSend(v26, "isUnderlineOverridden"))
  {
    v20 = objc_msgSend(v26, "underline");
    v21 = 0x302030200uLL >> (8 * v20);
    if (v20 >= 5)
      LOBYTE(v21) = 0;
    objc_msgSend(v5, "setUnderlineType:", v21 & 3);
  }
  if (objc_msgSend(v26, "isStrikeOverridden"))
    objc_msgSend(v5, "setStrikeThroughType:", objc_msgSend(v26, "isStrike"));
  if (objc_msgSend(v26, "script"))
  {
    v22 = objc_msgSend(v26, "script");
    objc_msgSend(v5, "size");
    v24 = -0.06;
    if (v22 != 2)
      v24 = 0.0;
    if (v22 == 1)
      v24 = 0.32;
    *(float *)&v23 = v24 / *(float *)&v23;
    objc_msgSend(v5, "setBaseline:", v23);
  }
  objc_msgSend(v5, "setFormatType:", objc_msgSend(v26, "isOutline"));
  if ((objc_msgSend(v5, "hasEffects") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEffects:", v25);

  }
}

+ (void)mapFontProperties:(id)a3 toTextProps:(id)a4 withEffects:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (v13 && v8)
  {
    objc_msgSend(v8, "addParagraph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
      objc_msgSend(v11, "setEffects:", v9);
    objc_msgSend(a1, "mapFontProperties:to:", v13, v12);

  }
}

@end
