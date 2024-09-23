@implementation FLTSSUFile

- (FLTSSUFile)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUFile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUFile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4
{
  return -[FLTSSUFile initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUFile)initWithFlatbuffData:(id)a3 root:(const SSUFile *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUFile *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SSUFile *root;
  uint64_t v17;
  unint64_t v18;
  apple::aiml::flatbuffers2::Table *v19;
  unsigned __int16 *v20;
  unsigned int v21;
  unsigned __int16 *v22;
  uint64_t v23;
  const unsigned __int8 *v24;
  SSUCategory *v25;
  uint64_t v26;
  uint64_t v27;
  FLTSSUFile *v28;
  uint64_t v30;
  unint64_t v31;
  __int128 v32;
  uint64_t v33;
  char v34;
  objc_super v35;

  v5 = a5;
  v9 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FLTSSUFile;
  v10 = -[FLTSSUFile init](&v35, sel_init);
  if (!v10)
    goto LABEL_37;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_38;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SSUFile *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_37;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_38;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v30 = v17;
  v31 = v18;
  v32 = xmmword_1C2047DF0;
  v33 = 0;
  v34 = 1;
  if (v18 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
  if (!v19)
    goto LABEL_37;
  if (!apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v30, v10->_root->var0))goto LABEL_38;
  v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  v21 = *v20;
  if (v21 >= 5 && v20[2] && (v31 < 3 || v31 - 2 < (unint64_t)v19 + v20[2] - v30))
    goto LABEL_38;
  if (!apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 6u)
    || v21 >= 7
    && v20[3]
    && !SSUMetadata::Verify((SSUMetadata *)v19 + v20[3] + *(unsigned int *)((char *)v19 + v20[3]), (apple::aiml::flatbuffers2::Verifier *)&v30)|| !apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 8u))
  {
    goto LABEL_38;
  }
  v22 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
  if (*v22 >= 9u && (v23 = v22[4]) != 0)
    v24 = (const unsigned __int8 *)v19 + v23 + *(unsigned int *)((char *)v19 + v23);
  else
    v24 = 0;
  if (!apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v30, v24)
    || !apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v30, 0xAu))
  {
    goto LABEL_38;
  }
  v25 = 0;
  v26 = *(int *)v19;
  if (*(unsigned __int16 *)((char *)v19 - v26) < 0xBu)
    goto LABEL_36;
  if (*(_WORD *)((char *)v19 - v26 + 10))
  {
    if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v30, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v26 + 10)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v26 + 10)), 4uLL, 0))
    {
      v25 = 0;
      v26 = *(int *)v19;
      if (*(unsigned __int16 *)((char *)v19 - v26) < 0xBu)
        goto LABEL_36;
      goto LABEL_33;
    }
LABEL_38:
    v28 = 0;
    goto LABEL_39;
  }
LABEL_33:
  v27 = *(unsigned __int16 *)((char *)v19 - v26 + 10);
  if (v27)
    v25 = (SSUCategory *)v19 + v27 + *(unsigned int *)((char *)v19 + v27);
  else
    v25 = 0;
LABEL_36:
  if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<SSUCategory>((apple::aiml::flatbuffers2::Verifier *)&v30, v25))goto LABEL_38;
LABEL_37:
  v28 = v10;
LABEL_39:

  return v28;
}

- (unsigned)format_version
{
  const SSUFile *root;
  const SSUFile *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_WORD *)root[v4].var0;
  else
    return 0;
}

- (FLTSSUMetadata)metadata
{
  FLTSSUMetadata *v3;
  FLTSSUMetadata *v4;
  const SSUFile *root;
  const SSUFile *v6;
  uint64_t v7;
  const SSUFile *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("metadata"));
  v3 = (FLTSSUMetadata *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FLTSSUMetadata alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FLTSSUMetadata initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("metadata"));
  }
  return v3;
}

- (NSString)locale
{
  const SSUFile *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SSUFile *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSArray)categories
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("categories"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __24__FLTSSUFile_categories__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUFile categories_enumerateObjectsUsingBlock:](self, "categories_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("categories"));

  }
  return (NSArray *)v3;
}

