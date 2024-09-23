@implementation TISKEmojiSearchEvent

- (id)init:(double)a3 engaged:(BOOL)a4 order:(int64_t)a5
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TISKEmojiSearchEvent;
  result = -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v7, sel_init_timestamp_emojiSearchMode_order_, 19, 1, a5, a3);
  if (result)
    *((_BYTE *)result + 40) = a4;
  return result;
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
  if (self->_engaged)
    return CFSTR("ef:1");
  else
    return CFSTR("ef:0");
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

@end
