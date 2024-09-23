@implementation TISKInputGestureEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKInputGestureEvent;
  return -[TISKInputEvent init:type:emojiSearchMode:order:](&v6, sel_init_type_emojiSearchMode_order_, a3, 16, a4, a5);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gs"));
}

@end
