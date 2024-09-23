@implementation OPTTSTextToSpeechFeature

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[OPTTSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return -[OPTTSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (OPTTSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  OPTTSTextToSpeechFeature *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TextToSpeechFeature *root;
  uint64_t v17;
  unint64_t v18;
  siri::speech::schema_fb::TextToSpeechFeature *v19;
  OPTTSTextToSpeechFeature *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)OPTTSTextToSpeechFeature;
  v10 = -[OPTTSTextToSpeechFeature init](&v26, sel_init);
  if (!v10)
    goto LABEL_14;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_15;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TextToSpeechFeature *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TextToSpeechFeature *)v10->_root;
  if (v19 && !siri::speech::schema_fb::TextToSpeechFeature::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_15:
    v20 = 0;
  else
LABEL_14:
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__OPTTSTextToSpeechFeature_normalized_text__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechFeature normalized_text_enumerateObjectsUsingBlock:](self, "normalized_text_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("normalized_text"));

  }
  return (NSArray *)v3;
}

- (id)normalized_text_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSNormalizedText *v7;
  OPTTSTTSNormalizedText *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  const TextToSpeechFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSNormalizedText *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 5u || (v11 = *(unsigned __int16 *)v10[4].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTTSNormalizedText initWithFlatbuffData:root:verify:]([OPTTSTTSNormalizedText alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

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
  void (**v4)(id, OPTTSTTSNormalizedText *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechFeature *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSNormalizedText *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSNormalizedText *, uint64_t, unsigned __int8 *))a3;
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
            v16 = -[OPTTSTTSNormalizedText initWithFlatbuffData:root:verify:]([OPTTSTTSNormalizedText alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__OPTTSTextToSpeechFeature_phoneme_sequence__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechFeature phoneme_sequence_enumerateObjectsUsingBlock:](self, "phoneme_sequence_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phoneme_sequence"));

  }
  return (NSArray *)v3;
}

