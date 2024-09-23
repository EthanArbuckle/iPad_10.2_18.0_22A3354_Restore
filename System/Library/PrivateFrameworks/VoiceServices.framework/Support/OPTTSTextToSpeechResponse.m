@implementation OPTTSTextToSpeechResponse

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4
{
  return -[OPTTSTextToSpeechResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechResponse)initWithFlatbuffData:(id)a3 root:(const TextToSpeechResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechResponse *v10;
  OPTTSTextToSpeechResponse *v11;
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
  unsigned __int16 *v30;
  unsigned int v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  _DWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int16 *v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableDictionary *storage;
  OPTTSTextToSpeechResponse *v43;
  uint64_t v45;
  unint64_t v46;
  __int128 v47;
  uint64_t v48;
  char v49;
  objc_super v50;

  v5 = a5;
  v9 = a3;
  v50.receiver = self;
  v50.super_class = (Class)OPTTSTextToSpeechResponse;
  v10 = -[OPTTSTextToSpeechResponse init](&v50, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_71;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_72;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechResponse *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_70;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_72;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v45 = v18;
  v46 = v19;
  v47 = xmmword_21AACED40;
  v48 = 0;
  v49 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_70;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v45, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 4u))
  {
    goto LABEL_72;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 6u))
  {
    goto LABEL_72;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v26))
    goto LABEL_72;
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  v28 = *v27;
  if (v28 >= 9 && v27[4] && (v46 < 5 || v46 - 4 < (unint64_t)root + v27[4] - v45))
    goto LABEL_72;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0xAu))
    goto LABEL_72;
  v29 = v28 >= 0xB && v27[5] ? (const unsigned __int8 *)root + v27[5] + *(unsigned int *)((char *)root + v27[5]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v45, v29))
    goto LABEL_72;
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  v31 = *v30;
  if (v31 >= 0xD
    && (v30[6] && (v46 < 5 || v46 - 4 < (unint64_t)root + v30[6] - v45)
     || v31 >= 0xF && v30[7] && (v46 < 5 || v46 - 4 < (unint64_t)root + v30[7] - v45)))
  {
    goto LABEL_72;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x10u)
    || v31 >= 0x11
    && v30[8]
    && !flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v45, (const unsigned __int8 *)root + v30[8] + *(unsigned int *)((char *)root + v30[8]), 1uLL, 0))
  {
    goto LABEL_72;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x12u))
    goto LABEL_72;
  v32 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v32 >= 0x13u)
  {
    v33 = v32[9];
    if (v33)
    {
      if (!siri::speech::schema_fb::AudioDescription::Verify((flatbuffers::Table *)((char *)root + v33 + *(unsigned int *)((char *)root + v33)), (flatbuffers::Verifier *)&v45))goto LABEL_72;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x14u))
    goto LABEL_72;
  v34 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v34 >= 0x15u)
  {
    v35 = v34[10];
    if (v35)
    {
      if (!siri::speech::schema_fb::AudioDescription::Verify((flatbuffers::Table *)((char *)root + v35 + *(unsigned int *)((char *)root + v35)), (flatbuffers::Verifier *)&v45))goto LABEL_72;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x16u))
    goto LABEL_72;
  v36 = 0;
  v37 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v37) < 0x17u)
    goto LABEL_65;
  if (*(_WORD *)((char *)root - v37 + 22))
  {
    if (flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v45, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v37 + 22)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v37 + 22)), 4uLL, 0))
    {
      v36 = 0;
      v37 = *(int *)root;
      if (*(unsigned __int16 *)((char *)root - v37) < 0x17u)
        goto LABEL_65;
      goto LABEL_61;
    }
LABEL_72:
    v43 = 0;
    goto LABEL_73;
  }
LABEL_61:
  v38 = *(unsigned __int16 *)((char *)root - v37 + 22);
  if (v38)
    v36 = (_DWORD *)((char *)root + v38 + *(unsigned int *)((char *)root + v38));
  else
    v36 = 0;
LABEL_65:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::WordTimingInfo>((flatbuffers::Verifier *)&v45, v36))goto LABEL_72;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v45, 0x18u))
    goto LABEL_72;
  v39 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v39 >= 0x19u)
  {
    v40 = v39[12];
    if (v40)
    {
      if (!siri::speech::schema_fb::TextToSpeechMeta::Verify((flatbuffers::Table *)((char *)root + v40 + *(unsigned int *)((char *)root + v40)), (flatbuffers::Verifier *)&v45))goto LABEL_72;
    }
  }
LABEL_70:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v45);
  v41 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v41;

LABEL_71:
  v43 = v11;
LABEL_73:

  return v43;
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

- (OPTTSAudioDescription)decoder_description
{
  OPTTSAudioDescription *v3;
  OPTTSAudioDescription *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("decoder_description"));
  v3 = (OPTTSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (v7 = *(unsigned __int16 *)v6[18].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("decoder_description"));
  }
  return v3;
}

