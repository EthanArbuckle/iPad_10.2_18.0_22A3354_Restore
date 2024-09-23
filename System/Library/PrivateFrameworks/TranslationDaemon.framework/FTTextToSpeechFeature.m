@implementation FTTextToSpeechFeature

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return -[FTTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTextToSpeechFeature *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechFeature *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TextToSpeechFeature *v19;
  FTTextToSpeechFeature *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTextToSpeechFeature;
  v10 = -[FTTextToSpeechFeature init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechFeature *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechFeature *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TextToSpeechFeature::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)normalized_text
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__FTTextToSpeechFeature_normalized_text__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechFeature normalized_text_enumerateObjectsUsingBlock:](self, "normalized_text_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("normalized_text"));

  }
  return (NSArray *)v3;
}

uint64_t __40__FTTextToSpeechFeature_normalized_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)normalized_text_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSNormalizedText *v7;
  FTTTSNormalizedText *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSNormalizedText *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTTSNormalizedText initWithFlatbuffData:root:verify:]([FTTTSNormalizedText alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)normalized_text_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
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
    if (*(unsigned __int16 *)v7->var0 >= 5u && (v8 = *(unsigned __int16 *)v7[4].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)normalized_text_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTTSNormalizedText *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSNormalizedText *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSNormalizedText *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
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
    if (*(unsigned __int16 *)v8->var0 >= 5u)
    {
      v9 = *(unsigned __int16 *)v8[4].var0;
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
            v17 = -[FTTTSNormalizedText initWithFlatbuffData:root:verify:]([FTTTSNormalizedText alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)phoneme_sequence
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__FTTextToSpeechFeature_phoneme_sequence__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechFeature phoneme_sequence_enumerateObjectsUsingBlock:](self, "phoneme_sequence_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phoneme_sequence"));

  }
  return (NSArray *)v3;
}

uint64_t __41__FTTextToSpeechFeature_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSPhonemeSequence *v7;
  FTTTSPhonemeSequence *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSPhonemeSequence *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTTSPhonemeSequence initWithFlatbuffData:root:verify:]([FTTTSPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)phoneme_sequence_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
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
    if (*(unsigned __int16 *)v7->var0 >= 7u && (v8 = *(unsigned __int16 *)v7[6].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTTSPhonemeSequence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSPhonemeSequence *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
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
    if (*(unsigned __int16 *)v8->var0 >= 7u)
    {
      v9 = *(unsigned __int16 *)v8[6].var0;
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
            v17 = -[FTTTSPhonemeSequence initWithFlatbuffData:root:verify:]([FTTTSPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)prompts
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__FTTextToSpeechFeature_prompts__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechFeature prompts_enumerateObjectsUsingBlock:](self, "prompts_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prompts"));

  }
  return (NSArray *)v3;
}

uint64_t __32__FTTextToSpeechFeature_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSPrompts *v7;
  FTTTSPrompts *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSPrompts *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
    v7 = -[FTTTSPrompts initWithFlatbuffData:root:verify:]([FTTTSPrompts alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)prompts_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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
    if (*(unsigned __int16 *)v7->var0 >= 9u && (v8 = *(unsigned __int16 *)v7[8].var0) != 0)
      v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    else
      v5 = 0;
  }

  return v5;
}

- (void)prompts_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTTSPrompts *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSPrompts *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSPrompts *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
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
    if (*(unsigned __int16 *)v8->var0 >= 9u)
    {
      v9 = *(unsigned __int16 *)v8[8].var0;
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
            v17 = -[FTTTSPrompts initWithFlatbuffData:root:verify:]([FTTTSPrompts alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)replacement
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__FTTextToSpeechFeature_replacement__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechFeature replacement_enumerateObjectsUsingBlock:](self, "replacement_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("replacement"));

  }
  return (NSArray *)v3;
}

