@implementation TVPPlaybackStartupEvent

- (TVPPlaybackStartupEvent)initWithName:(id)a3 timestamp:(double)a4 durationMS:(id)a5
{
  id v9;
  id v10;
  TVPPlaybackStartupEvent *v11;
  TVPPlaybackStartupEvent *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TVPPlaybackStartupEvent;
  v11 = -[TVPPlaybackStartupEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_durationMS, a5);
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSNumber)durationMS
{
  return self->_durationMS;
}

- (void)setDurationMS:(id)a3
{
  objc_storeStrong((id *)&self->_durationMS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationMS, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