- (OPTTSAudioDescription)playback_description
{
  OPTTSAudioDescription *v3;
  OPTTSAudioDescription *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("playback_description"));
  v3 = (OPTTSAudioDescription *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSAudioDescription alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSAudioDescription initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
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
  OPTTSWordTimingInfo *v12;

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

- (OPTTSTextToSpeechMeta)meta_info
{
  OPTTSTextToSpeechMeta *v3;
  OPTTSTextToSpeechMeta *v4;
  const TextToSpeechResponse *root;
  const TextToSpeechResponse *v6;
  uint64_t v7;
  const TextToSpeechResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (OPTTSTextToSpeechMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechResponse>)addObjectToBuffer:(void *)a3
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  flatbuffers::FlatBufferBuilder *v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
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
  unint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  int v44;
  int v45;
  Offset<siri::speech::schema_fb::TextToSpeechResponse> v46;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  OPTTSTextToSpeechResponse *v52;
  int v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE *v62;
  char *v63;
  unint64_t v64;
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t (*v70)();
  void *v71;
  int v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  -[OPTTSTextToSpeechResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_24DD8EF88;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  -[OPTTSTextToSpeechResponse session_id](self, "session_id");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = &stru_24DD8EF88;
  v12 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v10), "UTF8String");
  v13 = strlen(v12);
  v56 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  v14 = -[OPTTSTextToSpeechResponse error_code](self, "error_code");
  -[OPTTSTextToSpeechResponse error_str](self, "error_str");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &stru_24DD8EF88;
  v17 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
  v18 = strlen(v17);
  v55 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v17, v18);

  v54 = -[OPTTSTextToSpeechResponse audio_type](self, "audio_type");
  v53 = -[OPTTSTextToSpeechResponse sample_rate](self, "sample_rate");
  v66 = 0;
  v67 = &v66;
  v68 = 0x3812000000;
  v69 = __Block_byref_object_copy__1246;
  v70 = __Block_byref_object_dispose__1247;
  v71 = &unk_21AAD8ACB;
  v72 = 0;
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __47__OPTTSTextToSpeechResponse_addObjectToBuffer___block_invoke;
  v65[3] = &unk_24DD8E578;
  v65[4] = &v66;
  v65[5] = a3;
  -[OPTTSTextToSpeechResponse audio:](self, "audio:", v65);
  -[OPTTSTextToSpeechResponse decoder_description](self, "decoder_description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  -[OPTTSTextToSpeechResponse playback_description](self, "playback_description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  v62 = 0;
  v63 = 0;
  v64 = 0;
  -[OPTTSTextToSpeechResponse word_timing_info](self, "word_timing_info");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v62, objc_msgSend(v21, "count"));

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[OPTTSTextToSpeechResponse word_timing_info](self, "word_timing_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
  v50 = v14;
  v51 = String;
  v52 = self;
  v23 = (flatbuffers::FlatBufferBuilder *)a3;
  v24 = v62;
  if (v22)
  {
    v25 = *(_QWORD *)v59;
    v26 = v64;
    v27 = obj;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v59 != v25)
          objc_enumerationMutation(v27);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "addObjectToBuffer:", v23);
        v30 = v29;
        v31 = v63;
        if ((unint64_t)v63 >= v26)
        {
          v33 = (v63 - v24) >> 2;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
          {
            v62 = v24;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v26 - (_QWORD)v24) >> 1 > v34)
            v34 = (uint64_t)(v26 - (_QWORD)v24) >> 1;
          if (v26 - (unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL)
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
          if (v31 == v24)
          {
            v27 = obj;
          }
          else
          {
            v27 = obj;
            do
            {
              v38 = *((_DWORD *)v31 - 1);
              v31 -= 4;
              *--v37 = v38;
            }
            while (v31 != v24);
          }
          v26 = v35 + 4 * v36;
          v63 = v32;
          if (v24)
            operator delete(v24);
          v24 = v37;
        }
        else
        {
          *(_DWORD *)v63 = v29;
          v32 = v31 + 4;
          v27 = obj;
        }
        v63 = v32;
      }
      v64 = v26;
      v62 = v24;
      v22 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    }
    while (v22);
  }
  else
  {
    v32 = v63;
    v27 = obj;
  }

  v39 = (unint64_t)v23;
  if (v32 == v24)
    v40 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::WordTimingInfo>> const&)::t;
  else
    v40 = v24;
  v41 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>(v23, (uint64_t)v40, (v32 - v24) >> 2);
  -[OPTTSTextToSpeechResponse meta_info](v52, "meta_info");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "addObjectToBuffer:", v39);

  flatbuffers::FlatBufferBuilder::NotNested(v39);
  *(_BYTE *)(v39 + 70) = 1;
  LODWORD(v42) = *(_DWORD *)(v39 + 32);
  v44 = *(_DWORD *)(v39 + 48);
  v45 = *(_DWORD *)(v39 + 40);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 4, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 6, v56);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 8, v50);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 10, v55);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 12, v54);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(v39, 14, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)v39, *((_DWORD *)v67 + 12));
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 18, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 20, v48);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 22, v41);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)v39, 24, v43);
  v46.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v39, (int)v42 - v44 + v45);
  if (v24)
  {
    v63 = v24;
    operator delete(v24);
  }
  _Block_object_dispose(&v66, 8);
  return v46;
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
  v13 = xmmword_21AACED50;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[OPTTSTextToSpeechResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__OPTTSTextToSpeechResponse_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__41__OPTTSTextToSpeechResponse_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __47__OPTTSTextToSpeechResponse_addObjectToBuffer___block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result;

  result = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>(*(flatbuffers::FlatBufferBuilder **)(a1 + 40), a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = result;
  return result;
}

@end
