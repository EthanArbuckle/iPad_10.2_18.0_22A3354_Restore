@implementation TISKCharKeyEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISKCharKeyEvent;
  result = -[TISKInputEvent init:type:emojiSearchMode:order:](&v6, sel_init_type_emojiSearchMode_order_, a3, 0, a4, a5);
  if (result)
  {
    *((_QWORD *)result + 9) = -1;
    *((_BYTE *)result + 64) = 1;
  }
  return result;
}

- (int64_t)_metricWordKeyPostion:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
    return 5;
  else
    return a3;
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
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TISKCharKeyEvent;
  v4 = a3;
  -[TISKInputEvent reportToSession:](&v17, sel_reportToSession_, v4);
  if (self->_isShortWord)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent downUpTimeDelta](self, "downUpTimeDelta", v17.receiver, v17.super_class);
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v6, kTISKShortWordCharTouchDownUpMetric);

    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchDownErrorDistance](self, "touchDownErrorDistance");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v8, kTISKShortWordCharDownErrorDistance);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchUpErrorDistance](self, "touchUpErrorDistance");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:", v10, kTISKShortWordCharUpErrorDistance);
  }
  else
  {
    v11 = -[TISKCharKeyEvent _metricWordKeyPostion:](self, "_metricWordKeyPostion:", self->_wordPosition, v17.receiver, v17.super_class);
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent downUpTimeDelta](self, "downUpTimeDelta");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:withPosition:", v13, kTISKLongWordTouchDownUpPositionalMetric, v11);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchDownErrorDistance](self, "touchDownErrorDistance");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:withPosition:", v15, kTISKLongWordPositionalDownErrorDistance, v11);

    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent touchUpErrorDistance](self, "touchUpErrorDistance");
    objc_msgSend(v16, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSample:forKey:withPosition:", v10, kTISKLongWordPositionalUpErrorDistance, v11);
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
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  int64_t wordPosition;
  int64_t v26;
  void *v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_20;
  v28.receiver = self;
  v28.super_class = (Class)TISKCharKeyEvent;
  -[TISKInputEvent reportInterKeyTiming:previousEvent:](&v28, sel_reportInterKeyTiming_previousEvent_, v6, v7);
  -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
  v9 = v8;
  objc_msgSend(v7, "touchDownTimestamp");
  v11 = v9 - v10;
  -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
  v13 = v12;
  objc_msgSend(v7, "touchUpTimestamp");
  v15 = v14;
  objc_msgSend(v7, "tap");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v7, "tap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isDownUpTap") & 1) != 0)
    {
      v19 = objc_msgSend(v7, "type");

      if (v19 == 10)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSample:forKey:", v17, kTISKAnyTapToCharMetric);
    }
    else
    {

    }
  }
LABEL_8:
  v20 = objc_msgSend(v7, "type");
  if (v20 > 2)
  {
    if (v20 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = kTISKDeleteToCharMetric;
      goto LABEL_18;
    }
    if (v20 == 10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = kTISK123ToCharMetric;
      goto LABEL_18;
    }
  }
  else
  {
    if (!v20)
    {
      v23 = v13 - v15;
      if (!self->_isShortWord)
      {
        wordPosition = self->_wordPosition;
        if (wordPosition < 1)
          goto LABEL_20;
        v26 = -[TISKCharKeyEvent _metricWordKeyPostion:](self, "_metricWordKeyPostion:", wordPosition - 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSample:forKey:withPosition:", v27, kTISKLongWordTouchDownDownPositionalMetric, v26);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addSample:forKey:withPosition:", v21, kTISKLongWordTouchUpDownPositionalMetric, v26);
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSample:forKey:", v24, kTISKShortWordCharToCharMetric);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = kTISKShortWordCharTouchUpDownMetric;
LABEL_18:
      objc_msgSend(v6, "addSample:forKey:", v21, v22);
LABEL_19:

      goto LABEL_20;
    }
    if (v20 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = kTISKSpaceToCharMetric;
      goto LABEL_18;
    }
  }
LABEL_20:

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TISKInputEvent input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isShortWord)
    v7 = &stru_1EA1081D0;
  else
    v7 = CFSTR(":l");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%ld%@"), v5, self->_wordPosition, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)privateDescription
{
  return CFSTR("ch");
}

- (int64_t)wordPosition
{
  return self->_wordPosition;
}

- (void)setWordPosition:(int64_t)a3
{
  self->_wordPosition = a3;
}

- (BOOL)isShortWord
{
  return self->_isShortWord;
}

- (void)setIsShortWord:(BOOL)a3
{
  self->_isShortWord = a3;
}

@end
