@implementation OAXTextCharPropertyBag

+ (void)readCharacterProperties:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  _xmlNode *i;
  void *v22;
  void *v23;
  _xmlNode *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  BOOL v36;

  v8 = a4;
  v9 = a5;
  if (a3)
  {
    v36 = 0;
    v34 = 0.0;
    v35 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"b", &v36))
      objc_msgSend(v8, "setIsBold:", v36);
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"u", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v10;
    if (v10)
      objc_msgSend(v8, "setUnderlineType:", objc_msgSend(a1, "readUnderlineType:", v10));
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"i", &v36))
      objc_msgSend(v8, "setIsItalic:", v36);
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sz", &v35, 15))
    {
      *(float *)&v11 = (float)(v35 / 100);
      objc_msgSend(v8, "setSize:", v11);
    }
    if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseline", &v34))
    {
      HIDWORD(v12) = HIDWORD(v34);
      *(float *)&v12 = v34;
      objc_msgSend(v8, "setBaseline:", v12);
    }
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spc", &v35, 16))
    {
      v13 = (double)v35 / 100.0;
      *(float *)&v13 = v13;
      objc_msgSend(v8, "setSpacing:", v13);
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"kumimoji", &v36))
      objc_msgSend(v8, "setIsVerticalText:", v36);
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtl", &v36))
      objc_msgSend(v8, "setIsRightToLeft:", v36);
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"strike", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v32 = v14;
    if (v14)
    {
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("noStrike")) & 1) != 0)
      {
        v16 = 0;
      }
      else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("sngStrike")) & 1) != 0)
      {
        v16 = 1;
      }
      else if (objc_msgSend(v15, "isEqualToString:", CFSTR("dblStrike")))
      {
        v16 = 2;
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v8, "setStrikeThroughType:", v16);
    }
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"cap", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v31 = v17;
    if (v17)
    {
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("none")) & 1) != 0)
      {
        v19 = 0;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("small")) & 1) != 0)
      {
        v19 = 1;
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("all")))
      {
        v19 = 2;
      }
      else
      {
        v19 = 0;
      }
      objc_msgSend(v8, "setCaps:", v19);
    }
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lang", 0);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = v20;
    if (-[NSString length](v20, "length"))
      objc_msgSend(v8, "setLanguage:", OCDLanguageFromOfficeString(v20));
    v29 = a1;
    for (i = OCXFirstChild(a3); ; i = OCXNextSibling(i))
    {
      if (!i)
      {

        goto LABEL_72;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"ln"))
        break;
      if (xmlStrEqual(i->name, (const xmlChar *)"uFill"))
      {
        v24 = CXFirstChild(i);
        objc_msgSend(v9, "packagePart");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", v24, v25, v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend(v8, "setUnderlineFill:", v23);
        goto LABEL_46;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"uFillTx"))
      {
        objc_msgSend(v8, "setUnderlineFill:", 0);
      }
      else
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"uLn"))
        {
          objc_msgSend(v9, "packagePart");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v26, v9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v8, "setUnderlineStroke:", v23);
          goto LABEL_46;
        }
        if (xmlStrEqual(i->name, (const xmlChar *)"uLnTx"))
        {
          objc_msgSend(v8, "setUnderlineStroke:", 0);
        }
        else if (xmlStrEqual(i->name, (const xmlChar *)"formatting"))
        {
          objc_msgSend(v29, "readFormatting:characterProperties:drawingState:", i, v8, v9);
        }
        else
        {
          if (!xmlStrEqual(i->name, (const xmlChar *)"latin")
            && !xmlStrEqual(i->name, (const xmlChar *)"ea")
            && !xmlStrEqual(i->name, (const xmlChar *)"cs")
            && !xmlStrEqual(i->name, (const xmlChar *)"hAnsi")
            && !xmlStrEqual(i->name, (const xmlChar *)"sym"))
          {
            if (xmlStrEqual(i->name, (const xmlChar *)"hlinkClick"))
            {
              +[OAXHyperlink readHyperlink:state:](OAXHyperlink, "readHyperlink:state:", i, v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setClickHyperlink:", v23);
            }
            else if (xmlStrEqual(i->name, (const xmlChar *)"hlinkMouseOver"))
            {
              +[OAXHyperlink readHyperlink:state:](OAXHyperlink, "readHyperlink:state:", i, v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setHoverHyperlink:", v23);
            }
            else if (xmlStrEqual(i->name, (const xmlChar *)"effectLst"))
            {
              objc_msgSend(v9, "packagePart");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", i, v23, v9);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setEffects:", v27);

            }
            else
            {
              objc_msgSend(v9, "packagePart");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v28, v9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
                objc_msgSend(v8, "setFill:", v23);
            }
            goto LABEL_46;
          }
          objc_msgSend(v29, "readFont:characterProperties:", i, v8, v29);
        }
      }
LABEL_47:
      ;
    }
    objc_msgSend(v9, "packagePart");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", i, v22, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v8, "setStroke:", v23);
LABEL_46:

    goto LABEL_47;
  }
LABEL_72:

}

+ (void)readFont:(_xmlNode *)a3 characterProperties:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"typeface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (xmlStrEqual(a3->name, (const xmlChar *)"latin"))
  {
    objc_msgSend(v6, "setLatinFont:", v5);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"ea"))
  {
    objc_msgSend(v6, "setEastAsianFont:", v5);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"cs"))
  {
    objc_msgSend(v6, "setBidiFont:", v5);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"hAnsi"))
  {
    objc_msgSend(v6, "setHAnsiFont:", v5);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"sym"))
  {
    objc_msgSend(v6, "setSymbolFont:", v5);
  }

}

+ (id)oaxUnderlineMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_13, 0, &dword_22A0CC000);
  }
  if (+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::once != -1)
    dispatch_once(&+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::once, &__block_literal_global_52);
  return (id)+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap;
}

void __50__OAXTextCharPropertyBag_Private__oaxUnderlineMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::oaxUnderlineMap, 20, 1);
  v1 = (void *)+[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap;
  +[OAXTextCharPropertyBag(Private) oaxUnderlineMap]::enumerationMap = (uint64_t)v0;

}

+ (unsigned)readUnderlineType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = a3;
  objc_msgSend(a1, "oaxUnderlineMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForString:", v4);

  if (v6 == -130883970)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

+ (void)readFormatting:(_xmlNode *)a3 characterProperties:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  CXNamespace *v9;
  _xmlNode *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  BOOL v15;

  v7 = a4;
  v8 = a5;
  v15 = 0;
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "outline");

  if (v10 && CXOptionalBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15))
    objc_msgSend(v7, "setFormatType:", 1);
  objc_msgSend(v8, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "engrave");

  if (v12 && CXOptionalBoolAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15))
    objc_msgSend(v7, "setFormatType:", 2);
  objc_msgSend(v8, "OAXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "emboss");

  if (v14 && CXOptionalBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v15))
    objc_msgSend(v7, "setFormatType:", 3);

}

+ (id)stringWithCapsType:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("none");
  else
    return off_24F39D470[(char)a3];
}

+ (id)stringWithStrikeThroughType:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("noStrike");
  else
    return off_24F39D488[(char)a3];
}

+ (id)stringWithUnderlineType:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(a1, "oaxUnderlineMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
