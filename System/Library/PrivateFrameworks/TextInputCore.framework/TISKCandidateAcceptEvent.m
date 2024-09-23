@implementation TISKCandidateAcceptEvent

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordBucketCategory:(id)a6 isAutocorrection:(BOOL)a7
{
  _BOOL8 v10;
  id v13;
  id v14;
  id *v15;
  id *v16;
  objc_super v18;

  v10 = a4;
  v13 = a3;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TISKCandidateAcceptEvent;
  v15 = -[TISKEvent init:emojiSearchMode:order:](&v18, sel_init_emojiSearchMode_order_, 7, v10, a5);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(v15 + 5, a3);
    objc_storeStrong(v16 + 6, a6);
    *((_BYTE *)v16 + 32) = a7;
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ca"));
}

- (void)reportToSession:(id)a3
{
  _BOOL4 v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;

  v24 = a3;
  v4 = -[TISKEvent isValidCandidate:](self, "isValidCandidate:", self->_candidate);
  v5 = v24;
  if (!v4)
    goto LABEL_37;
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfWordsCounter);
  if (-[TISKCandidateAcceptEvent isAutocorrection](self, "isAutocorrection"))
    objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfAutoCorrections);
  v6 = -[TIKeyboardCandidate usageTrackingMask](self->_candidate, "usageTrackingMask");
  v7 = v6;
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfSpaceCorrections);
    if ((v7 & 0x20) == 0)
    {
LABEL_6:
      if ((v7 & 0x400) == 0)
        goto LABEL_7;
      goto LABEL_18;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfRetroCorrections);
  if ((v7 & 0x400) == 0)
  {
LABEL_7:
    if ((v7 & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfTranspositionCorrections);
  if ((v7 & 0x800) == 0)
  {
LABEL_8:
    if ((v7 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfInsertKeyCorrections);
  if ((v7 & 0x1000) == 0)
  {
LABEL_9:
    if ((v7 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfSkipTouchCorrections);
  if ((v7 & 0x4000) == 0)
  {
LABEL_10:
    if ((v7 & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfNearKeyCorrections);
  if ((v7 & 0x8000) == 0)
  {
LABEL_11:
    if ((v7 & 0x10000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfSubstitutionCorrections);
  if ((v7 & 0x10000) != 0)
LABEL_12:
    objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, kTISKNumberOfHitTestCorrections);
LABEL_13:
  -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v24;
  if (v8)
  {
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("absolutistWord"));

    if ((v10 & 1) != 0)
    {
      v11 = &kTISKtotalAbsolutistWords;
LABEL_36:
      objc_msgSend(v24, "addSample:forKey:", &unk_1EA140558, *v11);
      v5 = v24;
      goto LABEL_37;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("downWord"));

    if ((v13 & 1) != 0)
    {
      v11 = &kTISKtotalDownWords;
      goto LABEL_36;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("deathWord"));

    if ((v15 & 1) != 0)
    {
      v11 = &kTISKtotalDeathWords;
      goto LABEL_36;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("anxietyWord"));

    if ((v17 & 1) != 0)
    {
      v11 = &kTISKtotalAnxietyWords;
      goto LABEL_36;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("angerWord"));

    if ((v19 & 1) != 0)
    {
      v11 = &kTISKtotalAngerWords;
      goto LABEL_36;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("healthFeelingWord"));

    if ((v21 & 1) != 0)
    {
      v11 = &kTISKtotalHealthFeelingWords;
      goto LABEL_36;
    }
    -[TISKCandidateAcceptEvent wordBucketCategory](self, "wordBucketCategory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("positiveWord"));

    v5 = v24;
    if (v23)
    {
      v11 = &kTISKtotalPositiveWords;
      goto LABEL_36;
    }
  }
LABEL_37:

}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)setCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_candidate, a3);
}

- (NSString)wordBucketCategory
{
  return self->_wordBucketCategory;
}

- (void)setWordBucketCategory:(id)a3
{
  objc_storeStrong((id *)&self->_wordBucketCategory, a3);
}

- (BOOL)isAutocorrection
{
  return self->_isAutocorrection;
}

- (void)setIsAutocorrection:(BOOL)a3
{
  self->_isAutocorrection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordBucketCategory, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
