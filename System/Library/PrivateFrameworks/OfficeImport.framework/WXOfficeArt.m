@implementation WXOfficeArt

+ (void)readFrom:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  OADBlip *v27;
  void *v28;
  void *v29;
  _DWORD *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  OADBlipRef *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCurrentOfficeArtTextType:", objc_msgSend(v15, "textType"));

  if (xmlStrEqual(a3->name, (const xmlChar *)"drawing"))
    objc_msgSend(a1, "readOAX:parentRElement:parentParagraph:state:to:", a3, a4, v12, v13, v14);
  else
    objc_msgSend(a1, "readVml:parentRElement:parentParagraph:state:to:", a3, a4, v12, v13, v14);
  objc_msgSend(v13, "setCurrentOfficeArtTextType:", 0xFFFFFFFFLL);
  objc_msgSend(v13, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "targetBlipCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "drawable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v17;
    objc_opt_class();
    v39 = v17;
    objc_msgSend(v39, "imageProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageFill");
    v45[0] = objc_claimAutoreleasedReturnValue();
    v41 = v13;
    v42 = v12;
    v40 = v14;
    v43 = v18;
    objc_msgSend(v18, "fill");
    v45[1] = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stroke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fill");
    v45[2] = objc_claimAutoreleasedReturnValue();

    v20 = 0;
    while (1)
    {
      v21 = (id)v45[v20];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        if (v22)
          goto LABEL_15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "pattern");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = v23;
          else
            v22 = 0;

          if (v22)
          {
LABEL_15:
            objc_msgSend(v22, "blipRef");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "index");
            if ((_DWORD)v25)
            {
              objc_msgSend(v44, "blipAtIndex:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_alloc_init(OADBlip);
              objc_msgSend(v26, "mainSubBlip");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[OADBlip setMainSubBlip:](v27, "setMainSubBlip:", v28);

              objc_msgSend(v26, "altSubBlip");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[OADBlip setAltSubBlip:](v27, "setAltSubBlip:", v29);

              *-[OADBlip referenceCount](v27, "referenceCount") = 1;
              v30 = (_DWORD *)objc_msgSend(v26, "referenceCount");
              --*v30;
              objc_msgSend(v43, "imageFill");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "blipRef");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v33 = objc_msgSend(v32, "index");
              objc_msgSend(v32, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", v33, v34, v27);
              objc_msgSend(v22, "setBlipRef:", v35);
              objc_msgSend(v32, "effects");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[OADBlipRef setEffects:](v35, "setEffects:", v36);

            }
          }
        }
        else
        {
          v22 = 0;
        }
      }

      if (++v20 == 3)
      {
        v37 = 2;
        v13 = v41;
        v12 = v42;
        v14 = v40;
        do

        while (v37 != -1);
        v17 = v38;
        break;
      }
    }
  }

}

