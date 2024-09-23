@implementation TISKEvent

- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  return -[TISKEvent init:emojiSearchMode:order:tap:](self, "init:emojiSearchMode:order:tap:", *(_QWORD *)&a3, a4, a5, 0);
}

- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 tap:(id)a6
{
  id v11;
  TISKEvent *v12;
  TISKEvent *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TISKEvent;
  v12 = -[TISKEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_emojiSearchMode = a4;
    v12->_order = a5;
    objc_storeStrong((id *)&v12->_tap, a6);
    v13->_hasTimestamp = v11 != 0;
  }

  return v13;
}

- (id)upTouchEvent
{
  void *tap;

  tap = self->_tap;
  if (tap)
  {
    if (objc_msgSend(tap, "isDownUpTap"))
    {
      -[TISKTap lastTouch](self->_tap, "lastTouch");
      tap = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      tap = 0;
    }
  }
  return tap;
}

- (id)downTouchEvent
{
  void *tap;

  tap = self->_tap;
  if (tap)
  {
    if (objc_msgSend(tap, "isDownUpTap"))
    {
      -[TISKTap firstTouch](self->_tap, "firstTouch");
      tap = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      tap = 0;
    }
  }
  return tap;
}

- (double)touchDownTimestamp
{
  TISKTap *tap;
  void *v4;
  double v5;
  double v6;

  tap = self->_tap;
  if (!tap || !-[TISKTap isDownUpTap](tap, "isDownUpTap"))
    return 0.0;
  -[TISKTap firstTouch](self->_tap, "firstTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  return v6;
}

- (double)touchUpTimestamp
{
  TISKTap *tap;
  void *v4;
  double v5;
  double v6;

  tap = self->_tap;
  if (!tap || !-[TISKTap isDownUpTap](tap, "isDownUpTap"))
    return 0.0;
  -[TISKTap lastTouch](self->_tap, "lastTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  return v6;
}

- (id)description
{
  return &stru_1EA1081D0;
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int type;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_17;
  v8 = objc_msgSend(v6, "type");
  type = self->_type;
  if (v8 == 12)
  {
    if (type != 12)
    {
      objc_msgSend(v17, "startTypingTimerWithEvent:", self);
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  if (type == 12)
  {
LABEL_6:
    if (objc_msgSend(v7, "type") != 12)
    {
      objc_msgSend(v17, "haltTypingTimerWithEvent:", v7);
      goto LABEL_17;
    }
  }
  if ((objc_msgSend(v17, "isTypingTimerHalted") & 1) == 0)
  {
    -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
    v11 = v10;
    objc_msgSend(v7, "touchUpTimestamp");
    v13 = v11 - v12;
    if (v13 <= 5.0)
    {
      v15 = objc_msgSend(v7, "type");
      if (v13 >= 0.0 && v15 == 8)
      {
        objc_msgSend(v17, "addToDurationForRateMetric:forKey:", kTISKTapTypingSpeed, -v13);
        objc_msgSend(v17, "addToDurationForRateMetric:forKey:", kTISKPathTypingSpeed, v13);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSample:forKey:", v14, kTISKTypingPauses);

      objc_msgSend(v17, "haltTypingTimerWithEvent:", v7);
      objc_msgSend(v17, "startTypingTimerWithEvent:", self);
      objc_msgSend(v17, "addSample:forKey:", &unk_1EA140558, kTISKEpisodeCount);
    }
  }
LABEL_17:

}

- (BOOL)isMissingATouch
{
  return 0;
}

- (BOOL)isValidCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "candidate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v6))
  {
    objc_msgSend(v4, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)emojiSearchMode
{
  return self->_emojiSearchMode;
}

- (void)setEmojiSearchMode:(BOOL)a3
{
  self->_emojiSearchMode = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (TISKTap)tap
{
  return self->_tap;
}

- (void)setTap:(id)a3
{
  objc_storeStrong((id *)&self->_tap, a3);
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (BOOL)hasTimestamp
{
  return self->_hasTimestamp;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_hasTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tap, 0);
}

@end
