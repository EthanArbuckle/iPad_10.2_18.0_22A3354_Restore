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
  OPTTSAudioDescription *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::AudioDescription *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  OPTTSAudioDescription *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSAudioDescription;
  v10 = -[OPTTSAudioDescription init](&v30, sel_init);
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
      a4 = (const AudioDescription *)v13 + *v13;
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
      v27 = xmmword_21AACED40;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::AudioDescription *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::AudioDescription::Verify(root, (flatbuffers::Verifier *)&v25))
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
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v14 = *((_QWORD *)a3 + 5);
  v13 = *((_QWORD *)a3 + 6);
  v15 = *((_QWORD *)a3 + 4);
  if (v6 != 0.0 || *((_BYTE *)a3 + 80))
  {
    v28 = *((_QWORD *)a3 + 5);
    v14 = *((_QWORD *)a3 + 4);
    flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)a3, 8uLL);
    flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a3, 8uLL);
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
    flatbuffers::vector_downward::ensure_space((flatbuffers::vector_downward *)a3, 8uLL);
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
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v29);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v30);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 10, v7);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v8);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v9);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 16, v10);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v11);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v12);
  return (Offset<siri::speech::schema_fb::AudioDescription>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v26);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::AudioDescription> v2;
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
  v2.var0 = -[OPTTSAudioDescription addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__OPTTSAudioDescription_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__37__OPTTSAudioDescription_flatbuffData__block_invoke(uint64_t a1)
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
