@implementation QSSTextToSpeechStreamingStreamingResponse

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4
{
  return -[QSSTextToSpeechStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechStreamingStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechStreamingStreamingResponse *v10;
  QSSTextToSpeechStreamingStreamingResponse *v11;
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
  unsigned __int8 *v23;
  uint64_t v24;
  NSMutableDictionary *storage;
  QSSTextToSpeechStreamingStreamingResponse *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)QSSTextToSpeechStreamingStreamingResponse;
  v10 = -[QSSTextToSpeechStreamingStreamingResponse init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_38;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_39;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechStreamingStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_37;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_39;
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
    goto LABEL_37;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_39:
    v26 = 0;
    goto LABEL_40;
  }
  if (v22 >= 7)
  {
    v23 = (unsigned __int8 *)v21[3];
    if (v21[3])
      v23 = &v23[(_QWORD)root + *(unsigned int *)&v23[(_QWORD)root]];
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
          if (v23 && !flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v23))
            goto LABEL_39;
          break;
        case 2:
          if (v23
            && !siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_39;
          }
          break;
        case 3:
          if (!v23
            || siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            break;
          }
          goto LABEL_39;
        case 4:
          if (v23
            && !siri::speech::schema_fb::FinalTextToSpeechStreamingResponse::Verify((siri::speech::schema_fb::FinalTextToSpeechStreamingResponse *)v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_39;
          }
          break;
        default:
          goto LABEL_39;
      }
    }
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_38:
  v26 = v11;
LABEL_40:

  return v26;
}

- (int64_t)content_type
{
  const TextToSpeechStreamingStreamingResponse *root;
  const TextToSpeechStreamingStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (QSSQssAckResponse)contentAsQSSQssAckResponse
{
  QSSQssAckResponse *v3;
  QSSQssAckResponse *v4;
  const TextToSpeechStreamingStreamingResponse *root;
  const TextToSpeechStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechStreamingStreamingResponse *v8;

  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSQssAckResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSQssAckResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSQssAckResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSBeginTextToSpeechStreamingResponse)contentAsQSSBeginTextToSpeechStreamingResponse
{
  QSSBeginTextToSpeechStreamingResponse *v3;
  QSSBeginTextToSpeechStreamingResponse *v4;
  const TextToSpeechStreamingStreamingResponse *root;
  const TextToSpeechStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechStreamingStreamingResponse *v8;

  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSBeginTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSBeginTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSPartialTextToSpeechStreamingResponse)contentAsQSSPartialTextToSpeechStreamingResponse
{
  QSSPartialTextToSpeechStreamingResponse *v3;
  QSSPartialTextToSpeechStreamingResponse *v4;
  const TextToSpeechStreamingStreamingResponse *root;
  const TextToSpeechStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechStreamingStreamingResponse *v8;

  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSPartialTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSPartialTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (QSSFinalTextToSpeechStreamingResponse)contentAsQSSFinalTextToSpeechStreamingResponse
{
  QSSFinalTextToSpeechStreamingResponse *v3;
  QSSFinalTextToSpeechStreamingResponse *v4;
  const TextToSpeechStreamingStreamingResponse *root;
  const TextToSpeechStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechStreamingStreamingResponse *v8;

  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (QSSFinalTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [QSSFinalTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[QSSFinalTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse>)addObjectToBuffer:(void *)a3
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
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = -[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type");
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 1)
  {
    -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSQssAckResponse](self, "contentAsQSSQssAckResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 2)
  {
    -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSBeginTextToSpeechStreamingResponse](self, "contentAsQSSBeginTextToSpeechStreamingResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 3)
  {
    -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSPartialTextToSpeechStreamingResponse](self, "contentAsQSSPartialTextToSpeechStreamingResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 4)
  {
    -[QSSTextToSpeechStreamingStreamingResponse contentAsQSSFinalTextToSpeechStreamingResponse](self, "contentAsQSSFinalTextToSpeechStreamingResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v15 = *((_QWORD *)a3 + 5);
  v16 = *((_QWORD *)a3 + 6);
  v17 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 3)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v11);
  if (-[QSSTextToSpeechStreamingStreamingResponse content_type](self, "content_type") == 4)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v14);
  return (Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v17 - (int)v16 + (int)v15);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::TextToSpeechStreamingStreamingResponse> v2;
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
  v2.var0 = -[QSSTextToSpeechStreamingStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__QSSTextToSpeechStreamingStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__57__QSSTextToSpeechStreamingStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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
