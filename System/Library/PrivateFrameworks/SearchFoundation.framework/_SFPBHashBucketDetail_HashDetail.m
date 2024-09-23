@implementation _SFPBHashBucketDetail_HashDetail

- (_SFPBHashBucketDetail_HashDetail)initWithFacade:(id)a3
{
  id v4;
  _SFPBHashBucketDetail_HashDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _SFPBHashBucketDetail_HashDetail *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBHashBucketDetail_HashDetail init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "full_hash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "full_hash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBHashBucketDetail_HashDetail setFull_hash:](v5, "setFull_hash:", v7);

    }
    if (objc_msgSend(v4, "hasHas_summary"))
      -[_SFPBHashBucketDetail_HashDetail setHas_summary:](v5, "setHas_summary:", objc_msgSend(v4, "has_summary"));
    objc_msgSend(v4, "sba_entity_types");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v9 = 0;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "sba_entity_types", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          if (*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i))
            objc_msgSend(v9, "addObject:");
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    -[_SFPBHashBucketDetail_HashDetail setSba_entity_types:](v5, "setSba_entity_types:", v9);
    if (objc_msgSend(v4, "hasHas_table_of_contents"))
      -[_SFPBHashBucketDetail_HashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", objc_msgSend(v4, "has_table_of_contents"));
    objc_msgSend(v4, "matched_url_variant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "matched_url_variant");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBHashBucketDetail_HashDetail setMatched_url_variant:](v5, "setMatched_url_variant:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (void)setFull_hash:(id)a3
{
  NSString *v4;
  NSString *full_hash;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  full_hash = self->_full_hash;
  self->_full_hash = v4;

}

- (void)setHas_summary:(BOOL)a3
{
  self->_has_summary = a3;
}

- (void)setSba_entity_types:(id)a3
{
  NSArray *v4;
  NSArray *sba_entity_types;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  sba_entity_types = self->_sba_entity_types;
  self->_sba_entity_types = v4;

}

- (void)clearSba_entity_types
{
  -[NSArray removeAllObjects](self->_sba_entity_types, "removeAllObjects");
}

- (void)addSba_entity_types:(int)a3
{
  uint64_t v3;
  NSArray *sba_entity_types;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  sba_entity_types = self->_sba_entity_types;
  if (!sba_entity_types)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sba_entity_types;
    self->_sba_entity_types = v6;

    sba_entity_types = self->_sba_entity_types;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](sba_entity_types, "addObject:", v8);

}

- (unint64_t)sba_entity_typesCount
{
  return -[NSArray count](self->_sba_entity_types, "count");
}

- (int)sba_entity_typesAtIndex:(unint64_t)a3
{
  void *v3;
  int v4;

  -[NSArray objectAtIndexedSubscript:](self->_sba_entity_types, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (void)setHas_table_of_contents:(BOOL)a3
{
  self->_has_table_of_contents = a3;
}

- (void)setMatched_url_variant:(id)a3
{
  NSString *v4;
  NSString *matched_url_variant;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  matched_url_variant = self->_matched_url_variant;
  self->_matched_url_variant = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHashBucketDetail_HashDetailReadFrom(self, (uint64_t)a3);
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
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBHashBucketDetail_HashDetail full_hash](self, "full_hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  if (-[_SFPBHashBucketDetail_HashDetail has_summary](self, "has_summary"))
    PBDataWriterWriteBOOLField();
  -[_SFPBHashBucketDetail_HashDetail sba_entity_types](self, "sba_entity_types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "intValue");
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (-[_SFPBHashBucketDetail_HashDetail has_table_of_contents](self, "has_table_of_contents"))
    PBDataWriterWriteBOOLField();
  -[_SFPBHashBucketDetail_HashDetail matched_url_variant](self, "matched_url_variant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

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
  int has_summary;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int has_table_of_contents;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[_SFPBHashBucketDetail_HashDetail full_hash](self, "full_hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "full_hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[_SFPBHashBucketDetail_HashDetail full_hash](self, "full_hash");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBHashBucketDetail_HashDetail full_hash](self, "full_hash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "full_hash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_19;
  }
  else
  {

  }
  has_summary = self->_has_summary;
  if (has_summary != objc_msgSend(v4, "has_summary"))
    goto LABEL_19;
  -[_SFPBHashBucketDetail_HashDetail sba_entity_types](self, "sba_entity_types");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sba_entity_types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_18;
  -[_SFPBHashBucketDetail_HashDetail sba_entity_types](self, "sba_entity_types");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBHashBucketDetail_HashDetail sba_entity_types](self, "sba_entity_types");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sba_entity_types");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_19;
  }
  else
  {

  }
  has_table_of_contents = self->_has_table_of_contents;
  if (has_table_of_contents != objc_msgSend(v4, "has_table_of_contents"))
    goto LABEL_19;
  -[_SFPBHashBucketDetail_HashDetail matched_url_variant](self, "matched_url_variant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matched_url_variant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_18:

    goto LABEL_19;
  }
  -[_SFPBHashBucketDetail_HashDetail matched_url_variant](self, "matched_url_variant");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
  {

LABEL_22:
    v24 = 1;
    goto LABEL_20;
  }
  v20 = (void *)v19;
  -[_SFPBHashBucketDetail_HashDetail matched_url_variant](self, "matched_url_variant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matched_url_variant");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqual:", v22);

  if ((v23 & 1) != 0)
    goto LABEL_22;
LABEL_19:
  v24 = 0;
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_full_hash, "hash");
  v4 = 2654435761;
  if (self->_has_summary)
    v5 = 2654435761;
  else
    v5 = 0;
  v6 = -[NSArray hash](self->_sba_entity_types, "hash");
  if (!self->_has_table_of_contents)
    v4 = 0;
  return v5 ^ v3 ^ v6 ^ v4 ^ -[NSString hash](self->_matched_url_variant, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_full_hash)
  {
    -[_SFPBHashBucketDetail_HashDetail full_hash](self, "full_hash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fullHash"));

  }
  if (self->_has_summary)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBHashBucketDetail_HashDetail has_summary](self, "has_summary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("hasSummary"));

  }
  if (self->_has_table_of_contents)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBHashBucketDetail_HashDetail has_table_of_contents](self, "has_table_of_contents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hasTableOfContents"));

  }
  if (self->_matched_url_variant)
  {
    -[_SFPBHashBucketDetail_HashDetail matched_url_variant](self, "matched_url_variant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("matchedUrlVariant"));

  }
  if (-[NSArray count](self->_sba_entity_types, "count"))
  {
    -[_SFPBHashBucketDetail_HashDetail sba_entity_types](self, "sba_entity_types");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("sbaEntityTypes"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBHashBucketDetail_HashDetail dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBHashBucketDetail_HashDetail)initWithJSON:(id)a3
{
  void *v4;
  _SFPBHashBucketDetail_HashDetail *v5;
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
    self = -[_SFPBHashBucketDetail_HashDetail initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBHashBucketDetail_HashDetail)initWithDictionary:(id)a3
{
  id v4;
  _SFPBHashBucketDetail_HashDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBHashBucketDetail_HashDetail *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBHashBucketDetail_HashDetail;
  v5 = -[_SFPBHashBucketDetail_HashDetail init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBHashBucketDetail_HashDetail setFull_hash:](v5, "setFull_hash:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasSummary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBHashBucketDetail_HashDetail setHas_summary:](v5, "setHas_summary:", objc_msgSend(v8, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sbaEntityTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v6;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[_SFPBHashBucketDetail_HashDetail addSba_entity_types:](v5, "addSba_entity_types:", objc_msgSend(v15, "intValue"));
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v12);
      }

      v6 = v21;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasTableOfContents"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBHashBucketDetail_HashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", objc_msgSend(v16, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchedUrlVariant"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      -[_SFPBHashBucketDetail_HashDetail setMatched_url_variant:](v5, "setMatched_url_variant:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (NSString)full_hash
{
  return self->_full_hash;
}

- (BOOL)has_summary
{
  return self->_has_summary;
}

- (NSArray)sba_entity_types
{
  return self->_sba_entity_types;
}

- (BOOL)has_table_of_contents
{
  return self->_has_table_of_contents;
}

- (NSString)matched_url_variant
{
  return self->_matched_url_variant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matched_url_variant, 0);
  objc_storeStrong((id *)&self->_sba_entity_types, 0);
  objc_storeStrong((id *)&self->_full_hash, 0);
}

@end
