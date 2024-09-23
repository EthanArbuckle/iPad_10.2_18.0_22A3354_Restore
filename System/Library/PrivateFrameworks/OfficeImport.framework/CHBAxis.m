@implementation CHBAxis

+ (id)readWithXlPlotAxis:(int)a3 state:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  OADGraphicProperties *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  double v26;
  double v27;
  OADGraphicProperties *v28;
  void *v29;
  void *v30;
  OADGraphicProperties *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  xmlNodePtr v45;
  xmlNodePtr v46;
  OADTextBody *v47;
  OAXDrawingState *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _WORD v61[4];
  uint64_t v62;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "axisGroup");
  if (!XlChartBinaryReader::hasAxis(objc_msgSend(v5, "xlReader"), v6, v4))
  {
LABEL_20:
    v10 = 0;
    goto LABEL_64;
  }
  v62 = 0;
  v7 = objc_msgSend(v5, "xlReader");
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v7 + 720))(v7, v6, v4, &v62);
  v8 = +[CHBAxis chbAxisClassWith:plotAxis:](CHBAxis, "chbAxisClassWith:plotAxis:", v62, v4);
  if (!v8)
  {
    if (v62)
      (*(void (**)(uint64_t))(*(_QWORD *)v62 + 8))(v62);
    goto LABEL_20;
  }
  -[objc_class readFrom:state:](v8, "readFrom:state:", v62, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v6)
    objc_msgSend(v9, "setSecondary:", 1);
  v11 = +[CHBAxis chbAxisIdForPlotAxis:state:](CHBAxis, "chbAxisIdForPlotAxis:state:", v4, v5);
  objc_msgSend(v10, "setAxisId:", v11);
  objc_msgSend(v10, "setAxisType:", v11);
  objc_msgSend(v10, "setAxisPosition:", +[CHBAxis chdAxisPositionFromAxisType:](CHBAxis, "chdAxisPositionFromAxisType:", v11));
  v12 = v62;
  if (*(_BYTE *)(v62 + 145))
  {
    objc_msgSend(v10, "setContentFormatId:", *(unsigned __int16 *)(v62 + 122));
    v12 = v62;
  }
  if (*(_BYTE *)(v12 + 144))
    objc_msgSend(v10, "setFontIndex:", +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", *(unsigned __int16 *)(v12 + 120)));
  v13 = objc_alloc_init(OADGraphicProperties);
  v14 = *(_QWORD *)(v62 + 24);
  if (v14)
  {
    if (*(_DWORD *)(v14 + 16) == 5)
      objc_msgSend(v10, "setLineVisible:", 0);
    if (!*(_BYTE *)(v14 + 27))
      objc_msgSend(v10, "setDeleted:", 1);
  }
  +[CHBGraphicProperties oadStrokeFrom:](CHBGraphicProperties, "oadStrokeFrom:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v13, "setStroke:", v15);

  objc_msgSend(v5, "autoStyling");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolveAxisGraphicProperties:", v13);

  objc_msgSend(v10, "setAxisGraphicProperties:", v13);
  v17 = *(_QWORD *)(v62 + 72);
  if (v17)
  {
    objc_msgSend(v10, "setMajorTickMark:", *(unsigned int *)(v17 + 28));
    objc_msgSend(v10, "setMinorTickMark:", *(unsigned int *)(v17 + 32));
    objc_msgSend(v10, "setTickLabelPosition:", *(unsigned int *)(v17 + 36));
    objc_msgSend(v10, "setTickLabelAutoRotation:", XlChartTick::isAutoRotation((XlChartTick *)v17));
    v18 = objc_msgSend(v5, "xlReader");
    v19 = *(unsigned __int16 *)(v17 + 20);
    if (*(_BYTE *)(v18 + 1344) && v19 >= 0x40)
    {
      v20 = *(_DWORD *)(v17 + 16);
      v61[0] = 255;
      v61[1] = v20;
      v61[2] = BYTE1(v20);
      v61[3] = BYTE2(v20);
      +[OITSUColor colorWithCsColour:](OITSUColor, "colorWithCsColour:", v61);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resources");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "colors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "addOrEquivalentColorExcludingDefaults:", v21);

      objc_msgSend(v10, "setTickLabelColorIndex:", v24);
    }
    else
    {
      objc_msgSend(v10, "setTickLabelColorIndex:", v19);
    }
    v25 = *(unsigned __int16 *)(v17 + 24);
    v26 = (double)v25 + -90.0;
    if (v25 == 255)
      v26 = 90.0;
    v27 = -(double)v25;
    if (v25 > 0x5A)
      v27 = v26;
    objc_msgSend(v10, "setTickLabelRotationAngle:", v27);
  }
  v28 = objc_alloc_init(OADGraphicProperties);
  +[CHBGraphicProperties oadStrokeFrom:](CHBGraphicProperties, "oadStrokeFrom:", *(_QWORD *)(v62 + 40));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v28, "setStroke:", v29);

  objc_msgSend(v5, "autoStyling");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "resolveMinorGridLinesGraphicProperties:", v28);

  objc_msgSend(v10, "setMinorGridLinesGraphicProperties:", v28);
  v31 = objc_alloc_init(OADGraphicProperties);
  +[CHBGraphicProperties oadStrokeFrom:](CHBGraphicProperties, "oadStrokeFrom:", *(_QWORD *)(v62 + 32));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v31, "setStroke:", v32);

  objc_msgSend(v5, "autoStyling");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resolveMajorGridLinesGraphicProperties:", v31);

  objc_msgSend(v10, "setMajorGridLinesGraphicProperties:", v31);
  +[CHBGraphicProperties oadGraphicPropertiesFromState:xlLineStyle:xlFillStyle:](CHBGraphicProperties, "oadGraphicPropertiesFromState:xlLineStyle:xlFillStyle:", v5, *(_QWORD *)(v62 + 48), *(_QWORD *)(v62 + 56));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v62 + 32))(v62);
  v37 = v35 == 1 && (_DWORD)v11 != 2;
  if (v35 == 2 || v37)
  {
    objc_msgSend(v5, "autoStyling");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "resolveWallGraphicProperties:", v34);

    objc_msgSend(v5, "chart");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setSideWallGraphicProperties:", v34);

    objc_msgSend(v5, "chart");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBackWallGraphicProperties:", v34);
    goto LABEL_38;
  }
  if (!v35)
  {
    objc_msgSend(v5, "autoStyling");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "resolveFloorGraphicProperties:", v34);

    objc_msgSend(v5, "chart");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFloorGraphicProperties:", v34);
