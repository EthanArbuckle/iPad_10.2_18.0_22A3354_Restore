@implementation QSSTextToSpeechCacheContainer

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4
{
  return -[QSSTextToSpeechCacheContainer initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechCacheContainer)initWithFlatbuffData:(id)a3 root:(const TextToSpeechCacheContainer *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechCacheContainer *v10;
  QSSTextToSpeechCacheContainer *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  unint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  NSMutableDictionary *storage;
  QSSTextToSpeechCacheContainer *v30;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;

  v5 = a5;
  v9 = a3;
  v37.receiver = self;
  v37.super_class = (Class)QSSTextToSpeechCacheContainer;
  v10 = -[QSSTextToSpeechCacheContainer init](&v37, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_29;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_30;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechCacheContainer *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_28;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_30;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v32 = v18;
  v33 = v19;
  v34 = xmmword_21E34D540;
  v35 = 0;
  LOBYTE(v36) = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_28;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v32, v11->_root->var0))
    goto LABEL_30;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v32, 4u))
    goto LABEL_30;
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::TextToSpeechCacheMetaInfo::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v32))goto LABEL_30;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v32, 6u))
    goto LABEL_30;
  v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) < 7u)
    goto LABEL_28;
  if (!*(_WORD *)((char *)root - v23 + 6))
  {
LABEL_23:
    v24 = *(unsigned __int16 *)((char *)root - v23 + 6);
    if (v24)
    {
      v25 = (_DWORD *)((char *)root + v24 + *(unsigned int *)((char *)root + v24));
      if (*v25)
      {
        v26 = 0;
        v27 = v25 + 1;
        while (siri::speech::schema_fb::TextToSpeechCacheObject::Verify((siri::speech::schema_fb::TextToSpeechCacheObject *)((char *)v27 + *v27), (flatbuffers::Verifier *)&v32))
        {
          ++v26;
          ++v27;
          if (v26 >= *v25)
            goto LABEL_28;
        }
        goto LABEL_30;
      }
    }
    goto LABEL_28;
  }
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v32, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v23 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v23 + 6)), 4uLL, 0))
  {
LABEL_30:
    v30 = 0;
    goto LABEL_31;
  }
  v23 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v23) >= 7u)
    goto LABEL_23;
LABEL_28:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v32, v33, v34, v35, v36);
  v28 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v28;

LABEL_29:
  v30 = v11;
LABEL_31:

  return v30;
}

- (QSSTextToSpeechCacheMetaInfo)cache_meta_info
{
  QSSTextToSpeechCacheMetaInfo *v3;
  QSSTextToSpeechCacheMetaInfo *v4;
  const TextToSpeechCacheContainer *root;
  const TextToSpeechCacheContainer *v6;
  uint64_t v7;
  const TextToSpeechCacheContainer *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cache_meta_info"));
  v3 = (QSSTextToSpeechCacheMetaInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechCacheMetaInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechCacheMetaInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cache_meta_info"));
  }
  return v3;
}

- (NSArray)cache_object
{
  void *v3;
  const TextToSpeechCacheContainer *root;
  const TextToSpeechCacheContainer *v5;
  uint64_t v6;
  const TextToSpeechCacheContainer *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechCacheContainer *v10;
  uint64_t v11;
  QSSTextToSpeechCacheObject *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("cache_object"));
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
            v12 = -[QSSTextToSpeechCacheObject initWithFlatbuffData:root:verify:]([QSSTextToSpeechCacheObject alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("cache_object"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechCacheContainer>)addObjectToBuffer:(void *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t i;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  Offset<siri::speech::schema_fb::TextToSpeechCacheContainer> v38;
  unsigned int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[QSSTextToSpeechCacheContainer cache_meta_info](self, "cache_meta_info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[QSSTextToSpeechCacheContainer cache_object](self, "cache_object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    if (v8 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v8);
    v11 = &v9[4 * v10];
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[QSSTextToSpeechCacheContainer cache_object](self, "cache_object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v40 = v6;
  if (v13)
  {
    v14 = *(_QWORD *)v43;
    v15 = v9;
    v41 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v18 = v17;
        if (v15 >= v11)
        {
          v19 = (v15 - v9) >> 2;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v11 - v9) >> 1 > v20)
            v20 = (v11 - v9) >> 1;
          if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v20;
          if (v21)
            v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          else
            v22 = 0;
          v23 = (char *)(v21 + 4 * v19);
          *(_DWORD *)v23 = v18;
          v24 = v23 + 4;
          while (v15 != v9)
          {
            v25 = *((_DWORD *)v15 - 1);
            v15 -= 4;
            *((_DWORD *)v23 - 1) = v25;
            v23 -= 4;
          }
          v11 = (char *)(v21 + 4 * v22);
          if (v9)
            operator delete(v9);
          v9 = v23;
          v15 = v24;
          v12 = v41;
        }
        else
        {
          *(_DWORD *)v15 = v17;
          v15 += 4;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }
  else
  {
    v15 = v9;
  }

  v26 = v15 - v9;
  if (v15 == v9)
    v27 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechCacheObject>> const&)::t;
  else
    v27 = v9;
  v28 = v26 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v26 >> 2, 4uLL);
  if (v9 == v15)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v29 = v27 - 4;
    v30 = v28;
    do
    {
      v31 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v29[4 * v30]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v31);
      --v30;
    }
    while (v30);
  }
  v32 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v28);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v33 = *((_DWORD *)a3 + 8);
  v34 = *((_DWORD *)a3 + 12);
  v35 = *((_DWORD *)a3 + 10);
  if (v40)
  {
    v36 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v40);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 4, v36);
  }
  if (v32)
  {
    v37 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v32);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v37);
  }
  v38.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v33 - v34 + v35);
  if (v9)
    operator delete(v9);
  return v38;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechCacheContainer> v2;
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
  v2.var0 = -[QSSTextToSpeechCacheContainer addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__QSSTextToSpeechCacheContainer_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__45__QSSTextToSpeechCacheContainer_flatbuffData__block_invoke(uint64_t a1)
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
