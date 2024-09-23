@implementation CarManeuverViewStyle

- (CarManeuverViewStyle)initWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5
{
  CarManeuverViewStyle *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarManeuverViewStyle;
  result = -[CarManeuverViewStyle init](&v9, "init");
  if (result)
  {
    result->_layoutType = a5;
    result->_destination = a4;
    result->_variant = a3;
    result->_blurMode = 0;
  }
  return result;
}

+ (CarManeuverViewStyle)styleWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5
{
  return (CarManeuverViewStyle *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithVariant:destination:layoutType:", a3, a4, a5);
}

- (BOOL)displaysShield
{
  return self->_variant == 0;
}

- (BOOL)_isDisplayedInWidget
{
  return self->_destination == 1;
}

- (UIFont)distanceFont
{
  double v3;
  double v4;
  const UIFontWeight *v5;
  unsigned int v7;
  unint64_t v8;

  if ((id)-[CarManeuverViewStyle layoutType](self, "layoutType") == (id)2)
  {
    if (-[CarManeuverViewStyle hasLaneGuidance](self, "hasLaneGuidance")
      || -[CarManeuverViewStyle hasShield](self, "hasShield"))
    {
      v3 = UIFontWeightBold;
      v4 = 13.0;
      return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v4, v3));
    }
    goto LABEL_10;
  }
  if ((id)-[CarManeuverViewStyle variant](self, "variant") == (id)1)
  {
    v5 = &UIFontWeightBold;
LABEL_11:
    v3 = *v5;
    v4 = 17.0;
    return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v4, v3));
  }
  if (-[CarManeuverViewStyle isSecondary](self, "isSecondary"))
  {
    v3 = UIFontWeightHeavy;
    v4 = 12.0;
    return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v4, v3));
  }
  if (-[CarManeuverViewStyle hasLaneGuidance](self, "hasLaneGuidance"))
  {
LABEL_10:
    v5 = &UIFontWeightHeavy;
    goto LABEL_11;
  }
  v7 = -[CarManeuverViewStyle hasShield](self, "hasShield");
  v8 = -[CarManeuverViewStyle layoutType](self, "layoutType");
  v3 = UIFontWeightHeavy;
  if (v7)
    v4 = 17.0;
  else
    v4 = 20.0;
  if (v8 == 1)
    v4 = 16.0;
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v4, v3));
}

- (UIColor)distanceColor
{
  return (UIColor *)sub_100C556C4(-[CarManeuverViewStyle _isDisplayedInWidget](self, "_isDisplayedInWidget"));
}

- (UIColor)instructionsColor
{
  unint64_t v3;
  char v4;
  id v5;

  v3 = -[CarManeuverViewStyle variant](self, "variant");
  v4 = -[CarManeuverViewStyle _isDisplayedInWidget](self, "_isDisplayedInWidget");
  if (v3 == 2)
    v5 = sub_100C556C4(v4);
  else
    v5 = sub_100C556F8(v4);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue(v5);
}

- (UIColor)arrowMainColor
{
  return (UIColor *)sub_100C556C4(-[CarManeuverViewStyle _isDisplayedInWidget](self, "_isDisplayedInWidget"));
}

- (UIColor)invalidArrowColor
{
  void *v2;

  if (-[CarManeuverViewStyle _isDisplayedInWidget](self, "_isDisplayedInWidget"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor carPlayDashboardJunctionColor](UIColor, "carPlayDashboardJunctionColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor carPlayJunctionColor](UIColor, "carPlayJunctionColor"));
  return (UIColor *)v2;
}

- (UIFont)instructionsPreferredFont
{
  unint64_t v3;
  double v4;
  unsigned int v5;

  v3 = -[CarManeuverViewStyle layoutType](self, "layoutType");
  v4 = 13.0;
  if (v3 != 2)
  {
    v5 = -[CarManeuverViewStyle isSecondary](self, "isSecondary", 13.0);
    v4 = 16.0;
    if (v5)
      v4 = 12.0;
  }
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v4, UIFontWeightMedium));
}

- (UIFont)instructionsAlternateFont
{
  unint64_t v3;
  double v4;
  unsigned int v5;

  v3 = -[CarManeuverViewStyle layoutType](self, "layoutType");
  v4 = 12.0;
  if (v3 != 2)
  {
    v5 = -[CarManeuverViewStyle isSecondary](self, "isSecondary", 12.0);
    v4 = 15.0;
    if (v5)
      v4 = 12.0;
  }
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v4, UIFontWeightMedium));
}

- (double)instructionsAlternateFontLineSpacing
{
  unsigned int v2;
  double result;

  v2 = -[CarManeuverViewStyle isSecondary](self, "isSecondary");
  result = 16.0;
  if (v2)
    return 12.0;
  return result;
}

