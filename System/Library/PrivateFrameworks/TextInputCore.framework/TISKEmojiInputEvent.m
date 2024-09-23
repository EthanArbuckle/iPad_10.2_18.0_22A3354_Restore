@implementation TISKEmojiInputEvent

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 emojiBucketCategory:(id)a6
{
  _BOOL8 v8;
  id v11;
  id *v12;
  id *v13;
  objc_super v15;

  v8 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TISKEmojiInputEvent;
  v12 = -[TISKTimestampEvent init:timestamp:emojiSearchMode:order:](&v15, sel_init_timestamp_emojiSearchMode_order_, 17, v8, a5, a3);
  v13 = v12;
  if (v12)
    objc_storeStrong(v12 + 5, a6);

  return v13;
}

- (void)reportToSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfEmojiCounter);
  objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfTappedKeysCounter);
  objc_msgSend(v20, "addToCounterForRateMetric:forKey:", 1, kTISKTapTypingSpeed);
  -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v4)
  {
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PositiveEmoji"));

    if (v7)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalPositiveEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SadEmoji"));

    if (v9)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalSadEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("AnxietyEmoji"));

    if (v11)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalAnxietyEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AngerEmoji"));

    if (v13)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalAngerEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("LowEnergyEmoji"));

    if (v15)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalLowEnergyEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("FeelEmoji"));

    if (v17)
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalFeelEmoji);
    -[TISKEmojiInputEvent emojiBucketCategory](self, "emojiBucketCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ConfusedEmoji"));

    v5 = v20;
    if (v19)
    {
      objc_msgSend(v20, "addSample:forKey:", &unk_1EA140558, kTISKtotalConfusedEmoji);
      v5 = v20;
    }
  }

}

- (id)description
{
  return CFSTR("em");
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
