@implementation PK_ipp_response_t

- (PK_ipp_response_t)initWithRequest:(id)a3
{
  id *v4;
  PK_ipp_response_t *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = (id *)a3;
  v26.receiver = self;
  v26.super_class = (Class)PK_ipp_response_t;
  v5 = -[PK_ipp_t init](&v26, sel_init);
  if (v5)
  {
    v5->super._request_id = objc_msgSend(v4, "request_id");
    if (objc_msgSend(v4[3], "count")
      && (objc_msgSend(v4[3], "objectAtIndexedSubscript:", 0),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "name"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "compare:", CFSTR("attributes-charset")),
          v7,
          v6,
          !v8))
    {
      objc_msgSend(v4[3], "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "values");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "string");
      v14 = v13;
      -[PK_ipp_t _addString:valueTag:name:lang:value:](v5, "_addString:valueTag:name:lang:value:", 1, 71, CFSTR("attributes-charset"), 0, v13);

    }
    else
    {
      -[PK_ipp_t _addString:valueTag:name:lang:value:](v5, "_addString:valueTag:name:lang:value:", 1, 71, CFSTR("attributes-charset"), 0, CFSTR("utf-8"));
    }
    if (objc_msgSend(v4[3], "count")
      && (objc_msgSend(v4[3], "objectAtIndexedSubscript:", 0),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "name"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "compare:", CFSTR("attributes-natural-language")),
          v16,
          v15,
          !v17))
    {
      objc_msgSend(v4[3], "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "values");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "string");
      v24 = v23;
      -[PK_ipp_t _addString:valueTag:name:lang:value:](v5, "_addString:valueTag:name:lang:value:", 1, 72, CFSTR("attributes-natural-language"), 0, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[PK_ipp_t _addString:valueTag:name:lang:value:](v5, "_addString:valueTag:name:lang:value:", 1, 72, CFSTR("attributes-natural-language"), 0, v19);
    }

  }
  return v5;
}

- (id)_descriptionLeader
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ID#%d, status 0x%4.4x>"), self->super._request_id, -[PK_ipp_t op_or_status](self, "op_or_status"));
}

- (ipp_status_t)status
{
  return -[PK_ipp_t op_or_status](self, "op_or_status");
}

- (id)rewriteURLAttributes:(id)a3
{
  void *v4;
  void *v5;
  uint64_t j;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void (**v26)(id, void *);
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = (void (**)(id, void *))a3;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = -[PK_ipp_t mutableCopy](self, "mutableCopy");
  objc_msgSend(v21, "attrs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v4, "value_tag") == 69)
        {
          objc_msgSend(v4, "values");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v5, "count");

          if (v27)
          {
            for (j = 0; j != v27; ++j)
            {
              objc_msgSend(v4, "values");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectAtIndexedSubscript:", j);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (void *)objc_msgSend(v8, "string");
              v11 = v10;

              if (v11)
              {
                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12)
                {
                  v26[2](v26, v12);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = v13;
                  if (v13 && (objc_msgSend(v13, "isEqual:", v12) & 1) == 0)
                  {
                    objc_msgSend(v14, "absoluteString");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v4, "values");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectAtIndexedSubscript:", j);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = v9;
                    v19 = v15;
                    v11 = v19;
                    if (v17)
                    {
                      objc_msgSend(v17, "setString:", v9, v19);
                    }
                    else
                    {

                    }
                  }

                }
              }

            }
          }
        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v24);
  }

  return v21;
}

@end
