@implementation OPTTSTTSPrompts

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4
{
  return -[OPTTSTTSPrompts initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTTSPrompts)initWithFlatbuffData:(id)a3 root:(const TTSPrompts *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTTSPrompts *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TTSPrompts *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TTSPrompts *v19;
  OPTTSTTSPrompts *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTTSPrompts;
  v10 = -[OPTTSTTSPrompts init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TTSPrompts *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TTSPrompts *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TTSPrompts::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
    v20 = v10;

  return v20;
}

- (NSArray)prompts
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__OPTTSTTSPrompts_prompts__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTTSPrompts prompts_enumerateObjectsUsingBlock:](self, "prompts_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prompts"));

  }
  return (NSArray *)v3;
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const TTSPrompts *root;
  const TTSPrompts *v10;
  uint64_t v11;
  const TTSPrompts *v12;
  unsigned int *var0;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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

- (unint64_t)prompts_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TTSPrompts *root;
  const TTSPrompts *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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

- (void)prompts_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TTSPrompts *root;
  const TTSPrompts *v8;
  uint64_t v9;
  const TTSPrompts *v10;
  uint64_t v11;
  uint64_t v12;
  const TTSPrompts *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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

- (NSData)prompts_v2
{
  const TTSPrompts *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TTSPrompts *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
}

- (void)prompts_v2:(id)a3
{
  id v4;
  const TTSPrompts *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const TTSPrompts *v9;
  id v10;

  v4 = a3;
  root = self->_root;
  v6 = *(int *)root->var0;
  v7 = *(unsigned __int16 *)root[-v6 + 6].var0;
  if (*(_WORD *)root[-v6 + 6].var0)
  {
    v8 = *(unsigned int *)root[v7].var0;
    v9 = &root[v7 + v8];
  }
  else
  {
    v7 = 0;
    v9 = 0;
    v8 = *(unsigned int *)root->var0;
  }
  v10 = v4;
  (*((void (**)(id, const TTSPrompts *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (Offset<siri::speech::schema_fb::TTSPrompts>)addObjectToBuffer:(void *)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  const char *v11;
  size_t v12;
  int String;
  int v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  void *v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  Offset<siri::speech::schema_fb::TTSPrompts> v28;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)();
  void *v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE *v44;
  char *v45;
  unint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = 0;
  v46 = 0;
  -[OPTTSTTSPrompts prompts](self, "prompts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v44, objc_msgSend(v3, "count"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[OPTTSTTSPrompts prompts](self, "prompts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  v6 = v4;
  v7 = v44;
  if (v5)
  {
    v8 = *(_QWORD *)v41;
    v9 = v46;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v6);
        v11 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i)), "UTF8String");
        v12 = strlen(v11);
        String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);
        v14 = String;
        v15 = v45;
        if ((unint64_t)v45 >= v9)
        {
          v17 = (v45 - v7) >> 2;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
          {
            v44 = v7;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v9 - (_QWORD)v7) >> 1 > v18)
            v18 = (uint64_t)(v9 - (_QWORD)v7) >> 1;
          if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v18;
          if (v19)
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v19);
          else
            v20 = 0;
          v21 = (_DWORD *)(v19 + 4 * v17);
          *v21 = v14;
          v16 = (char *)(v21 + 1);
          while (v15 != v7)
          {
            v22 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *--v21 = v22;
          }
          v9 = v19 + 4 * v20;
          v45 = v16;
          if (v7)
            operator delete(v7);
          v7 = v21;
        }
        else
        {
          *(_DWORD *)v45 = String;
          v16 = v15 + 4;
        }
        v45 = v16;
      }
      v46 = v9;
      v44 = v7;
      v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v5);
  }
  else
  {
    v16 = v45;
  }

  if (v16 == v7)
    v23 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v23 = v7;
  v24 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v23, (v16 - v7) >> 2);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3812000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = &unk_19AE90C62;
  v39 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __37__OPTTSTTSPrompts_addObjectToBuffer___block_invoke;
  v32[3] = &unk_1E3A15F28;
  v32[4] = &v33;
  v32[5] = a3;
  -[OPTTSTTSPrompts prompts_v2:](self, "prompts_v2:", v32);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v25 = *((_DWORD *)a3 + 8);
  v26 = *((_DWORD *)a3 + 12);
  v27 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, *((_DWORD *)v34 + 12));
  v28.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v25 - v26 + v27);
  _Block_object_dispose(&v33, 8);
  if (v7)
  {
    v45 = v7;
    operator delete(v7);
  }
  return v28;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TTSPrompts> v2;
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
  v2.var0 = -[OPTTSTTSPrompts addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__OPTTSTTSPrompts_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__31__OPTTSTTSPrompts_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __37__OPTTSTTSPrompts_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

uint64_t __26__OPTTSTTSPrompts_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
