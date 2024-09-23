@implementation FLTSSUCategoryGroup

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3
{
  return -[FLTSSUCategoryGroup initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FLTSSUCategoryGroup initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4
{
  return -[FLTSSUCategoryGroup initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FLTSSUCategoryGroup)initWithFlatbuffData:(id)a3 root:(const SSUCategoryGroup *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FLTSSUCategoryGroup *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SSUCategoryGroup *root;
  uint64_t v17;
  unint64_t v18;
  SSUCategoryGroup *v19;
  FLTSSUCategoryGroup *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FLTSSUCategoryGroup;
  v10 = -[FLTSSUCategoryGroup init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SSUCategoryGroup *)v12 + *v12;
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
  v19 = (SSUCategoryGroup *)v10->_root;
  if (v19 && !SSUCategoryGroup::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSString)name
{
  const SSUCategoryGroup *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SSUCategoryGroup *v6;

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

- (NSArray)positive_intents
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("positive_intents"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__FLTSSUCategoryGroup_positive_intents__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUCategoryGroup positive_intents_enumerateObjectsUsingBlock:](self, "positive_intents_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("positive_intents"));

  }
  return (NSArray *)v3;
}

- (id)positive_intents_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FLTSSUIntent *v7;
  FLTSSUIntent *v8;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v10;
  uint64_t v11;
  const SSUCategoryGroup *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("positive_intents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FLTSSUIntent *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[FLTSSUIntent initWithFlatbuffData:root:verify:]([FLTSSUIntent alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)positive_intents_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("positive_intents"));
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
    if (*(unsigned __int16 *)v7->var0 >= 7u && (v8 = *(unsigned __int16 *)v7[6].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)positive_intents_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FLTSSUIntent *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v8;
  uint64_t v9;
  const SSUCategoryGroup *v10;
  uint64_t v11;
  uint64_t v12;
  const SSUCategoryGroup *v13;
  uint64_t v14;
  uint64_t v15;
  FLTSSUIntent *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, FLTSSUIntent *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("positive_intents"));
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
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      v9 = *(unsigned __int16 *)v8[6].var0;
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
            v16 = -[FLTSSUIntent initWithFlatbuffData:root:verify:]([FLTSSUIntent alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (NSArray)negative_examples
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("negative_examples"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__FLTSSUCategoryGroup_negative_examples__block_invoke;
    v6[3] = &unk_1E7BB1588;
    v3 = v4;
    v7 = v3;
    -[FLTSSUCategoryGroup negative_examples_enumerateObjectsUsingBlock:](self, "negative_examples_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("negative_examples"));

  }
  return (NSArray *)v3;
}

- (id)negative_examples_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FLTSSUExample *v7;
  FLTSSUExample *v8;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v10;
  uint64_t v11;
  const SSUCategoryGroup *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("negative_examples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FLTSSUExample *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FLTSSUExample initWithFlatbuffData:root:verify:]([FLTSSUExample alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)negative_examples_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("negative_examples"));
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

- (void)negative_examples_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FLTSSUExample *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SSUCategoryGroup *root;
  const SSUCategoryGroup *v8;
  uint64_t v9;
  const SSUCategoryGroup *v10;
  uint64_t v11;
  uint64_t v12;
  const SSUCategoryGroup *v13;
  uint64_t v14;
  uint64_t v15;
  FLTSSUExample *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, FLTSSUExample *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("negative_examples"));
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
            v16 = -[FLTSSUExample initWithFlatbuffData:root:verify:]([FLTSSUExample alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (Offset<SSUCategoryGroup>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t i;
  int v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _BYTE *v38;
  unint64_t v39;
  uint64_t j;
  int v41;
  int v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  int v50;
  void *v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  Offset<SSUCategoryGroup> v57;
  unsigned int v59;
  unsigned int String;
  FLTSSUCategoryGroup *v61;
  uint64_t v62;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE *v68;
  char *v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[FLTSSUCategoryGroup name](self, "name");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E7BB3508;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FLTSSUCategoryGroup positive_intents](self, "positive_intents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    if (v10 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v10);
    v13 = &v11[4 * v12];
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[FLTSSUCategoryGroup positive_intents](self, "positive_intents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  v61 = self;
  v63 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  if (v15)
  {
    v16 = *(_QWORD *)v72;
    v17 = v11;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v72 != v16)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "addObjectToBuffer:", v63);
        v20 = v19;
        if (v17 >= v13)
        {
          v21 = (v17 - v11) >> 2;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          if ((v13 - v11) >> 1 > v22)
            v22 = (v13 - v11) >> 1;
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL)
            v23 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          if (v23)
            v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v23);
          else
            v24 = 0;
          v25 = (char *)(v23 + 4 * v21);
          *(_DWORD *)v25 = v20;
          v26 = v25 + 4;
          while (v17 != v11)
          {
            v27 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v25 - 1) = v27;
            v25 -= 4;
          }
          v13 = (char *)(v23 + 4 * v24);
          if (v11)
            operator delete(v11);
          v11 = v25;
          v17 = v26;
        }
        else
        {
          *(_DWORD *)v17 = v19;
          v17 += 4;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  v28 = v17 - v11;
  if (v17 == v11)
    v29 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUIntent>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUIntent>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUIntent>> const&)::t;
  else
    v29 = v11;
  v30 = v28 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(v63, v28 >> 2, 4uLL);
  if (v11 == v17)
  {
    LODWORD(v30) = 0;
  }
  else
  {
    v31 = v29 - 4;
    v32 = v30;
    do
    {
      v33 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v63, *(_DWORD *)&v31[4 * v32]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)v63, v33);
      --v32;
    }
    while (v32);
  }
  v34 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v63, v30);
  v68 = 0;
  v69 = 0;
  v70 = 0;
  -[FLTSSUCategoryGroup negative_examples](v61, "negative_examples");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<SSUExample>>::reserve((void **)&v68, objc_msgSend(v35, "count"));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[FLTSSUCategoryGroup negative_examples](v61, "negative_examples");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
  v59 = v34;
  v38 = v68;
  if (v37)
  {
    v62 = *(_QWORD *)v65;
    v39 = v70;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v65 != v62)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "addObjectToBuffer:", v63);
        v42 = v41;
        v43 = v69;
        if ((unint64_t)v69 >= v39)
        {
          v45 = (v69 - v38) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
          {
            v70 = v39;
            v68 = v38;
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v39 - (_QWORD)v38) >> 1 > v46)
            v46 = (uint64_t)(v39 - (_QWORD)v38) >> 1;
          if (v39 - (unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v47);
          else
            v48 = 0;
          v49 = (_DWORD *)(v47 + 4 * v45);
          *v49 = v42;
          v44 = (char *)(v49 + 1);
          while (v43 != v38)
          {
            v50 = *((_DWORD *)v43 - 1);
            v43 -= 4;
            *--v49 = v50;
          }
          v39 = v47 + 4 * v48;
          v69 = v44;
          if (v38)
            operator delete(v38);
          v38 = v49;
        }
        else
        {
          *(_DWORD *)v69 = v41;
          v44 = v43 + 4;
        }
        v69 = v44;
      }
      v70 = v39;
      v68 = v38;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    }
    while (v37);
  }
  else
  {
    v44 = v69;
  }

  if (v44 == v38)
    v51 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<SSUExample>,std::allocator<apple::aiml::flatbuffers2::Offset<SSUExample>>>(std::vector<apple::aiml::flatbuffers2::Offset<SSUExample>> const&)::t;
  else
    v51 = v38;
  v52 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<SSUExample>(v63, (uint64_t)v51, (v44 - v38) >> 2);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v63);
  *((_BYTE *)v63 + 70) = 1;
  v53 = *((_DWORD *)v63 + 8);
  v54 = *((_DWORD *)v63 + 12);
  v55 = *((_DWORD *)v63 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v63, 4, String);
  if (v59)
  {
    v56 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v63, v59);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v63, 6, v56, 0);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<SSUExample>>>(v63, v52);
  v57.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v63, v53 - v54 + v55);
  if (v38)
  {
    v69 = v38;
    operator delete(v38);
  }
  if (v11)
    operator delete(v11);
  return v57;
}

- (id)flatbuffData
{
  Offset<SSUCategoryGroup> v2;
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
  v2.var0 = -[FLTSSUCategoryGroup addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__FLTSSUCategoryGroup_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__35__FLTSSUCategoryGroup_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __40__FLTSSUCategoryGroup_negative_examples__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __39__FLTSSUCategoryGroup_positive_intents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
