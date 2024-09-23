@implementation CompactYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  uint64_t v6;

  width = a3.width;
  if (qword_1001F6330 != -1)
    dispatch_once(&qword_1001F6330, &stru_1001B4A78);
  v4 = 4.5;
  if (EKUIWindowSizeParadigmForWindowSize(width) != 0x20000)
  {
    objc_msgSend((id)qword_1001F6328, "valueForSize:", width);
    v4 = v5;
    v6 = EKUIWindowSizeParadigmForWindowSize(width);
    if (v6 > 0xFFFFFF)
    {
      if (v6 != 0x1000000 && v6 != 0x10000000 && v6 != 0x4000000)
        return v4;
      return v4 + CalOnePixelInPoints(v6);
    }
    if (v6 == 0x40000 || v6 == 0x400000)
      return v4 + CalOnePixelInPoints(v6);
  }
  return v4;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F6340 != -1)
    dispatch_once(&qword_1001F6340, &stru_1001B4A98);
  objc_msgSend((id)qword_1001F6338, "valueForSize:", width);
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F6350 != -1)
    dispatch_once(&qword_1001F6350, &stru_1001B4AB8);
  if (EKUIWindowSizeParadigmForWindowSize(width) == 0x20000)
    return 11.0;
  objc_msgSend((id)qword_1001F6348, "valueForSize:", width);
  return result;
}

- (double)heightBetweenLineAndNumber
{
  double result;
  void *v4;

  if (qword_1001F6360 != -1)
    dispatch_once(&qword_1001F6360, &stru_1001B4AD8);
  if (EKUICurrentWindowSizeParadigmForViewHierarchy(self, a2) == 0x20000)
    return 9.5;
  v4 = (void *)qword_1001F6358;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v4, "valueForSize:");
  return result;
}

- (id)yearNumberFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)qword_1001F6368;
  if (!qword_1001F6368)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle0, 32770, 0));
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
    v5 = (void *)qword_1001F6368;
    qword_1001F6368 = v4;

    v2 = (void *)qword_1001F6368;
  }
  return v2;
}

- (double)yearNumberKerning
{
  return -0.5;
}

- (id)overlayLegendFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0);
}

- (double)overlayLegendRightInset
{
  return 16.0;
}

- (double)overlayLegendYearBaseline
{
  return 22.0;
}

- (double)overlayLegendMonthBaseline
{
  return 8.0;
}

- (double)overlayLegendSpacing
{
  return 4.0;
}

- (double)overlayLegendLineLength
{
  return 8.0;
}

- (double)overlayLegendYearLineThickness
{
  return 1.5;
}

- (double)overlayLegendMonthLineThickness
{
  return 0.5;
}

@end
