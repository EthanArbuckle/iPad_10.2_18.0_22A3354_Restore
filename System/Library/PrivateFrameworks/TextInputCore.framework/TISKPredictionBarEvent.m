@implementation TISKPredictionBarEvent

- (id)init:(double)a3 emojiPrediction:(BOOL)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6 emojiBucketCategory:(id)a7
{
  _BOOL8 v9;
  id v13;
  id *v14;
  id *v15;
  objc_super v17;

  v9 = a5;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)TISKPredictionBarEvent;
  v14 = -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v17, sel_init_timestamp_emojiSearchMode_order_, 9, v9, a6, a3);
  v15 = v14;
  if (v14)
  {
    *((_BYTE *)v14 + 40) = a4;
    objc_storeStrong(v14 + 6, a7);
  }

  return v15;
}

- (void)reportToSession:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfTappedKeysCounter);
  objc_msgSend(v19, "addToCounterForRateMetric:forKey:", 1, kTISKTapTypingSpeed);
  if (self->_emojiPrediction)
  {
    objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfEmojiCounter);
    -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PositiveEmoji"));

      if (v6)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalPositiveEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SadEmoji"));

      if (v8)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalSadEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("AnxietyEmoji"));

      if (v10)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalAnxietyEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AngerEmoji"));

      if (v12)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalAngerEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("LowEnergyEmoji"));

      if (v14)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalLowEnergyEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FeelEmoji"));

      if (v16)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalFeelEmoji);
      -[TISKPredictionBarEvent emojiBucketCategory](self, "emojiBucketCategory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ConfusedEmoji"));

      if (v18)
        objc_msgSend(v19, "addSample:forKey:", &unk_1EA140558, kTISKtotalConfusedEmoji);
    }
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
  int v12;
  uint64_t *v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)TISKPredictionBarEvent;
    -[TISKEvent reportInterKeyTiming:previousEvent:](&v15, sel_reportInterKeyTiming_previousEvent_, v6, v7);
    -[TISKTimestampEvent touchDownTimestamp](self, "touchDownTimestamp");
    v9 = v8;
    objc_msgSend(v7, "touchDownTimestamp");
    v11 = v10;
    v12 = objc_msgSend(v7, "type");
    if (!v12)
    {
      v13 = &kTISKCharToPredictionMetric;
      goto LABEL_6;
    }
    if (v12 == 2)
    {
      v13 = &kTISKSpaceToPredictionMetric;
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 - v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSample:forKey:", v14, *v13);

    }
  }

}

- (id)description
{
  if (self->_emojiPrediction)
    return CFSTR("ep");
  else
    return CFSTR("pb");
}

- (BOOL)emojiPrediction
{
  return self->_emojiPrediction;
}

- (void)setEmojiPrediction:(BOOL)a3
{
  self->_emojiPrediction = a3;
}

- (NSString)emojiBucketCategory
{
  return self->_emojiBucketCategory;
}

- (void)setEmojiBucketCategory:(id)a3
{
  objc_storeStrong((id *)&self->_emojiBucketCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiBucketCategory, 0);
}

@end
