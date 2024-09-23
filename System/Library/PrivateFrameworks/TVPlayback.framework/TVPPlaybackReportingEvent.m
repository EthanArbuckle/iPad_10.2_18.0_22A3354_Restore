@implementation TVPPlaybackReportingEvent

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_startEvent);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIsUIInteraction:(BOOL)a3
{
  self->_isUIInteraction = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setStartEvent:(id)a3
{
  objc_storeWeak((id *)&self->_startEvent, a3);
}

- (double)duration
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  if (-[TVPPlaybackReportingEvent type](self, "type") == 1
    || (v3 = 0.0, -[TVPPlaybackReportingEvent type](self, "type") == 2))
  {
    -[TVPPlaybackReportingEvent timestamp](self, "timestamp");
    v5 = v4;
    -[TVPPlaybackReportingEvent startEvent](self, "startEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v3 = v5 - v7;

  }
  return v3;
}

- (int64_t)durationMS
{
  double v2;

  -[TVPPlaybackReportingEvent duration](self, "duration");
  return llround(v2 * 1000.0);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)value
{
  return self->_value;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setDurationMS:(int64_t)a3
{
  self->_durationMS = a3;
}

- (TVPPlaybackReportingEvent)startEvent
{
  return (TVPPlaybackReportingEvent *)objc_loadWeakRetained((id *)&self->_startEvent);
}

- (BOOL)isUIInteraction
{
  return self->_isUIInteraction;
}

@end
