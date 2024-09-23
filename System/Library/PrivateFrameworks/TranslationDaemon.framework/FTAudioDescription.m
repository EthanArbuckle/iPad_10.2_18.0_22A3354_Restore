@implementation FTAudioDescription

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  Float64 v5;
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  retstr->mFormatID = -[FTAudioDescription format_id](self, "format_id");
  -[FTAudioDescription sample_rate](self, "sample_rate");
  retstr->mSampleRate = v5;
  retstr->mFormatFlags = -[FTAudioDescription format_flags](self, "format_flags");
  retstr->mBytesPerPacket = -[FTAudioDescription bytes_per_packet](self, "bytes_per_packet");
  retstr->mFramesPerPacket = -[FTAudioDescription frames_per_packet](self, "frames_per_packet");
  retstr->mBytesPerFrame = -[FTAudioDescription bytes_per_frame](self, "bytes_per_frame");
  retstr->mChannelsPerFrame = -[FTAudioDescription channels_per_frame](self, "channels_per_frame");
  retstr->mBitsPerChannel = -[FTAudioDescription bits_per_channel](self, "bits_per_channel");
  result = (AudioStreamBasicDescription *)-[FTAudioDescription reserved](self, "reserved");
  retstr->mReserved = result;
  return result;
}

- (FTAudioDescription)initWithFlatbuffData:(id)a3
{
  return -[FTAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4
{
  return -[FTAudioDescription initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTAudioDescription)initWithFlatbuffData:(id)a3 root:(const AudioDescription *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTAudioDescription *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const AudioDescription *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::AudioDescription *v19;
  FTAudioDescription *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioDescription;
  v10 = -[FTAudioDescription init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const AudioDescription *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::AudioDescription *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::AudioDescription::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
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
  FTAudioDescription *v4;
  double v5;
  double v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v4 = self;
  -[FTAudioDescription sample_rate](self, "sample_rate");
  v6 = v5;
  v7 = -[FTAudioDescription format_id](v4, "format_id");
  v8 = -[FTAudioDescription format_flags](v4, "format_flags");
  v9 = -[FTAudioDescription bytes_per_packet](v4, "bytes_per_packet");
  v10 = -[FTAudioDescription frames_per_packet](v4, "frames_per_packet");
  v11 = -[FTAudioDescription bytes_per_frame](v4, "bytes_per_frame");
  v12 = -[FTAudioDescription channels_per_frame](v4, "channels_per_frame");
  v13 = -[FTAudioDescription bits_per_channel](v4, "bits_per_channel");
  LODWORD(v4) = -[FTAudioDescription reserved](v4, "reserved");
  *((_BYTE *)a3 + 70) = 1;
  v14 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<double>((char *)a3, 4, v6, 0.0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 6, v7, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v8, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 10, v9, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 12, v10, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 14, v11, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 16, v12, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 18, v13, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 20, (int)v4, 0);
  return (Offset<siri::speech::schema_fb::AudioDescription>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTAudioDescription addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __34__FTAudioDescription_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__34__FTAudioDescription_flatbuffData__block_invoke(uint64_t a1)
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
