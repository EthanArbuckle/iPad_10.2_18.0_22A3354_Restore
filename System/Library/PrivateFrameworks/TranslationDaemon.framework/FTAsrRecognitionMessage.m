@implementation FTAsrRecognitionMessage

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3
{
  return -[FTAsrRecognitionMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTAsrRecognitionMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4
{
  return -[FTAsrRecognitionMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTAsrRecognitionMessage)initWithFlatbuffData:(id)a3 root:(const AsrRecognitionMessage *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTAsrRecognitionMessage *v10;
  FTAsrRecognitionMessage *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::AsrRecognitionMessage *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTAsrRecognitionMessage *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTAsrRecognitionMessage;
  v10 = -[FTAsrRecognitionMessage init](&v30, sel_init);
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
      a4 = (const AsrRecognitionMessage *)v13 + *v13;
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
      root = (siri::speech::qss_fb::AsrRecognitionMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::AsrRecognitionMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTStartSpeechRequest)session_messageAsFTStartSpeechRequest
{
  FTStartSpeechRequest *v3;
  FTStartSpeechRequest *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTStartSpeechRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdateAudioInfo)session_messageAsFTUpdateAudioInfo
{
  FTUpdateAudioInfo *v3;
  FTUpdateAudioInfo *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTUpdateAudioInfo *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTUpdateAudioInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTUpdateAudioInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetRequestOrigin)session_messageAsFTSetRequestOrigin
{
  FTSetRequestOrigin *v3;
  FTSetRequestOrigin *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSetRequestOrigin *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSetRequestOrigin alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSetRequestOrigin initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechContext)session_messageAsFTSetSpeechContext
{
  FTSetSpeechContext *v3;
  FTSetSpeechContext *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSetSpeechContext *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSetSpeechContext alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSetSpeechContext initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechProfile)session_messageAsFTSetSpeechProfile
{
  FTSetSpeechProfile *v3;
  FTSetSpeechProfile *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSetSpeechProfile *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSetSpeechProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSetSpeechProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 6)
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

- (FTAudioPacket)session_messageAsFTAudioPacket
{
  FTAudioPacket *v3;
  FTAudioPacket *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 7)
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

- (FTFinishAudio)session_messageAsFTFinishAudio
{
  FTFinishAudio *v3;
  FTFinishAudio *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 8)
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

- (FTResetServerEndpointer)session_messageAsFTResetServerEndpointer
{
  FTResetServerEndpointer *v3;
  FTResetServerEndpointer *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 9)
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

- (FTCheckForSpeechRequest)session_messageAsFTCheckForSpeechRequest
{
  FTCheckForSpeechRequest *v3;
  FTCheckForSpeechRequest *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTCheckForSpeechRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTCheckForSpeechRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTCheckForSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetAlternateRecognitionSausage)session_messageAsFTSetAlternateRecognitionSausage
{
  FTSetAlternateRecognitionSausage *v3;
  FTSetAlternateRecognitionSausage *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTSetAlternateRecognitionSausage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSetAlternateRecognitionSausage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSetAlternateRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalSpeechRecognitionResponse)session_messageAsFTFinalSpeechRecognitionResponse
{
  FTFinalSpeechRecognitionResponse *v3;
  FTFinalSpeechRecognitionResponse *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTFinalSpeechRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMultiUserFinalSpeechRecognitionResponse)session_messageAsFTMultiUserFinalSpeechRecognitionResponse
{
  FTMultiUserFinalSpeechRecognitionResponse *v3;
  FTMultiUserFinalSpeechRecognitionResponse *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTMultiUserFinalSpeechRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTMultiUserFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTMultiUserFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTPartialSpeechRecognitionResponse)session_messageAsFTPartialSpeechRecognitionResponse
{
  FTPartialSpeechRecognitionResponse *v3;
  FTPartialSpeechRecognitionResponse *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTPartialSpeechRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTPartialSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTPartialSpeechRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdatedAcousticProfile)session_messageAsFTUpdatedAcousticProfile
{
  FTUpdatedAcousticProfile *v3;
  FTUpdatedAcousticProfile *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTUpdatedAcousticProfile *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTUpdatedAcousticProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTUpdatedAcousticProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointLikelihood)session_messageAsFTEndPointLikelihood
{
  FTEndPointLikelihood *v3;
  FTEndPointLikelihood *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTEndPointLikelihood *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTEndPointLikelihood alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTEndPointLikelihood initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTEndPointCandidate)session_messageAsFTEndPointCandidate
{
  FTEndPointCandidate *v3;
  FTEndPointCandidate *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTEndPointCandidate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTEndPointCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTEndPointCandidate initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 18)
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

- (FTCheckForSpeechResponse)session_messageAsFTCheckForSpeechResponse
{
  FTCheckForSpeechResponse *v3;
  FTCheckForSpeechResponse *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 19)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTCheckForSpeechResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTCheckForSpeechResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTCheckForSpeechResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 20)
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

- (FTMultiUserRecognitionCandidate)session_messageAsFTMultiUserRecognitionCandidate
{
  FTMultiUserRecognitionCandidate *v3;
  FTMultiUserRecognitionCandidate *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTMultiUserRecognitionCandidate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTMultiUserRecognitionCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTMultiUserRecognitionCandidate initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 22)
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 23)
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
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 24)
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

- (FTAudioLimitExceeded)session_messageAsFTAudioLimitExceeded
{
  FTAudioLimitExceeded *v3;
  FTAudioLimitExceeded *v4;
  const AsrRecognitionMessage *root;
  const AsrRecognitionMessage *v6;
  uint64_t v7;
  const AsrRecognitionMessage *v8;

  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 25)
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

- (FLTBFBufferAccessor)session_message
{
  void *v3;

  switch(-[FTAsrRecognitionMessage session_message_type](self, "session_message_type"))
  {
    case 1:
      -[FTAsrRecognitionMessage session_messageAsFTStartSpeechRequest](self, "session_messageAsFTStartSpeechRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTAsrRecognitionMessage session_messageAsFTUpdateAudioInfo](self, "session_messageAsFTUpdateAudioInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTAsrRecognitionMessage session_messageAsFTSetRequestOrigin](self, "session_messageAsFTSetRequestOrigin");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTAsrRecognitionMessage session_messageAsFTSetSpeechContext](self, "session_messageAsFTSetSpeechContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTAsrRecognitionMessage session_messageAsFTSetSpeechProfile](self, "session_messageAsFTSetSpeechProfile");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTAsrRecognitionMessage session_messageAsFTSetEndpointerState](self, "session_messageAsFTSetEndpointerState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTAsrRecognitionMessage session_messageAsFTAudioPacket](self, "session_messageAsFTAudioPacket");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[FTAsrRecognitionMessage session_messageAsFTFinishAudio](self, "session_messageAsFTFinishAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[FTAsrRecognitionMessage session_messageAsFTResetServerEndpointer](self, "session_messageAsFTResetServerEndpointer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[FTAsrRecognitionMessage session_messageAsFTCheckForSpeechRequest](self, "session_messageAsFTCheckForSpeechRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[FTAsrRecognitionMessage session_messageAsFTSetAlternateRecognitionSausage](self, "session_messageAsFTSetAlternateRecognitionSausage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[FTAsrRecognitionMessage session_messageAsFTFinalSpeechRecognitionResponse](self, "session_messageAsFTFinalSpeechRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[FTAsrRecognitionMessage session_messageAsFTMultiUserFinalSpeechRecognitionResponse](self, "session_messageAsFTMultiUserFinalSpeechRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[FTAsrRecognitionMessage session_messageAsFTPartialSpeechRecognitionResponse](self, "session_messageAsFTPartialSpeechRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[FTAsrRecognitionMessage session_messageAsFTUpdatedAcousticProfile](self, "session_messageAsFTUpdatedAcousticProfile");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      -[FTAsrRecognitionMessage session_messageAsFTEndPointLikelihood](self, "session_messageAsFTEndPointLikelihood");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      -[FTAsrRecognitionMessage session_messageAsFTEndPointCandidate](self, "session_messageAsFTEndPointCandidate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      -[FTAsrRecognitionMessage session_messageAsFTRecognitionProgress](self, "session_messageAsFTRecognitionProgress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      -[FTAsrRecognitionMessage session_messageAsFTCheckForSpeechResponse](self, "session_messageAsFTCheckForSpeechResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      -[FTAsrRecognitionMessage session_messageAsFTRecognitionCandidate](self, "session_messageAsFTRecognitionCandidate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      -[FTAsrRecognitionMessage session_messageAsFTMultiUserRecognitionCandidate](self, "session_messageAsFTMultiUserRecognitionCandidate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      -[FTAsrRecognitionMessage session_messageAsFTRequestStatsResponse](self, "session_messageAsFTRequestStatsResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      -[FTAsrRecognitionMessage session_messageAsFTServerEndpointFeatures](self, "session_messageAsFTServerEndpointFeatures");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 24:
      -[FTAsrRecognitionMessage session_messageAsFTClientSetupInfo](self, "session_messageAsFTClientSetupInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 25:
      -[FTAsrRecognitionMessage session_messageAsFTAudioLimitExceeded](self, "session_messageAsFTAudioLimitExceeded");
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
  if ((unint64_t)(a3 - 1) > 0x18)
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 24;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 25;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::AsrRecognitionMessage>)addObjectToBuffer:(void *)a3
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;

  v5 = -[FTAsrRecognitionMessage session_message_type](self, "session_message_type");
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 1)
  {
    -[FTAsrRecognitionMessage session_messageAsFTStartSpeechRequest](self, "session_messageAsFTStartSpeechRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 2)
  {
    -[FTAsrRecognitionMessage session_messageAsFTUpdateAudioInfo](self, "session_messageAsFTUpdateAudioInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 3)
  {
    -[FTAsrRecognitionMessage session_messageAsFTSetRequestOrigin](self, "session_messageAsFTSetRequestOrigin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 4)
  {
    -[FTAsrRecognitionMessage session_messageAsFTSetSpeechContext](self, "session_messageAsFTSetSpeechContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 5)
  {
    -[FTAsrRecognitionMessage session_messageAsFTSetSpeechProfile](self, "session_messageAsFTSetSpeechProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 6)
  {
    -[FTAsrRecognitionMessage session_messageAsFTSetEndpointerState](self, "session_messageAsFTSetEndpointerState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 7)
  {
    -[FTAsrRecognitionMessage session_messageAsFTAudioPacket](self, "session_messageAsFTAudioPacket");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v57 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 8)
  {
    -[FTAsrRecognitionMessage session_messageAsFTFinishAudio](self, "session_messageAsFTFinishAudio");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v56 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 9)
  {
    -[FTAsrRecognitionMessage session_messageAsFTResetServerEndpointer](self, "session_messageAsFTResetServerEndpointer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v55 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 10)
  {
    -[FTAsrRecognitionMessage session_messageAsFTCheckForSpeechRequest](self, "session_messageAsFTCheckForSpeechRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  }
  else
  {
    v54 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 11)
  {
    -[FTAsrRecognitionMessage session_messageAsFTSetAlternateRecognitionSausage](self, "session_messageAsFTSetAlternateRecognitionSausage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v22, "addObjectToBuffer:", a3);

  }
  else
  {
    v53 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 12)
  {
    -[FTAsrRecognitionMessage session_messageAsFTFinalSpeechRecognitionResponse](self, "session_messageAsFTFinalSpeechRecognitionResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v23, "addObjectToBuffer:", a3);

  }
  else
  {
    v52 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 13)
  {
    -[FTAsrRecognitionMessage session_messageAsFTMultiUserFinalSpeechRecognitionResponse](self, "session_messageAsFTMultiUserFinalSpeechRecognitionResponse");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v24, "addObjectToBuffer:", a3);

  }
  else
  {
    v51 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 14)
  {
    -[FTAsrRecognitionMessage session_messageAsFTPartialSpeechRecognitionResponse](self, "session_messageAsFTPartialSpeechRecognitionResponse");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v25, "addObjectToBuffer:", a3);

  }
  else
  {
    v50 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 15)
  {
    -[FTAsrRecognitionMessage session_messageAsFTUpdatedAcousticProfile](self, "session_messageAsFTUpdatedAcousticProfile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v26, "addObjectToBuffer:", a3);

  }
  else
  {
    v49 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 16)
  {
    -[FTAsrRecognitionMessage session_messageAsFTEndPointLikelihood](self, "session_messageAsFTEndPointLikelihood");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v27, "addObjectToBuffer:", a3);

  }
  else
  {
    v48 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 17)
  {
    -[FTAsrRecognitionMessage session_messageAsFTEndPointCandidate](self, "session_messageAsFTEndPointCandidate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v28, "addObjectToBuffer:", a3);

  }
  else
  {
    v47 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 18)
  {
    -[FTAsrRecognitionMessage session_messageAsFTRecognitionProgress](self, "session_messageAsFTRecognitionProgress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v29, "addObjectToBuffer:", a3);

  }
  else
  {
    v46 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 19)
  {
    -[FTAsrRecognitionMessage session_messageAsFTCheckForSpeechResponse](self, "session_messageAsFTCheckForSpeechResponse");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v30, "addObjectToBuffer:", a3);

  }
  else
  {
    v45 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 20)
  {
    -[FTAsrRecognitionMessage session_messageAsFTRecognitionCandidate](self, "session_messageAsFTRecognitionCandidate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v31, "addObjectToBuffer:", a3);

  }
  else
  {
    v44 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 21)
  {
    -[FTAsrRecognitionMessage session_messageAsFTMultiUserRecognitionCandidate](self, "session_messageAsFTMultiUserRecognitionCandidate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v32, "addObjectToBuffer:", a3);

  }
  else
  {
    v43 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 22)
  {
    -[FTAsrRecognitionMessage session_messageAsFTRequestStatsResponse](self, "session_messageAsFTRequestStatsResponse");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v33, "addObjectToBuffer:", a3);

  }
  else
  {
    v42 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 23)
  {
    -[FTAsrRecognitionMessage session_messageAsFTServerEndpointFeatures](self, "session_messageAsFTServerEndpointFeatures");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v34, "addObjectToBuffer:", a3);

  }
  else
  {
    v41 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 24)
  {
    -[FTAsrRecognitionMessage session_messageAsFTClientSetupInfo](self, "session_messageAsFTClientSetupInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v35, "addObjectToBuffer:", a3);

  }
  else
  {
    v40 = 0;
  }
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 25)
  {
    -[FTAsrRecognitionMessage session_messageAsFTAudioLimitExceeded](self, "session_messageAsFTAudioLimitExceeded");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v36, "addObjectToBuffer:", a3);

  }
  else
  {
    v39 = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v37 = *((_QWORD *)a3 + 4);
  v58 = *((_QWORD *)a3 + 6);
  v59 = *((_QWORD *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 4, v5, 0);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v7);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v9);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v11);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v13);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v15);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v17);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v57);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 8)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v56);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 9)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v55);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 10)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v54);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 11)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v53);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 12)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v52);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 13)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v51);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 14)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v50);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 15)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v49);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 16)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v48);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 17)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v47);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 18)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v46);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 19)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v45);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 20)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v44);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 21)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v43);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 22)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v42);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 23)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v41);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 24)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v40);
  if (-[FTAsrRecognitionMessage session_message_type](self, "session_message_type") == 25)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v39);
  return (Offset<siri::speech::qss_fb::AsrRecognitionMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v37- (unsigned __int16)v58+ (unsigned __int16)v59);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTAsrRecognitionMessage addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __39__FTAsrRecognitionMessage_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__39__FTAsrRecognitionMessage_flatbuffData__block_invoke(uint64_t a1)
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
