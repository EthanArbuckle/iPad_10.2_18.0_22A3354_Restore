@implementation CHBChartTypeWithGrouping

+ (void)setGrouping:(id)a3 stacked:(BOOL)a4 categoryPercentage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (v6)
  {
    objc_msgSend(v7, "setGrouping:", 2);
    if (v5)
      objc_msgSend(v7, "setGrouping:", 1);
  }

}

@end
