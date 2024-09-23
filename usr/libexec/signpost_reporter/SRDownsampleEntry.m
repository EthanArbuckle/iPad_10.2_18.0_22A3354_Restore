@implementation SRDownsampleEntry

- (SRDownsampleEntry)initWithCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4
{
  SRDownsampleEntry *v4;
  SRDownsampleEntry *v7;
  SRDownsampleEntry *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = self;
  if (a4)
  {
    v14.receiver = self;
    v14.super_class = (Class)SRDownsampleEntry;
    v7 = -[SRDownsampleEntry init](&v14, "init");
    if (v7)
    {
      v7->_cap = a3;
      v7->_downsampleRatio = a4;
    }
    v4 = v7;
    v8 = v4;
  }
  else
  {
    v9 = sub_100003384();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_100009790(v10, v11, v12);

    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldReportThisTime
{
  unint64_t v3;
  unint64_t v4;

  -[SRDownsampleEntry setEventsSeen:](self, "setEventsSeen:", (char *)-[SRDownsampleEntry eventsSeen](self, "eventsSeen") + 1);
  v3 = -[SRDownsampleEntry eventsReported](self, "eventsReported");
  if (v3 >= -[SRDownsampleEntry cap](self, "cap"))
    return 0;
  v4 = -[SRDownsampleEntry eventsSeen](self, "eventsSeen");
  if (v4 % -[SRDownsampleEntry downsampleRatio](self, "downsampleRatio"))
    return 0;
  -[SRDownsampleEntry setEventsReported:](self, "setEventsReported:", (char *)-[SRDownsampleEntry eventsReported](self, "eventsReported") + 1);
  return 1;
}

- (unint64_t)cap
{
  return self->_cap;
}

- (unint64_t)downsampleRatio
{
  return self->_downsampleRatio;
}

- (unint64_t)eventsSeen
{
  return self->_eventsSeen;
}

- (void)setEventsSeen:(unint64_t)a3
{
  self->_eventsSeen = a3;
}

- (unint64_t)eventsReported
{
  return self->_eventsReported;
}

- (void)setEventsReported:(unint64_t)a3
{
  self->_eventsReported = a3;
}

@end
