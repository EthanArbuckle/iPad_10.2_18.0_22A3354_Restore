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
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const PartialTextToSpeechStreamingResponse *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *v19;
  OPTTSPartialTextToSpeechStreamingResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSPartialTextToSpeechStreamingResponse;
  v10 = -[OPTTSPartialTextToSpeechStreamingResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const PartialTextToSpeechStreamingResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::PartialTextToSpeechStreamingResponse *)v10->_root;
  if (v19
    && !siri::speech::schema_fb::PartialTextToSpeechStreamingResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
  {
LABEL_15:
    v20 = 0;
  }
  else
  {
LABEL_14:
    v20 = v10;
  }

  return v20;
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v6[4], *(unsigned int *)root[v4 + v5].var0);
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
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_timing_info"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__OPTTSPartialTextToSpeechStreamingResponse_word_timing_info__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSPartialTextToSpeechStreamingResponse word_timing_info_enumerateObjectsUsingBlock:](self, "word_timing_info_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("word_timing_info"));

  }
  return (NSArray *)v3;
}

- (id)word_timing_info_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSWordTimingInfo *v7;
  OPTTSWordTimingInfo *v8;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v10;
  uint64_t v11;
  const PartialTextToSpeechStreamingResponse *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_timing_info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSWordTimingInfo *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x13u || (v11 = *(unsigned __int16 *)v10[18].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:]([OPTTSWordTimingInfo alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)word_timing_info_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_timing_info"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x13u && (v8 = *(unsigned __int16 *)v7[18].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)word_timing_info_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, OPTTSWordTimingInfo *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v8;
  uint64_t v9;
  const PartialTextToSpeechStreamingResponse *v10;
  uint64_t v11;
  uint64_t v12;
  const PartialTextToSpeechStreamingResponse *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSWordTimingInfo *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSWordTimingInfo *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("word_timing_info"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x13u)
    {
      v9 = *(unsigned __int16 *)v8[18].var0;
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
            v16 = -[OPTTSWordTimingInfo initWithFlatbuffData:root:verify:]([OPTTSWordTimingInfo alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (OPTTSTextToSpeechFeature)feature
{
  OPTTSTextToSpeechFeature *v3;
  OPTTSTextToSpeechFeature *v4;
  const PartialTextToSpeechStreamingResponse *root;
  const PartialTextToSpeechStreamingResponse *v6;
  uint64_t v7;
  const PartialTextToSpeechStreamingResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature"));
  v3 = (OPTTSTextToSpeechFeature *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechFeature alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechFeature initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  unsigned int v21;
  int v22;
  void *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t i;
  int v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  int v47;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse> v56;
  int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  unsigned int String;
  OPTTSPartialTextToSpeechStreamingResponse *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[6];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  uint64_t (*v75)();
  void *v76;
  int v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[OPTTSPartialTextToSpeechStreamingResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E3A161B0;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[OPTTSPartialTextToSpeechStreamingResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_1E3A161B0;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v62 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v61 = -[OPTTSPartialTextToSpeechStreamingResponse error_code](self, "error_code");
  -[OPTTSPartialTextToSpeechStreamingResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_1E3A161B0;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[OPTTSPartialTextToSpeechStreamingResponse stream_id](self, "stream_id");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_1E3A161B0;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v21 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  v22 = -[OPTTSPartialTextToSpeechStreamingResponse current_pkt_number](self, "current_pkt_number");
  v71 = 0;
  v72 = &v71;
  v73 = 0x3812000000;
  v74 = __Block_byref_object_copy_;
  v75 = __Block_byref_object_dispose_;
  v76 = &unk_19AE90C62;
  v77 = 0;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke;
  v70[3] = &unk_1E3A15F28;
  v70[4] = &v71;
  v70[5] = a3;
  -[OPTTSPartialTextToSpeechStreamingResponse audio:](self, "audio:", v70);
  -[OPTTSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  v58 = v22;
  v59 = v21;
  if (v24)
  {
    if (v24 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v24);
    v27 = &v25[4 * v26];
  }
  else
  {
    v25 = 0;
    v27 = 0;
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[OPTTSPartialTextToSpeechStreamingResponse word_timing_info](self, "word_timing_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  v64 = self;
  if (v28)
  {
    v29 = *(_QWORD *)v67;
    v30 = v25;
    v31 = a3;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v67 != v29)
          objc_enumerationMutation(obj);
        v33 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v34 = v33;
        if (v30 >= v27)
        {
          v35 = (v30 - v25) >> 2;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v27 - v25) >> 1 > v36)
            v36 = (v27 - v25) >> 1;
          if ((unint64_t)(v27 - v25) >= 0x7FFFFFFFFFFFFFFCLL)
            v37 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v37 = v36;
          if (v37)
            v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v37);
          else
            v38 = 0;
          v39 = (char *)(v37 + 4 * v35);
          *(_DWORD *)v39 = v34;
          v40 = v39 + 4;
          while (v30 != v25)
          {
            v41 = *((_DWORD *)v30 - 1);
            v30 -= 4;
            *((_DWORD *)v39 - 1) = v41;
            v39 -= 4;
          }
          v27 = (char *)(v37 + 4 * v38);
          if (v25)
            operator delete(v25);
          v25 = v39;
          v30 = v40;
          a3 = v31;
        }
        else
        {
          *(_DWORD *)v30 = v33;
          v30 += 4;
        }
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v28);
  }
  else
  {
    v30 = v25;
  }

  v42 = v30 - v25;
  if (v30 == v25)
    v43 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  else
    v43 = v25;
  v44 = v42 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42 >> 2, 4uLL);
  if (v25 == v30)
  {
    LODWORD(v44) = 0;
  }
  else
  {
    v45 = v43 - 4;
    v46 = v44;
    do
    {
      v47 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v45[4 * v46]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v47);
      --v46;
    }
    while (v46);
  }
  v48 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v44);
  -[OPTTSPartialTextToSpeechStreamingResponse feature](v64, "feature");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "addObjectToBuffer:", a3);

  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v51 = *((_DWORD *)a3 + 8);
  v52 = *((_DWORD *)a3 + 12);
  v53 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v62);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v61);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 12, v59);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v58);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 16, *((_DWORD *)v72 + 12));
  if (v48)
  {
    v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v48);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v54);
  }
  if (v50)
  {
    v55 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v50);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v55);
  }
  v56.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51 - v52 + v53);
  if (v25)
    operator delete(v25);
  _Block_object_dispose(&v71, 8);
  return v56;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::PartialTextToSpeechStreamingResponse> v2;
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
  v2.var0 = -[OPTTSPartialTextToSpeechStreamingResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__OPTTSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__57__OPTTSPartialTextToSpeechStreamingResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __63__OPTTSPartialTextToSpeechStreamingResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<unsigned char>(*(apple::aiml::flatbuffers2::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

uint64_t __61__OPTTSPartialTextToSpeechStreamingResponse_word_timing_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
