@implementation OAVImage

+ (void)readFromManager:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  OADImageFill *v9;
  void *v10;
  void *v11;
  OADBlipRef *v12;
  void *v13;
  void *v14;
  _xmlNode *v15;
  _xmlNode *v16;
  OADRelativeRect *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  OADLuminanceEffect *v24;
  double v25;
  float v26;
  double v27;
  OADGrayscaleEffect *v28;
  OADBiLevelEffect *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  OADColorChangeEffect *v36;
  void *v37;
  void *v38;
  void *v39;
  OAXMovieContext *v40;
  void *v41;
  void *v42;
  OAXMovieContext *v43;
  void *v44;
  void *v45;
  OADQTStubFile *v46;
  OADImageFill *v47;
  void *v48;
  void *v49;
  NSString *v50;
  OADStretchTechnique *v51;
  void *v52;
  void *v53;
  void *v54;
  NSString *v55;
  NSString *v56;
  NSString *v57;
  OADBlipRef *v58;
  id v59;

  v59 = a3;
  v7 = a4;
  v8 = a5;
  v48 = v8;
  v49 = v7;
  objc_msgSend(v7, "imageProperties");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(OADImageFill);
  v47 = v9;
  objc_msgSend(v59, "imageRelId");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "packagePart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relationshipForIdentifier:", v54);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v11;
  if (objc_msgSend(v11, "targetMode"))
  {
    v12 = [OADBlipRef alloc];
    objc_msgSend(v11, "targetLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "relativeString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[OADBlipRef initWithIndex:name:blip:](v12, "initWithIndex:name:blip:", 0, v14, 0);

  }
  else
  {
    objc_msgSend(v11, "targetLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blipRefForURL:", v13);
    v58 = (OADBlipRef *)objc_claimAutoreleasedReturnValue();
  }

  v15 = (_xmlNode *)objc_msgSend(v59, "shape");
  v16 = (_xmlNode *)OCXFindChild(v15, (CXNamespace *)OAVOfficeMainNamespace, "imagedata");
  v51 = objc_alloc_init(OADStretchTechnique);
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropleft", 0);
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"croptop", 0);
  v57 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropright", 0);
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"cropbottom", 0);
  v55 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v50 || v57 || v56 || v55)
  {
    v17 = objc_alloc_init(OADRelativeRect);
    if (v50)
    {
      *(float *)&v18 = OAVReadFraction(v50);
      -[OADRelativeRect setLeft:](v17, "setLeft:", v18);
    }
    if (v56)
    {
      *(float *)&v19 = OAVReadFraction(v56);
      -[OADRelativeRect setRight:](v17, "setRight:", v19);
    }
    if (v57)
    {
      *(float *)&v20 = OAVReadFraction(v57);
      -[OADRelativeRect setTop:](v17, "setTop:", v20);
    }
    if (v55)
    {
      *(float *)&v21 = OAVReadFraction(v55);
      -[OADRelativeRect setBottom:](v17, "setBottom:", v21);
    }
    -[OADImageFill setSourceRect:](v9, "setSourceRect:", v17);

  }
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"gain", 0);
  v22 = objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"blacklevel", 0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v22 | v23)
  {
    v24 = objc_alloc_init(OADLuminanceEffect);
    if (v22)
    {
      *(float *)&v25 = OAVReadFraction((NSString *)v22);
      if (*(float *)&v25 <= 1.0)
        *(float *)&v25 = *(float *)&v25 + -1.0;
      else
        *(float *)&v25 = 1.0 - (float)(1.0 / *(float *)&v25);
      -[OADLuminanceEffect setContrast:](v24, "setContrast:", v25);
    }
    if (v23)
    {
      v26 = OAVReadFraction((NSString *)v23);
      *(float *)&v27 = v26 + v26;
      -[OADLuminanceEffect setBrightness:](v24, "setBrightness:", v27);
    }
    -[OADBlipRef addEffect:](v58, "addEffect:", v24);

  }
  if (CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"grayscale", 0))
  {
    v28 = objc_alloc_init(OADGrayscaleEffect);
    -[OADBlipRef addEffect:](v58, "addEffect:", v28);

  }
  if (CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"bilevel", 0))
  {
    v29 = objc_alloc_init(OADBiLevelEffect);
    LODWORD(v30) = 0.5;
    -[OADBiLevelEffect setThreshold:](v29, "setThreshold:", v30);
    -[OADBlipRef addEffect:](v58, "addEffect:", v29);

  }
  CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"chromakey", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    LODWORD(v32) = 1.0;
    +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v31, 0, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 0;
    +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v31, 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc_init(OADColorChangeEffect);
    -[OADColorChangeEffect setFromColor:](v36, "setFromColor:", v33);
    -[OADColorChangeEffect setToColor:](v36, "setToColor:", v35);
    -[OADBlipRef addEffect:](v58, "addEffect:", v36);

  }
  objc_msgSend(v59, "movieRelId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v59, "packagePart");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "relationshipForIdentifier:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39 && !objc_msgSend(v39, "targetMode"))
    {
      v46 = objc_alloc_init(OADQTStubFile);
      v40 = [OAXMovieContext alloc];
      objc_msgSend(v39, "targetLocation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "packagePart");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "package");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v40, "initWithTargetLocation:package:", v45, v42);

      -[OCDDelayedNode setDelayedContext:](v46, "setDelayedContext:", v43);
      CXDefaultStringAttribute(v16, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"title", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADMovie setName:](v46, "setName:", v44);
      -[OADBlipRef setName:](v58, "setName:", 0);
      objc_msgSend(v49, "setMovie:", v46);

    }
  }
  -[OADImageFill setBlipRef:](v47, "setBlipRef:", v58);
  -[OADImageFill setTechnique:](v47, "setTechnique:", v51);
  objc_msgSend(v52, "setImageFill:", v47);

}

@end
