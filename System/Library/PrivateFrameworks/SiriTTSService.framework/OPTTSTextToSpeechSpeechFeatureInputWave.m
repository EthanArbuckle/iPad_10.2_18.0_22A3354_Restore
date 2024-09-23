@implementation OPTTSTextToSpeechSpeechFeatureInputWave

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechSpeechFeatureInputWave initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechSpeechFeatureInputWave initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4
{
  return -[OPTTSTextToSpeechSpeechFeatureInputWave initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechSpeechFeatureInputWave)initWithFlatbuffData:(id)a3 root:(const TextToSpeechSpeechFeatureInputWave *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechSpeechFeatureInputWave *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechSpeechFeatureInputWave *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TextToSpeechVoiceResource *v19;
  OPTTSTextToSpeechSpeechFeatureInputWave *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechSpeechFeatureInputWave;
  v10 = -[OPTTSTextToSpeechSpeechFeatureInputWave init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechSpeechFeatureInputWave *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_14;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_15;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_19AE61140;
  v24 = 0;
  v25 = 1;
  if (v18 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v19 = (siri::speech::schema_fb::TextToSpeechVoiceResource *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechVoiceResource::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    v20 = 0;
  }
  else
  {
LABEL_14:
    v20 = v10;
  }

  return v20;
}

- (int)sample_rate
{
  const TextToSpeechSpeechFeatureInputWave *root;
  const TextToSpeechSpeechFeatureInputWave *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSData)pcm_data
{
  const TextToSpeechSpeechFeatureInputWave *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechSpeechFeatureInputWave *v6;

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
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
}

- (void)pcm_data:(id)a3
{
  id v4;
  const TextToSpeechSpeechFeatureInputWave *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const TextToSpeechSpeechFeatureInputWave *v9;
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
  (*((void (**)(id, const TextToSpeechSpeechFeatureInputWave *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave>)addObjectToBuffer:(void *)a3
{
  OPTTSTextToSpeechSpeechFeatureInputWave *v4;
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
  v5 = -[OPTTSTextToSpeechSpeechFeatureInputWave sample_rate](self, "sample_rate");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3812000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = &unk_19AE90C62;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__OPTTSTextToSpeechSpeechFeatureInputWave_addObjectToBuffer___block_invoke;
  v9[3] = &unk_1E3A15F28;
  v9[4] = &v10;
  v9[5] = a3;
  -[OPTTSTextToSpeechSpeechFeatureInputWave pcm_data:](v4, "pcm_data:", v9);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v4) = *((_DWORD *)a3 + 8);
  v6 = *((_DWORD *)a3 + 12);
  v7 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v11 + 12));
  LODWORD(a3) = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v4 - v6 + v7);
  _Block_object_dispose(&v10, 8);
  return (Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave>)a3;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechSpeechFeatureInputWave> v2;
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
  v2.var0 = -[OPTTSTextToSpeechSpeechFeatureInputWave addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__OPTTSTextToSpeechSpeechFeatureInputWave_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__55__OPTTSTextToSpeechSpeechFeatureInputWave_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __61__OPTTSTextToSpeechSpeechFeatureInputWave_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
