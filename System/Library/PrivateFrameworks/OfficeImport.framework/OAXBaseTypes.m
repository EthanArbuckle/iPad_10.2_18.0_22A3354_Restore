@implementation OAXBaseTypes

+ (float)readRequiredFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  double v4;

  CXRequiredFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
  return v4;
}

+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (int64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
}

+ (int)readRectAlignmentFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  void *v5;
  void *v6;
  int v7;

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "rectAlignmentEnumMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "valueForString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)readRelativeRectFromXmlNode:(_xmlNode *)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  OADRelativeRect *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (a3)
  {
    objc_msgSend(a1, "readOptionalFractionFromXmlNode:name:", a3, "l");
    v6 = v5;
    objc_msgSend(a1, "readOptionalFractionFromXmlNode:name:", a3, "t");
    v8 = v7;
    objc_msgSend(a1, "readOptionalFractionFromXmlNode:name:", a3, "r");
    v10 = v9;
    objc_msgSend(a1, "readOptionalFractionFromXmlNode:name:", a3, "b");
    v12 = v11;
  }
  else
  {
    v6 = 0;
    v8 = 0;
    v10 = 0;
    v12 = 0;
  }
  v13 = [OADRelativeRect alloc];
  LODWORD(v14) = v6;
  LODWORD(v15) = v8;
  LODWORD(v16) = v10;
  LODWORD(v17) = v12;
  return -[OADRelativeRect initWithLeft:top:right:bottom:](v13, "initWithLeft:top:right:bottom:", v14, v15, v16, v17);
}

+ (float)readOptionalFractionFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0.0);
}

+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0);
}

+ (double)readOptionalAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)objc_msgSend(a1, "readOptionalLongFromXmlNode:name:", a3, a4) / 60000.0;
}

+ (CGPoint)readPoint2DFromXmlNode:(_xmlNode *)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  double v9;
  CGPoint result;

  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "x");
  v6 = v5;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "y");
  v8 = v7;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (float)readRequiredLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)objc_msgSend(a1, "readRequiredLongFromXmlNode:name:desiredOutputUnit:", a3, a4, 12) / 12700.0;
}

+ (CGSize)readSize2DFromXmlNode:(_xmlNode *)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "cx");
  v6 = v5;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "cy");
  v8 = v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (id)rectAlignmentEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
  if (!+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_0, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumStructs, 9, 1);
    v5 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
    +[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXBaseTypes rectAlignmentEnumMap]::rectAlignmentEnumMap;
  }
  return v2;
}

+ (id)readRotation3DFromXmlNode:(_xmlNode *)a3
{
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  OADRotation3D *v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "readRequiredAngleFromXmlNode:name:", a3, "lat");
  v6 = v5;
  objc_msgSend(a1, "readRequiredAngleFromXmlNode:name:", a3, "lon");
  v8 = v7;
  objc_msgSend(a1, "readRequiredAngleFromXmlNode:name:", a3, "rev");
  v10 = v9;
  v11 = [OADRotation3D alloc];
  *(float *)&v12 = v6;
  *(float *)&v13 = v8;
  *(float *)&v14 = v10;
  return -[OADRotation3D initWithLatitude:longitude:revolution:](v11, "initWithLatitude:longitude:revolution:", v12, v13, v14);
}

+ (double)readRequiredAngleFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)objc_msgSend(a1, "readRequiredLongFromXmlNode:name:", a3, a4) / 60000.0;
}

+ (float)readOptionalLengthFromXmlNode:(_xmlNode *)a3 name:(const char *)a4
{
  return (double)objc_msgSend(a1, "readOptionalLongFromXmlNode:name:desiredOutputUnit:", a3, a4, 12) / 12700.0;
}

+ (int64_t)readRequiredLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5
{
  return (int64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, a5);
}

+ (int64_t)readOptionalLongFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 desiredOutputUnit:(int)a5
{
  return CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 0, a5);
}

+ (id)stringForRectAlignment:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(a1, "rectAlignmentEnumMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)writeRelativeRect:(id)a3 to:(id)a4
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
  id v30;

  v30 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v30, "left");
  *(float *)&v8 = v7 * 100000.0;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("l"), v11);

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v30, "top");
  *(float *)&v14 = v13 * 100000.0;
  objc_msgSend(v12, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("t"), v17);

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v30, "right");
  *(float *)&v20 = v19 * 100000.0;
  objc_msgSend(v18, "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("r"), v23);

  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v30, "bottom");
  *(float *)&v26 = v25 * 100000.0;
  objc_msgSend(v24, "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("b"), v29);

}

+ (void)writeRectAlignment:(int)a3 to:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  objc_msgSend(a1, "rectAlignmentEnumMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeOAAttribute:content:", CFSTR("algn"), v7);
}

+ (id)readVector3DFromXmlNode:(_xmlNode *)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  OADVector3D *v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "dx");
  v6 = v5;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "dy");
  v8 = v7;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "dz");
  v10 = v9;
  v11 = [OADVector3D alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  return -[OADVector3D initWithDx:dy:dz:](v11, "initWithDx:dy:dz:", v12, v13, v14);
}

+ (id)readPoint3DFromXmlNode:(_xmlNode *)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  OADPoint3D *v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "x");
  v6 = v5;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "y");
  v8 = v7;
  objc_msgSend(a1, "readRequiredLengthFromXmlNode:name:", a3, "z");
  v10 = v9;
  v11 = [OADPoint3D alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  return -[OADPoint3D initWithX:y:z:](v11, "initWithX:y:z:", v12, v13, v14);
}

@end
