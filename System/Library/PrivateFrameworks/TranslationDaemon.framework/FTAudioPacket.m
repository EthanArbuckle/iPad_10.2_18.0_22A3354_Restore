@implementation FTAudioPacket

- (FTAudioPacket)initWithFlatbuffData:(id)a3
{
  return -[FTAudioPacket initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTAudioPacket initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4
{
  return -[FTAudioPacket initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTAudioPacket)initWithFlatbuffData:(id)a3 root:(const AudioPacket *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTAudioPacket *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AudioPacket *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::AudioPacket *v19;
  FTAudioPacket *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioPacket;
  v10 = -[FTAudioPacket init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AudioPacket *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_13;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_14;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_249338830;
  v24 = 0;
  v25 = 1;
  v19 = (siri::speech::schema_fb::AudioPacket *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::AudioPacket::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSData)audio_bytes
{
  const AudioPacket *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const AudioPacket *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
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

- (void)audio_bytes:(id)a3
{
  id v4;
  const AudioPacket *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const AudioPacket *v9;
  id v10;

  v4 = a3;
  root = self->_root;
  v6 = *(int *)root->var0;
  v7 = *(unsigned __int16 *)root[-v6 + 4].var0;
  if (*(_WORD *)root[-v6 + 4].var0)
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
  (*((void (**)(id, const AudioPacket *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (Offset<siri::speech::schema_fb::AudioPacket>)addObjectToBuffer:(void *)a3
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)();
  void *v14;
  int v15;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3812000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  v14 = &unk_24937123A;
  v15 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__FTAudioPacket_addObjectToBuffer___block_invoke;
  v8[3] = &unk_251A149E8;
  v8[4] = &v9;
  v8[5] = a3;
  -[FTAudioPacket audio_bytes:](self, "audio_bytes:", v8);
  v3[70] = 1;
  v4 = *((_QWORD *)v3 + 5);
  v5 = *((_QWORD *)v3 + 6);
  v6 = *((_QWORD *)v3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v3, 4, *((_DWORD *)v10 + 12));
  LODWORD(v3) = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)v3, (unsigned __int16)v6 - (unsigned __int16)v5 + (unsigned __int16)v4);
  _Block_object_dispose(&v9, 8);
  return (Offset<siri::speech::schema_fb::AudioPacket>)v3;
}

uint64_t __35__FTAudioPacket_addObjectToBuffer___block_invoke(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t result;

  result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTAudioPacket addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __29__FTAudioPacket_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__29__FTAudioPacket_flatbuffData__block_invoke(uint64_t a1)
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
