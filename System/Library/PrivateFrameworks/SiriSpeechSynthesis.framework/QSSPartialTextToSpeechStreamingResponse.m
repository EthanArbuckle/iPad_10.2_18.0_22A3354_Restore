@implementation QSSPartialTextToSpeechStreamingResponse

- (QSSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4
{
  return -[QSSPartialTextToSpeechStreamingResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSPartialTextToSpeechStreamingResponse)initWithFlatbuffData:(id)a3 root:(const PartialTextToSpeechStreamingResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSPartialTextToSpeechStreamingResponse *v10;
  QSSPartialTextToSpeechStreamingResponse *v11;
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
  QSSPartialTextToSpeechStreamingResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSPartialTextToSpeechStreamingResponse;
  v10 = -[QSSPartialTextToSpeechStreamingResponse init](&v30, sel_init);
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
      v27 = xmmword_21E34D540;
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
  QSSWordTimingInfo *v12;

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
            v12 = -[QSSWordTimingInfo initWithFlatbuffData:root:verify:]([QSSWordTimingInfo alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
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

- (QSSTextToSpeechFeature)feature
{
  QSSTextToSpeechFeature *v3;
  QSSTextToSpeechFeature *v4;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v6;
  uint64_t v7;
  const PartialTextToSpeechStreamingResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature"));
  v3 = (QSSTextToSpeechFeature *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechFeature alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechFeature initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse>)addObjectToBuffer:(void *)a3
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
  int v14;
  __CFString *v15;
  __CFString *v16;
  const char *v17;
  size_t v18;
  __CFString *v19;
  __CFString *v20;
  const char *v21;
  size_t v22;
  void *v23;
  uint64_t v24;
  int *begin;
  uint64_t v26;
  int *value;
  void *v28;
  uint64_t i;
  int v30;
  int v31;
  std::vector<int>::pointer end;
  int *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int *v38;
  int v39;
  int *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  int v44;
  int v45;
  Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse> v46;
  int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  QSSPartialTextToSpeechStreamingResponse *v52;
  unsigned int v53;
  unsigned int v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  std::vector<int> v60;
  _QWORD v61[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  uint64_t (*v66)();
  void *v67;
  int v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  -[QSSPartialTextToSpeechStreamingResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24E246F88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[QSSPartialTextToSpeechStreamingResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24E246F88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v54 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v14 = -[QSSPartialTextToSpeechStreamingResponse error_code](self, "error_code");
  -[QSSPartialTextToSpeechStreamingResponse error_str](self, "error_str");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24E246F88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v53 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  -[QSSPartialTextToSpeechStreamingResponse stream_id](self, "stream_id");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &stru_24E246F88;
  v21 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v19), "UTF8String");
  v22 = strlen(v21);
  v49 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v21, v22);

  v48 = -[QSSPartialTextToSpeechStreamingResponse current_pkt_number](self, "current_pkt_number");
  v62 = 0;
  v63 = &v62;
  v64 = 0x3812000000;
  v65 = __Block_byref_object_copy__629;
  v66 = __Block_byref_object_dispose__630;
  v67 = &unk_21E36C185;
  v68 = 0;
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __61__QSSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke;
  v61[3] = &unk_24E246AC0;
  v61[4] = &v62;
  v61[5] = a3;
  -[QSSPartialTextToSpeechStreamingResponse audio:](self, "audio:", v61);
  memset(&v60, 0, sizeof(v60));
  -[QSSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v60, objc_msgSend(v23, "count"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[QSSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  v50 = v14;
  v51 = String;
  v52 = self;
  begin = v60.__begin_;
  if (v24)
  {
    v26 = *(_QWORD *)v57;
    value = v60.__end_cap_.__value_;
    v28 = a3;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v57 != v26)
          objc_enumerationMutation(obj);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v31 = v30;
        end = v60.__end_;
        if (v60.__end_ >= value)
        {
          v34 = v60.__end_ - begin;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
          {
            v60.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v35)
            v35 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v36 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v36 = v35;
          if (v36)
            v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v36);
          else
            v37 = 0;
          v38 = (int *)(v36 + 4 * v34);
          *v38 = v31;
          v33 = v38 + 1;
          while (end != begin)
          {
            v39 = *--end;
            *--v38 = v39;
          }
          value = (int *)(v36 + 4 * v37);
          v60.__end_ = v33;
          if (begin)
            operator delete(begin);
          begin = v38;
          a3 = v28;
        }
        else
        {
          *v60.__end_ = v30;
          v33 = end + 1;
        }
        v60.__end_ = v33;
      }
      v60.__end_cap_.__value_ = value;
      v60.__begin_ = begin;
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v24);
  }
  else
  {
    v33 = v60.__end_;
  }

  if (v33 == begin)
    v40 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  else
    v40 = begin;
  v41 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v40, v33 - begin);
  -[QSSPartialTextToSpeechStreamingResponse feature](v52, "feature");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v42) = *((_DWORD *)a3 + 8);
  v44 = *((_DWORD *)a3 + 12);
  v45 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v54);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v49);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v48);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, *((_DWORD *)v63 + 12));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v43);
  v46.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v42 - v44 + v45);
  if (begin)
  {
    v60.__end_ = begin;
    operator delete(begin);
  }
  _Block_object_dispose(&v62, 8);
  return v46;
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
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSPartialTextToSpeechStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__QSSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__55__QSSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __61__QSSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