uint64_t __36__FTTextToSpeechFeature_replacement__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)replacement_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSReplacement *v7;
  FTTTSReplacement *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSReplacement *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTTSReplacement initWithFlatbuffData:root:verify:]([FTTTSReplacement alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)replacement_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
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

- (void)replacement_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTTSReplacement *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSReplacement *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSReplacement *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
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
            v17 = -[FTTTSReplacement initWithFlatbuffData:root:verify:]([FTTTSReplacement alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)neural_phoneme_sequence
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __48__FTTextToSpeechFeature_neural_phoneme_sequence__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTextToSpeechFeature neural_phoneme_sequence_enumerateObjectsUsingBlock:](self, "neural_phoneme_sequence_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("neural_phoneme_sequence"));

  }
  return (NSArray *)v3;
}

uint64_t __48__FTTextToSpeechFeature_neural_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTTSNeuralPhonemeSequence *v7;
  FTTTSNeuralPhonemeSequence *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTTSNeuralPhonemeSequence *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTTSNeuralPhonemeSequence initWithFlatbuffData:root:verify:]([FTTTSNeuralPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)neural_phoneme_sequence_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
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

- (void)neural_phoneme_sequence_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTTSNeuralPhonemeSequence *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
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
            v17 = -[FTTTSNeuralPhonemeSequence initWithFlatbuffData:root:verify:]([FTTTSNeuralPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  std::vector<int>::pointer end;
  int *v13;
  std::vector<int>::pointer begin;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  char *v19;
  int *v20;
  int v21;
  std::vector<int>::pointer v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  int v28;
  int v29;
  std::vector<int>::pointer v30;
  int *v31;
  std::vector<int>::pointer v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  char *v37;
  int *v38;
  int v39;
  std::vector<int>::pointer v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  int v46;
  int v47;
  std::vector<int>::pointer v48;
  int *v49;
  std::vector<int>::pointer v50;
  int64_t v51;
  unint64_t v52;
  int64_t v53;
  unint64_t v54;
  char *v55;
  int *v56;
  int v57;
  std::vector<int>::pointer v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  int v64;
  int v65;
  std::vector<int>::pointer v66;
  int *v67;
  std::vector<int>::pointer v68;
  int64_t v69;
  unint64_t v70;
  int64_t v71;
  unint64_t v72;
  char *v73;
  int *v74;
  int v75;
  std::vector<int>::pointer v76;
  int v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  int v83;
  int v84;
  std::vector<int>::pointer v85;
  int *v86;
  std::vector<int>::pointer v87;
  int64_t v88;
  unint64_t v89;
  int64_t v90;
  unint64_t v91;
  char *v92;
  int *v93;
  int v94;
  std::vector<int>::pointer v95;
  int v96;
  int v97;
  int v98;
  int v99;
  Offset<siri::speech::schema_fb::TextToSpeechFeature> v100;
  int v102;
  int v103;
  int v104;
  FTTextToSpeechFeature *v105;
  int v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  std::vector<int> v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  std::vector<int> v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  std::vector<int> v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  std::vector<int> v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  std::vector<int> v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  memset(&v131, 0, sizeof(v131));
  -[FTTextToSpeechFeature normalized_text](self, "normalized_text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v131, objc_msgSend(v5, "count"));

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  -[FTTextToSpeechFeature normalized_text](self, "normalized_text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = self;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v128 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v11 = v10;
        end = v131.__end_;
        if (v131.__end_ >= v131.__end_cap_.__value_)
        {
          begin = v131.__begin_;
          v15 = v131.__end_ - v131.__begin_;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v131.__end_cap_.__value_ - (char *)v131.__begin_;
          if (((char *)v131.__end_cap_.__value_ - (char *)v131.__begin_) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v131.__end_cap_, v18);
            begin = v131.__begin_;
            end = v131.__end_;
          }
          else
          {
            v19 = 0;
          }
          v20 = (int *)&v19[4 * v15];
          *v20 = v11;
          v13 = v20 + 1;
          while (end != begin)
          {
            v21 = *--end;
            *--v20 = v21;
          }
          v131.__begin_ = v20;
          v131.__end_ = v13;
          v131.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v131.__end_ = v10;
          v13 = end + 1;
        }
        v131.__end_ = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
    }
    while (v7);
  }

  if (v131.__end_ == v131.__begin_)
    v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  else
    v22 = v131.__begin_;
  v104 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v131.__end_ - v131.__begin_);
  memset(&v126, 0, sizeof(v126));
  -[FTTextToSpeechFeature phoneme_sequence](v105, "phoneme_sequence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v126, objc_msgSend(v23, "count"));

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[FTTextToSpeechFeature phoneme_sequence](v105, "phoneme_sequence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v123;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v123 != v26)
          objc_enumerationMutation(v24);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v29 = v28;
        v30 = v126.__end_;
        if (v126.__end_ >= v126.__end_cap_.__value_)
        {
          v32 = v126.__begin_;
          v33 = v126.__end_ - v126.__begin_;
          v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v35 = (char *)v126.__end_cap_.__value_ - (char *)v126.__begin_;
          if (((char *)v126.__end_cap_.__value_ - (char *)v126.__begin_) >> 1 > v34)
            v34 = v35 >> 1;
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL)
            v36 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v36 = v34;
          if (v36)
          {
            v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v126.__end_cap_, v36);
            v32 = v126.__begin_;
            v30 = v126.__end_;
          }
          else
          {
            v37 = 0;
          }
          v38 = (int *)&v37[4 * v33];
          *v38 = v29;
          v31 = v38 + 1;
          while (v30 != v32)
          {
            v39 = *--v30;
            *--v38 = v39;
          }
          v126.__begin_ = v38;
          v126.__end_ = v31;
          v126.__end_cap_.__value_ = (int *)&v37[4 * v36];
          if (v32)
            operator delete(v32);
        }
        else
        {
          *v126.__end_ = v28;
          v31 = v30 + 1;
        }
        v126.__end_ = v31;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v135, 16);
    }
    while (v25);
  }

  if (v126.__end_ == v126.__begin_)
    v40 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  else
    v40 = v126.__begin_;
  v103 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v40, v126.__end_ - v126.__begin_);
  memset(&v121, 0, sizeof(v121));
  -[FTTextToSpeechFeature prompts](v105, "prompts");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v121, objc_msgSend(v41, "count"));

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[FTTextToSpeechFeature prompts](v105, "prompts");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v118;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v118 != v44)
          objc_enumerationMutation(v42);
        v46 = objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v47 = v46;
        v48 = v121.__end_;
        if (v121.__end_ >= v121.__end_cap_.__value_)
        {
          v50 = v121.__begin_;
          v51 = v121.__end_ - v121.__begin_;
          v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v53 = (char *)v121.__end_cap_.__value_ - (char *)v121.__begin_;
          if (((char *)v121.__end_cap_.__value_ - (char *)v121.__begin_) >> 1 > v52)
            v52 = v53 >> 1;
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL)
            v54 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v54 = v52;
          if (v54)
          {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v121.__end_cap_, v54);
            v50 = v121.__begin_;
            v48 = v121.__end_;
          }
          else
          {
            v55 = 0;
          }
          v56 = (int *)&v55[4 * v51];
          *v56 = v47;
          v49 = v56 + 1;
          while (v48 != v50)
          {
            v57 = *--v48;
            *--v56 = v57;
          }
          v121.__begin_ = v56;
          v121.__end_ = v49;
          v121.__end_cap_.__value_ = (int *)&v55[4 * v54];
          if (v50)
            operator delete(v50);
        }
        else
        {
          *v121.__end_ = v46;
          v49 = v48 + 1;
        }
        v121.__end_ = v49;
      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
    }
    while (v43);
  }

  if (v121.__end_ == v121.__begin_)
    v58 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  else
    v58 = v121.__begin_;
  v102 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v58, v121.__end_ - v121.__begin_);
  memset(&v116, 0, sizeof(v116));
  -[FTTextToSpeechFeature replacement](v105, "replacement");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v116, objc_msgSend(v59, "count"));

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  -[FTTextToSpeechFeature replacement](v105, "replacement");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v113;
    do
    {
      for (m = 0; m != v61; ++m)
      {
        if (*(_QWORD *)v113 != v62)
          objc_enumerationMutation(v60);
        v64 = objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * m), "addObjectToBuffer:", a3);
        v65 = v64;
        v66 = v116.__end_;
        if (v116.__end_ >= v116.__end_cap_.__value_)
        {
          v68 = v116.__begin_;
          v69 = v116.__end_ - v116.__begin_;
          v70 = v69 + 1;
          if ((unint64_t)(v69 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v71 = (char *)v116.__end_cap_.__value_ - (char *)v116.__begin_;
          if (((char *)v116.__end_cap_.__value_ - (char *)v116.__begin_) >> 1 > v70)
            v70 = v71 >> 1;
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL)
            v72 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v72 = v70;
          if (v72)
          {
            v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v116.__end_cap_, v72);
            v68 = v116.__begin_;
            v66 = v116.__end_;
          }
          else
          {
            v73 = 0;
          }
          v74 = (int *)&v73[4 * v69];
          *v74 = v65;
          v67 = v74 + 1;
          while (v66 != v68)
          {
            v75 = *--v66;
            *--v74 = v75;
          }
          v116.__begin_ = v74;
          v116.__end_ = v67;
          v116.__end_cap_.__value_ = (int *)&v73[4 * v72];
          if (v68)
            operator delete(v68);
        }
        else
        {
          *v116.__end_ = v64;
          v67 = v66 + 1;
        }
        v116.__end_ = v67;
      }
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v133, 16);
    }
    while (v61);
  }

  if (v116.__end_ == v116.__begin_)
    v76 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  else
    v76 = v116.__begin_;
  v77 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v76, v116.__end_ - v116.__begin_);
  memset(&v111, 0, sizeof(v111));
  -[FTTextToSpeechFeature neural_phoneme_sequence](v105, "neural_phoneme_sequence");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, objc_msgSend(v78, "count"));

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  -[FTTextToSpeechFeature neural_phoneme_sequence](v105, "neural_phoneme_sequence");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v77;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v108;
    do
    {
      for (n = 0; n != v80; ++n)
      {
        if (*(_QWORD *)v108 != v81)
          objc_enumerationMutation(v79);
        v83 = objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * n), "addObjectToBuffer:", a3);
        v84 = v83;
        v85 = v111.__end_;
        if (v111.__end_ >= v111.__end_cap_.__value_)
        {
          v87 = v111.__begin_;
          v88 = v111.__end_ - v111.__begin_;
          v89 = v88 + 1;
          if ((unint64_t)(v88 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v90 = (char *)v111.__end_cap_.__value_ - (char *)v111.__begin_;
          if (((char *)v111.__end_cap_.__value_ - (char *)v111.__begin_) >> 1 > v89)
            v89 = v90 >> 1;
          if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFFCLL)
            v91 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v91 = v89;
          if (v91)
          {
            v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v111.__end_cap_, v91);
            v87 = v111.__begin_;
            v85 = v111.__end_;
          }
          else
          {
            v92 = 0;
          }
          v93 = (int *)&v92[4 * v88];
          *v93 = v84;
          v86 = v93 + 1;
          while (v85 != v87)
          {
            v94 = *--v85;
            *--v93 = v94;
          }
          v111.__begin_ = v93;
          v111.__end_ = v86;
          v111.__end_cap_.__value_ = (int *)&v92[4 * v91];
          if (v87)
            operator delete(v87);
        }
        else
        {
          *v111.__end_ = v83;
          v86 = v85 + 1;
        }
        v111.__end_ = v86;
      }
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
    }
    while (v80);
  }

  if (v111.__end_ == v111.__begin_)
    v95 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  else
    v95 = v111.__begin_;
  v96 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v95, v111.__end_ - v111.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v97 = *((_DWORD *)a3 + 8);
  v98 = *((_DWORD *)a3 + 12);
  v99 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v104);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v103);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v102);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v106);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v96);
  v100.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v97 - (unsigned __int16)v98 + v99);
  if (v111.__begin_)
  {
    v111.__end_ = v111.__begin_;
    operator delete(v111.__begin_);
  }
  if (v116.__begin_)
  {
    v116.__end_ = v116.__begin_;
    operator delete(v116.__begin_);
  }
  if (v121.__begin_)
  {
    v121.__end_ = v121.__begin_;
    operator delete(v121.__begin_);
  }
  if (v126.__begin_)
  {
    v126.__end_ = v126.__begin_;
    operator delete(v126.__begin_);
  }
  if (v131.__begin_)
  {
    v131.__end_ = v131.__begin_;
    operator delete(v131.__begin_);
  }
  return v100;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTextToSpeechFeature addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __37__FTTextToSpeechFeature_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
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
