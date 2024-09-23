@implementation FTTranslationResponse

id __89__FTTranslationResponse_TranslationPhrase_TranslationDaemonAdditions__lt_formattedString__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "add_space_after");

  if (v4)
    v5 = CFSTR(" ");
  else
    v5 = &stru_251A15610;
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3
{
  return -[FTTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4
{
  return -[FTTranslationResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTranslationResponse)initWithFlatbuffData:(id)a3 root:(const TranslationResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTranslationResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TranslationResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TranslationResponse *v19;
  FTTranslationResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTranslationResponse;
  v10 = -[FTTranslationResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TranslationResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TranslationResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TranslationResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)speech_id
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (int)return_code
{
  const TranslationResponse *root;
  const TranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_string
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (NSArray)n_best_translated_phrases
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__FTTranslationResponse_n_best_translated_phrases__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationResponse n_best_translated_phrases_enumerateObjectsUsingBlock:](self, "n_best_translated_phrases_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("n_best_translated_phrases"));

  }
  return (NSArray *)v3;
}

uint64_t __50__FTTranslationResponse_n_best_translated_phrases__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)n_best_translated_phrases_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationResponse_TranslationPhrase *v7;
  FTTranslationResponse_TranslationPhrase *v8;
  const TranslationResponse *root;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationResponse_TranslationPhrase *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xDu || (v11 = *(unsigned __int16 *)v10[12].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)n_best_translated_phrases_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationResponse *root;
  const TranslationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xDu && (v8 = *(unsigned __int16 *)v7[12].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)n_best_translated_phrases_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslationResponse *root;
  const TranslationResponse *v8;
  uint64_t v9;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationResponse_TranslationPhrase *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("n_best_translated_phrases"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xDu)
    {
      v9 = *(unsigned __int16 *)v8[12].var0;
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
            v17 = -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)engine_input
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
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

- (NSArray)engine_output
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("engine_output"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__FTTranslationResponse_engine_output__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationResponse engine_output_enumerateObjectsUsingBlock:](self, "engine_output_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("engine_output"));

  }
  return (NSArray *)v3;
}

uint64_t __38__FTTranslationResponse_engine_output__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)engine_output_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTranslationResponse_TranslationPhrase *v7;
  FTTranslationResponse_TranslationPhrase *v8;
  const TranslationResponse *root;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("engine_output"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTranslationResponse_TranslationPhrase *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)engine_output_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationResponse *root;
  const TranslationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("engine_output"));
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

