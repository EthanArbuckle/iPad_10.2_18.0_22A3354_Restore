@implementation OPTTSTextToSpeechRouterStreamingStreamingResponse

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechRouterStreamingStreamingResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechRouterStreamingStreamingResponse *v10;
  OPTTSTextToSpeechRouterStreamingStreamingResponse *v11;
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
  siri::speech::schema_fb::BeginTextToSpeechStreamingResponse *v23;
  uint64_t v24;
  NSMutableDictionary *storage;
  OPTTSTextToSpeechRouterStreamingStreamingResponse *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)OPTTSTextToSpeechRouterStreamingStreamingResponse;
  v10 = -[OPTTSTextToSpeechRouterStreamingStreamingResponse init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_35;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_36;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechRouterStreamingStreamingResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_34;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_36;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v28 = v18;
  v29 = v19;
  v30 = xmmword_21AACED40;
  v31 = 0;
  v32 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_34;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v28, v11->_root->var0)
    || (v21 = (unsigned __int16 *)((char *)root - *(int *)root), v22 = *v21, v22 >= 5)
    && v21[2]
    && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v28, 6u))
  {
LABEL_36:
    v26 = 0;
    goto LABEL_37;
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
          goto LABEL_34;
        case 1:
          if (v23
            && !siri::speech::schema_fb::BeginTextToSpeechStreamingResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_36;
          }
          goto LABEL_34;
        case 2:
          if (v23
            && !siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_36;
          }
          goto LABEL_34;
        case 3:
          if (!v23
            || siri::speech::schema_fb::FinalTextToSpeechStreamingResponse::Verify(v23, (flatbuffers::Verifier *)&v28))
          {
            goto LABEL_34;
          }
          goto LABEL_36;
        default:
          goto LABEL_36;
      }
    }
    goto LABEL_34;
  }
  if (v22 >= 5)
    goto LABEL_23;
LABEL_34:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_35:
  v26 = v11;
LABEL_37:

  return v26;
}

- (int64_t)content_type
{
  const TextToSpeechRouterStreamingStreamingResponse *root;
  const TextToSpeechRouterStreamingStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (OPTTSBeginTextToSpeechStreamingResponse)contentAsOPTTSBeginTextToSpeechStreamingResponse
{
  OPTTSBeginTextToSpeechStreamingResponse *v3;
  OPTTSBeginTextToSpeechStreamingResponse *v4;
  const TextToSpeechRouterStreamingStreamingResponse *root;
  const TextToSpeechRouterStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechRouterStreamingStreamingResponse *v8;

  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (OPTTSBeginTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [OPTTSBeginTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[OPTTSBeginTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OPTTSPartialTextToSpeechStreamingResponse)contentAsOPTTSPartialTextToSpeechStreamingResponse
{
  OPTTSPartialTextToSpeechStreamingResponse *v3;
  OPTTSPartialTextToSpeechStreamingResponse *v4;
  const TextToSpeechRouterStreamingStreamingResponse *root;
  const TextToSpeechRouterStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechRouterStreamingStreamingResponse *v8;

  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (OPTTSPartialTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [OPTTSPartialTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[OPTTSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OPTTSFinalTextToSpeechStreamingResponse)contentAsOPTTSFinalTextToSpeechStreamingResponse
{
  OPTTSFinalTextToSpeechStreamingResponse *v3;
  OPTTSFinalTextToSpeechStreamingResponse *v4;
  const TextToSpeechRouterStreamingStreamingResponse *root;
  const TextToSpeechRouterStreamingStreamingResponse *v6;
  uint64_t v7;
  const TextToSpeechRouterStreamingStreamingResponse *v8;

  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (OPTTSFinalTextToSpeechStreamingResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [OPTTSFinalTextToSpeechStreamingResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[OPTTSFinalTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("content"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = -[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type");
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 1)
  {
    -[OPTTSTextToSpeechRouterStreamingStreamingResponse contentAsOPTTSBeginTextToSpeechStreamingResponse](self, "contentAsOPTTSBeginTextToSpeechStreamingResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 2)
  {
    -[OPTTSTextToSpeechRouterStreamingStreamingResponse contentAsOPTTSPartialTextToSpeechStreamingResponse](self, "contentAsOPTTSPartialTextToSpeechStreamingResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 3)
  {
    -[OPTTSTextToSpeechRouterStreamingStreamingResponse contentAsOPTTSFinalTextToSpeechStreamingResponse](self, "contentAsOPTTSFinalTextToSpeechStreamingResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v13 = *((_QWORD *)a3 + 5);
  v14 = *((_QWORD *)a3 + 6);
  v15 = *((_QWORD *)a3 + 4);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 4, v5);
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 1)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v7);
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 2)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v9);
  if (-[OPTTSTextToSpeechRouterStreamingStreamingResponse content_type](self, "content_type") == 3)
    flatbuffers::FlatBufferBuilder::AddOffset<void>((flatbuffers::FlatBufferBuilder *)a3, v12);
  return (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v15 - (int)v14 + (int)v13);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingResponse> v2;
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
  v13 = xmmword_21AACED50;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSTextToSpeechRouterStreamingStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__OPTTSTextToSpeechRouterStreamingStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__65__OPTTSTextToSpeechRouterStreamingStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x220750954);
  }
  return result;
}

@end
