@implementation OPTTSTextToSpeechRequest

flatbuffers::DetachedBuffer *__57__OPTTSTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
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

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4
{
  return -[OPTTSTextToSpeechRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechRequest)initWithFlatbuffData:(id)a3 root:(const TextToSpeechRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechRequest *v10;
  OPTTSTextToSpeechRequest *v11;
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
  uint64_t v28;
  const unsigned __int8 *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  const unsigned __int8 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  const unsigned __int8 *v35;
  unsigned __int16 *v36;
  unsigned int v37;
  const unsigned __int8 *v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int16 *v42;
  unsigned int v43;
  unsigned __int16 *v44;
  uint64_t v45;
  unsigned __int16 *v46;
  uint64_t v47;
  unsigned __int16 *v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *storage;
  OPTTSTextToSpeechRequest *v52;
  uint64_t v54;
  unint64_t v55;
  __int128 v56;
  uint64_t v57;
  char v58;
  objc_super v59;

  v5 = a5;
  v9 = a3;
  v59.receiver = self;
  v59.super_class = (Class)OPTTSTextToSpeechRequest;
  v10 = -[OPTTSTextToSpeechRequest init](&v59, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_89;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_90;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_88;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_90;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v54 = v18;
  v55 = v19;
  v56 = xmmword_21AACED40;
  v57 = 0;
  v58 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_88;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v54, v11->_root->var0)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 4u))
  {
    goto LABEL_90;
  }
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u && (v22 = v21[2]) != 0)
    v23 = (const unsigned __int8 *)root + v22 + *(unsigned int *)((char *)root + v22);
  else
    v23 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 6u))
  {
    goto LABEL_90;
  }
  v24 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v24 >= 7u && (v25 = v24[3]) != 0)
    v26 = (const unsigned __int8 *)root + v25 + *(unsigned int *)((char *)root + v25);
  else
    v26 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v26)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 8u))
  {
    goto LABEL_90;
  }
  v27 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v27 >= 9u && (v28 = v27[4]) != 0)
    v29 = (const unsigned __int8 *)root + v28 + *(unsigned int *)((char *)root + v28);
  else
    v29 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v29)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0xAu))
  {
    goto LABEL_90;
  }
  v30 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v30 >= 0xBu && (v31 = v30[5]) != 0)
    v32 = (const unsigned __int8 *)root + v31 + *(unsigned int *)((char *)root + v31);
  else
    v32 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v32)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0xCu))
  {
    goto LABEL_90;
  }
  v33 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v33 >= 0xDu && (v34 = v33[6]) != 0)
    v35 = (const unsigned __int8 *)root + v34 + *(unsigned int *)((char *)root + v34);
  else
    v35 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v35))
    goto LABEL_90;
  v36 = (unsigned __int16 *)((char *)root - *(int *)root);
  v37 = *v36;
  if (v37 >= 0xF
    && (v36[7] && (v55 < 5 || v55 - 4 < (unint64_t)root + v36[7] - v54)
     || v37 >= 0x11 && v36[8] && (v55 < 2 || v55 - 1 < (unint64_t)root + v36[8] - v54)))
  {
    goto LABEL_90;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x12u))
    goto LABEL_90;
  v38 = v37 >= 0x13 && v36[9] ? (const unsigned __int8 *)root + v36[9] + *(unsigned int *)((char *)root + v36[9]) : 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v54, v38)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x14u))
  {
    goto LABEL_90;
  }
  v39 = 0;
  v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) < 0x15u)
    goto LABEL_67;
  if (!*(_WORD *)((char *)root - v40 + 20))
    goto LABEL_64;
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v54, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v40 + 20)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v40 + 20)), 4uLL, 0))
  {
LABEL_90:
    v52 = 0;
    goto LABEL_91;
  }
  v39 = 0;
  v40 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v40) >= 0x15u)
  {
LABEL_64:
    v41 = *(unsigned __int16 *)((char *)root - v40 + 20);
    if (v41)
      v39 = (_DWORD *)((char *)root + v41 + *(unsigned int *)((char *)root + v41));
    else
      v39 = 0;
  }
