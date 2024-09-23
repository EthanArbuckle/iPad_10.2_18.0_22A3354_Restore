@implementation TISKShiftKeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKShiftKeyEvent;
  return -[TISKEvent init:emojiSearchMode:order:tap:](&v6, sel_init_emojiSearchMode_order_tap_, 4, a4, a5, a3);
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

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  uint64_t *v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)TISKShiftKeyEvent;
    -[TISKEvent reportInterKeyTiming:previousEvent:](&v15, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v9 = v8;
    objc_msgSend(v7, "touchDownTimestamp");
    v11 = v10;
    v12 = objc_msgSend(v7, "type");
    switch(v12)
    {
      case 2:
        v13 = &kTISKSpaceToShiftMetric;
        goto LABEL_8;
      case 10:
        v13 = &kTISK123ToAnyTapMetric;
        goto LABEL_8;
      case 3:
        v13 = &kTISKDeleteToShiftMetric;
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 - v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSample:forKey:", v14, *v13);

        break;
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sft"));
}

@end
