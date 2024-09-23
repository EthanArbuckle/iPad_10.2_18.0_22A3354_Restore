@implementation FTTranslationRequest

- (FTTranslationRequest)initWithFlatbuffData:(id)a3
{
  return -[FTTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4
{
  return -[FTTranslationRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTranslationRequest)initWithFlatbuffData:(id)a3 root:(const TranslationRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTranslationRequest *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TranslationRequest *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TranslationRequest *v19;
  FTTranslationRequest *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationRequest;
  v10 = -[FTTranslationRequest init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TranslationRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationRequest *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TranslationRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)request_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)task
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)source_language
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSString)target_language
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

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

- (NSArray)translation_phrase
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__FTTranslationRequest_translation_phrase__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationRequest translation_phrase_enumerateObjectsUsingBlock:](self, "translation_phrase_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_phrase"));

  }
  return (NSArray *)v3;
}

uint64_t __42__FTTranslationRequest_translation_phrase__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)translation_phrase_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const TranslationRequest *root;
  const TranslationRequest *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
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
    if (*(unsigned __int16 *)v10->var0 < 0xFu || (v11 = *(unsigned __int16 *)v10[14].var0) == 0)
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

- (unint64_t)translation_phrase_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationRequest *root;
  const TranslationRequest *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xFu && (v8 = *(unsigned __int16 *)v7[14].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)translation_phrase_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const TranslationRequest *root;
  const TranslationRequest *v8;
  uint64_t v9;
  const TranslationRequest *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xFu)
    {
      v9 = *(unsigned __int16 *)v8[14].var0;
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

- (FTSiriTranslationInfo)siri_translation_info
{
  FTSiriTranslationInfo *v3;
  FTSiriTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("siri_translation_info"));
  v3 = (FTSiriTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTSiriTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x11u && (v7 = *(unsigned __int16 *)v6[16].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTSiriTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("siri_translation_info"));
  }
  return v3;
}

- (FTSpeechTranslationInfo)speech_translation_info
{
  FTSpeechTranslationInfo *v3;
  FTSpeechTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("speech_translation_info"));
  v3 = (FTSpeechTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTSpeechTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x13u && (v7 = *(unsigned __int16 *)v6[18].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTSpeechTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("speech_translation_info"));
  }
  return v3;
}

- (FTSiriPayloadTranslationInfo)siri_payload_translation_info
{
  FTSiriPayloadTranslationInfo *v3;
  FTSiriPayloadTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("siri_payload_translation_info"));
  v3 = (FTSiriPayloadTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTSiriPayloadTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (v7 = *(unsigned __int16 *)v6[20].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTSiriPayloadTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("siri_payload_translation_info"));
  }
  return v3;
}

- (NSString)sequence_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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

- (FTWebTranslationInfo)web_translation_info
{
  FTWebTranslationInfo *v3;
  FTWebTranslationInfo *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("web_translation_info"));
  v3 = (FTWebTranslationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTWebTranslationInfo alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x19u && (v7 = *(unsigned __int16 *)v6[24].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTWebTranslationInfo initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("web_translation_info"));
  }
  return v3;
}

- (BOOL)disable_log
{
  const TranslationRequest *root;
  const TranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Bu && (v4 = *(unsigned __int16 *)v3[26].var0) != 0 && root[v4].var0[0] != 0;
}

- (int64_t)opt_in_status
{
  const TranslationRequest *root;
  const TranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Du && (v4 = *(unsigned __int16 *)v3[28].var0) != 0)
    return *(int *)root[v4].var0;
  else
    return 0;
}

- (NSString)app_id
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 30].var0;
  if (*(_WORD *)root[-v3 + 30].var0)
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

- (NSString)use_case
{
  const TranslationRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 32].var0;
  if (*(_WORD *)root[-v3 + 32].var0)
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

- (FTTranslationOptions)options
{
  FTTranslationOptions *v3;
  FTTranslationOptions *v4;
  const TranslationRequest *root;
  const TranslationRequest *v6;
  uint64_t v7;
  const TranslationRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("options"));
  v3 = (FTTranslationOptions *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTTranslationOptions alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x23u && (v7 = *(unsigned __int16 *)v6[34].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTTranslationOptions initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("options"));
  }
  return v3;
}

- (BOOL)is_partial
{
  const TranslationRequest *root;
  const TranslationRequest *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x25u && (v4 = *(unsigned __int16 *)v3[36].var0) != 0 && root[v4].var0[0] != 0;
}