LABEL_67:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::Verifier *)&v54, v39))goto LABEL_90;
  v42 = (unsigned __int16 *)((char *)root - *(int *)root);
  v43 = *v42;
  if (v43 >= 0x17 && v42[11] && (v55 < 5 || v55 - 4 < (unint64_t)root + v42[11] - v54))
    goto LABEL_90;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x18u)
    || v43 >= 0x19
    && v42[12]
    && !siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((flatbuffers::Table *)((char *)root + v42[12] + *(unsigned int *)((char *)root + v42[12])), (flatbuffers::Verifier *)&v54))
  {
    goto LABEL_90;
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Au))
    goto LABEL_90;
  v44 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v44 >= 0x1Bu)
  {
    v45 = v44[13];
    if (v45)
    {
      if (!siri::speech::schema_fb::TextToSpeechRequestContext::Verify((flatbuffers::Table *)((char *)root + v45 + *(unsigned int *)((char *)root + v45)), (flatbuffers::Verifier *)&v54))goto LABEL_90;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Cu))
    goto LABEL_90;
  v46 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v46 >= 0x1Du)
  {
    v47 = v46[14];
    if (v47)
    {
      if (!siri::speech::schema_fb::TextToSpeechRequestExperiment::Verify((flatbuffers::Table *)((char *)root + v47 + *(unsigned int *)((char *)root + v47)), (flatbuffers::Verifier *)&v54))goto LABEL_90;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v54, 0x1Eu))
    goto LABEL_90;
  v48 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v48 >= 0x1Fu)
  {
    v49 = v48[15];
    if (v49)
    {
      if (!siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((flatbuffers::Table *)((char *)root + v49 + *(unsigned int *)((char *)root + v49)), (flatbuffers::Verifier *)&v54))goto LABEL_90;
    }
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v54);
  v50 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v50;

LABEL_89:
  v52 = v11;
LABEL_91:

  return v52;
}

- (NSString)speech_id
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSString)language
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSString)gender
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (NSString)text
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

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

- (int64_t)audio_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (BOOL)enable_word_timing_info
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)voice_name
{
  const TextToSpeechRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TextToSpeechRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (NSArray)context_info
{
  void *v3;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v5;
  uint64_t v6;
  const TextToSpeechRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechRequest *v10;
  uint64_t v11;
  OPTTSTextToSpeechRequest_ContextInfoEntry *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x15u)
    {
      v6 = *(unsigned __int16 *)v5[20].var0;
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
            v12 = -[OPTTSTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([OPTTSTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));
  }
  return (NSArray *)v3;
}

- (int64_t)preferred_voice_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0)
    return *(unsigned int *)root[v4].var0;
  else
    return 0;
}

