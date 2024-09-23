@implementation DirectionsLargeStyleStartEndContentView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return +[DirectionsLargeStyleStepView cellMetricsForIdiom:](DirectionsLargeStyleStepView, "cellMetricsForIdiom:", a4);
}

+ (id)overviewFontProvider
{
  return objc_retainBlock(&stru_1011E7BB8);
}

+ (id)subtitleFontProvider
{
  return objc_retainBlock(&stru_1011E7A78);
}

+ (id)subtitleDefaultFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0);
}

+ (double)topPadding
{
  return 43.0;
}

+ (double)labelSpacing
{
  return 16.0;
}

+ (double)bottomPadding
{
  return 32.0;
}

+ (unint64_t)iconSize
{
  return 4;
}

+ (BOOL)useMarkerFallback
{
  return 0;
}

@end
