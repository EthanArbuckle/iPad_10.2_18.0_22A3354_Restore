@implementation CHXAutoStyling

- (void)resolveChartAreaGraphicProperties:(id)a3
{
  OADShapeStyle *v4;
  int v5;
  BOOL v6;
  void *v8;
  BOOL v9;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a3;
  v4 = objc_alloc_init(OADShapeStyle);
  v5 = -[CHXAutoStyling styleId](self, "styleId");
  v6 = -[CHXAutoStyling _autoChartFillIsHollow](self, "_autoChartFillIsHollow");
  if (v5 >= 33 || !v6)
  {
    -[CHXAutoStyling autoChartAreaFillColor](self, "autoChartAreaFillColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setFillMatrixIndex:color:](v4, "setFillMatrixIndex:color:", 1, v8);

  }
  v9 = -[CHXAutoStyling _autoChartFillIsHollow](self, "_autoChartFillIsHollow");
  if ((v5 - 41) >= 0xFFFFFFF8 || !v9)
  {
    v11 = -[CHXAutoStyling autoFloorAndChartAreaStrokeIndex](self, "autoFloorAndChartAreaStrokeIndex");
    -[CHXAutoStyling autoChartAreaAndDataTableAndFloorStrokeColor](self, "autoChartAreaAndDataTableAndFloorStrokeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setLineMatrixIndex:color:](v4, "setLineMatrixIndex:color:", v11, v12);

  }
  -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1.0;
  -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v4, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v15, v13, 1, v14);

}

- (int)styleRow
{
  return +[CHXAutoStyling styleRowWithStyleId:](CHXAutoStyling, "styleRowWithStyleId:", -[CHXAutoStyling styleId](self, "styleId"));
}

+ (int)styleRowWithStyleId:(int)a3
{
  int v3;

  v3 = a3 - 1;
  if (a3 < 1)
    v3 = a3 + 6;
  return (v3 >> 3) + 1;
}

+ (id)colorWithSchemeColorId:(int)a3 tint:(float)a4
{
  return (id)objc_msgSend(a1, "colorWithSchemeColorId:transformType:transformValue:", *(_QWORD *)&a3, 4);
}

+ (id)colorWithSchemeColorId:(int)a3 transformType:(int)a4 transformValue:(float)a5
{
  uint64_t v6;
  void *v7;
  double v8;

  v6 = *(_QWORD *)&a4;
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a5;
  objc_msgSend(v7, "addTransformOfType:value:", v6, v8);
  return v7;
}

- (void)resolveFloorGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    if (-[CHXAutoStyling styleId](self, "styleId") >= 33)
    {
      v6 = -[CHXAutoStyling autoFloorAndWallsFillIndex](self, "autoFloorAndWallsFillIndex");
      -[CHXAutoStyling autoFloorAndWallsAndPlotArea2DFillColor](self, "autoFloorAndWallsAndPlotArea2DFillColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADShapeStyle setFillMatrixIndex:color:](v5, "setFillMatrixIndex:color:", v6, v7);

    }
    v8 = -[CHXAutoStyling autoFloorAndChartAreaStrokeIndex](self, "autoFloorAndChartAreaStrokeIndex");
    -[CHXAutoStyling autoChartAreaAndDataTableAndFloorStrokeColor](self, "autoChartAreaAndDataTableAndFloorStrokeColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setLineMatrixIndex:color:](v5, "setLineMatrixIndex:color:", v8, v9);

    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v12, v10, 1, v11);

    v4 = v12;
  }

}

- (void)resolveWallGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    if (-[CHXAutoStyling styleId](self, "styleId") >= 33)
    {
      v6 = -[CHXAutoStyling autoFloorAndWallsFillIndex](self, "autoFloorAndWallsFillIndex");
      -[CHXAutoStyling autoFloorAndWallsAndPlotArea2DFillColor](self, "autoFloorAndWallsAndPlotArea2DFillColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADShapeStyle setFillMatrixIndex:color:](v5, "setFillMatrixIndex:color:", v6, v7);

    }
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v10, v8, 1, v9);

    v4 = v10;
  }

}