- (int64_t)instructionsMaxNumberOfLinesWithPreferredFont
{
  if (-[CarManeuverViewStyle isSecondary](self, "isSecondary"))
    return 1;
  if ((id)-[CarManeuverViewStyle destination](self, "destination") != (id)2)
    return 2;
  if (-[CarManeuverViewStyle alignmentStyle](self, "alignmentStyle"))
    return 2;
  return 1;
}

- (int64_t)instructionsMaxNumberOfTotalLines
{
  BOOL v3;
  unint64_t v5;

  if (-[CarManeuverViewStyle isSecondary](self, "isSecondary"))
  {
    v3 = (id)-[CarManeuverViewStyle compressionStage](self, "compressionStage") == (id)1;
    goto LABEL_7;
  }
  if ((id)-[CarManeuverViewStyle layoutType](self, "layoutType") == (id)2)
    return 1;
  if ((id)-[CarManeuverViewStyle destination](self, "destination") == (id)2)
  {
    v3 = -[CarManeuverViewStyle alignmentStyle](self, "alignmentStyle") == 0;
LABEL_7:
    if (v3)
      return 1;
    else
      return 2;
  }
  v5 = -[CarManeuverViewStyle compressionStage](self, "compressionStage");
  if (v5 - 1 > 5)
    return 5;
  else
    return qword_100E3EA80[v5 - 1];
}

- (BOOL)shouldScaleInstructionsPreferredFont
{
  return (id)-[CarManeuverViewStyle instructionsMaxNumberOfTotalLines](self, "instructionsMaxNumberOfTotalLines") == (id)1
      && (id)-[CarManeuverViewStyle destination](self, "destination") != (id)2;
}

- (int64_t)labelLineBreakMode
{
  if (-[CarManeuverViewStyle isSecondary](self, "isSecondary"))
    return 0;
  else
    return 4;
}

- (BOOL)isSecondary
{
  return self->_variant == 2;
}

- (BOOL)canHaveLaneGuidance
{
  return self->_variant == 0;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  _BOOL8 v4;

  v4 = self->_variant == 2;
  -[CarManeuverViewStyle arrowReferenceSize](self, "arrowReferenceSize");
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", v4, 0);
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  _BOOL8 v4;

  v4 = self->_variant == 2;
  -[CarManeuverViewStyle arrowReferenceSize](self, "arrowReferenceSize");
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  return +[SignStyle junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:", v4, 0);
}

- (CGSize)arrowReferenceSize
{
  unint64_t variant;
  double v3;
  double v4;
  CGSize result;

  variant = self->_variant;
  v3 = 0.0;
  if (variant <= 2)
    v3 = dbl_100E3EAB0[variant];
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)desiredFraming
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend((id)objc_opt_class(self), "styleWithVariant:destination:layoutType:", -[CarManeuverViewStyle variant](self, "variant"), -[CarManeuverViewStyle destination](self, "destination"), -[CarManeuverViewStyle layoutType](self, "layoutType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setHasLaneGuidance:", -[CarManeuverViewStyle hasLaneGuidance](self, "hasLaneGuidance"));
  objc_msgSend(v5, "setHasShield:", -[CarManeuverViewStyle hasShield](self, "hasShield"));
  objc_msgSend(v5, "setSecondarySignVisible:", -[CarManeuverViewStyle secondarySignVisible](self, "secondarySignVisible"));
  objc_msgSend(v5, "setCompressionStage:", -[CarManeuverViewStyle compressionStage](self, "compressionStage"));
  return v5;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(unint64_t)a3
{
  self->_layoutType = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (int64_t)alignmentStyle
{
  return self->_alignmentStyle;
}

- (void)setAlignmentStyle:(int64_t)a3
{
  self->_alignmentStyle = a3;
}

- (BOOL)hasLaneGuidance
{
  return self->_hasLaneGuidance;
}

- (void)setHasLaneGuidance:(BOOL)a3
{
  self->_hasLaneGuidance = a3;
}

- (BOOL)hasShield
{
  return self->_hasShield;
}

- (void)setHasShield:(BOOL)a3
{
  self->_hasShield = a3;
}

- (BOOL)secondarySignVisible
{
  return self->_secondarySignVisible;
}

- (void)setSecondarySignVisible:(BOOL)a3
{
  self->_secondarySignVisible = a3;
}

- (int)blurMode
{
  return self->_blurMode;
}

- (void)setBlurMode:(int)a3
{
  self->_blurMode = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (void)setCompressionStage:(unint64_t)a3
{
  self->_compressionStage = a3;
}

@end
