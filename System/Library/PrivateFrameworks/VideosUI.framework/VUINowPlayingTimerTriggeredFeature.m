@implementation VUINowPlayingTimerTriggeredFeature

- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5
{
  return -[VUINowPlayingTimerTriggeredFeature initWithType:duration:repeats:backgroundTimer:](self, "initWithType:duration:repeats:backgroundTimer:", a3, a5, 0, a4);
}

- (VUINowPlayingTimerTriggeredFeature)initWithType:(unint64_t)a3 duration:(double)a4 repeats:(BOOL)a5 backgroundTimer:(BOOL)a6
{
  VUINowPlayingTimerTriggeredFeature *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUINowPlayingTimerTriggeredFeature;
  result = -[VUINowPlayingTimerTriggeredFeature init](&v11, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_duration = a4;
    result->_repeats = a5;
    result->_backgroundTimer = a6;
    *(_WORD *)&result->_active = 0;
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
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _sFeatureTypeDescription(-[VUINowPlayingTimerTriggeredFeature type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingTimerTriggeredFeature isActive](self, "isActive");
  VUIBoolLogString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingTimerTriggeredFeature duration](self, "duration");
  v7 = v6;
  -[VUINowPlayingTimerTriggeredFeature repeats](self, "repeats");
  VUIBoolLogString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\ntype: %@,\n active: %@,\n duration: %f,\n repeats: %@\n}\n"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUINowPlayingTimerTriggeredFeature description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUINowPlayingTimerTriggeredFeature *v4;
  VUINowPlayingTimerTriggeredFeature *v5;
  VUINowPlayingTimerTriggeredFeature *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v4 = (VUINowPlayingTimerTriggeredFeature *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUINowPlayingTimerTriggeredFeature type](self, "type");
    if (v7 == -[VUINowPlayingTimerTriggeredFeature type](v6, "type")
      && (-[VUINowPlayingTimerTriggeredFeature duration](self, "duration"),
          v9 = v8,
          -[VUINowPlayingTimerTriggeredFeature duration](v6, "duration"),
          v9 == v10))
    {
      v11 = -[VUINowPlayingTimerTriggeredFeature repeats](self, "repeats");
      v12 = v11 ^ -[VUINowPlayingTimerTriggeredFeature repeats](v6, "repeats") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (double)duration
{
  return self->_duration;
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

- (BOOL)repeats
{
  return self->_repeats;
}

- (BOOL)isBackgroundTimer
{
  return self->_backgroundTimer;
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
