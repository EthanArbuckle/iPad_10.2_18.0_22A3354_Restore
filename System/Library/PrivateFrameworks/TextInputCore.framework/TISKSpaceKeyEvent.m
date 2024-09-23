@implementation TISKSpaceKeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKSpaceKeyEvent;
  return -[TISKInputEvent init:type:emojiSearchMode:order:](&v6, sel_init_type_emojiSearchMode_order_, a3, 2, a4, a5);
}

- (void)reportToSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TISKSpaceKeyEvent;
  v4 = a3;
  -[TISKInputEvent reportToSession:](&v11, sel_reportToSession_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[TISKInputEvent touchDownErrorDistance](self, "touchDownErrorDistance", v11.receiver, v11.super_class);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSample:forKey:", v6, kTISKSpaceDownErrorDistance);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TISKInputEvent touchUpErrorDistance](self, "touchUpErrorDistance");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSample:forKey:", v8, kTISKSpaceUpErrorDistance);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[TISKInputEvent downUpTimeDelta](self, "downUpTimeDelta");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSample:forKey:", v10, kTISKSpaceTouchDownUpMetric);

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
  double v13;
  void *v14;
  uint64_t *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v20.receiver = self;
    v20.super_class = (Class)TISKSpaceKeyEvent;
    -[TISKInputEvent reportInterKeyTiming:previousEvent:](&v20, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v9 = v8;
    objc_msgSend(v7, "touchDownTimestamp");
    v11 = v10;
    v12 = objc_msgSend(v7, "type");
    v13 = v9 - v11;
    switch(v12)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &kTISKCharToSpaceMetric;
        goto LABEL_7;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &kTISKSpaceToSpaceMetric;
        goto LABEL_7;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &kTISKDeleteToSpaceMetric;
        goto LABEL_7;
      case 8:
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp", v13);
        v18 = v17;
        objc_msgSend(v7, "touchUpTimestamp");
        objc_msgSend(v16, "numberWithDouble:", v18 - v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &kTISKPathSpaceMetric;
LABEL_7:
        objc_msgSend(v6, "addSample:forKey:", v14, *v15);

        break;
      default:
        break;
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spc"));
}

@end
