@implementation TISKDeleteKeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  _QWORD *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TISKDeleteKeyEvent;
  v5 = -[TISKInputEvent init:type:emojiSearchMode:order:](&v9, sel_init_type_emojiSearchMode_order_, a3, 3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5[8] = -1;
    objc_msgSend(v5, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIgnoreTapData:", objc_msgSend(v7, "isRapidDelete"));

  }
  return v6;
}

- (int64_t)_metricDeleteKeyPostion
{
  if (self->_deletePostion >= 4uLL)
    return 4;
  else
    return self->_deletePostion;
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

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TISKDeleteKeyEvent;
  -[TISKInputEvent reportToSession:](&v11, sel_reportToSession_, v4);
  objc_msgSend(v4, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfDeletesCounter);
  if (!-[TISKInputEvent ignoreTapData](self, "ignoreTapData"))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchDownErrorDistance](self, "touchDownErrorDistance");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v6, kTISKDeleteDownErrorDistance);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchUpErrorDistance](self, "touchUpErrorDistance");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v8, kTISKDeleteUpErrorDistance);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent downUpTimeDelta](self, "downUpTimeDelta");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v10, kTISKDeleteTouchDownUpMetric);

  }
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)TISKDeleteKeyEvent;
    -[TISKInputEvent reportInterKeyTiming:previousEvent:](&v19, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v9 = v8;
    objc_msgSend(v7, "touchDownTimestamp");
    v11 = v9 - v10;
    switch(objc_msgSend(v7, "type"))
    {
      case 0u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = kTISKKeyToDeleteMetric;
        goto LABEL_8;
      case 2u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = kTISKSpaceToDeleteMetric;
        goto LABEL_8;
      case 3u:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSample:forKey:", v14, kTISKDeleteToDeleteMetric);

        if (self->_deletePostion < 0)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSample:forKey:withPosition:", v12, kTISKDeleteToDeletePositionalMetric, -[TISKDeleteKeyEvent _metricDeleteKeyPostion](self, "_metricDeleteKeyPostion"));
        goto LABEL_9;
      case 8u:
        v15 = (void *)MEMORY[0x1E0CB37E8];
        -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
        v17 = v16;
        objc_msgSend(v7, "touchUpTimestamp");
        objc_msgSend(v15, "numberWithDouble:", v17 - v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = kTISKPathToDeleteMetric;
LABEL_8:
        objc_msgSend(v6, "addSample:forKey:", v12, v13);
LABEL_9:

        break;
      default:
        break;
    }
  }

}

- (id)description
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TISKInputEvent input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRapidDelete"))
    v4 = CFSTR("rdel");
  else
    v4 = CFSTR("del");
  objc_msgSend(v2, "stringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)deletePostion
{
  return self->_deletePostion;
}

- (void)setDeletePostion:(int64_t)a3
{
  self->_deletePostion = a3;
}

@end