- (OPTTSTextToSpeechRequestMeta)meta_info
{
  OPTTSTextToSpeechRequestMeta *v3;
  OPTTSTextToSpeechRequestMeta *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("meta_info"));
  v3 = (OPTTSTextToSpeechRequestMeta *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestMeta alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestMeta initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("meta_info"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestContext)context
{
  OPTTSTextToSpeechRequestContext *v3;
  OPTTSTextToSpeechRequestContext *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context"));
  v3 = (OPTTSTextToSpeechRequestContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestContext alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Bu && (v7 = *(unsigned __int16 *)v6[26].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestContext initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestExperiment)experiment
{
  OPTTSTextToSpeechRequestExperiment *v3;
  OPTTSTextToSpeechRequestExperiment *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("experiment"));
  v3 = (OPTTSTextToSpeechRequestExperiment *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestExperiment alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (v7 = *(unsigned __int16 *)v6[28].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestExperiment initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("experiment"));
  }
  return v3;
}

- (OPTTSTTSRequestFeatureFlags)feature_flags
{
  OPTTSTTSRequestFeatureFlags *v3;
  OPTTSTTSRequestFeatureFlags *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("feature_flags"));
  v3 = (OPTTSTTSRequestFeatureFlags *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTTSRequestFeatureFlags alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Fu && (v7 = *(unsigned __int16 *)v6[30].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTTSRequestFeatureFlags initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("feature_flags"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
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
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  size_t v19;
  __CFString *v20;
  __CFString *v21;
  const char *v22;
  size_t v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  const char *v27;
  size_t v28;
  unsigned int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t i;
  int v37;
  int v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  int v46;
  void *v47;
  unsigned int v48;
  int v49;
  void *v50;
  unsigned int v51;
  void *v52;
  unsigned int v53;
  void *v54;
  unsigned int v55;
  void *v56;
  Offset<siri::speech::schema_fb::TextToSpeechRequest> v57;
  unsigned int v59;
  int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  OPTTSTextToSpeechRequest *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int String;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE *v74;
  char *v75;
  unint64_t v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[OPTTSTextToSpeechRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24DD8EF88;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v6, v7);

  -[OPTTSTextToSpeechRequest session_id](self, "session_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_24DD8EF88;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v67 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v10, v11);

  -[OPTTSTextToSpeechRequest language](self, "language");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_24DD8EF88;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v64 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v14, v15);

  -[OPTTSTextToSpeechRequest gender](self, "gender");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_24DD8EF88;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v63 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  -[OPTTSTextToSpeechRequest text](self, "text");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_24DD8EF88;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v62 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v22, v23);

  v61 = -[OPTTSTextToSpeechRequest audio_type](self, "audio_type");
  v60 = -[OPTTSTextToSpeechRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[OPTTSTextToSpeechRequest voice_name](self, "voice_name");
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
    v24 = &stru_24DD8EF88;
  v26 = a3;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v24), "UTF8String");
  v28 = strlen(v27);
  v29 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v27, v28);

  v74 = 0;
  v75 = 0;
  v76 = 0;
  -[OPTTSTextToSpeechRequest context_info](self, "context_info");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v74, objc_msgSend(v30, "count"));

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[OPTTSTextToSpeechRequest context_info](self, "context_info");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  v59 = v29;
  v65 = self;
  v33 = v74;
  if (v32)
  {
    v34 = *(_QWORD *)v71;
    v35 = v76;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v71 != v34)
          objc_enumerationMutation(v31);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "addObjectToBuffer:", v26);
        v38 = v37;
        v39 = v75;
        if ((unint64_t)v75 >= v35)
        {
          v41 = (v75 - v33) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
          {
            v74 = v33;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v35 - (_QWORD)v33) >> 1 > v42)
            v42 = (uint64_t)(v35 - (_QWORD)v33) >> 1;
          if (v35 - (unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          else
            v44 = 0;
          v45 = (_DWORD *)(v43 + 4 * v41);
          *v45 = v38;
          v40 = (char *)(v45 + 1);
          if (v39 == v33)
          {
            v26 = a3;
          }
          else
          {
            v26 = a3;
            do
            {
              v46 = *((_DWORD *)v39 - 1);
              v39 -= 4;
              *--v45 = v46;
            }
            while (v39 != v33);
          }
          v35 = v43 + 4 * v44;
          v75 = v40;
          if (v33)
            operator delete(v33);
          v33 = v45;
        }
        else
        {
          *(_DWORD *)v75 = v37;
          v40 = v39 + 4;
          v26 = a3;
        }
        v75 = v40;
      }
      v76 = v35;
      v74 = v33;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v32);
  }
  else
  {
    v40 = v75;
  }

  if (v40 == v33)
    v47 = &flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  else
    v47 = v33;
  v48 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v47, (v40 - v33) >> 2);
  v49 = -[OPTTSTextToSpeechRequest preferred_voice_type](v65, "preferred_voice_type");
  -[OPTTSTextToSpeechRequest meta_info](v65, "meta_info");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "addObjectToBuffer:", a3);

  -[OPTTSTextToSpeechRequest context](v65, "context");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "addObjectToBuffer:", a3);

  -[OPTTSTextToSpeechRequest experiment](v65, "experiment");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "addObjectToBuffer:", a3);

  -[OPTTSTextToSpeechRequest feature_flags](v65, "feature_flags");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v56, "addObjectToBuffer:", a3);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  LODWORD(v56) = *((_DWORD *)a3 + 8);
  LODWORD(v50) = *((_DWORD *)a3 + 12);
  LODWORD(v52) = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 4, String);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 6, v67);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 8, v64);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 10, v63);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 12, v62);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 14, v61);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((flatbuffers::vector_downward *)a3, 16, v60);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 18, v59);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 20, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 24, v51);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 26, v53);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 28, v55);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::String>((flatbuffers::FlatBufferBuilder *)a3, 30, v66);
  v57.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, (int)v56 - (int)v50 + (int)v52);
  if (v33)
  {
    v75 = v33;
    operator delete(v33);
  }
  return v57;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechRequest> v2;
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
  v2.var0 = -[OPTTSTextToSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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

@end
