@implementation OPTTSTTSPhonemeSequence

- (OPTTSTTSPhonemeSequence)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4
{
  return -[OPTTSTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTTSPhonemeSequence *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TTSPhonemeSequence *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TTSPhonemeSequence *v19;
  OPTTSTTSPhonemeSequence *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTTSPhonemeSequence;
  v10 = -[OPTTSTTSPhonemeSequence init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TTSPhonemeSequence *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TTSPhonemeSequence *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TTSPhonemeSequence::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSArray)word_phonemes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_phonemes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__OPTTSTTSPhonemeSequence_word_phonemes__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTTSPhonemeSequence word_phonemes_enumerateObjectsUsingBlock:](self, "word_phonemes_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("word_phonemes"));

  }
  return (NSArray *)v3;
}

- (id)word_phonemes_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSWordPhonemes *v7;
  OPTTSTTSWordPhonemes *v8;
  const TTSPhonemeSequence *root;
  const TTSPhonemeSequence *v10;
  uint64_t v11;
  const TTSPhonemeSequence *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_phonemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSWordPhonemes *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[OPTTSTTSWordPhonemes initWithFlatbuffData:root:verify:]([OPTTSTTSWordPhonemes alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)word_phonemes_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TTSPhonemeSequence *root;
  const TTSPhonemeSequence *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_phonemes"));
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

- (void)word_phonemes_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, OPTTSTTSWordPhonemes *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TTSPhonemeSequence *root;
  const TTSPhonemeSequence *v8;
  uint64_t v9;
  const TTSPhonemeSequence *v10;
  uint64_t v11;
  uint64_t v12;
  const TTSPhonemeSequence *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSWordPhonemes *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSWordPhonemes *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_phonemes"));
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
            v16 = -[OPTTSTTSWordPhonemes initWithFlatbuffData:root:verify:]([OPTTSTTSWordPhonemes alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (Offset<siri::speech::schema_fb::TTSPhonemeSequence>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  Offset<siri::speech::schema_fb::TTSPhonemeSequence> v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[OPTTSTTSPhonemeSequence word_phonemes](self, "word_phonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v6);
    v9 = &v7[4 * v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[OPTTSTTSPhonemeSequence word_phonemes](self, "word_phonemes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    v13 = v7;
    v37 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v16 = v15;
        if (v13 >= v9)
        {
          v17 = (v13 - v7) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v9 - v7) >> 1 > v18)
            v18 = (v9 - v7) >> 1;
          if ((unint64_t)(v9 - v7) >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v19);
          else
            v20 = 0;
          v21 = (char *)(v19 + 4 * v17);
          *(_DWORD *)v21 = v16;
          v22 = v21 + 4;
          while (v13 != v7)
          {
            v23 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v23;
            v21 -= 4;
          }
          v9 = (char *)(v19 + 4 * v20);
          if (v7)
            operator delete(v7);
          v7 = v21;
          v13 = v22;
          v10 = v37;
        }
        else
        {
          *(_DWORD *)v13 = v15;
          v13 += 4;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v11);
  }
  else
  {
    v13 = v7;
  }

  v24 = v13 - v7;
  if (v13 == v7)
    v25 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>> const&)::t;
  else
    v25 = v7;
  v26 = v24 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24 >> 2, 4uLL);
  if (v7 == v13)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    v28 = v26;
    do
    {
      v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v27[4 * v28]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v29);
      --v28;
    }
    while (v28);
  }
  v30 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v26);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v31 = *((_QWORD *)a3 + 5);
  v32 = *((_QWORD *)a3 + 6);
  v33 = *((_QWORD *)a3 + 4);
  if (v30)
  {
    v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v30);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v34);
  }
  v35.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (int)v33 - (int)v32 + (int)v31);
  if (v7)
    operator delete(v7);
  return v35;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TTSPhonemeSequence> v2;
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
  v2.var0 = -[OPTTSTTSPhonemeSequence addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__OPTTSTTSPhonemeSequence_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__39__OPTTSTTSPhonemeSequence_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __40__OPTTSTTSPhonemeSequence_word_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
