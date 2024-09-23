@implementation SOSVoiceUtterer

- (void)dealloc
{
  objc_super v3;

  -[SOSVoiceUtterer stopSpeaking](self, "stopSpeaking");
  -[AVSpeechSynthesizer setDelegate:](self->_voiceSynthesizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SOSVoiceUtterer;
  -[SOSVoiceUtterer dealloc](&v3, sel_dealloc);
}

- (void)speakUtterances:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sos_voice_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSVoiceUtterer routeDescription](self, "routeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Speaking utterances to %{public}@: %@", buf, 0x16u);

  }
  -[SOSVoiceUtterer stopSpeaking](self, "stopSpeaking");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "avSpeechUtterance", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (v8)
  {
    objc_storeStrong((id *)&self->_sosUtterancesBeingSpoken, a3);
    objc_storeStrong((id *)&self->_avUtterancesBeingSpoken, v8);
    -[SOSVoiceUtterer _speakUtteranceAtIndex:](self, "_speakUtteranceAtIndex:", 0);
  }
  else
  {
    sos_voice_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SOSVoiceUtterer speakUtterances:].cold.1((uint64_t)v9, v15);

  }
}

- (void)stopSpeaking
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_voice_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSVoiceUtterer routeDescription](self, "routeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping speaking utterances to %{public}@...", (uint8_t *)&v5, 0xCu);

  }
  -[SOSVoiceUtterer _forgetUtterancesBeingSpoken](self, "_forgetUtterancesBeingSpoken");
  -[AVSpeechSynthesizer stopSpeakingAtBoundary:](self->_voiceSynthesizer, "stopSpeakingAtBoundary:", 0);
}

- (void)_forgetUtterancesBeingSpoken
{
  NSArray *sosUtterancesBeingSpoken;
  NSArray *avUtterancesBeingSpoken;

  sosUtterancesBeingSpoken = self->_sosUtterancesBeingSpoken;
  self->_sosUtterancesBeingSpoken = 0;

  avUtterancesBeingSpoken = self->_avUtterancesBeingSpoken;
  self->_avUtterancesBeingSpoken = 0;

}

- (BOOL)isSpeaking
{
  return -[NSArray count](self->_avUtterancesBeingSpoken, "count") != 0;
}

- (void)setMixToTelephonyUplink:(BOOL)a3
{
  self->_mixToTelephonyUplink = a3;
  -[AVSpeechSynthesizer setMixToTelephonyUplink:](self->_voiceSynthesizer, "setMixToTelephonyUplink:");
}

- (AVSpeechSynthesizer)voiceSynthesizer
{
  AVSpeechSynthesizer *voiceSynthesizer;
  AVSpeechSynthesizer *v4;
  AVSpeechSynthesizer *v5;

  voiceSynthesizer = self->_voiceSynthesizer;
  if (!voiceSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init(MEMORY[0x1E0C89B98]);
    v5 = self->_voiceSynthesizer;
    self->_voiceSynthesizer = v4;

    -[AVSpeechSynthesizer setDelegate:](self->_voiceSynthesizer, "setDelegate:", self);
    -[AVSpeechSynthesizer setUsesApplicationAudioSession:](self->_voiceSynthesizer, "setUsesApplicationAudioSession:", 0);
    -[AVSpeechSynthesizer setMixToTelephonyUplink:](self->_voiceSynthesizer, "setMixToTelephonyUplink:", -[SOSVoiceUtterer mixToTelephonyUplink](self, "mixToTelephonyUplink"));
    voiceSynthesizer = self->_voiceSynthesizer;
  }
  return voiceSynthesizer;
}

- (void)_speakAVUtterance:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_voice_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSVoiceUtterer routeDescription](self, "routeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Speaking avUtterance in %{public}@ audio: %@", (uint8_t *)&v8, 0x16u);

  }
  -[SOSVoiceUtterer voiceSynthesizer](self, "voiceSynthesizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speakUtterance:", v4);

}

- (void)_speakUtteranceAtIndex:(unint64_t)a3
{
  NSArray **p_avUtterancesBeingSpoken;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_avUtterancesBeingSpoken = &self->_avUtterancesBeingSpoken;
  v6 = -[NSArray count](self->_avUtterancesBeingSpoken, "count");
  sos_voice_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOSVoiceUtterer _speakUtteranceAtIndex:].cold.1((id *)p_avUtterancesBeingSpoken, a3, v8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSArray count](*p_avUtterancesBeingSpoken, "count");
      v13 = 134218240;
      v14 = a3;
      v15 = 2048;
      v16 = v9;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "_speakUtteranceAtIndex:%tu / %tu", (uint8_t *)&v13, 0x16u);
    }

    -[SOSVoiceUtterer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SOSVoiceUtterer delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOSVoiceUtterer sosUtterancesBeingSpoken](self, "sosUtterancesBeingSpoken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "voiceUtterer:willStartSpeakingUtteranceAtIndex:fromUtterances:", self, a3, v12);

    }
    -[NSArray objectAtIndexedSubscript:](self->_avUtterancesBeingSpoken, "objectAtIndexedSubscript:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    -[SOSVoiceUtterer _speakAVUtterance:](self, "_speakAVUtterance:", v8);
  }

}

