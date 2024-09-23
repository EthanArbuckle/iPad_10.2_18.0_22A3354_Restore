@implementation OAXEffect

+ (id)readEffectsFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  _xmlNode *i;
  OADOuterShadowEffect *v11;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE)
      continue;
    if (xmlStrEqual(i->name, (const xmlChar *)"outerShdw"))
    {
      v11 = objc_alloc_init(OADOuterShadowEffect);
      objc_msgSend(a1, "readOuterShadow:fromXmlNode:", v11, i);
      objc_msgSend(v9, "addObject:", v11);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"prstShdw"))
    {
      v11 = objc_alloc_init(OADPresetShadowEffect);
      objc_msgSend(a1, "readPresetShadow:fromXmlNode:", v11, i);
      objc_msgSend(v9, "addObject:", v11);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"reflection"))
    {
      v11 = objc_alloc_init(OADReflectionEffect);
      objc_msgSend(a1, "readReflection:fromXmlNode:", v11, i);
      objc_msgSend(v9, "addObject:", v11);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"glow"))
    {
      v11 = objc_alloc_init(OADGlowEffect);
      objc_msgSend(a1, "readGlow:fromXmlNode:", v11, i);
      objc_msgSend(v9, "addObject:", v11);
    }
    else
    {
      if (!xmlStrEqual(i->name, (const xmlChar *)"fillOverlay"))
        continue;
      +[OAXFillOverlayEffect readFromXmlNode:packagePart:drawingState:](OAXFillOverlayEffect, "readFromXmlNode:packagePart:drawingState:", i, v13, v8);
      v11 = (OADOuterShadowEffect *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);
    }

  }
  return v9;
}

+ (id)presetShadowTypeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
  if (!+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_6, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumStructs, 20, 1);
    v5 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
    +[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXEffect(Private) presetShadowTypeEnumMap]::presetShadowTypeEnumMap;
  }
  return v2;
}

+ (BOOL)isEmpty:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    v7 = 0;
    if (v6)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                }
              }
            }
          }
          v7 = 1;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = v7 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  return v10 & 1;
}

+ (void)readShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v12 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"blurRad", &v12))
  {
    v6 = (double)v12 / 12700.0;
    *(float *)&v6 = v6;
    objc_msgSend(v5, "setBlurRadius:", v6);
  }
  v11 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dist", &v11))
  {
    v7 = (double)v11 / 12700.0;
    *(float *)&v7 = v7;
    objc_msgSend(v5, "setDistance:", v7);
  }
  v10 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", &v10))
  {
    v8 = (double)v10 / 60000.0;
    *(float *)&v8 = v8;
    objc_msgSend(v5, "setAngle:", v8);
  }
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v9);

}

+ (void)readOuterShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;

  v6 = a3;
  objc_msgSend(a1, "readShadow:fromXmlNode:", v6, a4);
  v16 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", &v16))
  {
    HIDWORD(v7) = HIDWORD(v16);
    *(float *)&v7 = v16;
    objc_msgSend(v6, "setXScale:", v7);
  }
  v15 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", &v15))
  {
    HIDWORD(v8) = HIDWORD(v15);
    *(float *)&v8 = v15;
    objc_msgSend(v6, "setYScale:", v8);
  }
  v14 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"kx", &v14))
  {
    v9 = (double)v14 / 60000.0;
    *(float *)&v9 = v9;
    objc_msgSend(v6, "setXSkew:", v9);
  }
  v13 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"ky", &v13))
  {
    v10 = (double)v13 / 60000.0;
    *(float *)&v10 = v10;
    objc_msgSend(v6, "setYSkew:", v10);
  }
  v11 = +[OAXBaseTypes readRectAlignmentFromXmlNode:name:](OAXBaseTypes, "readRectAlignmentFromXmlNode:name:", a4, "algn");
  if ((_DWORD)v11)
    objc_msgSend(v6, "setAlignment:", v11);
  v12 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v12))
    objc_msgSend(v6, "setRotateWithShape:", v12);

}

