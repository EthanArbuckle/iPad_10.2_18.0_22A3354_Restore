@implementation OPTTSTTSWordPhonemes

- (OPTTSTTSWordPhonemes)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSWordPhonemes initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSWordPhonemes initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4
{
  return -[OPTTSTTSWordPhonemes initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTTSWordPhonemes)initWithFlatbuffData:(id)a3 root:(const TTSWordPhonemes *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTTSWordPhonemes *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TTSWordPhonemes *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TTSWordPhonemes *v19;
  OPTTSTTSWordPhonemes *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTTSWordPhonemes;
  v10 = -[OPTTSTTSWordPhonemes init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TTSWordPhonemes *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TTSWordPhonemes *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TTSWordPhonemes::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSArray)phonemes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__OPTTSTTSWordPhonemes_phonemes__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTTSWordPhonemes phonemes_enumerateObjectsUsingBlock:](self, "phonemes_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phonemes"));

  }
  return (NSArray *)v3;
}

- (id)phonemes_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const TTSWordPhonemes *root;
  const TTSWordPhonemes *v10;
  uint64_t v11;
  const TTSWordPhonemes *v12;
  unsigned int *var0;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    var0 = (unsigned int *)v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0].var0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", var0 + 1, *var0, 4);
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (unint64_t)phonemes_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TTSWordPhonemes *root;
  const TTSWordPhonemes *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "count");
  }
  else
  {
    root = self->_root;
    v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 5u && (v8 = *(unsigned __int16 *)v7[4].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)phonemes_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TTSWordPhonemes *root;
  const TTSWordPhonemes *v8;
  uint64_t v9;
  const TTSWordPhonemes *v10;
  uint64_t v11;
  uint64_t v12;
  const TTSWordPhonemes *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);
  }
  else
  {
    root = self->_root;
    v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      v9 = *(unsigned __int16 *)v8[4].var0;
      if (v9)
      {
        v19 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = &v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 4 * v12 - 4;
          do
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v13[*(unsigned int *)v13->var0 + 4], *(unsigned int *)v13[*(unsigned int *)v13->var0].var0, 4);
            v4[2](v4, v16, v14, &v19);
            v17 = v19;

            if (v17)
              break;
            ++v14;
            v13 += 4;
            v18 = v15;
            v15 -= 4;
          }
          while (v18);
        }
      }
    }
  }

}

- (Offset<siri::speech::schema_fb::TTSWordPhonemes>)addObjectToBuffer:(void *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  const char *v12;
  size_t v13;
  int String;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Offset<siri::speech::schema_fb::TTSWordPhonemes> v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE *v36;
  char *v37;
  unint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = 0;
  v38 = 0;
  -[OPTTSTTSWordPhonemes phonemes](self, "phonemes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v36, objc_msgSend(v4, "count"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[OPTTSTTSWordPhonemes phonemes](self, "phonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  v7 = v5;
  v8 = v36;
  if (v6)
  {
    v9 = *(_QWORD *)v33;
    v10 = v38;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v7);
        v12 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i)), "UTF8String");
        v13 = strlen(v12);
        String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v12, v13);
        v15 = String;
        v16 = v37;
        if ((unint64_t)v37 >= v10)
        {
          v18 = (v37 - v8) >> 2;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62)
          {
            v36 = v8;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v10 - (_QWORD)v8) >> 1 > v19)
            v19 = (uint64_t)(v10 - (_QWORD)v8) >> 1;
          if (v10 - (unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v20);
          else
            v21 = 0;
          v22 = (_DWORD *)(v20 + 4 * v18);
          *v22 = v15;
          v17 = (char *)(v22 + 1);
          while (v16 != v8)
          {
            v23 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *--v22 = v23;
          }
          v10 = v20 + 4 * v21;
          v37 = v17;
          if (v8)
            operator delete(v8);
          v8 = v22;
        }
        else
        {
          *(_DWORD *)v37 = String;
          v17 = v16 + 4;
        }
        v37 = v17;
      }
      v38 = v10;
      v36 = v8;
      v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v6);
  }
  else
  {
    v17 = v37;
  }

  if (v17 == v8)
    v24 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v24 = v8;
  v25 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, (v17 - v8) >> 2);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v26 = *((_QWORD *)a3 + 5);
  v27 = *((_QWORD *)a3 + 6);
  v28 = *((_QWORD *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25);
  v29.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v28 - (int)v27 + (int)v26);
  if (v8)
  {
    v37 = v8;
    operator delete(v8);
  }
  return v29;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TTSWordPhonemes> v2;
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
  v2.var0 = -[OPTTSTTSWordPhonemes addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__OPTTSTTSWordPhonemes_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__36__OPTTSTTSWordPhonemes_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __32__OPTTSTTSWordPhonemes_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
