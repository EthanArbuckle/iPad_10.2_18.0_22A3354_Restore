@implementation OAXBlipEffects

+ (id)readLuminanceEffect:(_xmlNode *)a3
{
  OADLuminanceEffect *v4;

  v4 = objc_alloc_init(OADLuminanceEffect);
  +[OAXBaseTypes readOptionalFractionFromXmlNode:name:](OAXBaseTypes, "readOptionalFractionFromXmlNode:name:", a3, "bright");
  -[OADLuminanceEffect setBrightness:](v4, "setBrightness:");
  +[OAXBaseTypes readOptionalFractionFromXmlNode:name:](OAXBaseTypes, "readOptionalFractionFromXmlNode:name:", a3, "contrast");
  -[OADLuminanceEffect setContrast:](v4, "setContrast:");
  return v4;
}

+ (id)readDuotoneEffect:(_xmlNode *)a3
{
  _xmlNode *v5;
  void *v6;
  _xmlNode *v7;
  uint64_t v8;
  void *v9;
  OADDuotoneEffect *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = OCXFirstChild(a3);
  if (v5)
  {
    +[OAXColor readColorFromNode:](OAXColor, "readColorFromNode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = OCXNextSibling(v5);
  if (v7)
  {
    +[OAXColor readColorFromNode:](OAXColor, "readColorFromNode:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (v6 && v8)
    {
      v10 = objc_alloc_init(OADDuotoneEffect);
      -[OADDuotoneEffect setColor1:](v10, "setColor1:", v6);
      -[OADDuotoneEffect setColor2:](v10, "setColor2:", v9);
      CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfr1", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(a1, "duotoneTransferModeEnumMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "valueForString:", v11);

        -[OADDuotoneEffect setTransferMode1:](v10, "setTransferMode1:", v13);
      }
      CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfr2", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(a1, "duotoneTransferModeEnumMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "valueForString:", v14);

        -[OADDuotoneEffect setTransferMode2:](v10, "setTransferMode2:", v16);
      }

    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  return v10;
}

+ (id)readAlphaModFixEffect:(_xmlNode *)a3
{
  OADAlphaModFixEffect *v4;
  double v5;
  double v7;

  v4 = objc_alloc_init(OADAlphaModFixEffect);
  v7 = 0.0;
  if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"amt", &v7))
  {
    HIDWORD(v5) = HIDWORD(v7);
    *(float *)&v5 = v7;
    -[OADAlphaModFixEffect setAlpha:](v4, "setAlpha:", v5);
  }
  return v4;
}

+ (id)readGrayscaleEffect:(_xmlNode *)a3
{
  return objc_alloc_init(OADGrayscaleEffect);
}

+ (void)readBlipEffectsFromBlipRef:(_xmlNode *)a3 toBlipRef:(id)a4 drawingState:(id)a5
{
  id v8;
  _xmlNode *i;
  const xmlChar *name;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    name = i->name;
    if (xmlStrEqual(name, (const xmlChar *)"lum"))
    {
      objc_msgSend(a1, "readLuminanceEffect:", i);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (xmlStrEqual(name, (const xmlChar *)"grayscl"))
    {
      objc_msgSend(a1, "readGrayscaleEffect:", i);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (xmlStrEqual(name, (const xmlChar *)"biLevel"))
    {
      objc_msgSend(a1, "readBiLevelEffect:", i);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (xmlStrEqual(name, (const xmlChar *)"clrChange"))
    {
      objc_msgSend(a1, "readColorChangeEffect:drawingState:", i, v8);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (xmlStrEqual(name, (const xmlChar *)"alphaModFix"))
    {
      objc_msgSend(a1, "readAlphaModFixEffect:", i);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!xmlStrEqual(name, (const xmlChar *)"duotone"))
      {
        v12 = 0;
        goto LABEL_17;
      }
      objc_msgSend(a1, "readDuotoneEffect:", i);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    if (v11)
      objc_msgSend(v13, "addEffect:", v11);
LABEL_17:

  }
}

+ (void)writeBlipEffects:(id)a3 to:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "effectCount");
  if (v7)
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v10, "effectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "writeBiLevelEffect:to:", v9, v6);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "writeColorChangeEffect:to:", v9, v6);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "writeDuotoneEffect:to:", v9, v6);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "writeGrayscaleEffect:to:", v9, v6);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "writeLuminanceEffect:to:", v9, v6);
        goto LABEL_15;
      }
LABEL_16:

      if (v7 == ++v8)
        goto LABEL_17;
    }
    objc_msgSend(a1, "writeAlphaModFixEffect:to:", v9, v6);
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

