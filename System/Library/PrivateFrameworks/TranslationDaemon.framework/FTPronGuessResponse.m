@implementation FTPronGuessResponse

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3
{
  return -[FTPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4
{
  return -[FTPronGuessResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTPronGuessResponse)initWithFlatbuffData:(id)a3 root:(const PronGuessResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTPronGuessResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const PronGuessResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::PronGuessResponse *v19;
  FTPronGuessResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTPronGuessResponse;
  v10 = -[FTPronGuessResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const PronGuessResponse *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5)
    goto LABEL_13;
  v13 = objc_msgSend(*p_data, "bytes");
  v14 = objc_msgSend(*p_data, "length");
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14)
    goto LABEL_14;
  v17 = objc_msgSend(*p_data, "bytes");
  v18 = objc_msgSend(*p_data, "length");
  v22[0] = v17;
  v22[1] = v18;
  v23 = xmmword_249338830;
  v24 = 0;
  v25 = 1;
  v19 = (siri::speech::schema_fb::PronGuessResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::PronGuessResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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
  const PronGuessResponse *root;
  const PronGuessResponse *v3;
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
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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

- (NSString)apg_id
{
  const PronGuessResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const PronGuessResponse *v6;

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

- (FTVocToken)voc_token
{
  FTVocToken *v3;
  FTVocToken *v4;
  const PronGuessResponse *root;
  const PronGuessResponse *v6;
  uint64_t v7;
  const PronGuessResponse *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("voc_token"));
  v3 = (FTVocToken *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTVocToken alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTVocToken initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("voc_token"));
  }
  return v3;
}

- (NSArray)tts_pronunciations
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tts_pronunciations"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__FTPronGuessResponse_tts_pronunciations__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTPronGuessResponse tts_pronunciations_enumerateObjectsUsingBlock:](self, "tts_pronunciations_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("tts_pronunciations"));

  }
  return (NSArray *)v3;
}

uint64_t __41__FTPronGuessResponse_tts_pronunciations__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)tts_pronunciations_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTPronunciation *v7;
  FTPronunciation *v8;
  const PronGuessResponse *root;
  const PronGuessResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tts_pronunciations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTPronunciation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x11u || (v11 = *(unsigned __int16 *)v10[16].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTPronunciation initWithFlatbuffData:root:verify:]([FTPronunciation alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)tts_pronunciations_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const PronGuessResponse *root;
  const PronGuessResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tts_pronunciations"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x11u && (v8 = *(unsigned __int16 *)v7[16].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)tts_pronunciations_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTPronunciation *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const PronGuessResponse *root;
  const PronGuessResponse *v8;
  uint64_t v9;
  const PronGuessResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTPronunciation *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTPronunciation *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("tts_pronunciations"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x11u)
    {
      v9 = *(unsigned __int16 *)v8[16].var0;
      if (v9)
      {
        v20 = 0;
        v10 = &root[v9];
        v11 = *(unsigned int *)v10->var0;
        v13 = (uint64_t)&v10[v11 + 4];
        v12 = *(unsigned int *)v10[v11].var0;
        if ((_DWORD)v12)
        {
          v14 = 0;
          v15 = 0;
          v16 = 4 * v12 - 4;
          do
          {
            v17 = -[FTPronunciation initWithFlatbuffData:root:verify:]([FTPronunciation alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
            v4[2](v4, v17, v15, &v20);
            v18 = v20;

            if (v18)
              break;
            ++v15;
            v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }

}

- (NSArray)human_readable_prons
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("human_readable_prons"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__FTPronGuessResponse_human_readable_prons__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTPronGuessResponse human_readable_prons_enumerateObjectsUsingBlock:](self, "human_readable_prons_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("human_readable_prons"));

  }
  return (NSArray *)v3;
}

uint64_t __43__FTPronGuessResponse_human_readable_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)human_readable_prons_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const PronGuessResponse *root;
  const PronGuessResponse *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("human_readable_prons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x13u || (v11 = *(unsigned __int16 *)v10[18].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v13 = (unsigned int *)(v12 + 4 + *(unsigned int *)(v12 + 4));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13 + 1, *v13, 4);
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (unint64_t)human_readable_prons_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const PronGuessResponse *root;
  const PronGuessResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("human_readable_prons"));
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

- (void)human_readable_prons_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const PronGuessResponse *root;
  const PronGuessResponse *v8;
  uint64_t v9;
  const PronGuessResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *var0;
  void *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("human_readable_prons"));
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
        v10 = &root[v9 + *(unsigned int *)root[v9].var0];
        v11 = *(unsigned int *)v10->var0;
        if ((_DWORD)v11)
        {
          v12 = 4 - 4 * v11;
          v13 = 1;
          v14 = 8;
          do
          {
            var0 = (unsigned int *)v10[4 * v13].var0;
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[v14 + *var0], *(unsigned int *)((char *)var0 + *var0), 4);
            v4[2](v4, v16, v13 - 1, &v19);
            v17 = v19;

            if (v17)
              break;
            v18 = v12 + v14;
            ++v13;
            v14 += 4;
          }
          while (v18 != 8);
        }
      }
    }
  }

}