+ (void)writeOuterShadow:(id)a3 includeRotateWithShape:(BOOL)a4 to:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  id v34;

  v6 = a4;
  v34 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v34, "xScale");
  *(float *)&v11 = v10 * 100000.0;
  objc_msgSend(v9, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("sx"), v14);

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v34, "yScale");
  *(float *)&v17 = v16 * 100000.0;
  objc_msgSend(v15, "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("sy"), v20);

  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v34, "xSkew");
  *(float *)&v23 = v22 * 60000.0;
  objc_msgSend(v21, "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("kx"), v26);

  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v34, "ySkew");
  *(float *)&v29 = v28 * 60000.0;
  objc_msgSend(v27, "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("ky"), v32);

  +[OAXBaseTypes writeRectAlignment:to:](OAXBaseTypes, "writeRectAlignment:to:", objc_msgSend(v34, "alignment"), v8);
  if (v6)
  {
    if (objc_msgSend(v34, "rotateWithShape"))
      v33 = CFSTR("1");
    else
      v33 = CFSTR("0");
    objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("rotWithShape"), v33);
  }
  objc_msgSend(a1, "writeShadowBase:to:", v34, v8);

}

+ (void)readPresetShadow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "readShadow:fromXmlNode:");
  CXDefaultStringAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "presetShadowTypeEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "valueForString:", v6);

    if ((_DWORD)v8 != -130883970)
      objc_msgSend(v9, "setPresetShadowType:", v8);
  }

}

+ (void)writePresetShadow:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "presetShadowTypeEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v9, "presetShadowType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("prst"), v8);
  objc_msgSend(a1, "writeShadowBase:to:", v9, v6);

}

+ (void)readReflection:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;

  v5 = a3;
  v31 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"blurRad", &v31))
  {
    v6 = (double)v31 / 12700.0;
    *(float *)&v6 = v6;
    objc_msgSend(v5, "setBlurRadius:", v6);
  }
  v30 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"stA", &v30))
  {
    HIDWORD(v7) = HIDWORD(v30);
    *(float *)&v7 = v30;
    objc_msgSend(v5, "setStartOpacity:", v7);
  }
  v29 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"stPos", &v29))
  {
    HIDWORD(v8) = HIDWORD(v29);
    *(float *)&v8 = v29;
    objc_msgSend(v5, "setStartPosition:", v8);
  }
  v28 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"endA", &v28))
  {
    HIDWORD(v9) = HIDWORD(v28);
    *(float *)&v9 = v28;
    objc_msgSend(v5, "setEndOpacity:", v9);
  }
  v27 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"endPos", &v27))
  {
    HIDWORD(v10) = HIDWORD(v27);
    *(float *)&v10 = v27;
    objc_msgSend(v5, "setEndPosition:", v10);
  }
  v26 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dist", &v26))
  {
    v11 = (double)v26 / 12700.0;
    *(float *)&v11 = v11;
    objc_msgSend(v5, "setDistance:", v11);
  }
  v25 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", &v25))
  {
    v12 = (double)v25 / 60000.0;
    *(float *)&v12 = v12;
    objc_msgSend(v5, "setDirection:", v12);
  }
  v24 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"fadeDir", &v24))
  {
    v13 = (double)v24 / 60000.0;
    *(float *)&v13 = v13;
    objc_msgSend(v5, "setFadeDirection:", v13);
  }
  v23 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sx", &v23))
  {
    HIDWORD(v14) = HIDWORD(v23);
    *(float *)&v14 = v23;
    objc_msgSend(v5, "setXScale:", v14);
  }
  v22 = 0.0;
  if (CXOptionalFractionAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"sy", &v22))
  {
    HIDWORD(v15) = HIDWORD(v22);
    *(float *)&v15 = v22;
    objc_msgSend(v5, "setYScale:", v15);
  }
  v21 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"kx", &v21))
  {
    v16 = (double)v21 / 60000.0;
    *(float *)&v16 = v16;
    objc_msgSend(v5, "setXSkew:", v16);
  }
  v20 = 0;
  if (CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"ky", &v20))
  {
    v17 = (double)v20 / 60000.0;
    *(float *)&v17 = v17;
    objc_msgSend(v5, "setYSkew:", v17);
  }
  v18 = +[OAXBaseTypes readRectAlignmentFromXmlNode:name:](OAXBaseTypes, "readRectAlignmentFromXmlNode:name:", a4, "algn");
  if ((_DWORD)v18)
    objc_msgSend(v5, "setAlignment:", v18);
  v19 = 0;
  if (CXOptionalBoolAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rotWithShape", &v19))
    objc_msgSend(v5, "setRotateWithShape:", v19);

}