+ (void)writeLuminanceEffect:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v18, "brightness");
  *(float *)&v8 = v7 * 100000.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v18, "contrast");
  *(float *)&v13 = v12 * 100000.0;
  objc_msgSend(v11, "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "longValue");

  objc_msgSend(v5, "startOAElement:", CFSTR("lum"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("bright"), v16);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("contrast"), v17);

  objc_msgSend(v5, "endElement");
}

+ (void)writeGrayscaleEffect:(id)a3 to:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "startOAElement:", CFSTR("grayscl"));
  objc_msgSend(v4, "endElement");

}

+ (id)readBiLevelEffect:(_xmlNode *)a3
{
  OADBiLevelEffect *v4;

  v4 = objc_alloc_init(OADBiLevelEffect);
  +[OAXBaseTypes readRequiredFractionFromXmlNode:name:](OAXBaseTypes, "readRequiredFractionFromXmlNode:name:", a3, "thresh");
  -[OADBiLevelEffect setThreshold:](v4, "setThreshold:");
  return v4;
}

+ (void)writeBiLevelEffect:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "threshold");
  *(float *)&v8 = v7 * 100000.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(v5, "startOAElement:", CFSTR("biLevel"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("thresh"), v11);

  objc_msgSend(v5, "endElement");
}

+ (id)readColorChangeEffect:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  CXNamespace *v6;
  _xmlNode *v7;
  _xmlNode *v8;
  void *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  _xmlNode *v12;
  OADColorChangeEffect *v13;

  v5 = a4;
  objc_msgSend(v5, "OAXMainNamespace");
  v6 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v7 = (_xmlNode *)OCXFindChild(a3, v6, "clrFrom");

  if (v7 && (v8 = OCXFirstChild(v7)) != 0)
  {
    +[OAXColor readColorFromNode:](OAXColor, "readColorFromNode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a3, v10, "clrTo");

  if (v11)
  {
    v12 = OCXFirstChild(v11);
    if (v12)
    {
      +[OAXColor readColorFromNode:](OAXColor, "readColorFromNode:", v12);
      v11 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  v13 = objc_alloc_init(OADColorChangeEffect);
  -[OADColorChangeEffect setFromColor:](v13, "setFromColor:", v9);
  -[OADColorChangeEffect setToColor:](v13, "setToColor:", v11);

  return v13;
}

+ (void)writeColorChangeEffect:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "startOAElement:", CFSTR("clrChange"));
  objc_msgSend(v5, "startOAElement:", CFSTR("clrFrom"));
  objc_msgSend(v8, "fromColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v6, v5);

  objc_msgSend(v5, "endElement");
  objc_msgSend(v5, "startOAElement:", CFSTR("clrTo"));
  objc_msgSend(v8, "toColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v7, v5);

  objc_msgSend(v5, "endElement");
  objc_msgSend(v5, "endElement");

}

+ (void)writeAlphaModFixEffect:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "alpha");
  *(float *)&v8 = v7 * 100000.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(v5, "startOAElement:", CFSTR("alphaModFix"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("amt"), v11);

  objc_msgSend(v5, "endElement");
}

+ (void)writeDuotoneEffect:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "startOAElement:", CFSTR("duotone"));
  objc_msgSend(v8, "color1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v6, v5);

  objc_msgSend(v8, "color2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v7, v5);

  objc_msgSend(v5, "endElement");
}

+ (id)duotoneTransferModeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
  if (!+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_1, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumStructs, 14, 1);
    v5 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
    +[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXBlipEffects(Private) duotoneTransferModeEnumMap]::duotoneTransferModeEnumMap;
  }
  return v2;
}

@end