+ (void)readOAX:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  id v10;
  CXNamespace *v11;
  uint64_t v12;
  CXNamespace *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a6;
  v10 = a7;
  objc_msgSend(v18, "WXDrawingNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "anchor");

  if (!v12)
  {
    objc_msgSend(v18, "WXDrawingNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v13, "inline");

  }
  objc_msgSend(v18, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "WXDrawingNamespace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXGraphicalObject readFromParentXmlNode:inNamespace:drawingState:](OAXGraphicalObject, "readFromParentXmlNode:inNamespace:drawingState:", v12, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "setDrawable:", v16);
    objc_msgSend(v16, "clientData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDrawable:", v16);
    objc_msgSend(a1, "readClientData:state:to:", v12, v18, v17);
    objc_msgSend(v10, "setFloating:", objc_msgSend(v17, "floating"));

  }
}

+ (void)readClientData:(_xmlNode *)a3 state:(id)a4 to:(id)a5
{
  CXNamespace *v7;
  _xmlNode *v8;
  void *v9;
  _xmlAttr *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  _xmlAttr *v19;
  _xmlAttr *v20;
  void *v21;
  void *v22;
  void *v23;
  OADOrientedBounds *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  void *v32;
  unsigned int v33;
  CXNamespace *v34;
  const xmlNode *v35;
  id v36;
  _BOOL4 NSStringAnyNsProp;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  CXNamespace *v43;
  const xmlNode *v44;
  id v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;

  v60 = a4;
  v57 = a5;
  objc_msgSend(v60, "WXDrawingNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "docPr");

  objc_msgSend(v57, "drawable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "id");
  v10 = CXRequiredUnsignedLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  objc_msgSend(v60, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawableForShapeId:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v10 = (_xmlAttr *)+[OADDrawable generateOADDrawableId:](OADDrawable, "generateOADDrawableId:", v9);
  objc_msgSend(v9, "setId:", v10);
  objc_msgSend(v60, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDrawable:forShapeId:", v9, v10);

  v62 = 0;
  LODWORD(v13) = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"title", &v62);
  v59 = v62;
  if ((_DWORD)v13)
  {
    objc_msgSend(v9, "drawableProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAltTitle:", v59);

  }
  v61 = 0;
  v15 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"descr", &v61);
  v58 = v61;
  if (v15)
  {
    objc_msgSend(v9, "drawableProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAltDescription:", v58);

  }
  objc_msgSend(v60, "WXDrawingNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "extent");

  v19 = CXRequiredLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"cx");
  v20 = CXRequiredLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"cy");
  v21 = v57;
  objc_msgSend(v57, "drawable");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "drawableProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v23, "hasOrientedBounds")
    || (objc_msgSend(v23, "orientedBounds"), (v24 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v24 = objc_alloc_init(OADOrientedBounds);
    objc_msgSend(v23, "setOrientedBounds:", v24);
  }
  -[OADOrientedBounds bounds](v24, "bounds");
  v27 = (double)(uint64_t)v19 / 12700.0;
  v28 = (double)(uint64_t)v20 / 12700.0;
  if (v25 > 0.0 && v26 > 0.0)
  {
    v29 = v27 / v25;
    if (v27 / v25 >= v28 / v26)
      v29 = v28 / v26;
    v30 = v29;
    v31 = v30;
    v27 = v25 * v31;
    v28 = v26 * v31;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"inline"))
  {
    -[OADOrientedBounds setBounds:](v24, "setBounds:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v27, v28);
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"anchor"))
  {
    objc_msgSend(v57, "createAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v32;
    v33 = CXRequiredBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"behindDoc");
    objc_msgSend(v32, "setZIndex:", CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"relativeHeight"));
    if (v33)
      objc_msgSend(v32, "setZIndex:", objc_msgSend(v32, "zIndex") - 503316480);
    objc_msgSend(v60, "WXDrawingNamespace");
    v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v35 = (const xmlNode *)OCXFindChild(a3, v34, "positionH");

    if (v35)
    {
      objc_msgSend(a1, "relativeHorizontalPositionEnumMap");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      NSStringAnyNsProp = sfaxmlGetNSStringAnyNsProp(v35, (const xmlChar *)"relativeFrom", &v63);
      v38 = v63;
      v39 = -130883970;
      if (NSStringAnyNsProp)
        v39 = (int)objc_msgSend(v36, "valueForString:", v38);

      v32 = v55;
      if (v39 != -130883970)
      {
        objc_msgSend(v57, "anchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v39 == 5)
          v42 = 4;
        else
          v42 = v39;
        objc_msgSend(v40, "setRelativeHorizontalPosition:", v42);

      }
      objc_msgSend(a1, "readPosition:state:to:isHorizontal:", v35, v60, v55, 1);
    }
    objc_msgSend(v60, "WXDrawingNamespace");
    v43 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v44 = (const xmlNode *)OCXFindChild(a3, v43, "positionV");

    if (v44)
    {
      objc_msgSend(a1, "relativeVerticalPositionEnumMap");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      v46 = sfaxmlGetNSStringAnyNsProp(v44, (const xmlChar *)"relativeFrom", &v63);
      v47 = v63;
      v48 = -130883970;
      if (v46)
        v48 = (int)objc_msgSend(v45, "valueForString:", v47);

      v32 = v55;
      if (v48 != -130883970)
      {
        objc_msgSend(v57, "anchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setRelativeVerticalPosition:", v48);

      }
      objc_msgSend(a1, "readPosition:state:to:isHorizontal:", v44, v60, v55, 0);
    }
    v21 = v57;
    objc_msgSend(v57, "anchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readWrap:state:to:", a3, v60, v50);

    objc_msgSend(v32, "bounds");
    v52 = v51;
    v54 = v53;
    -[OADOrientedBounds setBounds:](v24, "setBounds:");
    objc_msgSend(v32, "setBounds:", v52, v54, v27, v28);

  }
}

+ (void)readPosition:(_xmlNode *)a3 state:(id)a4 to:(id)a5 isHorizontal:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  CXNamespace *v10;
  uint64_t v11;
  CXNamespace *v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  double v39;
  id v40;

  v6 = a6;
  v40 = a4;
  v9 = a5;
  objc_msgSend(v40, "WXDrawingNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "align");

  objc_msgSend(v40, "WXDrawingNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "offset");

  objc_msgSend(v40, "WXDrawingNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "posOffset");

  if (v11)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v11);
    v17 = v16;
    if (v6)
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("left")) & 1) != 0)
      {
        v18 = 1;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("center")) & 1) != 0)
      {
        v18 = 2;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("right")) & 1) != 0)
      {
        v18 = 3;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("inside")) & 1) != 0)
      {
        v18 = 4;
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("outside")))
      {
        v18 = 5;
      }
      else
      {
        v18 = 1;
      }
      objc_msgSend(v9, "setHorizontalPosition:", v18);
    }
    else
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("top")) & 1) != 0)
      {
        v28 = 1;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("center")) & 1) != 0)
      {
        v28 = 2;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
      {
        v28 = 3;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("inside")) & 1) != 0)
      {
        v28 = 4;
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("outside")))
      {
        v28 = 5;
      }
      else
      {
        v28 = 1;
      }
      objc_msgSend(v9, "setVerticalPosition:", v28);
    }
  }
  else if (v13)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v13);
    objc_msgSend(v9, "bounds");
    v22 = v21;
    v24 = v23;
    if (v6)
    {
      v25 = v20;
      v26 = objc_msgSend(v17, "intValue");
      objc_msgSend(v9, "setHorizontalPosition:", 0);
      v27 = (double)v26 / 12700.0;
    }
    else
    {
      v27 = v19;
      v38 = objc_msgSend(v17, "intValue");
      objc_msgSend(v9, "setVerticalPosition:", 0);
      v25 = (double)v38 / 12700.0;
    }
    objc_msgSend(v9, "setBounds:", v27, v25, v22, v24);
  }
  else if (v15)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v15);
    objc_msgSend(v9, "bounds");
    v32 = v31;
    v34 = v33;
    if (v6)
    {
      v35 = v30;
      objc_msgSend(v17, "doubleValue");
      v37 = v36 / 12700.0;
    }
    else
    {
      v37 = v29;
      objc_msgSend(v17, "doubleValue");
      v35 = v39 / 12700.0;
    }
    objc_msgSend(v9, "setBounds:", v37, v35, v32, v34);
  }
  else
  {
    v17 = 0;
  }

}