- (void)engine_output_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslationResponse *root;
  const TranslationResponse *v8;
  uint64_t v9;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTranslationResponse_TranslationPhrase *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTranslationResponse_TranslationPhrase *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("engine_output"));
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
            v17 = -[FTTranslationResponse_TranslationPhrase initWithFlatbuffData:root:verify:]([FTTranslationResponse_TranslationPhrase alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)sequence_id
{
  const TranslationResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TranslationResponse *v6;

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

- (BOOL)final_message
{
  const TranslationResponse *root;
  const TranslationResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x15u && (v4 = *(unsigned __int16 *)v3[20].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSArray)alternative_descriptions
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__FTTranslationResponse_alternative_descriptions__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTranslationResponse alternative_descriptions_enumerateObjectsUsingBlock:](self, "alternative_descriptions_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("alternative_descriptions"));

  }
  return (NSArray *)v3;
}

uint64_t __49__FTTranslationResponse_alternative_descriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)alternative_descriptions_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTMTAlternativeDescription *v7;
  FTMTAlternativeDescription *v8;
  const TranslationResponse *root;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTMTAlternativeDescription *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x17u || (v11 = *(unsigned __int16 *)v10[22].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTMTAlternativeDescription initWithFlatbuffData:root:verify:]([FTMTAlternativeDescription alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)alternative_descriptions_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TranslationResponse *root;
  const TranslationResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0x17u && (v8 = *(unsigned __int16 *)v7[22].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)alternative_descriptions_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TranslationResponse *root;
  const TranslationResponse *v8;
  uint64_t v9;
  const TranslationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTMTAlternativeDescription *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTMTAlternativeDescription *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("alternative_descriptions"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0x17u)
    {
      v9 = *(unsigned __int16 *)v8[22].var0;
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
            v17 = -[FTMTAlternativeDescription initWithFlatbuffData:root:verify:]([FTMTAlternativeDescription alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::TranslationResponse>)addObjectToBuffer:(void *)a3
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
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int v22;
  int v23;
  std::vector<int>::pointer end;
  int *v25;
  std::vector<int>::pointer begin;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  char *v31;
  int *v32;
  int v33;
  std::vector<int>::pointer v34;
  __CFString *v35;
  __CFString *v36;
  const char *v37;
  size_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  int v44;
  int v45;
  std::vector<int>::pointer v46;
  int *v47;
  std::vector<int>::pointer v48;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  char *v53;
  int *v54;
  int v55;
  std::vector<int>::pointer v56;
  int v57;
  __CFString *v58;
  __CFString *v59;
  const char *v60;
  size_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  int v67;
  int v68;
  std::vector<int>::pointer v69;
  int *v70;
  std::vector<int>::pointer v71;
  int64_t v72;
  unint64_t v73;
  int64_t v74;
  unint64_t v75;
  char *v76;
  int *v77;
  int v78;
  std::vector<int>::pointer v79;
  int v80;
  int v81;
  int v82;
  int v83;
  Offset<siri::speech::schema_fb::TranslationResponse> v84;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int String;
  FTTranslationResponse *v94;
  int v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  std::vector<int> v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  std::vector<int> v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  std::vector<int> v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  -[FTTranslationResponse speech_id](self, "speech_id");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  -[FTTranslationResponse request_id](self, "request_id");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_251A15610;
  v11 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
  v12 = strlen(v11);
  v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  v91 = -[FTTranslationResponse return_code](self, "return_code");
  -[FTTranslationResponse return_string](self, "return_string");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &stru_251A15610;
  v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
  v16 = strlen(v15);
  v90 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  memset(&v110, 0, sizeof(v110));
  -[FTTranslationResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, objc_msgSend(v17, "count"));

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[FTTranslationResponse n_best_translated_phrases](self, "n_best_translated_phrases");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = self;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v107 != v20)
          objc_enumerationMutation(v18);
        v22 = objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v23 = v22;
        end = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          begin = v110.__begin_;
          v27 = v110.__end_ - v110.__begin_;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v29 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v28)
            v28 = v29 >> 1;
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
            v30 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v30 = v28;
          if (v30)
          {
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v30);
            begin = v110.__begin_;
            end = v110.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (int *)&v31[4 * v27];
          *v32 = v23;
          v25 = v32 + 1;
          while (end != begin)
          {
            v33 = *--end;
            *--v32 = v33;
          }
          v110.__begin_ = v32;
          v110.__end_ = v25;
          v110.__end_cap_.__value_ = (int *)&v31[4 * v30];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v110.__end_ = v22;
          v25 = end + 1;
        }
        v110.__end_ = v25;
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    }
    while (v19);
  }

  if (v110.__end_ == v110.__begin_)
    v34 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v34 = v110.__begin_;
  v89 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v34, v110.__end_ - v110.__begin_);
  -[FTTranslationResponse engine_input](v94, "engine_input");
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    v35 = &stru_251A15610;
  v37 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v35), "UTF8String");
  v38 = strlen(v37);
  v88 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v37, v38);

  memset(&v105, 0, sizeof(v105));
  -[FTTranslationResponse engine_output](v94, "engine_output");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, objc_msgSend(v39, "count"));

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[FTTranslationResponse engine_output](v94, "engine_output");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v102 != v42)
          objc_enumerationMutation(v40);
        v44 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v45 = v44;
        v46 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          v48 = v105.__begin_;
          v49 = v105.__end_ - v105.__begin_;
          v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v51 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v50)
            v50 = v51 >> 1;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
            v52 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v52 = v50;
          if (v52)
          {
            v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v52);
            v48 = v105.__begin_;
            v46 = v105.__end_;
          }
          else
          {
            v53 = 0;
          }
          v54 = (int *)&v53[4 * v49];
          *v54 = v45;
          v47 = v54 + 1;
          while (v46 != v48)
          {
            v55 = *--v46;
            *--v54 = v55;
          }
          v105.__begin_ = v54;
          v105.__end_ = v47;
          v105.__end_cap_.__value_ = (int *)&v53[4 * v52];
          if (v48)
            operator delete(v48);
        }
        else
        {
          *v105.__end_ = v44;
          v47 = v46 + 1;
        }
        v105.__end_ = v47;
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v41);
  }

  if (v105.__end_ == v105.__begin_)
    v56 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TranslationResponse_::TranslationPhrase>> const&)::t;
  else
    v56 = v105.__begin_;
  v57 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v56, v105.__end_ - v105.__begin_);
  -[FTTranslationResponse sequence_id](v94, "sequence_id");
  v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58)
    v58 = &stru_251A15610;
  v60 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v58), "UTF8String");
  v61 = strlen(v60);
  v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v60, v61);

  v86 = -[FTTranslationResponse final_message](v94, "final_message");
  memset(&v100, 0, sizeof(v100));
  -[FTTranslationResponse alternative_descriptions](v94, "alternative_descriptions");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, objc_msgSend(v62, "count"));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[FTTranslationResponse alternative_descriptions](v94, "alternative_descriptions");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v57;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v97 != v65)
          objc_enumerationMutation(v63);
        v67 = objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v68 = v67;
        v69 = v100.__end_;
        if (v100.__end_ >= v100.__end_cap_.__value_)
        {
          v71 = v100.__begin_;
          v72 = v100.__end_ - v100.__begin_;
          v73 = v72 + 1;
          if ((unint64_t)(v72 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v74 = (char *)v100.__end_cap_.__value_ - (char *)v100.__begin_;
          if (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 1 > v73)
            v73 = v74 >> 1;
          if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL)
            v75 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v75 = v73;
          if (v75)
          {
            v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v100.__end_cap_, v75);
            v71 = v100.__begin_;
            v69 = v100.__end_;
          }
          else
          {
            v76 = 0;
          }
          v77 = (int *)&v76[4 * v72];
          *v77 = v68;
          v70 = v77 + 1;
          while (v69 != v71)
          {
            v78 = *--v69;
            *--v77 = v78;
          }
          v100.__begin_ = v77;
          v100.__end_ = v70;
          v100.__end_cap_.__value_ = (int *)&v76[4 * v75];
          if (v71)
            operator delete(v71);
        }
        else
        {
          *v100.__end_ = v67;
          v70 = v69 + 1;
        }
        v100.__end_ = v70;
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
    }
    while (v64);
  }

  if (v100.__end_ == v100.__begin_)
    v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::MTAlternativeDescription>> const&)::t;
  else
    v79 = v100.__begin_;
  v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v79, v100.__end_ - v100.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v81 = *((_DWORD *)a3 + 8);
  v82 = *((_DWORD *)a3 + 12);
  v83 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 8, v91, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v90);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v95);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 20, v86, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 22, v80);
  v84.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v81 - (unsigned __int16)v82 + v83);
  if (v100.__begin_)
  {
    v100.__end_ = v100.__begin_;
    operator delete(v100.__begin_);
  }
  if (v105.__begin_)
  {
    v105.__end_ = v105.__begin_;
    operator delete(v105.__begin_);
  }
  if (v110.__begin_)
  {
    v110.__end_ = v110.__begin_;
    operator delete(v110.__begin_);
  }
  return v84;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTranslationResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __37__FTTranslationResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTTranslationResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__54__FTTranslationResponse_TranslationToken_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __60__FTTranslationResponse_TranslationPhrase_translated_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __48__FTTranslationResponse_TranslationPhrase_spans__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

apple::aiml::flatbuffers2::DetachedBuffer *__55__FTTranslationResponse_TranslationPhrase_flatbuffData__block_invoke(uint64_t a1)
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

@end