- (id)routeDescription
{
  if (-[SOSVoiceUtterer mixToTelephonyUplink](self, "mixToTelephonyUplink"))
    return CFSTR("[call uplink]");
  else
    return CFSTR("[local speaker]");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SOSVoiceUtterer routeDescription](self, "routeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p route=%@ _voiceSynthesizer=%@"), v4, self, v5, self->_voiceSynthesizer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  SOSVoiceUtterer *v5;
  NSUInteger v6;
  NSObject *v7;
  NSArray *avUtterancesBeingSpoken;
  NSObject *v9;
  NSArray *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSUInteger v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  SOSVoiceUtterer *v19;
  __int16 v20;
  NSUInteger v21;
  __int16 v22;
  SOSVoiceUtterer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (SOSVoiceUtterer *)a4;
  v6 = -[NSArray indexOfObject:](self->_avUtterancesBeingSpoken, "indexOfObject:", v5);
  sos_voice_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    avUtterancesBeingSpoken = self->_avUtterancesBeingSpoken;
    v18 = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = (NSUInteger)avUtterancesBeingSpoken;
    v22 = 2114;
    v23 = self;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_INFO, "didFinishSpeechUtterance, utterance:%@, _avUtterancesBeingSpoken:%@ [%{public}@]", (uint8_t *)&v18, 0x20u);
  }

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sos_voice_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_avUtterancesBeingSpoken;
      v18 = 138412802;
      v19 = v5;
      v20 = 2112;
      v21 = (NSUInteger)v10;
      v22 = 2114;
      v23 = self;
      _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance, utteranceIndex not found => NOP; utterance:%@, _avUtterancesBeingSpoken:%@ [%{public}@]",
        (uint8_t *)&v18,
        0x20u);
    }
LABEL_17:

    goto LABEL_18;
  }
  v11 = -[NSArray count](self->_avUtterancesBeingSpoken, "count");
  sos_voice_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 + 1 >= v11)
  {
    if (v13)
    {
      v18 = 138543362;
      v19 = self;
      _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance called, completed utterances [%{public}@]", (uint8_t *)&v18, 0xCu);
    }

    -[SOSVoiceUtterer sosUtterancesBeingSpoken](self, "sosUtterancesBeingSpoken");
    v9 = objc_claimAutoreleasedReturnValue();
    -[SOSVoiceUtterer _forgetUtterancesBeingSpoken](self, "_forgetUtterancesBeingSpoken");
    -[SOSVoiceUtterer delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sos_voice_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = self;
        _os_log_impl(&dword_1AF4DC000, v16, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance called, completed utterances; notifying delegate [%{public}@]",
          (uint8_t *)&v18,
          0xCu);
      }

      -[SOSVoiceUtterer delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "voiceUtterer:didFinishSpeakingUtterances:", self, v9);

    }
    goto LABEL_17;
  }
  if (v13)
  {
    v14 = -[NSArray count](self->_avUtterancesBeingSpoken, "count");
    v18 = 134218498;
    v19 = (SOSVoiceUtterer *)v6;
    v20 = 2048;
    v21 = v14;
    v22 = 2114;
    v23 = self;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeechUtterance, _avUtterancesBeingSpoken index: %lu out of: %lu [%{public}@]", (uint8_t *)&v18, 0x20u);
  }

  if (self->_voiceSynthesizer)
    -[SOSVoiceUtterer _speakUtteranceAtIndex:](self, "_speakUtteranceAtIndex:", v6 + 1);
LABEL_18:

}

- (SOSVoiceUttererDelegate)delegate
{
  return (SOSVoiceUttererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)mixToTelephonyUplink
{
  return self->_mixToTelephonyUplink;
}

- (void)setVoiceSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSynthesizer, a3);
}

- (NSArray)sosUtterancesBeingSpoken
{
  return self->_sosUtterancesBeingSpoken;
}

- (void)setSosUtterancesBeingSpoken:(id)a3
{
  objc_storeStrong((id *)&self->_sosUtterancesBeingSpoken, a3);
}

- (NSArray)avUtterancesBeingSpoken
{
  return self->_avUtterancesBeingSpoken;
}

- (void)setAvUtterancesBeingSpoken:(id)a3
{
  objc_storeStrong((id *)&self->_avUtterancesBeingSpoken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avUtterancesBeingSpoken, 0);
  objc_storeStrong((id *)&self->_sosUtterancesBeingSpoken, 0);
  objc_storeStrong((id *)&self->_voiceSynthesizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)speakUtterances:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "No avUtterancesToSpeak; speakUtterances: %@",
    (uint8_t *)&v2,
    0xCu);
}

- (void)_speakUtteranceAtIndex:(NSObject *)a3 .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a1, "count");
  v6 = 134218240;
  v7 = a2;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_1AF4DC000, a3, OS_LOG_TYPE_ERROR, "_speakUtteranceAtIndex asked to use out of range index:%tu of %tu", (uint8_t *)&v6, 0x16u);
}

@end
