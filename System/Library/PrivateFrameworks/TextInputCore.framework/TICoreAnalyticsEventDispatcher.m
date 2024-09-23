@implementation TICoreAnalyticsEventDispatcher

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  TICoreAnalyticsEventDispatcher *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[9];

  v29[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v23 = self;
  -[TICoreAnalyticsEventDispatcher setRevisionRateAnalyzer:](self, "setRevisionRateAnalyzer:", v8);

  v9 = (void *)objc_opt_new();
  v29[0] = v9;
  v10 = (void *)objc_opt_new();
  v29[1] = v10;
  v11 = (void *)objc_opt_new();
  v29[2] = v11;
  v12 = (void *)objc_opt_new();
  v29[3] = v12;
  v13 = (void *)objc_opt_new();
  v29[4] = v13;
  v14 = (void *)objc_opt_new();
  v29[5] = v14;
  v15 = (void *)objc_opt_new();
  v29[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "analyzeSession:alignedSession:withConfidence:", v6, v7, objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "evaluateConfidenceInSession:alignedSession:", v6, v7, v22));
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  objc_msgSend(v22, "analyzeSession:alignedSession:withConfidence:", v6, v7, objc_msgSend(v22, "evaluateConfidenceInSession:alignedSession:", v6, v7));
  -[TIRevisionRateAnalyzer setHasEmojiInput:](v23->_revisionRateAnalyzer, "setHasEmojiInput:", objc_msgSend(v22, "hasEmojiInput"));
  -[TIRevisionRateAnalyzer setHasCursorMovement:](v23->_revisionRateAnalyzer, "setHasCursorMovement:", objc_msgSend(v22, "hasCursorMovement"));
  -[TIRevisionRateAnalyzer analyzeSession:alignedSession:withConfidence:](v23->_revisionRateAnalyzer, "analyzeSession:alignedSession:withConfidence:", v6, v7, -[TIRevisionRateAnalyzer evaluateConfidenceInSession:alignedSession:](v23->_revisionRateAnalyzer, "evaluateConfidenceInSession:alignedSession:", v6, v7));

}

- (void)setRevisionRateAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_revisionRateAnalyzer, a3);
}

- (TIRevisionRateAnalyzer)revisionRateAnalyzer
{
  return self->_revisionRateAnalyzer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionRateAnalyzer, 0);
}

@end
