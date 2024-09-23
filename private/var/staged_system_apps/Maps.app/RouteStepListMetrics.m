@implementation RouteStepListMetrics

+ (id)routePlanningMetrics
{
  if (qword_1014D4038 != -1)
    dispatch_once(&qword_1014D4038, &stru_1011E3148);
  return (id)qword_1014D4030;
}

+ (id)navigationMetrics
{
  if (qword_1014D4048 != -1)
    dispatch_once(&qword_1014D4048, &stru_1011E3168);
  return (id)qword_1014D4040;
}

+ (id)navSignMetrics
{
  if (qword_1014D4058 != -1)
    dispatch_once(&qword_1014D4058, &stru_1011E3188);
  return (id)qword_1014D4050;
}

+ (id)rapMetrics
{
  if (qword_1014D4068 != -1)
    dispatch_once(&qword_1014D4068, &stru_1011E31A8);
  return (id)qword_1014D4060;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_primaryTextTopMargin;
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_primaryTextTrailingMargin;
  objc_storeStrong((id *)v4 + 4, self->_primaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 5, self->_primaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 6, self->_primaryTextFontStyle);
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_primaryTextFontWeight;
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_secondaryTextTopMargin;
  objc_storeStrong((id *)v4 + 10, self->_secondaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 11, self->_secondaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 12, self->_secondaryTextFontStyle);
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_secondaryTextFontWeight;
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_tertiaryTextTopMargin;
  objc_storeStrong((id *)v4 + 16, self->_tertiaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 17, self->_tertiaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 18, self->_tertiaryTextFontStyle);
  *((_QWORD *)v4 + 20) = *(_QWORD *)&self->_tertiaryTextFontWeight;
  objc_storeStrong((id *)v4 + 24, self->_highlightColor);
  *((_QWORD *)v4 + 25) = *(_QWORD *)&self->_textTrailingMargin;
  *((_QWORD *)v4 + 26) = *(_QWORD *)&self->_textBottomMargin;
  *((_QWORD *)v4 + 27) = *(_QWORD *)&self->_imageAreaWidth;
  *((_QWORD *)v4 + 28) = *(_QWORD *)&self->_imageTopMargin;
  *((_QWORD *)v4 + 29) = *(_QWORD *)&self->_imageBottomMargin;
  *((_QWORD *)v4 + 30) = *(_QWORD *)&self->_waypointImageWidth;
  *((_QWORD *)v4 + 31) = *(_QWORD *)&self->_waypointImageHeight;
  *((_QWORD *)v4 + 32) = *(_QWORD *)&self->_stepImageWidth;
  *((_QWORD *)v4 + 33) = *(_QWORD *)&self->_stepImageHeight;
  *((_QWORD *)v4 + 34) = self->_shieldArtworkSize;
  *((_QWORD *)v4 + 35) = self->_iconSize;
  memcpy(v4 + 328, &self->_arrowMetrics, 0x1F0uLL);
  memcpy(v4 + 824, &self->_junctionArrowMetrics, 0x1F0uLL);
  memcpy(v4 + 1320, &self->_secondaryArrowMetrics, 0x1F0uLL);
  memcpy(v4 + 1816, &self->_secondaryJunctionArrowMetrics, 0x1F0uLL);
  v4[11] = self->_useMarkerFallback;
  objc_storeStrong((id *)v4 + 40, self->_hairlineColor);
  v4[12] = self->_shouldFlipPrimaryAndSecondaryText;
  return v4;
}

- (double)primaryTextTopMargin
{
  return self->_primaryTextTopMargin;
}

- (double)primaryTextTrailingMargin
{
  return self->_primaryTextTrailingMargin;
}

- (UIColor)primaryTextActiveTextColor
{
  return self->_primaryTextActiveTextColor;
}

- (UIColor)primaryTextDisabledTextColor
{
  return self->_primaryTextDisabledTextColor;
}

- (BOOL)primaryTextFontIsFixedSize
{
  return self->_primaryTextFontIsFixedSize;
}

