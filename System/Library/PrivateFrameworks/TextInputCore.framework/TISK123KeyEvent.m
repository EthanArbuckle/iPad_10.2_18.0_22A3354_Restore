@implementation TISK123KeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISK123KeyEvent;
  return -[TISKEvent init:emojiSearchMode:order:tap:](&v6, sel_init_emojiSearchMode_order_tap_, 5, a4, a5, a3);
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
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_11;
  v16.receiver = self;
  v16.super_class = (Class)TISK123KeyEvent;
  -[TISKEvent reportInterKeyTiming:previousEvent:](&v16, sel_reportInterKeyTiming_previousEvent_, v6, v7);
  -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
  v9 = v8;
  objc_msgSend(v7, "touchDownTimestamp");
  v11 = v9 - v10;
  v12 = objc_msgSend(v7, "type");
  if (v12)
  {
    if (v12 == 2)
    {
      v13 = &kTISKSpaceTo123Metric;
    }
    else
    {
      if (v12 != 3)
        goto LABEL_9;
      v13 = &kTISKDeleteTo123Metric;
    }
  }
  else
  {
    v13 = &kTISKCharTo123Metric;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSample:forKey:", v14, *v13);

LABEL_9:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSample:forKey:", v15, kTISKAnyTapTo123Metric);

  }
LABEL_11:

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("123"));
}

@end
