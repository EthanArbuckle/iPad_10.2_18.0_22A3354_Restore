@implementation OAXFill

+ (id)readFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  if (a3->type != XML_ELEMENT_NODE)
    goto LABEL_15;
  if (!xmlStrEqual(a3->name, (const xmlChar *)"noFill"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"solidFill"))
    {
      objc_msgSend(a1, "readSolidFillFromXmlNode:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"gradFill"))
    {
      objc_msgSend(a1, "readGradientFillFromXmlNode:drawingState:", a3, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"blipFill"))
    {
      objc_msgSend(a1, "readImageFillFromXmlNode:packagePart:forDrawable:drawingState:", a3, v8, 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"pattFill"))
    {
      objc_msgSend(a1, "readPresetPatternFillFromXmlNode:drawingState:", a3, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (xmlStrEqual(a3->name, (const xmlChar *)"grpFill"))
    {
      objc_msgSend(a1, "readGroupFillFromXmlNode:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  objc_msgSend(a1, "readNullFillFromXmlNode:", a3);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v11 = (void *)v10;
LABEL_16:

  return v11;
}

+ (id)readSolidFillFromXmlNode:(_xmlNode *)a3
{
  OADSolidFill *v4;
  void *v5;

  v4 = objc_alloc_init(OADSolidFill);
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[OADSolidFill setColor:](v4, "setColor:", v5);

  return v4;
}

+ (id)pathGradientFillTypeEnumMap
{
  if (+[OAXFill(Private) pathGradientFillTypeEnumMap]::once != -1)
    dispatch_once(&+[OAXFill(Private) pathGradientFillTypeEnumMap]::once, &__block_literal_global_47);
  return (id)+[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap;
}

+ (id)readNullFillFromXmlNode:(_xmlNode *)a3
{
  return +[OADNullFill nullFill](OADNullFill, "nullFill", a3);
}

+ (id)tileFlipModeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
  if (!+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_7, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumStructs, 4, 1);
    v5 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
    +[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXFill(Private) tileFlipModeEnumMap]::tileFlipModeEnumMap;
  }
  return v2;
}

+ (void)readTile:(_xmlNode *)a3 tile:(id)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  +[OAXBaseTypes readOptionalLengthFromXmlNode:name:](OAXBaseTypes, "readOptionalLengthFromXmlNode:name:", a3, "tx");
  objc_msgSend(v13, "setOffsetX:");
  +[OAXBaseTypes readOptionalLengthFromXmlNode:name:](OAXBaseTypes, "readOptionalLengthFromXmlNode:name:", a3, "tx");
  objc_msgSend(v13, "setOffsetY:");
  v6 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", 1.0);
  *(float *)&v6 = v6;
  objc_msgSend(v13, "setScaleX:", v6);
  v7 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", 1.0);
  *(float *)&v7 = v7;
  objc_msgSend(v13, "setScaleY:", v7);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flip", (NSString *)CFSTR("none"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileFlipModeEnumMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "valueForString:", v8);

  objc_msgSend(v13, "setFlipMode:", v10);
  v11 = +[OAXBaseTypes readRectAlignmentFromXmlNode:name:](OAXBaseTypes, "readRectAlignmentFromXmlNode:name:", a3, "algn");
  if (v11 <= 1)
    v12 = 1;
  else
    v12 = v11;
  objc_msgSend(v13, "setAlignment:", v12);

}

+ (id)readGroupFillFromXmlNode:(_xmlNode *)a3
{
  return objc_alloc_init(OADGroupFill);
}

+ (id)presetPatternFillTypeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
  if (!+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_178, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumStructs, 54, 1);
    v5 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
    +[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXFill(Private) presetPatternFillTypeEnumMap]::presetPatternFillTypeEnumMap;
  }
  return v2;
}

+ (id)readBlipRefFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6 forBullet:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CXNamespace *v22;
  _xmlNode *v23;
  _xmlNode *v24;
  void *v25;
  void *v26;
  id v27;

  v7 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "blip");

  if (!v15)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v13, "OCXReadRelationshipForNode:attributeName:packagePart:", v15, "embed", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "targetLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v13, "bulletBlipRefForURL:", v18);
    else
      objc_msgSend(v13, "blipRefForURL:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXBlipEffects readBlipEffectsFromBlipRef:toBlipRef:drawingState:](OAXBlipEffects, "readBlipEffectsFromBlipRef:toBlipRef:drawingState:", v15, v21, v13);
  }
  else
  {
    objc_msgSend(v13, "OCXReadRelationshipForNode:attributeName:packagePart:", v15, "link", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    if (!v19)
    {
      v27 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v19, "targetLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "relativeString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[OADBlipRef blipRefWithIndex:name:blip:](OADBlipRef, "blipRefWithIndex:name:blip:", 0, v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v13, "OAXMainNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v23 = (_xmlNode *)OCXFindChild(v15, v22, "extLst");

  if (v23)
  {
    v24 = OCXFirstChildNamed(v23, (xmlChar *)"ext");
    while (v24)
    {
      CXDefaultStringAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "client");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "readBlipExtWithURI:fromNode:toDrawable:state:", v25, v24, v12, v13);

      v24 = OCXNextSiblingNamed(v24, (xmlChar *)"ext");
    }
  }
  v27 = v21;

LABEL_14:
  return v27;
}

+ (id)readImageFillFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 forDrawable:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  id v12;
  OADImageFill *v13;
  CXNamespace *v14;
  uint64_t v15;
  OADStretchTechnique *v16;
  CXNamespace *v17;
  uint64_t v18;
  CXNamespace *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(OADImageFill);
  objc_msgSend(v12, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "stretch");

  if (v15)
  {
    v16 = objc_alloc_init(OADStretchTechnique);
    objc_msgSend(a1, "readStretch:stretch:", v15, v16);
    -[OADImageFill setTechnique:](v13, "setTechnique:", v16);
  }
  else
  {
    v16 = objc_alloc_init(OADTileTechnique);
    objc_msgSend(v12, "OAXMainNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v18 = OCXFindChild(a3, v17, "tile");

    if (v18)
      objc_msgSend(a1, "readTile:tile:", v18, v16);
    -[OADImageFill setTechnique:](v13, "setTechnique:", v16);
  }

  objc_msgSend(v12, "OAXMainNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = OCXFindChild(a3, v19, "srcRect");

  if (v20)
  {
    +[OAXBaseTypes readRelativeRectFromXmlNode:](OAXBaseTypes, "readRelativeRectFromXmlNode:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADImageFill setSourceRect:](v13, "setSourceRect:", v21);

  }
  v24 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v24))
    -[OADImageFill setRotateWithShape:](v13, "setRotateWithShape:", v24);
  objc_msgSend(a1, "readBlipRefFromXmlNode:packagePart:forDrawable:drawingState:forBullet:", a3, v10, v11, v12, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    -[OADImageFill setBlipRef:](v13, "setBlipRef:", v22);

  return v13;
}

+ (void)readGradientFillFromXmlNode:(_xmlNode *)a3 toGradientFill:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  CXNamespace *v10;
  _xmlNode *v11;
  id v12;
  CXNamespace *v13;
  _xmlNode *Child;
  int v15;
  int v16;
  void *v17;
  double v18;
  CXNamespace *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CXNamespace *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _xmlNode *v28;
  _xmlNode *v29;
  BOOL v30;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "gsLst");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v9, "OAXMainNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v26 = a1;
    v28 = a3;
    Child = (_xmlNode *)OCXFindChild(v11, v13, "gs");

    while (Child)
    {
      +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", Child, "pos", v26, v28);
      v16 = v15;
      +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", Child);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = v16;
      +[OADGradientFillStop addStopWithColor:position:toArray:](OADGradientFillStop, "addStopWithColor:position:toArray:", v17, v12, v18);
      objc_msgSend(v9, "OAXMainNamespace");
      v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v19, (xmlChar *)"gs");

    }
    objc_msgSend(v8, "setStops:", v12, v26, v28);
    a1 = v27;
    a3 = v29;

  }
  v30 = 0;
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v30))
    objc_msgSend(v8, "setRotateWithShape:", v30);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flip", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(a1, "tileFlipModeEnumMap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "valueForString:", v20);

    objc_msgSend(v8, "setFlipMode:", v22);
  }
  objc_msgSend(v9, "OAXMainNamespace");
  v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v24 = OCXFindChild(a3, v23, "tileRect");

  if (v24)
  {
    +[OAXBaseTypes readRelativeRectFromXmlNode:](OAXBaseTypes, "readRelativeRectFromXmlNode:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTileRect:", v25);

  }
}

