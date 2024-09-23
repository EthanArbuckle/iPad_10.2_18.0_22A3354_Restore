@implementation OPTTSPartialTextToSpeechStreamingResponse

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[OPTTSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4
{
  return -[OPTTSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSPartialTextToSpeechStreamingResponse *v10;
  OPTTSPartialTextToSpeechStreamingResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  OPTTSPartialTextToSpeechStreamingResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OPTTSPartialTextToSpeechStreamingResponse;
  v10 = -[OPTTSPartialTextToSpeechStreamingResponse init](&v30, sel_init);
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
      a4 = (const PartialTextToSpeechStreamingResponse *)v13 + *v13;
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
      v27 = xmmword_21AACED40;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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

- (NSString)speech_id
{
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialTextToSpeechStreamingResponse *v6;

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
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialTextToSpeechStreamingResponse *v6;

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
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v3;
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
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialTextToSpeechStreamingResponse *v6;

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

- (NSString)stream_id
{
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialTextToSpeechStreamingResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 12].var0;
  if (*(_WORD *)root[-v3 + 12].var0)
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

- (int)current_pkt_number
{
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSData)audio
{
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PartialTextToSpeechStreamingResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 16].var0;
  if (*(_WORD *)root[-v3 + 16].var0)
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
  return (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
}

- (void)audio:(id)a3
{
  id v4;
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const PartialTextToSpeechStreamingResponse *v9;
  id v10;

  v4 = a3;
  root = self->_root;
  v6 = *(int *)root->var0;
  v7 = *(unsigned __int16 *)root[-v6 + 16].var0;
  if (*(_WORD *)root[-v6 + 16].var0)
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
  (*((void (**)(id, const PartialTextToSpeechStreamingResponse *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (NSArray)word_timing_info
{
  void *v3;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v5;
  uint64_t v6;
  const PartialTextToSpeechStreamingResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const PartialTextToSpeechStreamingResponse *v10;
  uint64_t v11;
  OPTTSWordTimingInfo *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_timing_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x13u)
    {
      v6 = *(unsigned __int16 *)v5[18].var0;
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
            v12 = -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:]([OPTTSWordTimingInfo alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("word_timing_info"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  unsigned int String;
  __CFString *v9;
  __CFString *v10;
  const char *v11;
  size_t v12;
  __CFString *v13;
  __CFString *v14;
  const char *v15;
  size_t v16;
  __CFString *v17;
  __CFString *v18;
  const char *v19;
  size_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t i;
  int v29;
  int v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  int v38;
  void *v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse> v44;
  int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE *v57;
  char *v58;
  unint64_t v59;
  _QWORD v60[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  uint64_t (*v65)();
  void *v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  -[OPTTSPartialTextToSpeechStreamingResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24DD8EF88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[OPTTSPartialTextToSpeechStreamingResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_24DD8EF88;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v51 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v11, v12);

  v50 = -[OPTTSPartialTextToSpeechStreamingResponse error_code](self, "error_code");
  -[OPTTSPartialTextToSpeechStreamingResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_24DD8EF88;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v49 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v15, v16);

  -[OPTTSPartialTextToSpeechStreamingResponse stream_id](self, "stream_id");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_24DD8EF88;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v48 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v19, v20);

  v46 = -[OPTTSPartialTextToSpeechStreamingResponse current_pkt_number](self, "current_pkt_number");
  v61 = 0;
  v62 = &v61;
  v63 = 0x3812000000;
  v64 = __Block_byref_object_copy__1246;
  v65 = __Block_byref_object_dispose__1247;
  v66 = &unk_21AAD8ACB;
  v67 = 0;
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke;
  v60[3] = &unk_24DD8E578;
  v60[4] = &v61;
  v60[5] = a3;
  -[OPTTSPartialTextToSpeechStreamingResponse audio:](self, "audio:", v60);
  v57 = 0;
  v58 = 0;
  v59 = 0;
  -[OPTTSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v57, objc_msgSend(v21, "count"));

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[OPTTSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a3;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
  v47 = String;
  v25 = v57;
  if (v24)
  {
    v26 = *(_QWORD *)v54;
    v27 = v59;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(v22);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "addObjectToBuffer:", v23);
        v30 = v29;
        v31 = v58;
        if ((unint64_t)v58 >= v27)
        {
          v33 = (v58 - v25) >> 2;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
          {
            v57 = v25;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v27 - (_QWORD)v25) >> 1 > v34)
            v34 = (uint64_t)(v27 - (_QWORD)v25) >> 1;
          if (v27 - (unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v34;
          if (v35)
            v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v35);
          else
            v36 = 0;
          v37 = (_DWORD *)(v35 + 4 * v33);
          *v37 = v30;
          v32 = (char *)(v37 + 1);
          while (v31 != v25)
          {
            v38 = *((_DWORD *)v31 - 1);
            v31 -= 4;
            *--v37 = v38;
          }
          v27 = v35 + 4 * v36;
          v58 = v32;
          if (v25)
            operator delete(v25);
          v25 = v37;
          v23 = a3;
        }
        else
        {
          *(_DWORD *)v58 = v29;
          v32 = v31 + 4;
        }
        v58 = v32;
      }
      v59 = v27;
      v57 = v25;
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    }
    while (v24);
  }
  else
  {
    v32 = v58;
  }

  if (v32 == v25)
    v39 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  else
    v39 = v25;
  v40 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v39, (v32 - v25) >> 2);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v41 = *((_DWORD *)a3 + 8);
  v42 = *((_DWORD *)a3 + 12);
  v43 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, v47);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v51);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, *((_DWORD *)v62 + 12));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 18, v40);
  v44.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v41 - v42 + v43);
  if (v25)
  {
    v58 = v25;
    operator delete(v25);
  }
  _Block_object_dispose(&v61, 8);
  return v44;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse> v2;
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
  v13 = xmmword_21AACED50;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSPartialTextToSpeechStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__OPTTSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__57__OPTTSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x220750954);
  }
  return result;
}

uint64_t __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
