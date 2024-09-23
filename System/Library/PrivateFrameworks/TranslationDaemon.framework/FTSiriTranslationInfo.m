@implementation FTSiriTranslationInfo

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3
{
  return -[FTSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4
{
  return -[FTSiriTranslationInfo initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTSiriTranslationInfo)initWithFlatbuffData:(id)a3 root:(const SiriTranslationInfo *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTSiriTranslationInfo *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const SiriTranslationInfo *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::SiriTranslationInfo *v19;
  FTSiriTranslationInfo *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTSiriTranslationInfo;
  v10 = -[FTSiriTranslationInfo init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const SiriTranslationInfo *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::SiriTranslationInfo *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::SiriTranslationInfo::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTRecognitionSausage)raw_sausage
{
  FTRecognitionSausage *v3;
  FTRecognitionSausage *v4;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v6;
  uint64_t v7;
  const SiriTranslationInfo *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_sausage"));
  v3 = (FTRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_sausage"));
  }
  return v3;
}

- (NSArray)raw_nbest_choices
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__FTSiriTranslationInfo_raw_nbest_choices__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSiriTranslationInfo raw_nbest_choices_enumerateObjectsUsingBlock:](self, "raw_nbest_choices_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("raw_nbest_choices"));

  }
  return (NSArray *)v3;
}

uint64_t __42__FTSiriTranslationInfo_raw_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)raw_nbest_choices_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRecognitionChoice *v7;
  FTRecognitionChoice *v8;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRecognitionChoice *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRecognitionChoice initWithFlatbuffData:root:verify:]([FTRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)raw_nbest_choices_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
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

- (void)raw_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRecognitionChoice *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("raw_nbest_choices"));
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
            v17 = -[FTRecognitionChoice initWithFlatbuffData:root:verify:]([FTRecognitionChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)post_itn_tokens
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__FTSiriTranslationInfo_post_itn_tokens__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSiriTranslationInfo post_itn_tokens_enumerateObjectsUsingBlock:](self, "post_itn_tokens_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn_tokens"));

  }
  return (NSArray *)v3;
}

uint64_t __40__FTSiriTranslationInfo_post_itn_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)post_itn_tokens_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
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
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
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

- (unint64_t)post_itn_tokens_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
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

- (void)post_itn_tokens_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_tokens"));
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

- (NSString)post_itn_recognition
{
  const SiriTranslationInfo *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const SiriTranslationInfo *v6;

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

- (NSArray)itn_alignments
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__FTSiriTranslationInfo_itn_alignments__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSiriTranslationInfo itn_alignments_enumerateObjectsUsingBlock:](self, "itn_alignments_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("itn_alignments"));

  }
  return (NSArray *)v3;
}

uint64_t __39__FTSiriTranslationInfo_itn_alignments__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)itn_alignments_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTItnAlignment *v7;
  FTItnAlignment *v8;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTItnAlignment *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTItnAlignment initWithFlatbuffData:root:verify:]([FTItnAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)itn_alignments_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
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

- (void)itn_alignments_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTItnAlignment *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTItnAlignment *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTItnAlignment *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("itn_alignments"));
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
            v17 = -[FTItnAlignment initWithFlatbuffData:root:verify:]([FTItnAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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
    v6[2] = __43__FTSiriTranslationInfo_translation_phrase__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTSiriTranslationInfo translation_phrase_enumerateObjectsUsingBlock:](self, "translation_phrase_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("translation_phrase"));

  }
  return (NSArray *)v3;
}

