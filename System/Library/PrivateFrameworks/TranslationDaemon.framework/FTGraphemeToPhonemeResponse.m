@implementation FTGraphemeToPhonemeResponse

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3
{
  return -[FTGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4
{
  return -[FTGraphemeToPhonemeResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTGraphemeToPhonemeResponse)initWithFlatbuffData:(id)a3 root:(const GraphemeToPhonemeResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTGraphemeToPhonemeResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const GraphemeToPhonemeResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::GraphemeToPhonemeResponse *v19;
  FTGraphemeToPhonemeResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTGraphemeToPhonemeResponse;
  v10 = -[FTGraphemeToPhonemeResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const GraphemeToPhonemeResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::GraphemeToPhonemeResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::GraphemeToPhonemeResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)session_id
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (int)return_code
{
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return *(_DWORD *)root[v4].var0;
  else
    return 0;
}

- (NSString)return_str
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSArray)phonemes
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__FTGraphemeToPhonemeResponse_phonemes__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTGraphemeToPhonemeResponse phonemes_enumerateObjectsUsingBlock:](self, "phonemes_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phonemes"));

  }
  return (NSArray *)v3;
}

uint64_t __39__FTGraphemeToPhonemeResponse_phonemes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)phonemes_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
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
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
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

