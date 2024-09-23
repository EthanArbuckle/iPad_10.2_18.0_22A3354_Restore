@implementation SFHashDetail

- (SFHashDetail)initWithProtobuf:(id)a3
{
  id v4;
  SFHashDetail *v5;
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
  SFHashDetail *v17;
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
  v23.super_class = (Class)SFHashDetail;
  v5 = -[SFHashDetail init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "full_hash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "full_hash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashDetail setFull_hash:](v5, "setFull_hash:", v7);

    }
    if (objc_msgSend(v4, "has_summary"))
      -[SFHashDetail setHas_summary:](v5, "setHas_summary:", objc_msgSend(v4, "has_summary"));
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
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    -[SFHashDetail setSba_entity_types:](v5, "setSba_entity_types:", v9);
    if (objc_msgSend(v4, "has_table_of_contents"))
      -[SFHashDetail setHas_table_of_contents:](v5, "setHas_table_of_contents:", objc_msgSend(v4, "has_table_of_contents"));
    objc_msgSend(v4, "matched_url_variant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "matched_url_variant");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashDetail setMatched_url_variant:](v5, "setMatched_url_variant:", v16);

    }
    v17 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHas_summary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_has_summary = a3;
}

- (BOOL)hasHas_summary
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHas_table_of_contents:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_has_table_of_contents = a3;
}

- (BOOL)hasHas_table_of_contents
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (SFHashDetail)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBHashBucketDetail_HashDetail *v6;
  SFHashDetail *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBHashBucketDetail_HashDetail initWithData:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithData:", v5);
  v7 = -[SFHashDetail initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBHashBucketDetail_HashDetail *v6;

  v4 = a3;
  v6 = -[_SFPBHashBucketDetail_HashDetail initWithFacade:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail_HashDetail data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBHashBucketDetail_HashDetail *v2;
  void *v3;

  v2 = -[_SFPBHashBucketDetail_HashDetail initWithFacade:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail_HashDetail dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBHashBucketDetail_HashDetail *v2;
  void *v3;

  v2 = -[_SFPBHashBucketDetail_HashDetail initWithFacade:]([_SFPBHashBucketDetail_HashDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail_HashDetail jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFHashDetail full_hash](self, "full_hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFull_hash:", v6);

  objc_msgSend(v4, "setHas_summary:", -[SFHashDetail has_summary](self, "has_summary"));
  -[SFHashDetail sba_entity_types](self, "sba_entity_types");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSba_entity_types:", v8);

  objc_msgSend(v4, "setHas_table_of_contents:", -[SFHashDetail has_table_of_contents](self, "has_table_of_contents"));
  -[SFHashDetail matched_url_variant](self, "matched_url_variant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setMatched_url_variant:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFHashDetail *v6;
  SFHashDetail *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = (SFHashDetail *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFHashDetail isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v7 = v6;
      -[SFHashDetail full_hash](self, "full_hash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashDetail full_hash](v7, "full_hash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFHashDetail full_hash](self, "full_hash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFHashDetail full_hash](self, "full_hash");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFHashDetail full_hash](v7, "full_hash");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v11 = 0;
          goto LABEL_17;
        }
      }
      v12 = -[SFHashDetail has_summary](self, "has_summary");
      if (v12 == -[SFHashDetail has_summary](v7, "has_summary"))
      {
        -[SFHashDetail sba_entity_types](self, "sba_entity_types");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFHashDetail sba_entity_types](v7, "sba_entity_types");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == 0) != (v14 != 0))
        {
          v31 = v13;
          v32 = v14;
          -[SFHashDetail sba_entity_types](self, "sba_entity_types");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v26 = v3;
            -[SFHashDetail sba_entity_types](self, "sba_entity_types");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFHashDetail sba_entity_types](v7, "sba_entity_types");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v16;
            if (!objc_msgSend(v16, "isEqual:"))
            {
              v11 = 0;
              v3 = v26;
LABEL_30:

LABEL_31:
              if (!v10)
                goto LABEL_18;
              goto LABEL_17;
            }
            v28 = v15;
            v3 = v26;
          }
          else
          {
            v28 = 0;
          }
          v18 = -[SFHashDetail has_table_of_contents](self, "has_table_of_contents");
          if (v18 == -[SFHashDetail has_table_of_contents](v7, "has_table_of_contents"))
          {
            -[SFHashDetail matched_url_variant](self, "matched_url_variant");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFHashDetail matched_url_variant](v7, "matched_url_variant");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v19 == 0) != (v20 != 0))
            {
              v25 = v20;
              v27 = v19;
              -[SFHashDetail matched_url_variant](self, "matched_url_variant");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v24 = (void *)v21;
                -[SFHashDetail matched_url_variant](self, "matched_url_variant");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFHashDetail matched_url_variant](v7, "matched_url_variant");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v22, "isEqual:", v23);

              }
              else
              {

                v11 = 1;
              }
LABEL_29:
              v13 = v31;
              v15 = v28;
              if (!v28)
                goto LABEL_31;
              goto LABEL_30;
            }

          }
          v11 = 0;
          goto LABEL_29;
        }

      }
      v11 = 0;
      if (!v10)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SFHashDetail full_hash](self, "full_hash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SFHashDetail has_summary](self, "has_summary");
  -[SFHashDetail sba_entity_types](self, "sba_entity_types");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;
  v8 = -[SFHashDetail has_table_of_contents](self, "has_table_of_contents");
  -[SFHashDetail matched_url_variant](self, "matched_url_variant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)full_hash
{
  return self->_full_hash;
}

- (void)setFull_hash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)has_summary
{
  return self->_has_summary;
}

- (NSArray)sba_entity_types
{
  return self->_sba_entity_types;
}

- (void)setSba_entity_types:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)has_table_of_contents
{
  return self->_has_table_of_contents;
}

- (NSString)matched_url_variant
{
  return self->_matched_url_variant;
}

- (void)setMatched_url_variant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matched_url_variant, 0);
  objc_storeStrong((id *)&self->_sba_entity_types, 0);
  objc_storeStrong((id *)&self->_full_hash, 0);
}

- (BOOL)has_ee
{
  void *v2;
  BOOL v3;

  -[SFHashDetail sba_entity_types](self, "sba_entity_types");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

@end
