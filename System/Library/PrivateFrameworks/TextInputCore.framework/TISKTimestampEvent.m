@implementation TISKTimestampEvent

- (id)init:(int)a3 timestamp:(double)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TISKTimestampEvent;
  v7 = -[TISKEvent init:emojiSearchMode:order:](&v10, sel_init_emojiSearchMode_order_, *(_QWORD *)&a3, a5, a6);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setTimestamp:", a4);
    objc_msgSend(v8, "setHasTimestamp:", 1);
  }
  return v8;
}

- (BOOL)isMissingATouch
{
  return self->_timestamp <= 0.0;
}

- (double)touchDownTimestamp
{
  return self->_timestamp;
}

- (double)touchUpTimestamp
{
  return self->_timestamp;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
