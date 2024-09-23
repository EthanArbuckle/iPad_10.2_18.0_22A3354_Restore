@implementation RCMutableWaveform

- (void)setSegments:(id)a3
{
  RCMutableWaveform *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = self;
  v5 = a3;
  objc_sync_enter(v4);
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7.receiver = v4;
  v7.super_class = (Class)RCMutableWaveform;
  -[RCWaveform setSegments:](&v7, sel_setSegments_, v6);

  objc_sync_exit(v4);
}

- (BOOL)clipToTimeRange:(id)a3
{
  double var1;
  double var0;
  RCMutableWaveform *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_class();
  -[RCWaveform segments](v5, "segments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_mutableSegmentsByClippingToTimeRange:withSegments:", v7, var0, var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeRange");
    if (v10 > 0.0)
    {
      objc_msgSend(v9, "timeRange");
      +[RCWaveformSegment segmentsByShiftingSegments:byTimeOffset:](RCWaveformSegment, "segmentsByShiftingSegments:byTimeOffset:", v8, -v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }

  }
  objc_sync_exit(v5);

  -[RCMutableWaveform setSegments:](v5, "setSegments:", v8);
  return 1;
}

- (void)addSegment:(id)a3
{
  RCMutableWaveform *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[RCWaveform segments](v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_sync_exit(v4);
}

- (void)addSegments:(id)a3
{
  RCMutableWaveform *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[RCWaveform segments](v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_sync_exit(v4);
}

- (void)removeSegment:(id)a3
{
  RCMutableWaveform *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[RCWaveform segments](v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)removeAllSegments
{
  void *v2;
  RCMutableWaveform *obj;

  obj = self;
  objc_sync_enter(obj);
  -[RCWaveform segments](obj, "segments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_sync_exit(obj);
}

- (id)classForCoder
{
  return (id)objc_opt_class();
}

@end
