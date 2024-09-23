@implementation RCMutableCompositionFragment

- (BOOL)intersectWithTimeRange:(id)a3
{
  double var1;
  double var0;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  var1 = a3.var1;
  var0 = a3.var0;
  -[RCCompositionFragment timeRangeInComposition](self, "timeRangeInComposition");
  v7 = v6;
  v9 = RCTimeRangeIntersectTimeRange(v6, v8, var0, var1);
  v11 = v10;
  v12 = RCTimeRangeDeltaWithExactPrecision(v9, v10);
  if (v12 > 0.00000011920929)
  {
    -[RCCompositionFragment timeRangeInContentToUse](self, "timeRangeInContentToUse");
    v15 = RCTimeRangeInset(v13, v14, v9 - v7);
    v17 = v16;
    -[RCCompositionFragment setTimeRangeInComposition:](self, "setTimeRangeInComposition:", v9, v11);
    -[RCCompositionFragment setTimeRangeInContentToUse:](self, "setTimeRangeInContentToUse:", v15, v17);
  }
  return v12 > 0.00000011920929;
}

@end
