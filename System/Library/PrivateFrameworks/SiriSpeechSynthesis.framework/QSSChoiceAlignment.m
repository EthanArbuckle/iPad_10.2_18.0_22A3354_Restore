@implementation QSSChoiceAlignment

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3
{
  return -[QSSChoiceAlignment initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSChoiceAlignment initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4
{
  return -[QSSChoiceAlignment initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSChoiceAlignment)initWithFlatbuffData:(id)a3 root:(const ChoiceAlignment *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSChoiceAlignment *v10;
  QSSChoiceAlignment *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::ChoiceAlignment *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSChoiceAlignment *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSChoiceAlignment;
  v10 = -[QSSChoiceAlignment init](&v30, sel_init);
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
      a4 = (const ChoiceAlignment *)v13 + *v13;
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
      root = (siri::speech::schema_fb::ChoiceAlignment *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::ChoiceAlignment::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSArray)post_itn_choice_indices
{
  void *v3;
  const ChoiceAlignment *root;
  const ChoiceAlignment *v5;
  uint64_t v6;
  const ChoiceAlignment *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_choice_indices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      v6 = *(unsigned __int16 *)v5[4].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        var0 = (unsigned int *)v7[v8 + 4].var0;
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *var0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

            ++var0;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn_choice_indices"));
  }
  return (NSArray *)v3;
}

- (NSArray)pre_itn_token_to_post_itn_char_alignments
{
  void *v3;
  const ChoiceAlignment *root;
  const ChoiceAlignment *v5;
  uint64_t v6;
  const ChoiceAlignment *v7;
  uint64_t v8;
  uint64_t v9;
  const ChoiceAlignment *v10;
  uint64_t v11;
  QSSRepeatedItnAlignment *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      v6 = *(unsigned __int16 *)v5[6].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = -[QSSRepeatedItnAlignment initWithFlatbuffData:root:verify:]([QSSRepeatedItnAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn_token_to_post_itn_char_alignments"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::ChoiceAlignment>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  int *begin;
  uint64_t v9;
  int *value;
  uint64_t i;
  int v12;
  int v13;
  std::vector<int>::pointer end;
  int *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  unint64_t v22;
  int *v23;
  unsigned int v24;
  void *v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t j;
  int v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  int v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  Offset<siri::speech::schema_fb::ChoiceAlignment> v55;
  unsigned int v57;
  QSSChoiceAlignment *v58;
  flatbuffers::FlatBufferBuilder *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  std::vector<int> v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  memset(&v68, 0, sizeof(v68));
  -[QSSChoiceAlignment post_itn_choice_indices](self, "post_itn_choice_indices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v68, objc_msgSend(v5, "count"));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[QSSChoiceAlignment post_itn_choice_indices](self, "post_itn_choice_indices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (flatbuffers::FlatBufferBuilder *)a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  v58 = self;
  begin = v68.__begin_;
  if (v7)
  {
    v9 = *(_QWORD *)v65;
    value = v68.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v65 != v9)
          objc_enumerationMutation(v6);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "intValue");
        v13 = v12;
        end = v68.__end_;
        if (v68.__end_ >= value)
        {
          v16 = v68.__end_ - begin;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
          {
            v68.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v17)
            v17 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v17;
          if (v18)
            v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v18);
          else
            v19 = 0;
          v20 = (int *)(v18 + 4 * v16);
          *v20 = v13;
          v15 = v20 + 1;
          while (end != begin)
          {
            v21 = *--end;
            *--v20 = v21;
          }
          value = (int *)(v18 + 4 * v19);
          v68.__end_ = v15;
          if (begin)
            operator delete(begin);
          begin = v20;
        }
        else
        {
          *v68.__end_ = v12;
          v15 = end + 1;
        }
        v68.__end_ = v15;
      }
      v68.__end_cap_.__value_ = value;
      v68.__begin_ = begin;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v7);
  }
  else
  {
    v15 = v68.__end_;
  }

  v22 = (unint64_t)v59;
  if (v15 == begin)
    v23 = (int *)&flatbuffers::data<int,std::allocator<int>>(std::vector<int> const&)::t;
  else
    v23 = begin;
  v24 = flatbuffers::FlatBufferBuilder::CreateVector<int>(v59, v23, v15 - begin);
  -[QSSChoiceAlignment pre_itn_token_to_post_itn_char_alignments](v58, "pre_itn_token_to_post_itn_char_alignments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");
  v57 = v24;
  if (v26)
  {
    if (v26 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v26);
    v29 = &v27[4 * v28];
  }
  else
  {
    v27 = 0;
    v29 = 0;
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[QSSChoiceAlignment pre_itn_token_to_post_itn_char_alignments](v58, "pre_itn_token_to_post_itn_char_alignments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v61;
    v33 = v27;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v61 != v32)
          objc_enumerationMutation(v30);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "addObjectToBuffer:", v22);
        v36 = v35;
        if (v33 >= v29)
        {
          v37 = (v33 - v27) >> 2;
          v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v29 - v27) >> 1 > v38)
            v38 = (v29 - v27) >> 1;
          if ((unint64_t)(v29 - v27) >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v38;
          if (v39)
            v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v39);
          else
            v40 = 0;
          v41 = (char *)(v39 + 4 * v37);
          *(_DWORD *)v41 = v36;
          v42 = v41 + 4;
          while (v33 != v27)
          {
            v43 = *((_DWORD *)v33 - 1);
            v33 -= 4;
            *((_DWORD *)v41 - 1) = v43;
            v41 -= 4;
          }
          v29 = (char *)(v39 + 4 * v40);
          if (v27)
            operator delete(v27);
          v27 = v41;
          v33 = v42;
          v22 = (unint64_t)v59;
        }
        else
        {
          *(_DWORD *)v33 = v35;
          v33 += 4;
        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    }
    while (v31);
  }
  else
  {
    v33 = v27;
  }

  v44 = v33 - v27;
  if (v33 == v27)
    v45 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::RepeatedItnAlignment>> const&)::t;
  else
    v45 = v27;
  v46 = v44 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)v22, v44 >> 2, 4uLL);
  if (v27 == v33)
  {
    LODWORD(v46) = 0;
  }
  else
  {
    v47 = v45 - 4;
    v48 = v46;
    do
    {
      v49 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v22, *(_DWORD *)&v47[4 * v48]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>(v22, v49);
      --v48;
    }
    while (v48);
  }
  v50 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)v22, v46);
  flatbuffers::FlatBufferBuilder::NotNested(v22);
  *(_BYTE *)(v22 + 70) = 1;
  v51 = *(_DWORD *)(v22 + 32);
  v52 = *(_DWORD *)(v22 + 48);
  v53 = *(_DWORD *)(v22 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v22, 4, v57);
  if (v50)
  {
    v54 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)v22, v50);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v22, 6, v54);
  }
  v55.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v22, v51 - v52 + v53);
  if (v27)
    operator delete(v27);
  if (v68.__begin_)
    operator delete(v68.__begin_);
  return v55;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ChoiceAlignment> v2;
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
  v2.var0 = -[QSSChoiceAlignment addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__QSSChoiceAlignment_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__34__QSSChoiceAlignment_flatbuffData__block_invoke(uint64_t a1)
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

@end
