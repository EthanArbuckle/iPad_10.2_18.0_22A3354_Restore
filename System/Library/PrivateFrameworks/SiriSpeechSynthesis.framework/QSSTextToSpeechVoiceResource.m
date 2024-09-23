@implementation QSSTextToSpeechVoiceResource

- (QSSTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechVoiceResource initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechVoiceResource initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4
{
  return -[QSSTextToSpeechVoiceResource initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechVoiceResource)initWithFlatbuffData:(id)a3 root:(const TextToSpeechVoiceResource *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechVoiceResource *v10;
  QSSTextToSpeechVoiceResource *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TextToSpeechVoiceResource *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTextToSpeechVoiceResource *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechVoiceResource;
  v10 = -[QSSTextToSpeechVoiceResource init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_16;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const TextToSpeechVoiceResource *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_16;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_21E34D540;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::TextToSpeechVoiceResource *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechVoiceResource::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (int64_t)type
{
  const TextToSpeechVoiceResource *root;
  const TextToSpeechVoiceResource *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (NSData)data
{
  const TextToSpeechVoiceResource *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechVoiceResource *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = *(unsigned int *)root->var0;
  }
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
}

- (void)data:(id)a3
{
  id v4;
  const TextToSpeechVoiceResource *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const TextToSpeechVoiceResource *v9;
  id v10;

  v4 = a3;
  root = self->_root;
  v6 = *(int *)root->var0;
  v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    v8 = *(unsigned int *)root[v7].var0;
    v9 = &root[v7 + v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
    v8 = *(unsigned int *)root->var0;
  }
  v10 = v4;
  (*((void (**)(id, const TextToSpeechVoiceResource *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>)addObjectToBuffer:(void *)a3
{
  QSSTextToSpeechVoiceResource *v4;
  int v5;
  int v6;
  int v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t (*v14)();
  void *v15;
  int v16;

  v4 = self;
  v5 = -[QSSTextToSpeechVoiceResource type](self, "type");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3812000000;
  v13 = __Block_byref_object_copy__629;
  v14 = __Block_byref_object_dispose__630;
  v15 = &unk_21E36C185;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__QSSTextToSpeechVoiceResource_addObjectToBuffer___block_invoke;
  v9[3] = &unk_24E246AC0;
  v9[4] = &v10;
  v9[5] = a3;
  -[QSSTextToSpeechVoiceResource data:](v4, "data:", v9);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v4) = *((_DWORD *)a3 + 8);
  v6 = *((_DWORD *)a3 + 12);
  v7 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v5);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, *((_DWORD *)v11 + 12));
  LODWORD(a3) = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v4 - v6 + v7);
  _Block_object_dispose(&v10, 8);
  return (Offset<siri::speech::schema_fb::TextToSpeechVoiceResource>)a3;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechVoiceResource> v2;
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
  v2.var0 = -[QSSTextToSpeechVoiceResource addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__QSSTextToSpeechVoiceResource_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__44__QSSTextToSpeechVoiceResource_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __50__QSSTextToSpeechVoiceResource_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