- (unint64_t)phonemes_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
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
    if (*(unsigned __int16 *)v7->var0 >= 0xBu && (v8 = *(unsigned __int16 *)v7[10].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)phonemes_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phonemes"));
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
    if (*(unsigned __int16 *)v8->var0 >= 0xBu)
    {
      v9 = *(unsigned __int16 *)v8[10].var0;
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

- (BOOL)is_pron_guessed
{
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xDu && (v4 = *(unsigned __int16 *)v3[12].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)g2p_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSString)g2p_model_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (NSString)phoneset_version
{
  const GraphemeToPhonemeResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const GraphemeToPhonemeResponse *v6;

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

- (NSArray)aot_token_prons
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("aot_token_prons"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__FTGraphemeToPhonemeResponse_aot_token_prons__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTGraphemeToPhonemeResponse aot_token_prons_enumerateObjectsUsingBlock:](self, "aot_token_prons_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("aot_token_prons"));

  }
  return (NSArray *)v3;
}

uint64_t __46__FTGraphemeToPhonemeResponse_aot_token_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)aot_token_prons_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTokenProns *v7;
  FTTokenProns *v8;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("aot_token_prons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTokenProns *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0x15u || (v11 = *(unsigned __int16 *)v10[20].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTokenProns initWithFlatbuffData:root:verify:]([FTTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)aot_token_prons_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("aot_token_prons"));
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

- (void)aot_token_prons_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTokenProns *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTokenProns *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTokenProns *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("aot_token_prons"));
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
            v17 = -[FTTokenProns initWithFlatbuffData:root:verify:]([FTTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)jit_token_prons
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("jit_token_prons"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__FTGraphemeToPhonemeResponse_jit_token_prons__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTGraphemeToPhonemeResponse jit_token_prons_enumerateObjectsUsingBlock:](self, "jit_token_prons_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("jit_token_prons"));

  }
  return (NSArray *)v3;
}

uint64_t __46__FTGraphemeToPhonemeResponse_jit_token_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)jit_token_prons_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTokenProns *v7;
  FTTokenProns *v8;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("jit_token_prons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTokenProns *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTokenProns initWithFlatbuffData:root:verify:]([FTTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)jit_token_prons_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("jit_token_prons"));
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

- (void)jit_token_prons_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTokenProns *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const GraphemeToPhonemeResponse *root;
  const GraphemeToPhonemeResponse *v8;
  uint64_t v9;
  const GraphemeToPhonemeResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTokenProns *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTokenProns *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("jit_token_prons"));
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
            v17 = -[FTTokenProns initWithFlatbuffData:root:verify:]([FTTokenProns alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse>)addObjectToBuffer:(void *)a3
{
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  __CFString *v8;
  __CFString *v9;
  const char *v10;
  size_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const char *v17;
  size_t v18;
  int v19;
  int v20;
  std::vector<int>::pointer end;
  int *v22;
  std::vector<int>::pointer begin;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  char *v28;
  int *v29;
  int v30;
  std::vector<int>::pointer v31;
  __CFString *v32;
  __CFString *v33;
  const char *v34;
  size_t v35;
  __CFString *v36;
  __CFString *v37;
  const char *v38;
  size_t v39;
  __CFString *v40;
  __CFString *v41;
  const char *v42;
  size_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  int v49;
  int v50;
  std::vector<int>::pointer v51;
  int *v52;
  std::vector<int>::pointer v53;
  int64_t v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  char *v58;
  int *v59;
  int v60;
  std::vector<int>::pointer v61;
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
  Offset<siri::speech::schema_fb::GraphemeToPhonemeResponse> v84;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int String;
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
  -[FTGraphemeToPhonemeResponse session_id](self, "session_id");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_251A15610;
  v6 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String");
  v7 = strlen(v6);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v6, v7);

  v93 = -[FTGraphemeToPhonemeResponse return_code](self, "return_code");
  -[FTGraphemeToPhonemeResponse return_str](self, "return_str");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = &stru_251A15610;
  v10 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
  v11 = strlen(v10);
  v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v10, v11);

  memset(&v110, 0, sizeof(v110));
  -[FTGraphemeToPhonemeResponse phonemes](self, "phonemes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, objc_msgSend(v12, "count"));

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[FTGraphemeToPhonemeResponse phonemes](self, "phonemes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v107 != v15)
          objc_enumerationMutation(v13);
        v17 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i)), "UTF8String");
        v18 = strlen(v17);
        v19 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v17, v18);
        v20 = v19;
        end = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          begin = v110.__begin_;
          v24 = v110.__end_ - v110.__begin_;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v26 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v25)
            v25 = v26 >> 1;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
            v27 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v27);
            begin = v110.__begin_;
            end = v110.__end_;
          }
          else
          {
            v28 = 0;
          }
          v29 = (int *)&v28[4 * v24];
          *v29 = v20;
          v22 = v29 + 1;
          while (end != begin)
          {
            v30 = *--end;
            *--v29 = v30;
          }
          v110.__begin_ = v29;
          v110.__end_ = v22;
          v110.__end_cap_.__value_ = (int *)&v28[4 * v27];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v110.__end_ = v19;
          v22 = end + 1;
        }
        v110.__end_ = v22;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    }
    while (v14);
  }

  if (v110.__end_ == v110.__begin_)
    v31 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v31 = v110.__begin_;
  v91 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v31, v110.__end_ - v110.__begin_);
  v90 = -[FTGraphemeToPhonemeResponse is_pron_guessed](self, "is_pron_guessed");
  -[FTGraphemeToPhonemeResponse g2p_version](self, "g2p_version");
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &stru_251A15610;
  v34 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v32), "UTF8String");
  v35 = strlen(v34);
  v89 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v34, v35);

  -[FTGraphemeToPhonemeResponse g2p_model_version](self, "g2p_model_version");
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
    v36 = &stru_251A15610;
  v38 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v36), "UTF8String");
  v39 = strlen(v38);
  v88 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v38, v39);

  -[FTGraphemeToPhonemeResponse phoneset_version](self, "phoneset_version");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
    v40 = &stru_251A15610;
  v42 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v40), "UTF8String");
  v43 = strlen(v42);
  v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v42, v43);

  memset(&v105, 0, sizeof(v105));
  -[FTGraphemeToPhonemeResponse aot_token_prons](self, "aot_token_prons");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, objc_msgSend(v44, "count"));

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[FTGraphemeToPhonemeResponse aot_token_prons](self, "aot_token_prons");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v102 != v47)
          objc_enumerationMutation(v45);
        v49 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v50 = v49;
        v51 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          v53 = v105.__begin_;
          v54 = v105.__end_ - v105.__begin_;
          v55 = v54 + 1;
          if ((unint64_t)(v54 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v56 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v55)
            v55 = v56 >> 1;
          if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
            v57 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v57 = v55;
          if (v57)
          {
            v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v57);
            v53 = v105.__begin_;
            v51 = v105.__end_;
          }
          else
          {
            v58 = 0;
          }
          v59 = (int *)&v58[4 * v54];
          *v59 = v50;
          v52 = v59 + 1;
          while (v51 != v53)
          {
            v60 = *--v51;
            *--v59 = v60;
          }
          v105.__begin_ = v59;
          v105.__end_ = v52;
          v105.__end_cap_.__value_ = (int *)&v58[4 * v57];
          if (v53)
            operator delete(v53);
        }
        else
        {
          *v105.__end_ = v49;
          v52 = v51 + 1;
        }
        v105.__end_ = v52;
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v46);
  }

  if (v105.__end_ == v105.__begin_)
    v61 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  else
    v61 = v105.__begin_;
  v86 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v61, v105.__end_ - v105.__begin_);
  memset(&v100, 0, sizeof(v100));
  -[FTGraphemeToPhonemeResponse jit_token_prons](self, "jit_token_prons");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, objc_msgSend(v62, "count"));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[FTGraphemeToPhonemeResponse jit_token_prons](self, "jit_token_prons");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
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
    v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns>> const&)::t;
  else
    v79 = v100.__begin_;
  v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v79, v100.__end_ - v100.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v81 = *((_DWORD *)a3 + 8);
  v82 = *((_DWORD *)a3 + 12);
  v83 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((char *)a3, 6, v93, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 12, v90, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 16, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 18, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 20, v86);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTGraphemeToPhonemeResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __43__FTGraphemeToPhonemeResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__43__FTGraphemeToPhonemeResponse_flatbuffData__block_invoke(uint64_t a1)
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
