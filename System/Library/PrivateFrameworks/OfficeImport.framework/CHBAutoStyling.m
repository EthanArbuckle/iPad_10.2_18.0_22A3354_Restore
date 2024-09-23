@implementation CHBAutoStyling

- (void)resolveChartAreaGraphicProperties:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling autoFill](self, "autoFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, v4, v5, 0, 0, 0, v6);

  }
}

- (id)autoFill
{
  return -[CHBAutoStyling fillWithColorIndex:](self, "fillWithColorIndex:", 78);
}

- (id)fillWithColorIndex:(unint64_t)a3
{
  OADIndexedColor *v3;
  OADSolidFill *v4;

  v3 = -[OADIndexedColor initWithIndex:]([OADIndexedColor alloc], "initWithIndex:", a3);
  v4 = objc_alloc_init(OADSolidFill);
  -[OADSolidFill setColor:](v4, "setColor:", v3);

  return v4;
}

- (id)autoStroke
{
  return -[CHBAutoStyling strokeWithColorIndex:](self, "strokeWithColorIndex:", 77);
}

- (id)strokeWithColorIndex:(int)a3
{
  void *v3;
  OADStroke *v4;
  double v5;

  -[CHBAutoStyling fillWithColorIndex:](self, "fillWithColorIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(OADStroke);
  -[OADStroke setFill:](v4, "setFill:", v3);
  LODWORD(v5) = 1.0;
  -[OADStroke setWidth:](v4, "setWidth:", v5);

  return v4;
}

- (void)resolvedGraphicProperties:(id)a3 autoFill:(id)a4 autoStroke:(id)a5 autoShadow:(BOOL)a6 nullFill:(id)a7 nullStroke:(id)a8 nullShadow:(BOOL)a9
{
  _BOOL8 v11;
  _BOOL8 v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v11 = a6;
  v14 = a9;
  v39 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v39)
  {
    v19 = objc_msgSend(v39, "isMergedWithParent");
    objc_msgSend(v39, "setMergedWithParent:", 0);
    if (v16)
    {
      if (v18)
        goto LABEL_7;
    }
    else
    {
      +[OADStroke nullStroke](OADStroke, "nullStroke");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_7;
    }
    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v20 = objc_msgSend(v39, "hasStroke");
    v21 = v18;
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v39, "stroke");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CHDAutomaticObject automaticStroke](CHDAutomaticObject, "automaticStroke");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v23)
        goto LABEL_13;
      objc_msgSend(v39, "setStroke:", 0);
      v21 = v16;
    }
    v24 = v21;
    if (v24)
    {
      v25 = v24;
      v26 = (void *)objc_msgSend(v24, "copy");

      if ((objc_msgSend(v39, "hasStroke") & 1) != 0)
      {
        objc_msgSend(v39, "stroke");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setParent:", v26);

      }
      else
      {
        objc_msgSend(v39, "setStroke:", v26);
      }
LABEL_15:
      if (v15)
      {
        if (v17)
          goto LABEL_20;
      }
      else
      {
        +[OADNullFill nullFill](OADNullFill, "nullFill");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v17)
          goto LABEL_20;
      }
      +[OADNullFill nullFill](OADNullFill, "nullFill");
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
      v28 = objc_msgSend(v39, "hasFill");
      v29 = v17;
      if ((v28 & 1) != 0)
      {
        objc_msgSend(v39, "fill");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[CHDAutomaticObject automaticFill](CHDAutomaticObject, "automaticFill");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30 != v31)
          goto LABEL_28;
        objc_msgSend(v39, "setFill:", 0);
        v29 = v15;
      }
      v32 = v29;
      if (v32)
      {
        v33 = v32;
        v34 = (void *)objc_msgSend(v32, "copy");

        if ((objc_msgSend(v39, "hasFill") & 1) != 0)
        {
          objc_msgSend(v39, "fill");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "isMemberOfClass:", objc_opt_class()))
            objc_msgSend(v35, "setParent:", v34);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v34, "setDefinedByStyle:", 1);
          objc_msgSend(v39, "setFill:", v34);
        }
LABEL_32:
        if ((objc_msgSend(v39, "hasEffects") & 1) != 0)
        {
          objc_msgSend(v39, "effects");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[CHDAutomaticObject automaticEffects](CHDAutomaticObject, "automaticEffects");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36 != v37)
          {
LABEL_36:
            objc_msgSend(v39, "setMergedWithParent:", v19);

            goto LABEL_37;
          }
          objc_msgSend(v39, "setEffects:", 0);
          v14 = v11;
        }
        +[CHDChart binaryEffects:](CHDChart, "binaryEffects:", v14);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setEffects:", v38);

        goto LABEL_36;
      }
LABEL_28:
      v34 = 0;
      goto LABEL_32;
    }
LABEL_13:
    v26 = 0;
    goto LABEL_15;
  }
LABEL_37:

}