LABEL_38:

  }
  v42 = v62;
  v43 = *(_QWORD *)(v62 + 16);
  if (v43)
  {
    +[CHBTitle readFrom:state:](CHBTitle, "readFrom:state:", v43, v5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v44);

    v42 = v62;
  }
  v45 = CXGetRootElement(*(const unsigned __int8 **)(v42 + 112), *(_DWORD *)(v42 + 140));
  v46 = v45;
  if (v45)
  {
    if (xmlStrEqual(v45->name, (const xmlChar *)"txPr"))
    {
      v47 = objc_alloc_init(OADTextBody);
      v48 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
      +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v46, v47, v48);
      if (-[OADTextBody paragraphCount](v47, "paragraphCount"))
      {
        -[OADTextBody firstParagraphEffects](v47, "firstParagraphEffects");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLabelEffects:", v49);

      }
    }
    xmlFreeDoc(v46->doc);
  }
  v50 = v62;
  if (*(_DWORD *)(v62 + 124))
  {
    +[CHBGraphicProperties oadGraphicPropertiesFromShapePropsStream:size:](CHBGraphicProperties, "oadGraphicPropertiesFromShapePropsStream:size:", *(_QWORD *)(v62 + 80));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51 && objc_msgSend(v51, "hasEffects"))
    {
      objc_msgSend(v5, "autoStyling");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "resolveAxisGraphicProperties:", v52);

      objc_msgSend(v10, "setAxisGraphicProperties:", v52);
    }

    v50 = v62;
  }
  if (*(_DWORD *)(v50 + 128))
  {
    +[CHBGraphicProperties oadGraphicPropertiesFromShapePropsStream:size:](CHBGraphicProperties, "oadGraphicPropertiesFromShapePropsStream:size:", *(_QWORD *)(v50 + 88));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54 && objc_msgSend(v54, "hasEffects"))
    {
      objc_msgSend(v5, "autoStyling");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "resolveAxisGraphicProperties:", v55);

      objc_msgSend(v10, "setMajorGridLinesGraphicProperties:", v55);
    }

    v50 = v62;
  }
  if (!*(_DWORD *)(v50 + 132))
    goto LABEL_62;
  +[CHBGraphicProperties oadGraphicPropertiesFromShapePropsStream:size:](CHBGraphicProperties, "oadGraphicPropertiesFromShapePropsStream:size:", *(_QWORD *)(v50 + 96));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57 && objc_msgSend(v57, "hasEffects"))
  {
    objc_msgSend(v5, "autoStyling");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "resolveAxisGraphicProperties:", v58);

    objc_msgSend(v10, "setMinorGridLinesGraphicProperties:", v58);
  }

  v50 = v62;
  if (v62)
LABEL_62:
    (*(void (**)(uint64_t))(*(_QWORD *)v50 + 8))(v50);

LABEL_64:
  return v10;
}

+ (Class)chbAxisClassWith:(XlChartPlotAxis *)a3 plotAxis:(int)a4
{
  int v4;
  void *v5;

  if (a3)
  {
    v4 = (*((uint64_t (**)(XlChartPlotAxis *, SEL))a3->var0 + 4))(a3, a2);
    if (!v4 || v4 == 2 || v4 == 1)
    {
      objc_opt_class();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return (Class)v5;
}

+ (int)chbAxisIdForPlotAxis:(int)a3 state:(id)a4
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  v5 = objc_msgSend(a4, "axisGroup");
  if (v5)
    v6 = 5;
  else
    v6 = 2;
  if (v5)
    v7 = 4;
  else
    v7 = 1;
  if (v5)
    v8 = 3;
  else
    v8 = 0;
  if (a3)
    v9 = -1;
  else
    v9 = v8;
  if (a3 == 1)
    v9 = v7;
  if (a3 == 2)
    return v6;
  else
    return v9;
}

+ (int)chdAxisPositionFromAxisType:(int)a3
{
  if (a3 > 4)
    return -1;
  else
    return dword_22A4C1710[a3];
}

+ (Class)chbAxisClassWith:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (int)xlPlotAxisTypeFrom:(int)a3
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return dword_22A4C16FC[a3 - 1];
}

@end
