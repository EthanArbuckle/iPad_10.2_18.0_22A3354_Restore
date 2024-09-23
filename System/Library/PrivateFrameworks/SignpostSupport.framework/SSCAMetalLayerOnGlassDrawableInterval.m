@implementation SSCAMetalLayerOnGlassDrawableInterval

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerOnGlassDrawableInterval startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerOnGlassDrawableInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerOnGlassDrawableInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerOnGlassDrawableInterval timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerOnGlassDrawableInterval endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerOnGlassDrawableInterval startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerOnGlassDrawableInterval endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerOnGlassDrawableInterval startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerOnGlassDrawableInterval startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerOnGlassDrawableInterval endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerOnGlassDrawableInterval durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerOnGlassDrawableInterval startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerOnGlassDrawableInterval endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerOnGlassDrawableInterval durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerOnGlassDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerOnGlassDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerOnGlassDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startMachContinuousTime");

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerOnGlassDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "endMachContinuousTime");

  return v3;
}

- (double)timebaseRatio
{
  void *v2;
  double v3;
  double v4;

  -[SSCAMetalLayerOnGlassDrawableInterval backingInterval](self, "backingInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timebaseRatio");
  v4 = v3;

  return v4;
}

- (SSCAMetalLayerOnGlassDrawableInterval)initWithSignpostInterval:(id)a3
{
  id v4;
  _SSCAMLTimeInterval *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _SSCAMLTimeInterval *v10;
  SSInFlightCAMetalDrawableInterval *v11;
  SSCAMetalLayerOnGlassDrawableInterval *v12;
  id *p_isa;
  SSCAMetalLayerOnGlassDrawableInterval *v14;
  objc_super v16;

  v4 = a3;
  v5 = [_SSCAMLTimeInterval alloc];
  v6 = objc_msgSend(v4, "startMachContinuousTime");
  v7 = objc_msgSend(v4, "endMachContinuousTime");
  objc_msgSend(v4, "beginDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timebaseRatio");
  v10 = -[_SSCAMLTimeInterval initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:](v5, "initWithStartMCT:endMCT:startDate:endDate:timebaseRatio:", v6, v7, v8, v9);

  if (v10)
  {
    v11 = -[SSInFlightCAMetalDrawableInterval initWithOnGlassSignpostInterval:]([SSInFlightCAMetalDrawableInterval alloc], "initWithOnGlassSignpostInterval:", v4);
    if (v11)
    {
      v16.receiver = self;
      v16.super_class = (Class)SSCAMetalLayerOnGlassDrawableInterval;
      v12 = -[SSCAMetalLayerOnGlassDrawableInterval init](&v16, sel_init);
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_backingInterval, v10);
        objc_storeStrong(p_isa + 1, v11);
      }
      self = p_isa;
      v14 = self;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCAMetalLayerOnGlassDrawableInterval inFlightDrawableInterval](self, "inFlightDrawableInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSCAMetalLayerOnGlassDrawableIntervalKey_InFlightDrawableInfo);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerOnGlassDrawableInterval instantaneousFramesPerSecond](self, "instantaneousFramesPerSecond");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSCAMetalLayerOnGlassDrawableIntervalKey_InstantaneousFramesPerSecond);

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerOnGlassDrawableInterval jsonDescription:](self, "jsonDescription:", 3);
}

- (SSInFlightCAMetalDrawableInterval)inFlightDrawableInterval
{
  return self->_inFlightDrawableInterval;
}

- (double)instantaneousFramesPerSecond
{
  return self->_instantaneousFramesPerSecond;
}

- (_SSCAMLTimeInterval)backingInterval
{
  return self->_backingInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingInterval, 0);
  objc_storeStrong((id *)&self->_inFlightDrawableInterval, 0);
}

@end
