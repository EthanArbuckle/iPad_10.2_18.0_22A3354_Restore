@implementation TIAsteriskCorrectionMessageEvent

- (TIAsteriskCorrectionMessageEvent)initWithSession:(id)a3 andPrevMsgAutocorrectionType:(unint64_t)a4 andBundleId:(id)a5
{
  id v9;
  id v10;
  TIAsteriskCorrectionMessageEvent *v11;
  TIAsteriskCorrectionMessageEvent *v12;
  NSString *messageText;
  TITypingSessionAligned *v14;
  TITypingSessionAligned *messageAlignedSession;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIAsteriskCorrectionMessageEvent;
  v11 = -[TIAsteriskCorrectionMessageEvent init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    messageText = v11->_messageText;
    v11->_messageText = (NSString *)&stru_1EA1081D0;

    objc_storeStrong((id *)&v12->_asteriskCorrectionType, (id)kTIACUnknown);
    objc_storeStrong((id *)&v12->_wordCountType, (id)kTIACUnknownWordCountType);
    v12->_prevMsgAutocorrectionType = a4;
    objc_storeStrong((id *)&v12->_messageSession, a3);
    v14 = -[TITypingSessionAligned initWithSession:]([TITypingSessionAligned alloc], "initWithSession:", v9);
    messageAlignedSession = v12->_messageAlignedSession;
    v12->_messageAlignedSession = v14;

    objc_storeStrong((id *)&v12->_bundleId, a5);
  }

  return v12;
}

- (void)analyzeEvent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  TIKBAnalyticsMetricsContext *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TIKBAnalyticsMetricsContext *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[TITypingSession userActionHistory](self->_messageSession, "userActionHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (!objc_msgSend(v9, "actionType"))
        {
          v10 = v9;
          -[TIAsteriskCorrectionMessageEvent analyzeWordEntry:](self, "analyzeWordEntry:", v10);
          objc_msgSend(v10, "keyboardState");
          v11 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[TITypingSessionAligned alignedEntries](self->_messageAlignedSession, "alignedEntries", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        -[TIAsteriskCorrectionMessageEvent analyzeWordEntryAligned:](self, "analyzeWordEntryAligned:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v14);
  }

  v17 = [TIKBAnalyticsMetricsContext alloc];
  -[TITypingSession sessionParams](self->_messageSession, "sessionParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeInputModes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_messageSession, "sessionParams");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "testingParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v17, "initWithKeyboardState:activeInputModes:testingParameters:", v6, v19, v21);

  -[TITypingSession featureUsageMetricsCache](self->_messageSession, "featureUsageMetricsCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_messageSession, "sessionParams");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAsteriskCorrectionMessageEvent dispatchAsteriskEventWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:](self, "dispatchAsteriskEventWithFeatureUsageMetricsCache:andContext:assetAvailabilityStatus:", v23, v22, objc_msgSend(v24, "assetAvailabilityStatus"));

}

- (id)assessAsteriskCorrection
{
  NSString *messageText;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  uint64_t *v8;
  id *v10;
  int finalWordsEnteredCount;
  __CFString **v12;
  NSString *v13;
  NSString *wordCountType;
  id v15;
  void *v16;

  messageText = self->_messageText;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](messageText, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
    goto LABEL_18;
  v6 = objc_msgSend(v5, "_firstChar") == 42;
  v7 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
  v8 = &kTIACMessageHasNoCorrectionSymbol;
  if (v7 == 42 && !v6)
    v8 = &kTIACMessageEndsWithAsterisk;
  if (v6 && v7 != 42)
    v10 = (id *)&kTIACMessageBeginsWithAsterisk;
  else
    v10 = (id *)v8;
  objc_storeStrong((id *)&self->_asteriskCorrectionType, *v10);
  finalWordsEnteredCount = self->_finalWordsEnteredCount;
  if (finalWordsEnteredCount == 1)
  {
    v12 = &kTIACSingleWordCountType;
LABEL_14:
    v13 = *v12;
    wordCountType = self->_wordCountType;
    self->_wordCountType = v13;

    goto LABEL_15;
  }
  if (finalWordsEnteredCount >= 2)
  {
    v12 = &kTIACMultiWordCountType;
    goto LABEL_14;
  }
LABEL_15:
  if (!-[NSString isEqualToString:](self->_wordCountType, "isEqualToString:", kTIACMultiWordCountType)
    || !-[NSString isEqualToString:](self->_asteriskCorrectionType, "isEqualToString:", kTIACMessageHasNoCorrectionSymbol))
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), self->_wordCountType, self->_asteriskCorrectionType);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v15 = (id)kTIACCorrectionTypeNone;
LABEL_19:
  v16 = v15;

  return v16;
}

- (void)analyzeWordEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  NSString *v13;
  NSString *messageText;
  void *v15;
  char v16;
  _BOOL4 v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "keyboardState");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "contextBeforeInput");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EA1081D0;
  }

  objc_msgSend(v5, "contextAfterInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "contextAfterInput");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1EA1081D0;
  }

  objc_msgSend(v5, "selectedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "selectedText");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1EA1081D0;
  }

  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageText = self->_messageText;
  self->_messageText = v13;

  objc_msgSend(v4, "keyboardState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "emojiSearchMode");

  v17 = -[TIAsteriskCorrectionMessageEvent hasTextInWordEntry:](self, "hasTextInWordEntry:", v4);
  if ((v16 & 1) == 0 && v17)
    ++self->_wordsEnteredCount;

}

- (BOOL)hasTextInWordEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "acceptedCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIAsteriskCorrectionMessageEvent hasText:](self, "hasText:", v6);

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "allKeyboardInputs", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[TIAsteriskCorrectionMessageEvent hasText:](self, "hasText:", v14);

          if (v15)
          {
            v8 = 1;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_13:

  }
  return v8;
}

