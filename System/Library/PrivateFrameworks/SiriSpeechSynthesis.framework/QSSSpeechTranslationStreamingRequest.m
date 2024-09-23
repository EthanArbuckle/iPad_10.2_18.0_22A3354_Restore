@implementation QSSSpeechTranslationStreamingRequest

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSSpeechTranslationStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4
{
  return -[QSSSpeechTranslationStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSSpeechTranslationStreamingRequest)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSSpeechTranslationStreamingRequest *v10;
  QSSSpeechTranslationStreamingRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  unsigned int v22;
  siri::speech::schema_fb::StartSpeechTranslationRequest *v23;
  uint64_t v24;
  NSMutableDictionary *storage;
  QSSSpeechTranslationStreamingRequest *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSSpeechTranslationStreamingRequest;
  v10 = -[QSSSpeechTranslationStreamingRequest init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_50;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_51;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SpeechTranslationStreamingRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_49;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_51;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v28 = v18;
  v29 = v19;
  v30 = xmmword_21E34D540;
  v31 = 0;
  v32 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_49;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_51:
    v26 = 0;
    goto LABEL_52;
  }
  if (v22 >= 7)
  {
    if (v21[3])
    {
      v23 = (flatbuffers::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
      goto LABEL_24;
    }
LABEL_23:
    v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((_BYTE *)root + v21[2]))
      {
        case 0:
          goto LABEL_49;
        case 1:
          if (v23
            && !siri::speech::schema_fb::StartSpeechTranslationRequest::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_51;
          }
          goto LABEL_49;
        case 2:
          if (v23 && !siri::speech::schema_fb::LanguageDetected::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 3:
          if (v23 && !siri::speech::schema_fb::AudioPacket::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 4:
          if (v23 && !siri::speech::schema_fb::SpeechTranslationAudioPacket::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 5:
          if (v23 && !siri::speech::schema_fb::FinishAudio::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 6:
          if (v23 && !siri::speech::schema_fb::SetEndpointerState::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 7:
          if (v23 && !siri::speech::schema_fb::ResetServerEndpointer::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_51;
          goto LABEL_49;
        case 8:
          if (!v23
            || siri::speech::schema_fb::StartSpeechTranslationLoggingRequest::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_49;
          }
          goto LABEL_51;
        default:
          goto LABEL_51;
      }
    }
    goto LABEL_49;
  }
  if (v22 >= 5)
    goto LABEL_23;
LABEL_49:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_50:
  v26 = v11;
LABEL_52:

  return v26;
}

- (int64_t)content_type
{
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (QSSStartSpeechTranslationRequest)contentAsQSSStartSpeechTranslationRequest
{
  QSSStartSpeechTranslationRequest *v3;
  QSSStartSpeechTranslationRequest *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSStartSpeechTranslationRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSStartSpeechTranslationRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSStartSpeechTranslationRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSLanguageDetected)contentAsQSSLanguageDetected
{
  QSSLanguageDetected *v3;
  QSSLanguageDetected *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSLanguageDetected *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSLanguageDetected alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSLanguageDetected initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSAudioPacket)contentAsQSSAudioPacket
{
  QSSAudioPacket *v3;
  QSSAudioPacket *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSAudioPacket *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSAudioPacket initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSpeechTranslationAudioPacket)contentAsQSSSpeechTranslationAudioPacket
{
  QSSSpeechTranslationAudioPacket *v3;
  QSSSpeechTranslationAudioPacket *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSSpeechTranslationAudioPacket *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSSpeechTranslationAudioPacket alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSSpeechTranslationAudioPacket initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSFinishAudio)contentAsQSSFinishAudio
{
  QSSFinishAudio *v3;
  QSSFinishAudio *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSFinishAudio *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSFinishAudio alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSFinishAudio initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSSetEndpointerState)contentAsQSSSetEndpointerState
{
  QSSSetEndpointerState *v3;
  QSSSetEndpointerState *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSSetEndpointerState *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSSetEndpointerState alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSSetEndpointerState initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSResetServerEndpointer)contentAsQSSResetServerEndpointer
{
  QSSResetServerEndpointer *v3;
  QSSResetServerEndpointer *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSResetServerEndpointer *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSResetServerEndpointer alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSResetServerEndpointer initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSStartSpeechTranslationLoggingRequest)contentAsQSSStartSpeechTranslationLoggingRequest
{
  QSSStartSpeechTranslationLoggingRequest *v3;
  QSSStartSpeechTranslationLoggingRequest *v4;
  const SpeechTranslationStreamingRequest *root;
  const SpeechTranslationStreamingRequest *v6;
  uint64_t v7;
  const SpeechTranslationStreamingRequest *v8;

  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSStartSpeechTranslationLoggingRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSStartSpeechTranslationLoggingRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSStartSpeechTranslationLoggingRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;

  v5 = -[QSSSpeechTranslationStreamingRequest content_type](self, "content_type");
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 1)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSStartSpeechTranslationRequest](self, "contentAsQSSStartSpeechTranslationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 2)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSLanguageDetected](self, "contentAsQSSLanguageDetected");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 3)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSAudioPacket](self, "contentAsQSSAudioPacket");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 4)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSSpeechTranslationAudioPacket](self, "contentAsQSSSpeechTranslationAudioPacket");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 5)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSFinishAudio](self, "contentAsQSSFinishAudio");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 6)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSSetEndpointerState](self, "contentAsQSSSetEndpointerState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "addObjectToBuffer:", a3);

    v31 = v18;
  }
  else
  {
    v31 = 0;
  }
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 7)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSResetServerEndpointer](self, "contentAsQSSResetServerEndpointer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v20 = 0;
  }
  v30 = v16;
  v29 = v20;
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 8)
  {
    -[QSSSpeechTranslationStreamingRequest contentAsQSSStartSpeechTranslationLoggingRequest](self, "contentAsQSSStartSpeechTranslationLoggingRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "addObjectToBuffer:", a3);

    v27 = v22;
  }
  else
  {
    v27 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v24 = *((_QWORD *)a3 + 5);
  v23 = *((_QWORD *)a3 + 6);
  v25 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type", v27) == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 3)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 4)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v13);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 5)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v30);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 6)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 7)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v29);
  if (-[QSSSpeechTranslationStreamingRequest content_type](self, "content_type") == 8)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v28);
  return (Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v25 - (int)v23 + (int)v24);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::SpeechTranslationStreamingRequest> v2;
  const char *v3;
  flatbuffers::FlatBufferBuilder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSSpeechTranslationStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__QSSSpeechTranslationStreamingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

flatbuffers::DetachedBuffer *__52__QSSSpeechTranslationStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

@end
