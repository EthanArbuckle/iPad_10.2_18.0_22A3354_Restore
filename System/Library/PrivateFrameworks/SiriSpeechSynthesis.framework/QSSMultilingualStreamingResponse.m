@implementation QSSMultilingualStreamingResponse

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSMultilingualStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSMultilingualStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4
{
  return -[QSSMultilingualStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSMultilingualStreamingResponse)initWithFlatbuffData:(id)a3 root:(const MultilingualStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSMultilingualStreamingResponse *v10;
  QSSMultilingualStreamingResponse *v11;
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
  QSSMultilingualStreamingResponse *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSMultilingualStreamingResponse;
  v10 = -[QSSMultilingualStreamingResponse init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_44;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_45;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const MultilingualStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_43;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_45;
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
    goto LABEL_43;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_45:
    v26 = 0;
    goto LABEL_46;
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
            goto LABEL_45;
          }
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::PartialSpeechRecognitionResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_45;
          }
          break;
        case 3:
          if (v23 && !siri::speech::schema_fb::RecognitionCandidate::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_45;
          break;
        case 4:
          if (v23 && !siri::speech::schema_fb::RequestStatsResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
            goto LABEL_45;
          break;
        case 5:
          if (v23
            && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, (const unsigned __int8 *)v23))
          {
            goto LABEL_45;
          }
          break;
        case 6:
          if (!v23 || siri::speech::schema_fb::RecognitionProgress::Verify(v23, (flatbuffers::Verifier *)&v28))
            break;
          goto LABEL_45;
        default:
          goto LABEL_45;
      }
    }
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_44:
  v26 = v11;
LABEL_46:

  return v26;
}

- (int64_t)content_type
{
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v3;
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
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 1)
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
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 2)
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

- (QSSRecognitionCandidate)contentAsQSSRecognitionCandidate
{
  QSSRecognitionCandidate *v3;
  QSSRecognitionCandidate *v4;
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 3)
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
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 4)
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

- (QSSAudioLimitExceeded)contentAsQSSAudioLimitExceeded
{
  QSSAudioLimitExceeded *v3;
  QSSAudioLimitExceeded *v4;
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 5)
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

- (QSSFinalBlazarResponse)contentAsQSSFinalBlazarResponse
{
  QSSFinalBlazarResponse *v3;
  QSSFinalBlazarResponse *v4;
  const MultilingualStreamingResponse *root;
  const MultilingualStreamingResponse *v6;
  uint64_t v7;
  const MultilingualStreamingResponse *v8;

  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSFinalBlazarResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSFinalBlazarResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSFinalBlazarResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::MultilingualStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  unsigned __int8 v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;

  v5 = -[QSSMultilingualStreamingResponse content_type](self, "content_type");
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 1)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSFinalSpeechRecognitionResponse](self, "contentAsQSSFinalSpeechRecognitionResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 2)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSPartialSpeechRecognitionResponse](self, "contentAsQSSPartialSpeechRecognitionResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 3)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSRecognitionCandidate](self, "contentAsQSSRecognitionCandidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "addObjectToBuffer:", a3);

    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 4)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSRequestStatsResponse](self, "contentAsQSSRequestStatsResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 5)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSAudioLimitExceeded](self, "contentAsQSSAudioLimitExceeded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "addObjectToBuffer:", a3);

    v28 = v18;
  }
  else
  {
    v28 = 0;
  }
  v19 = v5;
  v30 = v16;
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type", v28) == 6)
  {
    -[QSSMultilingualStreamingResponse contentAsQSSFinalBlazarResponse](self, "contentAsQSSFinalBlazarResponse");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "addObjectToBuffer:", a3);
    v22 = v13;

    v23 = v21;
  }
  else
  {
    v22 = v13;
    v23 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v25 = *((_QWORD *)a3 + 5);
  v24 = *((_QWORD *)a3 + 6);
  v26 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v19);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v10);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 3)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v22);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 4)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v30);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 5)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v29);
  if (-[QSSMultilingualStreamingResponse content_type](self, "content_type") == 6)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v23);
  return (Offset<siri::speech::qss_fb::MultilingualStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v26 - (int)v24 + (int)v25);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::MultilingualStreamingResponse> v2;
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
  v2.var0 = -[QSSMultilingualStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QSSMultilingualStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__48__QSSMultilingualStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
