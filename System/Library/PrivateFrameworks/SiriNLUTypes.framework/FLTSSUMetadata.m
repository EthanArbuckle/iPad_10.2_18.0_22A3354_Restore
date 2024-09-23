@implementation FLTSSUMetadata

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUMetadata initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUMetadata initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4
{
  return -[FLTSSUMetadata initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUMetadata)initWithFlatbuffData:(id)a3 root:(const SSUMetadata *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUMetadata *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SSUMetadata *root;
  uint64_t v17;
  unint64_t v18;
  SSUMetadata *v19;
  FLTSSUMetadata *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUMetadata;
  v10 = -[FLTSSUMetadata init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SSUMetadata *)v12 + *v12;
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
  v23 = xmmword_1C2047DF0;
  v24 = 0;
  v25 = 1;
  if (v18 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v19 = (SSUMetadata *)v10->_root;
  if (v19 && !SSUMetadata::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSString)data_version
{
  const SSUMetadata *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SSUMetadata *v6;

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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (int64_t)timestamp
{
  const SSUMetadata *root;
  const SSUMetadata *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_QWORD *)root[v4].var0;
  else
    return 0;
}

- (NSArray)user_data
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_data"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27__FLTSSUMetadata_user_data__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUMetadata user_data_enumerateObjectsUsingBlock:](self, "user_data_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_data"));

  }
  return (NSArray *)v3;
}

- (id)user_data_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const SSUMetadata *root;
  const SSUMetadata *v10;
  uint64_t v11;
  const SSUMetadata *v12;
  unsigned int *var0;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_data"));
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
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
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

- (unint64_t)user_data_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUMetadata *root;
  const SSUMetadata *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_data"));
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
    if (*(unsigned __int16 *)v7->var0 >= 9u && (v8 = *(unsigned __int16 *)v7[8].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)user_data_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SSUMetadata *root;
  const SSUMetadata *v8;
  uint64_t v9;
  const SSUMetadata *v10;
  uint64_t v11;
  uint64_t v12;
  const SSUMetadata *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_data"));
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
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      v9 = *(unsigned __int16 *)v8[8].var0;
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

- (NSString)encoder_version
{
  const SSUMetadata *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SSUMetadata *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (Offset<SSUMetadata>)addObjectToBuffer:(void *)a3
{
  __CFString *v3;
  __CFString *v4;
  const char *v5;
  size_t v6;
  void *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t i;
  const char *v18;
  size_t v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v34;
  int v35;
  unsigned int v36;
  __CFString *v37;
  __CFString *v38;
  const char *v39;
  size_t v40;
  unsigned int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  Offset<SSUMetadata> v50;
  unsigned int String;
  int64_t v53;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  -[FLTSSUMetadata data_version](self, "data_version");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E7BB3508;
  v5 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String");
  v6 = strlen(v5);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v5, v6);

  v53 = -[FLTSSUMetadata timestamp](self, "timestamp");
  -[FLTSSUMetadata user_data](self, "user_data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v8 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v8);
    v11 = &v9[4 * v10];
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[FLTSSUMetadata user_data](self, "user_data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v57;
    v15 = v9;
    v16 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v57 != v14)
          objc_enumerationMutation(v12);
        v18 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i)), "UTF8String");
        v19 = strlen(v18);
        v20 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);
        v21 = v20;
        if (v15 >= v11)
        {
          v22 = (v15 - v9) >> 2;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v11 - v9) >> 1 > v23)
            v23 = (v11 - v9) >> 1;
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v24);
          else
            v25 = 0;
          v26 = (char *)(v24 + 4 * v22);
          *(_DWORD *)v26 = v21;
          v27 = v26 + 4;
          while (v15 != v9)
          {
            v28 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v26 - 1) = v28;
            v26 -= 4;
          }
          v11 = (char *)(v24 + 4 * v25);
          if (v9)
            operator delete(v9);
          v9 = v26;
          v15 = v27;
          v12 = v16;
        }
        else
        {
          *(_DWORD *)v15 = v20;
          v15 += 4;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  v29 = v15 - v9;
  if (v15 == v9)
    v30 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v30 = v9;
  v31 = v29 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v31) = 0;
    v34 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  else
  {
    v32 = v30 - 4;
    v33 = v31;
    v34 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
    do
    {
      v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v32[4 * v33]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v35);
      --v33;
    }
    while (v33);
  }
  v36 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v34, v31);
  -[FLTSSUMetadata encoder_version](self, "encoder_version");
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (!v37)
    v37 = &stru_1E7BB3508;
  v39 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v37), "UTF8String");
  v40 = strlen(v39);
  v41 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v39, v40);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v42 = *((_DWORD *)a3 + 8);
  v43 = *((_DWORD *)a3 + 12);
  v44 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  if (v53 || *((_BYTE *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    v45 = *((_QWORD *)a3 + 6);
    *(_QWORD *)(v45 - 8) = v53;
    v45 -= 8;
    *((_QWORD *)a3 + 6) = v45;
    v47 = *((_QWORD *)a3 + 4);
    v46 = *((_QWORD *)a3 + 5);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((_QWORD **)a3 + 7) = (v47 - v45 + v46) | 0x600000000;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    v48 = *((unsigned __int16 *)a3 + 34);
    if (v48 <= 6)
      LOWORD(v48) = 6;
    *((_WORD *)a3 + 34) = v48;
  }
  if (v36)
  {
    v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v36);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v49, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v41);
  v50.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42 - v43 + v44);
  if (v9)
    operator delete(v9);
  return v50;
}

- (id)flatbuffData
{
  Offset<SSUMetadata> v2;
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
  v13 = xmmword_1C2047E00;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[FLTSSUMetadata addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__FLTSSUMetadata_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__30__FLTSSUMetadata_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x1C3BB720CLL);
  }
  return result;
}

uint64_t __27__FLTSSUMetadata_user_data__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
