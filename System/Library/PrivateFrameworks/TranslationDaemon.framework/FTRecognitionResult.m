@implementation FTRecognitionResult

- (FTRecognitionResult)initWithFlatbuffData:(id)a3
{
  return -[FTRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4
{
  return -[FTRecognitionResult initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTRecognitionResult)initWithFlatbuffData:(id)a3 root:(const RecognitionResult *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTRecognitionResult *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const RecognitionResult *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::RecognitionResult *v19;
  FTRecognitionResult *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRecognitionResult;
  v10 = -[FTRecognitionResult init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RecognitionResult *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RecognitionResult *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::RecognitionResult::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (FTRecognitionSausage)pre_itn
{
  FTRecognitionSausage *v3;
  FTRecognitionSausage *v4;
  const RecognitionResult *root;
  const RecognitionResult *v6;
  uint64_t v7;
  const RecognitionResult *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn"));
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
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn"));
  }
  return v3;
}

- (FTRecognitionSausage)post_itn
{
  FTRecognitionSausage *v3;
  FTRecognitionSausage *v4;
  const RecognitionResult *root;
  const RecognitionResult *v6;
  uint64_t v7;
  const RecognitionResult *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn"));
  v3 = (FTRecognitionSausage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTRecognitionSausage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTRecognitionSausage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn"));
  }
  return v3;
}

- (NSArray)pre_itn_nbest_choices
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_nbest_choices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__FTRecognitionResult_pre_itn_nbest_choices__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecognitionResult pre_itn_nbest_choices_enumerateObjectsUsingBlock:](self, "pre_itn_nbest_choices_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn_nbest_choices"));

  }
  return (NSArray *)v3;
}

uint64_t __44__FTRecognitionResult_pre_itn_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)pre_itn_nbest_choices_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRecognitionChoice *v7;
  FTRecognitionChoice *v8;
  const RecognitionResult *root;
  const RecognitionResult *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_nbest_choices"));
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
    if (*(unsigned __int16 *)v10->var0 < 9u || (v11 = *(unsigned __int16 *)v10[8].var0) == 0)
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

- (unint64_t)pre_itn_nbest_choices_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecognitionResult *root;
  const RecognitionResult *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_nbest_choices"));
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

- (void)pre_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecognitionResult *root;
  const RecognitionResult *v8;
  uint64_t v9;
  const RecognitionResult *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_nbest_choices"));
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

- (NSArray)post_itn_nbest_choices
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_nbest_choices"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__FTRecognitionResult_post_itn_nbest_choices__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecognitionResult post_itn_nbest_choices_enumerateObjectsUsingBlock:](self, "post_itn_nbest_choices_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("post_itn_nbest_choices"));

  }
  return (NSArray *)v3;
}

uint64_t __45__FTRecognitionResult_post_itn_nbest_choices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)post_itn_nbest_choices_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRecognitionChoice *v7;
  FTRecognitionChoice *v8;
  const RecognitionResult *root;
  const RecognitionResult *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_nbest_choices"));
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
    if (*(unsigned __int16 *)v10->var0 < 0xBu || (v11 = *(unsigned __int16 *)v10[10].var0) == 0)
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

- (unint64_t)post_itn_nbest_choices_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecognitionResult *root;
  const RecognitionResult *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_nbest_choices"));
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

- (void)post_itn_nbest_choices_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRecognitionChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecognitionResult *root;
  const RecognitionResult *v8;
  uint64_t v9;
  const RecognitionResult *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("post_itn_nbest_choices"));
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

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignment"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__FTRecognitionResult_pre_itn_token_to_post_itn_char_alignment__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecognitionResult pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:](self, "pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("pre_itn_token_to_post_itn_char_alignment"));

  }
  return (NSArray *)v3;
}

uint64_t __63__FTRecognitionResult_pre_itn_token_to_post_itn_char_alignment__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)pre_itn_token_to_post_itn_char_alignment_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTItnAlignment *v7;
  FTItnAlignment *v8;
  const RecognitionResult *root;
  const RecognitionResult *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignment"));
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

- (unint64_t)pre_itn_token_to_post_itn_char_alignment_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecognitionResult *root;
  const RecognitionResult *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignment"));
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

- (void)pre_itn_token_to_post_itn_char_alignment_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTItnAlignment *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecognitionResult *root;
  const RecognitionResult *v8;
  uint64_t v9;
  const RecognitionResult *v10;
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("pre_itn_token_to_post_itn_char_alignment"));
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

- (NSArray)choice_alignments
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("choice_alignments"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __40__FTRecognitionResult_choice_alignments__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRecognitionResult choice_alignments_enumerateObjectsUsingBlock:](self, "choice_alignments_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("choice_alignments"));

  }
  return (NSArray *)v3;
}

