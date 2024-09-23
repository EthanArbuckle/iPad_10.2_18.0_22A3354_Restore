@implementation QSSRecognitionStreamingResponse

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSRecognitionStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4
{
  return -[QSSRecognitionStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSRecognitionStreamingResponse)initWithFlatbuffData:(id)a3 root:(const RecognitionStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSRecognitionStreamingResponse *v10;
  QSSRecognitionStreamingResponse *v11;
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
  siri::speech::schema_fb::FinalSpeechRecognitionResponse *v23;
  uint64_t v24;
  NSMutableDictionary *storage;
  QSSRecognitionStreamingResponse *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSRecognitionStreamingResponse;
  v10 = -[QSSRecognitionStreamingResponse init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_62;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_63;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RecognitionStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_61;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_63;
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
    goto LABEL_61;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_63:
    v26 = 0;
    goto LABEL_64;
  }
  if (v22 >= 7)
  {
    v23 = (siri::speech::schema_fb::FinalSpeechRecognitionResponse *)v21[3];
    if (v21[3])
      v23 = (siri::speech::schema_fb::FinalSpeechRecognitionResponse *)((char *)v23
                                                                      + (_QWORD)root
                                                                      + *(unsigned int *)((char *)v23 + (_QWORD)root));
    goto LABEL_24;
  }
  if (v22 >= 5)
  {
    v23 = 0;
LABEL_24:
    if (v21[2])
    {
      switch(*((_BYTE *)root + v21[2]))
      {
        case 0:
          break;
        case 1:
          if (v23
            && !siri::speech::schema_fb::FinalSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_63;
          }
          break;
        case 3:
          if (v23 && !siri::speech::schema_fb::UpdatedAcousticProfile::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 4:
          if (v23 && !siri::speech::schema_fb::EndPointLikelihood::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 5:
          if (v23 && !siri::speech::schema_fb::EndPointCandidate::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 6:
          if (v23 && !siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 7:
          if (v23 && !siri::speech::schema_fb::SetEndpointerState::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 8:
          if (!v23 || siri::speech::schema_fb::RecognitionCandidate::Verify(v23, (flatbuffers::Verifier *)&v28))
            break;
          goto LABEL_63;
        case 9:
          if (v23 && !siri::speech::schema_fb::RequestStatsResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 0xA:
          if (v23 && !siri::speech::schema_fb::ServerEndpointFeatures::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 0xB:
          if (v23 && !siri::speech::schema_fb::ClientSetupInfo::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_63;
          break;
        case 0xC:
          if (v23
            && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, (const unsigned __int8 *)v23))
          {
            goto LABEL_63;
          }
          break;
        default:
          goto LABEL_63;
      }
    }
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_62:
  v26 = v11;
LABEL_64:

  return v26;
}

- (int64_t)content_type
{
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (QSSFinalSpeechRecognitionResponse)contentAsQSSFinalSpeechRecognitionResponse
{
  QSSFinalSpeechRecognitionResponse *v3;
  QSSFinalSpeechRecognitionResponse *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSFinalSpeechRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSFinalSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSFinalSpeechRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSPartialSpeechRecognitionResponse)contentAsQSSPartialSpeechRecognitionResponse
{
  QSSPartialSpeechRecognitionResponse *v3;
  QSSPartialSpeechRecognitionResponse *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSPartialSpeechRecognitionResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSPartialSpeechRecognitionResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSPartialSpeechRecognitionResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSUpdatedAcousticProfile)contentAsQSSUpdatedAcousticProfile
{
  QSSUpdatedAcousticProfile *v3;
  QSSUpdatedAcousticProfile *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSUpdatedAcousticProfile *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSUpdatedAcousticProfile alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSUpdatedAcousticProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSEndPointLikelihood)contentAsQSSEndPointLikelihood
{
  QSSEndPointLikelihood *v3;
  QSSEndPointLikelihood *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSEndPointLikelihood *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSEndPointLikelihood alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSEndPointLikelihood initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSEndPointCandidate)contentAsQSSEndPointCandidate
{
  QSSEndPointCandidate *v3;
  QSSEndPointCandidate *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSEndPointCandidate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSEndPointCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSEndPointCandidate initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRecognitionProgress)contentAsQSSRecognitionProgress
{
  QSSRecognitionProgress *v3;
  QSSRecognitionProgress *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSRecognitionProgress *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSRecognitionProgress alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSRecognitionProgress initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSCheckForSpeechResponse)contentAsQSSCheckForSpeechResponse
{
  QSSCheckForSpeechResponse *v3;
  QSSCheckForSpeechResponse *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSCheckForSpeechResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSCheckForSpeechResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSCheckForSpeechResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  QSSRecognitionCandidate *v3;
  QSSRecognitionCandidate *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSRecognitionCandidate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSRecognitionCandidate alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSRecognitionCandidate initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSRequestStatsResponse)contentAsQSSRequestStatsResponse
{
  QSSRequestStatsResponse *v3;
  QSSRequestStatsResponse *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSRequestStatsResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSRequestStatsResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSRequestStatsResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSServerEndpointFeatures)contentAsQSSServerEndpointFeatures
{
  QSSServerEndpointFeatures *v3;
  QSSServerEndpointFeatures *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSServerEndpointFeatures *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSServerEndpointFeatures alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSServerEndpointFeatures initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSClientSetupInfo)contentAsQSSClientSetupInfo
{
  QSSClientSetupInfo *v3;
  QSSClientSetupInfo *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSClientSetupInfo *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSClientSetupInfo alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSClientSetupInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  QSSAudioLimitExceeded *v3;
  QSSAudioLimitExceeded *v4;
  const RecognitionStreamingResponse *root;
  const RecognitionStreamingResponse *v6;
  uint64_t v7;
  const RecognitionStreamingResponse *v8;

  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSAudioLimitExceeded *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSAudioLimitExceeded alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSAudioLimitExceeded initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)addObjectToBuffer:(void *)a3
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
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;

  v5 = -[QSSRecognitionStreamingResponse content_type](self, "content_type");
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 1)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSFinalSpeechRecognitionResponse](self, "contentAsQSSFinalSpeechRecognitionResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 2)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSPartialSpeechRecognitionResponse](self, "contentAsQSSPartialSpeechRecognitionResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 3)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSUpdatedAcousticProfile](self, "contentAsQSSUpdatedAcousticProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 4)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSEndPointLikelihood](self, "contentAsQSSEndPointLikelihood");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 5)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSEndPointCandidate](self, "contentAsQSSEndPointCandidate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 6)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSRecognitionProgress](self, "contentAsQSSRecognitionProgress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 7)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSCheckForSpeechResponse](self, "contentAsQSSCheckForSpeechResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v37 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 8)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSRecognitionCandidate](self, "contentAsQSSRecognitionCandidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v36 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 9)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSRequestStatsResponse](self, "contentAsQSSRequestStatsResponse");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v35 = 0;
  }
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 10)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSServerEndpointFeatures](self, "contentAsQSSServerEndpointFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  }
  else
  {
    v34 = 0;
  }
  v33 = v17;
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 11)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSClientSetupInfo](self, "contentAsQSSClientSetupInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "addObjectToBuffer:", a3);

    v32 = v23;
  }
  else
  {
    v32 = 0;
  }
  v24 = v15;
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 12)
  {
    -[QSSRecognitionStreamingResponse contentAsQSSAudioLimitExceeded](self, "contentAsQSSAudioLimitExceeded");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "addObjectToBuffer:", a3);

    v30 = v26;
  }
  else
  {
    v30 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v27 = *((_QWORD *)a3 + 6);
  v28 = *((_QWORD *)a3 + 4);
  v38 = *((_QWORD *)a3 + 5);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type", v30) == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 3)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 4)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v13);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 5)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v24);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 6)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v33);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 7)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v37);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 8)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v36);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 9)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v35);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 10)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v34);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 11)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v32);
  if (-[QSSRecognitionStreamingResponse content_type](self, "content_type") == 12)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v31);
  return (Offset<siri::speech::qss_fb::RecognitionStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v38);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::RecognitionStreamingResponse> v2;
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
  v2.var0 = -[QSSRecognitionStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__QSSRecognitionStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__47__QSSRecognitionStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
