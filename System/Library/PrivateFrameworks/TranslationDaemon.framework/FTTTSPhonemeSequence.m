@implementation FTTTSPhonemeSequence

- (FTTTSPhonemeSequence)initWithFlatbuffData:(id)a3
{
  return -[FTTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4
{
  return -[FTTTSPhonemeSequence initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTTSPhonemeSequence)initWithFlatbuffData:(id)a3 root:(const TTSPhonemeSequence *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTTSPhonemeSequence *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TTSPhonemeSequence *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TTSPhonemeSequence *v19;
  FTTTSPhonemeSequence *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTTSPhonemeSequence;
  v10 = -[FTTTSPhonemeSequence init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TTSPhonemeSequence *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TTSPhonemeSequence *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TTSPhonemeSequence::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
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
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTTTSPhonemeSequence_word_phonemes__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTTSPhonemeSequence word_phonemes_enumerateObjectsUsingBlock:](self, "word_phonemes_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("word_phonemes"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTTTSPhonemeSequence_word_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)word_phonemes_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSWordPhonemes *v7;
  FTTTSWordPhonemes *v8;
  const TTSPhonemeSequence *root;
  const TTSPhonemeSequence *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_phonemes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSWordPhonemes *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTTSWordPhonemes initWithFlatbuffData:root:verify:]([FTTTSWordPhonemes alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

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
  void (**v4)(id, FTTTSWordPhonemes *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TTSPhonemeSequence *root;
  const TTSPhonemeSequence *v8;
  uint64_t v9;
  const TTSPhonemeSequence *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSWordPhonemes *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSWordPhonemes *, uint64_t, unsigned __int8 *))a3;
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
        v20 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = (uint64_t)&v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * v12 - 4;
          do
          {
            v17 = -[FTTTSWordPhonemes initWithFlatbuffData:root:verify:]([FTTTSWordPhonemes alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
            v4[2](v4, v17, v15, &v20);
            v18 = v20;

            if (v18)
              break;
            ++v15;
            v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }

}

- (Offset<siri::speech::schema_fb::TTSPhonemeSequence>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  std::vector<int>::pointer end;
  int *v13;
  std::vector<int>::pointer begin;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  char *v19;
  int *v20;
  int v21;
  std::vector<int>::pointer v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Offset<siri::speech::schema_fb::TTSPhonemeSequence> v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  std::vector<int> v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  memset(&v33, 0, sizeof(v33));
  -[FTTTSPhonemeSequence word_phonemes](self, "word_phonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v33, objc_msgSend(v5, "count"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[FTTTSPhonemeSequence word_phonemes](self, "word_phonemes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v11 = v10;
        end = v33.__end_;
        if (v33.__end_ >= v33.__end_cap_.__value_)
        {
          begin = v33.__begin_;
          v15 = v33.__end_ - v33.__begin_;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v33.__end_cap_.__value_ - (char *)v33.__begin_;
          if (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v33.__end_cap_, v18);
            begin = v33.__begin_;
            end = v33.__end_;
          }
          else
          {
            v19 = 0;
          }
          v20 = (int *)&v19[4 * v15];
          *v20 = v11;
          v13 = v20 + 1;
          while (end != begin)
          {
            v21 = *--end;
            *--v20 = v21;
          }
          v33.__begin_ = v20;
          v33.__end_ = v13;
          v33.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v33.__end_ = v10;
          v13 = end + 1;
        }
        v33.__end_ = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  if (v33.__end_ == v33.__begin_)
    v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSWordPhonemes>> const&)::t;
  else
    v22 = v33.__begin_;
  v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v33.__end_ - v33.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v24 = *((_QWORD *)a3 + 5);
  v25 = *((_QWORD *)a3 + 6);
  v26 = *((_QWORD *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v23);
  v27.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v26 - (unsigned __int16)v25 + (unsigned __int16)v24);
  if (v33.__begin_)
  {
    v33.__end_ = v33.__begin_;
    operator delete(v33.__begin_);
  }
  return v27;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTTSPhonemeSequence addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __36__FTTTSPhonemeSequence_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTTTSPhonemeSequence_flatbuffData__block_invoke(uint64_t a1)
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