- (id)phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSPhonemeSequence *v7;
  OPTTSTTSPhonemeSequence *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  const TextToSpeechFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSPhonemeSequence *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 7u || (v11 = *(unsigned __int16 *)v10[6].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTTSPhonemeSequence initWithFlatbuffData:root:verify:]([OPTTSTTSPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

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
  void (**v4)(id, OPTTSTTSPhonemeSequence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechFeature *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSPhonemeSequence *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
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
            v16 = -[OPTTSTTSPhonemeSequence initWithFlatbuffData:root:verify:]([OPTTSTTSPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__OPTTSTextToSpeechFeature_prompts__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechFeature prompts_enumerateObjectsUsingBlock:](self, "prompts_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prompts"));

  }
  return (NSArray *)v3;
}

- (id)prompts_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSPrompts *v7;
  OPTTSTTSPrompts *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  const TextToSpeechFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSPrompts *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTTSPrompts initWithFlatbuffData:root:verify:]([OPTTSTTSPrompts alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

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
  void (**v4)(id, OPTTSTTSPrompts *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechFeature *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSPrompts *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSPrompts *, uint64_t, unsigned __int8 *))a3;
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
            v16 = -[OPTTSTTSPrompts initWithFlatbuffData:root:verify:]([OPTTSTTSPrompts alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__OPTTSTextToSpeechFeature_replacement__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechFeature replacement_enumerateObjectsUsingBlock:](self, "replacement_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("replacement"));

  }
  return (NSArray *)v3;
}

- (id)replacement_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSReplacement *v7;
  OPTTSTTSReplacement *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  const TextToSpeechFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSReplacement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTTSReplacement initWithFlatbuffData:root:verify:]([OPTTSTTSReplacement alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

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
  void (**v4)(id, OPTTSTTSReplacement *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechFeature *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSReplacement *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSReplacement *, uint64_t, unsigned __int8 *))a3;
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
            v16 = -[OPTTSTTSReplacement initWithFlatbuffData:root:verify:]([OPTTSTTSReplacement alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__OPTTSTextToSpeechFeature_neural_phoneme_sequence__block_invoke;
    v6[3] = &unk_1E3A15F00;
    v3 = v4;
    v7 = v3;
    -[OPTTSTextToSpeechFeature neural_phoneme_sequence_enumerateObjectsUsingBlock:](self, "neural_phoneme_sequence_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("neural_phoneme_sequence"));

  }
  return (NSArray *)v3;
}

- (id)neural_phoneme_sequence_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  OPTTSTTSNeuralPhonemeSequence *v7;
  OPTTSTTSNeuralPhonemeSequence *v8;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  const TextToSpeechFeature *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (OPTTSTTSNeuralPhonemeSequence *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    root = self->_root;
    v10 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v10->var0 < 0xDu || (v11 = *(unsigned __int16 *)v10[12].var0) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v12 = &root[v11 + *(unsigned int *)root[v11].var0];
    if (*(_DWORD *)v12->var0 <= a3)
      __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
    v7 = -[OPTTSTTSNeuralPhonemeSequence initWithFlatbuffData:root:verify:]([OPTTSTTSNeuralPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v12[4 * a3 + 4 + *(unsigned int *)v12[4 * a3 + 4].var0], 0);
  }
  v8 = v7;
LABEL_9:

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
  void (**v4)(id, OPTTSTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  uint64_t v12;
  const TextToSpeechFeature *v13;
  uint64_t v14;
  uint64_t v15;
  OPTTSTTSNeuralPhonemeSequence *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 v19;

  v4 = (void (**)(id, OPTTSTTSNeuralPhonemeSequence *, uint64_t, unsigned __int8 *))a3;
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
            v16 = -[OPTTSTTSNeuralPhonemeSequence initWithFlatbuffData:root:verify:]([OPTTSTTSNeuralPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v13[*(unsigned int *)v13->var0], 0);
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

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t i;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t j;
  int v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  int v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  int v54;
  int v55;
  void *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t k;
  int v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  int v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  int v80;
  void *v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  void *v86;
  uint64_t v87;
  char *v88;
  uint64_t m;
  int v90;
  int v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  int v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  int v104;
  void *v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  void *v110;
  uint64_t v111;
  char *v112;
  uint64_t n;
  int v114;
  int v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  int v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  apple::aiml::flatbuffers2::FlatBufferBuilder *v128;
  int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  Offset<siri::speech::schema_fb::TextToSpeechFeature> v139;
  uint64_t v141;
  unsigned int v142;
  unsigned int v143;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *__p;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  -[OPTTSTextToSpeechFeature normalized_text](self, "normalized_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v4);
    v6 = &__p[4 * v5];
  }
  else
  {
    __p = 0;
    v6 = 0;
  }

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  -[OPTTSTextToSpeechFeature normalized_text](self, "normalized_text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v170;
    v10 = __p;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v170 != v9)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        if (v10 >= v6)
        {
          v14 = (v10 - __p) >> 2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v6 - __p) >> 1 > v15)
            v15 = (v6 - __p) >> 1;
          if ((unint64_t)(v6 - __p) >= 0x7FFFFFFFFFFFFFFCLL)
            v16 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v16 = v15;
          if (v16)
            v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v16);
          else
            v17 = 0;
          v18 = (char *)(v16 + 4 * v14);
          *(_DWORD *)v18 = v13;
          v19 = v18 + 4;
          if (v10 == __p)
          {
            v20 = __p;
          }
          else
          {
            v20 = __p;
            do
            {
              v21 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v18 - 1) = v21;
              v18 -= 4;
            }
            while (v10 != __p);
          }
          v6 = (char *)(v16 + 4 * v17);
          if (v20)
            operator delete(v20);
          __p = v18;
          v10 = v19;
        }
        else
        {
          *(_DWORD *)v10 = v12;
          v10 += 4;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
    }
    while (v8);
  }
  else
  {
    v10 = __p;
  }

  v22 = v10 - __p;
  if (v10 == __p)
    v23 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  else
    v23 = __p;
  v24 = v22 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v22 >> 2, 4uLL);
  if (__p == v10)
  {
    LODWORD(v24) = 0;
  }
  else
  {
    v25 = v23 - 4;
    v26 = v24;
    do
    {
      v27 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v25[4 * v26]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v27);
      --v26;
    }
    while (v26);
  }
  v28 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v24);
  -[OPTTSTextToSpeechFeature phoneme_sequence](self, "phoneme_sequence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  HIDWORD(v141) = v28;
  if (v30)
  {
    if (v30 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v30);
    v32 = &v150[4 * v31];
  }
  else
  {
    v150 = 0;
    v32 = 0;
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  -[OPTTSTextToSpeechFeature phoneme_sequence](self, "phoneme_sequence");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a3;
  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v166;
    v37 = v150;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v166 != v36)
          objc_enumerationMutation(v33);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * j), "addObjectToBuffer:", v34);
        v40 = v39;
        if (v37 >= v32)
        {
          v41 = (v37 - v150) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v32 - v150) >> 1 > v42)
            v42 = (v32 - v150) >> 1;
          if ((unint64_t)(v32 - v150) >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v43);
          else
            v44 = 0;
          v45 = (char *)(v43 + 4 * v41);
          *(_DWORD *)v45 = v40;
          v46 = v45 + 4;
          if (v37 == v150)
          {
            v47 = v150;
          }
          else
          {
            v47 = v150;
            do
            {
              v48 = *((_DWORD *)v37 - 1);
              v37 -= 4;
              *((_DWORD *)v45 - 1) = v48;
              v45 -= 4;
            }
            while (v37 != v150);
          }
          v32 = (char *)(v43 + 4 * v44);
          if (v47)
            operator delete(v47);
          v150 = v45;
          v37 = v46;
          v34 = a3;
        }
        else
        {
          *(_DWORD *)v37 = v39;
          v37 += 4;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
    }
    while (v35);
  }
  else
  {
    v37 = v150;
  }

  v49 = v37 - v150;
  if (v37 == v150)
    v50 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  else
    v50 = v150;
  v51 = v49 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v49 >> 2, 4uLL);
  if (v150 == v37)
  {
    LODWORD(v51) = 0;
  }
  else
  {
    v52 = v50 - 4;
    v53 = v51;
    do
    {
      v54 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v52[4 * v53]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v54);
      --v53;
    }
    while (v53);
  }
  v55 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51);
  -[OPTTSTextToSpeechFeature prompts](self, "prompts");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");
  LODWORD(v141) = v55;
  if (v57)
  {
    if (v57 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v57);
    v60 = &v58[4 * v59];
  }
  else
  {
    v58 = 0;
    v60 = 0;
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  -[OPTTSTextToSpeechFeature prompts](self, "prompts");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v161, v175, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v162;
    v64 = v58;
    v147 = v61;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v162 != v63)
          objc_enumerationMutation(v61);
        v66 = objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * k), "addObjectToBuffer:", a3, v141);
        v67 = v66;
        if (v64 >= v60)
        {
          v68 = (v64 - v58) >> 2;
          v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v60 - v58) >> 1 > v69)
            v69 = (v60 - v58) >> 1;
          if ((unint64_t)(v60 - v58) >= 0x7FFFFFFFFFFFFFFCLL)
            v70 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v70 = v69;
          if (v70)
            v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v70);
          else
            v71 = 0;
          v72 = (char *)(v70 + 4 * v68);
          *(_DWORD *)v72 = v67;
          v73 = v72 + 4;
          while (v64 != v58)
          {
            v74 = *((_DWORD *)v64 - 1);
            v64 -= 4;
            *((_DWORD *)v72 - 1) = v74;
            v72 -= 4;
          }
          v60 = (char *)(v70 + 4 * v71);
          if (v58)
            operator delete(v58);
          v58 = v72;
          v64 = v73;
          v61 = v147;
        }
        else
        {
          *(_DWORD *)v64 = v66;
          v64 += 4;
        }
      }
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v161, v175, 16);
    }
    while (v62);
  }
  else
  {
    v64 = v58;
  }

  v75 = v64 - v58;
  if (v64 == v58)
    v76 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  else
    v76 = v58;
  v77 = v75 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
  if (v58 == v64)
  {
    LODWORD(v77) = 0;
  }
  else
  {
    v78 = v76 - 4;
    v79 = v77;
    do
    {
      v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v78[4 * v79]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v80);
      --v79;
    }
    while (v79);
  }
  v143 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v77);
  -[OPTTSTextToSpeechFeature replacement](self, "replacement");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "count");
  if (v82)
  {
    if (v82 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v82);
    v85 = &v83[4 * v84];
  }
  else
  {
    v83 = 0;
    v85 = 0;
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  -[OPTTSTextToSpeechFeature replacement](self, "replacement");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
  if (v87)
  {
    v145 = v86;
    v148 = *(_QWORD *)v158;
    v88 = v83;
    do
    {
      for (m = 0; m != v87; ++m)
      {
        if (*(_QWORD *)v158 != v148)
          objc_enumerationMutation(v86);
        v90 = objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * m), "addObjectToBuffer:", a3, v141);
        v91 = v90;
        if (v88 >= v85)
        {
          v92 = (v88 - v83) >> 2;
          v93 = v92 + 1;
          if ((unint64_t)(v92 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v85 - v83) >> 1 > v93)
            v93 = (v85 - v83) >> 1;
          if ((unint64_t)(v85 - v83) >= 0x7FFFFFFFFFFFFFFCLL)
            v94 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v94 = v93;
          if (v94)
            v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v94);
          else
            v95 = 0;
          v96 = (char *)(v94 + 4 * v92);
          *(_DWORD *)v96 = v91;
          v97 = v96 + 4;
          while (v88 != v83)
          {
            v98 = *((_DWORD *)v88 - 1);
            v88 -= 4;
            *((_DWORD *)v96 - 1) = v98;
            v96 -= 4;
          }
          v85 = (char *)(v94 + 4 * v95);
          if (v83)
            operator delete(v83);
          v83 = v96;
          v88 = v97;
          v86 = v145;
        }
        else
        {
          *(_DWORD *)v88 = v90;
          v88 += 4;
        }
      }
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
    }
    while (v87);
  }
  else
  {
    v88 = v83;
  }

  v99 = v88 - v83;
  if (v88 == v83)
    v100 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  else
    v100 = v83;
  v101 = v99 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v99 >> 2, 4uLL);
  if (v83 == v88)
  {
    LODWORD(v101) = 0;
  }
  else
  {
    v102 = v100 - 4;
    v103 = v101;
    do
    {
      v104 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v102[4 * v103]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v104);
      --v103;
    }
    while (v103);
  }
  v142 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v101);
  -[OPTTSTextToSpeechFeature neural_phoneme_sequence](self, "neural_phoneme_sequence");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "count");
  if (v106)
  {
    if (v106 >> 62)
      std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
    v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v106);
    v109 = &v107[4 * v108];
  }
  else
  {
    v107 = 0;
    v109 = 0;
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  -[OPTTSTextToSpeechFeature neural_phoneme_sequence](self, "neural_phoneme_sequence");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
  if (v111)
  {
    v146 = v110;
    v149 = *(_QWORD *)v154;
    v112 = v107;
    do
    {
      for (n = 0; n != v111; ++n)
      {
        if (*(_QWORD *)v154 != v149)
          objc_enumerationMutation(v110);
        v114 = objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * n), "addObjectToBuffer:", a3, v141);
        v115 = v114;
        if (v112 >= v109)
        {
          v116 = (v112 - v107) >> 2;
          v117 = v116 + 1;
          if ((unint64_t)(v116 + 1) >> 62)
            std::vector<std::shared_ptr<Observer>>::__throw_length_error[abi:ne180100]();
          if ((v109 - v107) >> 1 > v117)
            v117 = (v109 - v107) >> 1;
          if ((unint64_t)(v109 - v107) >= 0x7FFFFFFFFFFFFFFCLL)
            v118 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v118 = v117;
          if (v118)
            v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TextToSpeechRequest_::ContextInfoEntry>>>(v118);
          else
            v119 = 0;
          v120 = (char *)(v118 + 4 * v116);
          *(_DWORD *)v120 = v115;
          v121 = v120 + 4;
          while (v112 != v107)
          {
            v122 = *((_DWORD *)v112 - 1);
            v112 -= 4;
            *((_DWORD *)v120 - 1) = v122;
            v120 -= 4;
          }
          v109 = (char *)(v118 + 4 * v119);
          if (v107)
            operator delete(v107);
          v107 = v120;
          v112 = v121;
          v110 = v146;
        }
        else
        {
          *(_DWORD *)v112 = v114;
          v112 += 4;
        }
      }
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
    }
    while (v111);
  }
  else
  {
    v112 = v107;
  }

  v123 = v112 - v107;
  if (v112 == v107)
    v124 = (char *)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  else
    v124 = v107;
  v125 = v123 >> 2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v123 >> 2, 4uLL);
  if (v107 == v112)
  {
    LODWORD(v125) = 0;
    v128 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
  }
  else
  {
    v126 = v124 - 4;
    v127 = v125;
    v128 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)a3;
    do
    {
      v129 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, *(_DWORD *)&v126[4 * v127]);
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v129);
      --v127;
    }
    while (v127);
  }
  v130 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(v128, v125);
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)v128);
  *((_BYTE *)v128 + 70) = 1;
  v131 = *((_DWORD *)v128 + 8);
  v132 = *((_DWORD *)v128 + 12);
  v133 = *((_DWORD *)v128 + 10);
  if (HIDWORD(v141))
  {
    v134 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, HIDWORD(v141));
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 4, v134);
  }
  if ((_DWORD)v141)
  {
    v135 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v141);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 6, v135);
  }
  if (v143)
  {
    v136 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v143);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 8, v136);
  }
  if (v142)
  {
    v137 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v142);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 10, v137);
  }
  if (v130)
  {
    v138 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(v128, v130);
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 12, v138);
  }
  v139.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable(v128, v131 - v132 + v133);
  if (v107)
    operator delete(v107);
  if (v83)
    operator delete(v83);
  if (v58)
    operator delete(v58);
  if (v150)
    operator delete(v150);
  if (__p)
    operator delete(__p);
  return v139;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechFeature> v2;
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
  v2.var0 = -[OPTTSTextToSpeechFeature addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (apple::aiml::flatbuffers2::FlatBufferBuilder *)operator new();
  apple::aiml::flatbuffers2::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__OPTTSTextToSpeechFeature_flatbuffData__block_invoke;
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

apple::aiml::flatbuffers2::DetachedBuffer *__40__OPTTSTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __51__OPTTSTextToSpeechFeature_neural_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __39__OPTTSTextToSpeechFeature_replacement__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __35__OPTTSTextToSpeechFeature_prompts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __44__OPTTSTextToSpeechFeature_phoneme_sequence__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __43__OPTTSTextToSpeechFeature_normalized_text__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
