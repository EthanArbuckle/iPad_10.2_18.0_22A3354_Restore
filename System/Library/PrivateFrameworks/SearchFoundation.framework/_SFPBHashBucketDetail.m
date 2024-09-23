@implementation _SFPBHashBucketDetail

- (_SFPBHashBucketDetail)initWithFacade:(id)a3
{
  id v4;
  _SFPBHashBucketDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _SFPBHashBucketDetail_HashDetail *v15;
  _SFPBHashBucketDetail *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBHashBucketDetail init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "hash_prefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "hash_prefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBHashBucketDetail setHash_prefix:](v5, "setHash_prefix:", v7);

    }
    objc_msgSend(v4, "hash_details");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "hash_details", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = -[_SFPBHashBucketDetail_HashDetail initWithFacade:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    -[_SFPBHashBucketDetail setHash_details:](v5, "setHash_details:", v9);
    v16 = v5;

  }
  return v5;
}

- (void)setHash_prefix:(id)a3
{
  NSString *v4;
  NSString *hash_prefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  hash_prefix = self->_hash_prefix;
  self->_hash_prefix = v4;

}

- (void)setHash_details:(id)a3
{
  NSArray *v4;
  NSArray *hash_details;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  hash_details = self->_hash_details;
  self->_hash_details = v4;

}

- (void)clearHash_details
{
  -[NSArray removeAllObjects](self->_hash_details, "removeAllObjects");
}

- (void)addHash_details:(id)a3
{
  id v4;
  NSArray *hash_details;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  hash_details = self->_hash_details;
  v8 = v4;
  if (!hash_details)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hash_details;
    self->_hash_details = v6;

    v4 = v8;
    hash_details = self->_hash_details;
  }
  -[NSArray addObject:](hash_details, "addObject:", v4);

}

- (unint64_t)hash_detailsCount
{
  return -[NSArray count](self->_hash_details, "count");
}

- (id)hash_detailsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_hash_details, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHashBucketDetailReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBHashBucketDetail hash_prefix](self, "hash_prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBHashBucketDetail hash_details](self, "hash_details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_SFPBHashBucketDetail hash_prefix](self, "hash_prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash_prefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_SFPBHashBucketDetail hash_prefix](self, "hash_prefix");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBHashBucketDetail hash_prefix](self, "hash_prefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hash_prefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_SFPBHashBucketDetail hash_details](self, "hash_details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash_details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBHashBucketDetail hash_details](self, "hash_details");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_SFPBHashBucketDetail hash_details](self, "hash_details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hash_details");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_hash_prefix, "hash");
  return -[NSArray hash](self->_hash_details, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_hash_details, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_hash_details;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hashDetails"));
  }
  if (self->_hash_prefix)
  {
    -[_SFPBHashBucketDetail hash_prefix](self, "hash_prefix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hashPrefix"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBHashBucketDetail dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBHashBucketDetail)initWithJSON:(id)a3
{
  void *v4;
  _SFPBHashBucketDetail *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBHashBucketDetail initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBHashBucketDetail)initWithDictionary:(id)a3
{
  id v4;
  _SFPBHashBucketDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _SFPBHashBucketDetail_HashDetail *v15;
  _SFPBHashBucketDetail *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBHashBucketDetail;
  v5 = -[_SFPBHashBucketDetail init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hashPrefix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBHashBucketDetail setHash_prefix:](v5, "setHash_prefix:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hashDetails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[_SFPBHashBucketDetail_HashDetail initWithDictionary:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithDictionary:", v14);
              -[_SFPBHashBucketDetail addHash_details:](v5, "addHash_details:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;

  }
  return v5;
}

- (NSString)hash_prefix
{
  return self->_hash_prefix;
}

- (NSArray)hash_details
{
  return self->_hash_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hash_details, 0);
  objc_storeStrong((id *)&self->_hash_prefix, 0);
}

@end
