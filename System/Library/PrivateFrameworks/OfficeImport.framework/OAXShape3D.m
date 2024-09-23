@implementation OAXShape3D

+ (id)readBevelFromXmlNode:(_xmlNode *)a3
{
  OADBevel *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_alloc_init(OADBevel);
  v13 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", &v13))
  {
    v6 = (double)v13 / 12700.0;
    *(float *)&v6 = v6;
    -[OADBevel setWidth:](v5, "setWidth:", v6);
  }
  v12 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"h", &v12))
  {
    v7 = (double)v12 / 12700.0;
    *(float *)&v7 = v7;
    -[OADBevel setHeight:](v5, "setHeight:", v7);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "bevelTypeEnumMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "valueForString:", v8);

    -[OADBevel setType:](v5, "setType:", v10);
  }

  return v5;
}

+ (id)materialEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
  if (!+[OAXShape3D materialEnumMap]::materialEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_53, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXShape3D materialEnumMap]::materialEnumStructs, 15, 1);
    v5 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
    +[OAXShape3D materialEnumMap]::materialEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXShape3D materialEnumMap]::materialEnumMap;
  }
  return v2;
}

+ (id)bevelTypeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
  if (!+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_11, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumStructs, 12, 1);
    v5 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
    +[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXShape3D bevelTypeEnumMap]::bevelTypeEnumMap;
  }
  return v2;
}

+ (id)readShape3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v7;
  OADShape3D *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a5;
  v8 = objc_alloc_init(OADShape3D);
  objc_msgSend(v7, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "bevelT");

  if (v10)
  {
    objc_msgSend(a1, "readBevelFromXmlNode:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShape3D setTopBevel:](v8, "setTopBevel:", v11);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "bevelB");

  if (v13)
  {
    objc_msgSend(a1, "readBevelFromXmlNode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShape3D setBottomBevel:](v8, "setBottomBevel:", v14);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "extrusionClr");

  if (v16)
  {
    +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShape3D setExtrusionColor:](v8, "setExtrusionColor:", v17);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = OCXFindChild(a3, v18, "contourClr");

  if (v19)
  {
    +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShape3D setContourColor:](v8, "setContourColor:", v20);

  }
  v30 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"z", &v30, 12))
  {
    v21 = (double)v30 / 12700.0;
    *(float *)&v21 = v21;
    -[OADShape3D setShapeDepth:](v8, "setShapeDepth:", v21);
  }
  v29 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"extrusionH", &v29))
  {
    v22 = (double)v29 / 12700.0;
    *(float *)&v22 = v22;
    -[OADShape3D setExtrusionHeight:](v8, "setExtrusionHeight:", v22);
  }
  v28 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"contourW", &v28))
  {
    v23 = (double)v28 / 12700.0;
    *(float *)&v23 = v23;
    -[OADShape3D setContourWidth:](v8, "setContourWidth:", v23);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prstMaterial", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(a1, "materialEnumMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "valueForString:", v24);

    -[OADShape3D setMaterial:](v8, "setMaterial:", v26);
  }

  return v8;
}

+ (void)writeBevel:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
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
  id v21;

  v21 = a3;
  v6 = a4;
  objc_msgSend(a1, "bevelTypeEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v21, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("prst"), v8);
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v21, "width");
  *(float *)&v11 = v10 * 12700.0;
  objc_msgSend(v9, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("w"), v14);

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v21, "height");
  *(float *)&v17 = v16 * 12700.0;
  objc_msgSend(v15, "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("h"), v20);

}

+ (void)writeShape3D:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v31, "shapeDepth");
  *(float *)&v9 = v8 * 12700.0;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("z"), v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v31, "extrusionHeight");
  *(float *)&v15 = v14 * 12700.0;
  objc_msgSend(v13, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("extrusionH"), v18);

  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v31, "contourWidth");
  *(float *)&v21 = v20 * 12700.0;
  objc_msgSend(v19, "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("contourW"), v24);

  objc_msgSend(a1, "materialEnumMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringForValue:", objc_msgSend(v31, "material"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("prstMaterial"), v26);
  objc_msgSend(v31, "topBevel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("bevelT"));
    objc_msgSend(a1, "writeBevel:to:", v27, v6);
    objc_msgSend(v6, "endElement");
  }
  objc_msgSend(v31, "bottomBevel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("bevelB"));
    objc_msgSend(a1, "writeBevel:to:", v28, v6);
    objc_msgSend(v6, "endElement");
  }
  objc_msgSend(v31, "extrusionColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("extrusionClr"));
    +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v29, v6);
    objc_msgSend(v6, "endElement");
  }
  objc_msgSend(v31, "contourColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("contourClr"));
    +[OAXColor writeColor:to:](OAXColor, "writeColor:to:", v30, v6);
    objc_msgSend(v6, "endElement");
  }

}

+ (void)writeShape3DMaterialOnly:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!+[OAXShape3D isEmpty:](OAXShape3D, "isEmpty:", v9))
  {
    objc_msgSend(a1, "materialEnumMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForValue:", objc_msgSend(v9, "material"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("prstMaterial"), v8);

  }
}

+ (BOOL)isEmpty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "material"))
  {
    objc_msgSend(a1, "materialEnumMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForValue:", objc_msgSend(v5, "material"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
