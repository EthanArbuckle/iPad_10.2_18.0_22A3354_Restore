@implementation TIMessageEvent

- (TIMessageEvent)init
{
  TIMessageEvent *v2;
  TIMessageEvent *v3;
  NSString *messageText;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIMessageEvent;
  v2 = -[TIMessageEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    messageText = v2->_messageText;
    v2->_messageText = (NSString *)&stru_1EA1081D0;

  }
  return v3;
}

- (void)analyzeWordEntry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  NSString *v10;
  NSString *messageText;
  double v12;
  double startTime;
  double v14;
  double v15;
  double v16;
  double endTime;
  double v18;
  void *v20;
  char v21;
  _BOOL4 v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentState");
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

  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  messageText = self->_messageText;
  self->_messageText = v10;

  objc_msgSend(v23, "startTime");
  if (v12 > 0.0)
  {
    startTime = self->_startTime;
    objc_msgSend(v23, "startTime");
    if (startTime >= v14)
      v15 = v14;
    else
      v15 = startTime;
    if (startTime != 0.0)
      v14 = v15;
    self->_startTime = v14;
  }
  objc_msgSend(v23, "endTime");
  if (v16 > 0.0)
  {
    endTime = self->_endTime;
    objc_msgSend(v23, "endTime");
    if (endTime >= v18 && endTime != 0.0)
      v18 = endTime;
    self->_endTime = v18;
  }
  objc_msgSend(v23, "keyboardState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "emojiSearchMode");

  v22 = -[TIMessageEvent hasTextInWordEntry:](self, "hasTextInWordEntry:", v23);
  if ((v21 & 1) == 0 && v22)
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
  v7 = -[TIMessageEvent hasText:](self, "hasText:", v6);

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
          v15 = -[TIMessageEvent hasText:](self, "hasText:", v14);

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
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "originalWord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "originalWord");
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

  if (!objc_msgSend(v12, "_containsEmoji"))
  {
    if ((v14 & 1) != 0)
      goto LABEL_12;
    if (objc_msgSend(v9, "isContinuousPathConversion"))
    {
      ++self->_finalWordsEnteredCount;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if ((v16 & 1) == 0)
  {
    if (v14)
    {
      ++self->_finalWordsEnteredCount;
      ++self->_emojiSearchCount;
LABEL_12:
      if (!objc_msgSend(v12, "length"))
        goto LABEL_41;
      goto LABEL_17;
    }
    if ((objc_msgSend(v7, "wordEntryType") & 4) != 0)
    {
      ++self->_finalWordsEnteredCount;
      ++self->_emojiPredictionCount;
      goto LABEL_17;
    }
LABEL_15:
    -[TIMessageEvent adjustEmojiCountsFromKeyboardInputForWordAligned:](self, "adjustEmojiCountsFromKeyboardInputForWordAligned:", v18);
    goto LABEL_17;
  }
  ++self->_finalWordsEnteredCount;
  ++self->_emojiPopoverCount;
  if (v14)
    goto LABEL_12;
LABEL_17:
  if ((objc_msgSend(v9, "sourceMask") & 0x8000) != 0 || (objc_msgSend(v9, "sourceMask") & 0x20000) != 0)
    ++self->_staticCount;
  if ((objc_msgSend(v9, "sourceMask") & 0x10000) != 0 || (objc_msgSend(v9, "sourceMask") & 0x40000) != 0)
    ++self->_dynamicCount;
  if ((objc_msgSend(v9, "sourceMask") & 4) != 0)
    ++self->_textReplacementsCount;
  if ((objc_msgSend(v9, "sourceMask") & 8) != 0)
    ++self->_addressBookCount;
  if ((objc_msgSend(v9, "sourceMask") & 0x10) != 0)
    ++self->_namedEntitiesCount;
  if ((objc_msgSend(v9, "sourceMask") & 0x20) != 0)
    ++self->_oovCount;
  if ((objc_msgSend(v9, "sourceMask") & 0x400) != 0)
    ++self->_supplementalLexiconCount;
  if (objc_msgSend(v9, "isResponseKitCandidate"))
    ++self->_responseKitCount;
  if (objc_msgSend(v7, "isMultilingual"))
    ++self->_multilingualCount;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "proactiveTrigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      ++self->_pqtCount;

  }
LABEL_41:

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
          v7 += -[TIMessageEvent hasText:](self, "hasText:", v12);
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
      self->_emojiPlaneCount += v9;
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

- (void)dispatchWithFeatureUsageMetricsCache:(id)a3 andContext:(id)a4 assetAvailabilityStatus:(int64_t)a5
{
  NSString *messageText;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[36];
  _QWORD v92[38];

  v92[36] = *MEMORY[0x1E0C80C00];
  if (self->_wordsEnteredCount >= 1)
  {
    messageText = self->_messageText;
    v8 = a4;
    v9 = a3;
    v10 = -[NSString _graphemeCount](messageText, "_graphemeCount");
    v11 = -[TIMessageEvent durationInSecondsFromStartTime:endTime:](self, "durationInSecondsFromStartTime:endTime:", self->_startTime, self->_endTime);
    v91[0] = CFSTR("totalMessageDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v90;
    v91[1] = CFSTR("totalMessageLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v89;
    v91[2] = CFSTR("totalWordsEntered");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_wordsEnteredCount);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v88;
    v91[3] = CFSTR("totalFinalWordEntered");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_finalWordsEnteredCount);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v87;
    v91[4] = CFSTR("messageDuration");
    v12 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bucketNumber:bucketThresholds:bucketValues:", v86, &unk_1EA140150, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v85;
    v91[5] = CFSTR("messageLength");
    v13 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bucketNumber:bucketThresholds:bucketValues:", v84, &unk_1EA140168, 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v92[5] = v83;
    v91[6] = CFSTR("wordsEntered");
    v14 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_wordsEnteredCount);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bucketNumber:bucketThresholds:bucketValues:", v82, &unk_1EA140180, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v92[6] = v81;
    v91[7] = CFSTR("finalWordEntered");
    v15 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_finalWordsEnteredCount);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bucketNumber:bucketThresholds:bucketValues:", v80, &unk_1EA140180, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v92[7] = v79;
    v91[8] = CFSTR("static");
    v16 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_staticCount);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bucketNumber:bucketThresholds:bucketValues:", v78, &unk_1EA140180, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v92[8] = v77;
    v91[9] = CFSTR("dynamic");
    v17 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dynamicCount);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bucketNumber:bucketThresholds:bucketValues:", v76, &unk_1EA140180, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v92[9] = v75;
    v91[10] = CFSTR("textReplacements");
    v18 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_textReplacementsCount);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bucketNumber:bucketThresholds:bucketValues:", v74, &unk_1EA140198, 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v92[10] = v73;
    v91[11] = CFSTR("addressBook");
    v19 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_addressBookCount);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bucketNumber:bucketThresholds:bucketValues:", v72, &unk_1EA140198, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v92[11] = v71;
    v91[12] = CFSTR("namedEntities");
    v20 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_namedEntitiesCount);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bucketNumber:bucketThresholds:bucketValues:", v68, &unk_1EA140198, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v92[12] = v67;
    v91[13] = CFSTR("oov");
    v21 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_oovCount);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bucketNumber:bucketThresholds:bucketValues:", v66, &unk_1EA140198, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v92[13] = v65;
    v91[14] = CFSTR("supplementalLexicon");
    v22 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_supplementalLexiconCount);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bucketNumber:bucketThresholds:bucketValues:", v64, &unk_1EA140198, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v92[14] = v63;
    v91[15] = CFSTR("emojiPlane");
    v23 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_emojiPlaneCount);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bucketNumber:bucketThresholds:bucketValues:", v62, &unk_1EA140198, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v92[15] = v61;
    v91[16] = CFSTR("emojiPrediction");
    v24 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_emojiPredictionCount);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bucketNumber:bucketThresholds:bucketValues:", v60, &unk_1EA140198, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v92[16] = v59;
    v91[17] = CFSTR("emojiSearch");
    v25 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_emojiSearchCount);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bucketNumber:bucketThresholds:bucketValues:", v58, &unk_1EA140198, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v92[17] = v57;
    v91[18] = CFSTR("emojiPopover");
    v26 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_emojiPopoverCount);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bucketNumber:bucketThresholds:bucketValues:", v56, &unk_1EA140198, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v92[18] = v55;
    v91[19] = CFSTR("responseKit");
    v27 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_responseKitCount);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bucketNumber:bucketThresholds:bucketValues:", v54, &unk_1EA140198, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v92[19] = v53;
    v91[20] = CFSTR("pqt");
    v28 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pqtCount);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bucketNumber:bucketThresholds:bucketValues:", v52, &unk_1EA140198, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v92[20] = v51;
    v91[21] = CFSTR("multilingual");
    v29 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_multilingualCount);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bucketNumber:bucketThresholds:bucketValues:", v50, &unk_1EA140198, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v92[21] = v49;
    v91[22] = kFeatureKeyboardUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v92[22] = v48;
    v91[23] = kFeatureContinuousPathUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v92[23] = v47;
    v91[24] = kFeatureAutocorrectionUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v92[24] = v46;
    v91[25] = kFeatureCandidateBarUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v92[25] = v45;
    v91[26] = kFeatureMultilingualUsage;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v92[26] = v44;
    v91[27] = kFeatureStringTypingSpeed;
    objc_msgSend(v9, "featureUsageMetricFromName:forContext:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v92[27] = v30;
    v91[28] = kFeatureStringAssetAvailabilityStatus;
    v31 = CFSTR("Installed");
    if (!a5)
      v31 = CFSTR("Unavailable");
    v32 = v31;
    v92[28] = v32;
    v91[29] = kFeatureStringKeyboardLanguage;
    objc_msgSend(v8, "inputLanguage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v92[29] = v33;
    v91[30] = kFeatureStringKeyboardRegion;
    objc_msgSend(v8, "inputRegion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v92[30] = v34;
    v91[31] = kFeatureStringKeyboardVariant;
    objc_msgSend(v8, "inputVariant");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v92[31] = v35;
    v91[32] = kFeatureStringKeyboardSecondaryLanguage;
    objc_msgSend(v8, "secondaryLanguage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v92[32] = v36;
    v91[33] = kFeatureStringKeyboardSecondaryRegion;
    objc_msgSend(v8, "secondaryRegion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v92[33] = v37;
    v91[34] = kFeatureStringKeyboardLayout;
    objc_msgSend(v8, "layoutName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v92[34] = v38;
    v91[35] = kFeatureStringKeyboardType;
    +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", objc_msgSend(v8, "keyboardType"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v92[35] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 36);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "testingParameters");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("typingSpeedDetails"), v70, v41, 0);
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SpeedMetric");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "propogateMetrics:data:", v43, v70);

  }
}

- (int)durationInSecondsFromStartTime:(double)a3 endTime:(double)a4
{
  return (int)(a4 - a3 + 0.5);
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
  objc_storeStrong((id *)&self->_messageText, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
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

- (int)staticCount
{
  return self->_staticCount;
}

- (void)setStaticCount:(int)a3
{
  self->_staticCount = a3;
}

- (int)dynamicCount
{
  return self->_dynamicCount;
}

- (void)setDynamicCount:(int)a3
{
  self->_dynamicCount = a3;
}

- (int)textReplacementsCount
{
  return self->_textReplacementsCount;
}

- (void)setTextReplacementsCount:(int)a3
{
  self->_textReplacementsCount = a3;
}

- (int)addressBookCount
{
  return self->_addressBookCount;
}

- (void)setAddressBookCount:(int)a3
{
  self->_addressBookCount = a3;
}

- (int)namedEntitiesCount
{
  return self->_namedEntitiesCount;
}

- (void)setNamedEntitiesCount:(int)a3
{
  self->_namedEntitiesCount = a3;
}

- (int)oovCount
{
  return self->_oovCount;
}

- (void)setOovCount:(int)a3
{
  self->_oovCount = a3;
}

- (int)supplementalLexiconCount
{
  return self->_supplementalLexiconCount;
}

- (void)setSupplementalLexiconCount:(int)a3
{
  self->_supplementalLexiconCount = a3;
}

- (int)emojiPlaneCount
{
  return self->_emojiPlaneCount;
}

- (void)setEmojiPlaneCount:(int)a3
{
  self->_emojiPlaneCount = a3;
}

- (int)emojiPredictionCount
{
  return self->_emojiPredictionCount;
}

- (void)setEmojiPredictionCount:(int)a3
{
  self->_emojiPredictionCount = a3;
}

- (int)emojiSearchCount
{
  return self->_emojiSearchCount;
}

- (void)setEmojiSearchCount:(int)a3
{
  self->_emojiSearchCount = a3;
}

- (int)emojiPopoverCount
{
  return self->_emojiPopoverCount;
}

- (void)setEmojiPopoverCount:(int)a3
{
  self->_emojiPopoverCount = a3;
}

- (int)responseKitCount
{
  return self->_responseKitCount;
}

- (void)setResponseKitCount:(int)a3
{
  self->_responseKitCount = a3;
}

- (int)pqtCount
{
  return self->_pqtCount;
}

- (void)setPqtCount:(int)a3
{
  self->_pqtCount = a3;
}

- (int)multilingualCount
{
  return self->_multilingualCount;
}

- (void)setMultilingualCount:(int)a3
{
  self->_multilingualCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
}

@end
