@implementation TISKTouchlessInputEvent

- (id)init:(BOOL)a3 order:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TISKTouchlessInputEvent;
  return -[TISKEvent init:emojiSearchMode:order:](&v5, sel_init_emojiSearchMode_order_, 13, a3, a4);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ti"));
}

@end