- (void)resolvePlotAreaGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  BOOL v6;
  int v7;
  int v8;
  BOOL v9;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    v6 = -[CHDChart is3D](self->super.mChart, "is3D");
    v7 = -[CHXAutoStyling styleId](self, "styleId");
    if (!v6)
    {
      v8 = v7;
      v9 = -[CHXAutoStyling _autoChartFillIsHollow](self, "_autoChartFillIsHollow");
      if (v8 >= 33 || !v9)
      {
        -[CHXAutoStyling autoFloorAndWallsAndPlotArea2DFillColor](self, "autoFloorAndWallsAndPlotArea2DFillColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADShapeStyle setFillMatrixIndex:color:](v5, "setFillMatrixIndex:color:", 1, v11);

      }
    }
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v14, v12, 1, v13);

    v4 = v14;
  }

}

- (void)resolveMinorGridLinesGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    -[CHXAutoStyling autoMinorGridColor](self, "autoMinorGridColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setLineMatrixIndex:color:](v5, "setLineMatrixIndex:color:", 1, v6);

    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v9, v7, 1, v8);

    v4 = v9;
  }

}

- (id)autoMinorGridColor
{
  int v2;
  void *v3;
  double v4;
  uint64_t v5;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  v3 = (void *)objc_opt_class();
  if (v2 > 32)
  {
    LODWORD(v4) = *(_DWORD *)"fff?";
    v5 = 12;
  }
  else
  {
    LODWORD(v4) = 0.5;
    v5 = 1;
  }
  objc_msgSend(v3, "colorWithSchemeColorId:tint:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)resolveMajorGridLinesGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    -[CHXAutoStyling autoAxisAndMajorGridColor](self, "autoAxisAndMajorGridColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setLineMatrixIndex:color:](v5, "setLineMatrixIndex:color:", 1, v6);

    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v9, v7, 1, v8);

    v4 = v9;
  }

}

- (void)resolveAxisGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    -[CHXAutoStyling autoAxisAndMajorGridColor](self, "autoAxisAndMajorGridColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle setLineMatrixIndex:color:](v5, "setLineMatrixIndex:color:", 1, v6);

    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v9, v7, 1, v8);

    v4 = v9;
  }

}

- (int)styleColumn
{
  return +[CHXAutoStyling styleColumnWithStyleId:](CHXAutoStyling, "styleColumnWithStyleId:", -[CHXAutoStyling styleId](self, "styleId"));
}

+ (int)styleColumnWithStyleId:(int)a3
{
  int v3;

  v3 = (a3 - 1) & 7;
  if (1 - a3 >= 0)
    v3 = -((1 - a3) & 7);
  return v3 + 1;
}

- (void)resolveLegendGraphicProperties:(id)a3
{
  id v4;
  OADShapeStyle *v5;
  void *v6;
  double v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = objc_alloc_init(OADShapeStyle);
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v5, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v8, v6, 1, v7);

    v4 = v8;
  }

}

- (id)autoColorOfFirstColumnSeriesWithIndex:(unint64_t)a3 seriesCount:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v20;
  float v21;

  v5 = a4 % 0x1D;
  if (a4 % 0x1D)
  {
    a3 %= v5;
    if (v5 > 5)
    {
      if (v5 <= 0xB)
      {
        if (a3 < 6)
        {
          v8 = 226;
LABEL_24:
          LOBYTE(v4) = -[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3];
          v21 = (double)v8 / 255.0 * (double)v4;
          v7 = llroundf(v21);
          goto LABEL_5;
        }
        goto LABEL_26;
      }
      if (v5 <= 0x11)
      {
        if (a3 < 6)
        {
          v8 = 211;
          goto LABEL_24;
        }
        if (a3 > 0xB)
        {
LABEL_26:
          v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 + 6];
          goto LABEL_4;
        }
LABEL_16:
        v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 - 6];
        goto LABEL_4;
      }
      if (v5 > 0x17)
      {
        v20 = a3 - 6;
        if (a3 < 6)
        {
          v8 = 192;
          goto LABEL_24;
        }
        if (a3 > 0xB)
        {
          if (a3 <= 0x11)
          {
            v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 - 12];
            goto LABEL_4;
          }
          if (a3 > 0x17)
            goto LABEL_26;
          goto LABEL_16;
        }
        v8 = 226;
      }
      else
      {
        v20 = a3 - 6;
        if (a3 < 6)
        {
          v8 = 200;
          goto LABEL_24;
        }
        if (a3 > 0xB)
        {
          if (a3 > 0x11)
            goto LABEL_26;
          goto LABEL_16;
        }
        v8 = 239;
      }
      a3 = v20;
      goto LABEL_24;
    }
  }
  v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3];
