@implementation TISKCursorMoveEvent

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKCursorMoveEvent;
  return -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v6, sel_init_timestamp_emojiSearchMode_order_, 12, a4, a5, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cm"));
}

@end