+ (void)readWrap:(_xmlNode *)a3 state:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  CXNamespace *v10;
  uint64_t v11;
  CXNamespace *v12;
  const xmlNode *v13;
  void *v14;
  int v15;
  CXNamespace *v16;
  const xmlNode *v17;
  void *v18;
  int v19;
  CXNamespace *v20;
  const xmlNode *v21;
  void *v22;
  int v23;
  CXNamespace *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "WXDrawingNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = OCXFindChild(a3, v10, "wrapNone");

  if (v11)
  {
    objc_msgSend(v9, "setTextWrappingMode:", 3);
  }
  else
  {
    objc_msgSend(v8, "WXDrawingNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (const xmlNode *)OCXFindChild(a3, v12, "wrapSquare");

    if (v13)
    {
      objc_msgSend(v9, "setTextWrappingMode:", 2);
      objc_msgSend(a1, "readWrapDistance:parentElement:state:to:", v13, a3, v8, v9);
      v28 = 0;
      objc_msgSend(a1, "textWrappingModeTypeEnumMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = readEnumProperty<WDATextWrappingModeType>(v13, (const xmlChar *)"wrapText", v14, &v28);

      if (v15)
        objc_msgSend(v9, "setTextWrappingModeType:", v28);
    }
    else
    {
      objc_msgSend(v8, "WXDrawingNamespace");
      v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v17 = (const xmlNode *)OCXFindChild(a3, v16, "wrapThrough");

      if (v17)
      {
        objc_msgSend(v9, "setTextWrappingMode:", 5);
        objc_msgSend(a1, "readWrapDistance:parentElement:state:to:", v17, a3, v8, v9);
        v27 = 0;
        objc_msgSend(a1, "textWrappingModeTypeEnumMap");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = readEnumProperty<WDATextWrappingModeType>(v17, (const xmlChar *)"wrapText", v18, &v27);

        if (v19)
          objc_msgSend(v9, "setTextWrappingModeType:", v27);
      }
      else
      {
        objc_msgSend(v8, "WXDrawingNamespace");
        v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v21 = (const xmlNode *)OCXFindChild(a3, v20, "wrapTight");

        if (v21)
        {
          objc_msgSend(v9, "setTextWrappingMode:", 4);
          objc_msgSend(a1, "readWrapDistance:parentElement:state:to:", v21, a3, v8, v9);
          v26 = 0;
          objc_msgSend(a1, "textWrappingModeTypeEnumMap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = readEnumProperty<WDATextWrappingModeType>(v21, (const xmlChar *)"wrapText", v22, &v26);

          if (v23)
            objc_msgSend(v9, "setTextWrappingModeType:", v26);
        }
        else
        {
          objc_msgSend(v8, "WXDrawingNamespace");
          v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v25 = OCXFindChild(a3, v24, "wrapTopAndBottom");

          if (v25)
          {
            objc_msgSend(v9, "setTextWrappingMode:", 1);
            objc_msgSend(a1, "readWrapDistance:parentElement:state:to:", v25, a3, v8, v9);
          }
        }
      }
    }
  }

}

+ (void)readVml:(_xmlNode *)a3 parentRElement:(_xmlNode *)a4 parentParagraph:(id)a5 state:(id)a6 to:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _xmlNode *v14;
  _xmlNode *v15;
  void *v16;
  _BOOL8 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  EXReader *v21;
  void *v22;
  EXReader *v23;
  void *v24;
  void *v25;
  void *v26;
  OADOle *v27;
  OADOle *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v11, "wxoavState");
  v48 = v11;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCurrentParagraph:", v10);
  +[OAVDrawable readDrawablesFromParent:inNamespace:state:](OAVDrawable, "readDrawablesFromParent:inNamespace:state:", a3, OAVOfficeDrawingNamespace, v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCurrentParagraph:", 0);
  v14 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)OAVOfficeDrawingNamespace, "OLEObject");
  v15 = v14;
  if (!v14)
    goto LABEL_23;
  CXDefaultStringAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"ProgID", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "packagePart");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "OCXReadRelationshipForNode:packagePart:", v15, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[OADOle isProgIDChart:](OADOle, "isProgIDChart:", v16);
  if (v47)
    v18 = v17;
  else
    v18 = 0;
  if (!v18)
  {
    v24 = 0;
LABEL_14:
    v27 = objc_alloc_init(OADOle);
    v28 = v27;
    if (v24)
      -[OADOle setObject:](v27, "setObject:", v24);
    v25 = v28;
    if (v16)
      -[OADOle setAnsiProgID:](v28, "setAnsiProgID:", v16);
    goto LABEL_18;
  }
  context = (void *)MEMORY[0x22E2DDB58](v17);
  objc_msgSend(v45, "package");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "targetLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "partForLocation:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v20;
  objc_msgSend(v20, "data");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "hasSuffix:", CFSTR(".12")))
  {
    v21 = [EXReader alloc];
    objc_msgSend(v48, "cancelDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[OCDReader initWithCancelDelegate:](v21, "initWithCancelDelegate:", v22);

    if (-[OCXReader start](v23, "start"))
    {
      -[OCDReader setData:](v23, "setData:", v43);
      -[EXReader read](v23, "read");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v25 = 0;
  }
  else
  {
    objc_msgSend(v48, "cancelDelegate");
    v23 = (EXReader *)objc_claimAutoreleasedReturnValue();
    +[OABOle readFromData:cancel:](OABOle, "readFromData:cancel:", v43, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
  }

  objc_msgSend(v47, "targetLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "resetPartForLocation:", v26);

  objc_autoreleasePoolPop(context);
  if (!v25)
    goto LABEL_14;
LABEL_18:
  v49 = 0;
  v29 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"ShapeID", &v49);
  v30 = v49;
  if (v29)
  {
    objc_msgSend(v46, "drawableForVmlShapeId:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_class();
    TSUDynamicCast(v32, (uint64_t)v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      objc_msgSend(v33, "setOle:", v25);

  }
LABEL_23:
  v35 = objc_msgSend(v13, "count");
  if (v35)
  {
    for (i = 0; i != v35; ++i)
    {
      objc_msgSend(v13, "objectAtIndex:", i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "setDrawable:", v37);
        objc_msgSend(v37, "clientData");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDrawable:", v37);
        objc_msgSend(v12, "setFloating:", objc_msgSend(v38, "floating"));
        objc_msgSend(v38, "textBox");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          objc_msgSend(v10, "document");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setDocument:", v40);

        }
      }

    }
  }

}

+ (void)readWrapDistance:(_xmlNode *)a3 parentElement:(_xmlNode *)a4 state:(id)a5 to:(id)a6
{
  id v9;
  id v10;
  CXNamespace *v11;
  BOOL v12;
  CXNamespace *v13;
  BOOL v14;
  CXNamespace *v15;
  BOOL v16;
  uint64_t v17;

  v9 = a5;
  v10 = a6;
  v17 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"distB", &v17)
    || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distB", &v17))
  {
    objc_msgSend(v10, "setWrapDistanceBottom:", (double)v17 / 12700.0);
  }
  objc_msgSend(v9, "WXDrawingNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = CXOptionalLongAttribute(a3, v11, (xmlChar *)"distL", &v17);

  if (v12 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distL", &v17))
    objc_msgSend(v10, "setWrapDistanceLeft:", (double)v17 / 12700.0);
  objc_msgSend(v9, "WXDrawingNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXOptionalLongAttribute(a3, v13, (xmlChar *)"distR", &v17);

  if (v14 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distR", &v17))
    objc_msgSend(v10, "setWrapDistanceRight:", (double)v17 / 12700.0);
  objc_msgSend(v9, "WXDrawingNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = CXOptionalLongAttribute(a3, v15, (xmlChar *)"distT", &v17);

  if (v16 || CXOptionalLongAttribute(a4, (CXNamespace *)CXNoNamespace, (xmlChar *)"distT", &v17))
    objc_msgSend(v10, "setWrapDistanceTop:", (double)v17 / 12700.0);

}

+ (id)relativeHorizontalPositionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_37, 0, &dword_22A0CC000);
  }
  if (+[WXOfficeArt relativeHorizontalPositionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXOfficeArt relativeHorizontalPositionEnumMap]::onceToken, &__block_literal_global_88);
  return (id)+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap;
}

void __48__WXOfficeArt_relativeHorizontalPositionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionStructs, 9, 1);
  v1 = (void *)+[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap;
  +[WXOfficeArt relativeHorizontalPositionEnumMap]::sRelativeHorizontalPositionEnumMap = (uint64_t)v0;

}

+ (id)relativeVerticalPositionEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_26, 0, &dword_22A0CC000);
  }
  if (+[WXOfficeArt relativeVerticalPositionEnumMap]::onceToken != -1)
    dispatch_once(&+[WXOfficeArt relativeVerticalPositionEnumMap]::onceToken, &__block_literal_global_27_1);
  return (id)+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap;
}

