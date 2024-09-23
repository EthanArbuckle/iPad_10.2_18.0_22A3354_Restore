@implementation LargeTextCompactYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F6580 != -1)
    dispatch_once(&qword_1001F6580, &stru_1001B5988);
  objc_msgSend((id)qword_1001F6578, "valueForSize:", width);
  return result;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F6590 != -1)
    dispatch_once(&qword_1001F6590, &stru_1001B59A8);
  objc_msgSend((id)qword_1001F6588, "valueForSize:", width);
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F65A0 != -1)
    dispatch_once(&qword_1001F65A0, &stru_1001B59C8);
  objc_msgSend((id)qword_1001F6598, "valueForSize:", width);
  return result;
}

- (double)heightBetweenLineAndNumber
{
  void *v3;
  double result;

  if (qword_1001F65B0 != -1)
    dispatch_once(&qword_1001F65B0, &stru_1001B59E8);
  v3 = (void *)qword_1001F65A8;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (id)yearNumberFont
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  if (qword_1001F65C0 != -1)
    dispatch_once(&qword_1001F65C0, &stru_1001B5A08);
  v3 = (void *)qword_1001F65B8;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  v5 = (void *)qword_1001F65C8;
  if (!qword_1001F65C8)
    goto LABEL_7;
  v6 = v4 - *(double *)&qword_1001F5700;
  if (v4 - *(double *)&qword_1001F5700 < 0.0)
    v6 = -v6;
  if (v6 > 0.0001)
  {
LABEL_7:
    qword_1001F5700 = *(_QWORD *)&v4;
    v7 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v8 = (void *)qword_1001F65C8;
    qword_1001F65C8 = v7;

    v5 = (void *)qword_1001F65C8;
  }
  return v5;
}

- (id)overlayLegendFont
{
  void *v3;

  if (qword_1001F65D8 != -1)
    dispatch_once(&qword_1001F65D8, &stru_1001B5A28);
  v3 = (void *)qword_1001F65D0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)overlayLegendRightInset
{
  return 16.0;
}

- (double)overlayLegendYearBaseline
{
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;

  -[LargeTextCompactYearViewYearHeader overlayLegendMonthBaseline](self, "overlayLegendMonthBaseline");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextCompactYearViewYearHeader overlayLegendFont](self, "overlayLegendFont"));
  v6 = objc_msgSend(v5, "_bodyLeading");
  v9 = CalRoundToScreenScale(v6, v8, v4 + v7);

  return v9;
}

- (double)overlayLegendMonthBaseline
{
  void *v3;
  double result;

  if (qword_1001F65E8 != -1)
    dispatch_once(&qword_1001F65E8, &stru_1001B5A48);
  v3 = (void *)qword_1001F65E0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)overlayLegendSpacing
{
  return 4.0;
}

- (double)overlayLegendLineLength
{
  void *v3;
  double result;

  if (qword_1001F65F8 != -1)
    dispatch_once(&qword_1001F65F8, &stru_1001B5A68);
  v3 = (void *)qword_1001F65F0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)overlayLegendYearLineThickness
{
  return 3.0;
}

- (double)overlayLegendMonthLineThickness
{
  return 1.0;
}

@end