LABEL_4:
  v7 = *v6;
  v8 = 255;
LABEL_5:
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.5;
  objc_msgSend(v9, "addTransformOfType:value:", 29, v10);
  v11 = (double)(v8 - v7) / 255.0;
  v12 = v11;
  *(float *)&v11 = v12;
  objc_msgSend(v9, "addTransformOfType:value:", 20, v11);
  v13 = (double)v7 / 255.0;
  v14 = v13;
  *(float *)&v13 = v14;
  objc_msgSend(v9, "addTransformOfType:value:", 19, v13);
  *(float *)&v15 = v12;
  objc_msgSend(v9, "addTransformOfType:value:", 23, v15);
  *(float *)&v16 = v14;
  objc_msgSend(v9, "addTransformOfType:value:", 22, v16);
  *(float *)&v17 = v12;
  objc_msgSend(v9, "addTransformOfType:value:", 26, v17);
  *(float *)&v18 = v14;
  objc_msgSend(v9, "addTransformOfType:value:", 25, v18);
  return v9;
}

- (void)resolveGraphicPropertiesOfTrendline:(id)a3 forSeriesIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  OADShapeStyle *v7;
  void *v8;
  double v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    v10 = v5;
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(OADShapeStyle);
    -[OADShapeStyle setLineMatrixIndex:color:](v7, "setLineMatrixIndex:color:", 1, v6);
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v7, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v10, v8, 1, v9);

    v5 = v10;
  }

}

+ (id)colorWithSchemeColorId:(int)a3 shade:(float)a4
{
  return (id)objc_msgSend(a1, "colorWithSchemeColorId:transformType:transformValue:", *(_QWORD *)&a3, 5);
}

+ (int)styleIdWithStyleRow:(int)a3 styleColumn:(int)a4
{
  return a4 + 8 * a3 - 8;
}

- (int)styleId
{
  return -[CHDChart styleId](self->super.mChart, "styleId");
}

