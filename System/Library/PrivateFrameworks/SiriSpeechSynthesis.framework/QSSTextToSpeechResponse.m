@implementation QSSTextToSpeechResponse

- (QSSTextToSpeechResponse)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4
{
  return -[QSSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechResponse *v10;
  QSSTextToSpeechResponse *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TextToSpeechResponse *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTextToSpeechResponse *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechResponse;
  v10 = -[QSSTextToSpeechResponse init](&v30, sel_init);
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
      a4 = (const TextToSpeechResponse *)v13 + *v13;
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
      root = (siri::speech::schema_fb::TextToSpeechResponse *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechResponse::Verify(root, (flatbuffers::Verifier *)&v25))
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
  const TextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechResponse *v6;

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
  const TextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechResponse *v6;

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
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v3;
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
  const TextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechResponse *v6;

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

- (int64_t)audio_type
{
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (int)sample_rate
{
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v3;
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
  const TextToSpeechResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechResponse *v6;

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
  const TextToSpeechResponse *root;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const TextToSpeechResponse *v9;
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
  (*((void (**)(id, const TextToSpeechResponse *, _QWORD))v4 + 2))(v4, v9 + 4, *(unsigned int *)root[v7 + v8].var0);

}

- (QSSAudioDescription)decoder_description
{
  QSSAudioDescription *v3;
  QSSAudioDescription *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("decoder_description"));
  v3 = (QSSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (v7 = *(unsigned __int16 *)v6[18].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("decoder_description"));
  }
  return v3;
}

- (QSSAudioDescription)playback_description
{
  QSSAudioDescription *v3;
  QSSAudioDescription *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("playback_description"));
  v3 = (QSSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("playback_description"));
  }
  return v3;
}

- (NSArray)word_timing_info
{
  void *v3;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v5;
  uint64_t v6;
  const TextToSpeechResponse *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechResponse *v10;
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
    if (*(unsigned __int16 *)v5->var0 >= 0x17u)
    {
      v6 = *(unsigned __int16 *)v5[22].var0;
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

- (QSSTextToSpeechMeta)meta_info
{
  QSSTextToSpeechMeta *v3;
  QSSTextToSpeechMeta *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (QSSTextToSpeechMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (QSSTextToSpeechFeature)feature
{
  QSSTextToSpeechFeature *v3;
  QSSTextToSpeechFeature *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature"));
  v3 = (QSSTextToSpeechFeature *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechFeature alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechFeature initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature"));
  }
  return v3;
}

- (QSSTextToSpeechResponseDevData)dev_data
{
  QSSTextToSpeechResponseDevData *v3;
  QSSTextToSpeechResponseDevData *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("dev_data"));
  v3 = (QSSTextToSpeechResponseDevData *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSTextToSpeechResponseDevData alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSTextToSpeechResponseDevData initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("dev_data"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  __CFString *v12;
  __CFString *v13;
  const char *v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int *begin;
  uint64_t v21;
  int *value;
  void *v23;
  uint64_t i;
  int v25;
  int v26;
  std::vector<int>::pointer end;
  int *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int *v33;
  int v34;
  int *v35;
  unsigned int v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  unsigned int v41;
  int v42;
  int v43;
  Offset<siri::speech::schema_fb::TextToSpeechResponse> v44;
  unsigned int v46;
  unsigned int v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  unsigned int v52;
  unsigned int String;
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
  -[QSSTextToSpeechResponse speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24E246F88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[QSSTextToSpeechResponse session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24E246F88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v52 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  v51 = -[QSSTextToSpeechResponse error_code](self, "error_code");
  -[QSSTextToSpeechResponse error_str](self, "error_str");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24E246F88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v50 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  v49 = -[QSSTextToSpeechResponse audio_type](self, "audio_type");
  v48 = -[QSSTextToSpeechResponse sample_rate](self, "sample_rate");
  v62 = 0;
  v63 = &v62;
  v64 = 0x3812000000;
  v65 = __Block_byref_object_copy__629;
  v66 = __Block_byref_object_dispose__630;
  v67 = &unk_21E36C185;
  v68 = 0;
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __45__QSSTextToSpeechResponse_addObjectToBuffer___block_invoke;
  v61[3] = &unk_24E246AC0;
  v61[4] = &v62;
  v61[5] = a3;
  -[QSSTextToSpeechResponse audio:](self, "audio:", v61);
  -[QSSTextToSpeechResponse decoder_description](self, "decoder_description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  -[QSSTextToSpeechResponse playback_description](self, "playback_description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v17, "addObjectToBuffer:", a3);

  memset(&v60, 0, sizeof(v60));
  -[QSSTextToSpeechResponse word_timing_info](self, "word_timing_info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v60, objc_msgSend(v18, "count"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[QSSTextToSpeechResponse word_timing_info](self, "word_timing_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  begin = v60.__begin_;
  if (v19)
  {
    v21 = *(_QWORD *)v57;
    value = v60.__end_cap_.__value_;
    v23 = a3;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(obj);
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v26 = v25;
        end = v60.__end_;
        if (v60.__end_ >= value)
        {
          v29 = v60.__end_ - begin;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 62)
          {
            v60.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v30)
            v30 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v31 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v31);
          else
            v32 = 0;
          v33 = (int *)(v31 + 4 * v29);
          *v33 = v26;
          v28 = v33 + 1;
          while (end != begin)
          {
            v34 = *--end;
            *--v33 = v34;
          }
          value = (int *)(v31 + 4 * v32);
          v60.__end_ = v28;
          if (begin)
            operator delete(begin);
          begin = v33;
          a3 = v23;
        }
        else
        {
          *v60.__end_ = v25;
          v28 = end + 1;
        }
        v60.__end_ = v28;
      }
      v60.__end_cap_.__value_ = value;
      v60.__begin_ = begin;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v19);
  }
  else
  {
    v28 = v60.__end_;
  }

  if (v28 == begin)
    v35 = (int *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  else
    v35 = begin;
  v36 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v35, v28 - begin);
  -[QSSTextToSpeechResponse meta_info](self, "meta_info");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "addObjectToBuffer:", a3);

  -[QSSTextToSpeechResponse feature](self, "feature");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v39, "addObjectToBuffer:", a3);

  -[QSSTextToSpeechResponse dev_data](self, "dev_data");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v40) = *((_DWORD *)a3 + 8);
  v42 = *((_DWORD *)a3 + 12);
  v43 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v52);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v50);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 12, v49);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v48);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 16, *((_DWORD *)v63 + 12));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 18, v47);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v46);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v36);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 24, v38);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 26, v37);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 28, v41);
  v44.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v40 - v42 + v43);
  if (begin)
  {
    v60.__end_ = begin;
    operator delete(begin);
  }
  _Block_object_dispose(&v62, 8);
  return v44;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechResponse> v2;
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
  v2.var0 = -[QSSTextToSpeechResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__QSSTextToSpeechResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__39__QSSTextToSpeechResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __45__QSSTextToSpeechResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
