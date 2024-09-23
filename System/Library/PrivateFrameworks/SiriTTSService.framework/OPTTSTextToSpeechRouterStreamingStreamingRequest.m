@implementation OPTTSTextToSpeechRouterStreamingStreamingRequest

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4
{
  return -[OPTTSTextToSpeechRouterStreamingStreamingRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechRouterStreamingStreamingRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRouterStreamingStreamingRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechRouterStreamingStreamingRequest *v10;
  OPTTSTextToSpeechRouterStreamingStreamingRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  apple::aiml::flatbuffers2::Table *root;
  unsigned __int16 *v21;
  unsigned int v22;
  siri::speech::schema_fb::StartTextToSpeechStreamingRequest *v23;
  uint64_t v24;
  NSMutableDictionary *storage;
  OPTTSTextToSpeechRouterStreamingStreamingRequest *v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  objc_super v33;

  v5 = a5;
  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)OPTTSTextToSpeechRouterStreamingStreamingRequest;
  v10 = -[OPTTSTextToSpeechRouterStreamingStreamingRequest init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_29;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_30;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechRouterStreamingStreamingRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_28;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_30;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v28 = v18;
  v29 = v19;
  v30 = xmmword_19AE61140;
  v31 = 0;
  v32 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (apple::aiml::flatbuffers2::Table *)v11->_root;
  if (!root)
    goto LABEL_28;
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v28, v11->_root->var0))goto LABEL_30;
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  v22 = *v21;
  if (v22 >= 5 && v21[2] && (v29 < 2 || v29 - 1 < (unint64_t)root + v21[2] - v28))
    goto LABEL_30;
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(root, (const apple::aiml::flatbuffers2::Verifier *)&v28, 6u))
    goto LABEL_30;
  if (v22 >= 7)
  {
    if (v21[3])
    {
      v23 = (apple::aiml::flatbuffers2::Table *)((char *)root + v21[3] + *(unsigned int *)((char *)root + v21[3]));
LABEL_24:
      if (!v21[2]
        || !v23
        || *((_BYTE *)root + v21[2]) != 1
        || siri::speech::schema_fb::StartTextToSpeechStreamingRequest::Verify(v23, (apple::aiml::flatbuffers2::Verifier *)&v28))
      {
        goto LABEL_28;
      }
LABEL_30:
      v26 = 0;
      goto LABEL_31;
    }
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  if (v22 >= 5)
    goto LABEL_23;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v28);
  v24 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v24;

LABEL_29:
  v26 = v11;
LABEL_31:

  return v26;
}

- (int64_t)content_type
{
  const TextToSpeechRouterStreamingStreamingRequest *root;
  const TextToSpeechRouterStreamingStreamingRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (OPTTSStartTextToSpeechStreamingRequest)contentAsOPTTSStartTextToSpeechStreamingRequest
{
  OPTTSStartTextToSpeechStreamingRequest *v3;
  OPTTSStartTextToSpeechStreamingRequest *v4;
  const TextToSpeechRouterStreamingStreamingRequest *root;
  const TextToSpeechRouterStreamingStreamingRequest *v6;
  uint64_t v7;
  const TextToSpeechRouterStreamingStreamingRequest *v8;

  if (-[OPTTSTextToSpeechRouterStreamingStreamingRequest content_type](self, "content_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("content"));
    v3 = (OPTTSStartTextToSpeechStreamingRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [OPTTSStartTextToSpeechStreamingRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[OPTTSStartTextToSpeechStreamingRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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

  if (-[OPTTSTextToSpeechRouterStreamingStreamingRequest content_type](self, "content_type") == 1)
  {
    -[OPTTSTextToSpeechRouterStreamingStreamingRequest contentAsOPTTSStartTextToSpeechStreamingRequest](self, "contentAsOPTTSStartTextToSpeechStreamingRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (FLTBFBufferAccessor *)v3;
}

- (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = -[OPTTSTextToSpeechRouterStreamingStreamingRequest content_type](self, "content_type");
  if (-[OPTTSTextToSpeechRouterStreamingStreamingRequest content_type](self, "content_type") == 1)
  {
    -[OPTTSTextToSpeechRouterStreamingStreamingRequest contentAsOPTTSStartTextToSpeechStreamingRequest](self, "contentAsOPTTSStartTextToSpeechStreamingRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v10 = *((_QWORD *)a3 + 5);
  v9 = *((_QWORD *)a3 + 6);
  v11 = *((_QWORD *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v5);
  if (-[OPTTSTextToSpeechRouterStreamingStreamingRequest content_type](self, "content_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<void>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8);
  return (Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v11 - (int)v9 + (int)v10);
}

- (id)flatbuffData
{
  Offset<siri::speech::qss_fb::TextToSpeechRouterStreamingStreamingRequest> v2;
  const char *v3;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v4;
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
  v13 = xmmword_19AE61150;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSTextToSpeechRouterStreamingStreamingRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__OPTTSTextToSpeechRouterStreamingStreamingRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

apple::aiml::flatbuffers2::DetachedBuffer *__64__OPTTSTextToSpeechRouterStreamingStreamingRequest_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x19AED1A3CLL);
  }
  return result;
}

+ (Class)content_immutableClassForType:(int64_t)a3
{
  if (a3 != 1)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)content_typeForImmutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

@end
