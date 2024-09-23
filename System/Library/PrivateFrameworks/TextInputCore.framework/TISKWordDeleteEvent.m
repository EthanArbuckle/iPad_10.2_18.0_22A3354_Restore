@implementation TISKWordDeleteEvent

- (TISKWordDeleteEvent)initWithEmojiSearchMode:(BOOL)a3 order:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TISKWordDeleteEvent;
  return (TISKWordDeleteEvent *)-[TISKEvent init:emojiSearchMode:order:](&v5, sel_init_emojiSearchMode_order_, 11, a3, a4);
}

- (void)reportToSession:(id)a3
{
  objc_msgSend(a3, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfAlteredWordsCounter);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wd"));
}

@end
