@implementation OPTTSAudioDescription

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3
{
  return -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4
{
  return -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSAudioDescription *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AudioDescription *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::AudioDescription *v19;
  OPTTSAudioDescription *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSAudioDescription;
  v10 = -[OPTTSAudioDescription init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AudioDescription *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::AudioDescription *)v10->_root;
  if (v19 && !siri::speech::schema_fb::AudioDescription::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (double)sample_rate
{
  const AudioDescription *root;
  const AudioDescription *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 5u)
  {
    v5 = *(unsigned __int16 *)v3[4].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (unsigned)format_id
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)format_flags
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)bytes_per_packet
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)frames_per_packet
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)bytes_per_frame
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)channels_per_frame
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)bits_per_channel
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (v4 = *(unsigned __int16 *)v3[18].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (unsigned)reserved
{
  const AudioDescription *root;
  const AudioDescription *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (Offset<siri::speech::schema_fb::AudioDescription>)addObjectToBuffer:(void *)a3
{
  double v5;
  double v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v28;
  int v29;
  int v30;

  -[OPTTSAudioDescription sample_rate](self, "sample_rate");
  v6 = v5;
  v29 = -[OPTTSAudioDescription format_id](self, "format_id");
  v30 = -[OPTTSAudioDescription format_flags](self, "format_flags");
  v7 = -[OPTTSAudioDescription bytes_per_packet](self, "bytes_per_packet");
  v8 = -[OPTTSAudioDescription frames_per_packet](self, "frames_per_packet");
  v9 = -[OPTTSAudioDescription bytes_per_frame](self, "bytes_per_frame");
  v10 = -[OPTTSAudioDescription channels_per_frame](self, "channels_per_frame");
  v11 = -[OPTTSAudioDescription bits_per_channel](self, "bits_per_channel");
  v12 = -[OPTTSAudioDescription reserved](self, "reserved");
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v14 = *((_QWORD *)a3 + 5);
  v13 = *((_QWORD *)a3 + 6);
  v15 = *((_QWORD *)a3 + 4);
  if (v6 != 0.0 || *((_BYTE *)a3 + 80))
  {
    v28 = *((_QWORD *)a3 + 5);
    v14 = *((_QWORD *)a3 + 4);
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    v16 = *((_QWORD *)a3 + 6);
    *(double *)(v16 - 8) = v6;
    v16 -= 8;
    *((_QWORD *)a3 + 6) = v16;
    v17 = v7;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    v21 = v11;
    v22 = v12;
    v23 = (*((_DWORD *)a3 + 8) - v16 + *((_DWORD *)a3 + 10));
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    v24 = v23 | 0x400000000;
    v12 = v22;
    v11 = v21;
    v10 = v20;
    v9 = v19;
    v8 = v18;
    v7 = v17;
    **((_QWORD **)a3 + 7) = v24;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    v25 = *((unsigned __int16 *)a3 + 34);
    if (v25 <= 4)
      LOWORD(v25) = 4;
    LODWORD(v15) = v14;
    LODWORD(v14) = v28;
    *((_WORD *)a3 + 34) = v25;
  }
  v26 = v15 - v13 + v14;
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v29);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v30);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v7);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v9);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v12);
  return (Offset<siri::speech::schema_fb::AudioDescription>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v26);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::AudioDescription> v2;
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
  v2.var0 = -[OPTTSAudioDescription addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__OPTTSAudioDescription_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__37__OPTTSAudioDescription_flatbuffData__block_invoke(uint64_t a1)
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

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  Float64 v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  retstr->mFormatID = -[OPTTSAudioDescription format_id](self, "format_id");
  -[OPTTSAudioDescription sample_rate](self, "sample_rate");
  retstr->mSampleRate = v5;
  retstr->mFormatFlags = -[OPTTSAudioDescription format_flags](self, "format_flags");
  retstr->mBytesPerPacket = -[OPTTSAudioDescription bytes_per_packet](self, "bytes_per_packet");
  retstr->mFramesPerPacket = -[OPTTSAudioDescription frames_per_packet](self, "frames_per_packet");
  retstr->mBytesPerFrame = -[OPTTSAudioDescription bytes_per_frame](self, "bytes_per_frame");
  retstr->mChannelsPerFrame = -[OPTTSAudioDescription channels_per_frame](self, "channels_per_frame");
  retstr->mBitsPerChannel = -[OPTTSAudioDescription bits_per_channel](self, "bits_per_channel");
  result = (AudioStreamBasicDescription *)-[OPTTSAudioDescription reserved](self, "reserved");
  retstr->mReserved = result;
  return result;
}

@end
