@implementation PVTimelineMarker

+ (id)markerWithType:(int)a3 timeRange:(id *)a4
{
  uint64_t v5;
  id v6;
  __int128 v7;
  _OWORD v9[3];

  v5 = *(_QWORD *)&a3;
  v6 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)&a4->var0.var3;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  return (id)objc_msgSend(v6, "initWithType:timeRange:", v5, v9);
}

- (PVTimelineMarker)initWithType:(int)a3 timeRange:(id *)a4
{
  uint64_t v5;
  PVTimelineMarker *v6;
  PVTimelineMarker *v7;
  __int128 v8;
  _OWORD v10[3];
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)PVTimelineMarker;
  v6 = -[PVTimelineMarker init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PVTimelineMarker setType:](v6, "setType:", v5);
    v8 = *(_OWORD *)&a4->var0.var3;
    v10[0] = *(_OWORD *)&a4->var0.var0;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a4->var1.var1;
    -[PVTimelineMarker setTimeRange:](v7, "setTimeRange:", v10);
  }
  return v7;
}

- ($202A6A048D39AE170264FF71A65A9479)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)color
{
  return self->_color;
}

- (void)setColor:(int)a3
{
  self->_color = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)markerWithOZXTimeMarker:(_OZXTimeMarker *)a3
{
  uint64_t var5;
  void *v5;
  __CFString *var2;
  __CFString *var3;
  CMTimeRange v9;
  CMTime duration;
  CMTime start;
  CMTimeRange v12;

  memset(&v12, 0, sizeof(v12));
  CMTimeMakeWithSeconds(&start, a3->var0, 120000);
  CMTimeMakeWithSeconds(&duration, a3->var1, 120000);
  CMTimeRangeMake(&v12, &start, &duration);
  var5 = a3->var5;
  v9 = v12;
  +[PVTimelineMarker markerWithType:timeRange:](PVTimelineMarker, "markerWithType:timeRange:", var5, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", a3->var4);
  var2 = a3->var2;
  objc_msgSend(v5, "setLabel:", var2);

  var3 = a3->var3;
  objc_msgSend(v5, "setComment:", var3);

  return v5;
}

+ (id)markerWithOZXTimeMarkerFigTime:(_OZXTimeMarkerFigTime *)a3
{
  uint64_t var5;
  void *v5;
  __CFString *var2;
  __CFString *var3;
  CMTimeRange v9;
  CMTime duration;
  CMTime start;
  CMTimeRange v12;

  memset(&v12, 0, sizeof(v12));
  start = (CMTime)a3->var0;
  duration = (CMTime)a3->var1;
  CMTimeRangeMake(&v12, &start, &duration);
  var5 = a3->var5;
  v9 = v12;
  +[PVTimelineMarker markerWithType:timeRange:](PVTimelineMarker, "markerWithType:timeRange:", var5, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", a3->var4);
  var2 = a3->var2;
  objc_msgSend(v5, "setLabel:", var2);

  var3 = a3->var3;
  objc_msgSend(v5, "setComment:", var3);

  return v5;
}

@end
