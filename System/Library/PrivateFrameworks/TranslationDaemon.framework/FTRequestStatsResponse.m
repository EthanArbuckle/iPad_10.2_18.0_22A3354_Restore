@implementation FTRequestStatsResponse

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3
{
  return -[FTRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4
{
  return -[FTRequestStatsResponse initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTRequestStatsResponse)initWithFlatbuffData:(id)a3 root:(const RequestStatsResponse *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTRequestStatsResponse *v10;
  id *p_data;
  unsigned int *v12;
  unint64_t v13;
  uint64_t v14;
  const RequestStatsResponse *root;
  uint64_t v17;
  uint64_t v18;
  siri::speech::schema_fb::RequestStatsResponse *v19;
  FTRequestStatsResponse *v20;
  _QWORD v22[2];
  __int128 v23;
  uint64_t v24;
  char v25;
  objc_super v26;

  v5 = a5;
  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTRequestStatsResponse;
  v10 = -[FTRequestStatsResponse init](&v26, sel_init);
  if (!v10)
    goto LABEL_13;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_14;
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const RequestStatsResponse *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::RequestStatsResponse *)v10->_root;
  if (!v19)
    goto LABEL_13;
  if (!siri::speech::schema_fb::RequestStatsResponse::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))
LABEL_14:
    v20 = 0;
  else
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSArray)BOOL_stats
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("BOOL_stats"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__FTRequestStatsResponse_BOOL_stats__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRequestStatsResponse BOOL_stats_enumerateObjectsUsingBlock:](self, "BOOL_stats_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("BOOL_stats"));

  }
  return (NSArray *)v3;
}

uint64_t __36__FTRequestStatsResponse_BOOL_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)BOOL_stats_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRequestStatsResponse_BoolStat *v7;
  FTRequestStatsResponse_BoolStat *v8;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("BOOL_stats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRequestStatsResponse_BoolStat *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRequestStatsResponse_BoolStat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_BoolStat alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)BOOL_stats_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("BOOL_stats"));
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

- (void)BOOL_stats_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRequestStatsResponse_BoolStat *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRequestStatsResponse_BoolStat *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRequestStatsResponse_BoolStat *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("BOOL_stats"));
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
            v17 = -[FTRequestStatsResponse_BoolStat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_BoolStat alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)int32_stats
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("int32_stats"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __37__FTRequestStatsResponse_int32_stats__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRequestStatsResponse int32_stats_enumerateObjectsUsingBlock:](self, "int32_stats_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("int32_stats"));

  }
  return (NSArray *)v3;
}

uint64_t __37__FTRequestStatsResponse_int32_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)int32_stats_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRequestStatsResponse_Int32Stat *v7;
  FTRequestStatsResponse_Int32Stat *v8;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("int32_stats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRequestStatsResponse_Int32Stat *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRequestStatsResponse_Int32Stat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_Int32Stat alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)int32_stats_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("int32_stats"));
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

- (void)int32_stats_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRequestStatsResponse_Int32Stat *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRequestStatsResponse_Int32Stat *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRequestStatsResponse_Int32Stat *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("int32_stats"));
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
            v17 = -[FTRequestStatsResponse_Int32Stat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_Int32Stat alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSArray)double_stats
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("double_stats"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__FTRequestStatsResponse_double_stats__block_invoke;
    v6[3] = &unk_251A14A10;
    v3 = v4;
    v7 = v3;
    -[FTRequestStatsResponse double_stats_enumerateObjectsUsingBlock:](self, "double_stats_enumerateObjectsUsingBlock:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("double_stats"));

  }
  return (NSArray *)v3;
}

uint64_t __38__FTRequestStatsResponse_double_stats__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)double_stats_objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  FTRequestStatsResponse_DoubleStat *v7;
  FTRequestStatsResponse_DoubleStat *v8;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("double_stats"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v7 = (FTRequestStatsResponse_DoubleStat *)objc_claimAutoreleasedReturnValue();
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
    v7 = -[FTRequestStatsResponse_DoubleStat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_DoubleStat alloc], "initWithFlatbuffData:root:verify:", self->_data, v12 + 4 + *(unsigned int *)(v12 + 4), 0);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (unint64_t)double_stats_count
{
  void *v3;
  void *v4;
  unint64_t v5;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v7;
  uint64_t v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("double_stats"));
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

