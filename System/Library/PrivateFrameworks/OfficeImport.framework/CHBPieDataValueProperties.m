@implementation CHBPieDataValueProperties

+ (id)chdDataValueProperties
{
  return objc_alloc_init(CHDPieDataValueProperties);
}

+ (void)read:(id)a3 from:(const XlChartSeriesFormat *)a4
{
  id v5;

  v5 = a3;
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setExplosion:", a4->var10);
  }

}

@end
