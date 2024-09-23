@implementation FTBlazarSpeechTranslationMessage

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3
{
  return -[FTBlazarSpeechTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTBlazarSpeechTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4
{
  return -[FTBlazarSpeechTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTBlazarSpeechTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarSpeechTranslationMessage *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTBlazarSpeechTranslationMessage *v10;
  FTBlazarSpeechTranslationMessage *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::BlazarSpeechTranslationMessage *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTBlazarSpeechTranslationMessage *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTBlazarSpeechTranslationMessage;
  v10 = -[FTBlazarSpeechTranslationMessage init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_15;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const BlazarSpeechTranslationMessage *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_15;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_249338830;
      v28 = 0;
      LOBYTE(v29) = 1;
      root = (siri::speech::qss_fb::BlazarSpeechTranslationMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::BlazarSpeechTranslationMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_15:
          v23 = 0;
          goto LABEL_16;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_16:

  return v23;
}

- (int64_t)session_message_type
{
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTStartSpeechTranslationRequest)session_messageAsFTStartSpeechTranslationRequest
{
  FTStartSpeechTranslationRequest *v3;
  FTStartSpeechTranslationRequest *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTStartSpeechTranslationRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTStartSpeechTranslationRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTLanguageDetected)session_messageAsFTLanguageDetected
{
  FTLanguageDetected *v3;
  FTLanguageDetected *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTLanguageDetected *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTLanguageDetected alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTLanguageDetected initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  FTAudioPacket *v3;
  FTAudioPacket *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTAudioPacket *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAudioPacket initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationAudioPacket)session_messageAsFTSpeechTranslationAudioPacket
{
  FTSpeechTranslationAudioPacket *v3;
  FTSpeechTranslationAudioPacket *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationAudioPacket *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationAudioPacket initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  FTFinishAudio *v3;
  FTFinishAudio *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTFinishAudio *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTFinishAudio alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTFinishAudio initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetEndpointerState)session_messageAsFTSetEndpointerState
{
  FTSetEndpointerState *v3;
  FTSetEndpointerState *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSetEndpointerState *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSetEndpointerState alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSetEndpointerState initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  FTResetServerEndpointer *v3;
  FTResetServerEndpointer *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTResetServerEndpointer *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTResetServerEndpointer alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTResetServerEndpointer initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTStartSpeechTranslationLoggingRequest)session_messageAsFTStartSpeechTranslationLoggingRequest
{
  FTStartSpeechTranslationLoggingRequest *v3;
  FTStartSpeechTranslationLoggingRequest *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTStartSpeechTranslationLoggingRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTStartSpeechTranslationLoggingRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTStartSpeechTranslationLoggingRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationPartialRecognitionResponse)session_messageAsFTSpeechTranslationPartialRecognitionResponse
{
  FTSpeechTranslationPartialRecognitionResponse *v3;
  FTSpeechTranslationPartialRecognitionResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationPartialRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationPartialRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationPartialRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationFinalRecognitionResponse)session_messageAsFTSpeechTranslationFinalRecognitionResponse
{
  FTSpeechTranslationFinalRecognitionResponse *v3;
  FTSpeechTranslationFinalRecognitionResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationFinalRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationFinalRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationFinalRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  FTAudioLimitExceeded *v3;
  FTAudioLimitExceeded *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTAudioLimitExceeded *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAudioLimitExceeded alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAudioLimitExceeded initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationMtResponse)session_messageAsFTSpeechTranslationMtResponse
{
  FTSpeechTranslationMtResponse *v3;
  FTSpeechTranslationMtResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationMtResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationMtResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationMtResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationTextToSpeechResponse)session_messageAsFTSpeechTranslationTextToSpeechResponse
{
  FTSpeechTranslationTextToSpeechResponse *v3;
  FTSpeechTranslationTextToSpeechResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationTextToSpeechResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationTextToSpeechResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationTextToSpeechResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  FTFinalBlazarResponse *v3;
  FTFinalBlazarResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTFinalBlazarResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTFinalBlazarResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTFinalBlazarResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionProgress)session_messageAsFTRecognitionProgress
{
  FTRecognitionProgress *v3;
  FTRecognitionProgress *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTRecognitionProgress *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTRecognitionProgress alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTRecognitionProgress initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionCandidate)session_messageAsFTRecognitionCandidate
{
  FTRecognitionCandidate *v3;
  FTRecognitionCandidate *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTRecognitionCandidate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTRecognitionCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTRecognitionCandidate initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRequestStatsResponse)session_messageAsFTRequestStatsResponse
{
  FTRequestStatsResponse *v3;
  FTRequestStatsResponse *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTRequestStatsResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTRequestStatsResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTRequestStatsResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTServerEndpointFeatures)session_messageAsFTServerEndpointFeatures
{
  FTServerEndpointFeatures *v3;
  FTServerEndpointFeatures *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 18)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTServerEndpointFeatures *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTServerEndpointFeatures alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTServerEndpointFeatures initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTClientSetupInfo)session_messageAsFTClientSetupInfo
{
  FTClientSetupInfo *v3;
  FTClientSetupInfo *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 19)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTClientSetupInfo *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTClientSetupInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTClientSetupInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationServerEndpointFeatures)session_messageAsFTSpeechTranslationServerEndpointFeatures
{
  FTSpeechTranslationServerEndpointFeatures *v3;
  FTSpeechTranslationServerEndpointFeatures *v4;
  const BlazarSpeechTranslationMessage *root;
  const BlazarSpeechTranslationMessage *v6;
  uint64_t v7;
  const BlazarSpeechTranslationMessage *v8;

  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSpeechTranslationServerEndpointFeatures *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSpeechTranslationServerEndpointFeatures alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSpeechTranslationServerEndpointFeatures initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)session_message
{
  void *v3;

  switch(-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type"))
  {
    case 1:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTStartSpeechTranslationRequest](self, "session_messageAsFTStartSpeechTranslationRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTLanguageDetected](self, "session_messageAsFTLanguageDetected");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTAudioPacket](self, "session_messageAsFTAudioPacket");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationAudioPacket](self, "session_messageAsFTSpeechTranslationAudioPacket");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTFinishAudio](self, "session_messageAsFTFinishAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSetEndpointerState](self, "session_messageAsFTSetEndpointerState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTResetServerEndpointer](self, "session_messageAsFTResetServerEndpointer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTStartSpeechTranslationLoggingRequest](self, "session_messageAsFTStartSpeechTranslationLoggingRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationPartialRecognitionResponse](self, "session_messageAsFTSpeechTranslationPartialRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationFinalRecognitionResponse](self, "session_messageAsFTSpeechTranslationFinalRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTAudioLimitExceeded](self, "session_messageAsFTAudioLimitExceeded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationMtResponse](self, "session_messageAsFTSpeechTranslationMtResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationTextToSpeechResponse](self, "session_messageAsFTSpeechTranslationTextToSpeechResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTFinalBlazarResponse](self, "session_messageAsFTFinalBlazarResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTRecognitionProgress](self, "session_messageAsFTRecognitionProgress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTRecognitionCandidate](self, "session_messageAsFTRecognitionCandidate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTRequestStatsResponse](self, "session_messageAsFTRequestStatsResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTServerEndpointFeatures](self, "session_messageAsFTServerEndpointFeatures");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTClientSetupInfo](self, "session_messageAsFTClientSetupInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationServerEndpointFeatures](self, "session_messageAsFTSpeechTranslationServerEndpointFeatures");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)session_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)session_message_typeForImmutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::BlazarSpeechTranslationMessage>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
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
  uint64_t v32;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v5 = -[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type");
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 1)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTStartSpeechTranslationRequest](self, "session_messageAsFTStartSpeechTranslationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 2)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTLanguageDetected](self, "session_messageAsFTLanguageDetected");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 3)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTAudioPacket](self, "session_messageAsFTAudioPacket");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 4)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationAudioPacket](self, "session_messageAsFTSpeechTranslationAudioPacket");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 5)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTFinishAudio](self, "session_messageAsFTFinishAudio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 6)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSetEndpointerState](self, "session_messageAsFTSetEndpointerState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 7)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTResetServerEndpointer](self, "session_messageAsFTResetServerEndpointer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v47 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 8)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTStartSpeechTranslationLoggingRequest](self, "session_messageAsFTStartSpeechTranslationLoggingRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v46 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 9)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationPartialRecognitionResponse](self, "session_messageAsFTSpeechTranslationPartialRecognitionResponse");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v45 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 10)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationFinalRecognitionResponse](self, "session_messageAsFTSpeechTranslationFinalRecognitionResponse");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  }
  else
  {
    v44 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 11)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTAudioLimitExceeded](self, "session_messageAsFTAudioLimitExceeded");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v22, "addObjectToBuffer:", a3);

  }
  else
  {
    v43 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 12)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationMtResponse](self, "session_messageAsFTSpeechTranslationMtResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v23, "addObjectToBuffer:", a3);

  }
  else
  {
    v42 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 13)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationTextToSpeechResponse](self, "session_messageAsFTSpeechTranslationTextToSpeechResponse");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v24, "addObjectToBuffer:", a3);

  }
  else
  {
    v41 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 14)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTFinalBlazarResponse](self, "session_messageAsFTFinalBlazarResponse");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v25, "addObjectToBuffer:", a3);

  }
  else
  {
    v40 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 15)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTRecognitionProgress](self, "session_messageAsFTRecognitionProgress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v26, "addObjectToBuffer:", a3);

  }
  else
  {
    v39 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 16)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTRecognitionCandidate](self, "session_messageAsFTRecognitionCandidate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v27, "addObjectToBuffer:", a3);

  }
  else
  {
    v38 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 17)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTRequestStatsResponse](self, "session_messageAsFTRequestStatsResponse");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v28, "addObjectToBuffer:", a3);

  }
  else
  {
    v37 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 18)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTServerEndpointFeatures](self, "session_messageAsFTServerEndpointFeatures");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v29, "addObjectToBuffer:", a3);

  }
  else
  {
    v36 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 19)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTClientSetupInfo](self, "session_messageAsFTClientSetupInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v30, "addObjectToBuffer:", a3);

  }
  else
  {
    v35 = 0;
  }
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 20)
  {
    -[FTBlazarSpeechTranslationMessage session_messageAsFTSpeechTranslationServerEndpointFeatures](self, "session_messageAsFTSpeechTranslationServerEndpointFeatures");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v31, "addObjectToBuffer:", a3);

  }
  else
  {
    v34 = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v32 = *((_QWORD *)a3 + 4);
  v48 = *((_QWORD *)a3 + 6);
  v49 = *((_QWORD *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 4, v5, 0);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v7);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v9);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v11);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v13);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v15);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v17);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v47);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 8)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v46);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 9)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v45);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 10)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v44);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 11)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v43);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 12)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v42);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 13)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v41);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 14)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v40);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 15)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v39);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 16)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v38);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 17)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v37);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 18)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v36);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 19)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v35);
  if (-[FTBlazarSpeechTranslationMessage session_message_type](self, "session_message_type") == 20)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v34);
  return (Offset<siri::speech::qss_fb::BlazarSpeechTranslationMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v32- (unsigned __int16)v48+ (unsigned __int16)v49);
}

- (id)flatbuffData
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_249338840;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTBlazarSpeechTranslationMessage addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
  v2 = operator new();
  v3 = v12;
  v4 = v14;
  v5 = v15;
  v6 = (v14 + DWORD2(v14) - v15);
  *(_QWORD *)v2 = v11;
  *(_BYTE *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)&v4 + 1);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  if (v3)
  {
    v11 = 0;
    v12 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__FTBlazarSpeechTranslationMessage_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTBlazarSpeechTranslationMessage_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2495AE51CLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
