@implementation TISKLayoutSwitchEvent

- (id)init:(double)a3 layout:(id)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  _BOOL8 v7;
  id v11;
  id *v12;
  id *v13;
  objc_super v15;

  v7 = a5;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISKLayoutSwitchEvent;
  v12 = -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v15, sel_init_timestamp_emojiSearchMode_order_, 10, v7, a6, a3);
  v13 = v12;
  if (v12)
    objc_storeStrong(v12 + 5, a4);

  return v13;
}

- (double)touchDownTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[TISKEvent tap](self, "tap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TISKEvent tap](self, "tap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstTouch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = v6;

    return v7;
  }
  else
  {
    -[TISKTimestampEvent timestamp](self, "timestamp");
  }
  return result;
}

- (double)touchUpTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double result;

  -[TISKEvent tap](self, "tap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TISKEvent tap](self, "tap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastTouch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = v6;

    return v7;
  }
  else
  {
    -[TISKTimestampEvent timestamp](self, "timestamp");
  }
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
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ls"));
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