- (id)categories_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FLTSSUCategory *v7;
  FLTSSUCategory *v8;
  const SSUFile *root;
  const SSUFile *v10;
  uint64_t v11;
  const SSUFile *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("categories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FLTSSUCategory *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[FLTSSUCategory initWithFlatbuffData:root:verify:]([FLTSSUCategory alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)categories_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUFile *root;
  const SSUFile *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("categories"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (v8 = *(unsigned __int16 *)v7[10].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)categories_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FLTSSUCategory *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SSUFile *root;
  const SSUFile *v8;
  uint64_t v9;
  const SSUFile *v10;
  uint64_t v11;
  uint64_t v12;
  const SSUFile *v13;
  uint64_t v14;
  uint64_t v15;
  FLTSSUCategory *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, FLTSSUCategory *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("categories"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      v9 = *(unsigned __int16 *)v8[10].var0;
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
            v16 = -[FLTSSUCategory initWithFlatbuffData:root:verify:]([FLTSSUCategory alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (Offset<SSUFile>)addObjectToBuffer:(void *)a3
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  const char *v8;
  size_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t i;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  int v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  int v45;
  int v46;
  Offset<SSUFile> v47;
  unsigned int String;
  unsigned int v50;
  int v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v51 = -[FLTSSUFile format_version](self, "format_version");
  -[FLTSSUFile metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  -[FLTSSUFile locale](self, "locale");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E7BB3508;
  v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String");
  v9 = strlen(v8);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v8, v9);

  -[FLTSSUFile categories](self, "categories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = a3;
  if (v11)
  {
    if (v11 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v11);
    v15 = &v13[4 * v14];
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[FLTSSUFile categories](self, "categories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  v50 = v5;
  if (v17)
  {
    v18 = *(_QWORD *)v54;
    v19 = v13;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "addObjectToBuffer:", v12);
        v22 = v21;
        if (v19 >= v15)
        {
          v23 = (v19 - v13) >> 2;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v15 - v13) >> 1 > v24)
            v24 = (v15 - v13) >> 1;
          if ((unint64_t)(v15 - v13) >= 0x7FFFFFFFFFFFFFFCLL)
            v25 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v25 = v24;
          if (v25)
            v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v25);
          else
            v26 = 0;
          v27 = (char *)(v25 + 4 * v23);
          *(_DWORD *)v27 = v22;
          v28 = v27 + 4;
          while (v19 != v13)
          {
            v29 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v29;
            v27 -= 4;
          }
          v15 = (char *)(v25 + 4 * v26);
          if (v13)
            operator delete(v13);
          v13 = v27;
          v19 = v28;
          v12 = a3;
        }
        else
        {
          *(_DWORD *)v19 = v21;
          v19 += 4;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v17);
  }
  else
  {
    v19 = v13;
  }

  v30 = v19 - v13;
  if (v19 == v13)
    v31 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUCategory>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUCategory>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUCategory>> const&)::t;
  else
    v31 = v13;
  v32 = v30 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v30 >> 2, 4uLL);
  if (v13 == v19)
  {
    LODWORD(v32) = 0;
  }
  else
  {
    v33 = v31 - 4;
    v34 = v32;
    do
    {
      v35 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v33[4 * v34]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v35);
      --v34;
    }
    while (v34);
  }
  v36 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  v37 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v32);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_DWORD *)a3 + 8);
  v39 = *((_DWORD *)a3 + 12);
  v40 = *((_DWORD *)a3 + 10);
  if (v51 || *((_BYTE *)a3 + 80))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 2uLL);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 2uLL);
    v41 = *((_QWORD *)a3 + 6);
    *(_WORD *)(v41 - 2) = v51;
    v41 -= 2;
    *((_QWORD *)a3 + 6) = v41;
    v43 = *((_QWORD *)a3 + 4);
    v42 = *((_QWORD *)a3 + 5);
    apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a3, 8uLL);
    **((_QWORD **)a3 + 7) = (v43 - v41 + v42) | 0x400000000;
    *((_QWORD *)a3 + 7) += 8;
    ++*((_DWORD *)a3 + 16);
    v44 = *((unsigned __int16 *)a3 + 34);
    if (v44 <= 4)
      LOWORD(v44) = 4;
    *((_WORD *)a3 + 34) = v44;
    v36 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  if (v50)
  {
    v45 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v36, v50);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v36, 6, v45, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v36, 8, String);
  if (v37)
  {
    v46 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v36, v37);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v36, 10, v46, 0);
  }
  v47.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v36, v38 - v39 + v40);
  if (v13)
    operator delete(v13);
  return v47;
}

- (id)flatbuffData
{
  Offset<SSUFile> v2;
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
  v2.var0 = -[FLTSSUFile addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__FLTSSUFile_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__26__FLTSSUFile_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __24__FLTSSUFile_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
