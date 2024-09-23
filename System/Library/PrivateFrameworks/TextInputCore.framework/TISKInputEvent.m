@implementation TISKInputEvent

- (id)init:(id)a3 type:(int)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  id *v12;
  id *v13;
  objc_super v15;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TISKInputEvent;
  v12 = -[TISKEvent init:emojiSearchMode:order:](&v15, sel_init_emojiSearchMode_order_, v8, v7, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 7, a3);
    v13[4] = (id)0xBFF0000000000000;
    v13[5] = (id)0xBFF0000000000000;
    *((_BYTE *)v13 + 48) = 1;
    *((_BYTE *)v13 + 49) = 0;
    objc_msgSend(v13, "setHasTimestamp:", 1);
  }

  return v13;
}

- (BOOL)isMissingATouch
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  -[TISKEvent tap](self, "tap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TISKEvent tap](self, "tap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDownUpTap");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)upTouchEvent
{
  return (id)-[TIKeyboardInput touchEvent](self->_input, "touchEvent");
}

- (double)downUpTimeDelta
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[TISKEvent tap](self, "tap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  -[TISKEvent tap](self, "tap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstTouch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v10 = v6 - v9;

  return v10;
}

- (void)_computeErrorDistance
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  __CFString *v19;
  CGRect v20;

  -[TISKInputEvent input](self, "input");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[TISKInputEvent input](self, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBackspace");

    if ((v5 & 1) == 0)
    {
      self->_canComputeErrorDistance = 0;
      return;
    }
    v19 = CFSTR("delete");
  }
  -[TISKEvent tap](self, "tap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getFrameForKey:", v19);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (CGRectEqualToRect(v20, *MEMORY[0x1E0C9D628]))
  {
    self->_canComputeErrorDistance = 0;
  }
  else
  {
    -[TISKEvent tap](self, "tap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "downErrorDistance:", v8, v10, v12, v14);
    self->_downErrorDistance = v16;

    -[TISKEvent tap](self, "tap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "upErrorDistance:", v8, v10, v12, v14);
    self->_upErrorDistance = v18;

  }
}

- (double)touchDownErrorDistance
{
  return self->_downErrorDistance;
}

- (double)touchUpErrorDistance
{
  return self->_upErrorDistance;
}

- (void)reportToSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfTappedKeysCounter);
  objc_msgSend(v13, "addToCounterForRateMetric:forKey:", 1, kTISKTapTypingSpeed);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[TISKEvent tap](self, "tap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "numberOfDrags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSample:forKey:", v6, kTISKNumberOfDragsCounter);

  if (!self->_ignoreTapData)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[TISKInputEvent downUpTimeDelta](self, "downUpTimeDelta");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSample:forKey:", v8, kTISKTouchDownUpMetric);

    -[TISKInputEvent _computeErrorDistance](self, "_computeErrorDistance");
    if (self->_canComputeErrorDistance)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      -[TISKInputEvent touchDownErrorDistance](self, "touchDownErrorDistance");
      objc_msgSend(v9, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSample:forKey:", v10, kTISKDownErrorDistance);

      v11 = (void *)MEMORY[0x1E0CB37E8];
      -[TISKInputEvent touchUpErrorDistance](self, "touchUpErrorDistance");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSample:forKey:", v12, kTISKUpErrorDistance);

    }
  }

}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t *v21;
  void *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v23.receiver = self;
    v23.super_class = (Class)TISKInputEvent;
    -[TISKEvent reportInterKeyTiming:previousEvent:](&v23, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    if (objc_msgSend(v7, "type") == 10
      || (objc_msgSend(v7, "tap"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v9 = (void *)v8,
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
      v12 = v11;
      objc_msgSend(v7, "touchDownTimestamp");
      v14 = v12 - v13;
      -[TISKEvent touchDownTimestamp](self, "touchDownTimestamp");
      v16 = v15;
      objc_msgSend(v7, "touchUpTimestamp");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 - v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSample:forKey:", v18, kTISKTouchUpDownMetric);

      v19 = objc_msgSend(v7, "type");
      if (v19 == 10)
      {
        v21 = &kTISK123ToAnyTapMetric;
      }
      else
      {
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addSample:forKey:", v20, kTISKCharToAnyTapMetric);

        }
        v21 = &kTISKTouchDownDownMetric;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSample:forKey:", v22, *v21);

    }
  }

}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (BOOL)ignoreTapData
{
  return self->_ignoreTapData;
}

- (void)setIgnoreTapData:(BOOL)a3
{
  self->_ignoreTapData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

+ (id)makeInputEvent:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordSeparator:(id)a6 accentedLanguage:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v10;
  id v11;
  id v12;
  __objc2_class **v13;
  void *v14;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  UChar32 v23;
  void *v24;
  void *v25;
  char v26;

  v7 = a7;
  v10 = a4;
  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(v11, "isFlick") & 1) != 0
    || (objc_msgSend(v11, "isGesture") & 1) != 0
    || (objc_msgSend(v11, "isSynthesizedByAcceptingCandidate") & 1) != 0)
  {
    v13 = off_1EA0F7CB8;
    goto LABEL_5;
  }
  if ((objc_msgSend(v11, "isPopupVariant") & 1) != 0)
  {
    v13 = off_1EA0F7CE0;
    goto LABEL_5;
  }
  v16 = objc_msgSend(v11, "isBackspace");
  v13 = off_1EA0F7C90;
  if ((v16 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v11, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v13 = off_1EA0F7D20;
  if (v18 != 1)
    goto LABEL_5;
  objc_msgSend(v11, "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "rangeOfCharacterFromSet:", v20);

  if (v21 && v7)
  {
    objc_msgSend(v11, "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "_firstChar");

    if (!KB::character_is_letter_modifier(v23))
    {
      v13 = off_1EA0F7C80;
      if (v23 == 39 || v23 == 8217)
        goto LABEL_5;
      goto LABEL_17;
    }
LABEL_19:
    v13 = off_1EA0F7C80;
    goto LABEL_5;
  }
  if (!v21)
    goto LABEL_19;
LABEL_17:
  objc_msgSend(v11, "string");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", CFSTR(" ")))
  {

LABEL_21:
    v13 = off_1EA0F7D18;
    goto LABEL_5;
  }
  objc_msgSend(v11, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", v12);

  if ((v26 & 1) != 0)
    goto LABEL_21;
  if (objc_msgSend(v11, "isBackspace"))
    v13 = off_1EA0F7C90;
  else
    v13 = off_1EA0F7D20;
LABEL_5:
  v14 = (void *)objc_msgSend(objc_alloc(*v13), "init:emojiSearchMode:order:", v11, v10, a5);

  return v14;
}

@end
