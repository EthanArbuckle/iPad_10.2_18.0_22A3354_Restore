@implementation PXWidgetBarSpec

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_textColor);
  objc_storeStrong((id *)(v4 + 24), self->_primaryFont);
  objc_storeStrong((id *)(v4 + 32), self->_secondaryFont);
  v5 = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)(v4 + 104) = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)(v4 + 88) = v5;
  *(_BYTE *)(v4 + 8) = self->_shouldUseSingleLine;
  *(double *)(v4 + 40) = self->_distanceBetweenTopAndFirstBaseline;
  *(double *)(v4 + 48) = self->_distanceBetweenLastBaselineAndBottom;
  *(double *)(v4 + 56) = self->_minimumDistanceBetweenTopAndFirstAscender;
  *(double *)(v4 + 64) = self->_minimumDistanceBetweenLastDescenderAndBottom;
  *(double *)(v4 + 72) = self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
  *(double *)(v4 + 80) = self->_horizontalSpacingBetweenTitleAndSubtitle;
  return (id)v4;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFont, a3);
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFont, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)shouldUseSingleLine
{
  return self->_shouldUseSingleLine;
}

- (void)setShouldUseSingleLine:(BOOL)a3
{
  self->_shouldUseSingleLine = a3;
}

- (double)distanceBetweenTopAndFirstBaseline
{
  return self->_distanceBetweenTopAndFirstBaseline;
}

- (void)setDistanceBetweenTopAndFirstBaseline:(double)a3
{
  self->_distanceBetweenTopAndFirstBaseline = a3;
}

- (double)distanceBetweenLastBaselineAndBottom
{
  return self->_distanceBetweenLastBaselineAndBottom;
}

- (void)setDistanceBetweenLastBaselineAndBottom:(double)a3
{
  self->_distanceBetweenLastBaselineAndBottom = a3;
}

- (double)minimumDistanceBetweenTopAndFirstAscender
{
  return self->_minimumDistanceBetweenTopAndFirstAscender;
}

- (void)setMinimumDistanceBetweenTopAndFirstAscender:(double)a3
{
  self->_minimumDistanceBetweenTopAndFirstAscender = a3;
}

- (double)minimumDistanceBetweenLastDescenderAndBottom
{
  return self->_minimumDistanceBetweenLastDescenderAndBottom;
}

- (void)setMinimumDistanceBetweenLastDescenderAndBottom:(double)a3
{
  self->_minimumDistanceBetweenLastDescenderAndBottom = a3;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
}

- (double)horizontalSpacingBetweenTitleAndSubtitle
{
  return self->_horizontalSpacingBetweenTitleAndSubtitle;
}

- (void)setHorizontalSpacingBetweenTitleAndSubtitle:(double)a3
{
  self->_horizontalSpacingBetweenTitleAndSubtitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
}

@end
