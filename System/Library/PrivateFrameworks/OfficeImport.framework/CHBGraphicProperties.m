@implementation CHBGraphicProperties

+ (id)oadGraphicPropertiesFromXlChartFrameType:(XlChartFrameType *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int var16;
  OADGraphicProperties *v11;
  void *v12;
  void *v13;
  void *v14;
  OADOrientedBounds *v15;

  v6 = a4;
  objc_msgSend(v6, "ebReaderSheetState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oaState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "useXmlBlobs"))
  {

    goto LABEL_5;
  }
  var16 = a3->var16;

  if (!var16)
  {
LABEL_5:
    v11 = objc_alloc_init(OADGraphicProperties);
    objc_msgSend(a1, "mapFillStyle:xlPictureFormat:state:", a3->var10, a3->var11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setFill:](v11, "setFill:", v12);

    objc_msgSend(a1, "oadStrokeFrom:", a3->var9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setStroke:](v11, "setStroke:", v13);

    +[CHDChart binaryEffects:](CHDChart, "binaryEffects:", a3->var12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGraphicProperties setEffects:](v11, "setEffects:", v14);

    goto LABEL_6;
  }
  objc_msgSend(a1, "oadGraphicPropertiesFromShapePropsStream:size:", a3->var15, a3->var16);
  v11 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v15 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", a3->var1, a3->var2, a3->var3, a3->var4);
  -[OADDrawableProperties setOrientedBounds:](v11, "setOrientedBounds:", v15);

  return v11;
}

+ (id)mapFillStyle:(const XlChartFillStyle *)a3 xlPictureFormat:(const XlChartPicF *)a4 state:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  OADSolidFill *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OADGraphicProperties *v15;
  void *v16;
  void *v17;
  void *v18;
  OADSolidFill *v19;
  OADTileTechnique *v20;
  void *v21;

  v7 = a5;
  v8 = v7;
  if (!a3)
  {
    v10 = 0;
    goto LABEL_23;
  }
  if (a3->var7)
  {
    +[CHDAutomaticObject automaticFill](CHDAutomaticObject, "automaticFill");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = (OADSolidFill *)v9;
    goto LABEL_23;
  }
  if (!a3->var3)
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_msgSend(v7, "ebReaderSheetState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readerState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[EBEscher readRootObjectWithType:state:](EBEscher, "readRootObjectWithType:state:", 6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_msgSend(v13, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14) == 4)
    {
      v15 = objc_alloc_init(OADGraphicProperties);
      objc_msgSend(v8, "ebReaderSheetState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "readerState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "oaState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABShape readGraphicDefaults:to:state:](OABShape, "readGraphicDefaults:to:state:", v13, v15, v18);

      -[OADGraphicProperties fill](v15, "fill");
      v10 = (OADSolidFill *)objc_claimAutoreleasedReturnValue();

      if (!a4)
        goto LABEL_14;
LABEL_12:
      if ((a4->var3 & 0xFFFFFFFE) == 2)
      {
        objc_opt_class();
        v19 = v10;
        v20 = objc_alloc_init(OADTileTechnique);
        -[OADSolidFill setTechnique:](v19, "setTechnique:", v20);

      }
      goto LABEL_14;
    }
  }
  v10 = 0;
  if (a4)
    goto LABEL_12;
LABEL_14:
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && a3->var3 == 1)
      objc_msgSend(v8, "xlReader");
  }
  else if (a3->var3 == 1)
  {
    v10 = objc_alloc_init(OADSolidFill);
    +[OADIndexedColor indexedColorWithIndex:](OADIndexedColor, "indexedColorWithIndex:", a3->var4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADSolidFill setColor:](v10, "setColor:", v21);

  }
  else
  {
    v10 = 0;
  }

LABEL_23:
  return v10;
}

