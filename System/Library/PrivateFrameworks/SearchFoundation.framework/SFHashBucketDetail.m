@implementation SFHashBucketDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHashBucketDetail)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBHashBucketDetail *v6;
  SFHashBucketDetail *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBHashBucketDetail initWithData:]([_SFPBHashBucketDetail alloc], "initWithData:", v5);
  v7 = -[SFHashBucketDetail initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBHashBucketDetail *v6;

  v4 = a3;
  v6 = -[_SFPBHashBucketDetail initWithFacade:]([_SFPBHashBucketDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBHashBucketDetail *v2;
  void *v3;

  v2 = -[_SFPBHashBucketDetail initWithFacade:]([_SFPBHashBucketDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBHashBucketDetail *v2;
  void *v3;

  v2 = -[_SFPBHashBucketDetail initWithFacade:]([_SFPBHashBucketDetail alloc], "initWithFacade:", self);
  -[_SFPBHashBucketDetail jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFHashBucketDetail hash_prefix](self, "hash_prefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setHash_prefix:", v6);

  -[SFHashBucketDetail hash_details](self, "hash_details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setHash_details:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFHashBucketDetail *v5;
  SFHashBucketDetail *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (SFHashBucketDetail *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFHashBucketDetail isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFHashBucketDetail hash_prefix](self, "hash_prefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashBucketDetail hash_prefix](v6, "hash_prefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[SFHashBucketDetail hash_prefix](self, "hash_prefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFHashBucketDetail hash_prefix](self, "hash_prefix");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFHashBucketDetail hash_prefix](v6, "hash_prefix");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[SFHashBucketDetail hash_details](self, "hash_details");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashBucketDetail hash_details](v6, "hash_details");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[SFHashBucketDetail hash_details](self, "hash_details");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[SFHashBucketDetail hash_details](self, "hash_details");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFHashBucketDetail hash_details](v6, "hash_details");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
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
  void *v5;
  unint64_t v6;

  -[SFHashBucketDetail hash_prefix](self, "hash_prefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFHashBucketDetail hash_details](self, "hash_details");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)hash_prefix
{
  return self->_hash_prefix;
}

- (void)setHash_prefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)hash_details
{
  return self->_hash_details;
}

- (void)setHash_details:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hash_details, 0);
  objc_storeStrong((id *)&self->_hash_prefix, 0);
}

- (SFHashBucketDetail)initWithProtobuf:(id)a3
{
  id v4;
  SFHashBucketDetail *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SFHashDetail *v15;
  SFHashBucketDetail *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFHashBucketDetail;
  v5 = -[SFHashBucketDetail init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "hash_prefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "hash_prefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFHashBucketDetail setHash_prefix:](v5, "setHash_prefix:", v7);

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
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
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
          v15 = -[SFHashDetail initWithProtobuf:]([SFHashDetail alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    -[SFHashBucketDetail setHash_details:](v5, "setHash_details:", v9);
    v16 = v5;

  }
  return v5;
}

@end
