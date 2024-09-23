@implementation VUINowPlayingTimeBoundFeature

- (VUINowPlayingTimeBoundFeature)init
{
  return -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:](self, "initWithType:startTime:duration:", -1, 3.40282347e38, 3.40282347e38);
}

- (VUINowPlayingTimeBoundFeature)initWithType:(unint64_t)a3 startTime:(double)a4 duration:(double)a5
{
  VUINowPlayingTimeBoundFeature *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUINowPlayingTimeBoundFeature;
  result = -[VUINowPlayingTimeBoundFeature init](&v9, sel_init);
  if (a3 && result)
  {
    *(_WORD *)&result->_active = 0;
    result->_type = a3;
    result->_startTime = a4;
    result->_duration = a5;
    result->_skippable = 1;
  }
  else
  {

    return 0;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _sFeatureTypeDescription(-[VUINowPlayingTimeBoundFeature type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingTimeBoundFeature isActive](self, "isActive");
  VUIBoolLogString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingTimeBoundFeature startTime](self, "startTime");
  v7 = v6;
  -[VUINowPlayingTimeBoundFeature duration](self, "duration");
  v9 = v8;
  -[VUINowPlayingTimeBoundFeature isSkippable](self, "isSkippable");
  VUIBoolLogString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\ntype: %@,\n active: %@,\n startTime: %f,\n duration: %f,\n isSkippable: %@\n}\n"), v4, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
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
  VUINowPlayingTimeBoundFeature *v4;
  VUINowPlayingTimeBoundFeature *v5;
  VUINowPlayingTimeBoundFeature *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = (VUINowPlayingTimeBoundFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUINowPlayingTimeBoundFeature type](self, "type");
    if (v7 == -[VUINowPlayingTimeBoundFeature type](v6, "type")
      && (-[VUINowPlayingTimeBoundFeature startTime](self, "startTime"),
          v9 = v8,
          -[VUINowPlayingTimeBoundFeature startTime](v6, "startTime"),
          v9 == v10))
    {
      -[VUINowPlayingTimeBoundFeature duration](self, "duration");
      v12 = v11;
      -[VUINowPlayingTimeBoundFeature duration](v6, "duration");
      v14 = v12 == v13;
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

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)shouldAutoRemove
{
  return self->_autoRemove;
}

- (void)setAutoRemove:(BOOL)a3
{
  self->_autoRemove = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isSkippable
{
  return self->_skippable;
}

- (void)setSkippable:(BOOL)a3
{
  self->_skippable = a3;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
}

@end
