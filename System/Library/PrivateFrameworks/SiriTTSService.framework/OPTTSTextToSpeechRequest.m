@implementation OPTTSTextToSpeechRequest

apple::aiml::flatbuffers2::DetachedBuffer *__57__OPTTSTextToSpeechRequest_ContextInfoEntry_flatbuffData__block_invoke(uint64_t a1)
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
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechRequest *root;
  uint64_t v17;
  unint64_t v18;
  apple::aiml::flatbuffers2::Table *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  const unsigned __int8 *v22;
  unsigned __int16 *v23;
  uint64_t v24;
  const unsigned __int8 *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  const unsigned __int8 *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  const unsigned __int8 *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  const unsigned __int8 *v34;
  unsigned __int16 *v35;
  unsigned int v36;
  const unsigned __int8 *v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int16 *v41;
  unsigned int v42;
  unsigned __int16 *v43;
  uint64_t v44;
  unsigned __int16 *v45;
  uint64_t v46;
  unsigned __int16 *v47;
  uint64_t v48;
  unsigned __int16 *v49;
  uint64_t v50;
  unsigned __int16 *v51;
  uint64_t v52;
  unsigned __int16 *v53;
  uint64_t v54;
  unsigned __int16 *v55;
  uint64_t v56;
  unsigned __int16 *v57;
  uint64_t v58;
  OPTTSTextToSpeechRequest *v59;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  uint64_t v64;
  char v65;
  objc_super v66;

  v5 = a5;
  v9 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OPTTSTextToSpeechRequest;
  v10 = -[OPTTSTextToSpeechRequest init](&v66, sel_init);
  if (v10)
  {
    if (v9 && objc_msgSend(v9, "length"))
    {
      p_data = (id *)&v10->_data;
      objc_storeStrong((id *)&v10->_data, a3);
      if (!a4)
      {
        v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
        a4 = (const TextToSpeechRequest *)v12 + *v12;
      }
      v10->_root = a4;
      if (!v5)
        goto LABEL_108;
      v13 = objc_msgSend(*p_data, "bytes");
      v14 = objc_msgSend(*p_data, "length");
      root = v10->_root;
      if ((unint64_t)root >= v13 && (unint64_t)root <= v13 + v14)
      {
        v17 = objc_msgSend(*p_data, "bytes");
        v18 = objc_msgSend(*p_data, "length");
        v61 = v17;
        v62 = v18;
        v63 = xmmword_19AE61140;
        v64 = 0;
        v65 = 1;
        if (v18 >= 0x7FFFFFFF)
          __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
        v19 = (apple::aiml::flatbuffers2::Table *)v10->_root;
        if (!v19)
          goto LABEL_108;
        if (apple::aiml::flatbuffers2::Verifier::VerifyTableStart((apple::aiml::flatbuffers2::Verifier *)&v61, v10->_root->var0)&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 4u))
        {
          v20 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
          if (*v20 >= 5u && (v21 = v20[2]) != 0)
            v22 = (const unsigned __int8 *)v19 + v21 + *(unsigned int *)((char *)v19 + v21);
          else
            v22 = 0;
          if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v22)
            && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 6u))
          {
            v23 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
            if (*v23 >= 7u && (v24 = v23[3]) != 0)
              v25 = (const unsigned __int8 *)v19 + v24 + *(unsigned int *)((char *)v19 + v24);
            else
              v25 = 0;
            if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v25)
              && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 8u))
            {
              v26 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
              if (*v26 >= 9u && (v27 = v26[4]) != 0)
                v28 = (const unsigned __int8 *)v19 + v27 + *(unsigned int *)((char *)v19 + v27);
              else
                v28 = 0;
              if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v28)
                && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0xAu))
              {
                v29 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                if (*v29 >= 0xBu && (v30 = v29[5]) != 0)
                  v31 = (const unsigned __int8 *)v19 + v30 + *(unsigned int *)((char *)v19 + v30);
                else
                  v31 = 0;
                if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v31)
                  && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0xCu))
                {
                  v32 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                  if (*v32 >= 0xDu && (v33 = v32[6]) != 0)
                    v34 = (const unsigned __int8 *)v19 + v33 + *(unsigned int *)((char *)v19 + v33);
                  else
                    v34 = 0;
                  if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v34))
                  {
                    v35 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                    v36 = *v35;
                    if ((v36 < 0xF
                       || (!v35[7] || v62 >= 5 && v62 - 4 >= (unint64_t)v19 + v35[7] - v61)
                       && (v36 < 0x11 || !v35[8] || v62 >= 2 && v62 - 1 >= (unint64_t)v19 + v35[8] - v61))
                      && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x12u))
                    {
                      v37 = v36 >= 0x13 && v35[9]
                          ? (const unsigned __int8 *)v19 + v35[9] + *(unsigned int *)((char *)v19 + v35[9])
                          : 0;
                      if (apple::aiml::flatbuffers2::Verifier::VerifyString((apple::aiml::flatbuffers2::Verifier *)&v61, v37)&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x14u))
                      {
                        v38 = 0;
                        v39 = *(int *)v19;
                        if (*(unsigned __int16 *)((char *)v19 - v39) >= 0x15u)
                        {
                          if (!*(_WORD *)((char *)v19 - v39 + 20))
                            goto LABEL_64;
                          if (!apple::aiml::flatbuffers2::Verifier::VerifyVectorOrString((apple::aiml::flatbuffers2::Verifier *)&v61, (const unsigned __int8 *)v19+ *(unsigned __int16 *)((char *)v19 - v39 + 20)+ *(unsigned int *)((char *)v19 + *(unsigned __int16 *)((char *)v19 - v39 + 20)), 4uLL, 0))goto LABEL_109;
                          v38 = 0;
                          v39 = *(int *)v19;
                          if (*(unsigned __int16 *)((char *)v19 - v39) >= 0x15u)
                          {
LABEL_64:
                            v40 = *(unsigned __int16 *)((char *)v19 - v39 + 20);
                            if (v40)
                              v38 = (_DWORD *)((char *)v19 + v40 + *(unsigned int *)((char *)v19 + v40));
                            else
                              v38 = 0;
                          }
                        }
                        if (apple::aiml::flatbuffers2::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>((apple::aiml::flatbuffers2::Verifier *)&v61, v38))
                        {
                          v41 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                          v42 = *v41;
                          if ((v42 < 0x17 || !v41[11] || v62 >= 5 && v62 - 4 >= (unint64_t)v19 + v41[11] - v61)
                            && apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x18u)&& (v42 < 0x19|| !v41[12]|| siri::speech::schema_fb::TextToSpeechRequestMeta::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v41[12]+ *(unsigned int *)((char *)v19 + v41[12])), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Au))
                          {
                            v43 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                            if ((*v43 < 0x1Bu
                               || (v44 = v43[13]) == 0
                               || siri::speech::schema_fb::TextToSpeechRequestContext::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v44+ *(unsigned int *)((char *)v19 + v44)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Cu))
                            {
                              v45 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                              if ((*v45 < 0x1Du
                                 || (v46 = v45[14]) == 0
                                 || siri::speech::schema_fb::TextToSpeechRequestExperiment::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v46+ *(unsigned int *)((char *)v19 + v46)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x1Eu))
                              {
                                v47 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                if ((*v47 < 0x1Fu
                                   || (v48 = v47[15]) == 0
                                   || siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v48+ *(unsigned int *)((char *)v19 + v48)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x20u))
                                {
                                  v49 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                  if ((*v49 < 0x21u
                                     || (v50 = v49[16]) == 0
                                     || siri::speech::schema_fb::TTSRequestFeatureFlags::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v50+ *(unsigned int *)((char *)v19 + v50)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x22u))
                                  {
                                    v51 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                    if ((*v51 < 0x23u
                                       || (v52 = v51[17]) == 0
                                       || siri::speech::schema_fb::TextToSpeechUserProfile::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v52+ *(unsigned int *)((char *)v19 + v52)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x24u))
                                    {
                                      v53 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                      if ((*v53 < 0x25u
                                         || (v54 = v53[18]) == 0
                                         || siri::speech::schema_fb::TextToSpeechRequestDevConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v54+ *(unsigned int *)((char *)v19 + v54)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x26u))
                                      {
                                        v55 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                        if ((*v55 < 0x27u
                                           || (v56 = v55[19]) == 0
                                           || siri::speech::schema_fb::TextToSpeechRequestProsodyTransferConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v56+ *(unsigned int *)((char *)v19 + v56)), (apple::aiml::flatbuffers2::Verifier *)&v61))&& apple::aiml::flatbuffers2::Table::VerifyOffset(v19, (const apple::aiml::flatbuffers2::Verifier *)&v61, 0x28u))
                                        {
                                          v57 = (unsigned __int16 *)((char *)v19 - *(int *)v19);
                                          if (*v57 < 0x29u)
                                            goto LABEL_108;
                                          v58 = v57[20];
                                          if (!v58
                                            || siri::speech::schema_fb::TextToSpeechRequestProsodyControlConfig::Verify((apple::aiml::flatbuffers2::Table *)((char *)v19+ v58+ *(unsigned int *)((char *)v19 + v58)), (apple::aiml::flatbuffers2::Verifier *)&v61))
                                          {
                                            goto LABEL_108;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_109:
    v59 = 0;
    goto LABEL_110;
  }
LABEL_108:
  v59 = v10;
LABEL_110:

  return v59;
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (int64_t)audio_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xFu && (v4 = *(unsigned __int16 *)v3[14].var0) != 0)
    return *(int *)root[v4].var0;
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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (NSArray)context_info
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__OPTTSTextToSpeechRequest_context_info__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechRequest context_info_enumerateObjectsUsingBlock:](self, "context_info_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("context_info"));

  }
  return (NSArray *)v3;
}

- (id)context_info_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTextToSpeechRequest_ContextInfoEntry *v7;
  OPTTSTextToSpeechRequest_ContextInfoEntry *v8;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v10;
  uint64_t v11;
  const TextToSpeechRequest *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTextToSpeechRequest_ContextInfoEntry *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x15u || (v11 = *(unsigned __int16 *)v10[20].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([OPTTSTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (unint64_t)context_info_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x15u && (v8 = *(unsigned __int16 *)v7[20].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)context_info_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, OPTTSTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v8;
  uint64_t v9;
  const TextToSpeechRequest *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechRequest *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTextToSpeechRequest_ContextInfoEntry *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTextToSpeechRequest_ContextInfoEntry *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("context_info"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x15u)
    {
      v9 = *(unsigned __int16 *)v8[20].var0;
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
            v16 = -[OPTTSTextToSpeechRequest_ContextInfoEntry initWithFlatbuffData:root:verify:]([OPTTSTextToSpeechRequest_ContextInfoEntry alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (int64_t)preferred_voice_type
{
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (v4 = *(unsigned __int16 *)v3[22].var0) != 0)
    return *(int *)root[v4].var0;
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

- (OPTTSTextToSpeechRequestDebug)debug
{
  OPTTSTextToSpeechRequestDebug *v3;
  OPTTSTextToSpeechRequestDebug *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("debug"));
  v3 = (OPTTSTextToSpeechRequestDebug *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestDebug alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x21u && (v7 = *(unsigned __int16 *)v6[32].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestDebug initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("debug"));
  }
  return v3;
}

- (OPTTSTextToSpeechUserProfile)profile
{
  OPTTSTextToSpeechUserProfile *v3;
  OPTTSTextToSpeechUserProfile *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("profile"));
  v3 = (OPTTSTextToSpeechUserProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechUserProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (v7 = *(unsigned __int16 *)v6[34].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechUserProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("profile"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestDevConfig)dev_config
{
  OPTTSTextToSpeechRequestDevConfig *v3;
  OPTTSTextToSpeechRequestDevConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("dev_config"));
  v3 = (OPTTSTextToSpeechRequestDevConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestDevConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x25u && (v7 = *(unsigned __int16 *)v6[36].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestDevConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("dev_config"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  OPTTSTextToSpeechRequestProsodyTransferConfig *v3;
  OPTTSTextToSpeechRequestProsodyTransferConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_config"));
  v3 = (OPTTSTextToSpeechRequestProsodyTransferConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestProsodyTransferConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x27u && (v7 = *(unsigned __int16 *)v6[38].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestProsodyTransferConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_config"));
  }
  return v3;
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  OPTTSTextToSpeechRequestProsodyControlConfig *v3;
  OPTTSTextToSpeechRequestProsodyControlConfig *v4;
  const TextToSpeechRequest *root;
  const TextToSpeechRequest *v6;
  uint64_t v7;
  const TextToSpeechRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prosody_control_config"));
  v3 = (OPTTSTextToSpeechRequestProsodyControlConfig *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [OPTTSTextToSpeechRequestProsodyControlConfig alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x29u && (v7 = *(unsigned __int16 *)v6[40].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[OPTTSTextToSpeechRequestProsodyControlConfig initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prosody_control_config"));
  }
  return v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechRequest>)addObjectToBuffer:(void *)a3
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
  __CFString *v21;
  __CFString *v22;
  const char *v23;
  size_t v24;
  __CFString *v25;
  __CFString *v26;
  const char *v27;
  size_t v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v32;
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
  uint64_t v47;
  void *v48;
  unsigned int v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v61;
  int v62;
  Offset<siri::speech::schema_fb::TextToSpeechRequest> v63;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int String;
  OPTTSTextToSpeechRequest *v77;
  unsigned int v78;
  id obj;
  unsigned int obja;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE *v85;
  char *v86;
  unint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  -[OPTTSTextToSpeechRequest speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E3A161B0;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[OPTTSTextToSpeechRequest session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_1E3A161B0;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v75 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  -[OPTTSTextToSpeechRequest language](self, "language");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_1E3A161B0;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v74 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[OPTTSTextToSpeechRequest gender](self, "gender");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_1E3A161B0;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v73 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  -[OPTTSTextToSpeechRequest text](self, "text");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
    v21 = &stru_1E3A161B0;
  v23 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v21), "UTF8String");
  v24 = strlen(v23);
  v72 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  v71 = -[OPTTSTextToSpeechRequest audio_type](self, "audio_type");
  v70 = -[OPTTSTextToSpeechRequest enable_word_timing_info](self, "enable_word_timing_info");
  -[OPTTSTextToSpeechRequest voice_name](self, "voice_name");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &stru_1E3A161B0;
  v27 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v25), "UTF8String");
  v28 = strlen(v27);
  v29 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v85 = 0;
  v86 = 0;
  v87 = 0;
  -[OPTTSTextToSpeechRequest context_info](self, "context_info");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>::reserve((void **)&v85, objc_msgSend(v30, "count"));

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  -[OPTTSTextToSpeechRequest context_info](self, "context_info");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  v69 = v29;
  v77 = self;
  v32 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  v33 = v85;
  if (v31)
  {
    v34 = *(_QWORD *)v82;
    v35 = v87;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v82 != v34)
          objc_enumerationMutation(obj);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "addObjectToBuffer:", v32);
        v38 = v37;
        v39 = v86;
        if ((unint64_t)v86 >= v35)
        {
          v41 = (v86 - v33) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
          {
            v85 = v33;
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v35 - (_QWORD)v33) >> 1 > v42)
            v42 = (uint64_t)(v35 - (_QWORD)v33) >> 1;
          if (v35 - (unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          else
            v44 = 0;
          v45 = (_DWORD *)(v43 + 4 * v41);
          *v45 = v38;
          v40 = (char *)(v45 + 1);
          while (v39 != v33)
          {
            v46 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *--v45 = v46;
          }
          v35 = v43 + 4 * v44;
          v86 = v40;
          if (v33)
            operator delete(v33);
          v33 = v45;
        }
        else
        {
          *(_DWORD *)v86 = v37;
          v40 = v39 + 4;
        }
        v86 = v40;
      }
      v87 = v35;
      v85 = v33;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    }
    while (v31);
  }
  else
  {
    v40 = v86;
  }

  v47 = (uint64_t)v32;
  if (v40 == v33)
    v48 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>> const&)::t;
  else
    v48 = v33;
  v49 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>(v32, (uint64_t)v48, (v40 - v33) >> 2);
  v50 = -[OPTTSTextToSpeechRequest preferred_voice_type](v77, "preferred_voice_type");
  -[OPTTSTextToSpeechRequest meta_info](v77, "meta_info");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  obja = objc_msgSend(v51, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest context](v77, "context");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v52, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest experiment](v77, "experiment");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v53, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest feature_flags](v77, "feature_flags");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v54, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest debug](v77, "debug");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v55, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest profile](v77, "profile");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = objc_msgSend(v56, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest dev_config](v77, "dev_config");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = objc_msgSend(v57, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest prosody_config](v77, "prosody_config");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v56) = objc_msgSend(v58, "addObjectToBuffer:", v47);

  -[OPTTSTextToSpeechRequest prosody_control_config](v77, "prosody_control_config");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v59, "addObjectToBuffer:", v47);

  v60 = v56;
  LODWORD(v56) = (_DWORD)v54;
  LODWORD(v54) = v50;
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(v47);
  v61 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)v47;
  *(_BYTE *)(v47 + 70) = 1;
  LODWORD(v59) = *(_DWORD *)(v47 + 32);
  v62 = *(_DWORD *)(v47 + 48);
  LODWORD(v57) = *((_DWORD *)v61 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 6, v75);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 8, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 10, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 12, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 14, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(v61, 16, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 18, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 20, v49);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v61, 22, (int)v54);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 24, obja);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 26, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 28, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 30, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 32, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 34, v56);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 36, v55);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 38, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>(v61, 40, v78);
  v63.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v61, (int)v59 - v62 + (int)v57);
  if (v33)
  {
    v86 = v33;
    operator delete(v33);
  }
  return v63;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechRequest> v2;
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
  v2.var0 = -[OPTTSTextToSpeechRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__40__OPTTSTextToSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __40__OPTTSTextToSpeechRequest_context_info__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
