@implementation NavManeverSignLayoutBase

- (BOOL)_shouldShowExitShieldForSign:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "maneuverSign"));
  if (objc_msgSend(v4, "hasShieldInfo")
    && (objc_msgSend(v4, "suppressShieldView") & 1) == 0)
  {
    v5 = !-[NavManeverSignLayoutBase forceHideShieldViewForSign:](self, "forceHideShieldViewForSign:", v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_shouldShowManeuverViewForSign:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "maneuverSign"));
  if (objc_msgSend(v4, "hasManeuverArtwork"))
    v5 = !-[NavManeverSignLayoutBase forceHideManeuverViewForSign:](self, "forceHideManeuverViewForSign:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (double)navSignView:(id)a3 textTrailingMarginForMajorText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  if (!v4
    || (v7 = 5.0, !-[NavManeverSignLayoutBase _shouldShowExitShieldForSign:](self, "_shouldShowExitShieldForSign:", v6)))
  {
    v10.receiver = self;
    v10.super_class = (Class)NavManeverSignLayoutBase;
    -[NavSignLayoutBase navSignView:textTrailingMarginForMajorText:](&v10, "navSignView:textTrailingMarginForMajorText:", v6, v4);
    v7 = v8;
  }

  return v7;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  return !-[NavManeverSignLayoutBase _shouldShowManeuverViewForSign:](self, "_shouldShowManeuverViewForSign:", a3, a4);
}

- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4
{
  objc_super v5;

  if (a4)
    return !-[NavManeverSignLayoutBase _shouldShowExitShieldForSign:](self, "_shouldShowExitShieldForSign:", a3);
  v5.receiver = self;
  v5.super_class = (Class)NavManeverSignLayoutBase;
  return -[NavSignLayoutBase navSignView:shouldAlignToTrailingForMajorText:](&v5, "navSignView:shouldAlignToTrailingForMajorText:", a3);
}

- (double)textTopMarginForSign:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  unsigned int v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverSign"));
  v6 = (char *)objc_msgSend(v5, "maneuverSignType");

  if ((unint64_t)(v6 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)NavManeverSignLayoutBase;
    -[NavSignLayoutBase textTopMarginForSign:](&v11, "textTopMarginForSign:", v4);
    v8 = v9;

  }
  else
  {
    v7 = objc_msgSend(v4, "hasOnlySingleLineText");

    if (v7)
      return 50.0;
    else
      return 41.0;
  }
  return v8;
}

- (double)textBottomMarginForSign:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  unsigned int v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverSign"));
  v6 = (char *)objc_msgSend(v5, "maneuverSignType");

  if ((unint64_t)(v6 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)NavManeverSignLayoutBase;
    -[NavSignLayoutBase textBottomMarginForSign:](&v11, "textBottomMarginForSign:", v4);
    v8 = v9;

  }
  else
  {
    v7 = objc_msgSend(v4, "hasOnlySingleLineText");

    if (v7)
      return 30.0;
    else
      return 23.0;
  }
  return v8;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverSign"));
  v6 = (char *)objc_msgSend(v5, "maneuverSignType");

  if ((unint64_t)(v6 - 1) >= 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)NavManeverSignLayoutBase;
    -[NavSignLayoutBase baselineMarginBetweenLabelsForSign:](&v10, "baselineMarginBetweenLabelsForSign:", v4);
    v7 = v8;
  }
  else
  {
    v7 = 32.0;
  }

  return v7;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char *v8;
  const UIFontWeight *v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverSign"));
  v8 = (char *)objc_msgSend(v7, "maneuverSignType");

  if ((unint64_t)(v8 - 1) > 1)
  {
    v14.receiver = self;
    v14.super_class = (Class)NavManeverSignLayoutBase;
    v11 = -[NavSignLayoutBase navSignView:preferredFontForMajorText:](&v14, "navSignView:preferredFontForMajorText:", v6, v4);
    v10 = objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v9 = &UIFontWeightMedium;
    if (v4)
      v9 = &UIFontWeightHeavy;
    v10 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 27.0, *v9));
  }
  v12 = (void *)v10;

  return v12;
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverSign"));
  v8 = (char *)objc_msgSend(v7, "maneuverSignType");

  if ((unint64_t)(v8 - 1) > 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)NavManeverSignLayoutBase;
    v11 = -[NavSignLayoutBase navSignView:alternateFontForMajorText:](&v15, "navSignView:alternateFontForMajorText:", v6, v4);
    v12 = objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    if (v4)
    {
      v9 = UIFontWeightHeavy;
      v10 = 27.0;
    }
    else
    {
      v9 = UIFontWeightMedium;
      v10 = 24.0;
    }
    v12 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v10, v9));
  }
  v13 = (void *)v12;

  return v13;
}

- (BOOL)forceHideManeuverViewForSign:(id)a3
{
  return 0;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 0;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewArrowMetricsForSign:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 58.0, 58.0);
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewJunctionArrowMetricsForSign:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return +[SignStyle junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 58.0, 58.0);
}

- (CGSize)maneuverViewSizeForSign:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 48.0;
  v4 = 58.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  return 22.5;
}

- (int64_t)maneuverViewPositionForSign:(id)a3
{
  void *v3;
  _BOOL4 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "minorLabel"));
  v4 = (unint64_t)objc_msgSend(v3, "lineCount") > 2;

  return 2 * v4;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  return 22.5;
}

@end