- (Offset<siri::speech::schema_fb::TranslationRequest>)addObjectToBuffer:(void *)a3
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
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  const char *v29;
  size_t v30;
  int v31;
  int v32;
  std::vector<int>::pointer end;
  int *v34;
  std::vector<int>::pointer begin;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  int *v41;
  int v42;
  std::vector<int>::pointer v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  const char *v49;
  size_t v50;
  int v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  __CFString *v56;
  __CFString *v57;
  const char *v58;
  size_t v59;
  int v60;
  __CFString *v61;
  __CFString *v62;
  const char *v63;
  size_t v64;
  int v65;
  void *v66;
  int v67;
  int v68;
  Offset<siri::speech::schema_fb::TranslationRequest> v69;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int String;
  int v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  std::vector<int> v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  -[FTTranslationRequest speech_id](self, "speech_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_251A15610;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  -[FTTranslationRequest request_id](self, "request_id");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_251A15610;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v79 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  -[FTTranslationRequest task](self, "task");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_251A15610;
  v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String");
  v15 = strlen(v14);
  v78 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v14, v15);

  -[FTTranslationRequest source_language](self, "source_language");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = &stru_251A15610;
  v18 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  v77 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v18, v19);

  -[FTTranslationRequest target_language](self, "target_language");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    v20 = &stru_251A15610;
  v22 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v20), "UTF8String");
  v23 = strlen(v22);
  v76 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22, v23);

  memset(&v87, 0, sizeof(v87));
  -[FTTranslationRequest translation_phrase](self, "translation_phrase");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v87, objc_msgSend(v24, "count"));

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  -[FTTranslationRequest translation_phrase](self, "translation_phrase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v84 != v27)
          objc_enumerationMutation(v25);
        v29 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i)), "UTF8String");
        v30 = strlen(v29);
        v31 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v29, v30);
        v32 = v31;
        end = v87.__end_;
        if (v87.__end_ >= v87.__end_cap_.__value_)
        {
          begin = v87.__begin_;
          v36 = v87.__end_ - v87.__begin_;
          v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v38 = (char *)v87.__end_cap_.__value_ - (char *)v87.__begin_;
          if (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 1 > v37)
            v37 = v38 >> 1;
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL)
            v39 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v39 = v37;
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v87.__end_cap_, v39);
            begin = v87.__begin_;
            end = v87.__end_;
          }
          else
          {
            v40 = 0;
          }
          v41 = (int *)&v40[4 * v36];
          *v41 = v32;
          v34 = v41 + 1;
          while (end != begin)
          {
            v42 = *--end;
            *--v41 = v42;
          }
          v87.__begin_ = v41;
          v87.__end_ = v34;
          v87.__end_cap_.__value_ = (int *)&v40[4 * v39];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v87.__end_ = v31;
          v34 = end + 1;
        }
        v87.__end_ = v34;
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v88, 16);
    }
    while (v26);
  }

  if (v87.__end_ == v87.__begin_)
    v43 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v43 = v87.__begin_;
  v75 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v43, v87.__end_ - v87.__begin_);
  -[FTTranslationRequest siri_translation_info](self, "siri_translation_info");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v44, "addObjectToBuffer:", a3);

  -[FTTranslationRequest speech_translation_info](self, "speech_translation_info");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v45, "addObjectToBuffer:", a3);

  -[FTTranslationRequest siri_payload_translation_info](self, "siri_payload_translation_info");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v46, "addObjectToBuffer:", a3);

  -[FTTranslationRequest sequence_id](self, "sequence_id");
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (!v47)
    v47 = &stru_251A15610;
  v49 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v47), "UTF8String");
  v50 = strlen(v49);
  v51 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v49, v50);

  -[FTTranslationRequest web_translation_info](self, "web_translation_info");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "addObjectToBuffer:", a3);

  v54 = -[FTTranslationRequest disable_log](self, "disable_log");
  v55 = -[FTTranslationRequest opt_in_status](self, "opt_in_status");
  -[FTTranslationRequest app_id](self, "app_id");
  v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (!v56)
    v56 = &stru_251A15610;
  v58 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v56), "UTF8String");
  v59 = strlen(v58);
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v58, v59);

  -[FTTranslationRequest use_case](self, "use_case");
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (!v61)
    v61 = &stru_251A15610;
  v63 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v61), "UTF8String");
  v64 = strlen(v63);
  v65 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  -[FTTranslationRequest options](self, "options");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "addObjectToBuffer:", a3);

  LODWORD(v66) = -[FTTranslationRequest is_partial](self, "is_partial");
  *((_BYTE *)a3 + 70) = 1;
  v82 = *((_DWORD *)a3 + 8);
  v68 = *((_DWORD *)a3 + 12);
  v71 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v79);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v78);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v77);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v76);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v75);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v74);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v72);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, v51);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 24, v53);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 26, v54, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 28, v55, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 30, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 32, v65);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 34, v67);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 36, (int)v66, 0);
  v69.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v82 - (unsigned __int16)v68 + v71);
  if (v87.__begin_)
  {
    v87.__end_ = v87.__begin_;
    operator delete(v87.__begin_);
  }
  return v69;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTranslationRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __36__FTTranslationRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTTranslationRequest_flatbuffData__block_invoke(uint64_t a1)
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
