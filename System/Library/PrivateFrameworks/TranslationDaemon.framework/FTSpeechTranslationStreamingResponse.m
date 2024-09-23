@implementation FTSpeechTranslationStreamingResponse

- (FTSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSpeechTranslationStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4
{
  return -[FTSpeechTranslationStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSpeechTranslationStreamingResponse)initWithFlatbuffData:(id)a3 root:(const SpeechTranslationStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSpeechTranslationStreamingResponse *v10;
  FTSpeechTranslationStreamingResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::SpeechTranslationStreamingResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTSpeechTranslationStreamingResponse *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTSpeechTranslationStreamingResponse;
  v10 = -[FTSpeechTranslationStreamingResponse init](&v30, sel_init);
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
      a4 = (const SpeechTranslationStreamingResponse *)v13 + *v13;
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
      root = (siri::speech::qss_fb::SpeechTranslationStreamingResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::SpeechTranslationStreamingResponse::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTSpeechTranslationPartialRecognitionResponse)contentAsFTSpeechTranslationPartialRecognitionResponse
{
  FTSpeechTranslationPartialRecognitionResponse *v3;
  FTSpeechTranslationPartialRecognitionResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationFinalRecognitionResponse)contentAsFTSpeechTranslationFinalRecognitionResponse
{
  FTSpeechTranslationFinalRecognitionResponse *v3;
  FTSpeechTranslationFinalRecognitionResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAudioLimitExceeded)contentAsFTAudioLimitExceeded
{
  FTAudioLimitExceeded *v3;
  FTAudioLimitExceeded *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationMtResponse)contentAsFTSpeechTranslationMtResponse
{
  FTSpeechTranslationMtResponse *v3;
  FTSpeechTranslationMtResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationTextToSpeechResponse)contentAsFTSpeechTranslationTextToSpeechResponse
{
  FTSpeechTranslationTextToSpeechResponse *v3;
  FTSpeechTranslationTextToSpeechResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalBlazarResponse)contentAsFTFinalBlazarResponse
{
  FTFinalBlazarResponse *v3;
  FTFinalBlazarResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionProgress)contentAsFTRecognitionProgress
{
  FTRecognitionProgress *v3;
  FTRecognitionProgress *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRecognitionCandidate)contentAsFTRecognitionCandidate
{
  FTRecognitionCandidate *v3;
  FTRecognitionCandidate *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTRequestStatsResponse)contentAsFTRequestStatsResponse
{
  FTRequestStatsResponse *v3;
  FTRequestStatsResponse *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTServerEndpointFeatures)contentAsFTServerEndpointFeatures
{
  FTServerEndpointFeatures *v3;
  FTServerEndpointFeatures *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTClientSetupInfo)contentAsFTClientSetupInfo
{
  FTClientSetupInfo *v3;
  FTClientSetupInfo *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSpeechTranslationServerEndpointFeatures)contentAsFTSpeechTranslationServerEndpointFeatures
{
  FTSpeechTranslationServerEndpointFeatures *v3;
  FTSpeechTranslationServerEndpointFeatures *v4;
  const SpeechTranslationStreamingResponse *root;
  const SpeechTranslationStreamingResponse *v6;
  uint64_t v7;
  const SpeechTranslationStreamingResponse *v8;

  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
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

  switch(-[FTSpeechTranslationStreamingResponse content_type](self, "content_type"))
  {
    case 1:
      -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationPartialRecognitionResponse](self, "contentAsFTSpeechTranslationPartialRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationFinalRecognitionResponse](self, "contentAsFTSpeechTranslationFinalRecognitionResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTSpeechTranslationStreamingResponse contentAsFTAudioLimitExceeded](self, "contentAsFTAudioLimitExceeded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationMtResponse](self, "contentAsFTSpeechTranslationMtResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationTextToSpeechResponse](self, "contentAsFTSpeechTranslationTextToSpeechResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTSpeechTranslationStreamingResponse contentAsFTFinalBlazarResponse](self, "contentAsFTFinalBlazarResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTSpeechTranslationStreamingResponse contentAsFTRecognitionProgress](self, "contentAsFTRecognitionProgress");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[FTSpeechTranslationStreamingResponse contentAsFTRecognitionCandidate](self, "contentAsFTRecognitionCandidate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[FTSpeechTranslationStreamingResponse contentAsFTRequestStatsResponse](self, "contentAsFTRequestStatsResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[FTSpeechTranslationStreamingResponse contentAsFTServerEndpointFeatures](self, "contentAsFTServerEndpointFeatures");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[FTSpeechTranslationStreamingResponse contentAsFTClientSetupInfo](self, "contentAsFTClientSetupInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationServerEndpointFeatures](self, "contentAsFTSpeechTranslationServerEndpointFeatures");
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
  if ((unint64_t)(a3 - 1) > 0xB)
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
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::SpeechTranslationStreamingResponse>)addObjectToBuffer:(void *)a3
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
  int v23;
  int v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;

  v5 = -[FTSpeechTranslationStreamingResponse content_type](self, "content_type");
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 1)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationPartialRecognitionResponse](self, "contentAsFTSpeechTranslationPartialRecognitionResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 2)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationFinalRecognitionResponse](self, "contentAsFTSpeechTranslationFinalRecognitionResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 3)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTAudioLimitExceeded](self, "contentAsFTAudioLimitExceeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 4)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationMtResponse](self, "contentAsFTSpeechTranslationMtResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 5)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationTextToSpeechResponse](self, "contentAsFTSpeechTranslationTextToSpeechResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 6)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTFinalBlazarResponse](self, "contentAsFTFinalBlazarResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 7)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTRecognitionProgress](self, "contentAsFTRecognitionProgress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v37 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 8)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTRecognitionCandidate](self, "contentAsFTRecognitionCandidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v36 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 9)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTRequestStatsResponse](self, "contentAsFTRequestStatsResponse");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v35 = 0;
  }
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 10)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTServerEndpointFeatures](self, "contentAsFTServerEndpointFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  }
  else
  {
    v34 = 0;
  }
  v33 = v17;
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 11)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTClientSetupInfo](self, "contentAsFTClientSetupInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "addObjectToBuffer:", a3);

    v32 = v23;
  }
  else
  {
    v32 = 0;
  }
  v24 = v15;
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 12)
  {
    -[FTSpeechTranslationStreamingResponse contentAsFTSpeechTranslationServerEndpointFeatures](self, "contentAsFTSpeechTranslationServerEndpointFeatures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "addObjectToBuffer:", a3);

    v30 = v26;
  }
  else
  {
    v30 = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v27 = *((_QWORD *)a3 + 6);
  v28 = *((_QWORD *)a3 + 4);
  v38 = *((_QWORD *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 4, v5, 0);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v7);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type", v30) == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v9);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v11);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v13);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v24);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v33);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v37);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 8)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v36);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 9)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v35);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 10)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v34);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 11)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v32);
  if (-[FTSpeechTranslationStreamingResponse content_type](self, "content_type") == 12)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v31);
  return (Offset<siri::speech::qss_fb::SpeechTranslationStreamingResponse>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v28- (unsigned __int16)v27+ (unsigned __int16)v38);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSpeechTranslationStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __52__FTSpeechTranslationStreamingResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__52__FTSpeechTranslationStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
