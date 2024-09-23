@implementation TISKBucketSwitchEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  _BOOL8 v6;
  id v9;
  id *v10;
  id *v11;
  objc_super v13;

  v6 = a4;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISKBucketSwitchEvent;
  v10 = -[TISKEvent init:emojiSearchMode:order:](&v13, sel_init_emojiSearchMode_order_, 14, v6, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong(v10 + 4, a3);

  return v11;
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
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TISKSessionStats layout](self->_sessionStats, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = (int)v5;
  -[TISKSessionStats layout](self->_sessionStats, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bs:%d-%d"), v6, (int)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)privateDescription
{
  return CFSTR("bs");
}

- (TISKSessionStats)sessionStats
{
  return self->_sessionStats;
}

- (void)setSessionStats:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStats, 0);
}

@end
