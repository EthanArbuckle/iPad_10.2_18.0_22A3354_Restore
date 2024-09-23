@implementation TISKEmojiSwitchEvent

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKEmojiSwitchEvent;
  return -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v6, sel_init_timestamp_emojiSearchMode_order_, 18, a4, a5, a3);
}

- (void)reportToSession:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = kTISKNumberOfTappedKeysCounter;
  v4 = a3;
  objc_msgSend(v4, "addSample:forKey:", &unk_1EA140558, v3);
  objc_msgSend(v4, "addToCounterForRateMetric:forKey:", 1, kTISKTapTypingSpeed);

}

- (id)description
{
  if (-[TISKEvent emojiSearchMode](self, "emojiSearchMode"))
    return CFSTR("es:1");
  else
    return CFSTR("es:0");
}

@end