+ (void)writeReflection:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  float v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  float v49;
  double v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  float v55;
  double v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  float v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  float v67;
  double v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  float v73;
  double v74;
  void *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  id v79;

  v79 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "blurRadius");
  *(float *)&v8 = v7 * 12700.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("blurRad"), v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "startOpacity");
  *(float *)&v14 = v13 * 100000.0;
  objc_msgSend(v12, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("stA"), v17);

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "startPosition");
  *(float *)&v20 = v19 * 100000.0;
  objc_msgSend(v18, "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("stPos"), v23);

  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "endOpacity");
  *(float *)&v26 = v25 * 100000.0;
  objc_msgSend(v24, "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("endA"), v29);

  v30 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "endPosition");
  *(float *)&v32 = v31 * 100000.0;
  objc_msgSend(v30, "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("endPos"), v35);

  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "distance");
  *(float *)&v38 = v37 * 12700.0;
  objc_msgSend(v36, "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dist"), v41);

  v42 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "direction");
  *(float *)&v44 = v43 * 60000.0;
  objc_msgSend(v42, "numberWithFloat:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dir"), v47);

  v48 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "fadeDirection");
  *(float *)&v50 = v49 * 60000.0;
  objc_msgSend(v48, "numberWithFloat:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("fadeDir"), v53);

  v54 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "xScale");
  *(float *)&v56 = v55 * 100000.0;
  objc_msgSend(v54, "numberWithFloat:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("sx"), v59);

  v60 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "yScale");
  *(float *)&v62 = v61 * 100000.0;
  objc_msgSend(v60, "numberWithFloat:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("sy"), v65);

  v66 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "xSkew");
  *(float *)&v68 = v67 * 60000.0;
  objc_msgSend(v66, "numberWithFloat:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("kx"), v71);

  v72 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v79, "ySkew");
  *(float *)&v74 = v73 * 60000.0;
  objc_msgSend(v72, "numberWithFloat:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("ky"), v77);

  +[OAXBaseTypes writeRectAlignment:to:](OAXBaseTypes, "writeRectAlignment:to:", objc_msgSend(v79, "alignment"), v5);
  if (objc_msgSend(v79, "rotateWithShape"))
    v78 = CFSTR("1");
  else
    v78 = CFSTR("0");
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("rotWithShape"), v78);

}

+ (void)readGlow:(id)a3 fromXmlNode:(_xmlNode *)a4
{
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (double)CXDefaultLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"rad", 0) / 12700.0;
  *(float *)&v5 = v5;
  objc_msgSend(v7, "setRadius:", v5);
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v7, "setColor:", v6);

}

+ (void)writeGlow:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v13, "radius");
  *(float *)&v8 = v7 * 12700.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("rad"), v11);

  objc_msgSend(v13, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v12, v5);

}

+ (id)updateIncomingEffects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v6)
  {

LABEL_14:
    v16 = v5;
    goto LABEL_15;
  }
  v7 = 0;
  v8 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v11, "blurRadius");
        *(float *)&v13 = v12 / 5.0;
        objc_msgSend(v11, "setBlurRadius:", v13);
        objc_msgSend(v11, "distance");
        *(float *)&v15 = v14 * 0.5;
        objc_msgSend(v11, "setDistance:", v15);
        objc_msgSend(v4, "addObject:", v11);

        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v19);
      }
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v6);

  v16 = v4;
  if ((v7 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v17 = v16;

  return v17;
}

+ (id)updateOutgoingEffects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v6)
  {

LABEL_14:
    v16 = v5;
    goto LABEL_15;
  }
  v7 = 0;
  v8 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v11, "blurRadius");
        *(float *)&v13 = v12 * 5.0;
        objc_msgSend(v11, "setBlurRadius:", v13);
        objc_msgSend(v11, "distance");
        *(float *)&v15 = v14 + v14;
        objc_msgSend(v11, "setDistance:", v15);
        objc_msgSend(v4, "addObject:", v11);

        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "addObject:", v10, (_QWORD)v19);
      }
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v6);

  v16 = v4;
  if ((v7 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v17 = v16;

  return v17;
}

+ (void)writeShadowBase:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v25, "blurRadius");
  *(float *)&v8 = v7 * 12700.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), OCXValidateST_PositiveCoordinate(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("blurRad"), v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v25, "distance");
  *(float *)&v14 = v13 * 12700.0;
  objc_msgSend(v12, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), OCXValidateST_PositiveCoordinate(v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dist"), v17);

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v25, "angle");
  *(float *)&v20 = v19 * 60000.0;
  objc_msgSend(v18, "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dir"), v23);

  objc_msgSend(v25, "color");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v24, v5);

}

@end
