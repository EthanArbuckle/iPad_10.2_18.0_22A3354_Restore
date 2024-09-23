@implementation OPTTSTextToSpeechUserVoiceProfile

- (OPTTSTextToSpeechUserVoiceProfile)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechUserVoiceProfile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechUserVoiceProfile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechUserVoiceProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserVoiceProfile *)a4
{
  return -[OPTTSTextToSpeechUserVoiceProfile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechUserVoiceProfile)initWithFlatbuffData:(id)a3 root:(const TextToSpeechUserVoiceProfile *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechUserVoiceProfile *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechUserVoiceProfile *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TextToSpeechUserVoiceProfile *v19;
  OPTTSTextToSpeechUserVoiceProfile *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechUserVoiceProfile;
  v10 = -[OPTTSTextToSpeechUserVoiceProfile init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechUserVoiceProfile *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechUserVoiceProfile *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::TextToSpeechUserVoiceProfile::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
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

- (float)pitch_mean
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (float)pitch_std
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (float)energy_mean
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 9u)
  {
    v5 = *(unsigned __int16 *)v3[8].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (float)energy_std
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xBu)
  {
    v5 = *(unsigned __int16 *)v3[10].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (float)duration_mean
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (float)duration_std
{
  const TextToSpeechUserVoiceProfile *root;
  const TextToSpeechUserVoiceProfile *v3;
  float result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xFu)
  {
    v5 = *(unsigned __int16 *)v3[14].var0;
    if (v5)
      return *(float *)root[v5].var0;
  }
  return result;
}

- (Offset<siri::speech::schema_fb::TextToSpeechUserVoiceProfile>)addObjectToBuffer:(void *)a3
{
  OPTTSTextToSpeechUserVoiceProfile *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;

  v4 = self;
  -[OPTTSTextToSpeechUserVoiceProfile pitch_mean](self, "pitch_mean");
  v6 = v5;
  -[OPTTSTextToSpeechUserVoiceProfile pitch_std](v4, "pitch_std");
  v8 = v7;
  -[OPTTSTextToSpeechUserVoiceProfile energy_mean](v4, "energy_mean");
  v10 = v9;
  -[OPTTSTextToSpeechUserVoiceProfile energy_std](v4, "energy_std");
  v12 = v11;
  -[OPTTSTextToSpeechUserVoiceProfile duration_mean](v4, "duration_mean");
  v14 = v13;
  -[OPTTSTextToSpeechUserVoiceProfile duration_std](v4, "duration_std");
  v16 = v15;
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v4) = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 6, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 8, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 10, v12);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 12, v14);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>((apple::aiml::flatbuffers2::vector_downward *)a3, 14, v16);
  return (Offset<siri::speech::schema_fb::TextToSpeechUserVoiceProfile>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v4);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechUserVoiceProfile> v2;
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
  v2.var0 = -[OPTTSTextToSpeechUserVoiceProfile addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__OPTTSTextToSpeechUserVoiceProfile_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__49__OPTTSTextToSpeechUserVoiceProfile_flatbuffData__block_invoke(uint64_t a1)
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

@end
