@implementation VUINowPlayingTVAdvisoryFeature

- (VUINowPlayingTVAdvisoryFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUINowPlayingTVAdvisoryFeature;
  return -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:](&v6, sel_initWithType_startTime_duration_, a3, a4, a5);
}

- (BOOL)isSkippable
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  _sFeatureTypeDescription(-[VUINowPlayingTimeBoundFeature type](self, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUINowPlayingTVAdvisoryFeature *v4;
  VUINowPlayingTVAdvisoryFeature *v5;
  VUINowPlayingTVAdvisoryFeature *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;

  v4 = (VUINowPlayingTVAdvisoryFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUINowPlayingTimeBoundFeature type](self, "type");
    if (v7 == -[VUINowPlayingTimeBoundFeature type](v6, "type")
      && (-[VUINowPlayingTimeBoundFeature startTime](self, "startTime"),
          v9 = v8,
          -[VUINowPlayingTimeBoundFeature startTime](v6, "startTime"),
          v9 == v10)
      && (-[VUINowPlayingTimeBoundFeature duration](self, "duration"),
          v12 = v11,
          -[VUINowPlayingTimeBoundFeature duration](v6, "duration"),
          v12 == v13))
    {
      -[VUINowPlayingTVAdvisoryFeature advisoryDisabledTimeRanges](self, "advisoryDisabledTimeRanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUINowPlayingTVAdvisoryFeature advisoryDisabledTimeRanges](v6, "advisoryDisabledTimeRanges");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14 == v15;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)advisoryDisabledTimeRanges
{
  return self->_advisoryDisabledTimeRanges;
}

- (void)setAdvisoryDisabledTimeRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisoryDisabledTimeRanges, 0);
}

@end
