@implementation UIColor

+ (id)rating3
{
  return objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 1.0, 0.68627451, 0.0, 1.0);
}

+ (id)rating4
{
  return objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 1.0, 0.568627451, 0.0, 1.0);
}

+ (id)rating5
{
  return objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 1.0, 0.450980392, 0.0, 1.0);
}

+ (id)_maps_keyColor
{
  if (qword_1014D1F58 != -1)
    dispatch_once(&qword_1014D1F58, &stru_1011AF698);
  return (id)qword_1014D1F50;
}

+ (id)_maps_darkKeyColor
{
  if (qword_1014D1F68 != -1)
    dispatch_once(&qword_1014D1F68, &stru_1011AF6B8);
  return (id)qword_1014D1F60;
}

- (id)_maps_hexRepresentation
{
  const CGFloat *Components;

  Components = CGColorGetComponents(-[UIColor CGColor](objc_retainAutorelease(self), "CGColor"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02lX%02lX%02lX%02lX"), llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0), llround(Components[3] * 255.0));
}

+ (id)_maps_colorFromHexRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v7;

  v3 = a3;
  if (objc_msgSend(v3, "length") == (id)8)
  {
    v7 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v3));
    objc_msgSend(v4, "scanHexInt:", &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (double)HIBYTE(v7) / 255.0, (double)BYTE2(v7) / 255.0, (double)BYTE1(v7) / 255.0, (double)v7 / 255.0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_maps_euclideanDistanceFromColor:(id)a3
{
  id v4;
  float64x2_t v5;
  float64x2_t v7;
  __int128 v8;
  float64x2_t v9;
  double v10[3];

  v9 = 0u;
  *(_OWORD *)v10 = 0u;
  v4 = a3;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v9, &v9.f64[1], v10, &v10[1]);
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v7, &v7.f64[1], &v8, (char *)&v8 + 8);

  v5 = vsubq_f64(v9, v7);
  return sqrt(vaddvq_f64(vmulq_f64(v5, v5)) + (v10[0] - *(double *)&v8) * (v10[0] - *(double *)&v8));
}

+ (id)_maps_systemGrayColor
{
  return +[UIColor systemGrayColor](UIColor, "systemGrayColor");
}

+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3] withAlpha:(double)a4
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", *a3, a3[1], a3[2], a4);
}

+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3]
{
  return _objc_msgSend(a1, "_mapsCar_ColorFromRGBValues:withAlpha:", a3, 1.0);
}

+ (id)iOSJunctionColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.25);
}

+ (id)bannerJunctionColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.300000012);
}

+ (id)carPlayJunctionColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
}

+ (id)carPlayDashboardJunctionColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v9[0] = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
  v9[1] = v3;
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v6));
  return v7;
}

- (id)_maps_legibleTextColor
{
  double v2;
  void *v3;

  -[UIColor _luminance](self, "_luminance");
  if (v2 <= 0.699999988)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  return v3;
}

@end
