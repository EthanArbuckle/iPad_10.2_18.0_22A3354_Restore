@implementation TITypingSessionBenchmarkAnalyzer

- (void)dispatchEvent
{
  void *v3;
  void *v4;
  TIKBAnalyticsMetricsContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TIKBAnalyticsMetricsContext *v10;
  void *v11;
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
  _QWORD v30[15];
  _QWORD v31[17];

  v31[15] = *MEMORY[0x1E0C80C00];
  -[TITypingSession userActionHistory](self->_session, "userActionHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [TIKBAnalyticsMetricsContext alloc];
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "testingParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v5, "initWithKeyboardState:activeInputModes:testingParameters:", v29, v7, v9);

  v30[0] = CFSTR("typingSessionConfidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_typingSessionConfidence);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  v30[1] = kFeatureStringSessionAlignmentConfidence;
  objc_msgSend(MEMORY[0x1E0DBDB38], "bucketRatioWithValue:bucketCount:", 10, self->_sessionAlignmentConfidence);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  v30[2] = CFSTR("candidatesAccepted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TITypingSession candidatesAccepted](self->_session, "candidatesAccepted"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v26;
  v30[3] = CFSTR("candidatesAcceptedWithText");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[TITypingSession candidatesAcceptedWithText](self->_session, "candidatesAcceptedWithText"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v25;
  v30[4] = CFSTR("sessionWords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionWords);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v24;
  v30[5] = CFSTR("sessionWordsWithText");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionWordsWithText);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v23;
  v30[6] = CFSTR("alignedWords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_alignedWords);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v22;
  v30[7] = CFSTR("alignedWordsWithText");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_alignedWordsWithText);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v11;
  v30[8] = kFeatureStringKeyboardLanguage;
  -[TIAnalyticsMetricsContext inputLanguage](v10, "inputLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v12;
  v30[9] = kFeatureStringKeyboardRegion;
  -[TIAnalyticsMetricsContext inputRegion](v10, "inputRegion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v13;
  v30[10] = kFeatureStringKeyboardVariant;
  -[TIKBAnalyticsMetricsContext inputVariant](v10, "inputVariant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v14;
  v30[11] = kFeatureStringKeyboardSecondaryLanguage;
  -[TIKBAnalyticsMetricsContext secondaryLanguage](v10, "secondaryLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v15;
  v30[12] = kFeatureStringKeyboardSecondaryRegion;
  -[TIKBAnalyticsMetricsContext secondaryRegion](v10, "secondaryRegion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v16;
  v30[13] = kFeatureStringKeyboardLayout;
  -[TIKBAnalyticsMetricsContext layoutName](v10, "layoutName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v17;
  v30[14] = kFeatureStringKeyboardType;
  +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", -[TIKBAnalyticsMetricsContext keyboardType](v10, "keyboardType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKBAnalyticsMetricsContext testingParameters](v10, "testingParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("typingSessionBenchmark"), v19, v21, 0);

}

- (void)registerEventSpec
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[17];

  v21[15] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("typingSessionConfidence"), &unk_1EA1403F0, &unk_1EA140408, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", kFeatureStringSessionAlignmentConfidence, &unk_1EA1403F0, &unk_1EA140420, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("candidatesAccepted"), &unk_1EA1403F0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v18;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("candidatesAcceptedWithText"), &unk_1EA1403F0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("sessionWords"), &unk_1EA1403F0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("sessionWordsWithText"), &unk_1EA1403F0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("alignedWords"), &unk_1EA1403F0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v13;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("alignedWordsWithText"), &unk_1EA1403F0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v2;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v3;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v4;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v5;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v6;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v7;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v8;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("typingSessionBenchmark"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerEventSpec:", v11);

}

- (TITypingSessionBenchmarkAnalyzer)init
{
  TITypingSessionBenchmarkAnalyzer *v2;
  TITypingSessionBenchmarkAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypingSessionBenchmarkAnalyzer;
  v2 = -[TITypingSessionBenchmarkAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TITypingSessionBenchmarkAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9;
  id v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    v29 = v10;
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    self->_typingSessionConfidence = a5;
    +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:](TIStandardTypingSessionConfidenceEvaluator, "calculateAlignedTypingSessionConfidence:", self->_alignedSession);
    self->_sessionAlignmentConfidence = v11;
    self->_sessionWords = 0;
    self->_sessionWordsWithText = 0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v9, "userActionHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (!objc_msgSend(v17, "actionType"))
          {
            ++self->_sessionWords;
            v18 = (void *)MEMORY[0x1E0DBDB38];
            objc_msgSend(v17, "acceptedString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v18) = objc_msgSend(v18, "hasNonWhitespaceNonPunctuationText:", v19);

            if ((_DWORD)v18)
              ++self->_sessionWordsWithText;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    self->_alignedWords = 0;
    self->_alignedWordsWithText = 0;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[TITypingSessionAligned alignedEntries](self->_alignedSession, "alignedEntries");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          ++self->_alignedWords;
          v26 = (void *)MEMORY[0x1E0DBDB38];
          objc_msgSend(v25, "expectedString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v26) = objc_msgSend(v26, "hasNonWhitespaceNonPunctuationText:", v27);

          if ((_DWORD)v26)
            ++self->_alignedWordsWithText;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v22);
    }

    -[TITypingSessionBenchmarkAnalyzer dispatchEvent](self, "dispatchEvent");
    v10 = v29;
  }

  return a5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignedSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
