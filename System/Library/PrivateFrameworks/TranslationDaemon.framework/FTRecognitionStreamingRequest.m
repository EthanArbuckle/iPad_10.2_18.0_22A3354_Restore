@implementation FTRecognitionStreamingRequest

- (FTRecognitionStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[FTRecognitionStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTRecognitionStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTRecognitionStreamingRequest)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingRequest *)a4
{
  return -[FTRecognitionStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTRecognitionStreamingRequest)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTRecognitionStreamingRequest *v10;
  FTRecognitionStreamingRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::RecognitionStreamingRequest *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTRecognitionStreamingRequest *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTRecognitionStreamingRequest;
  v10 = -[FTRecognitionStreamingRequest init](&v30, sel_init);
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
      a4 = (const RecognitionStreamingRequest *)v13 + *v13;
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
      root = (siri::speech::qss_fb::RecognitionStreamingRequest *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::RecognitionStreamingRequest::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (int64_t)content_type
{
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTStartSpeechRequest)contentAsFTStartSpeechRequest
{
  FTStartSpeechRequest *v3;
  FTStartSpeechRequest *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTUpdateAudioInfo)contentAsFTUpdateAudioInfo
{
  FTUpdateAudioInfo *v3;
  FTUpdateAudioInfo *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetRequestOrigin)contentAsFTSetRequestOrigin
{
  FTSetRequestOrigin *v3;
  FTSetRequestOrigin *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechContext)contentAsFTSetSpeechContext
{
  FTSetSpeechContext *v3;
  FTSetSpeechContext *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetSpeechProfile)contentAsFTSetSpeechProfile
{
  FTSetSpeechProfile *v3;
  FTSetSpeechProfile *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetEndpointerState)contentAsFTSetEndpointerState
{
  FTSetEndpointerState *v3;
  FTSetEndpointerState *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioPacket)contentAsFTAudioPacket
{
  FTAudioPacket *v3;
  FTAudioPacket *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinishAudio)contentAsFTFinishAudio
{
  FTFinishAudio *v3;
  FTFinishAudio *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTResetServerEndpointer)contentAsFTResetServerEndpointer
{
  FTResetServerEndpointer *v3;
  FTResetServerEndpointer *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTCheckForSpeechRequest)contentAsFTCheckForSpeechRequest
{
  FTCheckForSpeechRequest *v3;
  FTCheckForSpeechRequest *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSetAlternateRecognitionSausage)contentAsFTSetAlternateRecognitionSausage
{
  FTSetAlternateRecognitionSausage *v3;
  FTSetAlternateRecognitionSausage *v4;
  const RecognitionStreamingRequest *root;
  const RecognitionStreamingRequest *v6;
  uint64_t v7;
  const RecognitionStreamingRequest *v8;

  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)content
{
  void *v3;

  switch(-[FTRecognitionStreamingRequest content_type](self, "content_type"))
  {
    case 1:
      -[FTRecognitionStreamingRequest contentAsFTStartSpeechRequest](self, "contentAsFTStartSpeechRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTRecognitionStreamingRequest contentAsFTUpdateAudioInfo](self, "contentAsFTUpdateAudioInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTRecognitionStreamingRequest contentAsFTSetRequestOrigin](self, "contentAsFTSetRequestOrigin");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTRecognitionStreamingRequest contentAsFTSetSpeechContext](self, "contentAsFTSetSpeechContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTRecognitionStreamingRequest contentAsFTSetSpeechProfile](self, "contentAsFTSetSpeechProfile");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTRecognitionStreamingRequest contentAsFTSetEndpointerState](self, "contentAsFTSetEndpointerState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTRecognitionStreamingRequest contentAsFTAudioPacket](self, "contentAsFTAudioPacket");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[FTRecognitionStreamingRequest contentAsFTFinishAudio](self, "contentAsFTFinishAudio");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[FTRecognitionStreamingRequest contentAsFTResetServerEndpointer](self, "contentAsFTResetServerEndpointer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[FTRecognitionStreamingRequest contentAsFTCheckForSpeechRequest](self, "contentAsFTCheckForSpeechRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[FTRecognitionStreamingRequest contentAsFTSetAlternateRecognitionSausage](self, "contentAsFTSetAlternateRecognitionSausage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)content_typeForImmutableObject:(id)a3
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
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::RecognitionStreamingRequest>)addObjectToBuffer:(void *)a3
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
  int v22;
  int v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;

  v5 = -[FTRecognitionStreamingRequest content_type](self, "content_type");
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 1)
  {
    -[FTRecognitionStreamingRequest contentAsFTStartSpeechRequest](self, "contentAsFTStartSpeechRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 2)
  {
    -[FTRecognitionStreamingRequest contentAsFTUpdateAudioInfo](self, "contentAsFTUpdateAudioInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 3)
  {
    -[FTRecognitionStreamingRequest contentAsFTSetRequestOrigin](self, "contentAsFTSetRequestOrigin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 4)
  {
    -[FTRecognitionStreamingRequest contentAsFTSetSpeechContext](self, "contentAsFTSetSpeechContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 5)
  {
    -[FTRecognitionStreamingRequest contentAsFTSetSpeechProfile](self, "contentAsFTSetSpeechProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 6)
  {
    -[FTRecognitionStreamingRequest contentAsFTSetEndpointerState](self, "contentAsFTSetEndpointerState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 7)
  {
    -[FTRecognitionStreamingRequest contentAsFTAudioPacket](self, "contentAsFTAudioPacket");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v34 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 8)
  {
    -[FTRecognitionStreamingRequest contentAsFTFinishAudio](self, "contentAsFTFinishAudio");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v33 = 0;
  }
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 9)
  {
    -[FTRecognitionStreamingRequest contentAsFTResetServerEndpointer](self, "contentAsFTResetServerEndpointer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v32 = 0;
  }
  v31 = v17;
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 10)
  {
    -[FTRecognitionStreamingRequest contentAsFTCheckForSpeechRequest](self, "contentAsFTCheckForSpeechRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "addObjectToBuffer:", a3);

    v30 = v22;
  }
  else
  {
    v30 = 0;
  }
  v23 = v15;
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 11)
  {
    -[FTRecognitionStreamingRequest contentAsFTSetAlternateRecognitionSausage](self, "contentAsFTSetAlternateRecognitionSausage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "addObjectToBuffer:", a3);

    v29 = v25;
  }
  else
  {
    v29 = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v26 = *((_QWORD *)a3 + 6);
  v27 = *((_QWORD *)a3 + 4);
  v35 = *((_QWORD *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 4, v5, 0);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v7);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v9);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v11);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v13);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v23);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v31);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v34);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 8)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v33);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 9)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v32);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 10)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v30);
  if (-[FTRecognitionStreamingRequest content_type](self, "content_type") == 11)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v29);
  return (Offset<siri::speech::qss_fb::RecognitionStreamingRequest>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v27- (unsigned __int16)v26+ (unsigned __int16)v35);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTRecognitionStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __45__FTRecognitionStreamingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__45__FTRecognitionStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
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