- (id)autoAxisAndMajorGridColor
{
  int v2;
  void *v3;
  double v4;
  uint64_t v5;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  v3 = (void *)objc_opt_class();
  if (v2 < 33)
    v5 = 1;
  else
    v5 = 12;
  LODWORD(v4) = 0.75;
  objc_msgSend(v3, "colorWithSchemeColorId:tint:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)autoChartAreaAndDataTableAndFloorStrokeColor
{
  int v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  if (v2 > 32)
  {
    if (v2 > 0x28)
    {
      +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v3 = (void *)objc_opt_class();
    LODWORD(v4) = 0.75;
    v5 = 12;
  }
  else
  {
    v3 = (void *)objc_opt_class();
    LODWORD(v4) = 0.75;
    v5 = 1;
  }
  objc_msgSend(v3, "colorWithSchemeColorId:tint:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)autoOtherStrokeColor
{
  int v2;
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  if (v2 <= 32)
  {
    v3 = 1;
LABEL_8:
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (v2 <= 0x22)
  {
    v3 = 12;
    goto LABEL_8;
  }
  if (v2 > 0x28)
  {
    v3 = 13;
    goto LABEL_8;
  }
  v4 = (void *)objc_opt_class();
  LODWORD(v5) = 0.25;
  objc_msgSend(v4, "colorWithSchemeColorId:shade:", 12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)autoChartAreaFillColor
{
  int v2;
  uint64_t v3;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  if (v2 > 32)
  {
    if (v2 > 0x28)
      v3 = 12;
    else
      v3 = 13;
  }
  else
  {
    v3 = 0;
  }
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)autoFloorAndWallsAndPlotArea2DFillColor
{
  int v2;
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  uint64_t v7;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  if (v2 > 32)
  {
    v4 = v2;
    if (v2 > 0x22)
    {
      v5 = (void *)objc_opt_class();
      if (v4 <= 0x28)
      {
        v7 = v4 - 31;
        LODWORD(v6) = 1045220557;
LABEL_9:
        objc_msgSend(v5, "colorWithSchemeColorId:tint:", v7, v6);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return v3;
      }
      LODWORD(v6) = 1064514355;
    }
    else
    {
      v5 = (void *)objc_opt_class();
      LODWORD(v6) = 1045220557;
    }
    v7 = 12;
    goto LABEL_9;
  }
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (unsigned)autoFloorAndWallsFillIndex
{
  return -[CHXAutoStyling styleId](self, "styleId") > 32;
}

- (unsigned)autoFloorAndChartAreaStrokeIndex
{
  return -[CHXAutoStyling styleId](self, "styleId") < 41;
}

- (void)setDefaultErrorBarPropertiesInGraphicProperties:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  v3 = objc_msgSend(v11, "isMergedWithParent");
  objc_msgSend(v11, "setMergedWithParent:", 0);
  if ((objc_msgSend(v11, "hasStroke") & 1) == 0)
  {
    +[OADStroke blackStroke](OADStroke, "blackStroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStroke:", v4);

    objc_msgSend(v11, "stroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 0.75;
    objc_msgSend(v5, "setWidth:", v6);

  }
  objc_msgSend(v11, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMergedWithParent");
  objc_msgSend(v7, "setMergedWithParent:", 0);
  if ((objc_msgSend(v7, "isFillOverridden") & 1) == 0)
  {
    +[OADSolidFill blackFill](OADSolidFill, "blackFill");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFill:", v9);

  }
  if ((objc_msgSend(v7, "isWidthOverridden") & 1) == 0)
  {
    LODWORD(v10) = 0.75;
    objc_msgSend(v7, "setWidth:", v10);
  }
  objc_msgSend(v11, "setMergedWithParent:", v3);
  objc_msgSend(v7, "setMergedWithParent:", v8);

}

- (id)autoColorOfSeriesWithIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  int v15;
  float v17;
  float v18;
  float v19;
  void *v20;
  double v21;
  float v22;
  float v23;
  void *v24;
  double v25;

  if (-[CHDChart isPie](self->super.mChart, "isPie")
    && !-[CHDChart isDirectionChanged](self->super.mChart, "isDirectionChanged"))
  {
    v5 = -[CHDChart categoryCount](self->super.mChart, "categoryCount");
  }
  else
  {
    v5 = -[CHDChart seriesCount](self->super.mChart, "seriesCount");
  }
  v6 = v5;
  v7 = -[CHXAutoStyling styleColumn](self, "styleColumn");
  if (v7 == 1)
  {
    -[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:](self, "autoColorOfFirstColumnSeriesWithIndex:seriesCount:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v7 == 2)
  {
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", (a3 % 6) + 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7 > 2)
      v9 = (v7 + 1);
    else
      v9 = 1;
    -[OADDrawingTheme colorMap](self->super.mDrawingTheme, "colorMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[OADDrawingTheme colorScheme](self->super.mDrawingTheme, "colorScheme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADDrawingTheme colorMap](self->super.mDrawingTheme, "colorMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADDrawingTheme colorScheme](self->super.mDrawingTheme, "colorScheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[OADColor rgbColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "rgbColorWithColor:colorMap:colorScheme:colorPalette:", v10, v11, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v10) = objc_msgSend(v13, "isBlack");
        LODWORD(v11) = objc_msgSend(v13, "isWhite");

      }
      else
      {
        LODWORD(v10) = 0;
      }
    }
    else
    {
      LODWORD(v11) = 0;
    }
    v14 = (double)v6;
    if (a3 >= v6 >> 1)
      v15 = 1;
    else
      v15 = (int)v10;
    if (v15 == 1 && (_DWORD)v11 == 0)
    {
      v22 = (pow(v14, -0.8) * -144.0 + 220.0) / 255.0;
      if ((_DWORD)v10)
        v22 = 0.25;
      v23 = 1.0
          - pow(1.0- (float)(1.0- (float)(fabsf((float)((float)a3 - (float)((float)(v6 - 1) * 0.5)) / (float)((float)v6 * 0.5)) * v22)), 2.2);
      v24 = (void *)objc_opt_class();
      *(float *)&v25 = v23;
      objc_msgSend(v24, "colorWithSchemeColorId:tint:", v9, v25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = (pow(v14, -0.62) * 128.0 + 144.0) / -255.0;
      v18 = v17 + 1.0;
      if ((_DWORD)v11)
        v18 = 0.25;
      v19 = pow((float)(1.0- (float)(fabsf((float)((float)((float)v6 * 0.5) - (float)a3) / (float)((float)v6 * 0.5)) * v18)), 2.2);
      v20 = (void *)objc_opt_class();
      *(float *)&v21 = v19;
      objc_msgSend(v20, "colorWithSchemeColorId:shade:", v9, v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (id)autoTextFill
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  OADSolidFill *v6;

  v2 = -[CHXAutoStyling styleId](self, "styleId");
  if (v2 < 41)
    v3 = 12;
  else
    v3 = 13;
  if (v2 < 33)
    v4 = 1;
  else
    v4 = v3;
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(OADSolidFill);
  -[OADSolidFill setColor:](v6, "setColor:", v5);

  return v6;
}

- (id)autoStrokeForSeriesIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CHXAutoStyling autoColorOfSeriesWithIndex:](self, "autoColorOfSeriesWithIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokeAtIndex:color:", 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4
{
  -[CHXAutoStyling resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:](self, "resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:", a3, a4, 0);
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4 isLine:(BOOL)a5
{
  _BOOL4 v5;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  float v12;
  __int128 v13;
  int v14;
  char *v15;
  OADShapeStyle *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  __int128 v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v8 = -[CHXAutoStyling styleColumn](self, "styleColumn");
  v9 = -[CHXAutoStyling styleRow](self, "styleRow");
  if (v25 && v9 <= 6)
  {
    if (v5)
    {
      v11 = 0;
      v12 = (float)-[CHXAutoStyling resolveGraphicPropertiesOfErrorBar:forSeriesIndex:]::strokeWidthMultiplierArray[v9 - 1];
      *(_QWORD *)&v10 = 0x100000000;
      v24 = v10;
    }
    else
    {
      if (-[CHDChart is3D](self->super.mChart, "is3D"))
      {
        v26 = xmmword_22A4C19A0;
        v27 = 1;
        if (v8 == 2)
          v14 = 3;
        else
          v14 = 1;
        v28 = v14;
        *((_QWORD *)&v13 + 1) = 0;
        v29 = 0;
        v30 = v14;
        v31 = xmmword_22A4BFBA0;
        v32 = 0;
        v33 = v14;
        v34 = 0;
        v15 = (char *)&v26 + 12 * v9;
      }
      else
      {
        v15 = (char *)&-[CHXAutoStyling resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:]::styleIndices + 12 * v9;
      }
      *(_QWORD *)&v13 = *(_QWORD *)(v15 - 12);
      v24 = v13;
      v11 = *((unsigned int *)v15 - 1);
      v12 = 1.0;
    }
    v16 = objc_alloc_init(OADShapeStyle);
    -[CHXAutoStyling autoColorOfSeriesWithIndex:](self, "autoColorOfSeriesWithIndex:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    v20 = v18;
    if (!v5)
    {
      if (v9 == 5)
      {
        LODWORD(v19) = 1060655596;
        objc_msgSend(v18, "addTransformOfType:value:", 5, v19);
      }
      else if (v9 == 2)
      {
        +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 0);
        v21 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v21;
      }
    }
    if ((_DWORD)v24)
      -[OADShapeStyle setFillMatrixIndex:color:](v16, "setFillMatrixIndex:color:");
    if (DWORD1(v24))
      -[OADShapeStyle setLineMatrixIndex:color:](v16, "setLineMatrixIndex:color:");
    if ((_DWORD)v11)
      -[OADShapeStyle setEffectMatrixIndex:color:](v16, "setEffectMatrixIndex:color:", v11, v17);
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = v12;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v16, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v25, v22, 1, v23);

  }
}

- (void)resolveGraphicPropertiesOfErrorBar:(id)a3 forSeriesIndex:(unint64_t)a4
{
  int v6;
  int v7;
  void *v8;
  OADShapeStyle *v9;
  void *v10;
  double v11;
  id v12;

  v12 = a3;
  v6 = -[CHXAutoStyling styleRow](self, "styleRow");
  if (v12)
  {
    v7 = -[CHXAutoStyling resolveGraphicPropertiesOfErrorBar:forSeriesIndex:]::strokeWidthMultiplierArray[v6 - 1];
    -[CHXAutoStyling autoColorOfSeriesWithIndex:](self, "autoColorOfSeriesWithIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(OADShapeStyle);
    -[OADShapeStyle setLineMatrixIndex:color:](v9, "setLineMatrixIndex:color:", 1, v8);
    -[CHXAutoStyling setDefaultErrorBarPropertiesInGraphicProperties:](self, "setDefaultErrorBarPropertiesInGraphicProperties:", v12);
    -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = (float)v7;
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v9, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v12, v10, 1, v11);

  }
}

- (void)resolveMarker:(id)a3 withSeriesGraphicProperties:(id)a4 forSeriesIndex:(unint64_t)a5 clientGraphicPropertyDefaults:(id)a6
{
  id v10;
  void (**v11)(id, id, void *);
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  OADShapeStyle *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  id v32;

  v32 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, void *))a6;
  if (v32)
  {
    objc_msgSend(v32, "graphicProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v12)
      {
        v13 = -[CHXAutoStyling styleRow](self, "styleRow");
        if (v13 <= 6)
        {
          if (objc_msgSend(v10, "hasFill"))
          {
            objc_msgSend(v10, "fill");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              objc_msgSend(v15, "technique");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                v18 = (void *)objc_msgSend(v15, "copy");
                objc_msgSend(v32, "graphicProperties");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setFill:", v18);

              }
            }

          }
          if (!objc_msgSend(v32, "size"))
          {
            objc_msgSend(v32, "setSize:", 7);
            if (v11)
            {
              v20 = objc_opt_class();
              v11[2](v11, v10, &unk_24F46A2E8);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              TSUDynamicCast(v20, (uint64_t)v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
                objc_msgSend(v32, "setSize:", objc_msgSend(v22, "unsignedIntValue"));

            }
          }
          if (objc_msgSend(v32, "style") == -1)
            objc_msgSend(v32, "setStyle:", -[CHAutoStyling defaultMarkerStyleForSeriesIndex:](self, "defaultMarkerStyleForSeriesIndex:", a5));
          if (!objc_msgSend(v32, "style"))
            -[CHAutoStyling replaceStrokeAndFillInEmptyMarker:withSeriesGraphicProperties:](self, "replaceStrokeAndFillInEmptyMarker:withSeriesGraphicProperties:", v32, v10);
          v23 = objc_alloc_init(OADShapeStyle);
          v24 = v13 - 1;
          v25 = (unsigned int *)((char *)&-[CHXAutoStyling resolveMarker:withSeriesGraphicProperties:forSeriesIndex:clientGraphicPropertyDefaults:]::styleIndices
                               + 12 * v24);
          v26 = *v25;
          v27 = v25[2];
          -[CHXAutoStyling autoColorOfSeriesWithIndex:](self, "autoColorOfSeriesWithIndex:", a5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v26)
            -[OADShapeStyle setFillMatrixIndex:color:](v23, "setFillMatrixIndex:color:", v26, v28);
          -[OADShapeStyle setLineMatrixIndex:color:](v23, "setLineMatrixIndex:color:", 1, v28);
          if ((v24 & 0xFFFFFFFB) != 0)
            -[OADShapeStyle setEffectMatrixIndex:color:](v23, "setEffectMatrixIndex:color:", v27, v28);
          objc_msgSend(v32, "graphicProperties");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[OADDrawingTheme styleMatrix](self->super.mDrawingTheme, "styleMatrix");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v31) = 1.0;
          -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](v23, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", v29, v30, 1, v31);

        }
      }
    }
  }

}

- (BOOL)_autoChartFillIsHollow
{
  return self->__autoChartFillIsHollow;
}

- (void)set_autoChartFillIsHollow:(BOOL)a3
{
  self->__autoChartFillIsHollow = a3;
}

- (BOOL)_autoChartStrokeIsHollow
{
  return self->__autoChartStrokeIsHollow;
}

- (void)set_autoChartStrokeIsHollow:(BOOL)a3
{
  self->__autoChartStrokeIsHollow = a3;
}

@end