+ (id)readLinearGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADGradientFill *v7;
  OADLinearShade *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  double v11;
  BOOL v13;
  uint64_t v14;

  v6 = a4;
  v7 = objc_alloc_init(OADGradientFill);
  objc_msgSend(a1, "readGradientFillFromXmlNode:toGradientFill:drawingState:", a3, v7, v6);
  v8 = objc_alloc_init(OADLinearShade);
  objc_msgSend(v6, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "lin");

  if (v10)
  {
    v14 = 0;
    if (CXOptionalLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"ang", &v14))
    {
      v11 = (double)v14 / 60000.0;
      *(float *)&v11 = v11;
      -[OADLinearShade setAngle:](v8, "setAngle:", v11);
    }
    v13 = 0;
    if (CXOptionalBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"scaled", &v13))
      -[OADLinearShade setScaled:](v8, "setScaled:", v13);
  }
  -[OADGradientFill setShade:](v7, "setShade:", v8);

  return v7;
}

+ (id)readPathGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADGradientFill *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  OADPathShade *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;

  v6 = a4;
  v7 = objc_alloc_init(OADGradientFill);
  objc_msgSend(a1, "readGradientFillFromXmlNode:toGradientFill:drawingState:", a3, v7, v6);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "path");

  if (!v9)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  v10 = objc_alloc_init(OADPathShade);
  CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"path", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "pathGradientFillTypeEnumMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "valueForString:", v11);

    -[OADPathShade setType:](v10, "setType:", v13);
  }
  objc_msgSend(v6, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(v9, v14, "fillToRect");

  if (v15)
  {
    +[OAXBaseTypes readRelativeRectFromXmlNode:](OAXBaseTypes, "readRelativeRectFromXmlNode:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPathShade setFillToRect:](v10, "setFillToRect:", v16);

  }
  -[OADGradientFill setShade:](v7, "setShade:", v10);

  return v7;
}

+ (id)readGradientFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  CXNamespace *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  objc_msgSend(v6, "OAXMainNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindChild(a3, v7, "path");

  if (v8)
    objc_msgSend(a1, "readPathGradientFillFromXmlNode:drawingState:", a3, v6);
  else
    objc_msgSend(a1, "readLinearGradientFillFromXmlNode:drawingState:", a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)readPresetPatternFillFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADPatternFill *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  OADPresetPattern *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;

  v6 = a4;
  v7 = objc_alloc_init(OADPatternFill);
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "presetPatternFillTypeEnumMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "valueForString:", v8);

  }
  else
  {
    v10 = 1;
  }
  v11 = objc_alloc_init(OADPresetPattern);
  -[OADPresetPattern setType:](v11, "setType:", v10);
  -[OADPatternFill setPattern:](v7, "setPattern:", v11);
  objc_msgSend(v6, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "fgClr");

  if (v13)
  {
    +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPatternFill setFgColor:](v7, "setFgColor:", v14);

  }
  objc_msgSend(v6, "OAXMainNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "bgClr");

  if (v16)
  {
    +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADPatternFill setBgColor:](v7, "setBgColor:", v17);

  }
  return v7;
}

void __47__OAXFill_Private__pathGradientFillTypeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_69, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ47__OAXFill_Private__pathGradientFillTypeEnumMap_EUb_E31pathGradientFillTypeEnumStructs, 3, 1);
  v2 = (void *)+[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap;
  +[OAXFill(Private) pathGradientFillTypeEnumMap]::pathGradientFillTypeEnumMap = (uint64_t)v1;

}

@end