- (void)double_stats_enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, FTRequestStatsResponse_DoubleStat *, uint64_t, unsigned __int8 *);
  void *v5;
  void *v6;
  const RequestStatsResponse *root;
  const RequestStatsResponse *v8;
  uint64_t v9;
  const RequestStatsResponse *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTRequestStatsResponse_DoubleStat *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;

  v4 = (void (**)(id, FTRequestStatsResponse_DoubleStat *, uint64_t, unsigned __int8 *))a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("double_stats"));
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
            v17 = -[FTRequestStatsResponse_DoubleStat initWithFlatbuffData:root:verify:]([FTRequestStatsResponse_DoubleStat alloc], "initWithFlatbuffData:root:verify:", self->_data, v13 + v14 + *(unsigned int *)(v13 + 4 * v15), 0);
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

- (NSString)language
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (NSString)speech_id
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (NSString)request_locale
{
  const RequestStatsResponse *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const RequestStatsResponse *v6;

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

- (Offset<siri::speech::schema_fb::RequestStatsResponse>)addObjectToBuffer:(void *)a3
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
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  int v29;
  int v30;
  std::vector<int>::pointer v31;
  int *v32;
  std::vector<int>::pointer v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  char *v38;
  int *v39;
  int v40;
  std::vector<int>::pointer v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
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
  __CFString *v61;
  __CFString *v62;
  const char *v63;
  size_t v64;
  int String;
  __CFString *v66;
  __CFString *v67;
  const char *v68;
  size_t v69;
  int v70;
  __CFString *v71;
  __CFString *v72;
  const char *v73;
  size_t v74;
  int v75;
  int v76;
  int v77;
  Offset<siri::speech::schema_fb::RequestStatsResponse> v78;
  int v80;
  int v81;
  FTRequestStatsResponse *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  std::vector<int> v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  std::vector<int> v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  std::vector<int> v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  memset(&v97, 0, sizeof(v97));
  -[FTRequestStatsResponse BOOL_stats](self, "BOOL_stats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v97, objc_msgSend(v5, "count"));

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[FTRequestStatsResponse BOOL_stats](self, "BOOL_stats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = self;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v94 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v11 = v10;
        end = v97.__end_;
        if (v97.__end_ >= v97.__end_cap_.__value_)
        {
          begin = v97.__begin_;
          v15 = v97.__end_ - v97.__begin_;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v17 = (char *)v97.__end_cap_.__value_ - (char *)v97.__begin_;
          if (((char *)v97.__end_cap_.__value_ - (char *)v97.__begin_) >> 1 > v16)
            v16 = v17 >> 1;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
            v18 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v97.__end_cap_, v18);
            begin = v97.__begin_;
            end = v97.__end_;
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
          v97.__begin_ = v20;
          v97.__end_ = v13;
          v97.__end_cap_.__value_ = (int *)&v19[4 * v18];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *v97.__end_ = v10;
          v13 = end + 1;
        }
        v97.__end_ = v13;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    }
    while (v7);
  }

  if (v97.__end_ == v97.__begin_)
    v22 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::BoolStat>> const&)::t;
  else
    v22 = v97.__begin_;
  v23 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v22, v97.__end_ - v97.__begin_);
  memset(&v92, 0, sizeof(v92));
  -[FTRequestStatsResponse int32_stats](v82, "int32_stats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v23;
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v92, objc_msgSend(v24, "count"));

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[FTRequestStatsResponse int32_stats](v82, "int32_stats");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v89 != v27)
          objc_enumerationMutation(v25);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v30 = v29;
        v31 = v92.__end_;
        if (v92.__end_ >= v92.__end_cap_.__value_)
        {
          v33 = v92.__begin_;
          v34 = v92.__end_ - v92.__begin_;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v36 = (char *)v92.__end_cap_.__value_ - (char *)v92.__begin_;
          if (((char *)v92.__end_cap_.__value_ - (char *)v92.__begin_) >> 1 > v35)
            v35 = v36 >> 1;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
            v37 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v92.__end_cap_, v37);
            v33 = v92.__begin_;
            v31 = v92.__end_;
          }
          else
          {
            v38 = 0;
          }
          v39 = (int *)&v38[4 * v34];
          *v39 = v30;
          v32 = v39 + 1;
          while (v31 != v33)
          {
            v40 = *--v31;
            *--v39 = v40;
          }
          v92.__begin_ = v39;
          v92.__end_ = v32;
          v92.__end_cap_.__value_ = (int *)&v38[4 * v37];
          if (v33)
            operator delete(v33);
        }
        else
        {
          *v92.__end_ = v29;
          v32 = v31 + 1;
        }
        v92.__end_ = v32;
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    }
    while (v26);
  }

  if (v92.__end_ == v92.__begin_)
    v41 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::Int32Stat>> const&)::t;
  else
    v41 = v92.__begin_;
  v80 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v41, v92.__end_ - v92.__begin_);
  memset(&v87, 0, sizeof(v87));
  -[FTRequestStatsResponse double_stats](v82, "double_stats");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v87, objc_msgSend(v42, "count"));

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  -[FTRequestStatsResponse double_stats](v82, "double_stats");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v84;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v84 != v45)
          objc_enumerationMutation(v43);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * k), "addObjectToBuffer:", a3);
        v48 = v47;
        v49 = v87.__end_;
        if (v87.__end_ >= v87.__end_cap_.__value_)
        {
          v51 = v87.__begin_;
          v52 = v87.__end_ - v87.__begin_;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62)
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          v54 = (char *)v87.__end_cap_.__value_ - (char *)v87.__begin_;
          if (((char *)v87.__end_cap_.__value_ - (char *)v87.__begin_) >> 1 > v53)
            v53 = v54 >> 1;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
            v55 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
          {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v87.__end_cap_, v55);
            v51 = v87.__begin_;
            v49 = v87.__end_;
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
          v87.__begin_ = v57;
          v87.__end_ = v50;
          v87.__end_cap_.__value_ = (int *)&v56[4 * v55];
          if (v51)
            operator delete(v51);
        }
        else
        {
          *v87.__end_ = v47;
          v50 = v49 + 1;
        }
        v87.__end_ = v50;
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    }
    while (v44);
  }

  if (v87.__end_ == v87.__begin_)
    v59 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RequestStatsResponse_::DoubleStat>> const&)::t;
  else
    v59 = v87.__begin_;
  v60 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v59, v87.__end_ - v87.__begin_);
  -[FTRequestStatsResponse language](v82, "language");
  v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (!v61)
    v61 = &stru_251A15610;
  v63 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v61), "UTF8String");
  v64 = strlen(v63);
  String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  -[FTRequestStatsResponse speech_id](v82, "speech_id");
  v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (!v66)
    v66 = &stru_251A15610;
  v68 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v66), "UTF8String");
  v69 = strlen(v68);
  v70 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v68, v69);

  -[FTRequestStatsResponse request_locale](v82, "request_locale");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (!v71)
    v71 = &stru_251A15610;
  v73 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v71), "UTF8String");
  v74 = strlen(v73);
  LODWORD(v73) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v73, v74);

  *((_BYTE *)a3 + 70) = 1;
  v75 = *((_DWORD *)a3 + 8);
  v76 = *((_DWORD *)a3 + 12);
  v77 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v81);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v80);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 8, v60);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 12, v70);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 14, (int)v73);
  v78.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v75 - (unsigned __int16)v76 + v77);
  if (v87.__begin_)
  {
    v87.__end_ = v87.__begin_;
    operator delete(v87.__begin_);
  }
  if (v92.__begin_)
  {
    v92.__end_ = v92.__begin_;
    operator delete(v92.__begin_);
  }
  if (v97.__begin_)
  {
    v97.__end_ = v97.__begin_;
    operator delete(v97.__begin_);
  }
  return v78;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTRequestStatsResponse addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __38__FTRequestStatsResponse_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__38__FTRequestStatsResponse_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__47__FTRequestStatsResponse_BoolStat_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__48__FTRequestStatsResponse_Int32Stat_flatbuffData__block_invoke(uint64_t a1)
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

apple::aiml::flatbuffers2::DetachedBuffer *__49__FTRequestStatsResponse_DoubleStat_flatbuffData__block_invoke(uint64_t a1)
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