+ (id)oadStrokeFrom:(const XlChartLineStyle *)a3
{
  uint64_t v4;
  OADStroke *v5;
  OADSolidFill *v8;
  void *v9;
  float var8;
  OADValueColorTransform *v11;
  double v12;
  double v13;
  int var9;
  void *v15;

  if (a3)
  {
    if (a3->var5)
    {
      +[CHDAutomaticObject automaticStroke](CHDAutomaticObject, "automaticStroke");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (OADStroke *)v4;
      return v5;
    }
    if (a3->var2 == 5)
    {
      +[OADStroke nullStroke](OADStroke, "nullStroke");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v5 = objc_alloc_init(OADStroke);
    v8 = objc_alloc_init(OADSolidFill);
    +[OADIndexedColor indexedColorWithIndex:](OADIndexedColor, "indexedColorWithIndex:", a3->var4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    var8 = a3->var8;
    if (var8 != 1.0)
    {
      v11 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", 6);
      *(float *)&v12 = var8;
      -[OADValueColorTransform setValue:](v11, "setValue:", v12);
      objc_msgSend(v9, "addTransform:", v11);

    }
    -[OADSolidFill setColor:](v8, "setColor:", v9);
    -[OADStroke setFill:](v5, "setFill:", v8);
    objc_msgSend(a1, "widthFromLineWeightEnum:", a3->var3);
    -[OADStroke setWidth:](v5, "setWidth:");
    var9 = a3->var9;
    if (var9 >= 1)
    {
      *(float *)&v13 = (float)var9;
      -[OADStroke setWidth:](v5, "setWidth:", v13);
    }
    objc_msgSend(a1, "mapPresetDashFromPattern:", a3->var2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStroke setDash:](v5, "setDash:", v15);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (float)widthFromLineWeightEnum:(int)a3
{
  float result;

  if (a3 <= 1)
  {
    if (a3 == 1)
      return 2.0;
    return 1.0;
  }
  if (a3 != 2)
  {
    result = 0.25;
    if (a3 == 0xFFFF)
      return result;
    return 1.0;
  }
  return 3.0;
}

+ (id)mapPresetDashFromPattern:(int)a3
{
  OADPresetDash *v3;
  uint64_t v4;

  if (a3 == 5)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&a3;
    v3 = objc_alloc_init(OADPresetDash);
    -[OADPresetDash setType:](v3, "setType:", objc_msgSend(a1, "oaPresetDashTypeFromLinePatternEnum:", v4));
  }
  return v3;
}

+ (char)oaPresetDashTypeFromLinePatternEnum:(int)a3
{
  if (a3 > 8)
    return -1;
  else
    return byte_22A4C177C[a3];
}

+ (id)oadGraphicPropertiesFromState:(id)a3 xlLineStyle:(const XlChartLineStyle *)a4 xlFillStyle:(const XlChartFillStyle *)a5
{
  id v8;
  OADGraphicProperties *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = objc_alloc_init(OADGraphicProperties);
  objc_msgSend(a1, "mapFillStyle:xlPictureFormat:state:", a5, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setFill:](v9, "setFill:", v10);

  objc_msgSend(a1, "oadStrokeFrom:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v9, "setStroke:", v11);

  +[CHDChart binaryEffects:](CHDChart, "binaryEffects:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setEffects:](v9, "setEffects:", v12);

  return v9;
}

+ (id)oadGraphicPropertiesFromXlChartSeriesFormat:(const XlChartSeriesFormat *)a3 state:(id)a4
{
  id v6;
  OADGraphicProperties *v7;
  XlChartFillStyle *var2;
  XlChartLineStyle *var1;
  XlChartPicF *var4;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = objc_alloc_init(OADGraphicProperties);
  if (a3)
  {
    var1 = a3->var1;
    var2 = a3->var2;
    var4 = a3->var4;
    a3 = (const XlChartSeriesFormat *)a3->var16;
  }
  else
  {
    var1 = 0;
    var2 = 0;
    var4 = 0;
  }
  objc_msgSend(a1, "mapFillStyle:xlPictureFormat:state:", var2, var4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setFill:](v7, "setFill:", v11);

  objc_msgSend(a1, "oadStrokeFrom:", var1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v7, "setStroke:", v12);

  +[CHDChart binaryEffects:](CHDChart, "binaryEffects:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setEffects:](v7, "setEffects:", v13);

  return v7;
}

+ (id)oadGraphicPropertiesFromXlMarkerStyle:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5
{
  _BOOL8 v5;
  id v8;
  OADGraphicProperties *v9;
  OADStroke *v10;
  OADSolidFill *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v8 = a5;
  v9 = objc_alloc_init(OADGraphicProperties);
  if (a3)
  {
    if (a3->var8)
    {
      if (a3->var9)
      {
        +[CHDAutomaticObject automaticStroke](CHDAutomaticObject, "automaticStroke");
        v10 = (OADStroke *)objc_claimAutoreleasedReturnValue();
        -[OADGraphicProperties setStroke:](v9, "setStroke:", v10);
      }
      else
      {
        v10 = objc_alloc_init(OADStroke);
        v11 = objc_alloc_init(OADSolidFill);
        +[OADIndexedColor indexedColorWithIndex:](OADIndexedColor, "indexedColorWithIndex:", a3->var5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADSolidFill setColor:](v11, "setColor:", v12);

        -[OADStroke setFill:](v10, "setFill:", v11);
        objc_msgSend(a1, "widthFromLineWeightEnum:", 1);
        -[OADStroke setWidth:](v10, "setWidth:");
        objc_msgSend(a1, "mapPresetDashFromPattern:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADStroke setDash:](v10, "setDash:", v13);

        -[OADGraphicProperties setStroke:](v9, "setStroke:", v10);
      }

    }
    if (a3->var7)
    {
      objc_msgSend(a1, "mapFillStyleForMarker:complex:state:", a3, v5, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGraphicProperties setFill:](v9, "setFill:", v14);

    }
  }

  return v9;
}

+ (id)mapFillStyleForMarker:(const XlChartMarkerStyle *)a3 complex:(BOOL)a4 state:(id)a5
{
  _BOOL4 v5;
  id v8;
  OADSolidFill *v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  if (a3)
  {
    if (a3->var9)
    {
      +[CHDAutomaticObject automaticFill](CHDAutomaticObject, "automaticFill");
      v9 = (OADSolidFill *)objc_claimAutoreleasedReturnValue();
    }
    else if (!v5
           || (objc_msgSend(a1, "mapAssociatedEscherObjectstate:", v8),
               (v9 = (OADSolidFill *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v9 = objc_alloc_init(OADSolidFill);
      +[OADIndexedColor indexedColorWithIndex:](OADIndexedColor, "indexedColorWithIndex:", a3->var6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADSolidFill setColor:](v9, "setColor:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)mapAssociatedEscherObjectstate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  OADGraphicProperties *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "ebReaderSheetState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EBEscher readRootObjectWithType:state:](EBEscher, "readRootObjectWithType:state:", 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v7 = objc_msgSend(v6, "eshObject"), (*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7) == 4))
  {
    v8 = objc_alloc_init(OADGraphicProperties);
    objc_msgSend(v3, "ebReaderSheetState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readerState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oaState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABShape readGraphicDefaults:to:state:](OABShape, "readGraphicDefaults:to:state:", v6, v8, v11);

    -[OADGraphicProperties fill](v8, "fill");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)oadGraphicPropertiesFromShapePropsStream:(const char *)a3 size:(unsigned int)a4
{
  xmlNodePtr v4;
  xmlNodePtr v5;
  OADGraphicProperties *v6;
  OAXDrawingState *v7;

  v4 = CXGetRootElement((const unsigned __int8 *)a3, a4);
  v5 = v4;
  if (v4)
  {
    if (xmlStrEqual(v4->name, (const xmlChar *)"spPr"))
    {
      v6 = objc_alloc_init(OADGraphicProperties);
      v7 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
      +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v5, v6, v7);

    }
    else
    {
      v6 = 0;
    }
    xmlFreeDoc(v5->doc);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)oadGraphicPropertiesFromXlChartTextFrame:(void *)a3 state:(id)a4
{
  objc_msgSend(a1, "oadGraphicPropertiesFromXlChartFrameType:state:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)oadGraphicPropertiesFromXlLeaderLineStyleInPlot:(const void *)a3 state:(id)a4
{
  id v6;
  OADGraphicProperties *v7;
  OADGraphicProperties *v8;
  OADGraphicProperties *v9;
  void *v10;
  OADGraphicProperties *v11;

  v6 = a4;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (*((_DWORD *)a3 + 27)
    && (+[CHBGraphicProperties oadGraphicPropertiesFromShapePropsStream:size:](CHBGraphicProperties, "oadGraphicPropertiesFromShapePropsStream:size:", *((_QWORD *)a3 + 11)), v7 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue(), (v8 = v7) != 0))
  {
    v9 = v7;
    if (-[OADGraphicProperties hasStroke](v7, "hasStroke"))
      goto LABEL_8;
  }
  else
  {
    v9 = 0;
  }
  v8 = objc_alloc_init(OADGraphicProperties);

  objc_msgSend(a1, "oadStrokeFrom:", *((_QWORD *)a3 + 7));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGraphicProperties setStroke:](v8, "setStroke:", v10);

LABEL_8:
  v11 = v8;

LABEL_10:
  return v11;
}

+ (int)presetLinePatternEnumFromDash:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a3;
  if (!v3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (int)objc_msgSend(v3, "type") + 1;
      if (v5 <= 0xF)
      {
        v4 = dword_22A4C1788[v5];
        goto LABEL_8;
      }
    }
LABEL_7:
    v4 = 5;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

+ (int)lineWeightEnumFromWidth:(float)a3
{
  if (a3 >= 1.0 && a3 < 2.0)
    return 0;
  if (a3 >= 2.0 && a3 < 3.0)
    return 1;
  if (a3 >= 3.0)
    return 2;
  return 0xFFFF;
}

@end