- (Offset<siri::speech::schema_fb::PronGuessResponse>)addObjectToBuffer:(void *)a3
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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int v27;
  int v28;
  std::vector<int>::pointer end;
  int *v30;
  std::vector<int>::pointer begin;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  char *v36;
  int *v37;
  int v38;
  std::vector<int>::pointer v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  const char *v45;
  size_t v46;
  int v47;
  int v48;
  std::vector<int>::pointer v49;
  int *v50;
  std::vector<int>::pointer v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  unint64_t v55;
  char *v56;
  int *v57;
  int v58;
  std::vector<int>::pointer v59;
  int v60;
  int v61;
  int v62;
  int v63;
  Offset<siri::speech::schema_fb::PronGuessResponse> v64;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int String;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  std::vector<int> v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  std::vector<int> v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  -[FTPronGuessResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTPronGuessResponse session_id](self, "session_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v71 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v70 = -[FTPronGuessResponse error_code](self, "error_code");
  -[FTPronGuessResponse error_str](self, "error_str");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v69 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  -[FTPronGuessResponse apg_id](self, "apg_id");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &stru_251A15610;
  v19 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v17), "UTF8String");
  v20 = strlen(v19);
  v68 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  -[FTPronGuessResponse voc_token](self, "voc_token");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  memset(&v82, 0, sizeof(v82));
  -[FTPronGuessResponse tts_pronunciations](self, "tts_pronunciations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v82, objc_msgSend(v22, "count"));

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[FTPronGuessResponse tts_pronunciations](self, "tts_pronunciations");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v79 != v25)
          objc_enumerationMutation(v23);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v28 = v27;
        end = v82.__end_;
        if (v82.__end_ >= v82.__end_cap_.__value_)
        {
          begin = v82.__begin_;
          v32 = v82.__end_ - v82.__begin_;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v34 = (char *)v82.__end_cap_.__value_ - (char *)v82.__begin_;
          if (((char *)v82.__end_cap_.__value_ - (char *)v82.__begin_) >> 1 > v33)
            v33 = v34 >> 1;
          if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL)
            v35 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v35 = v33;
          if (v35)
          {
            v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v82.__end_cap_, v35);
            begin = v82.__begin_;
            end = v82.__end_;
          }
          else
          {
            v36 = 0;
          }
          v37 = (int *)&v36[4 * v32];
          *v37 = v28;
          v30 = v37 + 1;
          while (end != begin)
          {
            v38 = *--end;
            *--v37 = v38;
          }
          v82.__begin_ = v37;
          v82.__end_ = v30;
          v82.__end_cap_.__value_ = (int *)&v36[4 * v35];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v82.__end_ = v27;
          v30 = end + 1;
        }
        v82.__end_ = v30;
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v24);
  }

  if (v82.__end_ == v82.__begin_)
    v39 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Pronunciation>> const&)::t;
  else
    v39 = v82.__begin_;
  v66 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v39, v82.__end_ - v82.__begin_);
  memset(&v77, 0, sizeof(v77));
  -[FTPronGuessResponse human_readable_prons](self, "human_readable_prons");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v77, objc_msgSend(v40, "count"));

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[FTPronGuessResponse human_readable_prons](self, "human_readable_prons");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v74 != v43)
          objc_enumerationMutation(v41);
        v45 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j)), "UTF8String");
        v46 = strlen(v45);
        v47 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v45, v46);
        v48 = v47;
        v49 = v77.__end_;
        if (v77.__end_ >= v77.__end_cap_.__value_)
        {
          v51 = v77.__begin_;
          v52 = v77.__end_ - v77.__begin_;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v54 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
          if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v53)
            v53 = v54 >> 1;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
            v55 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
          {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v77.__end_cap_, v55);
            v51 = v77.__begin_;
            v49 = v77.__end_;
          }
          else
          {
            v56 = 0;
          }
          v57 = (int *)&v56[4 * v52];
          *v57 = v48;
          v50 = v57 + 1;
          while (v49 != v51)
          {
            v58 = *--v49;
            *--v57 = v58;
          }
          v77.__begin_ = v57;
          v77.__end_ = v50;
          v77.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51)
            operator delete(v51);
        }
        else
        {
          *v77.__end_ = v47;
          v50 = v49 + 1;
        }
        v77.__end_ = v50;
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v42);
  }

  if (v77.__end_ == v77.__begin_)
    v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v59 = v77.__begin_;
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v77.__end_ - v77.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v61 = *((_DWORD *)a3 + 8);
  v62 = *((_DWORD *)a3 + 12);
  v63 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v71);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v70, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v69);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v68);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v66);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v60);
  v64.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v61 - (unsigned __int16)v62 + v63);
  if (v77.__begin_)
  {
    v77.__end_ = v77.__begin_;
    operator delete(v77.__begin_);
  }
  if (v82.__begin_)
  {
    v82.__end_ = v82.__begin_;
    operator delete(v82.__begin_);
  }
  return v64;
}

- (id)flatbuffData
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_249338840;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTPronGuessResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
  v2 = operator new();
  v3 = v12;
  v4 = v14;
  v5 = v15;
  v6 = (v14 + DWORD2(v14) - v15);
  *(_QWORD *)v2 = v11;
  *(_BYTE *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)&v4 + 1);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  if (v3)
  {
    v11 = 0;
    v12 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__FTPronGuessResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__35__FTPronGuessResponse_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2495AE51CLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
