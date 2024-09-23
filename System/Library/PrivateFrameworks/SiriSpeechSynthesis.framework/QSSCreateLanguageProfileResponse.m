@implementation QSSCreateLanguageProfileResponse

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSCreateLanguageProfileResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSCreateLanguageProfileResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4
{
  return -[QSSCreateLanguageProfileResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSCreateLanguageProfileResponse)initWithFlatbuffData:(id)a3 root:(const CreateLanguageProfileResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSCreateLanguageProfileResponse *v10;
  QSSCreateLanguageProfileResponse *v11;
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
  const unsigned __int8 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  const unsigned __int8 *v26;
  unsigned __int16 *v27;
  unsigned int v28;
  const unsigned __int8 *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSMutableDictionary *storage;
  QSSCreateLanguageProfileResponse *v37;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  objc_super v44;

  v5 = a5;
  v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)QSSCreateLanguageProfileResponse;
  v10 = -[QSSCreateLanguageProfileResponse init](&v44, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_52;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_53;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const CreateLanguageProfileResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_51;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_53;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v39 = v18;
  v40 = v19;
  v41 = xmmword_21E34D540;
  v42 = 0;
  v43 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_51;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v39, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 4u))
  {
    goto LABEL_53;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 6u))
  {
    goto LABEL_53;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v26))
    goto LABEL_53;
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  v28 = *v27;
  if (v28 >= 9 && v27[4] && (v40 < 5 || v40 - 4 < (unint64_t)root + v27[4] - v39))
    goto LABEL_53;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xAu))
    goto LABEL_53;
  v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v39, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v39, 0xCu))
  {
    goto LABEL_53;
  }
  v30 = *(int *)root;
  v31 = *(unsigned __int16 *)((char *)root - v30);
  if (v31 >= 0xD)
  {
    if (*(_WORD *)((char *)root - v30 + 12))
    {
      if (!siri::speech::schema_fb::UserLanguageProfile::Verify((flatbuffers::Table *)((char *)root+ *(unsigned __int16 *)((char *)root - v30 + 12)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v30 + 12))), (flatbuffers::Verifier *)&v39))goto LABEL_53;
      v32 = *(int *)root;
      v33 = -v32;
      v31 = *(unsigned __int16 *)((char *)root - v32);
    }
    else
    {
      v33 = -v30;
    }
    if (v31 < 0xF)
      goto LABEL_51;
    v34 = (char *)root + v33;
    if ((!*((_WORD *)v34 + 7) || v40 >= 2 && v40 - 1 >= (unint64_t)root + *((unsigned __int16 *)v34 + 7) - v39)
      && (v31 < 0x11
       || !*((_WORD *)v34 + 8)
       || v40 >= 2 && v40 - 1 >= (unint64_t)root + *((unsigned __int16 *)v34 + 8) - v39))
    {
      goto LABEL_51;
    }
LABEL_53:
    v37 = 0;
    goto LABEL_54;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v39);
  v35 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v35;

LABEL_52:
  v37 = v11;
LABEL_54:

  return v37;
}

- (NSString)speech_id
{
  const CreateLanguageProfileResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CreateLanguageProfileResponse *v6;

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

- (NSString)session_id
{
  const CreateLanguageProfileResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CreateLanguageProfileResponse *v6;

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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (int)error_code
{
  const CreateLanguageProfileResponse *root;
  const CreateLanguageProfileResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)error_str
{
  const CreateLanguageProfileResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const CreateLanguageProfileResponse *v6;

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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (QSSUserLanguageProfile)user_language_profile
{
  QSSUserLanguageProfile *v3;
  QSSUserLanguageProfile *v4;
  const CreateLanguageProfileResponse *root;
  const CreateLanguageProfileResponse *v6;
  uint64_t v7;
  const CreateLanguageProfileResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_language_profile"));
  v3 = (QSSUserLanguageProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSUserLanguageProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSUserLanguageProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_language_profile"));
  }
  return v3;
}

- (BOOL)incomplete_profile
{
  const CreateLanguageProfileResponse *root;
  const CreateLanguageProfileResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)recreate_apg_prons
{
  const CreateLanguageProfileResponse *root;
  const CreateLanguageProfileResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::CreateLanguageProfileResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  unsigned int String;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  size_t v13;
  unsigned int v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  void *v20;
  unsigned int v21;
  int v22;
  int v23;

  -[QSSCreateLanguageProfileResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSCreateLanguageProfileResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v15 = -[QSSCreateLanguageProfileResponse error_code](self, "error_code");
  -[QSSCreateLanguageProfileResponse error_str](self, "error_str");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24E246F88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  LODWORD(v18) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  -[QSSCreateLanguageProfileResponse user_language_profile](self, "user_language_profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  LODWORD(v20) = -[QSSCreateLanguageProfileResponse incomplete_profile](self, "incomplete_profile");
  v22 = -[QSSCreateLanguageProfileResponse recreate_apg_prons](self, "recreate_apg_prons");
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v23 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v15);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v18);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v21);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 14, (int)v20);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v22);
  return (Offset<siri::speech::schema_fb::CreateLanguageProfileResponse>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v23);
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::CreateLanguageProfileResponse> v2;
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
  v2.var0 = -[QSSCreateLanguageProfileResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QSSCreateLanguageProfileResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__48__QSSCreateLanguageProfileResponse_flatbuffData__block_invoke(uint64_t a1)
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
