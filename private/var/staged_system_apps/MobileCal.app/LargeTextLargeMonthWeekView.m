@implementation LargeTextLargeMonthWeekView

+ (double)dayNumberFontSize:(BOOL)a3
{
  return 36.0;
}

+ (double)dayNumberOverlayFontSize:(BOOL)a3
{
  return 20.0;
}

+ (id)weekNumberFont
{
  return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 22.0);
}

+ (double)spaceBelowGrayLineHeight:(BOOL)a3
{
  return 110.0;
}

+ (double)grayLineHeight
{
  return 1.0;
}

+ (BOOL)usesRoundedRectInsteadOfCircle
{
  return 1;
}

+ (double)_yOffsetForRoundedRect:(BOOL)a3
{
  double result;
  double v4;

  result = 5.0;
  if (a3)
  {
    objc_msgSend(a1, "headerHeight", 5.0);
    return v4 + 5.0;
  }
  return result;
}

+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MidX;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect result;

  v8 = a8;
  v9 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a6;
  v17 = a5;
  *(_QWORD *)&v18 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(v19, "dayNumberFontSize:", v9, v18);
  v21 = v20;
  *(_QWORD *)&v22 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(v23, "dayNumberOverlayFontSize:", v9, v22);
  +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:", v17, v16, v21, v24);
  v26 = v25;
  v28 = v27;

  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MidX = CGRectGetMidX(v38);
  v32 = CalRoundToScreenScale(v30, v31, MidX + v26 * -0.5);
  objc_msgSend(a1, "_yOffsetForRoundedRect:", v8);
  v34 = v33;
  v35 = v32;
  v36 = v26;
  v37 = v28;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v34;
  result.origin.x = v35;
  return result;
}

+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6
{
  _BOOL8 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v6 = a6;
  v8 = CalRoundToScreenScale(a1, a2, (a3 - a4.width) * 0.5);
  objc_msgSend(a1, "_yOffsetForRoundedRect:", v6);
  v10 = v9;
  v11 = v8;
  result.y = v10;
  result.x = v11;
  return result;
}

@end