uint64_t __43__FTSiriTranslationInfo_translation_phrase__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)translation_phrase_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTSpan *v7;
  FTSpan *v8;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("translation_phrase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTSpan *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTSpan initWithFlatbuffData:root:verify:]([FTSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)translation_phrase_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v7;
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
  void (**v4)(id, FTSpan *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const SiriTranslationInfo *root;
  const SiriTranslationInfo *v8;
  uint64_t v9;
  const SiriTranslationInfo *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTSpan *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTSpan *, uint64_t, unsigned __int8 *))a3;
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
            v17 = -[FTSpan initWithFlatbuffData:root:verify:]([FTSpan alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::SiriTranslationInfo>)addObjectToBuffer:(void *)a3
{
  void *v4;
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
  const char *v28;
  size_t v29;
  int String;
  int v31;
  std::vector<int>::pointer v32;
  int *v33;
  std::vector<int>::pointer v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  char *v39;
  int *v40;
  int v41;
  std::vector<int>::pointer v42;
  __CFString *v43;
  __CFString *v44;
  const char *v45;
  size_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  int v52;
  int v53;
  std::vector<int>::pointer v54;
  int *v55;
  std::vector<int>::pointer v56;
  int64_t v57;
  unint64_t v58;
  int64_t v59;
  unint64_t v60;
  char *v61;
  int *v62;
  int v63;
  std::vector<int>::pointer v64;
  int v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  int v71;
  int v72;
  std::vector<int>::pointer v73;
  int *v74;
  std::vector<int>::pointer v75;
  int64_t v76;
  unint64_t v77;
  int64_t v78;
  unint64_t v79;
  char *v80;
  int *v81;
  int v82;
  std::vector<int>::pointer v83;
  int v84;
  int v85;
  int v86;
  int v87;
  Offset<siri::speech::schema_fb::SiriTranslationInfo> v88;
  int v90;
  int v91;
  int v92;
  int v93;
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
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  std::vector<int> v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  -[FTSiriTranslationInfo raw_sausage](self, "raw_sausage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v4, "addObjectToBuffer:", a3);

  memset(&v115, 0, sizeof(v115));
  -[FTSiriTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v115, objc_msgSend(v5, "count"));

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  -[FTSiriTranslationInfo raw_nbest_choices](self, "raw_nbest_choices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v112 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v11 = v10;
        end = v115.__end_;
        if (v115.__end_ >= v115.__end_cap_.__value_)
        {
          begin = v115.__begin_;
          v15 = v115.__end_ - v115.__begin_;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v115.__end_cap_.__value_ - (char *)v115.__begin_;
          if (((char *)v115.__end_cap_.__value_ - (char *)v115.__begin_) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v115.__end_cap_, v18);
            begin = v115.__begin_;
            end = v115.__end_;
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
          v115.__begin_ = v20;
          v115.__end_ = v13;
          v115.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v115.__end_ = v10;
          v13 = end + 1;
        }
        v115.__end_ = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
    }
    while (v7);
  }

  if (v115.__end_ == v115.__begin_)
    v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v22 = v115.__begin_;
  v92 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v115.__end_ - v115.__begin_);
  memset(&v110, 0, sizeof(v110));
  -[FTSiriTranslationInfo post_itn_tokens](self, "post_itn_tokens");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v110, objc_msgSend(v23, "count"));

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[FTSiriTranslationInfo post_itn_tokens](self, "post_itn_tokens");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v107 != v26)
          objc_enumerationMutation(v24);
        v28 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v106 + 1) + 8 * j)), "UTF8String");
        v29 = strlen(v28);
        String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v28, v29);
        v31 = String;
        v32 = v110.__end_;
        if (v110.__end_ >= v110.__end_cap_.__value_)
        {
          v34 = v110.__begin_;
          v35 = v110.__end_ - v110.__begin_;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v37 = (char *)v110.__end_cap_.__value_ - (char *)v110.__begin_;
          if (((char *)v110.__end_cap_.__value_ - (char *)v110.__begin_) >> 1 > v36)
            v36 = v37 >> 1;
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
            v38 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v38 = v36;
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v110.__end_cap_, v38);
            v34 = v110.__begin_;
            v32 = v110.__end_;
          }
          else
          {
            v39 = 0;
          }
          v40 = (int *)&v39[4 * v35];
          *v40 = v31;
          v33 = v40 + 1;
          while (v32 != v34)
          {
            v41 = *--v32;
            *--v40 = v41;
          }
          v110.__begin_ = v40;
          v110.__end_ = v33;
          v110.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *v110.__end_ = String;
          v33 = v32 + 1;
        }
        v110.__end_ = v33;
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
    }
    while (v25);
  }

  if (v110.__end_ == v110.__begin_)
    v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
  else
    v42 = v110.__begin_;
  v91 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v110.__end_ - v110.__begin_);
  -[FTSiriTranslationInfo post_itn_recognition](self, "post_itn_recognition");
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (!v43)
    v43 = &stru_251A15610;
  v45 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v43), "UTF8String");
  v46 = strlen(v45);
  v90 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v45, v46);

  memset(&v105, 0, sizeof(v105));
  -[FTSiriTranslationInfo itn_alignments](self, "itn_alignments");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v105, objc_msgSend(v47, "count"));

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[FTSiriTranslationInfo itn_alignments](self, "itn_alignments");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v102 != v50)
          objc_enumerationMutation(v48);
        v52 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v53 = v52;
        v54 = v105.__end_;
        if (v105.__end_ >= v105.__end_cap_.__value_)
        {
          v56 = v105.__begin_;
          v57 = v105.__end_ - v105.__begin_;
          v58 = v57 + 1;
          if ((unint64_t)(v57 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v59 = (char *)v105.__end_cap_.__value_ - (char *)v105.__begin_;
          if (((char *)v105.__end_cap_.__value_ - (char *)v105.__begin_) >> 1 > v58)
            v58 = v59 >> 1;
          if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFFCLL)
            v60 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v60 = v58;
          if (v60)
          {
            v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v105.__end_cap_, v60);
            v56 = v105.__begin_;
            v54 = v105.__end_;
          }
          else
          {
            v61 = 0;
          }
          v62 = (int *)&v61[4 * v57];
          *v62 = v53;
          v55 = v62 + 1;
          while (v54 != v56)
          {
            v63 = *--v54;
            *--v62 = v63;
          }
          v105.__begin_ = v62;
          v105.__end_ = v55;
          v105.__end_cap_.__value_ = (int *)&v61[4 * v60];
          if (v56)
            operator delete(v56);
        }
        else
        {
          *v105.__end_ = v52;
          v55 = v54 + 1;
        }
        v105.__end_ = v55;
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
    }
    while (v49);
  }

  if (v105.__end_ == v105.__begin_)
    v64 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  else
    v64 = v105.__begin_;
  v65 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v64, v105.__end_ - v105.__begin_);
  memset(&v100, 0, sizeof(v100));
  -[FTSiriTranslationInfo translation_phrase](self, "translation_phrase");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v100, objc_msgSend(v66, "count"));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[FTSiriTranslationInfo translation_phrase](self, "translation_phrase");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v65;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
  if (v68)
  {
    v69 = *(_QWORD *)v97;
    do
    {
      for (m = 0; m != v68; ++m)
      {
        if (*(_QWORD *)v97 != v69)
          objc_enumerationMutation(v67);
        v71 = objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * m), "addObjectToBuffer:", a3);
        v72 = v71;
        v73 = v100.__end_;
        if (v100.__end_ >= v100.__end_cap_.__value_)
        {
          v75 = v100.__begin_;
          v76 = v100.__end_ - v100.__begin_;
          v77 = v76 + 1;
          if ((unint64_t)(v76 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v78 = (char *)v100.__end_cap_.__value_ - (char *)v100.__begin_;
          if (((char *)v100.__end_cap_.__value_ - (char *)v100.__begin_) >> 1 > v77)
            v77 = v78 >> 1;
          if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
            v79 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v79 = v77;
          if (v79)
          {
            v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v100.__end_cap_, v79);
            v75 = v100.__begin_;
            v73 = v100.__end_;
          }
          else
          {
            v80 = 0;
          }
          v81 = (int *)&v80[4 * v76];
          *v81 = v72;
          v74 = v81 + 1;
          while (v73 != v75)
          {
            v82 = *--v73;
            *--v81 = v82;
          }
          v100.__begin_ = v81;
          v100.__end_ = v74;
          v100.__end_cap_.__value_ = (int *)&v80[4 * v79];
          if (v75)
            operator delete(v75);
        }
        else
        {
          *v100.__end_ = v71;
          v74 = v73 + 1;
        }
        v100.__end_ = v74;
      }
      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
    }
    while (v68);
  }

  if (v100.__end_ == v100.__begin_)
    v83 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::Span>> const&)::t;
  else
    v83 = v100.__begin_;
  v84 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v83, v100.__end_ - v100.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v85 = *((_DWORD *)a3 + 8);
  v86 = *((_DWORD *)a3 + 12);
  v87 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v93);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v92);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v90);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v95);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v84);
  v88.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v85 - (unsigned __int16)v86 + v87);
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
  if (v115.__begin_)
  {
    v115.__end_ = v115.__begin_;
    operator delete(v115.__begin_);
  }
  return v88;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTSiriTranslationInfo addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __37__FTSiriTranslationInfo_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__37__FTSiriTranslationInfo_flatbuffData__block_invoke(uint64_t a1)
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
