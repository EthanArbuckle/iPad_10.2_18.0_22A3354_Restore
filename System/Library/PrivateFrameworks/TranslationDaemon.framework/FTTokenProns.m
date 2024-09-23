@implementation FTTokenProns

- (FTTokenProns)initWithFlatbuffData:(id)a3
{
  return -[FTTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4
{
  return -[FTTokenProns initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTTokenProns)initWithFlatbuffData:(id)a3 root:(const TokenProns *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTTokenProns *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const TokenProns *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::TokenProns *v19;
  FTTokenProns *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTTokenProns;
  v10 = -[FTTokenProns init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const TokenProns *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::TokenProns *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::TokenProns::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)orthography
{
  const TokenProns *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const TokenProns *v6;

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

- (NSArray)sanitized_sequences
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("sanitized_sequences"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __35__FTTokenProns_sanitized_sequences__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTokenProns sanitized_sequences_enumerateObjectsUsingBlock:](self, "sanitized_sequences_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("sanitized_sequences"));

  }
  return (NSArray *)v3;
}

uint64_t __35__FTTokenProns_sanitized_sequences__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)sanitized_sequences_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTTokenProns_SanitizedSequence *v7;
  FTTokenProns_SanitizedSequence *v8;
  const TokenProns *root;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("sanitized_sequences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTTokenProns_SanitizedSequence *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTTokenProns_SanitizedSequence initWithFlatbuffData:root:verify:]([FTTokenProns_SanitizedSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)sanitized_sequences_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TokenProns *root;
  const TokenProns *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("sanitized_sequences"));
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

- (void)sanitized_sequences_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTTokenProns_SanitizedSequence *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TokenProns *root;
  const TokenProns *v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTTokenProns_SanitizedSequence *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTTokenProns_SanitizedSequence *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("sanitized_sequences"));
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
            v17 = -[FTTokenProns_SanitizedSequence initWithFlatbuffData:root:verify:]([FTTokenProns_SanitizedSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)prons
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prons"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __21__FTTokenProns_prons__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTokenProns prons_enumerateObjectsUsingBlock:](self, "prons_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prons"));

  }
  return (NSArray *)v3;
}

uint64_t __21__FTTokenProns_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)prons_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTPronChoice *v7;
  FTPronChoice *v8;
  const TokenProns *root;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTPronChoice *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTPronChoice initWithFlatbuffData:root:verify:]([FTPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)prons_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TokenProns *root;
  const TokenProns *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prons"));
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

- (void)prons_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTPronChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TokenProns *root;
  const TokenProns *v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTPronChoice *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTPronChoice *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prons"));
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
            v17 = -[FTPronChoice initWithFlatbuffData:root:verify:]([FTPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)normalized_prons
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_prons"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__FTTokenProns_normalized_prons__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTTokenProns normalized_prons_enumerateObjectsUsingBlock:](self, "normalized_prons_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("normalized_prons"));

  }
  return (NSArray *)v3;
}

