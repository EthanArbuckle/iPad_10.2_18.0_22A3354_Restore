@implementation OAXScene3D

+ (id)cameraTypeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
  if (!+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_10, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumStructs, 62, 1);
    v5 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
    +[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXScene3D cameraTypeEnumMap]::cameraTypeEnumMap;
  }
  return v2;
}

+ (id)lightRigTypeEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
  if (!+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_177, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumStructs, 27, 1);
    v5 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
    +[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXScene3D lightRigTypeEnumMap]::lightRigTypeEnumMap;
  }
  return v2;
}

+ (id)lightRigDirectionEnumMap
{
  void *v2;
  unsigned __int8 v3;
  TCEnumerationMap *v4;
  void *v5;

  v2 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
  if (!+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap)
  {
    if ((v3 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_196, 0, &dword_22A0CC000);
    }
    v4 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumStructs, 9, 1);
    v5 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
    +[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap = (uint64_t)v4;

    v2 = (void *)+[OAXScene3D lightRigDirectionEnumMap]::lightRigDirectionEnumMap;
  }
  return v2;
}

+ (id)readCameraFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADCamera *v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v17;
  uint64_t v18;

  v6 = a4;
  v7 = objc_alloc_init(OADCamera);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "rot");

  if (v9)
  {
    +[OAXBaseTypes readRotation3DFromXmlNode:](OAXBaseTypes, "readRotation3DFromXmlNode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADCamera setRotation:](v7, "setRotation:", v10);

  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "cameraTypeEnumMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "valueForString:", v11);

    -[OADCamera setCameraType:](v7, "setCameraType:", v13);
  }
  v18 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fov", &v18))
  {
    v14 = (double)v18 / 60000.0;
    *(float *)&v14 = v14;
    -[OADCamera setFieldOfView:](v7, "setFieldOfView:", v14);
  }
  v17 = 0.0;
  if (CXOptionalFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"zoom", &v17))
  {
    HIDWORD(v15) = HIDWORD(v17);
    *(float *)&v15 = v17;
    -[OADCamera setFieldOfView:](v7, "setFieldOfView:", v15);
  }

  return v7;
}

+ (id)readLightRigFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  OADLightRig *v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  v7 = objc_alloc_init(OADLightRig);
  objc_msgSend(v6, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "rot");

  if (v9)
  {
    +[OAXBaseTypes readRotation3DFromXmlNode:](OAXBaseTypes, "readRotation3DFromXmlNode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADLightRig setRotation:](v7, "setRotation:", v10);

  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rig", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "lightRigTypeEnumMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "valueForString:", v11);

    -[OADLightRig setType:](v7, "setType:", v13);
  }
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dir", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "lightRigDirectionEnumMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "valueForString:", v14);

    -[OADLightRig setDirection:](v7, "setDirection:", v16);
  }

  return v7;
}