void __46__WXOfficeArt_relativeVerticalPositionEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionStructs, 8, 1);
  v1 = (void *)+[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap;
  +[WXOfficeArt relativeVerticalPositionEnumMap]::sRelativeVerticalPositionEnumMap = (uint64_t)v0;

}

+ (id)textWrappingModeTypeEnumMap
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_36, 0, &dword_22A0CC000);
  }
  if (+[WXOfficeArt textWrappingModeTypeEnumMap]::onceToken != -1)
    dispatch_once(&+[WXOfficeArt textWrappingModeTypeEnumMap]::onceToken, &__block_literal_global_37);
  return (id)+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap;
}

void __42__WXOfficeArt_textWrappingModeTypeEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeStructs, 4, 1);
  v1 = (void *)+[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap;
  +[WXOfficeArt textWrappingModeTypeEnumMap]::sTextWrappingModeTypeEnumMap = (uint64_t)v0;

}

+ (void)writeWrapText:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7)
  {
    +[WDAAnchor stringForTextWrappingModeType:](WDAAnchor, "stringForTextWrappingModeType:", objc_msgSend(v7, "textWrappingModeType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeAttribute:content:prefix:ns:", CFSTR("wrapText"), v6, 0, 0);

  }
}

+ (void)writeWrapLeftDistance:(id)a3 to:(id)a4
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v8, "wrapDistanceLeft");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)(v6 * 12700.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeAttribute:content:prefix:ns:", CFSTR("distL"), v7, 0, 0);

  }
}

