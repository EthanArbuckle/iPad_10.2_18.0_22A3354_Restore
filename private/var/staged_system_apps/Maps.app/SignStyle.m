@implementation SignStyle

+ (id)sharedSignStyle
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006EF014;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2F60 != -1)
    dispatch_once(&qword_1014D2F60, block);
  return (id)qword_1014D2F58;
}

- (UIImage)squareSignImage
{
  return 0;
}

- (id)dimmedForegroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.23137255, 0.254901975, 0.278431386, 1.0);
}

- (UIColor)foregroundColor
{
  void *v3;

  if (-[SignStyle isDimmed](self, "isDimmed"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignStyle dimmedForegroundColor](self, "dimmedForegroundColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.200000003, 1.0));
  return (UIColor *)v3;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5
{
  double height;
  double width;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  $84D9B426F26CE1F36C5948DD9DEACC84 *result;
  id v17;

  height = a5.height;
  width = a5.width;
  v8 = *(_QWORD *)&a4;
  v17 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
    objc_msgSend(v13, "scale");
    v15 = v14;

  }
  else
  {
    v15 = 1.0;
  }

  objc_msgSend(a2, "arrowMetricsForStyle:scaledToMatchReferenceSize:contentScale:", v8, width, height, v15);
  return result;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5
{
  double height;
  double width;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  $84D9B426F26CE1F36C5948DD9DEACC84 *result;
  id v17;

  height = a5.height;
  width = a5.width;
  v8 = *(_QWORD *)&a4;
  v17 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
    objc_msgSend(v13, "scale");
    v15 = v14;

  }
  else
  {
    v15 = 1.0;
  }

  objc_msgSend(a2, "junctionArrowMetricsForStyle:scaledToMatchReferenceSize:contentScale:", v8, width, height, v15);
  return result;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5
{
  double height;
  double width;
  uint64_t v9;
  uint64_t v12;

  height = a5.height;
  width = a5.width;
  v9 = *(_QWORD *)&a4;
  objc_msgSend(a2, "_defaultJunctionArrowMetricsForStyle:");
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)objc_msgSend(a2, "_metricsForStyle:scaledToMatchReferenceSize:contentScale:baseMetrics:", v9, &v12, width, height, a6);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5
{
  double height;
  double width;
  uint64_t v9;
  uint64_t v12;

  height = a5.height;
  width = a5.width;
  v9 = *(_QWORD *)&a4;
  objc_msgSend(a2, "_defaultArrowMetricsForStyle:");
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)objc_msgSend(a2, "_metricsForStyle:scaledToMatchReferenceSize:contentScale:baseMetrics:", v9, &v12, width, height, a6);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_metricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5 baseMetrics:(double)a6
{
  uint64_t v7;
  double v8;
  double v9;
  _BYTE v11[496];

  v7 = 8;
  if (a5.width > a5.height)
  {
    v7 = 16;
    a5.width = a5.height;
  }
  v8 = a5.width / *(double *)(&a7->var0 + v7);
  if (a6 >= 1.0)
    v9 = a6;
  else
    v9 = 1.0;
  memcpy(v11, a7, sizeof(v11));
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)MKGuidanceManeuverArrowMetricsApplyScaleForContent(v11, v8, v9);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultArrowMetricsForStyle:(SEL)a3
{
  uint64_t v4;
  _QWORD v7[62];

  v4 = *(_QWORD *)&a4;
  MKDefaultGuidanceManeuverMetrics(v7);
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)objc_msgSend(a2, "_scaledMetricsForStyle:baseMetrics:", v4, v7);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultJunctionArrowMetricsForStyle:(SEL)a3
{
  uint64_t v4;
  _QWORD v7[62];

  v4 = *(_QWORD *)&a4;
  MKDefaultJunctionManeuverMetrics(v7, a2);
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)objc_msgSend(a2, "_scaledMetricsForStyle:baseMetrics:", v4, v7);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_scaledMetricsForStyle:(SEL)a3 baseMetrics:(unsigned int)a4
{
  _BYTE v5[496];

  if (a4 == 1)
  {
    memcpy(v5, a5, sizeof(v5));
    return ($84D9B426F26CE1F36C5948DD9DEACC84 *)MKGuidanceManeuverArrowMetricsApplyScale(v5, 0.5);
  }
  else if (!a4)
  {
    return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, a5, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
  }
  return result;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

@end