+ (id)readBackdropFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v5;
  OADBackdrop *v6;
  CXNamespace *v7;
  uint64_t v8;
  void *v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  void *v15;

  v5 = a4;
  v6 = objc_alloc_init(OADBackdrop);
  objc_msgSend(v5, "OAXMainNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindChild(a3, v7, "anchor");

  if (v8)
  {
    +[OAXBaseTypes readPoint3DFromXmlNode:](OAXBaseTypes, "readPoint3DFromXmlNode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADBackdrop setAnchor:](v6, "setAnchor:", v9);

  }
  objc_msgSend(v5, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "norm");

  if (v11)
  {
    +[OAXBaseTypes readVector3DFromXmlNode:](OAXBaseTypes, "readVector3DFromXmlNode:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADBackdrop setNormal:](v6, "setNormal:", v12);

  }
  objc_msgSend(v5, "OAXMainNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindChild(a3, v13, "up");

  if (v14)
  {
    +[OAXBaseTypes readVector3DFromXmlNode:](OAXBaseTypes, "readVector3DFromXmlNode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADBackdrop setUp:](v6, "setUp:", v15);

  }
  return v6;
}

+ (id)readScene3DFromXmlNode:(_xmlNode *)a3 packagePart:(id)a4 drawingState:(id)a5
{
  id v7;
  OADScene3D *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;

  v7 = a5;
  v8 = objc_alloc_init(OADScene3D);
  objc_msgSend(v7, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "camera");

  if (v10)
  {
    objc_msgSend(a1, "readCameraFromXmlNode:drawingState:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADScene3D setCamera:](v8, "setCamera:", v11);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "lightRig");

  if (v13)
  {
    objc_msgSend(a1, "readLightRigFromXmlNode:drawingState:", v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADScene3D setLightRig:](v8, "setLightRig:", v14);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "backdrop");

  if (v16)
  {
    objc_msgSend(a1, "readBackdropFromXmlNode:drawingState:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADScene3D setBackdrop:](v8, "setBackdrop:", v17);

  }
  return v8;
}

+ (void)writeScene3D:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "backdrop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("backdrop"));
    objc_msgSend(a1, "writeBackdrop:to:", v7, v6);
    objc_msgSend(v6, "endElement");
  }
  objc_msgSend(v10, "camera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("camera"));
    objc_msgSend(a1, "writeCamera:to:", v8, v6);
    objc_msgSend(v6, "endElement");
  }
  objc_msgSend(v10, "lightRig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "startOAElement:", CFSTR("lightRig"));
    objc_msgSend(a1, "writeLightRig:to:", v9, v6);
    objc_msgSend(v6, "endElement");
  }

}

+ (BOOL)isEmpty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "camera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "lightRig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == 0;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (void)writeBackdrop:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
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
  float v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  float v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  float v52;
  double v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;

  v63 = a3;
  v5 = a4;
  objc_msgSend(v63, "anchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "startOAElement:", CFSTR("anchor"));
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "x");
    *(float *)&v9 = v8 * 12700.0;
    objc_msgSend(v7, "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("x"), v12);

    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "y");
    *(float *)&v15 = v14 * 12700.0;
    objc_msgSend(v13, "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("y"), v18);

    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "z");
    *(float *)&v21 = v20 * 12700.0;
    objc_msgSend(v19, "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("z"), v24);

    objc_msgSend(v5, "endElement");
  }
  objc_msgSend(v63, "normal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v5, "startOAElement:", CFSTR("norm"));
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v25, "dx");
    *(float *)&v28 = v27 * 12700.0;
    objc_msgSend(v26, "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dx"), v31);

    v32 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v25, "dy");
    *(float *)&v34 = v33 * 12700.0;
    objc_msgSend(v32, "numberWithFloat:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dy"), v37);

    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v25, "dz");
    *(float *)&v40 = v39 * 12700.0;
    objc_msgSend(v38, "numberWithFloat:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dz"), v43);

    objc_msgSend(v5, "endElement");
  }
  objc_msgSend(v63, "up");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v5, "startOAElement:", CFSTR("up"));
    v45 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "dx");
    *(float *)&v47 = v46 * 12700.0;
    objc_msgSend(v45, "numberWithFloat:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dx"), v50);

    v51 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "dy");
    *(float *)&v53 = v52 * 12700.0;
    objc_msgSend(v51, "numberWithFloat:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dy"), v56);

    v57 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v44, "dz");
    *(float *)&v59 = v58 * 12700.0;
    objc_msgSend(v57, "numberWithFloat:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("dz"), v62);

    objc_msgSend(v5, "endElement");
  }

}

+ (void)writeRotation3D:(id)a3 to:(id)a4
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
  id v24;

  v24 = a3;
  v5 = a4;
  if (v24)
  {
    objc_msgSend(v5, "startOAElement:", CFSTR("rot"));
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "latitude");
    *(float *)&v8 = v7 * 60000.0;
    objc_msgSend(v6, "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("lat"), v11);

    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "longitude");
    *(float *)&v14 = v13 * 60000.0;
    objc_msgSend(v12, "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("lon"), v17);

    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "revolution");
    *(float *)&v20 = v19 * 60000.0;
    objc_msgSend(v18, "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "longValue");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeOAAttribute:content:", CFSTR("rev"), v23);

    objc_msgSend(v5, "endElement");
  }

}

+ (void)writeCamera:(id)a3 to:(id)a4
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
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  objc_msgSend(a1, "cameraTypeEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v22, "cameraType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("prst"), v8);
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v22, "fieldOfView");
  *(float *)&v11 = v10 * 60000.0;
  objc_msgSend(v9, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("fov"), v14);

  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v22, "zoom");
  *(float *)&v17 = v16 * 100000.0;
  objc_msgSend(v15, "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longValue");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("zoom"), v20);

  objc_msgSend(v22, "rotation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeRotation3D:to:", v21, v6);

}

+ (void)writeLightRig:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(a1, "lightRigTypeEnumMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForValue:", objc_msgSend(v12, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("rig"), v8);
  objc_msgSend(a1, "lightRigDirectionEnumMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForValue:", objc_msgSend(v12, "direction"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "writeOAAttribute:content:", CFSTR("dir"), v10);
  objc_msgSend(v12, "rotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeRotation3D:to:", v11, v6);

}

@end