+ (void)writeWrapRightDistance:(id)a3 to:(id)a4
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v8, "wrapDistanceRight");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)(v6 * 12700.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeAttribute:content:prefix:ns:", CFSTR("distR"), v7, 0, 0);

  }
}

+ (void)writeWrapTopDistance:(id)a3 to:(id)a4
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v8, "wrapDistanceTop");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)(v6 * 12700.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeAttribute:content:prefix:ns:", CFSTR("distT"), v7, 0, 0);

  }
}

+ (void)writeWrapBottomDistance:(id)a3 to:(id)a4
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v8, "wrapDistanceBottom");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), (uint64_t)(v6 * 12700.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeAttribute:content:prefix:ns:", CFSTR("distB"), v7, 0, 0);

  }
}

+ (BOOL)writeWrapTightlyWith:(id)a3 toWriter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  const __CFString *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "textWrapPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 3)
  {

    goto LABEL_5;
  }
  if (objc_msgSend(v6, "textWrappingMode") != 4)
  {
    v10 = objc_msgSend(v6, "textWrappingMode");

    if (v10 == 5)
      goto LABEL_7;
LABEL_5:
    v9 = 0;
    goto LABEL_11;
  }

LABEL_7:
  if (objc_msgSend(v6, "textWrappingMode") == 4)
    v11 = CFSTR("wrapTight");
  else
    v11 = CFSTR("wrapThrough");
  objc_msgSend(v7, "startElement:prefix:ns:", v11, CFSTR("wp"), 0);
  objc_msgSend(a1, "writeWrapText:to:", v6, v7);
  objc_msgSend(a1, "writeWrapLeftDistance:to:", v6, v7);
  objc_msgSend(a1, "writeWrapRightDistance:to:", v6, v7);
  objc_msgSend(v7, "startElement:prefix:ns:", CFSTR("wrapPolygon"), CFSTR("wp"), 0);
  objc_msgSend(v7, "writeAttribute:BOOLContent:prefix:ns:", CFSTR("edited"), 1, 0, 0);
  objc_msgSend(v6, "textWrapPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "writeWrapPolygonChildren:to:", v12, v7);

  objc_msgSend(v7, "endElement");
  objc_msgSend(v7, "endElement");
  v9 = 1;
LABEL_11:

  return v9;
}

+ (void)writeWrapPolygonChildren:(id)a3 to:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const __CFString *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = objc_msgSend(v16, "count");
  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGPointValue");
      v10 = v9;
      v12 = v11;

      v13 = -2.72730423e13;
      if (v10 >= -2.72730423e13)
      {
        v13 = v10;
        if (v10 > 2.72730423e13)
          v13 = 2.72730423e13;
      }
      v14 = -2.72730423e13;
      if (v12 >= -2.72730423e13)
      {
        v14 = v12;
        if (v12 > 2.72730423e13)
          v14 = 2.72730423e13;
      }
      if (v7)
        v15 = CFSTR("lineTo");
      else
        v15 = CFSTR("start");
      objc_msgSend(v5, "startElement:prefix:ns:", v15, CFSTR("wp"), 0);
      objc_msgSend(v5, "writeAttribute:intContent:prefix:ns:", CFSTR("x"), (uint64_t)v13, 0, 0);
      objc_msgSend(v5, "writeAttribute:intContent:prefix:ns:", CFSTR("y"), (uint64_t)v14, 0, 0);
      objc_msgSend(v5, "endElement");
      ++v7;
    }
    while (v6 != v7);
  }

}

@end
