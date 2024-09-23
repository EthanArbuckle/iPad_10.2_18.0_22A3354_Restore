@implementation DirectionsLargeStyleStepView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  $8452678F12DBC466148836A9D382CAFC *result;
  objc_super v7;

  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = a2;
  v7.super_class = (Class)&OBJC_METACLASS___DirectionsLargeStyleStepView;
  result = ($8452678F12DBC466148836A9D382CAFC *)-[$8452678F12DBC466148836A9D382CAFC cellMetricsForIdiom:](&v7, "cellMetricsForIdiom:");
  if (a4 != 5)
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(0x4055800000000000uLL);
    *(_OWORD *)&retstr->var3 = xmmword_100E3A3F0;
  }
  return result;
}

+ (double)_textWidthForWidth:(double)a3 metrics:(id *)a4
{
  return a3 - (a4->var5 + a4->var6 + a4->var4 + a4->var7);
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double result;
  _OWORD v17[4];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_opt_class(a1);
  if (v12)
  {
    objc_msgSend(v12, "cellMetricsForIdiom:", a6);
  }
  else
  {
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
  }
  v13 = objc_msgSend(a1, "_labelListViewClassForRoute:step:", v11, v10);
  v17[2] = v21;
  v17[3] = v22;
  v18 = v23;
  v17[0] = v19;
  v17[1] = v20;
  objc_msgSend(a1, "_textWidthForWidth:metrics:", v17, a3);
  objc_msgSend(v13, "heightForWidth:route:step:idiom:", v11, v10, a6);
  v15 = v14;

  result = v15 + 64.0;
  if (v15 + 64.0 <= *((double *)&v20 + 1))
    return *((double *)&v20 + 1);
  return result;
}

+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4
{
  return (Class)objc_opt_class(RouteLargeStepLabelListView);
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 65.0, 65.0);
}

+ (unint64_t)signViewIconSize
{
  return 3;
}

@end