uint64_t __40__FTRecognitionResult_choice_alignments__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)choice_alignments_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTChoiceAlignment *v7;
  FTChoiceAlignment *v8;
  const RecognitionResult *root;
  const RecognitionResult *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("choice_alignments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTChoiceAlignment *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTChoiceAlignment initWithFlatbuffData:root:verify:]([FTChoiceAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)choice_alignments_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RecognitionResult *root;
  const RecognitionResult *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("choice_alignments"));
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

- (void)choice_alignments_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTChoiceAlignment *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RecognitionResult *root;
  const RecognitionResult *v8;
  uint64_t v9;
  const RecognitionResult *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTChoiceAlignment *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTChoiceAlignment *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("choice_alignments"));
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
            v17 = -[FTChoiceAlignment initWithFlatbuffData:root:verify:]([FTChoiceAlignment alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::RecognitionResult>)addObjectToBuffer:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  std::vector<int>::pointer end;
  int *v15;
  std::vector<int>::pointer begin;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char *v21;
  int *v22;
  int v23;
  std::vector<int>::pointer v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  int v30;
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
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  int v48;
  int v49;
  std::vector<int>::pointer v50;
  int *v51;
  std::vector<int>::pointer v52;
  int64_t v53;
  unint64_t v54;
  int64_t v55;
  unint64_t v56;
  char *v57;
  int *v58;
  int v59;
  std::vector<int>::pointer v60;
  int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
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
  Offset<siri::speech::schema_fb::RecognitionResult> v84;
  int v86;
  int v87;
  int v88;
  int v89;
  FTRecognitionResult *v90;
  int v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  std::vector<int> v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  std::vector<int> v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  std::vector<int> v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  std::vector<int> v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  -[FTRecognitionResult pre_itn](self, "pre_itn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[FTRecognitionResult post_itn](self, "post_itn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  memset(&v111, 0, sizeof(v111));
  -[FTRecognitionResult pre_itn_nbest_choices](self, "pre_itn_nbest_choices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v111, objc_msgSend(v7, "count"));

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  -[FTRecognitionResult pre_itn_nbest_choices](self, "pre_itn_nbest_choices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = self;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v108 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        end = v111.__end_;
        if (v111.__end_ >= v111.__end_cap_.__value_)
        {
          begin = v111.__begin_;
          v17 = v111.__end_ - v111.__begin_;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v19 = (char *)v111.__end_cap_.__value_ - (char *)v111.__begin_;
          if (((char *)v111.__end_cap_.__value_ - (char *)v111.__begin_) >> 1 > v18)
            v18 = v19 >> 1;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
            v20 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v111.__end_cap_, v20);
            begin = v111.__begin_;
            end = v111.__end_;
          }
          else
          {
            v21 = 0;
          }
          v22 = (int *)&v21[4 * v17];
          *v22 = v13;
          v15 = v22 + 1;
          while (end != begin)
          {
            v23 = *--end;
            *--v22 = v23;
          }
          v111.__begin_ = v22;
          v111.__end_ = v15;
          v111.__end_cap_.__value_ = (int *)&v21[4 * v20];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v111.__end_ = v12;
          v15 = end + 1;
        }
        v111.__end_ = v15;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v9);
  }

  if (v111.__end_ == v111.__begin_)
    v24 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v24 = v111.__begin_;
  v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v24, v111.__end_ - v111.__begin_);
  memset(&v106, 0, sizeof(v106));
  -[FTRecognitionResult post_itn_nbest_choices](self, "post_itn_nbest_choices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v106, objc_msgSend(v25, "count"));

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  -[FTRecognitionResult post_itn_nbest_choices](self, "post_itn_nbest_choices");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v103 != v28)
          objc_enumerationMutation(v26);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v31 = v30;
        v32 = v106.__end_;
        if (v106.__end_ >= v106.__end_cap_.__value_)
        {
          v34 = v106.__begin_;
          v35 = v106.__end_ - v106.__begin_;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v37 = (char *)v106.__end_cap_.__value_ - (char *)v106.__begin_;
          if (((char *)v106.__end_cap_.__value_ - (char *)v106.__begin_) >> 1 > v36)
            v36 = v37 >> 1;
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
            v38 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v38 = v36;
          if (v38)
          {
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v106.__end_cap_, v38);
            v34 = v106.__begin_;
            v32 = v106.__end_;
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
          v106.__begin_ = v40;
          v106.__end_ = v33;
          v106.__end_cap_.__value_ = (int *)&v39[4 * v38];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *v106.__end_ = v30;
          v33 = v32 + 1;
        }
        v106.__end_ = v33;
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
    }
    while (v27);
  }

  if (v106.__end_ == v106.__begin_)
    v42 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionChoice>> const&)::t;
  else
    v42 = v106.__begin_;
  v86 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v42, v106.__end_ - v106.__begin_);
  memset(&v101, 0, sizeof(v101));
  -[FTRecognitionResult pre_itn_token_to_post_itn_char_alignment](v90, "pre_itn_token_to_post_itn_char_alignment");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v101, objc_msgSend(v43, "count"));

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[FTRecognitionResult pre_itn_token_to_post_itn_char_alignment](v90, "pre_itn_token_to_post_itn_char_alignment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v98 != v46)
          objc_enumerationMutation(v44);
        v48 = objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v49 = v48;
        v50 = v101.__end_;
        if (v101.__end_ >= v101.__end_cap_.__value_)
        {
          v52 = v101.__begin_;
          v53 = v101.__end_ - v101.__begin_;
          v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v55 = (char *)v101.__end_cap_.__value_ - (char *)v101.__begin_;
          if (((char *)v101.__end_cap_.__value_ - (char *)v101.__begin_) >> 1 > v54)
            v54 = v55 >> 1;
          if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFFCLL)
            v56 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v56 = v54;
          if (v56)
          {
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v101.__end_cap_, v56);
            v52 = v101.__begin_;
            v50 = v101.__end_;
          }
          else
          {
            v57 = 0;
          }
          v58 = (int *)&v57[4 * v53];
          *v58 = v49;
          v51 = v58 + 1;
          while (v50 != v52)
          {
            v59 = *--v50;
            *--v58 = v59;
          }
          v101.__begin_ = v58;
          v101.__end_ = v51;
          v101.__end_cap_.__value_ = (int *)&v57[4 * v56];
          if (v52)
            operator delete(v52);
        }
        else
        {
          *v101.__end_ = v48;
          v51 = v50 + 1;
        }
        v101.__end_ = v51;
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
    }
    while (v45);
  }

  if (v101.__end_ == v101.__begin_)
    v60 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ItnAlignment>> const&)::t;
  else
    v60 = v101.__begin_;
  v61 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v60, v101.__end_ - v101.__begin_);
  memset(&v96, 0, sizeof(v96));
  -[FTRecognitionResult choice_alignments](v90, "choice_alignments");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v96, objc_msgSend(v62, "count"));

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[FTRecognitionResult choice_alignments](v90, "choice_alignments");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v61;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v93 != v65)
          objc_enumerationMutation(v63);
        v67 = objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * m), "addObjectToBuffer:", a3);
        v68 = v67;
        v69 = v96.__end_;
        if (v96.__end_ >= v96.__end_cap_.__value_)
        {
          v71 = v96.__begin_;
          v72 = v96.__end_ - v96.__begin_;
          v73 = v72 + 1;
          if ((unint64_t)(v72 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v74 = (char *)v96.__end_cap_.__value_ - (char *)v96.__begin_;
          if (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 1 > v73)
            v73 = v74 >> 1;
          if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFFCLL)
            v75 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v75 = v73;
          if (v75)
          {
            v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v96.__end_cap_, v75);
            v71 = v96.__begin_;
            v69 = v96.__end_;
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
          v96.__begin_ = v77;
          v96.__end_ = v70;
          v96.__end_cap_.__value_ = (int *)&v76[4 * v75];
          if (v71)
            operator delete(v71);
        }
        else
        {
          *v96.__end_ = v67;
          v70 = v69 + 1;
        }
        v96.__end_ = v70;
      }
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    }
    while (v64);
  }

  if (v96.__end_ == v96.__begin_)
    v79 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::ChoiceAlignment>> const&)::t;
  else
    v79 = v96.__begin_;
  v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v79, v96.__end_ - v96.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v81 = *((_DWORD *)a3 + 8);
  v82 = *((_DWORD *)a3 + 12);
  v83 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v89);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v88);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v86);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v91);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, v80);
  v84.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v81 - (unsigned __int16)v82 + v83);
  if (v96.__begin_)
  {
    v96.__end_ = v96.__begin_;
    operator delete(v96.__begin_);
  }
  if (v101.__begin_)
  {
    v101.__end_ = v101.__begin_;
    operator delete(v101.__begin_);
  }
  if (v106.__begin_)
  {
    v106.__end_ = v106.__begin_;
    operator delete(v106.__begin_);
  }
  if (v111.__begin_)
  {
    v111.__end_ = v111.__begin_;
    operator delete(v111.__begin_);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTRecognitionResult addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __35__FTRecognitionResult_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__35__FTRecognitionResult_flatbuffData__block_invoke(uint64_t a1)
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