- (void)analyzeWordEntryAligned:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "originalWord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "originalWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "editedEntry");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  objc_msgSend(v7, "acceptedCandidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "keyboardState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "emojiSearchMode");

  objc_msgSend(v7, "keyboardState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "emojiPopoverMode");

  if (objc_msgSend(v12, "_containsEmoji"))
  {
    if (v16 || v14 || (objc_msgSend(v7, "wordEntryType") & 4) != 0)
      goto LABEL_7;
LABEL_10:
    -[TIAsteriskCorrectionMessageEvent adjustEmojiCountsFromKeyboardInputForWordAligned:](self, "adjustEmojiCountsFromKeyboardInputForWordAligned:", v17);
    goto LABEL_11;
  }
  if ((v14 & 1) != 0)
    goto LABEL_11;
  if (!objc_msgSend(v9, "isContinuousPathConversion"))
    goto LABEL_10;
LABEL_7:
  ++self->_finalWordsEnteredCount;
LABEL_11:

}

- (BOOL)hasText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "length") != 0;
  return (char)v7;
}

- (void)adjustEmojiCountsFromKeyboardInputForWordAligned:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "alignedKeyboardInputs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "_containsEmoji"))
        {
          ++v9;
          if (v7 > 0)
            ++v8;
          v7 = 0;
        }
        else
        {
          v7 += -[TIAsteriskCorrectionMessageEvent hasText:](self, "hasText:", v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);

    if (v7 <= 0)
      v13 = v8;
    else
      v13 = v8 + 1;
    if (v9 >= 1)
    {
      v13 += v9;
      self->_wordsEnteredCount = v13 + self->_wordsEnteredCount - 1;
    }
  }
  else
  {

    v13 = 0;
  }
  self->_finalWordsEnteredCount += v13;
}

- (void)dispatchAsteriskEventWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5
{
  id v8;
  id v9;
  NSString *bundleId;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[17];
  _QWORD v34[19];

  v34[17] = *MEMORY[0x1E0C80C00];
  if (self->_finalWordsEnteredCount >= 1)
  {
    v8 = a4;
    v9 = a3;
    -[TIAsteriskCorrectionMessageEvent assessAsteriskCorrection](self, "assessAsteriskCorrection");
    v34[0] = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v34[0];
    v33[0] = CFSTR("correctionType");
    v33[1] = CFSTR("prevMessageAutoCorrectionType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_prevMsgAutocorrectionType);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    bundleId = self->_bundleId;
    v34[1] = v31;
    v34[2] = bundleId;
    v33[2] = CFSTR("bundleId");
    v33[3] = kFeatureKeyboardUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v30;
    v33[4] = kFeatureContinuousPathUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v29;
    v33[5] = kFeatureAutocorrectionUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v28;
    v33[6] = kFeatureCandidateBarUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v27;
    v33[7] = kFeatureMultilingualUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = v26;
    v33[8] = kFeatureStringTypingSpeed;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v34[8] = v25;
    v33[9] = kFeatureStringAssetAvailabilityStatus;
    v11 = CFSTR("Installed");
    if (!a5)
      v11 = CFSTR("Unavailable");
    v12 = v11;
    v34[9] = v12;
    v33[10] = kFeatureStringKeyboardLanguage;
    objc_msgSend(v8, "inputLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[10] = v13;
    v33[11] = kFeatureStringKeyboardRegion;
    objc_msgSend(v8, "inputRegion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[11] = v14;
    v33[12] = kFeatureStringKeyboardVariant;
    objc_msgSend(v8, "inputVariant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[12] = v15;
    v33[13] = kFeatureStringKeyboardSecondaryLanguage;
    objc_msgSend(v8, "secondaryLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[13] = v16;
    v33[14] = kFeatureStringKeyboardSecondaryRegion;
    objc_msgSend(v8, "secondaryRegion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[14] = v17;
    v33[15] = kFeatureStringKeyboardLayout;
    objc_msgSend(v8, "layoutName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[15] = v18;
    v33[16] = kFeatureStringKeyboardType;
    +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", objc_msgSend(v8, "keyboardType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[16] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "testingParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "dispatchEventToInputAnalyticsDomainWithName:payload:testingParameters:allowSparsePayload:", CFSTR("asteriskCorrection"), v20, v22, 0);
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SpeedMetric");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "propogateMetrics:data:", v24, v20);

  }
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_storeStrong((id *)&self->_messageText, a3);
}

- (NSString)asteriskCorrectionType
{
  return self->_asteriskCorrectionType;
}

- (void)setAsteriskCorrectionType:(id)a3
{
  objc_storeStrong((id *)&self->_asteriskCorrectionType, a3);
}

- (NSString)wordCountType
{
  return self->_wordCountType;
}

- (void)setWordCountType:(id)a3
{
  objc_storeStrong((id *)&self->_wordCountType, a3);
}

- (unint64_t)prevMsgAutocorrectionType
{
  return self->_prevMsgAutocorrectionType;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int)wordsEnteredCount
{
  return self->_wordsEnteredCount;
}

- (void)setWordsEnteredCount:(int)a3
{
  self->_wordsEnteredCount = a3;
}

- (int)finalWordsEnteredCount
{
  return self->_finalWordsEnteredCount;
}

- (void)setFinalWordsEnteredCount:(int)a3
{
  self->_finalWordsEnteredCount = a3;
}

- (TITypingSession)messageSession
{
  return (TITypingSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TITypingSessionAligned)messageAlignedSession
{
  return (TITypingSessionAligned *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessageAlignedSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAlignedSession, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_wordCountType, 0);
  objc_storeStrong((id *)&self->_asteriskCorrectionType, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
}

@end
