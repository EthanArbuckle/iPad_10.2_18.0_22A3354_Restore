@implementation QSSNormalizedToken

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3
{
  return -[QSSNormalizedToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSNormalizedToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4
{
  return -[QSSNormalizedToken initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSNormalizedToken)initWithFlatbuffData:(id)a3 root:(const NormalizedToken *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSNormalizedToken *v10;
  QSSNormalizedToken *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::NormalizedToken *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSNormalizedToken *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSNormalizedToken;
  v10 = -[QSSNormalizedToken init](&v30, sel_init);
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
      a4 = (const NormalizedToken *)v13 + *v13;
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
      root = (siri::speech::schema_fb::NormalizedToken *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::NormalizedToken::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)original_token
{
  const NormalizedToken *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const NormalizedToken *v6;

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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (NSArray)nbest_variants
{
  void *v3;
  const NormalizedToken *root;
  const NormalizedToken *v5;
  uint64_t v6;
  const NormalizedToken *v7;
  uint64_t v8;
  uint64_t v9;
  const NormalizedToken *v10;
  uint64_t v11;
  QSSNormalizedTokenVariant *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("nbest_variants"));
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
            v12 = -[QSSNormalizedTokenVariant initWithFlatbuffData:root:verify:]([QSSNormalizedTokenVariant alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("nbest_variants"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::NormalizedToken>)addObjectToBuffer:(void *)a3
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
  int v35;
  int v36;
  int v37;
  int v38;
  Offset<siri::speech::schema_fb::NormalizedToken> v39;
  unsigned int String;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[QSSNormalizedToken original_token](self, "original_token");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSNormalizedToken nbest_variants](self, "nbest_variants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    if (v10 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v10);
    v13 = &v11[4 * v12];
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[QSSNormalizedToken nbest_variants](self, "nbest_variants");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v44;
    v17 = v11;
    v42 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v20 = v19;
        if (v17 >= v13)
        {
          v21 = (v17 - v11) >> 2;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v13 - v11) >> 1 > v22)
            v22 = (v13 - v11) >> 1;
          if ((unint64_t)(v13 - v11) >= 0x7FFFFFFFFFFFFFFCLL)
            v23 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          if (v23)
            v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v23);
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
          v14 = v42;
        }
        else
        {
          *(_DWORD *)v17 = v19;
          v17 += 4;
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v15);
  }
  else
  {
    v17 = v11;
  }

  v28 = v17 - v11;
  if (v17 == v11)
    v29 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::NormalizedTokenVariant>> const&)::t;
  else
    v29 = v11;
  v30 = v28 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v28 >> 2, 4uLL);
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
      v33 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v31[4 * v32]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v33);
      --v32;
    }
    while (v32);
  }
  v34 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v30);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v35 = *((_DWORD *)a3 + 8);
  v36 = *((_DWORD *)a3 + 12);
  v37 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  if (v34)
  {
    v38 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v34);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 6, v38);
  }
  v39.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v35 - v36 + v37);
  if (v11)
    operator delete(v11);
  return v39;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::NormalizedToken> v2;
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
  v2.var0 = -[QSSNormalizedToken addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__QSSNormalizedToken_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__34__QSSNormalizedToken_flatbuffData__block_invoke(uint64_t a1)
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