- (NSString)primaryTextFontStyle
{
  return self->_primaryTextFontStyle;
}

- (double)primaryTextFontSize
{
  return self->_primaryTextFontSize;
}

- (double)primaryTextFontWeight
{
  return self->_primaryTextFontWeight;
}

- (double)secondaryTextTopMargin
{
  return self->_secondaryTextTopMargin;
}

- (UIColor)secondaryTextActiveTextColor
{
  return self->_secondaryTextActiveTextColor;
}

- (UIColor)secondaryTextDisabledTextColor
{
  return self->_secondaryTextDisabledTextColor;
}

- (BOOL)secondaryTextFontIsFixedSize
{
  return self->_secondaryTextFontIsFixedSize;
}

- (NSString)secondaryTextFontStyle
{
  return self->_secondaryTextFontStyle;
}

- (double)secondaryTextFontSize
{
  return self->_secondaryTextFontSize;
}

- (double)secondaryTextFontWeight
{
  return self->_secondaryTextFontWeight;
}

- (double)tertiaryTextTopMargin
{
  return self->_tertiaryTextTopMargin;
}

- (UIColor)tertiaryTextActiveTextColor
{
  return self->_tertiaryTextActiveTextColor;
}

- (UIColor)tertiaryTextDisabledTextColor
{
  return self->_tertiaryTextDisabledTextColor;
}

- (BOOL)tertiaryTextFontIsFixedSize
{
  return self->_tertiaryTextFontIsFixedSize;
}

- (NSString)tertiaryTextFontStyle
{
  return self->_tertiaryTextFontStyle;
}

- (double)tertiaryTextFontSize
{
  return self->_tertiaryTextFontSize;
}

- (double)tertiaryTextFontWeight
{
  return self->_tertiaryTextFontWeight;
}

- (UIColor)displayedAsSecondaryTextColor
{
  return self->_displayedAsSecondaryTextColor;
}

- (double)displayedAsSecondaryFontPointSize
{
  return self->_displayedAsSecondaryFontPointSize;
}

- (double)displayedAsSecondaryFontWeight
{
  return self->_displayedAsSecondaryFontWeight;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)textTrailingMargin
{
  return self->_textTrailingMargin;
}

- (double)textBottomMargin
{
  return self->_textBottomMargin;
}

- (double)imageAreaWidth
{
  return self->_imageAreaWidth;
}

- (double)imageTopMargin
{
  return self->_imageTopMargin;
}

- (double)imageBottomMargin
{
  return self->_imageBottomMargin;
}

- (double)waypointImageWidth
{
  return self->_waypointImageWidth;
}

- (double)waypointImageHeight
{
  return self->_waypointImageHeight;
}

- (double)stepImageWidth
{
  return self->_stepImageWidth;
}

- (double)stepImageHeight
{
  return self->_stepImageHeight;
}

- (int64_t)shieldArtworkSize
{
  return self->_shieldArtworkSize;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_arrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_junctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_secondaryArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryJunctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_secondaryJunctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- (UIColor)arrowColor
{
  return self->_arrowColor;
}

- (UIColor)arrowAccentColor
{
  return self->_arrowAccentColor;
}

- (BOOL)useMarkerFallback
{
  return self->_useMarkerFallback;
}

- (double)exitSignPadding
{
  return self->_exitSignPadding;
}

- (int64_t)exitSignSize
{
  return self->_exitSignSize;
}

- (UIColor)hairlineColor
{
  return self->_hairlineColor;
}

- (BOOL)shouldFlipPrimaryAndSecondaryText
{
  return self->_shouldFlipPrimaryAndSecondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColor, 0);
  objc_storeStrong((id *)&self->_arrowAccentColor, 0);
  objc_storeStrong((id *)&self->_arrowColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_displayedAsSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_tertiaryTextDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextActiveTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_secondaryTextDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextActiveTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_primaryTextDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextActiveTextColor, 0);
}

@end