- (void)resolvePlotAreaGraphicProperties:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling autoFill](self, "autoFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, v4, v5, 0, 0, 0, v6);

  }
}

- (void)resolveAxisGraphicProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v6, 0, v4, 0, 0, v4, v5);

  }
}

- (void)resolveMinorGridLinesGraphicProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v6, 0, v4, 0, 0, 0, v5);

  }
}

- (void)resolveMajorGridLinesGraphicProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v6, 0, v4, 0, 0, 0, v5);

  }
}

- (void)resolveWallGraphicProperties:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling autoFill](self, "autoFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, v4, v5, 0, v4, v5, v6);

  }
}

- (void)resolveFloorGraphicProperties:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling fillWithColorIndex:](self, "fillWithColorIndex:", 23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, v4, v5, 0, v4, v5, v6);

  }
}

- (id)autoSeriesFill:(unint64_t)a3
{
  uint64_t v3;

  v3 = 16;
  if (a3 > 7)
    v3 = 24;
  return -[CHBAutoStyling fillWithColorIndex:](self, "fillWithColorIndex:", (v3 + a3) % 0x38 + 8);
}

- (id)autoSeriesBorderStroke
{
  return -[CHBAutoStyling strokeWithColorIndex:](self, "strokeWithColorIndex:", 79);
}

- (id)autoStrokeForSeriesIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = ((a3 + 24) * (unsigned __int128)0x29E4129E4129E413uLL) >> 64;
  return -[CHBAutoStyling strokeWithColorIndex:](self, "strokeWithColorIndex:", (_DWORD)a3 + 24 - 55 * ((v3 + ((a3 + 24 - v3) >> 1)) >> 5) + 8);
}

- (void)resolveLegendGraphicProperties:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling autoFill](self, "autoFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoStroke](self, "autoStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, v4, v5, 0, v4, v5, v6);

  }
}

- (void)resolveGraphicPropertiesOfTrendline:(id)a3 forSeriesIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[CHBAutoStyling autoSeriesFill:](self, "autoSeriesFill:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHBAutoStyling autoSeriesBorderStroke](self, "autoSeriesBorderStroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v9, v6, v7, 0, v6, v7, v8);

  }
}

- (id)autoTextFill
{
  void *v2;
  void *v3;

  -[CHBAutoStyling autoStroke](self, "autoStroke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fill");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4
{
  -[CHBAutoStyling resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:](self, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", a3, a4, 0);
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4 isLine:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  v11 = a3;
  if (v11)
  {
    -[CHBAutoStyling autoSeriesFill:](self, "autoSeriesFill:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[CHBAutoStyling autoStrokeForSeriesIndex:](self, "autoStrokeForSeriesIndex:", a4);
    else
      -[CHBAutoStyling autoSeriesBorderStroke](self, "autoSeriesBorderStroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v11, v8, v9, 0, v8, v9, v10);

  }
}

- (void)resolveGraphicPropertiesOfErrorBar:(id)a3 forSeriesIndex:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CHBAutoStyling autoSeriesBorderStroke](self, "autoSeriesBorderStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = 0;
    -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v7, 0, v5, 0, 0, v5, v6);

  }
}

- (void)resolveMarker:(id)a3 withSeriesGraphicProperties:(id)a4 forSeriesIndex:(unint64_t)a5 clientGraphicPropertyDefaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    objc_msgSend(v10, "graphicProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (v13)
      {
        -[CHBAutoStyling autoStrokeForSeriesIndex:](self, "autoStrokeForSeriesIndex:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasFill"))
        {
          objc_msgSend(v11, "fill");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v15;
            objc_msgSend(v16, "technique");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v19 = (void *)objc_msgSend(v16, "copy");
              objc_msgSend(v10, "graphicProperties");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setFill:", v19);

            }
          }

        }
        if (!objc_msgSend(v10, "size"))
          objc_msgSend(v10, "setSize:", 5);
        if (objc_msgSend(v10, "style") == -1)
        {
          objc_msgSend(v10, "setStyle:", -[CHAutoStyling defaultMarkerStyleForSeriesIndex:](self, "defaultMarkerStyleForSeriesIndex:", a5));
          v21 = v14;
          objc_msgSend(v21, "fill");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
          v22 = 0;
        }
        if (!objc_msgSend(v10, "style"))
        {
          v26.receiver = self;
          v26.super_class = (Class)CHBAutoStyling;
          -[CHAutoStyling replaceStrokeAndFillInEmptyMarker:withSeriesGraphicProperties:](&v26, sel_replaceStrokeAndFillInEmptyMarker_withSeriesGraphicProperties_, v10, v11);
        }
        objc_msgSend(v10, "graphicProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fill");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v25) = 0;
        -[CHBAutoStyling resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:](self, "resolvedGraphicProperties:autoFill:autoStroke:autoShadow:nullFill:nullStroke:nullShadow:", v23, v24, v14, 0, v22, v21, v25);

      }
    }
  }

}

@end
