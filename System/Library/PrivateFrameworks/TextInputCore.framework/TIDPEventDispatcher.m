@implementation TIDPEventDispatcher

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TIDPUnknownTokenRecorder *v9;
  TIDPNamedEntityTokenRecorder *v10;
  TIDPNgramRecorderRandom *v11;
  TIDPBiomeEmojiTokenRecorder *v12;
  TIDPBiomeNamedEntityTokenRecorder *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  TIDPBiomeUnigramTokenRecorder *v20;
  TIDPNamedEntityTokenRecorder *v21;
  TIDPUnknownTokenRecorder *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_doesSessionContainValidStrings(v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    v9 = -[TIDPRecorder initWithTypingSession:aligned:]([TIDPUnknownTokenRecorder alloc], "initWithTypingSession:aligned:", v6, v7);
    v10 = -[TIDPRecorder initWithTypingSession:aligned:]([TIDPNamedEntityTokenRecorder alloc], "initWithTypingSession:aligned:", v6, v7);
    v22 = v9;
    objc_msgSend(v8, "addObject:", v9);
    v21 = v10;
    objc_msgSend(v8, "addObject:", v10);
    if (_isSessionAlignedConfidently(v7))
    {
      v11 = -[TIDPNgramRecorderRandom initWithTypingSession:aligned:n:]([TIDPNgramRecorderRandom alloc], "initWithTypingSession:aligned:n:", v6, v7, 5);
      objc_msgSend(v8, "addObject:", v11);

    }
    v20 = -[TIDPRecorder initWithTypingSession:aligned:]([TIDPBiomeUnigramTokenRecorder alloc], "initWithTypingSession:aligned:", v6, v7);
    objc_msgSend(v8, "addObject:");
    v12 = -[TIDPRecorder initWithTypingSession:aligned:]([TIDPBiomeEmojiTokenRecorder alloc], "initWithTypingSession:aligned:", v6, v7);
    objc_msgSend(v8, "addObject:", v12);
    v13 = -[TIDPRecorder initWithTypingSession:aligned:]([TIDPBiomeNamedEntityTokenRecorder alloc], "initWithTypingSession:aligned:", v6, v7);
    objc_msgSend(v8, "addObject:", v13);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v18);
          if (self->_reportingDelegate)
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "setDelegate:");
          objc_msgSend(v19, "report");
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

  }
}

- (TIDPEventDispatcher)initWithReportingDelegate:(id)a3
{
  id v5;
  TIDPEventDispatcher *v6;
  TIDPEventDispatcher *v7;

  v5 = a3;
  v6 = -[TIDPEventDispatcher init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reportingDelegate, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDelegate, 0);
}

@end