uint64_t __32__FTTokenProns_normalized_prons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)normalized_prons_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTPronChoice *v7;
  FTPronChoice *v8;
  const TokenProns *root;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_prons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTPronChoice *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTPronChoice initWithFlatbuffData:root:verify:]([FTPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)normalized_prons_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const TokenProns *root;
  const TokenProns *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_prons"));
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

- (void)normalized_prons_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTPronChoice *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const TokenProns *root;
  const TokenProns *v8;
  uint64_t v9;
  const TokenProns *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTPronChoice *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTPronChoice *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_prons"));
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
            v17 = -[FTPronChoice initWithFlatbuffData:root:verify:]([FTPronChoice alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (Offset<siri::speech::schema_fb::TokenProns>)addObjectToBuffer:(void *)a3
{
  __CFString *v5;
  __CFString *v6;
  const char *v7;
  size_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  int v15;
  std::vector<int>::pointer end;
  int *v17;
  std::vector<int>::pointer begin;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  char *v23;
  int *v24;
  int v25;
  std::vector<int>::pointer v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  int v32;
  int v33;
  std::vector<int>::pointer v34;
  int *v35;
  std::vector<int>::pointer v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  unint64_t v40;
  char *v41;
  int *v42;
  int v43;
  std::vector<int>::pointer v44;
  int v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  int v51;
  int v52;
  std::vector<int>::pointer v53;
  int *v54;
  std::vector<int>::pointer v55;
  int64_t v56;
  unint64_t v57;
  int64_t v58;
  unint64_t v59;
  char *v60;
  int *v61;
  int v62;
  std::vector<int>::pointer v63;
  int v64;
  int v65;
  int v66;
  int v67;
  Offset<siri::speech::schema_fb::TokenProns> v68;
  int v70;
  int String;
  FTTokenProns *v72;
  int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  std::vector<int> v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  std::vector<int> v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  std::vector<int> v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  -[FTTokenProns orthography](self, "orthography");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_251A15610;
  v7 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
  v8 = strlen(v7);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  memset(&v88, 0, sizeof(v88));
  -[FTTokenProns sanitized_sequences](self, "sanitized_sequences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v88, objc_msgSend(v9, "count"));

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[FTTokenProns sanitized_sequences](self, "sanitized_sequences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = self;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v85 != v12)
          objc_enumerationMutation(v10);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v15 = v14;
        end = v88.__end_;
        if (v88.__end_ >= v88.__end_cap_.__value_)
        {
          begin = v88.__begin_;
          v19 = v88.__end_ - v88.__begin_;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v21 = (char *)v88.__end_cap_.__value_ - (char *)v88.__begin_;
          if (((char *)v88.__end_cap_.__value_ - (char *)v88.__begin_) >> 1 > v20)
            v20 = v21 >> 1;
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v20;
          if (v22)
          {
            v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v88.__end_cap_, v22);
            begin = v88.__begin_;
            end = v88.__end_;
          }
          else
          {
            v23 = 0;
          }
          v24 = (int *)&v23[4 * v19];
          *v24 = v15;
          v17 = v24 + 1;
          while (end != begin)
          {
            v25 = *--end;
            *--v24 = v25;
          }
          v88.__begin_ = v24;
          v88.__end_ = v17;
          v88.__end_cap_.__value_ = (int *)&v23[4 * v22];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v88.__end_ = v14;
          v17 = end + 1;
        }
        v88.__end_ = v17;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v11);
  }

  if (v88.__end_ == v88.__begin_)
    v26 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::TokenProns_::SanitizedSequence>> const&)::t;
  else
    v26 = v88.__begin_;
  v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v26, v88.__end_ - v88.__begin_);
  memset(&v83, 0, sizeof(v83));
  -[FTTokenProns prons](v72, "prons");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v83, objc_msgSend(v27, "count"));

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[FTTokenProns prons](v72, "prons");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v80 != v30)
          objc_enumerationMutation(v28);
        v32 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v33 = v32;
        v34 = v83.__end_;
        if (v83.__end_ >= v83.__end_cap_.__value_)
        {
          v36 = v83.__begin_;
          v37 = v83.__end_ - v83.__begin_;
          v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v39 = (char *)v83.__end_cap_.__value_ - (char *)v83.__begin_;
          if (((char *)v83.__end_cap_.__value_ - (char *)v83.__begin_) >> 1 > v38)
            v38 = v39 >> 1;
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL)
            v40 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v40 = v38;
          if (v40)
          {
            v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v83.__end_cap_, v40);
            v36 = v83.__begin_;
            v34 = v83.__end_;
          }
          else
          {
            v41 = 0;
          }
          v42 = (int *)&v41[4 * v37];
          *v42 = v33;
          v35 = v42 + 1;
          while (v34 != v36)
          {
            v43 = *--v34;
            *--v42 = v43;
          }
          v83.__begin_ = v42;
          v83.__end_ = v35;
          v83.__end_cap_.__value_ = (int *)&v41[4 * v40];
          if (v36)
            operator delete(v36);
        }
        else
        {
          *v83.__end_ = v32;
          v35 = v34 + 1;
        }
        v83.__end_ = v35;
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    }
    while (v29);
  }

  if (v83.__end_ == v83.__begin_)
    v44 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  else
    v44 = v83.__begin_;
  v45 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v44, v83.__end_ - v83.__begin_);
  memset(&v78, 0, sizeof(v78));
  -[FTTokenProns normalized_prons](v72, "normalized_prons");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v78, objc_msgSend(v46, "count"));

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  -[FTTokenProns normalized_prons](v72, "normalized_prons");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v45;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v75 != v49)
          objc_enumerationMutation(v47);
        v51 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v52 = v51;
        v53 = v78.__end_;
        if (v78.__end_ >= v78.__end_cap_.__value_)
        {
          v55 = v78.__begin_;
          v56 = v78.__end_ - v78.__begin_;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v58 = (char *)v78.__end_cap_.__value_ - (char *)v78.__begin_;
          if (((char *)v78.__end_cap_.__value_ - (char *)v78.__begin_) >> 1 > v57)
            v57 = v58 >> 1;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL)
            v59 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v59 = v57;
          if (v59)
          {
            v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v78.__end_cap_, v59);
            v55 = v78.__begin_;
            v53 = v78.__end_;
          }
          else
          {
            v60 = 0;
          }
          v61 = (int *)&v60[4 * v56];
          *v61 = v52;
          v54 = v61 + 1;
          while (v53 != v55)
          {
            v62 = *--v53;
            *--v61 = v62;
          }
          v78.__begin_ = v61;
          v78.__end_ = v54;
          v78.__end_cap_.__value_ = (int *)&v60[4 * v59];
          if (v55)
            operator delete(v55);
        }
        else
        {
          *v78.__end_ = v51;
          v54 = v53 + 1;
        }
        v78.__end_ = v54;
      }
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    }
    while (v48);
  }

  if (v78.__end_ == v78.__begin_)
    v63 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::PronChoice>> const&)::t;
  else
    v63 = v78.__begin_;
  v64 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v63, v78.__end_ - v78.__begin_);
  *((_BYTE *)a3 + 70) = 1;
  v65 = *((_DWORD *)a3 + 8);
  v66 = *((_DWORD *)a3 + 12);
  v67 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v73);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v64);
  v68.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v65 - (unsigned __int16)v66 + v67);
  if (v78.__begin_)
  {
    v78.__end_ = v78.__begin_;
    operator delete(v78.__begin_);
  }
  if (v83.__begin_)
  {
    v83.__end_ = v83.__begin_;
    operator delete(v83.__begin_);
  }
  if (v88.__begin_)
  {
    v88.__end_ = v88.__begin_;
    operator delete(v88.__begin_);
  }
  return v68;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTTokenProns addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __28__FTTokenProns_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__28__FTTokenProns_flatbuffData__block_invoke(uint64_t a1)
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

uint64_t __50__FTTokenProns_SanitizedSequence_sanitized_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

apple::aiml::flatbuffers2::DetachedBuffer *__46__FTTokenProns_SanitizedSequence_flatbuffData__block_invoke(uint64_t a1)
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
